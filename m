Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CDD3F5C9C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170965.312105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBK-0004Ne-0Z; Tue, 24 Aug 2021 11:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170965.312105; Tue, 24 Aug 2021 11:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBJ-0004Hn-Q9; Tue, 24 Aug 2021 11:01:25 +0000
Received: by outflank-mailman (input) for mailman id 170965;
 Tue, 24 Aug 2021 11:01:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU2l-0003Ux-BE
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:35 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48f60f1e-04c9-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:51:50 +0000 (UTC)
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
X-Inumbo-ID: 48f60f1e-04c9-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8C0xAdMUUfkJ37y514dbn4rwdZzvKCfmub6TXPDdPqE=;
  b=KxTPTE6Qb92z08PH3mjjNxD8A3R2uLtqGnmM/A+vs4LTXPXuxY5SKxCk
   yzBm0bwT+F1HqaarS1R6vD8qzczTS+uN+EF17c0D2NrvT16KZFfASjnRW
   oHgDVEWNIL6Y8tGSear9M+hQF7rzuRwT2HawEM0R5M5750lR/qUHgW2iD
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: zhf6Rgnp4MiaqAvZY4qkAEIxayiu1O1ZkOs98h5T3MxWkHVVJibf2yaDAmq61XI4aS5B/O77tZ
 8VwP2spuwcTQUEK0q8cryluO9rt0AalnF+SCmqHtTi8XteYZ4SVYKEg0qOI2RRJcrd0zb7gZA3
 sLHZk48w1/+iuA71aChzUAexRoUsonu8+SOZK0BMrYgSsY4jN6B5Ocxe1pQfZs7eMSFlhaKJGy
 /k8/WOMWs/YNKweZlU1A4A8NG6/z+EPPkiINZBLE/ved/MVzShwaAR7ynAX5MREJcgweKxWhaZ
 jGuVdTMgNrEbqWcgb9SzV3++
X-SBRS: 5.1
X-MesageID: 51540928
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:utxec6q07c76T4TACoUzwh8aV5uZL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6Ku90KnpewK+yXcH2/hqAV7CZnirhILMFu1fBOTZslrd8kHFl9K1kJ
 0QC5SWa+eAQmSS7/yKhjVQeuxIqLbozEnrv5am854Hd3AJV0gU1XYcNu/tKDwSeOApP/oEPa
 vZwvACiyureHwRYMj+LGICRfL/q9rCk4+jSQIaBjY8gTP+zA+A2frfKVy1zx0eWzRAzfMJ6m
 7eiTH04a2lrrWS1gLc7WnO9J5b8eGRiuerRfb8yfT9GA+czzpAV74RH4FqewpF591H3Wxa0u
 UkZS1QefibpUmhJ11d6iGdpjUImAxel0MKj2Xoz0cL6PaJOw4SGo5Pg5lUfQDe7FdltNZg0L
 hT12bcrJZPCwjc9R6Nr+Qg+Csa5XZcjEBS59L7tUYvGLf2qYUh37A37QdQCtMNDSj64IcoHK
 1nC9zd/u9fdRefY2rCtmdizdSwVjBrdy32CHQqq4iQyXxbjXp5x0wXyIgWmWoB7os0T91B6/
 7fOqplmblSRosdbL57Bu0GXcyrY1a9Ci7kISaXOxDqBasHM3XCp9r+56g0/vijfNgSwJ47iP
 36ISRlXK4JCjbT4Oi1rdB2Gzz2MRSAtAXWu7RjDsJCy8PBrZLQQF2+dGw=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51540928"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v7 30/51] build: hook kconfig into xen build system
Date: Tue, 24 Aug 2021 11:50:17 +0100
Message-ID: <20210824105038.1257926-31-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Now that xen's build system is very close to Linux's ones, we can hook
"Makefile.host" into Xen's build system, and we can build Kconfig with
that.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile                                 |  34 ++++--
 xen/Rules.mk                                 |  13 ++-
 xen/scripts/Kbuild.include                   |  31 ++++++
 xen/scripts/Makefile.clean                   |   9 ++
 xen/{tools/kconfig => scripts}/Makefile.host |   3 +
 xen/tools/kconfig/Makefile.kconfig           | 106 -------------------
 6 files changed, 78 insertions(+), 118 deletions(-)
 rename xen/{tools/kconfig => scripts}/Makefile.host (98%)
 delete mode 100644 xen/tools/kconfig/Makefile.kconfig

diff --git a/xen/Makefile b/xen/Makefile
index 1b5517b02a8c..0da08bc39930 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -33,6 +33,7 @@ ARCH=$(XEN_TARGET_ARCH)
 SRCARCH=$(shell echo $(ARCH) | \
           sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
               -e s'/riscv.*/riscv/g')
+export ARCH SRCARCH
 
 # Don't break if the build process wasn't called from the top level
 # we need XEN_TARGET_ARCH to generate the proper config
@@ -156,6 +157,13 @@ ifneq ($(filter %config,$(MAKECMDGOALS)),)
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
@@ -194,22 +202,19 @@ PHONY += tools_fixdep
 tools_fixdep:
 	$(MAKE) -C tools fixdep
 
-# Shorthand for kconfig
-kconfig = -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) HOSTCC="$(HOSTCC)" HOSTCXX="$(HOSTCXX)"
-
 ifeq ($(config-build),y)
 # ===========================================================================
 # *config targets only - make sure prerequisites are updated, and descend
 # in tools/kconfig to make the *config target
 
-config: FORCE
-	$(MAKE) $(kconfig) $@
+config: tools_fixdep FORCE
+	$(Q)$(MAKE) $(build)=tools/kconfig $@
 
 # Config.mk tries to include .config file, don't try to remake it
 %/.config: ;
 
-%config: FORCE
-	$(MAKE) $(kconfig) $@
+%config: tools_fixdep FORCE
+	$(Q)$(MAKE) $(build)=tools/kconfig $@
 
 else # !config-build
 
@@ -219,9 +224,15 @@ ifeq ($(need-config),y)
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
@@ -230,7 +241,7 @@ $(KCONFIG_CONFIG):
 # This exploits the 'multi-target pattern rule' trick.
 # The syncconfig should be executed only once to make all the targets.
 include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
-	$(MAKE) $(kconfig) syncconfig
+	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
 
 ifeq ($(CONFIG_DEBUG),y)
 CFLAGS += -O1
@@ -391,9 +402,10 @@ _clean:
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
index f1043a78a332..760ccff0e8f1 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -94,6 +94,13 @@ subdir-y        := $(addprefix $(obj)/,$(subdir-y))
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
 
@@ -272,7 +279,11 @@ intermediate_targets = $(foreach sfx, $(2), \
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
index aa3a8a1bd9e7..3e436639da1c 100644
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
index 36b7e7e92f93..156d6307cf83 100644
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
 clean:: $(subdir-all)
+ifneq ($(strip $(__clean-files)),)
+	rm -rf $(__clean-files)
+endif
+	@:
 
 # Descending
 # ---------------------------------------------------------------------------
diff --git a/xen/tools/kconfig/Makefile.host b/xen/scripts/Makefile.host
similarity index 98%
rename from xen/tools/kconfig/Makefile.host
rename to xen/scripts/Makefile.host
index 4c51c95d40f4..61c7bff7a9bb 100644
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


