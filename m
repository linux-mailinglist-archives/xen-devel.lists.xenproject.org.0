Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC50D3B9314
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:21:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148771.275041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZU-00021u-WE; Thu, 01 Jul 2021 14:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148771.275041; Thu, 01 Jul 2021 14:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxZU-0001zW-Ql; Thu, 01 Jul 2021 14:21:40 +0000
Received: by outflank-mailman (input) for mailman id 148771;
 Thu, 01 Jul 2021 14:21:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxQU-0005F9-Lo
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:12:22 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2de16752-da76-11eb-8328-12813bfff9fa;
 Thu, 01 Jul 2021 14:11:08 +0000 (UTC)
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
X-Inumbo-ID: 2de16752-da76-11eb-8328-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148668;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TiF+907ZnxR32g7xJeKX/Svu6O0iCgKs/yul2z4hMQ4=;
  b=CBuk5V9VccZamEJRTJymR4scMjHj2aHBEGnBFK1CV3SwhGe0CVVlznaM
   tMnVBtp6UQQsOx+sDgA9tjRz2JlIbGmQPggyF4+gN02Z0gcZ5eaKE2gEH
   4bF2bG3KIZ+OLNmOPk+dTNHF61ZToPFEWpRHpcnLhB+vgslUUaAv5Azgv
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: u+Xbk3Z39cB6nUXv0SAaMfHYUNdz/kdlSAuw+iemQtkxF3Ev3vKIJ+Vo9jqvmoOcBa2Oc1nFm3
 sT/lZFhcqIxiIorpvbR3mvcEpzOB2seiMC8tD0yCU91aLbxCZGxHWBk1H30yQIpD1V4TgYJBuR
 NF58oOEGPFNOzEMMezFevA2hGyGi0okItpnwQtabOKIkSkKjomxpXK3BTsz/6jvhyC0HEW3qXK
 Zo3JAsMo6+8Zeb1nSaICus+kpeVysCAdZ+lvpCEFADZQ4ubiI7OfBl497DXr4EYmwY7uTG30Hm
 y4I=
X-SBRS: 5.1
X-MesageID: 47093433
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DOVDqq1EypBCfQJyd5Ir0AqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47093433"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bob Eshleman
	<bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Ross
 Lagerwall" <ross.lagerwall@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [XEN PATCH v6 29/31] build: build everything from the root dir, use obj=$subdir
Date: Thu, 1 Jul 2021 15:10:09 +0100
Message-ID: <20210701141011.785641-30-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

A subdirectory is now built by setting "$(obj)" instead of changing
directory. "$(obj)" should always be set when using "Rules.mk" and
thus a shortcut "$(build)" is introduced and should be used.

A new variable "$(need-builtin)" is introduce. It is to be used
whenever a "built_in.o" is wanted from a subdirectory. "built_in.o"
isn't the main target anymore, and thus only needs to depends on the
objects that should be part of "built_in.o".

Introduce $(srctree) and $(objtree) to replace $(BASEDIR) in cases a
relative path is better.

DEPS is updated as the existing macro to deal with it doesn't know
about $(obj).

There's some changes in "Rules.mk" which in addition to deal with
"$(obj)" also make it's looks more like "Makefile.build" from Linux
v5.12.

test/Makefile doesn't need special handling in order to build
everything under test/, Rules.mk will visit test/livepatch via
$(subdir-y), thus "tests" "all" and "build" target are removed.
"subtree-force-update" target isn't useful so it is removed as well.

test/livepatch/Makefile doesn't need default target anymore, Rules.mk
will build everything in $(extra-y) and thus all *.livepatch.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile                |  46 ++++++++-----
 xen/Rules.mk                | 131 +++++++++++++++++++++++-------------
 xen/arch/arm/Makefile       |   4 +-
 xen/arch/arm/arch.mk        |   4 +-
 xen/arch/riscv/arch.mk      |   3 +-
 xen/arch/x86/Makefile       |  13 ++--
 xen/arch/x86/Rules.mk       |   4 +-
 xen/arch/x86/arch.mk        |  10 +--
 xen/arch/x86/boot/Makefile  |   8 +--
 xen/include/Makefile        |   6 +-
 xen/scripts/Kbuild.include  |   6 ++
 xen/test/Makefile           |   7 +-
 xen/test/livepatch/Makefile |   6 --
 xen/xsm/flask/Makefile      |   2 +-
 xen/xsm/flask/ss/Makefile   |   2 +-
 15 files changed, 151 insertions(+), 101 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 6aac68750b4d..71f098cd6374 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -20,6 +20,10 @@ export PYTHON		?= $(PYTHON_INTERPRETER)
 export BASEDIR := $(CURDIR)
 export XEN_ROOT := $(BASEDIR)/..
 
+srctree := .
+objtree := .
+export srctree objtree
+
 # Do not use make's built-in rules and variables
 MAKEFLAGS += -rR
 
@@ -234,7 +238,7 @@ endif
 CFLAGS += -nostdinc -fno-builtin -fno-common
 CFLAGS += -Werror -Wredundant-decls -Wno-pointer-arith
 $(call cc-option-add,CFLAGS,CC,-Wvla)
-CFLAGS += -pipe -D__XEN__ -include $(BASEDIR)/include/xen/config.h
+CFLAGS += -pipe -D__XEN__ -include $(objtree)/include/xen/config.h
 CFLAGS-$(CONFIG_DEBUG_INFO) += -g
 
 ifneq ($(CONFIG_CC_IS_CLANG),y)
@@ -295,7 +299,7 @@ endif # need-config
 .PHONY: build install uninstall clean distclean MAP
 build install uninstall debug clean distclean MAP::
 ifneq ($(XEN_TARGET_ARCH),x86_32)
-	$(MAKE) -f Rules.mk _$@
+	$(MAKE) $(build)=. _$@
 else
 	echo "*** Xen x86/32 target no longer supported!"
 endif
@@ -335,10 +339,10 @@ _install: $(TARGET)$(CONFIG_XEN_INSTALL_SUFFIX)
 
 .PHONY: tests
 tests:
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C test tests
+	$(MAKE) $(build)=test
 .PHONY: install-tests
 install-tests:
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C test install
+	$(MAKE) $(build)=test install
 
 .PHONY: _uninstall
 _uninstall: D=$(DESTDIR)
@@ -395,23 +399,26 @@ $(TARGET).gz: $(TARGET)
 PHONY += prepare
 prepare:
 	$(MAKE) -C tools
-	$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/compile.h
+	$(MAKE) $(build)=. include/xen/compile.h
 	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
 		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
 		   ln -nsf ../../../common/efi/$$f arch/$(TARGET_ARCH)/efi/; \
 		done; \
 		true
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C include
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) include
-	$(MAKE) -f $(BASEDIR)/Rules.mk include/arch-$(TARGET_ARCH)/asm/asm-offsets.h
+	$(MAKE) $(build)=include all
+	$(MAKE) $(build)=arch/$(TARGET_ARCH) include
+	$(MAKE) $(build)=. include/arch-$(TARGET_ARCH)/asm/asm-offsets.h
+
+# The actual objects are generated when descending,
+# make sure no implicit rule kicks in
+$(sort $(ALL_OBJS) $(ALL_LIBS)): descend ;
 
-$(ALL_OBJS) $(ALL_LIBS): prepare
+build-dirs := $(patsubst %/built_in.o,%,$(filter %/built_in.o,$(ALL_OBJS) $(ALL_LIBS)))
 
-# head.o is built by descending into arch/arm/$(TARGET_SUBARCH), depends on the
-# part of $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and
-# build head.o
-arch/arm/$(TARGET_SUBARCH)/head.o: arch/arm/built_in.o
-arch/arm/$(TARGET_SUBARCH)/head.o: ;
+PHONY += descend $(build-dirs)
+descend: $(build-dirs)
+$(build-dirs): prepare
+	$(MAKE) $(build)=$@ need-builtin=1
 
 ifeq ($(CONFIG_LTO),y)
 # Gather all LTO objects together
@@ -429,7 +436,7 @@ endif
 targets += prelink.o
 
 $(TARGET): prelink.o FORCE
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
+	$(MAKE) $(build)=arch/$(TARGET_ARCH) $@
 
 quiet_cmd_banner = BANNER  $@
 define cmd_banner
@@ -533,14 +540,17 @@ cscope:
 _MAP:
 	$(NM) -n $(TARGET)-syms | grep -v '\(compiled\)\|\(\.o$$\)\|\( [aUw] \)\|\(\.\.ng$$\)\|\(LASH[RL]DI\)' > System.map
 
+# Avoid those single target rules when Makefile is included by Rules.mk
+ifndef obj
 %.o %.i %.s: %.c FORCE
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C $(*D) $(@F)
+	$(MAKE) $(build)=$(*D) $(*D)/$(@F)
 
 %.o %.s: %.S FORCE
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C $(*D) $(@F)
+	$(MAKE) $(build)=$(*D) $(*D)/$(@F)
 
 %/: FORCE
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C $* built_in.o built_in_bin.o
+	$(MAKE) $(build)=$* need-builtin=1
+endif
 
 .PHONY: cloc
 cloc:
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 0f8d90844455..4b3abf0ea880 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -3,20 +3,27 @@
 # Makefile and are consumed by Rules.mk
 #
 
-obj := .
 src := $(obj)
 
+PHONY := __build
+__build:
+
 -include $(BASEDIR)/include/config/auto.conf
 
 include $(XEN_ROOT)/Config.mk
 include $(BASEDIR)/scripts/Kbuild.include
 
+ifndef obj
+$(warning kbuild: Makefile.build is included improperly)
+endif
 
-TARGET := $(BASEDIR)/xen
+TARGET := xen
 
 # Initialise some variables
+obj-y :=
 lib-y :=
 targets :=
+subdir-y :=
 CFLAGS-y :=
 AFLAGS-y :=
 
@@ -47,27 +54,52 @@ cmd_ar = rm -f $@; $(AR) cr $@ $(real-prereqs)
 quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $< $@
 
-define gendep
-    ifneq ($(1),$(subst /,:,$(1)))
-        DEPS += $(dir $(1)).$(notdir $(1)).d
-    endif
-endef
-$(foreach o,$(filter-out %/,$(obj-y) $(obj-bin-y) $(extra-y)),$(eval $(call gendep,$(o))))
+# Figure out what we need to build from the various variables
+# ===========================================================================
+
+# Libraries are always collected in one lib file.
+# Filter out objects already built-in
+lib-y := $(filter-out $(obj-y), $(sort $(lib-y)))
+
+# Subdirectories we need to descend into
+subdir-y := $(subdir-y) $(patsubst %/,%,$(filter %/, $(obj-y)))
 
 # Handle objects in subdirs
-# ---------------------------------------------------------------------------
-# o if we encounter foo/ in $(obj-y), replace it by foo/built_in.o
-#   and add the directory to the list of dirs to descend into: $(subdir-y)
-subdir-y := $(subdir-y) $(filter %/, $(obj-y))
+# - if we encounter foo/ in $(obj-y), replace it by foo/built_in.o
+ifdef need-builtin
 obj-y    := $(patsubst %/, %/built_in.o, $(obj-y))
+else
+obj-y    := $(filter-out %/, $(obj-y))
+endif
 
-# $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
-# tell kbuild to descend
-subdir-obj-y := $(filter %/built_in.o, $(obj-y))
+# Add subdir path
 
-# Libraries are always collected in one lib file.
-# Filter out objects already built-in
-lib-y := $(filter-out $(obj-y), $(sort $(lib-y)))
+extra-y         := $(addprefix $(obj)/,$(extra-y))
+targets         := $(addprefix $(obj)/,$(targets))
+lib-y           := $(addprefix $(obj)/,$(lib-y))
+obj-y           := $(addprefix $(obj)/,$(obj-y))
+obj-bin-y       := $(addprefix $(obj)/,$(obj-bin-y))
+subdir-y        := $(addprefix $(obj)/,$(subdir-y))
+
+# subdir-builtin may contain duplications. Use $(sort ...)
+subdir-builtin := $(sort $(filter %/built_in.o, $(obj-y)))
+
+targets-for-builtin := $(extra-y)
+
+ifneq ($(strip $(lib-y)),)
+    targets-for-builtin += $(obj)/lib.a
+endif
+
+ifdef need-builtin
+    targets-for-builtin += $(obj)/built_in.o
+    ifneq ($(strip $(obj-bin-y)),)
+        ifeq ($(CONFIG_LTO),y)
+            targets-for-builtin += $(obj)/built_in_bin.o
+        endif
+    endif
+endif
+
+targets += $(targets-for-builtin)
 
 $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS_ONLY
 
@@ -119,29 +151,28 @@ quiet_cmd_cc_builtin = LD      $@
 cmd_cc_builtin = \
     $(CC) $(XEN_CFLAGS) -c -x c /dev/null -o $@
 
+# To build objects in subdirs, we need to descend into the directories
+$(subdir-builtin): $(obj)/%/built_in.o: $(obj)/% ;
+
 quiet_cmd_ld_builtin = LD      $@
 ifeq ($(CONFIG_LTO),y)
 cmd_ld_builtin = \
-    $(LD_LTO) -r -o $@ $(filter $(obj-y),$(real-prereqs))
+    $(LD_LTO) -r -o $@ $(real-prereqs)
 else
 cmd_ld_builtin = \
-    $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter $(obj-y),$(real-prereqs))
+    $(LD) $(XEN_LDFLAGS) -r -o $@ $(real-prereqs)
 endif
 
-built_in.o: $(obj-y) $(if $(strip $(lib-y)),lib.a) $(extra-y) FORCE
+$(obj)/built_in.o: $(obj-y) FORCE
 	$(call if_changed,$(if $(strip $(obj-y)),ld_builtin,cc_builtin))
 
-lib.a: $(lib-y) FORCE
+$(obj)/lib.a: $(lib-y) FORCE
 	$(call if_changed,ar)
 
-targets += built_in.o
-ifneq ($(strip $(lib-y)),)
-targets += lib.a
-endif
-targets += $(filter-out $(subdir-obj-y), $(obj-y) $(lib-y)) $(extra-y)
-targets += $(MAKECMDGOALS)
+targets += $(filter-out $(subdir-builtin), $(obj-y))
+targets += $(lib-y) $(MAKECMDGOALS)
 
-built_in_bin.o: $(obj-bin-y) $(extra-y)
+$(obj)/built_in_bin.o: $(obj-bin-y)
 ifeq ($(strip $(obj-bin-y)),)
 	$(CC) $(a_flags) -c -x assembler /dev/null -o $@
 else
@@ -152,21 +183,13 @@ endif
 PHONY += FORCE
 FORCE:
 
-%/built_in.o %/lib.a: FORCE
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C $* built_in.o
-
-%/built_in_bin.o: FORCE
-	$(MAKE) -f $(BASEDIR)/Rules.mk -C $* built_in_bin.o
-
-SRCPATH := $(patsubst $(BASEDIR)/%,%,$(CURDIR))
-
 quiet_cmd_cc_o_c = CC      $@
 ifeq ($(CONFIG_ENFORCE_UNIQUE_SYMBOLS),y)
     cmd_cc_o_c = $(CC) $(c_flags) -c $< -o $(dot-target).tmp -MQ $@
     ifeq ($(CONFIG_CC_IS_CLANG),y)
-        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $<=$(SRCPATH)/$< $(dot-target).tmp $@
+        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@
     else
-        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$(SRCPATH)/$< $(dot-target).tmp $@
+        cmd_objcopy_fix_sym = $(OBJCOPY) --redefine-sym $(<F)=$< $(dot-target).tmp $@
     endif
     cmd_objcopy_fix_sym += && rm -f $(dot-target).tmp
 else
@@ -178,13 +201,13 @@ define rule_cc_o_c
     $(call cmd,objcopy_fix_sym)
 endef
 
-%.o: %.c FORCE
+$(obj)/%.o: $(src)/%.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
 quiet_cmd_cc_o_S = CC      $@
 cmd_cc_o_S = $(CC) $(a_flags) -c $< -o $@
 
-%.o: %.S FORCE
+$(obj)/%.o: $(src)/%.S FORCE
 	$(call if_changed,cc_o_S)
 
 
@@ -202,7 +225,7 @@ define cmd_obj_init_o
     $(OBJCOPY) $(foreach s,$(SPECIAL_DATA_SECTIONS),--rename-section .$(s)=.init.$(s)) $< $@
 endef
 
-$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): %.init.o: %.o FORCE
+$(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): $(obj)/%.init.o: $(obj)/%.o FORCE
 	$(call if_changed,obj_init_o)
 
 quiet_cmd_cpp_i_c = CPP     $@
@@ -214,19 +237,21 @@ cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
 quiet_cmd_cpp_s_S = CPP     $@
 cmd_cpp_s_S = $(CPP) $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
 
-%.i: %.c FORCE
+$(obj)/%.i: $(src)/%.c FORCE
 	$(call if_changed,cpp_i_c)
 
-%.s: %.c FORCE
+$(obj)/%.s: $(src)/%.c FORCE
 	$(call if_changed,cc_s_c)
 
-%.s: %.S FORCE
+$(obj)/%.s: $(src)/%.S FORCE
 	$(call if_changed,cpp_s_S)
 
 # Linker scripts, .lds.S -> .lds
 quiet_cmd_cpp_lds_S = LDS     $@
 cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -D__LINKER__ -MQ $@ -o $@ $<
 
+targets := $(filter-out $(PHONY), $(targets))
+
 # Add intermediate targets:
 # When building objects with specific suffix patterns, add intermediate
 # targets that the final targets are derived from.
@@ -236,7 +261,18 @@ intermediate_targets = $(foreach sfx, $(2), \
 # %.init.o <- %.o
 targets += $(call intermediate_targets, .init.o, .o)
 
--include $(DEPS_INCLUDE)
+# Build
+# ---------------------------------------------------------------------------
+
+__build: $(targets-for-builtin) $(subdir-y)
+	@:
+
+# Descending
+# ---------------------------------------------------------------------------
+
+PHONY += $(subdir-y)
+$(subdir-y):
+	$(Q)$(MAKE) $(build)=$@ need-builtin=$(if $(filter $@/built_in.o, $(subdir-builtin)),1)
 
 # Read all saved command lines and dependencies for the $(targets) we
 # may be building above, using $(if_changed{,_dep}). As an
@@ -247,6 +283,9 @@ existing-targets := $(wildcard $(sort $(targets)))
 
 -include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
 
+DEPS:= $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).d)
+-include $(DEPS_INCLUDE)
+
 # Declare the contents of the PHONY variable as phony.  We keep that
 # information in a variable so we can use it in if_changed and friends.
 .PHONY: $(PHONY)
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 9f9c73aa6c5d..a3204d22d17b 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -93,12 +93,12 @@ $(TARGET)-syms: $(BASEDIR)/prelink.o $(obj)/xen.lds
 	    $(BASEDIR)/common/symbols-dummy.o -o $(@D)/.$(@F).0
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
+	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
+	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
diff --git a/xen/arch/arm/arch.mk b/xen/arch/arm/arch.mk
index 8a2b202f698e..0a6ae6c2fe60 100644
--- a/xen/arch/arm/arch.mk
+++ b/xen/arch/arm/arch.mk
@@ -1,8 +1,8 @@
 ########################################
 # arm-specific definitions
 
-CFLAGS += -I$(BASEDIR)/include
-CFLAGS += -I$(BASEDIR)/include/arch-$(TARGET_ARCH)
+CFLAGS += -I$(srctree)/include
+CFLAGS += -I$(srctree)/include/arch-$(TARGET_ARCH)
 
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
index 53dadb897591..8aa2206184fa 100644
--- a/xen/arch/riscv/arch.mk
+++ b/xen/arch/riscv/arch.mk
@@ -11,4 +11,5 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
 # -mcmodel=medlow would force Xen into the lower half.
 
 CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
-CFLAGS += -I$(BASEDIR)/include
+CFLAGS += -I$(srctree)/include
+CFLAGS += -I$(srctree)/include/arch-$(TARGET_ARCH)
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 2cc67d6e0e84..c5e87f3db35b 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -81,6 +81,9 @@ endif
 extra-y += asm-macros.i
 extra-y += xen.lds
 
+# Allows usercopy.c to includes itself
+$(obj)/usercopy.o: CFLAGS-y += -I.
+
 ifneq ($(CONFIG_HVM),y)
 $(obj)/x86_emulate.o: CFLAGS-y += -Wno-unused-label
 endif
@@ -166,13 +169,13 @@ $(TARGET)-syms: $(BASEDIR)/prelink.o $(obj)/xen.lds
 	$(NM) -pa --format=sysv $(@D)/.$(@F).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort \
 		>$(@D)/.$(@F).0.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0.o
+	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).0.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).0.o -o $(@D)/.$(@F).1
 	$(NM) -pa --format=sysv $(@D)/.$(@F).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		>$(@D)/.$(@F).1.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
+	$(MAKE) $(build)=$(@D) $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds -N $< $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
@@ -234,14 +237,14 @@ endif
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).0) >$(@D)/.$(@F).0r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).0 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).0s.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o
+	$(MAKE) $(build)=$(@D) .$(@F).0r.o .$(@F).0s.o
 	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
 	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds -N $< \
 	                $(@D)/.$(@F).0r.o $(@D)/.$(@F).0s.o $(note_file_option) -o $(@D)/.$(@F).$(base).1 &&) :
 	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(@D)/.$(@F).$(base).1) >$(@D)/.$(@F).1r.S
 	$(NM) -pa --format=sysv $(@D)/.$(@F).$(VIRT_BASE).1 \
 		| $(BASEDIR)/tools/symbols $(all_symbols) --sysv --sort >$(@D)/.$(@F).1s.S
-	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o
+	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds -N $< \
 	                $(@D)/.$(@F).1r.o $(@D)/.$(@F).1s.o $(note_file_option) -o $@
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
@@ -253,7 +256,7 @@ $(TARGET).efi: FORCE
 	echo '$(if $(filter y,$(XEN_BUILD_EFI)),xen.efi generation,EFI support) disabled'
 endif
 
-$(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: $(BASEDIR)/arch/x86/efi/built_in.o
+$(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: arch/x86/efi/built_in.o
 $(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: ;
 
 .PHONY: include
diff --git a/xen/arch/x86/Rules.mk b/xen/arch/x86/Rules.mk
index 56fe22c979ea..2d12c2dca208 100644
--- a/xen/arch/x86/Rules.mk
+++ b/xen/arch/x86/Rules.mk
@@ -2,9 +2,9 @@
 # x86-specific definitions
 
 ifneq ($(filter -DHAVE_AS_QUOTED_SYM,$(XEN_CFLAGS)),)
-object_label_flags = '-D__OBJECT_LABEL__=$(subst $(BASEDIR)/,,$(CURDIR))/$@'
+object_label_flags = '-D__OBJECT_LABEL__=$@'
 else
-object_label_flags = '-D__OBJECT_LABEL__=$(subst /,$$,$(subst -,_,$(subst $(BASEDIR)/,,$(CURDIR))/$@))'
+object_label_flags = '-D__OBJECT_LABEL__=$(subst /,$$,$(subst -,_,$@))'
 endif
 c_flags += $(object_label_flags) $(CFLAGS-stack-boundary)
 a_flags += $(object_label_flags) $(CFLAGS-stack-boundary)
diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index c95caa303db8..3f181f616188 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -3,10 +3,10 @@
 
 export XEN_IMG_OFFSET := 0x200000
 
-CFLAGS += -I$(BASEDIR)/include
-CFLAGS += -I$(BASEDIR)/include/arch-$(TARGET_ARCH)
-CFLAGS += -I$(BASEDIR)/include/arch-x86/asm/mach-generic
-CFLAGS += -I$(BASEDIR)/include/arch-x86/asm/mach-default
+CFLAGS += -I$(srctree)/include
+CFLAGS += -I$(srctree)/include/arch-$(TARGET_ARCH)
+CFLAGS += -I$(srctree)/include/arch-x86/asm/mach-generic
+CFLAGS += -I$(srctree)/include/arch-x86/asm/mach-default
 CFLAGS += -DXEN_IMG_OFFSET=$(XEN_IMG_OFFSET)
 
 # Prevent floating-point variables from creeping into Xen.
@@ -66,6 +66,6 @@ export XEN_BUILD_EFI := $(call try-run,$(CC) $(CFLAGS) -c arch/x86/efi/check.c -
 endif
 
 # Set up the assembler include path properly for older toolchains.
-CFLAGS += -Wa,-I$(BASEDIR)/include
+CFLAGS += -Wa,-I$(srctree)/include
 
 ALL_OBJS-y := arch/x86/boot/built_in.o arch/x86/efi/built_in.o $(ALL_OBJS-y)
diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 53d357489df2..2469ca7c4530 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -1,8 +1,8 @@
 obj-bin-y += head.o
 
-DEFS_H_DEPS = $(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
+DEFS_H_DEPS = $(BASEDIR)/$(src)/defs.h $(BASEDIR)/include/xen/stdbool.h
 
-CMDLINE_DEPS = $(DEFS_H_DEPS) $(src)/video.h
+CMDLINE_DEPS = $(DEFS_H_DEPS) $(BASEDIR)/$(src)/video.h
 
 RELOC_DEPS = $(DEFS_H_DEPS) \
 	     $(BASEDIR)/include/generated/autoconf.h \
@@ -14,7 +14,7 @@ RELOC_DEPS = $(DEFS_H_DEPS) \
 $(obj)/head.o: $(obj)/cmdline.S $(obj)/reloc.S
 
 $(obj)/cmdline.S: $(src)/cmdline.c $(CMDLINE_DEPS)
-	$(MAKE) -f build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
+	$(MAKE) -f $(BASEDIR)/$(src)/build32.mk -C $(obj) $(@F) CMDLINE_DEPS="$(CMDLINE_DEPS)"
 
 $(obj)/reloc.S: $(src)/reloc.c $(RELOC_DEPS)
-	$(MAKE) -f build32.mk -C $(obj) $(@F) RELOC_DEPS="$(RELOC_DEPS)"
+	$(MAKE) -f $(BASEDIR)/$(src)/build32.mk -C $(obj) $(@F) RELOC_DEPS="$(RELOC_DEPS)"
diff --git a/xen/include/Makefile b/xen/include/Makefile
index a969e76ddcad..b318bdaab094 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -61,7 +61,7 @@ $(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(BASEDIR)/
 	export PYTHON=$(PYTHON); \
 	while read what name; do \
 		$(SHELL) $(BASEDIR)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
-	done <$(patsubst compat/%,compat/.xlat/%,$(basename $<)).lst >$@.new
+	done <$(patsubst $(obj)/compat/%,$(obj)/compat/.xlat/%,$(basename $<)).lst >$@.new
 	mv -f $@.new $@
 
 .PRECIOUS: $(obj)/compat/.xlat/%.lst
@@ -86,8 +86,8 @@ PUBLIC_HEADERS := $(filter-out $(src)/public/arch-% $(src)/public/dom0_ops.h, $(
 PUBLIC_C99_HEADERS := $(src)/public/io/9pfs.h $(src)/public/io/pvcalls.h
 PUBLIC_ANSI_HEADERS := $(filter-out $(src)/public/%ctl.h $(src)/public/xsm/% $(src)/public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
 
-public/io/9pfs.h-prereq := string
-public/io/pvcalls.h-prereq := string
+$(src)/public/io/9pfs.h-prereq := string
+$(src)/public/io/pvcalls.h-prereq := string
 
 $(obj)/headers.chk: $(PUBLIC_ANSI_HEADERS) $(src)/Makefile
 	for i in $(filter %.h,$^); do \
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 7cb55b181dcb..788929cdca38 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -107,6 +107,12 @@ ld-option = $(call success,$(LD) -v $(1))
 # Usage:  EXTRA_CFLAGS += $(call cc-ifversion, -lt, 0402, -O1)
 cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || echo $(4))
 
+###
+# Shorthand for $(Q)$(MAKE) -f scripts/Makefile.build obj=
+# Usage:
+# $(Q)$(MAKE) $(build)=dir
+build := -f $(BASEDIR)/Rules.mk obj
+
 # Shorthand for $(MAKE) clean
 # Usage:
 # $(MAKE) $(clean) dir
diff --git a/xen/test/Makefile b/xen/test/Makefile
index 41e4d7bdb78b..080763c80766 100644
--- a/xen/test/Makefile
+++ b/xen/test/Makefile
@@ -1,13 +1,10 @@
 
-tests all: build
-
-
 ifneq ($(XEN_TARGET_ARCH),x86_32)
 # Xen 32-bit x86 hypervisor no longer supported, so has no test livepatches
 subdir-y += livepatch
 endif
 
-install build subtree-force-update uninstall: %:
+install uninstall: %:
 	set -e; for s in $(subdir-y); do \
-		$(MAKE) -f $(BASEDIR)/Rules.mk -C $$s $*; \
+		$(MAKE) $(build)=$$s $*; \
 	done
diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index e59245323e92..52ee58a08c5f 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -11,9 +11,6 @@ endif
 CODE_ADDR=$(shell nm --defined $(1) | grep $(2) | awk '{print "0x"$$1}')
 CODE_SZ=$(shell nm --defined -S $(1) | grep $(2) | awk '{ print "0x"$$2}')
 
-.PHONY: default
-build default: livepatch
-
 extra-y += xen_hello_world.livepatch
 xen_hello_world-objs := xen_hello_world_func.o xen_hello_world.o note.o xen_note.o modinfo.o
 $(obj)/xen_hello_world.o: $(obj)/config.h
@@ -156,9 +153,6 @@ LIVEPATCHES := $(filter %.livepatch,$(extra-y))
 
 LIVEPATCH_DEBUG_DIR ?= $(DEBUG_DIR)/xen-livepatch
 
-.PHONY: livepatch
-livepatch: $(LIVEPATCHES)
-
 install: $(addprefix $(obj)/,$(LIVEPATCHES))
 	$(INSTALL_DIR) $(DESTDIR)$(LIVEPATCH_DEBUG_DIR)
 	$(INSTALL_DATA) $(addprefix $(obj)/,$(LIVEPATCHES)) $(DESTDIR)$(LIVEPATCH_DEBUG_DIR)
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 3ea726d66f8b..267ca5c47437 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -42,7 +42,7 @@ $(obj)/flask-policy.S: $(BASEDIR)/tools/binfile FORCE
 	$(call if_changed,binfile)
 targets += flask-policy.S
 
-FLASK_BUILD_DIR := $(CURDIR)
+FLASK_BUILD_DIR := $(BASEDIR)/$(obj)
 POLICY_SRC := $(FLASK_BUILD_DIR)/xenpolicy-$(XEN_FULLVERSION)
 
 $(obj)/policy.bin: FORCE
diff --git a/xen/xsm/flask/ss/Makefile b/xen/xsm/flask/ss/Makefile
index d32b9e07138e..efd21f138df3 100644
--- a/xen/xsm/flask/ss/Makefile
+++ b/xen/xsm/flask/ss/Makefile
@@ -8,4 +8,4 @@ obj-y += services.o
 obj-y += conditional.o
 obj-y += mls.o
 
-CFLAGS-y += -I../include
+CFLAGS-y += -Ixsm/flask/include
-- 
Anthony PERARD


