Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA9349B275
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:01:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260064.449109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZf-0007D2-Fk; Tue, 25 Jan 2022 11:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260064.449109; Tue, 25 Jan 2022 11:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJZf-0007Af-9i; Tue, 25 Jan 2022 11:01:19 +0000
Received: by outflank-mailman (input) for mailman id 260064;
 Tue, 25 Jan 2022 11:01:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJZd-0006t5-Gh
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:17 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c8b9c15-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:01:15 +0100 (CET)
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
X-Inumbo-ID: 1c8b9c15-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Odm0lfZwBUy94eq9s5SCq6XGFQedtmpRs+w27Wx2GA=;
  b=HNnczxAOKMU1jIcZwnyAiNlUrv2gffDFHyJ10wcEmWDYEZ2+Lp6NWgri
   1QpIL8gvHuEyiHW/Xv8FKxPkiw/6FkeCJmvaptzv1Tlaj7cCoNclOvWJ1
   FpZz99dSjdPcmX8WiPBDaonFjgV2LalQ7zuOya1dTXObKCjtA2UkLuidy
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: SYAv1syzqTicgirW53x02EjUY/SzyZ/HnsrTslbcGhtU3REhJDrcvryrB18JClFArmKX+qLNWY
 522hByYfEgZjwo+VbLbMP+Qz/lTSyV7JhnJ0NwCND4g6U1Ki2LQXiAPfU3eqppjxfJSdpziz19
 r8kvApXvpoBHIVNDn3kwHcBLqxxcX8ohy1BqGt34KAgCtweA0kFBs/23R4Dctn0FH2Yic5yLRJ
 GKGkQ+2NtP57gVoyijTzkt4PhM8BH0FwJQqYNyyE5bHpcfA7jFWvbHJ9QRDprO8azVZpNkEX3g
 8GXPX9nHvH3dh2YI/uWL3f10
X-SBRS: 5.2
X-MesageID: 62699709
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VdYf7a7UOwh31LiZ+LzRXAxRtMTAchMFZxGqfqrLsTDasY5as4F+v
 moeDW6GMqzYZ2ryfdwgaYSx/EwOsJKEzYdjG1c5+CwzHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2NMw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z8
 4hpscS0aD8VD4L8m7wTcgVKDBEuMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQR6iPN
 pVBOFKDajyZQwBCHUwOCKkMxti3nH/YKWVjgX+a8P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2m2orv/Cm2X8Qo16PL+l8v9nhnWDy2pVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWuFFaZrrO1lQ+DFhgWdWEjeT0bfVsKtoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNs1shDLNJcbBE/rQyARxoCI+CBmeMs
 3Ef8yR1xLBfVMrd/MBhrQhkIV1I2xpnGGCE6bKMN8N4n9hIx5JFVdoMiN2ZDBwxWvvogRezP
 CfuVfp5vfe/xkeCY65teJ6WAM8316XmHtmNfqmKMoEWPskuK1HWrXkGiausM4bFyhREfUYXY
 s/zTCpRJSxCVfQPIMSeGY/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjPHW/2dNNfDgicChqbbir+pc/XrPSfWJb9JQJVqW5LUUJIdI1xsy4V47go
 xmAZ6Ov4AOv3CKccVTTNCkLhXGGdc8XkE/X9BcEZT6As0XPq671hEvGX5doL7Qh6sJ5yvt4E
 6sMd8maW6wdQTXb4TUNK5L6qdU6JhisgAuPOQujYSQ+IME8F1CYpIe8c1u97jQKAwq2qdA6/
 ++q2DTETMdRXA9lFsvXNq6ilgvjoXgHletudELUOd0PKl70+Y1nJnWp3P86Ks0BMzvZwT6e2
 1rECBsUv7CV8YQ07MPIleaPqILwS7lyGU9THm/667eqNHaFojr/kNEYCOvRJGLTTmL5/qmmd
 N559fCkPa1VhktOvqp9D61vkfA06ezwquII1Q9jBnjKMQimU+syPnmc0MBTnaRR3bsF6xCuU
 0eC99QGa7WEPMTpTAwYKAY/N7nR0PgVnn/Z7OgvIVW87yhypeLVXUJXNhiKqSpcMLoqb991n
 bZ/4JYbu16llx4nEtealSQFpW2DI0sJX7gjqpxHUpTgjRAmyw0abJHRYsMsDEpjtzmY3pEWH
 wKp
IronPort-HdrOrdr: A9a23:GpNp26FPZfC91CaPpLqE1MeALOsnbusQ8zAXPidKOHhom62j5q
 WTdZsgpHzJYVoqOU3I+urvBEDjewK6yXcd2+B4V9qftWHdyQ2VxepZnOnfKlPbexEW39QtrJ
 uJLMNFY+EYd2IUsS9R2njBLz9a+rW6zJw=
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62699709"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v9 02/30] build: avoid re-executing the main Makefile by introducing build.mk
Date: Tue, 25 Jan 2022 11:00:35 +0000
Message-ID: <20220125110103.3527686-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Currently, the xen/Makefile is re-parsed several times: once to start
the build process, and several more time with Rules.mk including it.
This makes it difficult to work with a Makefile used for several
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
single dependency left from "Rules.mk": the variable $(TARGET), so its
assignement is moved to the main Makefile.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v9:
    - reviewed
    
    v8:
    - for $(main-targets) rules, use ; on a single line instead of adding a
      recipe with only @:
    - To include build.mk instead of Makefile, use a simpler expresion with
      $(firstword) and remove the use of $(mk-dir) var
    - removed an extra blank line, and one when updating $(targets)
    - reword patch description
    
    v7:
    - new patch

 xen/Makefile | 70 +++++-----------------------------------------------
 xen/Rules.mk |  6 ++---
 xen/build.mk | 61 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 69 insertions(+), 68 deletions(-)
 create mode 100644 xen/build.mk

diff --git a/xen/Makefile b/xen/Makefile
index f3ff03a7170e..fb37043d08e0 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -47,6 +47,8 @@ export KCONFIG_CONFIG ?= .config
 
 export CC CXX LD
 
+export TARGET := $(BASEDIR)/xen
+
 .PHONY: default
 default: build
 
@@ -293,11 +295,12 @@ export CFLAGS_UBSAN
 
 endif # need-config
 
-.PHONY: build install uninstall clean distclean MAP
-build install uninstall debug clean distclean MAP::
+main-targets := build install uninstall clean distclean MAP
+.PHONY: $(main-targets)
 ifneq ($(XEN_TARGET_ARCH),x86_32)
-	$(MAKE) -f Rules.mk MKRELOC=$(MKRELOC) _$@
+$(main-targets): %: _% ;
 else
+$(main-targets):
 	echo "*** Xen x86/32 target no longer supported!"
 endif
 
@@ -406,67 +409,6 @@ $(TARGET): FORCE
 	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) MKRELOC=$(MKRELOC) $@
 
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
-	cat .banner; \
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
-	$(if $(filter-out FORCE,$?),$(Q)rm -fv $@)
-	$(call if_changed,compile.h)
-
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
     ( find include -type f -name '*.h' -print; \
diff --git a/xen/Rules.mk b/xen/Rules.mk
index d21930a7bf71..7b8b9047cfd5 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -8,9 +8,6 @@
 include $(XEN_ROOT)/Config.mk
 include $(BASEDIR)/scripts/Kbuild.include
 
-
-TARGET := $(BASEDIR)/xen
-
 # Note that link order matters!
 ALL_OBJS-y               += $(BASEDIR)/common/built_in.o
 ALL_OBJS-y               += $(BASEDIR)/drivers/built_in.o
@@ -36,7 +33,8 @@ SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
                                             rodata.cst$(a)) \
                          $(foreach r,rel rel.ro,data.$(r).local)
 
-include Makefile
+# The filename build.mk has precedence over Makefile
+include $(firstword $(wildcard build.mk) Makefile)
 
 # Linking
 # ---------------------------------------------------------------------------
diff --git a/xen/build.mk b/xen/build.mk
new file mode 100644
index 000000000000..3d7a91df22d1
--- /dev/null
+++ b/xen/build.mk
@@ -0,0 +1,61 @@
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
+
+targets += .banner
+
+# Don't refresh this files during e.g., 'sudo make install'
+quiet_cmd_compile.h = UPD     $@
+define cmd_compile.h
+    if [ ! -r $@ -o -O $@ ]; then \
+	cat .banner; \
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
+	$(if $(filter-out FORCE,$?),$(Q)rm -fv $@)
+	$(call if_changed,compile.h)
+
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


