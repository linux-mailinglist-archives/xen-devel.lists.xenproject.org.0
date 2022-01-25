Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44DF49B2A0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260090.449220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfd-0005oV-3z; Tue, 25 Jan 2022 11:07:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260090.449220; Tue, 25 Jan 2022 11:07:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfc-0005nB-Ux; Tue, 25 Jan 2022 11:07:28 +0000
Received: by outflank-mailman (input) for mailman id 260090;
 Tue, 25 Jan 2022 11:07:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJak-0006t5-Vk
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:02:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4626dbcb-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:02:24 +0100 (CET)
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
X-Inumbo-ID: 4626dbcb-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BzvETYqzMqT76cPe2jZEHD++ABik9L+Obl8PAe/g5ts=;
  b=ZU78sVh3zPhTHFw3ENFJoy3yAG6v5qAwOnHMY76MZtOtfQXZFQXU1VML
   AYHCNt83XcQHZJgOKuRLt9yjqEmdtLIZi0vEReDGmLfD458QhWAAcc2RV
   NImfg9EycG3/YkSXv8mV5uxyuFlIcDVCyDcMrljl5TDkAof3slSLKQ4DN
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: W6xdz4elpKJOlSe2vexpdw5YPlWqBtl4hFzYJQW4P4IinGap8pLi7SfGrWo40D/AyJ7O0L6SMd
 ndnxVlV/CMrgPpOw+ANIfp1k4CjxxvIhH3VaN9tLD8IC0fb9/ao3PA7zrDj9mcKmWag7FrNbmj
 tOTIhvgYCq0DcCCMAlsNWngiUJrTAf3Fx27I72f6id8zFnTWBiZgJtq5VQ56Y6ryliba56aUGs
 ebzYZBJmkRrkt47Lo+KbHkGaYGCGN9b0N0zEAS/KGLgHxM4YylLRw0pRaW+OIPAvFMcCXTu4fR
 eamW0Ug9rGGUHOYB6gQ8CdmB
X-SBRS: 5.2
X-MesageID: 64860924
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:P4gBb6833Lx42r3KNvRWDrUDw3iTJUtcMsCJ2f8bNWPcYEJGY0x3n
 WcYUGmBa/mCZmb0ftlwOo2/9UoBvp7SzNdnSAZr+X08E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7dj39Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhd6
 YwSl6D3ETwnEbfmpd4xSSReKyNxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4STaiGN
 pBFAdZpRC/HfAYIMHgOM9UFmbajwXj0YSN2tF3A8MLb5ECMlVcsgdABKuH9eduMX8xZ2FmZo
 mHu+H7wCRUXcteYzFKt7XaEluLJ2yThV+o6GKWj8/92gHWa3mEJFAANTly/vOW4jUilHdlYL
 iQ89iUioKco/WS3X9L9WFu+u3fCsRkCM/JSGeAn7ACGyoLP/h2UQGMDS1ZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAONnMLbyIASQoD4vHgrZs1gxaJScxseIa3k9n0FDfY0
 z2M6i8kiN0uYdUjjvvhuwqd2nT1+8aPHlVdChjrsnyNwiIgO6yZINST53fBx8t6AJykSGGDs
 y1R8ySB19wmAZaInS2LZewCGrC1+vqIWAHhbU5T84oJrGr0pSP6FWxEyHQnfRoybJ5YEdP8S
 BKL4WtsCIlv0GxGhEOdS6a4EIwUwKfpDrwJvdiEP4MVMvCdmOJqlRyChHJ8PUiwyCDAcollY
 P93lPpA615AVcyLKxLtH48gPUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/lmOq
 4oOaJTUmkQHOAEbXsUx2dRPRbztBSNjba0aVuQNLrLTSuaYMD9J5wDtLUMJJNU+wvU9ehbg9
 XChQE5IoGcTdlWcQThmnktLMeu1Nb4m9CpTFXV1YT6AhiZ/Ca7ysvZ3X8ZnLNEPqb04pdYpH
 qZtRil1KqkVItgx025DPcCVQU0LXEnDuD9iyAL8MGFgJMYxHlKQkjImFyO2nBQz4uOMnZNWi
 9WdOsnzGPLvnixuU5TbbuyB1VS0sSRPke5+RRKQcNJSZF/t4M5hLCmo1q07JMQFKBPiwDqG1
 lnJXUdE9LeV+4JlosPUga2krpuyF7csFERtAGSGv629MjPX/zT/zNYYAvqIZz3USEj95L6mO
 bdO1/j5PfBexARKvoNwHqxF16U749ez9bZWwh49RCfAbkixC6MmKX6DhJEduqpIz75fmA23R
 kPQpYUKZeTXYJvoSQdDKhAkY+KP0eAvtgPTtfllcl/n4CJX/aacVRkANRe7lyEAfqB+N5kow
 Ll9tZdOuRC/kBcjLv2PkjtQqzaXNnUFXqgq6sMaDYvshlZ5w11Oe8WBWCr/4ZXJYNRQKEg6Z
 DSTgfOa1bhbw0PDdVs1FGTMgrUB1chf5kgSwQ9QPUmNl/rEmuQzjU9Y/jkARwhIyglKjrBoM
 W9xOkwpfaiD8l+EXiSYs7xAz+2ZOCCkxw==
IronPort-HdrOrdr: A9a23:elIbBK7Js6teNqqiNQPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HIoB17726MtN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpM
 FdmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="64860924"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v9 30/30] build: adding out-of-tree support to the xen build
Date: Tue, 25 Jan 2022 11:01:03 +0000
Message-ID: <20220125110103.3527686-31-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v9:
    - acked
    - add "source -> ." symlink in the in-tree build as well. This allow to
      make relative symlink to the "common/efi/*.c" sources.
    - also now, the "source" symlink is removed on `distclean`, add added to
      .gitignore.
    
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

 .gitignore                   |   1 +
 xen/Makefile                 | 143 +++++++++++++++++++++++++++++++----
 xen/Rules.mk                 |  11 ++-
 xen/arch/x86/arch.mk         |   5 +-
 xen/arch/x86/boot/Makefile   |   6 ++
 xen/common/efi/efi-common.mk |   3 +-
 xen/include/Makefile         |  11 ++-
 xen/test/livepatch/Makefile  |   2 +
 xen/xsm/flask/Makefile       |   3 +-
 xen/xsm/flask/ss/Makefile    |   1 +
 10 files changed, 164 insertions(+), 22 deletions(-)

diff --git a/.gitignore b/.gitignore
index cc87a7dfae7b..0464098ed2b5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -329,6 +329,7 @@ xen/include/xen/*.new
 xen/include/xen/acm_policy.h
 xen/include/xen/compile.h
 xen/include/xen/lib/x86/cpuid-autogen.h
+xen/source
 xen/test/livepatch/config.h
 xen/test/livepatch/expect_config.h
 xen/test/livepatch/*.livepatch
diff --git a/xen/Makefile b/xen/Makefile
index 08114b3fef1e..499f9580dab8 100644
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
 
@@ -37,9 +48,6 @@ export CC CXX LD
 
 export TARGET := xen
 
-.PHONY: default
-default: build
-
 .PHONY: dist
 dist: install
 
@@ -118,16 +126,88 @@ endif
 
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
+	$(Q)ln -fsn $(srctree) source
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
 
@@ -338,6 +450,8 @@ export CFLAGS_UBSAN
 
 endif # need-config
 
+__all: build
+
 main-targets := build install uninstall clean distclean MAP
 .PHONY: $(main-targets)
 ifneq ($(XEN_TARGET_ARCH),x86_32)
@@ -434,13 +548,13 @@ _clean:
 
 .PHONY: _distclean
 _distclean: clean
-	rm -f tags TAGS cscope.files cscope.in.out cscope.out cscope.po.out GTAGS GPATH GRTAGS GSYMS .config
+	rm -f tags TAGS cscope.files cscope.in.out cscope.out cscope.po.out GTAGS GPATH GRTAGS GSYMS .config source
 
 $(TARGET).gz: $(TARGET)
 	gzip -n -f -9 < $< > $@.new
 	mv $@.new $@
 
-$(TARGET): FORCE
+$(TARGET): outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=tools
 	$(Q)$(MAKE) $(build)=. include/xen/compile.h
 	$(Q)$(MAKE) $(build)=include all
@@ -509,6 +623,7 @@ cloc:
 	done | cloc --list-file=-
 
 endif #config-build
+endif # need-sub-make
 
 PHONY += FORCE
 FORCE:
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 57a029455586..70b7489ea89b 100644
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
index 2fcb6271faf7..5c5795d17bd0 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -62,6 +62,9 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 
 efi-check := arch/x86/efi/check
 
+# Create the directory for out-of-tree build
+$(shell mkdir -p $(dir $(efi-check)))
+
 # Check if the compiler supports the MS ABI.
 XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(srctree)/$(efi-check).c -o $(efi-check).o,y)
 
@@ -101,6 +104,6 @@ export EFI_LDFLAGS
 endif
 
 # Set up the assembler include path properly for older toolchains.
-CFLAGS += -Wa,-I$(srctree)/include
+CFLAGS += -Wa,-I$(objtree)/include -Wa,-I$(srctree)/include
 
 ALL_OBJS-y := arch/x86/boot/built_in.o arch/x86/efi/built_in.o $(ALL_OBJS-y)
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index ca8001c72b23..784655f5e2bd 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -7,11 +7,17 @@ targets += $(head-srcs:.S=.o)
 
 head-srcs := $(addprefix $(obj)/, $(head-srcs))
 
+ifdef building_out_of_srctree
+$(obj)/head.o: CFLAGS-y += -iquote $(obj)
+endif
 $(obj)/head.o: $(head-srcs)
 
 CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
+ifdef building_out_of_srctree
+CFLAGS_x86_32 += -I$(objtree)/include
+endif
 CFLAGS_x86_32 += -I$(srctree)/include
 
 # override for 32bit binaries
diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
index ad3c6f2569c3..0331cb57e789 100644
--- a/xen/common/efi/efi-common.mk
+++ b/xen/common/efi/efi-common.mk
@@ -3,12 +3,13 @@ EFIOBJ-$(CONFIG_COMPAT) += compat.o
 
 CFLAGS-y += -fshort-wchar
 CFLAGS-y += -iquote $(srctree)/common/efi
+CFLAGS-y += -iquote $(srcdir)
 
 # Part of the command line transforms $(obj) in to a relative reverted path.
 # e.g.: It transforms "dir/foo/bar" into successively
 #       "dir foo bar", ".. .. ..", "../../.."
 $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
-	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/common/efi/$(<F) $@
+	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
 
 clean-files += $(patsubst %.o, %.c, $(EFIOBJ-y:.init.o=.o) $(EFIOBJ-))
 
diff --git a/xen/include/Makefile b/xen/include/Makefile
index c8c4bcd93bd3..03baf10efb77 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -115,7 +115,8 @@ $(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(srcdir)/Makefile
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
 	    | $(CC) -x c -std=c99 -Wall -Werror                               \
-	      -include stdint.h $(foreach j, $($(i)-prereq), -include $(j).h) \
+	      -include stdint.h                                               \
+	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include $(j).h) \
 	      -S -o /dev/null -                                               \
 	    || exit $$?; echo $(i) >> $@.new;)
 	mv $@.new $@
@@ -129,8 +130,9 @@ $(obj)/headers++.chk: $(PUBLIC_HEADERS) $(srcdir)/Makefile
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
 
@@ -139,7 +141,8 @@ endif
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


