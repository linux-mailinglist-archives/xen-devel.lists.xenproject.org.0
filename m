Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5712245DB5F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:41:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231212.399992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzQ-0000Pv-T2; Thu, 25 Nov 2021 13:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231212.399992; Thu, 25 Nov 2021 13:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzQ-0000JX-KA; Thu, 25 Nov 2021 13:40:40 +0000
Received: by outflank-mailman (input) for mailman id 231212;
 Thu, 25 Nov 2021 13:40:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzP-0007NX-3f
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:40:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44b502de-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:40:37 +0100 (CET)
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
X-Inumbo-ID: 44b502de-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YHsU+dt4Hb55OzhCQGfUY0z4Y/tG3kZz9a0zDxOb69o=;
  b=Qp4FAdw98nb2Kr7xqHjWV9QPaq/b4bqIqs9ia6+vcrfpd28EsGyvOJdZ
   aaRoJg95c428qH316Y0a7P2v71cCWeEPMJpUnyJ4lHufvlFKx9JYC+gpl
   1tuPWX1Y2lYnE8yvpDQcsVkBp7fMgAFYzATI4gChjiJ8MvXriTAnvyXxX
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gj+pJuCaRo8jI7mHWRs5YyP3qwjNFqkKRqnSW/DRTxSpPROxIZ0Kdqy6Okr7rcYRXpX1JRm/bk
 ck5KxqdgRd5HHkK5eOHJu/lbg7GM/q5jqoiLy0+ijqdl6ziXGxzWAyW9nhKLWzySHOqXU6zM9w
 Purks5NF+u7U7f1VkaNGpKu4IehMwCVs04QglRv5mByZrEt8UAwswREb/HMXWjHl2YVFXpOCre
 zQ4rgh76FQvlIJSw701h9FCDHvWNjMnO2MPSV475eqsLsE9VdNdkWAXO9IDspke8c5bCwgU6dS
 IYHSHjuP3zLEIrbKT4f218Pl
X-SBRS: 5.1
X-MesageID: 58135402
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:6sphTKzJyYPNrpJAuCV6t+fKwSrEfRIJ4+MujC+fZmUNrF6WrkUHn
 TdLD26DOv6CZmbzct52a9uyoUkGuMLUndBqTAdkrCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAuLeNYYH1500s6wrRk2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt+F+8
 vNrmoLochskOI3xoMMASzV/KC4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY25AXRquCP
 5BxhTxHUUzCR1pqJg8rCIsDgLn0oWDvdz9jtwfAzUYwyzeKl1EguFT3C/LXZ9iLSMN9jkue4
 GXc8AzRGQoGPdaSzT6E9HOEheLVmy7/HoUIG9WQ6fpCkFCVgGsJB3U+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaFoRw0S9dWC/c96gyG1uzT+QnxLmoOQyNFadcmnNQrXjFs3
 ViM9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewc1QjEjxfb9+LovgxTvc+5EDbaZqeb6TGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MADv7s1oRiJqNItXxtAOFtaoowJOxFwHZ5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8Ahkiey+F0e5eIFcFh
 XM/XisLufdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3OxXPgD+8wBh9y/9uU
 Xt+TSpLJSxEYZmLMRLsH7tNuVPV7nxWKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cABbRVBmVMueg5EGKYa+zv9ORThJ5wn5muh6JeSIXs19y4/1w
 51KchMClQek2ySYcV7ih7IKQOqHYKuTZEkTZUQEVWtEEVB6CWp2xKtAJZYxY5c98+lvkax9Q
 /UfIp3SCfVTUDXXvT8aaMCl/oBlcR2qgyOIPjakP2djL8IxGVSR94+2ZBbr+QkPEjGz6Zk0r
 Yq/216JWpEEXQljUprbMar901OrsHEBs+tuRE+UcMJLcUDh/dEyeSz8h/M6Oe8WLhDHymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIZCbSGZzHQUm/w6Z6OX
 +QNwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 0/TqNlXPbKFZJHsHFILfVd3a+2C0bcfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s6JwM9giyqhs2KdLX3Clb+lOFImEET6h65IoRB5Xmi1Zzx1xPCXAG5vQaPH1bhw1wD3QX
IronPort-HdrOrdr: A9a23:fxc+VqjR1iBeIxQuG3ZEuOu8BXBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58135402"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 06/47] build: avoid re-executing the main Makefile by introducing build.mk
Date: Thu, 25 Nov 2021 13:39:25 +0000
Message-ID: <20211125134006.1076646-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
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
---

Notes:
    v8:
    - for $(main-targets) rules, use ; on a single line instead of adding a
      recipe with only @:
    - To include build.mk instead of Makefile, use a simpler expresion with
      $(firstword) and remove the use of $(mk-dir) var
    - removed an extra blank line, and one when updating $(targets)
    - reword patch description
    
    v7:
    - new patch

 xen/Makefile | 69 +++++-----------------------------------------------
 xen/Rules.mk |  6 ++---
 xen/build.mk | 60 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 67 deletions(-)
 create mode 100644 xen/build.mk

diff --git a/xen/Makefile b/xen/Makefile
index 2ad7da7ad67b..ed61f38dd335 100644
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
-	$(MAKE) -f Rules.mk _$@
+$(main-targets): %: _% ;
 else
+$(main-targets):
 	echo "*** Xen x86/32 target no longer supported!"
 endif
 
@@ -406,66 +409,6 @@ $(TARGET): FORCE
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
     ( find arch/$(TARGET_ARCH)/include -name '*.h' -print; \
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
index 000000000000..622e841c1cc0
--- /dev/null
+++ b/xen/build.mk
@@ -0,0 +1,60 @@
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


