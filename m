Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346163F5CB8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171062.312356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCE-0008K8-5o; Tue, 24 Aug 2021 11:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171062.312356; Tue, 24 Aug 2021 11:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUCD-0007qM-MO; Tue, 24 Aug 2021 11:02:21 +0000
Received: by outflank-mailman (input) for mailman id 171062;
 Tue, 24 Aug 2021 11:02:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU3A-0003Ux-CM
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:53:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d36b5c4-04c9-11ec-a8c5-12813bfff9fa;
 Tue, 24 Aug 2021 10:51:57 +0000 (UTC)
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
X-Inumbo-ID: 4d36b5c4-04c9-11ec-a8c5-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wW/BDoTYIi98jKK4f0OOhTS6gPpff2lS/nVP1UXR2wY=;
  b=fszwGlOZic1uPlXrJDOPWt6x8pI0BGZ1J9bzPmMwSqoQ1S+MznHvrxUs
   /9YTetgfk3pkbqfY3MezOLr63tZIsgjD0rvZQ8wa3cLnYEfvRt/0J1VhF
   iol8ts86quTMqciq3NahCrQT1HC4Gyw/ovnxsgJgeqfRqXV9ZDyncd8xd
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: fQymMyhSu6fMPDLolqe1YislaJOwI/EgZchlmVuY6Wab/TP+cnxpPJ2lRwPtaOBxoeMo1YhjQl
 yvuGcnihz3OFywptmMXWTSgtQQWvU0sn+G14v9vtXhkNw/CoNEpkXdJwaPfEVpoRsoA9cfQOF/
 p7UAM7beDTDoygLjF16d3gE4Omom/WlX+9I99xkJ6w+x54C5UkwwX8jsenSf2nhKkeWjuiPRJS
 ojb5KM0x609N6kta08fvjC6t7rhYKJESVMouXPcsSQPeXyzZ/odDswHCqv5luGVpYi+0mBX8ft
 eS0fvyKbm5no6djwagup9CF2
X-SBRS: 5.1
X-MesageID: 51540934
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VsPt26EnnaZvrrPUpLqFVJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskd2ZJkh8erhBEDyewKkyXcV2/hbAV7MZniDhILFFu9fBOjZsnfd8k/Fh4lgPM
 5bGsATZ+EYZmIK7voSlTPIdurIt+P3kpxA692+815dCSVRL41w5QZwDQiWVmdsQhNdOJY/HJ
 2AouJaujuJYx0sH4iGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3y0ZTyhEzd4ZgC
 f4ek3Cl+ueWsOAu1/hPlzontdrcRzau5l+7fm3+4kow/PX+0OVjcpaKvm/VXsO0ZmSAR4R4a
 LxSlEbTolOAjrqDxuIiAqo1A/63Dk07Xj+jVeenHv4uMT8ACk3EsxbmOtiA23kAmcbzaVBOZ
 hwrhWkXltsfGL9tTW448KNWwBhl0Kyr3ZnmekPj2ZHWY9bbLNKt4QQ8E5cDZ9FRUvBmcgaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATlnFkyEkTwtAZgx47hdsAYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yEWDJSQKkChPmHb0mLtB0B5vpke+I3FwY3pDXRHU49upApH
 2aaiIkiYcbQTOQNeSemIZM7g3ABH6gWDiF8LAv26RE
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51540934"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 34/51] build: start building the tools with the main makefiles
Date: Tue, 24 Aug 2021 11:50:21 +0100
Message-ID: <20210824105038.1257926-35-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will make out-of-tree build easier.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile       |  8 ++++----
 xen/tools/Makefile | 17 ++---------------
 2 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index 0da08bc39930..8381ffd5d168 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -200,7 +200,7 @@ endif # root-make-done
 
 PHONY += tools_fixdep
 tools_fixdep:
-	$(MAKE) -C tools fixdep
+	$(MAKE) $(build)=tools tools/fixdep
 
 ifeq ($(config-build),y)
 # ===========================================================================
@@ -228,7 +228,7 @@ ifeq ($(need-config),y)
 # "tools_fixdep" which is a .PHONY target and would force make to call
 # "defconfig" again to update $(KCONFIG_CONFIG).
 tools/fixdep:
-	$(MAKE) -C tools fixdep
+	$(MAKE) $(build)=tools tools/fixdep
 
 # Allow people to just run `make` as before and not force them to configure
 $(KCONFIG_CONFIG): tools/fixdep
@@ -391,7 +391,7 @@ _debug:
 
 .PHONY: _clean
 _clean:
-	$(MAKE) -C tools clean
+	$(MAKE) $(clean) tools
 	$(MAKE) $(clean) include
 	$(MAKE) $(clean) common
 	$(MAKE) $(clean) drivers
@@ -420,7 +420,7 @@ $(TARGET).gz: $(TARGET)
 	mv $@.new $@
 
 $(TARGET): tools_fixdep FORCE
-	$(MAKE) -C tools
+	$(MAKE) $(build)=tools
 	$(MAKE) $(build)=. include/xen/compile.h
 	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
 		do test -r arch/$(TARGET_ARCH)/efi/$$f || \
diff --git a/xen/tools/Makefile b/xen/tools/Makefile
index 722f3664549d..a5078b7cb8de 100644
--- a/xen/tools/Makefile
+++ b/xen/tools/Makefile
@@ -1,15 +1,2 @@
-
-include $(XEN_ROOT)/Config.mk
-
-.PHONY: default
-default: symbols fixdep
-
-.PHONY: clean
-clean:
-	rm -f *.o symbols fixdep
-
-symbols: symbols.c
-	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
-
-fixdep: fixdep.c
-	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
+hostprogs-always-y += symbols
+hostprogs-always-y += fixdep
-- 
Anthony PERARD


