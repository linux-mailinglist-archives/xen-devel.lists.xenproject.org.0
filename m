Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB202993BC
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 18:26:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12500.32562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX6Fn-0004RU-Ab; Mon, 26 Oct 2020 17:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12500.32562; Mon, 26 Oct 2020 17:25:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX6Fn-0004Ql-5W; Mon, 26 Oct 2020 17:25:55 +0000
Received: by outflank-mailman (input) for mailman id 12500;
 Mon, 26 Oct 2020 17:25:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kX6Fm-0004NA-8Z
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:25:54 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 392e3e4d-20cc-4b4b-9c39-092efdd340f3;
 Mon, 26 Oct 2020 17:25:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kX6Fm-0004NA-8Z
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 17:25:54 +0000
X-Inumbo-ID: 392e3e4d-20cc-4b4b-9c39-092efdd340f3
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 392e3e4d-20cc-4b4b-9c39-092efdd340f3;
	Mon, 26 Oct 2020 17:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603733148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N4NLiVkpafLkQts7MJNqLznQ4pqesNjOindufP348ms=;
  b=RnPdwy9AUT3oMlWbDGsL5uhgMgtRPT6DpYUGHaropY2CMf45K0Nw+hNE
   NTZYgQO2ErwzMvRtkzVW+8Q+jZ3cl0yr4u3NjzgwsiX9k3mo9BqNVtwOa
   lIRR9szV+INyR3QZxLT4XdelX+yFPyjFFMAPiItd3bfl0IEDVB9a856sq
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: J99NVkgohU6w6HUzF9IbgBNlOWf42KScqzdOM8z/aI5qBup5FpJUuPGBNhU1t3/xRr6hft6CKk
 b19A6S88I6fttt4FHelpS8ers3deLh7BYL144+Up3wDy410uT1yP1NyX8JbkaIJxOm2HVTdyw2
 /Kxtp5OjDt1qM3OccRqE2xWszu6ObMx9neDN141JPTbN7YiENKXCHUQD5ghg+wjK19eX0W3+hP
 DOfUvbLVEzwqDwzcjWj4Ec/GlsB4m9zOs8LbN+JlFo7yuhXbnYlP7Xdf5h7xsYsmMkj+rn1YDd
 rjc=
X-SBRS: None
X-MesageID: 30048907
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,420,1596513600"; 
   d="scan'208";a="30048907"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH 2/3] x86/ucode/intel: Fix handling of microcode revision
Date: Mon, 26 Oct 2020 17:25:18 +0000
Message-ID: <20201026172519.17881-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201026172519.17881-1-andrew.cooper3@citrix.com>
References: <20201026172519.17881-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For Intel microcodes, the revision field is signed (as documented in the SDM)
and negative revisions are used for pre-production/test microcode (not
documented publicly anywhere I can spot).

Adjust the revision checking to match the algorithm presented here:

  https://software.intel.com/security-software-guidance/best-practices/microcode-update-guidance

This treats pre-production microcode as always applicable, but also production
microcode having higher precident than pre-production.  It is expected that
anyone using pre-production microcode knows what they are doing.

This is necessary to load production microcode on an SDP with pre-production
microcode embedded in firmware.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Juergen Gross <jgross@suse.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>

"signed" is somewhat of a problem.  The actual numbers only make sense as
sign-magnitude, and not as twos-compliement, which is why the rule is "any
debug microcode goes".

The actual upgrade/downgrade rules are quite complicated, but in general, any
change is permitted so long as the Security Version Number (embedded inside
the patch) doesn't go backwards.

---
 xen/arch/x86/cpu/microcode/intel.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index e1ccb5d232..5fa2821cdb 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -33,7 +33,7 @@
 
 struct microcode_patch {
     uint32_t hdrver;
-    uint32_t rev;
+    int32_t rev;
     uint16_t year;
     uint8_t  day;
     uint8_t  month;
@@ -222,12 +222,23 @@ static int microcode_sanity_check(const struct microcode_patch *patch)
     return 0;
 }
 
+/*
+ * Production microcode has a positive revision.  Pre-production microcode has
+ * a negative revision.
+ */
 static enum microcode_match_result compare_revisions(
-    uint32_t old_rev, uint32_t new_rev)
+    int32_t old_rev, int32_t new_rev)
 {
     if ( new_rev > old_rev )
         return NEW_UCODE;
 
+    /*
+     * Treat pre-production as always applicable - anyone using pre-production
+     * microcode knows what they are doing, and can keep any resulting pieces.
+     */
+    if ( new_rev < 0 )
+        return NEW_UCODE;
+
     return OLD_UCODE;
 }
 
-- 
2.11.0


