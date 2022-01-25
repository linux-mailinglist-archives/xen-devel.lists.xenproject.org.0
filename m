Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF38149B2A3
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260101.449297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfn-0007yO-Ep; Tue, 25 Jan 2022 11:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260101.449297; Tue, 25 Jan 2022 11:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJfm-0007re-UA; Tue, 25 Jan 2022 11:07:38 +0000
Received: by outflank-mailman (input) for mailman id 260101;
 Tue, 25 Jan 2022 11:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJa3-0006Mn-Pk
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cb4b68b-7dce-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 12:01:42 +0100 (CET)
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
X-Inumbo-ID: 2cb4b68b-7dce-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108502;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XFCy/tbXHIj1KeQggXI+HH1Gihl0/hu0SfYLyTgAdc0=;
  b=OSYgn78swrfyV3Ys7dJI1KcZtEDp9uX1K5ChuXt8U2Y6daovADFtPq3h
   1bzhgnL3qbc0nu3S7JdbFrex+in04Pg3t0UinX7T9ajBOIooH8JTQVJAg
   dOzYfzGX0vCo09oycZic9IL+oliIyAyQ6KFEY6iim3+7nhYxTeO12qbOv
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: PCS8t+L22/7UiNHmoVYBXR+gqkM1Kx3BJWhysIk2Z8BhCxJl4ScX1FqFcd2pE7BDR6t8cObhAG
 YOQKHiHSDUKFktwDRycpAWrmK7P0b1Q5Y24L+/2IiQH7Jl4yIh2OAhHUIX7Tp5WizvsSchk+wX
 XvjqCBo3BUZ4wSRADXbEyB4s/tu9OTEReigZTSQS1CeNiOflatxo3NrY73DCPi2aY9QbfAweQJ
 LB3fw8C0M/c22kp+xc2WGppSt49Z0C7/LDdEygc5JFd4yAnFYrMdQqUC/6quyQPni/Gmb6OPJe
 GL3gVyI4cRCH7jbWtJSO9WL2
X-SBRS: 5.2
X-MesageID: 62618953
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hmfodqDG0hwGxRVW/6Dkw5YqxClBgxIJ4kV8jS/XYbTApDwk12NRn
 GYXCzvVO6neZGX3eIwnb9+18hwPvsTdnd5lQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En940087wobVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/hQSgpOha7
 5J2q7eXWBwIPPzhkr1EXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTQ+9whsMlPY/zMZkWoH1IxjDFF/c2B5vERs0m4PcGhmlp1pETRp4yY
 eIrUWZ3XC/tPyddO20MJJk9pffxv0fGJmgwRFW9+vNsvjm7IBZK+KP2LNPfd9iORMNUtkWVv
 GTL+yL+GB5yHMOb4SqI9DSrnOCntSjyQo4VGZWz/+Rmh1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHyOswMYWtFQO/Yn8wzLwa3Riy6bG2wFQzhpeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9I14rXhcvakw+/fLEsZoSjEPiRI86H/vg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxasYdO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGVb+Jei8AxkkfS+F1/ronxezP
 Cc/XisKvPdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3OxLLhzy8zxdywPBnU
 Xt+TSpKJSxGYUiA5GHuL9rxLJdxnnxurY8tbc6TI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDg5A
 P4EX/ZmPy53CbWkCgGOqNZ7BQlTcRATWM6qw+QKKL/rClc2SQkJVq6KqZt8KtMNokigvrqSl
 p1LchUGmAOXaLyuAVjiV02Pn5u2Dc8g9ipqZHJ1VbtqslB6CbuSAG4kX8NfVdEaGCZLlJaYl
 tEJJJeNBOphUDPC92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7DwhBnGRZcjRhh5CJqEYvyY0F7s72MWn/h/XhWUL4ALKlns6oVjNwf4kuQzf5MXMRzGyzbDj
 1SWDB4UqPPjuYgw9NWV16mIo53wS7l1H1ZAHnmd5rGzbHGI8m2myI5GceCJYTGCCz+kpPT8P
 b1YlqiuPucGkVBGt5tHP4xqla9utcHyo7J6zxh/GCmZZVqcFb49cGKN2tNCt/MRy+YB6xe2Q
 E+G5vJTJa6NZJH+CFcUKQcoMraD2PUTlmWA5Pg5Ohyntip+/b7BWkROJRiczidaKeItYo8ix
 O4gvu8Q6hC+1UV2YorX0HgM+jTeNGEEXoUmqooeUd3ihQccw11fZYDRV33t65aVZtQQakQnL
 1d4XkYZa2iwEqYaT0cOKA==
IronPort-HdrOrdr: A9a23:cafFba2IEc+3GgCr4HL71gqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62618953"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH v9 12/30] build: hook kconfig into xen build system
Date: Tue, 25 Jan 2022 11:00:45 +0000
Message-ID: <20220125110103.3527686-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Now that xen's build system is very close to Linux's ones, we can hook
"Makefile.host" into Xen's build system, and we can build Kconfig with
that.

"tools/kconfig/Makefile" now needs a workaround to not rebuild
"$(XEN_ROOT)/.config", as `make` tries the rules "%.config" which
fails with:
    tools/kconfig/Makefile:95: *** No configuration exists for this target on this architecture.  Stop.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v8:
    - reviewed
    - adjust Makefile.host to use the renamed macro "multi-depend".
    - move .config empty rules workaround into kconfig/Makefile (from Rules.mk)
      and merge the change of patch
            build: add an other explicite rules to not build $(XEN_ROOT)/.config
      into
            build: hook kconfig into xen build system

 xen/Makefile                                 |  34 ++++--
 xen/Rules.mk                                 |  13 ++-
 xen/scripts/Kbuild.include                   |  31 ++++++
 xen/scripts/Makefile.clean                   |  11 +-
 xen/{tools/kconfig => scripts}/Makefile.host |  11 +-
 xen/tools/kconfig/Makefile                   |   3 +
 xen/tools/kconfig/Makefile.kconfig           | 106 -------------------
 7 files changed, 86 insertions(+), 123 deletions(-)
 rename xen/{tools/kconfig => scripts}/Makefile.host (95%)
 delete mode 100644 xen/tools/kconfig/Makefile.kconfig

diff --git a/xen/Makefile b/xen/Makefile
index 3dc7b4da10fb..0705e67a9e7d 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -40,6 +40,7 @@ ARCH=$(XEN_TARGET_ARCH)
 SRCARCH=$(shell echo $(ARCH) | \
           sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
               -e s'/riscv.*/riscv/g')
+export ARCH SRCARCH
 
 # Don't break if the build process wasn't called from the top level
 # we need XEN_TARGET_ARCH to generate the proper config
@@ -163,6 +164,13 @@ ifneq ($(filter %config,$(MAKECMDGOALS)),)
     config-build := y
 endif
 
+export CONFIG_SHELL := $(SHELL)
+export YACC = $(if $(BISON),$(BISON),bison)
+export LEX = $(if $(FLEX),$(FLEX),flex)
+
+# Default file for 'make defconfig'.
+export KBUILD_DEFCONFIG := $(ARCH)_defconfig
+
 # CLANG_FLAGS needs to be calculated before calling Kconfig
 ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 CLANG_FLAGS :=
@@ -203,9 +211,6 @@ PHONY += tools_fixdep
 tools_fixdep:
 	$(MAKE) -C tools fixdep
 
-# Shorthand for kconfig
-kconfig = -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)"
-
 ifeq ($(config-build),y)
 # ===========================================================================
 # *config targets only - make sure prerequisites are updated, and descend
@@ -221,14 +226,14 @@ filechk_kconfig_allconfig = \
 .allconfig.tmp: FORCE
 	set -e; { $(call filechk_kconfig_allconfig); } > $@
 
-config: FORCE
-	$(MAKE) $(kconfig) $@
+config: tools_fixdep FORCE
+	$(Q)$(MAKE) $(build)=tools/kconfig $@
 
 # Config.mk tries to include .config file, don't try to remake it
 %/.config: ;
 
-%config: .allconfig.tmp FORCE
-	$(MAKE) $(kconfig) KCONFIG_ALLCONFIG=$< $@
+%config: .allconfig.tmp tools_fixdep FORCE
+	$(Q)$(MAKE) $(build)=tools/kconfig KCONFIG_ALLCONFIG=$< $@
 
 else # !config-build
 
@@ -238,9 +243,15 @@ ifeq ($(need-config),y)
 # changes are detected.
 -include include/config/auto.conf.cmd
 
+# This allows make to build fixdep before invoking defconfig. We can't use
+# "tools_fixdep" which is a .PHONY target and would force make to call
+# "defconfig" again to update $(KCONFIG_CONFIG).
+tools/fixdep:
+	$(MAKE) -C tools fixdep
+
 # Allow people to just run `make` as before and not force them to configure
-$(KCONFIG_CONFIG):
-	$(MAKE) $(kconfig) defconfig
+$(KCONFIG_CONFIG): tools/fixdep
+	$(Q)$(MAKE) $(build)=tools/kconfig defconfig
 
 # The actual configuration files used during the build are stored in
 # include/generated/ and include/config/. Update them if .config is newer than
@@ -249,7 +260,7 @@ $(KCONFIG_CONFIG):
 # This exploits the 'multi-target pattern rule' trick.
 # The syncconfig should be executed only once to make all the targets.
 include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
-	$(MAKE) $(kconfig) syncconfig
+	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
 
 ifeq ($(CONFIG_DEBUG),y)
 CFLAGS += -O1
@@ -406,9 +417,10 @@ _clean:
 	$(MAKE) $(clean) arch/riscv
 	$(MAKE) $(clean) arch/x86
 	$(MAKE) $(clean) test
-	$(MAKE) $(kconfig) clean
+	$(MAKE) $(clean) tools/kconfig
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
 		-o -name ".*.o.tmp" -o -name "*~" -o -name "core" \
+		-o -name '*.lex.c' -o -name '*.tab.[ch]' \
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
diff --git a/xen/Rules.mk b/xen/Rules.mk
index fea3f70cdb72..13c1943da97e 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -89,6 +89,13 @@ subdir-y        := $(addprefix $(obj)/,$(subdir-y))
 nocov-y         := $(addprefix $(obj)/,$(nocov-y))
 noubsan-y       := $(addprefix $(obj)/,$(noubsan-y))
 
+# Do not include hostprogs rules unless needed.
+# $(sort ...) is used here to remove duplicated words and excessive spaces.
+hostprogs-y := $(sort $(hostprogs-y))
+ifneq ($(hostprogs-y),)
+include scripts/Makefile.host
+endif
+
 # subdir-builtin may contain duplications. Use $(sort ...)
 subdir-builtin := $(sort $(filter %/built_in.o, $(obj-y)))
 
@@ -267,7 +274,11 @@ intermediate_targets = $(foreach sfx, $(2), \
 				$(patsubst %$(strip $(1)),%$(sfx), \
 					$(filter %$(strip $(1)), $(targets))))
 # %.init.o <- %.o
-targets += $(call intermediate_targets, .init.o, .o)
+# %.lex.o <- %.lex.c <- %.l
+# %.tab.o <- %.tab.[ch] <- %.y
+targets += $(call intermediate_targets, .init.o, .o) \
+	   $(call intermediate_targets, .lex.o, .lex.c) \
+	   $(call intermediate_targets, .tab.o, .tab.c .tab.h)
 
 # Build
 # ---------------------------------------------------------------------------
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 872adfb456c3..ed48fb39f1f1 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -25,6 +25,37 @@ real-prereqs = $(filter-out $(PHONY), $^)
 # Escape single quote for use in echo statements
 escsq = $(subst $(squote),'\$(squote)',$1)
 
+###
+# Easy method for doing a status message
+       kecho := :
+ quiet_kecho := echo
+silent_kecho := :
+kecho := $($(quiet)kecho)
+
+###
+# filechk is used to check if the content of a generated file is updated.
+# Sample usage:
+#
+# filechk_sample = echo $(KERNELRELEASE)
+# version.h: FORCE
+#	$(call filechk,sample)
+#
+# The rule defined shall write to stdout the content of the new file.
+# The existing file will be compared with the new one.
+# - If no file exist it is created
+# - If the content differ the new file is used
+# - If they are equal no change, and no timestamp update
+define filechk
+	$(Q)set -e;						\
+	mkdir -p $(dir $@);					\
+	trap "rm -f $(dot-target).tmp" EXIT;			\
+	{ $(filechk_$(1)); } > $(dot-target).tmp;		\
+	if [ ! -r $@ ] || ! cmp -s $@ $(dot-target).tmp; then	\
+		$(kecho) '  UPD     $@';			\
+		mv -f $(dot-target).tmp $@;			\
+	fi
+endef
+
 # as-insn: Check whether assembler supports an instruction.
 # Usage: cflags-y += $(call as-insn,CC FLAGS,"insn",option-yes,option-no)
 as-insn = $(if $(shell echo 'void _(void) { asm volatile ( $(2) ); }' \
diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index c3b0681611da..156d6307cf83 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -17,8 +17,17 @@ include $(src)/Makefile
 subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
               $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
 
+__clean-files := \
+    $(clean-files) $(hostprogs-y) $(hostprogs-)
+
+__clean-files := $(wildcard $(__clean-files))
+
 .PHONY: clean
-clean:: $(subdir-all) ;
+clean:: $(subdir-all)
+ifneq ($(strip $(__clean-files)),)
+	rm -rf $(__clean-files)
+endif
+	@:
 
 # Descending
 # ---------------------------------------------------------------------------
diff --git a/xen/tools/kconfig/Makefile.host b/xen/scripts/Makefile.host
similarity index 95%
rename from xen/tools/kconfig/Makefile.host
rename to xen/scripts/Makefile.host
index 4c51c95d40f4..8a85f94316bc 100644
--- a/xen/tools/kconfig/Makefile.host
+++ b/xen/scripts/Makefile.host
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# target with $(obj)/ and its suffix stripped
+target-stem = $(basename $(patsubst $(obj)/%,%,$@))
+
 # LEX
 # ---------------------------------------------------------------------------
 quiet_cmd_flex = LEX     $@
@@ -114,7 +117,7 @@ quiet_cmd_host-cmulti	= HOSTLD  $@
 			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
 $(host-cmulti): FORCE
 	$(call if_changed,host-cmulti)
-$(call multi_depend, $(host-cmulti), , -objs)
+$(call multi-depend, $(host-cmulti), , -objs)
 
 # Create .o file from a single .c file
 # host-cobjs -> .o
@@ -132,7 +135,7 @@ quiet_cmd_host-cxxmulti	= HOSTLD  $@
 			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem))
 $(host-cxxmulti): FORCE
 	$(call if_changed,host-cxxmulti)
-$(call multi_depend, $(host-cxxmulti), , -objs -cxxobjs)
+$(call multi-depend, $(host-cxxmulti), , -objs -cxxobjs)
 
 # Create .o file from a single .cc (C++) file
 quiet_cmd_host-cxxobjs	= HOSTCXX $@
@@ -165,7 +168,7 @@ quiet_cmd_host-cshlib	= HOSTLLD -shared $@
 			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem).so)
 $(host-cshlib): FORCE
 	$(call if_changed,host-cshlib)
-$(call multi_depend, $(host-cshlib), .so, -objs)
+$(call multi-depend, $(host-cshlib), .so, -objs)
 
 # Link a shared library, based on position independent .o files
 # *.o -> .so shared library (host-cxxshlib)
@@ -175,7 +178,7 @@ quiet_cmd_host-cxxshlib	= HOSTLLD -shared $@
 			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem).so)
 $(host-cxxshlib): FORCE
 	$(call if_changed,host-cxxshlib)
-$(call multi_depend, $(host-cxxshlib), .so, -objs)
+$(call multi-depend, $(host-cxxshlib), .so, -objs)
 
 targets += $(host-csingle)  $(host-cmulti) $(host-cobjs)\
 	   $(host-cxxmulti) $(host-cxxobjs) $(host-cshlib) $(host-cshobjs) $(host-cxxshlib) $(host-cxxshobjs)
diff --git a/xen/tools/kconfig/Makefile b/xen/tools/kconfig/Makefile
index f39521a0ed5b..b7b9a419ad59 100644
--- a/xen/tools/kconfig/Makefile
+++ b/xen/tools/kconfig/Makefile
@@ -91,6 +91,9 @@ endif
 
 configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/configs/$@)
 
+# Don't try to remake this file included by Config.mk.
+$(XEN_ROOT)/.config: ;
+
 %.config: $(obj)/conf
 	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
 	$(Q)$(CONFIG_SHELL) $(srctree)/tools/kconfig/merge_config.sh -m .config $(configfiles)
diff --git a/xen/tools/kconfig/Makefile.kconfig b/xen/tools/kconfig/Makefile.kconfig
deleted file mode 100644
index 799321ec4d07..000000000000
--- a/xen/tools/kconfig/Makefile.kconfig
+++ /dev/null
@@ -1,106 +0,0 @@
-# xen/tools/kconfig
-
-# default rule to do nothing
-all:
-
-# Xen doesn't have a silent build flag
-quiet :=
-Q :=
-kecho := :
-
-# eventually you'll want to do out of tree builds
-srctree := $(BASEDIR)
-objtree := $(srctree)
-src := tools/kconfig
-obj := $(src)
-
-# handle functions (most of these lifted from different Linux makefiles
-dot-target = $(dir $@).$(notdir $@)
-depfile = $(subst $(comma),,$(dot-target).d)
-basetarget = $(basename $(notdir $@))
-# target with $(obj)/ and its suffix stripped
-target-stem = $(basename $(patsubst $(obj)/%,%,$@))
-cmd = $(cmd_$(1))
-if_changed = $(cmd_$(1))
-if_changed_dep = $(cmd_$(1))
-
-###
-# filechk is used to check if the content of a generated file is updated.
-# Sample usage:
-#
-# filechk_sample = echo $(KERNELRELEASE)
-# version.h: FORCE
-#	$(call filechk,sample)
-#
-# The rule defined shall write to stdout the content of the new file.
-# The existing file will be compared with the new one.
-# - If no file exist it is created
-# - If the content differ the new file is used
-# - If they are equal no change, and no timestamp update
-# - stdin is piped in from the first prerequisite ($<) so one has
-#   to specify a valid file as first prerequisite (often the kbuild file)
-define filechk
-	$(Q)set -e;				\
-	mkdir -p $(dir $@);			\
-	{ $(filechk_$(1)); } > $@.tmp;		\
-	if [ -r $@ ] && cmp -s $@ $@.tmp; then	\
-		rm -f $@.tmp;			\
-	else					\
-		$(kecho) '  UPD     $@';	\
-		mv -f $@.tmp $@;		\
-	fi
-endef
-
-define multi_depend
-$(foreach m, $(notdir $1), \
-	$(eval $(obj)/$m: \
-	$(addprefix $(obj)/, $(foreach s, $3, $($(m:%$(strip $2)=%$(s)))))))
-endef
-
-# Set our default defconfig file
-KBUILD_DEFCONFIG := $(ARCH)_defconfig
-
-# provide our shell
-CONFIG_SHELL := $(SHELL)
-
-# provide the host compiler
-HOSTCC ?= gcc
-HOSTCXX ?= g++
-YACC = $(if $(BISON),$(BISON),bison)
-LEX = $(if $(FLEX),$(FLEX),flex)
-
-# force target
-PHONY += FORCE
-
-FORCE:
-
-# include the original Makefile and Makefile.host from Linux
-include $(src)/Makefile
-include $(src)/Makefile.host
-
-# Add intermediate targets:
-# When building objects with specific suffix patterns, add intermediate
-# targets that the final targets are derived from.
-intermediate_targets = $(foreach sfx, $(2), \
-				$(patsubst %$(strip $(1)),%$(sfx), \
-					$(filter %$(strip $(1)), $(targets))))
-
-# %.lex.o <- %.lex.c <- %.l
-# %.tab.o <- %.tab.[ch] <- %.y
-targets += $(call intermediate_targets, .lex.o, .lex.c) \
-	   $(call intermediate_targets, .tab.o, .tab.c .tab.h)
-
-# clean up rule
-clean-deps = $(foreach f,$(host-cobjs) $(host-cxxobjs),$(dir $f).$(notdir $f).d)
-clean-shipped = $(patsubst %_shipped,%,$(wildcard $(obj)/*_shipped))
-
-clean:
-	rm -rf $(clean-files)
-	rm -rf $(clean-deps)
-	rm -rf $(host-csingle) $(host-cmulti) $(host-cxxmulti) $(host-cobjs) $(host-cxxobjs)
-	rm -rf $(clean-shipped)
-
-$(obj)/zconf%: $(src)/zconf%_shipped
-	cp -f $< $@
-
-.PHONY: $(PHONY)
-- 
Anthony PERARD


