Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D1E3B92FB
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148726.274993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPm-000624-4c; Thu, 01 Jul 2021 14:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148726.274993; Thu, 01 Jul 2021 14:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPl-0005ye-PT; Thu, 01 Jul 2021 14:11:37 +0000
Received: by outflank-mailman (input) for mailman id 148726;
 Thu, 01 Jul 2021 14:11:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxPb-0005F9-Kl
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:11:27 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24f283d7-da76-11eb-8328-12813bfff9fa;
 Thu, 01 Jul 2021 14:10:53 +0000 (UTC)
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
X-Inumbo-ID: 24f283d7-da76-11eb-8328-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HKKAaSAElL9br6IexbYT6ScUQSIaudpvDa7uCaCfemU=;
  b=M4n8wD+ugtQ8U61VBR2T5tZYuntbk2Yggx3x/rh4wKJzmw51/UY3ZMVr
   DQnag2aARDNisgYDuiXlRqmchYC/qZxCkGLv7xq66MSTbha2vhaAd6Z4o
   xmRnJMLpbkQt+uC4p44557eWwBEMQfHsX2ttLzm0uJaZ7P+BwVpaxqs3Q
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: c1g5C7KdNCNvpUtARA66zPxQUkkAdOp4jynR3zRqXL/E2Pj/rbHwP7Iv3z2mgxMIr1fd+laPTd
 sznJd1GPoWlhW+uCcD6lfdVVF2kc70PCQYoUU+loHcP0Sv3QhN/Jq0t1K+E7vH5B/52DqavoRU
 n0Y6ZCnNj0K14ZxTcoZV/I9IO/wxfWKWP1+XE21ON5BRcpDhSrbF4FmoSa8AJFOqTLpGuZ/xJL
 KHQPkjPsQshE0VGdyV0vghnTA2mxqEBTxbjRmGpU7AktCT8b+PbJU+oZACjWuZcM07BJXNCohn
 bRk=
X-SBRS: 5.1
X-MesageID: 47755379
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:a8e4m69QadqLNsZAVJZuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47755379"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 20/31] build: generate "include/xen/compile.h" with filechk
Date: Thu, 1 Jul 2021 15:10:00 +0100
Message-ID: <20210701141011.785641-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will always try regenerate the content of compile.h, but if it
didn't change the file isn't updated.

Also, as it's currently the case, the file isn't regenerated during
`sudo make install` if it exist and does belong to a different user.

Thus, we can remove the target "delete-unfresh-files".
Target $(TARGET) still need a phony dependency, so add FORCE.

This patch imports the macro 'filechk' from Linux v5.12.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile               | 51 +++++++++++++++++++-------------------
 xen/scripts/Kbuild.include | 31 +++++++++++++++++++++++
 2 files changed, 56 insertions(+), 26 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 267ae77aef7a..4c4990a753df 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -351,7 +351,7 @@ _debug:
 	$(OBJDUMP) -D -S $(TARGET)-syms > $(TARGET).s
 
 .PHONY: _clean
-_clean: delete-unfresh-files
+_clean:
 	$(MAKE) -C tools clean
 	$(MAKE) $(clean) include
 	$(MAKE) $(clean) common
@@ -368,7 +368,7 @@ _clean: delete-unfresh-files
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
 	rm -f asm-offsets.s include/arch-*/asm/asm-offsets.h
-	rm -f .banner
+	rm -f .banner include/xen/compile.h
 
 .PHONY: _distclean
 _distclean: clean
@@ -378,7 +378,7 @@ $(TARGET).gz: $(TARGET)
 	gzip -n -f -9 < $< > $@.new
 	mv $@.new $@
 
-$(TARGET): delete-unfresh-files
+$(TARGET): FORCE
 	$(MAKE) -C tools
 	$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/compile.h
 	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
@@ -391,14 +391,6 @@ $(TARGET): delete-unfresh-files
 	$(MAKE) -f $(BASEDIR)/Rules.mk include/arch-$(TARGET_ARCH)/asm/asm-offsets.h
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
 
-# drivers/char/console.o contains static banner/compile info. Blow it away.
-# Don't refresh these files during e.g., 'sudo make install'
-.PHONY: delete-unfresh-files
-delete-unfresh-files:
-	@if [ ! -r include/xen/compile.h -o -O include/xen/compile.h ]; then \
-		rm -f include/xen/compile.h; \
-	fi
-
 quiet_cmd_banner = BANNER  $@
 define cmd_banner
     if which figlet >/dev/null 2>&1 ; then \
@@ -413,22 +405,29 @@ endef
 	$(call if_changed,banner)
 targets += .banner
 
-# compile.h contains dynamic build info. Rebuilt on every 'make' invocation.
-include/xen/compile.h: include/xen/compile.h.in .banner
-	@sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
-	    -e 's/@@time@@/$(XEN_BUILD_TIME)/g' \
-	    -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
-	    -e 's/@@domain@@/$(XEN_DOMAIN)/g' \
-	    -e 's/@@hostname@@/$(XEN_BUILD_HOST)/g' \
-	    -e 's!@@compiler@@!$(shell $(CC) $(CFLAGS) --version 2>&1 | head -1)!g' \
-	    -e 's/@@version@@/$(XEN_VERSION)/g' \
-	    -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
-	    -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
-	    -e 's!@@changeset@@!$(shell tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
-	    < include/xen/compile.h.in > $@.new
+# Don't refresh this files during e.g., 'sudo make install'
+define filechk_compile.h
+    if [ ! -r $@ -o -O $@ ]; then \
+    sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
+        -e 's/@@time@@/$(XEN_BUILD_TIME)/g' \
+        -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
+        -e 's/@@domain@@/$(XEN_DOMAIN)/g' \
+        -e 's/@@hostname@@/$(XEN_BUILD_HOST)/g' \
+        -e 's!@@compiler@@!$(shell $(CC) $(CFLAGS) --version 2>&1 | head -1)!g' \
+        -e 's/@@version@@/$(XEN_VERSION)/g' \
+        -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
+        -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
+        -e 's!@@changeset@@!$(shell tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
+	< $<; \
+    sed -rf tools/process-banner.sed < .banner; \
+    else \
+	cat $@; \
+    fi
+endef
+
+include/xen/compile.h: include/xen/compile.h.in .banner FORCE
 	@cat .banner
-	@sed -rf tools/process-banner.sed < .banner >> $@.new
-	@mv -f $@.new $@
+	$(call filechk,compile.h)
 
 asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
 	$(CC) $(filter-out -Wa$(comma)% -flto,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
diff --git a/xen/scripts/Kbuild.include b/xen/scripts/Kbuild.include
index 83c7e1457baa..838c9440f35e 100644
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -26,6 +26,37 @@ real-prereqs = $(filter-out $(PHONY), $^)
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
-- 
Anthony PERARD


