Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD3645DB93
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:48:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231311.400350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6T-0001dS-Q2; Thu, 25 Nov 2021 13:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231311.400350; Thu, 25 Nov 2021 13:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF6S-0001Oc-SE; Thu, 25 Nov 2021 13:47:56 +0000
Received: by outflank-mailman (input) for mailman id 231311;
 Thu, 25 Nov 2021 13:47:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzp-0007NX-7d
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53c40e20-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:02 +0100 (CET)
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
X-Inumbo-ID: 53c40e20-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RXcp/FFcN5mYkoMn+8MsGpkECzNRJcUwjpBXUKglChM=;
  b=O7Q+8WaToGC+ZOHqHw+U2c1lNXHmRt6ZNm5SeSFAo8HyB1/o6C+xSKEg
   5kHUiWN6ub1pl09Wqpb1gOSZHJQ6r7bz28/snmHbLluzX0PGhjShz6qZT
   NhIfPOIf4lH8dkp4SKL6hIkHu5AAWl4h3+wmlrnni/s3giJAR0iLLu3bQ
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: F7hIUb88nLqpZhH7E9pCB6Umz3lhqqQrrBS7bZ6sIFHr3GaKXeW+bIMgmHsu50sPL8awl/Ednx
 Gy9Vk9VlTDCrsosmRVU+lEXvWPspzFW4pdeQrlBsdcSLB3lqQmQvPg2lZNXgJksYnuztOZY53H
 hGvBAnyu/5sxsgbrXCA8DYsBn+SZJOfqYhkxCwsSyl7JG/hljkO1qbV74JmtGyOlyU0RsqxtX1
 7mxKBjDJBISIu7hqAVwOLkCuIYYsm1pp0fQiLP9u4jxoV0rMad0ShpDm6oa/HC5gpPJjvApMoe
 f/N34FOgpblsX9JFgpvOa2Ok
X-SBRS: 5.1
X-MesageID: 58637842
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:d0H3WaoZjSP7dXIpEZErTehnHo1eBmKJYhIvgKrLsJaIsI4StFCzt
 garIBmHPf2OYmD8eoxwbNmwoE1Su8OBmoUwSAY6ryo1FStHopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd+4f5fs7Rh2Ncx2ILkW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbWVdD9uIbPLo+02aj98PQZDB6xAwbCSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFIoZpnFnyyCfFfs8SIrPa67L+cVZzHE7gcUm8fP2O
 ppHMmU/ME6ojxtnBVUtK4x5ms6SmUK4KzNZmFSznbs6/D2GpOB2+Oe0a4eEEjCQfu1OhVqRr
 G/C+2X/AzkZOcaZxD7D9Wij7sfQmQvrVYRUE6e3ntZhiUefwWE7AxQMWVy25/K+jyaWWc9bK
 kES0jojq+417kPDZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmLyKS1qN+7GMtzSwNCMJa2gYakc5oRAtuoe55ttp11SWE4glQPXdYsDJ9S/Y6
 hW3lG8hmbIohOUy8YGV2m39gjSVqc2cJuIq3Tn/UmWg5wJ/QYeqYY209FTWhcp9wJalokqp5
 yZdxZXHhAwaJdTUzXHWHr1RdF28z6/daGW0vLJ5I3U2G91BEVaHdJsY3jxxLVwB3i0sKW6wO
 x+7Ve+8CfZu0JqWgU1fP93Z5ycCl/GI+THZuhf8NIcmX3SJXFXblByCn3K40WH3i1QLmqoiI
 5qdesvEJS9EUvs4k2vmF7ZHj+5DKsUCKYT7H86T8vha+eDGOC79pUktbDNikdzVHIvb+V6Io
 r6zxuOByglFUf2WX8Uk2dV7ELz+FlBiXcqeg5UOLoare1M6cEl8W6656e5wIORNwvUK/tokC
 1ngAydw0kTkv3TbJG2iMzY7AF8Zdc0k9ixT0O1FFQvA5kXPlq7ztvpCLMVuIuF8nAGhpNYtJ
 8Q4lwy7KqwnYlz6F/41NPERdaRuK0amgxygJS2gbGRtdpJsXVWRqNTlYhHu5G8FCS/u7Zkyp
 Lip1wX6R5sfRls9UJaKOaz3l17h72IAnO9SXlfTJoUBckvb74U3eTf6ieU6Ip9QJEyblCeaz
 QufHTwRufLJ/90u6NDMiK3d99WpHuJyE1B0BW7e6brqZyDW8nD6md1LUfqSfCCbX2Txof3wa
 eJQxvD6EfsGgFcV7NYsT+c1lfozvoK9qaVbwwJoGGTwQ26qUr4wcGOb2cRvt7FWwuMLswWBR
 U/SqMJRPq+EOZ25HQdJdhYldOmKydodhiLWsaYuOEz/6SJ6oOiHXEFVM0XegSBRNuIoYoYsw
 ONns88K8Q2vzBEtN4/e3CxT8m2NKF0GUrkm6c5GUNO61FJzxwEQe4HYBw/3/IqLOodFPUQdK
 zOJgLbP2uZHzU3YfntvTXXA0IKxX3jVVMymGLPaG2m0pw==
IronPort-HdrOrdr: A9a23:1+5PE6wC1+W0qN5WwSUqKrPxqeskLtp133Aq2lEZdPULSL37qy
 n+poV56farslYssSkb6K690Wy7MAHhHO1OkPgs1NaZMjUO11HYVr2KgbGSpAEIXheOidK1tp
 0QPJSWaueAcGSS5PySiGLTfLdQpajizE2xv4vjJjVWPH1XgslbnkRE422gYzRLrXx9dOEE/e
 2nl7J6TlSbCBIqR/X+LH8JU9XcoZnumIj9aRALJzNP0njOsRqYrJT9HhSkwBEmSDVEza05/W
 WtqX242kyWiYD49vaQ7R6K03yY8OGRhudrNYipsIw4Oz/sggGnaMBIXKCDhik8pKWV5FMjgL
 D30lwd15AY0R7sV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGpunYIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuNoO5lbZvrH+9La1wQB4SqbpXTd
 WGNfusvsq+pGnqMEwwvQFUsZSRtzoIb1n2EXTrfKSuon1rdTtCvjslLfck7wM9HEhUcegB2w
 2NCNUaqFhvdL5RUUsvPpZZfSNAYla9DC4lDgqpUCLa/FZuAQOGl3ew2sRv2Mirf5MP0Zc5md
 DAXTpjxCkPknPVeISzNcdwg2XwqU2GLEPQ9v0=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58637842"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v8 15/47] build: hook kconfig into xen build system
Date: Thu, 25 Nov 2021 13:39:34 +0000
Message-ID: <20211125134006.1076646-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
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
index d38425234c6c..c26c44818916 100644
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
@@ -409,9 +420,10 @@ _clean:
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
index d32fec0ae037..f452a821cc86 100644
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
index 6be38301e835..79b42e1252d6 100644
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


