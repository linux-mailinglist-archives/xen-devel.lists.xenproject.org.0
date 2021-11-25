Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6697D45DB82
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231274.400186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5t-0001p1-Sw; Thu, 25 Nov 2021 13:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231274.400186; Thu, 25 Nov 2021 13:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5t-0001Xl-4J; Thu, 25 Nov 2021 13:47:21 +0000
Received: by outflank-mailman (input) for mailman id 231274;
 Thu, 25 Nov 2021 13:47:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0Y-00076i-8S
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:50 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f2dd764-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:48 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6f2dd764-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847708;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=frTC8Szw376OF5knYFRkaCp25Mwwo7Caw1me74SfbyE=;
  b=eHW/BhNWxml/jt6RH5m3k+U53+zYHkdiGd3UqAqgXdm5OnPK0U6rjl1l
   yU5kLaxy3GxKAcIET3b1G4NGl7H1IzQ8iuZ9dXUU2sm1sdThtS+M0qMe3
   NXtZG6QKOmovr3kJVtMg/Pplat9AzjYusOj/XmwjEutLDMLfdBnC4JqD4
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7JGEMlDVKRltdF826oRn/bEmA1kH05M5fUsF7xWh8HSmpatzjlLQ+HqjOn77cfawjp98eyRxY5
 MwhlcQRPxLbsdJ39tCLaIaevGoRPK4Vw+sYWlj7Ofkwz2QIDiSXaBSGWZjmzeriwCrsNAeTQhy
 KM+RMtxUWg9x08ag6qw73puIviwYRPaSHd63pFVwKxBQ3bI5GbiU6x6NMXVSa8cQdN/bfh40rg
 4D3h1/kDcpLJw2R2XMT0iGVyrnYh2rJvEb5UJhZCMu6yK/62aF0LPemFb7jMno8J7p6u9fl/Oc
 o/oTC1iOmB5SiaG1kDO/+Q0v
X-SBRS: 5.1
X-MesageID: 58617694
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:f+i1xqOA5aVzdffvrR3lkcFynXyQoLVcMsEvi/4bfWQNrUp01DYCy
 GVOXzzXaP3bajf0Ko0na4rj8hkFuMeDydQ2HQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eg+w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoy6EmPdsy
 s5wjqK5ZwAAF671suIWdBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgWdu358QTKq2i
 8wxZB1rfTqdMxdza2xMKJ8jmsb51jrVWmgNwL6SjfVuuDWCpOBr65DuN9zPc9DMWsRRnW6fv
 GvN+2m/CRYfXPSAzRKV/3TqgfXA9Qv3QJkXFaG43vdyjUeP23cIDxkLSVq8p+L/gUm7M/pTJ
 EAZ9TAnhbQj/0ysCN/mVlu3p2DslgUHR9NaHuk+6QeM4qnZ+QCUAi4DVDEpQN05tucmSDoyz
 FiLktj1Qzt1v9W9WX+bs7uZsz62ESwUNnMZIz8JSxMf5Nvuq511iQjAJv5hDaq0g9vdCTz2h
 TeQo0AWhb8ekMoK3KWT5k3cjnSnoZ2hc+IuzlyJBCT/tFo/PdP7IdzzgbTG0RpeBJ2USX6cv
 mM5oPaXwucnJJK0viqGZ+pYSdlF+M25GDHbhFduGbwo+DKs52OvcOhs3d1uGKt6Gp1aIGG0O
 Sc/rSsUvcYOZyXyMcebdqroU5xypZUMA+gJQRw9gjBmRpFqPDGK8yh1DaJ79zC8yRN8+U3T1
 HryTCpNMZr4Ifg4pNZVb71EuVPO+szZ7TmOLa0XNzz9jdKjiIe9EN/pymemYOEj97+jqw7I6
 dtZPMbi40wBC7KhPXiHod9JcwFiwZ0H6Xfe8ZI/SwJ+ClA+RDFJ5wH5ndvNhLCJb4wKz7yVr
 xlRq2dTyUblhG2vFOl5QisLVV8bZr4m9ShTFXV1ZT6AgiF/Ca7yvPZ3X8ZmJtEPqb08pcOYu
 tFYIq1s9NwUEW+Zk9ncBLGgxLFfmOOD2VjTYnH7OWdnJPaNhWXho7fZQ+cmzwFWZgLfiCf0i
 +TIOtrzTcVRSgJ8ItzRbf7znVq9sWJEwLB5XlfSI8kVc0LpqdA4Jyv0h/4xAscNNRScmWfKi
 1fIWU8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYlqmuMPAOkFtQnZB7FrJnkfA369f1/ucIxQV4BnTbKV+sD+o4cHWB2MBOsIxLx6NY5lTqC
 h7epIECNOzQas3/EVMXKA40Vci51KkZymvI8PA4AETm/ysrrrCJZlpfYkuXgytHIborbI58m
 bU9uNQb4hCUgwYxNorUlThd8mmBIyBSU6gjsZ1GUobnhhBylwNHaJ3YTCT3/IuOe5NHNUxze
 m2Yg6/LhrJ9wEveciVsSSiRjLQF3Zle6gpXyFIiJkiSnouXj/A66xRd7DArQ1kH1R5Aye9yZ
 jBmOkAdyX9iJNu0aByvh1yRJjw=
IronPort-HdrOrdr: A9a23:BgWvhK1sPetrtXEzdz0fKAqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58617694"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v8 33/47] build: adding out-of-tree support to the xen build
Date: Thu, 25 Nov 2021 13:39:52 +0000
Message-ID: <20211125134006.1076646-34-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This implement out-of-tree support, there's two ways to create an
out-of-tree build tree (after that, `make` in that new directory
works):
    make O=build
    mkdir build; cd build; make -f ../Makefile
also works with an absolute path for both.

This implementation only works if the source tree is clean, as we use
VPATH.

This patch copies most new code with handling out-of-tree build from
Linux v5.12.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v8:
    - replace script/mkmakefile by cmd_makefile like it's been done in Linux
      5.13.
    - fix GNU Make version, replace few 0.81 by 3.81.
    - reorder include header path in CFLAGS ( -I ), to have the $(objtree)
      paths listed before the $(srctree) paths. This will be usefull later
      if we allow to build out-of-tree from a dirty source tree.
    - make use of -iquote
    - sometime, add -iquote path even when not necessary when building in-tree.
    - extract code movement into a separate patch
    - make use of the new "$(srcdir)" shortcut
    - split command line in headers*.chk target into more lines

 xen/Makefile                 | 141 +++++++++++++++++++++++++++++++----
 xen/Rules.mk                 |  11 ++-
 xen/arch/x86/arch.mk         |   5 +-
 xen/arch/x86/boot/Makefile   |   6 ++
 xen/common/efi/efi_common.mk |   1 +
 xen/include/Makefile         |  11 ++-
 xen/test/livepatch/Makefile  |   2 +
 xen/xsm/flask/Makefile       |   3 +-
 xen/xsm/flask/ss/Makefile    |   1 +
 9 files changed, 161 insertions(+), 20 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index bfc96562c5ec..995815e82235 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -1,3 +1,7 @@
+# $(lastword,) for GNU Make older than 3.81
+lastword = $(word $(words $(1)),$(1))
+this-makefile := $(call lastword,$(MAKEFILE_LIST))
+
 # This is the correct place to edit the build version.
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
@@ -19,6 +23,13 @@ export PYTHON		?= $(PYTHON_INTERPRETER)
 
 export CHECKPOLICY	?= checkpolicy
 
+$(if $(filter __%, $(MAKECMDGOALS)), \
+    $(error targets prefixed with '__' are only for internal use))
+
+# That's our default target when none is given on the command line
+PHONY := __all
+__all:
+
 # Do not use make's built-in rules and variables
 MAKEFLAGS += -rR
 
@@ -31,9 +42,6 @@ export CC CXX LD
 
 export TARGET := xen
 
-.PHONY: default
-default: build
-
 .PHONY: dist
 dist: install
 
@@ -112,16 +120,88 @@ endif
 
 export quiet Q KBUILD_VERBOSE
 
+# $(realpath,) for GNU Make older than 3.81
+realpath = $(wildcard $(foreach file,$(1),$(shell cd -P $(dir $(file)) && echo "$$PWD/$(notdir $(file))")))
+
+ifeq ("$(origin O)", "command line")
+    KBUILD_OUTPUT := $(O)
+endif
+
+ifneq ($(KBUILD_OUTPUT),)
+# Make's built-in functions such as $(abspath ...), $(realpath ...) cannot
+# expand a shell special character '~'. We use a somewhat tedious way here.
+abs_objtree := $(shell mkdir -p $(KBUILD_OUTPUT) && cd $(KBUILD_OUTPUT) && pwd)
+$(if $(abs_objtree),, \
+     $(error failed to create output directory "$(KBUILD_OUTPUT)"))
+
+# $(realpath ...) resolves symlinks
+abs_objtree := $(call realpath,$(abs_objtree))
+else
 abs_objtree := $(CURDIR)
-abs_srctree := $(CURDIR)
+endif
+
+ifeq ($(abs_objtree),$(CURDIR))
+# Suppress "Entering directory ..." unless we are changing the work directory.
+MAKEFLAGS += --no-print-directory
+else
+need-sub-make := 1
+endif
+
+abs_srctree := $(call realpath,$(dir $(this-makefile)))
+
+ifneq ($(words $(subst :, ,$(abs_srctree))), 1)
+$(error source directory cannot contain spaces or colons)
+endif
+
+ifneq ($(abs_srctree),$(abs_objtree))
+# Look for make include files relative to root of kernel src
+#
+# This does not become effective immediately because MAKEFLAGS is re-parsed
+# once after the Makefile is read. We need to invoke sub-make.
+MAKEFLAGS += --include-dir=$(abs_srctree)
+need-sub-make := 1
+endif
 
 export abs_srctree abs_objtree
+export root-make-done := y
+
+ifeq ($(need-sub-make),1)
+
+PHONY += $(MAKECMDGOALS) __sub-make
+
+$(filter-out $(this-makefile), $(MAKECMDGOALS)) __all: __sub-make
+	@:
+
+# Invoke a second make in the output directory, passing relevant variables
+__sub-make:
+	$(Q)$(MAKE) -C $(abs_objtree) -f $(abs_srctree)/Makefile $(MAKECMDGOALS)
+
+endif # need-sub-make
+endif # root-make-done
+
+# We process the rest of the Makefile if this is the final invocation of make
+ifeq ($(need-sub-make),)
+
+ifeq ($(abs_srctree),$(abs_objtree))
+    # building in the source tree
+    srctree := .
+    building_out_of_srctree :=
+else
+    ifeq ($(abs_srctree)/,$(dir $(abs_objtree)))
+        # building in a subdirectory of the source tree
+        srctree := ..
+    else
+        srctree := $(abs_srctree)
+    endif
+    building_out_of_srctree := 1
+endif
 
-srctree := .
 objtree := .
-export srctree objtree
+VPATH := $(srctree)
+
+export building_out_of_srctree srctree objtree VPATH
 
-export XEN_ROOT := $(CURDIR)/..
+export XEN_ROOT := $(abs_srctree)/..
 
 # To make sure we do not include .config for any of the *config targets
 # catch them early, and hand them over to tools/kconfig/Makefile
@@ -204,9 +284,6 @@ endif
 
 export XEN_HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
 
-export root-make-done := y
-endif # root-make-done
-
 # ===========================================================================
 # Rules shared between *config targets and build targets
 
@@ -214,6 +291,37 @@ PHONY += tools_fixdep
 tools_fixdep:
 	$(Q)$(MAKE) $(build)=tools tools/fixdep
 
+PHONY += outputmakefile
+# Before starting out-of-tree build, make sure the source tree is clean.
+# outputmakefile generates a Makefile in the output directory, if using a
+# separate output directory. This allows convenient use of make in the
+# output directory.
+# At the same time when output Makefile generated, generate .gitignore to
+# ignore whole output directory
+
+quiet_cmd_makefile = GEN     Makefile
+cmd_makefile = { \
+    echo "\# Automatically generated by $(srctree)/Makefile: don't edit"; \
+    echo "include $(srctree)/Makefile"; \
+    } > Makefile
+
+outputmakefile:
+ifdef building_out_of_srctree
+	$(Q)if [ -f $(srctree)/.config -o \
+		 -d $(srctree)/include/config -o \
+		 -d $(srctree)/include/generated ]; then \
+		echo >&2 "***"; \
+		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin XEN_TARGET_ARCH)), XEN_TARGET_ARCH=$(XEN_TARGET_ARCH)) distclean'"; \
+		echo >&2 "*** in $(abs_srctree)";\
+		echo >&2 "***"; \
+		false; \
+	fi
+	$(Q)ln -fsn $(srctree) source
+	$(call cmd,makefile)
+	$(Q)test -e .gitignore || \
+	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
+endif
+
 ifeq ($(config-build),y)
 # ===========================================================================
 # *config targets only - make sure prerequisites are updated, and descend
@@ -229,13 +337,13 @@ filechk_kconfig_allconfig = \
 .allconfig.tmp: FORCE
 	set -e; { $(call filechk_kconfig_allconfig); } > $@
 
-config: tools_fixdep FORCE
+config: tools_fixdep outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=tools/kconfig $@
 
 # Config.mk tries to include .config file, don't try to remake it
 %/.config: ;
 
-%config: .allconfig.tmp tools_fixdep FORCE
+%config: .allconfig.tmp tools_fixdep outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=tools/kconfig KCONFIG_ALLCONFIG=$< $@
 
 else # !config-build
@@ -315,6 +423,10 @@ CFLAGS += -flto
 LDFLAGS-$(CONFIG_CC_IS_CLANG) += -plugin LLVMgold.so
 endif
 
+ifdef building_out_of_srctree
+    CFLAGS += -I$(objtree)/include
+    CFLAGS += -I$(objtree)/arch/$(TARGET_ARCH)/include
+endif
 CFLAGS += -I$(srctree)/include
 CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
 
@@ -341,6 +453,8 @@ export CFLAGS_UBSAN
 
 endif # need-config
 
+__all: build
+
 main-targets := build install uninstall clean distclean MAP
 .PHONY: $(main-targets)
 ifneq ($(XEN_TARGET_ARCH),x86_32)
@@ -443,7 +557,7 @@ $(TARGET).gz: $(TARGET)
 	gzip -n -f -9 < $< > $@.new
 	mv $@.new $@
 
-$(TARGET): FORCE
+$(TARGET): outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=tools
 	$(Q)$(MAKE) $(build)=. include/xen/compile.h
 	$(Q)$(MAKE) $(build)=include all
@@ -513,6 +627,7 @@ cloc:
 	done | cloc --list-file=-
 
 endif #config-build
+endif # need-sub-make
 
 PHONY += FORCE
 FORCE:
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 20dedce06cd8..73d5b82ab2e7 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -37,7 +37,7 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
                          $(foreach r,rel rel.ro,data.$(r).local)
 
 # The filename build.mk has precedence over Makefile
-include $(firstword $(wildcard $(src)/build.mk) $(src)/Makefile)
+include $(firstword $(wildcard $(srcdir)/build.mk) $(srcdir)/Makefile)
 
 # Linking
 # ---------------------------------------------------------------------------
@@ -328,6 +328,15 @@ existing-targets := $(wildcard $(sort $(targets)))
 
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
+# Create directories for object files if they do not exist
+obj-dirs := $(sort $(patsubst %/,%, $(dir $(targets))))
+# If targets exist, their directories apparently exist. Skip mkdir.
+existing-dirs := $(sort $(patsubst %/,%, $(dir $(existing-targets))))
+obj-dirs := $(strip $(filter-out $(existing-dirs), $(obj-dirs)))
+ifneq ($(obj-dirs),)
+$(shell mkdir -p $(obj-dirs))
+endif
+
 # Declare the contents of the PHONY variable as phony.  We keep that
 # information in a variable so we can use it in if_changed and friends.
 .PHONY: $(PHONY)
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 7cfc9fd3bb1c..554ac341522c 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -62,6 +62,9 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 
 efi-check-o := arch/x86/efi/check.o
 
+# Create the directory for out-of-tree build
+$(shell mkdir -p $(dir $(efi-check-o)))
+
 # Check if the compiler supports the MS ABI.
 XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(srctree)/$(efi-check-o:.o=.c) -o $(efi-check-o),y)
 
@@ -101,6 +104,6 @@ export EFI_LDFLAGS
 endif
 
 # Set up the assembler include path properly for older toolchains.
-CFLAGS += -Wa,-I$(srctree)/include
+CFLAGS += -Wa,-I$(objtree)/include -Wa,-I$(srctree)/include
 
 ALL_OBJS-y := arch/x86/boot/built_in.o arch/x86/efi/built_in.o $(ALL_OBJS-y)
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 5395aae5d57e..04ee9da83333 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -7,6 +7,9 @@ targets += $(head-objs:.S=.o)
 
 head-objs := $(addprefix $(obj)/, $(head-objs))
 
+ifdef building_out_of_srctree
+$(obj)/head.o: CFLAGS-y += -iquote $(obj)
+endif
 $(obj)/head.o: $(head-objs)
 
 $(head-objs:.S=.lnk): LDFLAGS_DIRECT := $(subst x86_64,i386,$(LDFLAGS_DIRECT))
@@ -14,6 +17,9 @@ $(head-objs:.S=.lnk): LDFLAGS_DIRECT := $(subst x86_64,i386,$(LDFLAGS_DIRECT))
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_COMMON_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
+ifdef building_out_of_srctree
+CFLAGS_x86_32 += -I$(objtree)/include
+endif
 CFLAGS_x86_32 += -I$(srctree)/include
 
 # override for 32bit binaries
diff --git a/xen/common/efi/efi_common.mk b/xen/common/efi/efi_common.mk
index d2845fd6b3c8..d059bb30afa5 100644
--- a/xen/common/efi/efi_common.mk
+++ b/xen/common/efi/efi_common.mk
@@ -3,6 +3,7 @@ EFIOBJ-$(CONFIG_COMPAT) += compat.o
 
 CFLAGS-y += -fshort-wchar
 CFLAGS-y += -iquote $(srctree)/common/efi
+CFLAGS-y += -iquote $(srcdir)
 
 $(obj)/%.c: $(abs_srctree)/common/efi/%.c FORCE
 	$(Q)ln -nfs $< $@
diff --git a/xen/include/Makefile b/xen/include/Makefile
index f64bc293c7f4..a3977a8bfccd 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -113,7 +113,8 @@ $(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(srcdir)/Makefile
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
 	    | $(CC) -x c -std=c99 -Wall -Werror                               \
-	      -include stdint.h $(foreach j, $($(i)-prereq), -include $(j).h) \
+	      -include stdint.h                                               \
+	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include $(j).h) \
 	      -S -o /dev/null -                                               \
 	    || exit $$?; echo $(i) >> $@.new;)
 	mv $@.new $@
@@ -127,8 +128,9 @@ $(obj)/headers++.chk: $(PUBLIC_HEADERS) $(srcdir)/Makefile
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
 	    | $(CXX) -x c++ -std=gnu++98 -Wall -Werror -D__XEN_TOOLS__        \
-	      -include stdint.h -include $(src)/public/xen.h                  \
-	      $(foreach j, $($(i)-prereq), -include c$(j)) -S -o /dev/null -  \
+	      -include stdint.h -include $(srcdir)/public/xen.h               \
+	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$(j)) \
+	      -S -o /dev/null -                                               \
 	    || exit $$?; echo $(i) >> $@.new;)
 	mv $@.new $@
 
@@ -137,7 +139,8 @@ endif
 ifeq ($(XEN_TARGET_ARCH),x86_64)
 .PHONY: lib-x86-all
 lib-x86-all:
-	$(MAKE) -C $(obj)/xen/lib/x86 all
+	@mkdir -p $(obj)/xen/lib/x86
+	$(MAKE) -C $(obj)/xen/lib/x86 -f $(abs_srctree)/$(src)/xen/lib/x86/Makefile all
 
 all: lib-x86-all
 endif
diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index ddb07371315e..c258ab0b5940 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -11,6 +11,8 @@ endif
 CODE_ADDR=$(shell nm --defined $(1) | grep $(2) | awk '{print "0x"$$1}')
 CODE_SZ=$(shell nm --defined -S $(1) | grep $(2) | awk '{ print "0x"$$2}')
 
+CFLAGS-y += -iquote $(obj)
+
 extra-y += xen_hello_world.livepatch
 xen_hello_world-objs := xen_hello_world_func.o xen_hello_world.o note.o xen_note.o modinfo.o
 $(obj)/xen_hello_world.o: $(obj)/config.h
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index a99038cb5722..d25312f4fa1c 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -4,7 +4,8 @@ obj-y += flask_op.o
 
 obj-y += ss/
 
-CFLAGS-y += -I$(obj)/include
+CFLAGS-y += -iquote $(obj)/include
+CFLAGS-y += -I$(srcdir)/include
 
 AWK = awk
 
diff --git a/xen/xsm/flask/ss/Makefile b/xen/xsm/flask/ss/Makefile
index aba1339f3808..ffe92ec19ed6 100644
--- a/xen/xsm/flask/ss/Makefile
+++ b/xen/xsm/flask/ss/Makefile
@@ -8,4 +8,5 @@ obj-y += services.o
 obj-y += conditional.o
 obj-y += mls.o
 
+CFLAGS-y += -iquote $(objtree)/xsm/flask/include
 CFLAGS-y += -I$(srctree)/xsm/flask/include
-- 
Anthony PERARD


