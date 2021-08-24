Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C64F3F5CB1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171028.312295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBy-0004bz-1v; Tue, 24 Aug 2021 11:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171028.312295; Tue, 24 Aug 2021 11:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBx-0004K9-65; Tue, 24 Aug 2021 11:02:05 +0000
Received: by outflank-mailman (input) for mailman id 171028;
 Tue, 24 Aug 2021 11:02:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU2g-0001EC-B7
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:30 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab13fdac-e976-4770-acbc-e1e8e94801f2;
 Tue, 24 Aug 2021 10:51:26 +0000 (UTC)
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
X-Inumbo-ID: ab13fdac-e976-4770-acbc-e1e8e94801f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802286;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cHly7piTV/09q3M8YN1XfYbGfLVMKH8oLzqmNMH8ZNY=;
  b=a+TZdo1IeOS8mRC/AjetJkrjkqxhFPhk3mQWfJdV+ze5ovsIBqZjzlSN
   XYzEEM2fO6sJFY9KTL/5lfXr8t+DhJnEvqJmrC8Cz8IIbiYkyVR8LHZY1
   GibxGjBH2rR1zLvKRWYzb/OXjxFErn8AFnfLcwlbP566GmrG4ACPlNn8A
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: wstmAh46vNhiyRQ5qTYzPeStKmCCkj/kOn7UK/rPf7/C1EXG/PxTVJE7tVkLLfd6lXFqBfNBNo
 1z7G8PpX7fNM5loNIwZedU+6aP7KVcrxDE20unZuRNmp0ZWLLdSrsM/SfAutNMXK9g7RFsrcL1
 RMHUx+JY8Y1AccTlp0EtiyOWWj587St5lNizo2vPVTiwiwxiVcvRVFcKT5O+oIcA1CLPPpKPzN
 WnFBisMXfNuTrKoK/KgdPnMdvN80ofQHP7EDZ/YLWq1N4nMld/o81cqK3U4l7NHqrU3fk/Fcs6
 MQV5FPWaiHqzvxWwTHbX01FG
X-SBRS: 5.1
X-MesageID: 50772192
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mqgKT6lAySSFoNzGzbshUcV3+lXpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="50772192"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 20/51] build: avoid re-executing the main Makefile by introducing build.mk
Date: Tue, 24 Aug 2021 11:50:07 +0100
Message-ID: <20210824105038.1257926-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Currently, the xen/Makefile is re-parsed several times: once to start
the build process, and several more time with Rules.mk including it.
This makes it difficult to reason with a Makefile used for several
purpose, and it actually slow down the build process.

So this patch introduce "build.mk" which Rules.mk will use when
present instead of the "Makefile" of a directory. (Linux's Kbuild
named that file "Kbuild".)

We have a few targets to move to "build.mk" identified by them been
build via "make -f Rules.mk" without changing directory.

As for the main targets like "build", we can have them depends on
there underscore-prefix targets like "_build" without having to use
"Rules.mk" while still retaining the check for unsupported
architecture. (Those main rules are changed to be single-colon as
there should only be a single recipe for them.)

With nearly everything needed to move to "build.mk" moved, there is a
single dependency left from "Rules.mk": $(TARGET), which is moved to
the main Makefile.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v7:
    - new patch

 xen/Makefile | 69 ++++++----------------------------------------------
 xen/Rules.mk |  6 ++---
 xen/build.mk | 58 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 65 deletions(-)
 create mode 100644 xen/build.mk

diff --git a/xen/Makefile b/xen/Makefile
index b408d35b4af0..7f100845cdd0 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -45,6 +45,8 @@ export KCONFIG_CONFIG ?= .config
 
 export CC CXX LD
 
+export TARGET := $(BASEDIR)/xen
+
 .PHONY: default
 default: build
 
@@ -279,11 +281,13 @@ export CFLAGS_UBSAN
 
 endif # need-config
 
-.PHONY: build install uninstall clean distclean MAP
-build install uninstall debug clean distclean MAP::
+main-targets := build install uninstall clean distclean MAP
+.PHONY: $(main-targets)
 ifneq ($(XEN_TARGET_ARCH),x86_32)
-	$(MAKE) -f Rules.mk _$@
+$(main-targets): %: _%
+	@:
 else
+$(main-targets):
 	echo "*** Xen x86/32 target no longer supported!"
 endif
 
@@ -391,65 +395,6 @@ $(TARGET): FORCE
 	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
 
-quiet_cmd_banner = BANNER  $@
-define cmd_banner
-    if which figlet >/dev/null 2>&1 ; then \
-	echo " Xen $(XEN_FULLVERSION)" | figlet -f $< > $@.tmp; \
-    else \
-	echo " Xen $(XEN_FULLVERSION)" > $@.tmp; \
-    fi; \
-    mv -f $@.tmp $@
-endef
-
-.banner: tools/xen.flf FORCE
-	$(call if_changed,banner)
-targets += .banner
-
-# Don't refresh this files during e.g., 'sudo make install'
-quiet_cmd_compile.h = UPD     $@
-define cmd_compile.h
-    if [ ! -r $@ -o -O $@ ]; then \
-	sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
-	    -e 's/@@time@@/$(XEN_BUILD_TIME)/g' \
-	    -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
-	    -e 's/@@domain@@/$(XEN_DOMAIN)/g' \
-	    -e 's/@@hostname@@/$(XEN_BUILD_HOST)/g' \
-	    -e 's!@@compiler@@!$(shell $(CC) $(CFLAGS) --version 2>&1 | head -1)!g' \
-	    -e 's/@@version@@/$(XEN_VERSION)/g' \
-	    -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
-	    -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
-	    -e 's!@@changeset@@!$(shell tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
-	    < $< > $(dot-target).tmp; \
-	sed -rf tools/process-banner.sed < .banner >> $(dot-target).tmp; \
-	mv -f $(dot-target).tmp $@; \
-    fi
-endef
-
-include/xen/compile.h: include/xen/compile.h.in .banner FORCE
-	@cat .banner
-	$(call if_changed,compile.h)
-targets += include/xen/compile.h
-
-asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
-	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
-	$(call move-if-changed,$@.new,$@)
-
-arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
-	@(set -e; \
-	  echo "/*"; \
-	  echo " * DO NOT MODIFY."; \
-	  echo " *"; \
-	  echo " * This file was auto-generated from $<"; \
-	  echo " *"; \
-	  echo " */"; \
-	  echo ""; \
-	  echo "#ifndef __ASM_OFFSETS_H__"; \
-	  echo "#define __ASM_OFFSETS_H__"; \
-	  echo ""; \
-	  sed -rne "/^[^#].*==>/{s:.*==>(.*)<==.*:\1:; s: [\$$#]: :; p;}"; \
-	  echo ""; \
-	  echo "#endif") <$< >$@
-
 SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
 define all_sources
     ( find arch/$(TARGET_ARCH)/include -name '*.h' -print; \
diff --git a/xen/Rules.mk b/xen/Rules.mk
index f449669475bd..a49ca4ceca39 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -9,8 +9,6 @@ include $(XEN_ROOT)/Config.mk
 include $(BASEDIR)/scripts/Kbuild.include
 
 
-TARGET := $(BASEDIR)/xen
-
 # Note that link order matters!
 ALL_OBJS-y               += $(BASEDIR)/common/built_in.o
 ALL_OBJS-y               += $(BASEDIR)/drivers/built_in.o
@@ -36,7 +34,9 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
                                             rodata.cst$(a)) \
                          $(foreach r,rel rel.ro,data.$(r).local)
 
-include Makefile
+# The filename build.mk has precedence over Makefile
+mk-dir := .
+include $(if $(wildcard $(mk-dir)/build.mk),$(mk-dir)/build.mk,$(mk-dir)/Makefile)
 
 # Linking
 # ---------------------------------------------------------------------------
diff --git a/xen/build.mk b/xen/build.mk
new file mode 100644
index 000000000000..369e1fe5c698
--- /dev/null
+++ b/xen/build.mk
@@ -0,0 +1,58 @@
+quiet_cmd_banner = BANNER  $@
+define cmd_banner
+    if which figlet >/dev/null 2>&1 ; then \
+	echo " Xen $(XEN_FULLVERSION)" | figlet -f $< > $@.tmp; \
+    else \
+	echo " Xen $(XEN_FULLVERSION)" > $@.tmp; \
+    fi; \
+    mv -f $@.tmp $@
+endef
+
+.banner: tools/xen.flf FORCE
+	$(call if_changed,banner)
+targets += .banner
+
+# Don't refresh this files during e.g., 'sudo make install'
+quiet_cmd_compile.h = UPD     $@
+define cmd_compile.h
+    if [ ! -r $@ -o -O $@ ]; then \
+	sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
+	    -e 's/@@time@@/$(XEN_BUILD_TIME)/g' \
+	    -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
+	    -e 's/@@domain@@/$(XEN_DOMAIN)/g' \
+	    -e 's/@@hostname@@/$(XEN_BUILD_HOST)/g' \
+	    -e 's!@@compiler@@!$(shell $(CC) $(CFLAGS) --version 2>&1 | head -1)!g' \
+	    -e 's/@@version@@/$(XEN_VERSION)/g' \
+	    -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
+	    -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
+	    -e 's!@@changeset@@!$(shell tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
+	    < $< > $(dot-target).tmp; \
+	sed -rf tools/process-banner.sed < .banner >> $(dot-target).tmp; \
+	mv -f $(dot-target).tmp $@; \
+    fi
+endef
+
+include/xen/compile.h: include/xen/compile.h.in .banner FORCE
+	@cat .banner
+	$(call if_changed,compile.h)
+targets += include/xen/compile.h
+
+asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
+	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
+	$(call move-if-changed,$@.new,$@)
+
+arch/$(TARGET_ARCH)/include/asm/asm-offsets.h: asm-offsets.s
+	@(set -e; \
+	  echo "/*"; \
+	  echo " * DO NOT MODIFY."; \
+	  echo " *"; \
+	  echo " * This file was auto-generated from $<"; \
+	  echo " *"; \
+	  echo " */"; \
+	  echo ""; \
+	  echo "#ifndef __ASM_OFFSETS_H__"; \
+	  echo "#define __ASM_OFFSETS_H__"; \
+	  echo ""; \
+	  sed -rne "/^[^#].*==>/{s:.*==>(.*)<==.*:\1:; s: [\$$#]: :; p;}"; \
+	  echo ""; \
+	  echo "#endif") <$< >$@
-- 
Anthony PERARD


