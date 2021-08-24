Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C31C63F5CB5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171056.312333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUC7-0006nu-OI; Tue, 24 Aug 2021 11:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171056.312333; Tue, 24 Aug 2021 11:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUC7-0006Zh-7i; Tue, 24 Aug 2021 11:02:15 +0000
Received: by outflank-mailman (input) for mailman id 171056;
 Tue, 24 Aug 2021 11:02:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU2M-0001EC-AW
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:52:10 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be739491-6fcf-47d3-924a-58cc87201d46;
 Tue, 24 Aug 2021 10:51:20 +0000 (UTC)
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
X-Inumbo-ID: be739491-6fcf-47d3-924a-58cc87201d46
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4K2WW2uFAO71Mw1Ci7VJHE6S1kjO2hGHCWlQ2ukScjo=;
  b=J4+2uQcfeNnESq08hNFzKzc9bNcencyAOCxfIsX1f1am37l1iZuwzqYI
   pB+7HDAl7vqCdCPB3v7gndIwe19psAJ11FHO7jCZHvop6wAmtZ2zRtVwW
   yKj13FCCvGH8asyMqyip3hwjOErg4PCzcnhy9Nu5krmnbaW0F5tmCvkUT
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: BECysvkXl+SLk8oroUW9xH1BtvgHaX6XgzpAPVRXqScfK3SmFuUXzOvEh6lVKYxFJx33tY3Lr4
 YKv6mcxpS5X9hPlkLTqzOHUKZTT5jmJVkVY8RLzP3jIumyBcOnYxwh4BBk6Zu03KitEislh6zD
 0n37lx45qoyQ4/oDOIAqSCGqF0IOAf4S/3k8b7Vw9ca7KR/Z0EzPt6trrndppci/OXCZOlCNEO
 Mpau9Nl+dPaTtOpYemAeUtF+xsmlNPrFTjm582FCYshN2W2p38rPxizgw1kuRPCWa/xTyJJscC
 G8oWNjC521hlbYsfSTPpjnxj
X-SBRS: 5.1
X-MesageID: 50772186
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:MlMACa+0nqzPz1J3W4luk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="50772186"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 16/51] build: generate "include/xen/compile.h" with if_changed
Date: Tue, 24 Aug 2021 11:50:03 +0100
Message-ID: <20210824105038.1257926-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will avoid regenerating "compile.h" if the content hasn't changed.

As it's currently the case, the file isn't regenerated during `sudo
make install` if it exist and does belong to a different user, thus we
can remove the target "delete-unfresh-files". Target "$(TARGET)" still
need a phony dependency, so add "FORCE".

Use "$(dot-target).tmp" as temporary file as this is already cover by
".*.tmp" partern in ".gitconfig".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v7:
    - Use $(if_changed,) instead of importing a new macro from Linux
      (filechk).
    - use $(dot-target).tmp as temporary file, that way is hiden, and
      already cover by .gitignore via ".*.tmp". (filechk was doing the same)
    - update .gitignore.

 .gitignore   |  1 -
 xen/Makefile | 34 +++++++++++++++++-----------------
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/.gitignore b/.gitignore
index bc964663d25c..59a22d1685e2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -332,7 +332,6 @@ xen/include/compat/*
 xen/include/config/
 xen/include/generated/
 xen/include/public/public
-xen/include/xen/*.new
 xen/include/xen/acm_policy.h
 xen/include/xen/compile.h
 xen/include/xen/lib/x86/cpuid-autogen.h
diff --git a/xen/Makefile b/xen/Makefile
index da1b8ddb97ff..b408d35b4af0 100644
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
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
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
 	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
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
@@ -413,9 +405,11 @@ endef
 	$(call if_changed,banner)
 targets += .banner
 
-# compile.h contains dynamic build info. Rebuilt on every 'make' invocation.
-include/xen/compile.h: include/xen/compile.h.in .banner
-	@sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
+# Don't refresh this files during e.g., 'sudo make install'
+quiet_cmd_compile.h = UPD     $@
+define cmd_compile.h
+    if [ ! -r $@ -o -O $@ ]; then \
+	sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
 	    -e 's/@@time@@/$(XEN_BUILD_TIME)/g' \
 	    -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
 	    -e 's/@@domain@@/$(XEN_DOMAIN)/g' \
@@ -425,10 +419,16 @@ include/xen/compile.h: include/xen/compile.h.in .banner
 	    -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
 	    -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
 	    -e 's!@@changeset@@!$(shell tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
-	    < include/xen/compile.h.in > $@.new
+	    < $< > $(dot-target).tmp; \
+	sed -rf tools/process-banner.sed < .banner >> $(dot-target).tmp; \
+	mv -f $(dot-target).tmp $@; \
+    fi
+endef
+
+include/xen/compile.h: include/xen/compile.h.in .banner FORCE
 	@cat .banner
-	@sed -rf tools/process-banner.sed < .banner >> $@.new
-	@mv -f $@.new $@
+	$(call if_changed,compile.h)
+targets += include/xen/compile.h
 
 asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
 	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
-- 
Anthony PERARD


