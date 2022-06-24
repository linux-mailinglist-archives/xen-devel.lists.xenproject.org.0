Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00994559E0B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355605.583377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lna-0005sT-Sk; Fri, 24 Jun 2022 16:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355605.583377; Fri, 24 Jun 2022 16:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lna-0005pE-Of; Fri, 24 Jun 2022 16:04:46 +0000
Received: by outflank-mailman (input) for mailman id 355605;
 Fri, 24 Jun 2022 16:04:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnY-0004qb-PE
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b5e355d-f3d7-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 18:04:43 +0200 (CEST)
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
X-Inumbo-ID: 5b5e355d-f3d7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e4dSMew7ThkfUT4VBhxHq8D2hkxwuVvIslum+Yj9ZTA=;
  b=Ks++WWr7Udo9du6BL8xg2CUni19gfCprMdkw0J0mYT+uvZQMZhsIBWdJ
   TlL0j1yaduo+0C2aFNPc3FExEs0wvoTh0OKYJFV4YWs9U2BpbKy5CnHTS
   tkh5wsTig3xsNcjUiXDtI2A6XVygvs/y9RgjIWEyH0utJH4QqKavaCQRM
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74208051
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4hcApa7sKFEclUjXW8oBQgxRtHHHchMFZxGqfqrLsTDasY5as4F+v
 moYXW2Ebv/cazb1eYsnO4y3801U6JWHzodmSFY6pS5mHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjX1vX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSvdgA2GbLlo9hecCNDMytaN61a55HYdC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5VFM2I/NEmZC/FJEkZPOZ4lzd6HvHn+US9ir36pp6sU7kGGmWSd15CyaYGIK7RmX/59gUKwt
 m/AuWPjDXkyJNGZjDaI7H+oruvOhj/gHpIfEqWi8fxni0HVwXYcYCD6TnPi/6P/0BTnHYsCd
 QpEoULCsJTe6mS0cd7ieAKRm0LHnSQHe9B0Ge0m9y+Sn/+8DxmiOoQUctJQQIV46ZFuHmFyi
 Q/hc8DBXmI27uDMIZ6J3vLN9G7pZ3BIRYMXTXVcJTbp9eUPt23aYvjnat94WJC4gdTucd0b6
 2Db9XNu71n/YCNi6klawbwkq2j1znQxZlRpjjg7p0r8hu+DWKarZpaz9X/Q5utaIYCSQzGp5
 SZZxZDGvblRUcnVy0Rhpdnh+pnzv55p1xWM6WOD4rF7r2j9k5JdVdo4DM5CyLdBbZ9fJG6Bj
 L77sgJN/p5DVEaXgVtMS9vpUawClPG4ffy8D6y8RoceM/BZKV7clAkzNBH44owYuBV1+U3JE
 czAKpjE4LdzIfkP8QdasM9HgOFymHxhlDiNLX05pjz+uYejiLeuYe9tGDOzgioRt8tofC29H
 w5jCva3
IronPort-HdrOrdr: A9a23:9UybOqnS8xO8b5jM/HG4hFOHxnDpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74208051"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 03/25] tools/examples: cleanup Makefile
Date: Fri, 24 Jun 2022 17:04:00 +0100
Message-ID: <20220624160422.53457-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Don't check if a target exist before installing it. For directory,
install doesn't complain, and for file it would prevent from updating
them. Also remove the existing loop and instead install all files with
a single call to $(INSTALL_DATA).

Remove XEN_CONFIGS-y which isn't used.

Remove "build" target.

Add an empty line after the first comment. The comment isn't about
$(XEN_READMES), it is about the makefile as a whole.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - remove existing loops in install targets and use a single call to
      $(INSTALL_DATA) to install multiple files.

 tools/examples/Makefile | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/tools/examples/Makefile b/tools/examples/Makefile
index 14e24f4cb3..c839bf5603 100644
--- a/tools/examples/Makefile
+++ b/tools/examples/Makefile
@@ -2,6 +2,7 @@ XEN_ROOT = $(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
 # Xen configuration dir and configs to go there.
+
 XEN_READMES = README
 
 XEN_CONFIGS += xlexample.hvm
@@ -10,14 +11,9 @@ XEN_CONFIGS += xlexample.pvhlinux
 XEN_CONFIGS += xl.conf
 XEN_CONFIGS += cpupool
 
-XEN_CONFIGS += $(XEN_CONFIGS-y)
-
 .PHONY: all
 all:
 
-.PHONY: build
-build:
-
 .PHONY: install
 install: all install-readmes install-configs
 
@@ -26,12 +22,8 @@ uninstall: uninstall-readmes uninstall-configs
 
 .PHONY: install-readmes
 install-readmes:
-	[ -d $(DESTDIR)$(XEN_CONFIG_DIR) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
-	set -e; for i in $(XEN_READMES); \
-	    do [ -e $(DESTDIR)$(XEN_CONFIG_DIR)/$$i ] || \
-	    $(INSTALL_DATA) $$i $(DESTDIR)$(XEN_CONFIG_DIR); \
-	done
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
+	$(INSTALL_DATA) $(XEN_READMES) $(DESTDIR)$(XEN_CONFIG_DIR)
 
 .PHONY: uninstall-readmes
 uninstall-readmes:
@@ -39,14 +31,9 @@ uninstall-readmes:
 
 .PHONY: install-configs
 install-configs: $(XEN_CONFIGS)
-	[ -d $(DESTDIR)$(XEN_CONFIG_DIR) ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
-	[ -d $(DESTDIR)$(XEN_CONFIG_DIR)/auto ] || \
-		$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)/auto
-	set -e; for i in $(XEN_CONFIGS); \
-	    do [ -e $(DESTDIR)$(XEN_CONFIG_DIR)/$$i ] || \
-	    $(INSTALL_DATA) $$i $(DESTDIR)$(XEN_CONFIG_DIR); \
-	done
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)
+	$(INSTALL_DIR) $(DESTDIR)$(XEN_CONFIG_DIR)/auto
+	$(INSTALL_DATA) $(XEN_CONFIGS) $(DESTDIR)$(XEN_CONFIG_DIR)
 
 .PHONY: uninstall-configs
 uninstall-configs:
-- 
Anthony PERARD


