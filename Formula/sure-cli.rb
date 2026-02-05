
class SureCli < Formula
    desc "Agent-first CLI for the Sure personal finance app"
    homepage "https://github.com/we-promise/sure-cli"
    url "https://github.com/we-promise/sure-cli/archive/refs/tags/v0.1.1.tar.gz"
    sha256 "a5fceab00eef14d5301a083b0da44f305ade5be819b163c0fa02c0aa31c3834e"
    license "MIT"
  
    depends_on "go" => :build
  
    def install
      system "go", "build", *std_go_args(ldflags: "-s -w -X main.version=#{version}"), "."
    end
  
    def caveats
      <<~EOS
        To use sure-cli, ensure Homebrew's bin is in your PATH:
  
          eval "$(/opt/homebrew/bin/brew shellenv)"
  
        Add this line to ~/.zshrc or ~/.bash_profile for persistence.
  
        Then run:
          sure-cli --help
      EOS
    end
  
    test do
      assert_match version.to_s, shell_output("#{bin}/sure-cli version")
    end
  end
    