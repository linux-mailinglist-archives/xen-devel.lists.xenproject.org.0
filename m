Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D0F19BF38
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 12:21:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJwwQ-0000oi-JX; Thu, 02 Apr 2020 10:19:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8h32=5S=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jJwwO-0000o3-DI
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 10:19:16 +0000
X-Inumbo-ID: 646c96dd-74cb-11ea-bba1-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 646c96dd-74cb-11ea-bba1-12813bfff9fa;
 Thu, 02 Apr 2020 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585822751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Vam1QDmFn+vR0pBcHWu9YCMoeDedFnU5geNICv7MFCk=;
 b=fkiDtj+pCszF+ZpbwEYQkTSxTRBAyJo7vaGQQMLMKsabyvbIixL0ZuQ/
 b7kSnYKODe5u7VZAkttV6CvMZUuPHT2OJD4sapK/godl6DAepHLXy20HP
 NTe8z2oy45ox9k50jmU/+LomTxGJ6XPh01VC+PPnS8ftYPqRfzI5Mftro 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4PMnMFrvIGSYNQy/QsMzNhJ081TJtVr/ARxMVeRoI0wOaQknR8RRqnlfb3WSkXLIdVpDjPu6t9
 M7a+d4Gf6UmXaCrSD1IcUV1qnIGANOsdxTHIjng8bhcDpJfw2ulRhg55bAUyL1Hvt1Vc7lFlIg
 0IxciUbZV9fqx2LVBSKvjzfDAypY92Hqd1fFV54Hb7efOo1TQ/aDGKHQvPuQCXS1m2P+XFL7Oy
 vaLhBYI9jKAkEZTrJ9QI5tsIhlILE3gDcFpDELyc19QwrZIjBb8vpgeXY+eJQ3OK698HGe8R70
 eNI=
X-SBRS: 2.7
X-MesageID: 15380674
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,335,1580792400"; d="scan'208";a="15380674"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 2/5] x86/ucode: Drop ops->match_cpu()
Date: Thu, 2 Apr 2020 11:18:59 +0100
Message-ID: <20200402101902.28234-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200402101902.28234-1-andrew.cooper3@citrix.com>
References: <20200402101902.28234-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

It turns out there are no callers of the hook().  The only callers are the
local, which can easily be rearranged to use the appropriate internal helper.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/microcode/amd.c     |  8 +-------
 xen/arch/x86/cpu/microcode/intel.c   | 11 +----------
 xen/arch/x86/cpu/microcode/private.h |  6 ------
 3 files changed, 2 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index d4763ea776..c9656de55d 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -188,11 +188,6 @@ static enum microcode_match_result microcode_fits(
     return NEW_UCODE;
 }
 
-static bool match_cpu(const struct microcode_patch *patch)
-{
-    return patch && (microcode_fits(patch) == NEW_UCODE);
-}
-
 static void free_patch(struct microcode_patch *patch)
 {
     xfree(patch);
@@ -227,7 +222,7 @@ static int apply_microcode(const struct microcode_patch *patch)
     if ( !patch )
         return -ENOENT;
 
-    if ( !match_cpu(patch) )
+    if ( microcode_fits(patch) != NEW_UCODE )
         return -EINVAL;
 
     if ( check_final_patch_levels(sig) )
@@ -428,5 +423,4 @@ const struct microcode_ops amd_ucode_ops = {
 #endif
     .free_patch                       = free_patch,
     .compare_patch                    = compare_patch,
-    .match_cpu                        = match_cpu,
 };
diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index f1e64e188b..315fca9ff2 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -245,14 +245,6 @@ static enum microcode_match_result microcode_update_match(
     return mc->rev > cpu_sig->rev ? NEW_UCODE : OLD_UCODE;
 }
 
-static bool match_cpu(const struct microcode_patch *patch)
-{
-    if ( !patch )
-        return false;
-
-    return microcode_update_match(patch) == NEW_UCODE;
-}
-
 static void free_patch(struct microcode_patch *patch)
 {
     xfree(patch);
@@ -281,7 +273,7 @@ static int apply_microcode(const struct microcode_patch *patch)
     if ( !patch )
         return -ENOENT;
 
-    if ( !match_cpu(patch) )
+    if ( microcode_update_match(patch) != NEW_UCODE )
         return -EINVAL;
 
     /* write microcode via MSR 0x79 */
@@ -369,5 +361,4 @@ const struct microcode_ops intel_ucode_ops = {
     .apply_microcode                  = apply_microcode,
     .free_patch                       = free_patch,
     .compare_patch                    = compare_patch,
-    .match_cpu                        = match_cpu,
 };
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index df0d0852cd..d31bcf14b1 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -60,12 +60,6 @@ struct microcode_ops {
     void (*free_patch)(struct microcode_patch *patch);
 
     /*
-     * Is the microcode patch applicable for the current CPU, and newer than
-     * the currently running patch?
-     */
-    bool (*match_cpu)(const struct microcode_patch *patch);
-
-    /*
      * Given two patches, are they both applicable to the current CPU, and is
      * new a higher revision than old?
      */
-- 
2.11.0


