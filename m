Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA6C3F5CA3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170972.312124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBP-000575-Q2; Tue, 24 Aug 2021 11:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170972.312124; Tue, 24 Aug 2021 11:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBP-000543-CG; Tue, 24 Aug 2021 11:01:31 +0000
Received: by outflank-mailman (input) for mailman id 170972;
 Tue, 24 Aug 2021 11:01:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU4D-0003Ux-ER
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:54:05 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61415b14-04c9-11ec-a8c6-12813bfff9fa;
 Tue, 24 Aug 2021 10:52:31 +0000 (UTC)
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
X-Inumbo-ID: 61415b14-04c9-11ec-a8c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qIhqeksXTsJld6lhwEnOa5nx/YE0BWnrn6VUwRvVnk4=;
  b=ZjW+KAJIsmAOAxLmt0dtP4h/vj0SuNM4Hf7gsC8Y3uXRXxYZFIru1glF
   pA8sG2b81dsbNAhF8AeIZrj9spF4Zs6AbzMnEKAdewcIeHNKJIzL8BCTd
   p9TRnfHUeuVT9aNyoVfkF44UaE5K0Bz81JSkjliahAVNq8OrrzTNGE5HS
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fHKQ0ZvUS7+lvVLYCyJjtkAi7/fyG2TviMf6NFjK1fY3NxLxTYJ9vOMsccwVlqKUYR95fSAt/h
 u2sKMJjEM7m3wSxrRKfJB/Frc/Y3tKV4+UCRkeTTbHxOh1Ppl2cSk5JBuQBSIiyOmSM5i9uIdy
 PBuO7ZRS0UzZRbXUNNtGZD5YbHJZ+p4mQh7fJ53ndDADfeUKMkoHFVwFwhiJbPh7s8iU6xKi3m
 CSgDeAvSYOHDhpJ9B4JX2vh/hVYnyWHq6i6q1Wng6mVoJyLaptAGUbh8k8W44mu5oXadkuyujm
 K2RZsu/NdXoZzqfgEqHjGiIu
X-SBRS: 5.1
X-MesageID: 51130805
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:KQ+fb68kV0JJoj8PmLZuk+Fkdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKRcdcdDpAsm9qADnhOdICOgqTPyftWbdyQ+Vxe1Zg7cKoAeQUREWlNQtsp
 uIGpIWYLGeMbEQt7eY3ODMKadE/DDxytHLuQ6x9RZQZDAvT5slwxZyCw6dHEEzbhJBH4AFGJ
 2V4dcCjya8eFwMB/7LSkUtbqzmnZnmhZjmaRkJC1oM8w+Vlw6l77b8DlyxwgoeaTVS2r0vmF
 K13DARp5/T/c1T+CWsl1M73K4m2+cJDeEzRvBkv/JlawkETDzYIbiJFYfy+Azd69vfkGrC2O
 O82CvIef4Dpk85N1vF2yfFyk3u1i0j5GTlzkLdiXz/odbhTDZ/EMZZg5lFGyGpnXbIkesMpJ
 6j5VjpwKa/zCmw7RjV9pzNTVVnh0C0qX0tnaoaiGFeS5IXbPtUoZYE9E1YHZ8cFGaigbpXWN
 VGHYXZ/rJbYFmaZ3fWsi1mx8GtRG06GlODTlIZssKY3jBKlDRyzlcexsYYgnAcnahNAqVs9q
 DBKOBlhbtORsgZYeZ0A/oAW9K+DijXTRfFIAupUCHa/WE8SgDwQrvMkcsIDc2RCeA1JaoJ6e
 f8uQljxBMPkmrVeLKz9YwO6RbQXWn4RijpxqhlluhEhoE=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51130805"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Konrad
 Rzeszutek Wilk" <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v7 49/51] build: adding out-of-tree support to the xen build
Date: Tue, 24 Aug 2021 11:50:36 +0100
Message-ID: <20210824105038.1257926-50-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
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
 xen/Makefile                | 173 +++++++++++++++++++++++++++++-------
 xen/Rules.mk                |  11 ++-
 xen/arch/arm/efi/Makefile   |   3 +
 xen/arch/x86/arch.mk        |   3 +
 xen/arch/x86/boot/Makefile  |   5 +-
 xen/arch/x86/efi/Makefile   |   3 +
 xen/include/Makefile        |   9 +-
 xen/scripts/mkmakefile      |  17 ++++
 xen/test/livepatch/Makefile |   2 +
 xen/xsm/flask/Makefile      |   3 +
 xen/xsm/flask/ss/Makefile   |   3 +
 11 files changed, 194 insertions(+), 38 deletions(-)
 create mode 100755 xen/scripts/mkmakefile

diff --git a/xen/Makefile b/xen/Makefile
index 67ced3e92689..d27c213c3aa9 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -1,3 +1,7 @@
+# $(lastword,) for GNU Make older than 0.81
+lastword = $(word $(words $(1)),$(1))
+this-makefile := $(call lastword,$(MAKEFILE_LIST))
+
 # This is the correct place to edit the build version.
 # All other places this is stored (eg. compile.h) should be autogenerated.
 export XEN_VERSION       = 4
@@ -17,33 +21,18 @@ export XEN_BUILD_HOST	?= $(shell hostname)
 PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
 export PYTHON		?= $(PYTHON_INTERPRETER)
 
-export XEN_ROOT := $(CURDIR)/..
+$(if $(filter __%, $(MAKECMDGOALS)), \
+	$(error targets prefixed with '__' are only for internal use))
 
-srctree := .
-objtree := .
-export srctree objtree
+# That's our default target when none is given on the command line
+PHONY := __all
+__all:
 
 # Do not use make's built-in rules and variables
 MAKEFLAGS += -rR
 
 EFI_MOUNTPOINT ?= $(BOOT_DIR)/efi
 
-ARCH=$(XEN_TARGET_ARCH)
-SRCARCH=$(shell echo $(ARCH) | \
-          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
-              -e s'/riscv.*/riscv/g')
-export ARCH SRCARCH
-
-# Don't break if the build process wasn't called from the top level
-# we need XEN_TARGET_ARCH to generate the proper config
-include $(XEN_ROOT)/Config.mk
-
-# Set ARCH/SUBARCH appropriately.
-export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
-export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
-                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
-                                -e s'/riscv.*/riscv/g')
-
 # Allow someone to change their config file
 export KCONFIG_CONFIG ?= .config
 
@@ -51,14 +40,9 @@ export CC CXX LD
 
 export TARGET := xen
 
-.PHONY: default
-default: build
-
 .PHONY: dist
 dist: install
 
-include scripts/Kbuild.include
-
 ifneq ($(root-make-done),y)
 # section to run before calling Rules.mk, but only once.
 
@@ -130,14 +114,93 @@ endif
 
 ifneq ($(findstring s,$(filter-out --%,$(MAKEFLAGS))),)
     quiet := silent_
+    KBUILD_VERBOSE = 0
 endif
 
 export quiet Q KBUILD_VERBOSE
 
+# $(realpath,) for GNU Make older than 0.81
+realpath = $(wildcard $(foreach file,$(1),$(shell cd -P $(dir $(file)) && echo "$$PWD/$(notdir $(file))")))
+
+ifeq ("$(origin O)", "command line")
+  KBUILD_OUTPUT := $(O)
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
+        # building in the source tree
+        srctree := .
+	building_out_of_srctree :=
+else
+        ifeq ($(abs_srctree)/,$(dir $(abs_objtree)))
+                # building in a subdirectory of the source tree
+                srctree := ..
+        else
+                srctree := $(abs_srctree)
+        endif
+	building_out_of_srctree := 1
+endif
+
+objtree		:= .
+VPATH		:= $(srctree)
+
+export building_out_of_srctree srctree objtree VPATH
+
+export XEN_ROOT := $(abs_srctree)/..
 
 # To make sure we do not include .config for any of the *config targets
 # catch them early, and hand them over to tools/kconfig/Makefile
@@ -161,6 +224,24 @@ ifneq ($(filter %config,$(MAKECMDGOALS)),)
     config-build := y
 endif
 
+include scripts/Kbuild.include
+
+ARCH=$(XEN_TARGET_ARCH)
+SRCARCH=$(shell echo $(ARCH) | \
+          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
+              -e s'/riscv.*/riscv/g')
+export ARCH SRCARCH
+
+# Don't break if the build process wasn't called from the top level
+# we need XEN_TARGET_ARCH to generate the proper config
+include $(XEN_ROOT)/Config.mk
+
+# Set ARCH/SUBARCH appropriately.
+export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
+export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
+                            sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
+                                -e s'/riscv.*/riscv/g')
+
 export CONFIG_SHELL := $(SHELL)
 export YACC = $(if $(BISON),$(BISON),bison)
 export LEX = $(if $(FLEX),$(FLEX),flex)
@@ -196,9 +277,6 @@ CFLAGS += $(CLANG_FLAGS)
 export CLANG_FLAGS
 endif
 
-export root-make-done := y
-endif # root-make-done
-
 # ===========================================================================
 # Rules shared between *config targets and build targets
 
@@ -206,18 +284,42 @@ PHONY += tools_fixdep
 tools_fixdep:
 	$(MAKE) $(build)=tools tools/fixdep
 
+PHONY += outputmakefile
+# Before starting out-of-tree build, make sure the source tree is clean.
+# outputmakefile generates a Makefile in the output directory, if using a
+# separate output directory. This allows convenient use of make in the
+# output directory.
+# At the same time when output Makefile generated, generate .gitignore to
+# ignore whole output directory
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
+	$(Q)$(SHELL) $(srctree)/scripts/mkmakefile $(srctree)
+	$(Q)test -e .gitignore || \
+	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
+endif
+
 ifeq ($(config-build),y)
 # ===========================================================================
 # *config targets only - make sure prerequisites are updated, and descend
 # in tools/kconfig to make the *config target
 
-config: tools_fixdep FORCE
+config: tools_fixdep outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=tools/kconfig $@
 
 # Config.mk tries to include .config file, don't try to remake it
 %/.config: ;
 
-%config: tools_fixdep FORCE
+%config: tools_fixdep outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=tools/kconfig $@
 
 else # !config-build
@@ -299,6 +401,10 @@ endif
 
 CFLAGS += -I$(srctree)/include
 CFLAGS += -I$(srctree)/arch/$(TARGET_ARCH)/include
+ifdef building_out_of_srctree
+    CFLAGS += -I$(objtree)/include
+    CFLAGS += -I$(objtree)/arch/$(TARGET_ARCH)/include
+endif
 
 # Note that link order matters!
 ALL_OBJS-y                := common/built_in.o
@@ -323,6 +429,8 @@ export CFLAGS_UBSAN
 
 endif # need-config
 
+__all: build
+
 main-targets := build install uninstall clean distclean MAP
 .PHONY: $(main-targets)
 ifneq ($(XEN_TARGET_ARCH),x86_32)
@@ -426,7 +534,7 @@ $(TARGET).gz: $(TARGET)
 	gzip -n -f -9 < $< > $@.new
 	mv $@.new $@
 
-$(TARGET): tools_fixdep FORCE
+$(TARGET): tools_fixdep outputmakefile FORCE
 	$(MAKE) $(build)=tools
 	$(MAKE) $(build)=. include/xen/compile.h
 	$(MAKE) $(build)=include all
@@ -492,6 +600,7 @@ cloc:
 	find . -name '*.o.cmd' -exec awk '/^source_/{print $$3;}' {} + | cloc --list-file=-
 
 endif #config-build
+endif # need-sub-make
 
 PHONY += FORCE
 FORCE:
diff --git a/xen/Rules.mk b/xen/Rules.mk
index cb8b35ceb596..6c97f539330a 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -38,7 +38,7 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
                          $(foreach r,rel rel.ro,data.$(r).local)
 
 # The filename build.mk has precedence over Makefile
-mk-dir := $(src)
+mk-dir := $(srctree)/$(src)
 include $(if $(wildcard $(mk-dir)/build.mk),$(mk-dir)/build.mk,$(mk-dir)/Makefile)
 
 # Linking
@@ -330,6 +330,15 @@ existing-targets := $(wildcard $(sort $(targets)))
 
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
diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index 36e15ac280cd..b985043f8c80 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -1,5 +1,8 @@
 CFLAGS-y += -fshort-wchar
 CFLAGS-y += -I$(srctree)/common/efi
+ifdef building_out_of_srctree
+CFLAGS-y += -I$(srctree)/$(src)
+endif
 
 obj-y += boot.init.o pe.init.o ebmalloc.o runtime.o
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index f0dc6820f85c..963926b37d9d 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -62,6 +62,9 @@ ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
 
 efi-check-o = arch/x86/efi/check.o
 
+# Create the directory for out-of-tree build
+$(shell mkdir -p $(dir $(efi-check-o)))
+
 # Check if the compiler supports the MS ABI.
 XEN_BUILD_EFI := $(call if-success,$(CC) $(CFLAGS) -c $(srctree)/$(efi-check-o:.o=.c) -o $(efi-check-o),y)
 
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index c2385e69332d..3909db51b1fd 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -7,6 +7,9 @@ targets += $(head-objs:.S=.o)
 
 head-objs := $(addprefix $(obj)/, $(head-objs))
 
+ifdef building_out_of_srctree
+$(obj)/head.o: CFLAGS-y += -I$(obj)
+endif
 $(obj)/head.o: $(head-objs)
 
 LDFLAGS_DIRECT_OpenBSD = _obsd
@@ -22,7 +25,7 @@ $(call cc-option-add,CFLAGS_x86_32,CC,-Wno-unused-but-set-variable)
 $(call cc-option-add,CFLAGS_x86_32,CC,-Wno-unused-local-typedefs)
 $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
 CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float
-CFLAGS_x86_32 += -I$(srctree)/include
+CFLAGS_x86_32 += -I$(srctree)/include $(if $(building_out_of_srctree), -I$(objtree)/include)
 
 # override for 32bit binaries
 $(head-objs:.S=.o): CFLAGS-stack-boundary :=
diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
index da05935a9348..a716f3fac9cf 100644
--- a/xen/arch/x86/efi/Makefile
+++ b/xen/arch/x86/efi/Makefile
@@ -1,5 +1,8 @@
 CFLAGS-y += -fshort-wchar
 CFLAGS-y += -I$(srctree)/common/efi
+ifdef building_out_of_srctree
+CFLAGS-y += -I$(srctree)/$(src)
+endif
 
 quiet_cmd_objcopy_o_ihex = OBJCOPY $@
 cmd_objcopy_o_ihex = $(OBJCOPY) -I ihex -O binary $< $@
diff --git a/xen/include/Makefile b/xen/include/Makefile
index 4e64a31ecab3..2cd779a4108c 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -110,7 +110,7 @@ $(obj)/headers99.chk: $(PUBLIC_C99_HEADERS) $(src)/Makefile
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
 	    | $(CC) -x c -std=c99 -Wall -Werror                               \
-	      -include stdint.h $(foreach j, $($(i)-prereq), -include $(j).h) \
+	      -include stdint.h $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include $(j).h) \
 	      -S -o /dev/null -                                               \
 	    || exit $$?; echo $(i) >> $@.new;)
 	mv $@.new $@
@@ -124,8 +124,8 @@ $(obj)/headers++.chk: $(PUBLIC_HEADERS) $(src)/Makefile
 	$(foreach i, $(filter %.h,$^),                                        \
 	    echo "#include "\"$(i)\"                                          \
 	    | $(CXX) -x c++ -std=gnu++98 -Wall -Werror -D__XEN_TOOLS__        \
-	      -include stdint.h -include $(src)/public/xen.h                  \
-	      $(foreach j, $($(i)-prereq), -include c$(j)) -S -o /dev/null -  \
+	      -include stdint.h -include $(srctree)/$(src)/public/xen.h       \
+	      $(foreach j, $($(patsubst $(srctree)/%,%,$i)-prereq), -include c$(j)) -S -o /dev/null -  \
 	    || exit $$?; echo $(i) >> $@.new;)
 	mv $@.new $@
 
@@ -134,7 +134,8 @@ endif
 ifeq ($(XEN_TARGET_ARCH),x86_64)
 .PHONY: lib-x86-all
 lib-x86-all:
-	$(MAKE) -C $(obj)/xen/lib/x86 all
+	@mkdir -p $(obj)/xen/lib/x86
+	$(MAKE) -C $(obj)/xen/lib/x86 -f $(abs_srctree)/$(src)/xen/lib/x86/Makefile VPATH=$(srctree) all
 
 all: lib-x86-all
 endif
diff --git a/xen/scripts/mkmakefile b/xen/scripts/mkmakefile
new file mode 100755
index 000000000000..1cb174751429
--- /dev/null
+++ b/xen/scripts/mkmakefile
@@ -0,0 +1,17 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Generates a small Makefile used in the root of the output
+# directory, to allow make to be started from there.
+# The Makefile also allow for more convinient build of external modules
+
+# Usage
+# $1 - Kernel src directory
+
+if [ "${quiet}" != "silent_" ]; then
+	echo "  GEN     Makefile"
+fi
+
+cat << EOF > Makefile
+# Automatically generated by $0: don't edit
+include $1/Makefile
+EOF
diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index 5807a559b42a..51f93f6ba61f 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -11,6 +11,8 @@ endif
 CODE_ADDR=$(shell nm --defined $(1) | grep $(2) | awk '{print "0x"$$1}')
 CODE_SZ=$(shell nm --defined -S $(1) | grep $(2) | awk '{ print "0x"$$2}')
 
+CFLAGS-y += -I$(obj)
+
 extra-y += xen_hello_world.livepatch
 xen_hello_world-objs := xen_hello_world_func.o xen_hello_world.o note.o xen_note.o modinfo.o
 $(obj)/xen_hello_world.o: $(obj)/config.h
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index d655cf8d1974..2c6febc54bf6 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -5,6 +5,9 @@ obj-y += flask_op.o
 obj-y += ss/
 
 CFLAGS-y += -I$(obj)/include
+ifdef building_out_of_srctree
+    CFLAGS-y += -I$(srctree)/$(src)/include
+endif
 
 AWK = awk
 
diff --git a/xen/xsm/flask/ss/Makefile b/xen/xsm/flask/ss/Makefile
index aba1339f3808..c50d67320ed3 100644
--- a/xen/xsm/flask/ss/Makefile
+++ b/xen/xsm/flask/ss/Makefile
@@ -9,3 +9,6 @@ obj-y += conditional.o
 obj-y += mls.o
 
 CFLAGS-y += -I$(srctree)/xsm/flask/include
+ifdef building_out_of_srctree
+    CFLAGS-y += -I$(objtree)/xsm/flask/include
+endif
-- 
Anthony PERARD


