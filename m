Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6613F5CAC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171000.312224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBh-0000aQ-Tf; Tue, 24 Aug 2021 11:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171000.312224; Tue, 24 Aug 2021 11:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBg-0000Dz-Mg; Tue, 24 Aug 2021 11:01:48 +0000
Received: by outflank-mailman (input) for mailman id 171000;
 Tue, 24 Aug 2021 11:01:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU43-0003Ux-E1
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:53:55 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c0972c7-04c9-11ec-a8c6-12813bfff9fa;
 Tue, 24 Aug 2021 10:52:23 +0000 (UTC)
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
X-Inumbo-ID: 5c0972c7-04c9-11ec-a8c6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=35aTLDDxJLidrizomT+8cU8VdN54jKZMaixNrR0BilA=;
  b=bcOlprwX/+bomvWWpVtzpwEjB6ZFvTAytKmxSkUoZLDq8cftc+oQ5krN
   Ng3enpdh0eh58f7bZ6nT3RfJT2T0T8mO2iJMO+FkB93QCI/wJOcyIYhUl
   Igm2EkZ0zuwibDLGFyScBoXTxoVZoK7EcaZIgJcviLtJRTpziaheuWkhy
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: tPFce8HdmO6qKBEqtVkwgUYZlALVUviKlNGnsdtp/AGozADmlySbsidoGKL24REOEHkalwmqub
 0iLr3gRol7BGsPBCP/2cDK3ARR5/F4HRKpoKbECCEMCIcQVm7UHu03iDs1Bb9xJ7fJcZNDKQUa
 k3O/eyL9Qu/CkVaVJRiZbJ2dphgZA4v+MAFFd4JJ76OHqQqBMhu2mXP6AUvmu8pDIUsSD8QXD2
 Hvde1BF2rnAUZ154LhzlnfPVmFa0a3+V5zWok1WsMpvJU9lslmnMUFXT45jIA9Kh8sunsCBjGa
 +QIiu+ueXYl1WaDob/8mRYkW
X-SBRS: 5.1
X-MesageID: 51540950
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qoWxp6vS2Oi/ebFh6g/r4ksZ7skCyoMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJh5o6HnBEGBKUm9yXcH2/hpAV7CZnishILGFvAH0WKP+VPd8k7Fh6RgPM
 VbAs9D4bTLZDAX4voSizPIcOrIteP3lZxA8t2urUuFIzsKV4hQqyNCTiqLGEx/QwdLQbAjEo
 CH28ZBrz28PVwKc8WSHBA+LqT+juyOsKijTQ8NBhYh5gXLpyiv8qTGHx+R2Qpbey9TwI0l7X
 POn2XCl+qeWrCAu1HhPl3ontRrcejau5h+7Qu3+4oowwDX+0eVjUJaKvi/VX4O0aWSAR0R4a
 HxSl8bTr9OAjXqDyyISFLWqnPd+Sdr5Hn4xVCCh3z/5cT/WTIhEsJEwZlUax3D9iMbzadBOY
 9wrhakXqBsfGT9deXGlqn1fgAvklDxrWspkOYVgXAaWYwCaKVJpYha+E9OCp8PEC/z9YhiSY
 BVfYnhzecTdUnfY2HSv2FpztDpVnMvHg2eSkxHvsCOyTBZkH1w0kNdzs0CmXUL8o47VvB/lq
 35G7UtkKsLQt4dbKp7CutEScyrCnbVSRaJK26WKUSPLtBzB5sMke+E3FwR3pDVRHUl9upPpH
 3xaiIqiYdpQTOSNSSn5uw1zjndBH66QSngjtpD4pQRgMyNeIbW
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51540950"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [XEN PATCH v7 46/51] build: replace $(BASEDIR) by $(srctree)
Date: Tue, 24 Aug 2021 11:50:33 +0100
Message-ID: <20210824105038.1257926-47-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

$(srctree) is a better description for the source directory than
$(BASEDIR) that has been used for both source and build directory
(which where the same).

"clean" is still changing directory, so we need to use absolute path
for it.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Kconfig                 |  4 ++--
 xen/Makefile                |  7 +++----
 xen/Rules.mk                |  6 +++---
 xen/common/Makefile         |  2 +-
 xen/common/libfdt/Makefile  |  2 +-
 xen/include/Makefile        | 12 ++++++------
 xen/scripts/Kbuild.include  |  4 ++--
 xen/scripts/Kconfig.include |  2 +-
 xen/scripts/Makefile.clean  |  2 +-
 xen/xsm/flask/Makefile      |  2 +-
 10 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/xen/Kconfig b/xen/Kconfig
index bcbd2758e5d3..ac9a638d372e 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -14,14 +14,14 @@ config CC_IS_GCC
 
 config GCC_VERSION
 	int
-	default $(shell,$(BASEDIR)/scripts/gcc-version.sh $(CC))
+	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
 
 config CC_IS_CLANG
 	def_bool $(success,$(CC) --version | head -n 1 | grep -q clang)
 
 config CLANG_VERSION
 	int
-	default $(shell,$(BASEDIR)/scripts/clang-version.sh $(CC))
+	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
 
 # -fvisibility=hidden reduces -fpic cost, if it's available
 config CC_HAS_VISIBILITY_ATTRIBUTE
diff --git a/xen/Makefile b/xen/Makefile
index b09584e33f9c..1a288b87980a 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -17,8 +17,7 @@ export XEN_BUILD_HOST	?= $(shell hostname)
 PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
 export PYTHON		?= $(PYTHON_INTERPRETER)
 
-export BASEDIR := $(CURDIR)
-export XEN_ROOT := $(BASEDIR)/..
+export XEN_ROOT := $(CURDIR)/..
 
 srctree := .
 objtree := .
@@ -183,7 +182,7 @@ ifeq ($(TARGET_ARCH),x86)
 t1 = $(call as-insn,$(CC),".L0: .L1: .skip (.L1 - .L0)",,-no-integrated-as)
 
 # Check whether clang asm()-s support .include.
-t2 = $(call as-insn,$(CC) -I$(BASEDIR)/arch/x86/include,".include \"asm/asm-defns.h\"",,-no-integrated-as)
+t2 = $(call as-insn,$(CC) -I$(srctree)/arch/x86/include,".include \"asm/asm-defns.h\"",,-no-integrated-as)
 
 # Check whether clang keeps .macro-s between asm()-s:
 # https://bugs.llvm.org/show_bug.cgi?id=36110
@@ -311,7 +310,7 @@ ALL_OBJS-$(CONFIG_CRYPTO) += crypto/built_in.o
 
 ALL_LIBS-y                := lib/lib.a
 
-include $(BASEDIR)/arch/$(TARGET_ARCH)/arch.mk
+include $(srctree)/arch/$(TARGET_ARCH)/arch.mk
 
 export ALL_OBJS := $(ALL_OBJS-y)
 export ALL_LIBS := $(ALL_LIBS-y)
diff --git a/xen/Rules.mk b/xen/Rules.mk
index fae6b8918019..cb8b35ceb596 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -15,7 +15,7 @@ include $(XEN_ROOT)/Config.mk
 # Don't try to remake this file included by Config.mk.
 $(XEN_ROOT)/.config: ;
 
-include $(BASEDIR)/scripts/Kbuild.include
+include $(srctree)/scripts/Kbuild.include
 
 ifndef obj
 $(warning kbuild: Rules.mk is included improperly)
@@ -63,7 +63,7 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $< $@
 # binfile
 # use e.g. $(call if_changed,binfile,binary-file varname)
 quiet_cmd_binfile = BINFILE $@
-cmd_binfile = $(SHELL) $(BASEDIR)/tools/binfile $(BINFILE_FLAGS) $@ $(2)
+cmd_binfile = $(SHELL) $(srctree)/tools/binfile $(BINFILE_FLAGS) $@ $(2)
 
 # Figure out what we need to build from the various variables
 # ===========================================================================
@@ -182,7 +182,7 @@ cpp_flags = $(filter-out -Wa$(comma)% -flto,$(1))
 c_flags = -MMD -MP -MF $(depfile) $(XEN_CFLAGS)
 a_flags = -MMD -MP -MF $(depfile) $(XEN_AFLAGS)
 
-include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
+include $(srctree)/arch/$(TARGET_ARCH)/Rules.mk
 
 c_flags += $(_c_flags)
 a_flags += $(_c_flags)
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 8771c2775efb..db78b06f4a50 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -80,7 +80,7 @@ $(obj)/config.gz: $(CONF_FILE)
 
 $(obj)/config_data.o: $(obj)/config.gz
 
-$(obj)/config_data.S: $(BASEDIR)/tools/binfile FORCE
+$(obj)/config_data.S: $(srctree)/tools/binfile FORCE
 	$(call if_changed,binfile,$(obj)/config.gz xen_config_data)
 targets += config_data.S
 
diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 6708af12e583..75aaefa2e37f 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -6,7 +6,7 @@ OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
 obj-y += libfdt.o
 nocov-y += libfdt.o
 
-CFLAGS-y += -I$(BASEDIR)/include/xen/libfdt/
+CFLAGS-y += -I$(srctree)/include/xen/libfdt/
 
 $(obj)/libfdt.o: $(obj)/libfdt-temp.o FORCE
 	$(call if_changed,objcopy)
diff --git a/xen/include/Makefile b/xen/include/Makefile
index 0b72c129da69..f5241b70e7fa 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -42,22 +42,22 @@ endif
 .PHONY: all
 all: $(addprefix $(obj)/,$(headers-y))
 
-$(obj)/compat/%.h: $(obj)/compat/%.i $(src)/Makefile $(BASEDIR)/tools/compat-build-header.py
-	$(PYTHON) $(BASEDIR)/tools/compat-build-header.py <$< $(patsubst $(obj)/%,%,$@) >>$@.new; \
+$(obj)/compat/%.h: $(obj)/compat/%.i $(src)/Makefile $(srctree)/tools/compat-build-header.py
+	$(PYTHON) $(srctree)/tools/compat-build-header.py <$< $(patsubst $(obj)/%,%,$@) >>$@.new; \
 	mv -f $@.new $@
 
 $(obj)/compat/%.i: $(obj)/compat/%.c $(src)/Makefile
 	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
-$(obj)/compat/%.c: $(src)/public/%.h $(src)/xlat.lst $(src)/Makefile $(BASEDIR)/tools/compat-build-source.py
+$(obj)/compat/%.c: $(src)/public/%.h $(src)/xlat.lst $(src)/Makefile $(srctree)/tools/compat-build-source.py
 	mkdir -p $(@D)
-	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py $(srctree)/$(src)/xlat.lst <$< >$@.new
+	$(PYTHON) $(srctree)/tools/compat-build-source.py $(srctree)/$(src)/xlat.lst <$< >$@.new
 	mv -f $@.new $@
 
-$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(BASEDIR)/tools/get-fields.sh $(src)/Makefile
+$(obj)/compat/.xlat/%.h: $(obj)/compat/%.h $(obj)/compat/.xlat/%.lst $(srctree)/tools/get-fields.sh $(src)/Makefile
 	export PYTHON=$(PYTHON); \
 	while read what name; do \
-		$(SHELL) $(BASEDIR)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
+		$(SHELL) $(srctree)/tools/get-fields.sh "$$what" compat_$$name $< || exit $$?; \
 	done <$(patsubst $(obj)/compat/%,$(obj)/compat/.xlat/%,$(basename $<)).lst >$@.new
 	mv -f $@.new $@
 
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 3e436639da1c..81abe4b4aa55 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -93,12 +93,12 @@ cc-ifversion = $(shell [ $(CONFIG_GCC_VERSION)0 $(1) $(2)000 ] && echo $(3) || e
 # Shorthand for $(Q)$(MAKE) -f scripts/Makefile.build obj=
 # Usage:
 # $(Q)$(MAKE) $(build)=dir
-build := -f $(BASEDIR)/Rules.mk obj
+build := -f $(srctree)/Rules.mk obj
 
 # Shorthand for $(MAKE) clean
 # Usage:
 # $(MAKE) $(clean) dir
-clean := -f $(BASEDIR)/scripts/Makefile.clean clean -C
+clean := -f $(abs_srctree)/scripts/Makefile.clean clean -C
 
 # echo command.
 # Short version is used, if $(quiet) equals `quiet_', otherwise full one.
diff --git a/xen/scripts/Kconfig.include b/xen/scripts/Kconfig.include
index e1f13e17207e..389a690a127a 100644
--- a/xen/scripts/Kconfig.include
+++ b/xen/scripts/Kconfig.include
@@ -40,4 +40,4 @@ $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
 $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
 
 # gcc version including patch level
-gcc-version := $(shell,$(BASEDIR)/scripts/gcc-version.sh $(CC))
+gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index c2689d4af5fa..db1d1f918d42 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -8,7 +8,7 @@ src := $(obj)
 
 clean::
 
-include $(BASEDIR)/scripts/Kbuild.include
+include $(abs_srctree)/scripts/Kbuild.include
 
 include $(src)/Makefile
 
diff --git a/xen/xsm/flask/Makefile b/xen/xsm/flask/Makefile
index 56aed07e27fe..1da6de2867ae 100644
--- a/xen/xsm/flask/Makefile
+++ b/xen/xsm/flask/Makefile
@@ -36,7 +36,7 @@ obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
 $(obj)/flask-policy.o: $(obj)/policy.bin
 
 $(obj)/flask-policy.S: BINFILE_FLAGS := -i
-$(obj)/flask-policy.S: $(BASEDIR)/tools/binfile FORCE
+$(obj)/flask-policy.S: $(srctree)/tools/binfile FORCE
 	$(call if_changed,binfile,$(obj)/policy.bin xsm_flask_init_policy)
 targets += flask-policy.S
 
-- 
Anthony PERARD


