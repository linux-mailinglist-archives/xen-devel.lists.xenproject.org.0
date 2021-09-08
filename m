Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FFA403E68
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 19:35:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182328.329850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO1Sd-00026m-KF; Wed, 08 Sep 2021 17:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182328.329850; Wed, 08 Sep 2021 17:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mO1Sd-00024Y-H8; Wed, 08 Sep 2021 17:34:11 +0000
Received: by outflank-mailman (input) for mailman id 182328;
 Wed, 08 Sep 2021 17:34:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hF9z=N6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mO1Sb-00024S-Jv
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 17:34:09 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8724946-10ca-11ec-b174-12813bfff9fa;
 Wed, 08 Sep 2021 17:34:08 +0000 (UTC)
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
X-Inumbo-ID: f8724946-10ca-11ec-b174-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631122448;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nqVi/a8THNB+9s/Zs2ox9A9xaFtj4KKqUP7zrMtJP/A=;
  b=CscAQ84fHrPZMPe2ba4gSUeTeA3/sL7nkt4EDfosNyltRVgqEDmEIUNV
   ceOnfRIUKqp8DlFXo8b2jxsOEQ0Qp8x+lz/sruuQ2ErgXb9LRgzr3mIHG
   KTG0GJzkZlpYsW3mKCXdj/Xzil5aO896+wvyxmGDerkV7zjYENamDm5Xd
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +DeGpNH8Ob149aRf5A3cX5+j0LIDBQtMr5ter6u3fEXv8XTipAfKDsAiRodQnNK/kv1Ww1LnjH
 78dC3q5MlUUnqyWGu8Od1e9vKerZc1/EvvfRrl1i3bwUfeD3Zfc9O2KNV/B3HYsorUaApYEdeA
 4q17Qa7zbP6MzB/jnUORKW2DQjX7mUT2qtqoW5tp20koHkhIwiJHzNmsRXANNCR1pIwJhR59ks
 I6//L8ws00dDUCSwgupNTxVU9M4S397ERm6xm6DNmDnFKgThn/Gi/gRoSlU6qNBDbqKMCYaH08
 kh3kZQF2O+YaLA4V9J30jOzq
X-SBRS: 5.1
X-MesageID: 54047157
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:sxhkfqujuGN39VpBLDREI11u7skDeNV00zEX/kB9WHVpmszxra
 GTdZMgpHnJYVcqKRYdcL+7Scq9qB/nmqKdgrNhWYtKPjOW2ldARbsKheCJrlHd8kXFh5dgPM
 xbE5SWZuefMbEDt7ee3DWF
X-IronPort-AV: E=Sophos;i="5.85,278,1624334400"; 
   d="scan'208";a="54047157"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/spec-ctrl: Print all AMD speculative hints/features
Date: Wed, 8 Sep 2021 18:33:52 +0100
Message-ID: <20210908173352.3627-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We already print Intel features that aren't yet implemented/used, so be
consistent on AMD too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

For reference, here are the bit layouts on different generations of AMD CPUs.

Fam15, and Zen1:
  (XEN)   Hardware hints:
  (XEN)   Hardware features: IBPB

Zen2:
  (XEN)   Hardware hints: IBRS_FAST IBRS_SAME_MODE
  (XEN)   Hardware features: IBPB IBRS STIBP SSBD

Zen3:
  (XEN)   Hardware hints: STIBP_ALWAYS IBRS_FAST IBRS_SAME_MODE
  (XEN)   Hardware features: IBPB IBRS STIBP SSBD PSFD
---
 xen/arch/x86/spec_ctrl.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index f0c67d41b85f..16d2a1d172b5 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -321,7 +321,7 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
      * Hardware read-only information, stating immunity to certain issues, or
      * suggestions of which mitigation to use.
      */
-    printk("  Hardware hints:%s%s%s%s%s%s%s\n",
+    printk("  Hardware hints:%s%s%s%s%s%s%s%s%s%s%s\n",
            (caps & ARCH_CAPS_RDCL_NO)                        ? " RDCL_NO"        : "",
            (caps & ARCH_CAPS_IBRS_ALL)                       ? " IBRS_ALL"       : "",
            (caps & ARCH_CAPS_RSBA)                           ? " RSBA"           : "",
@@ -329,16 +329,23 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (e8b  & cpufeat_mask(X86_FEATURE_SSB_NO)) ||
            (caps & ARCH_CAPS_SSB_NO)                         ? " SSB_NO"         : "",
            (caps & ARCH_CAPS_MDS_NO)                         ? " MDS_NO"         : "",
-           (caps & ARCH_CAPS_TAA_NO)                         ? " TAA_NO"         : "");
+           (caps & ARCH_CAPS_TAA_NO)                         ? " TAA_NO"         : "",
+           (e8b  & cpufeat_mask(X86_FEATURE_IBRS_ALWAYS))    ? " IBRS_ALWAYS"    : "",
+           (e8b  & cpufeat_mask(X86_FEATURE_STIBP_ALWAYS))   ? " STIBP_ALWAYS"   : "",
+           (e8b  & cpufeat_mask(X86_FEATURE_IBRS_FAST))      ? " IBRS_FAST"      : "",
+           (e8b  & cpufeat_mask(X86_FEATURE_IBRS_SAME_MODE)) ? " IBRS_SAME_MODE" : "");
 
     /* Hardware features which need driving to mitigate issues. */
-    printk("  Hardware features:%s%s%s%s%s%s%s%s%s\n",
+    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s\n",
            (e8b  & cpufeat_mask(X86_FEATURE_IBPB)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB))          ? " IBPB"           : "",
+           (e8b  & cpufeat_mask(X86_FEATURE_IBRS)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB))          ? " IBRS"           : "",
+           (e8b  & cpufeat_mask(X86_FEATURE_AMD_STIBP)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_STIBP))          ? " STIBP"          : "",
            (e8b  & cpufeat_mask(X86_FEATURE_AMD_SSBD)) ||
            (_7d0 & cpufeat_mask(X86_FEATURE_SSBD))           ? " SSBD"           : "",
+           (e8b  & cpufeat_mask(X86_FEATURE_PSFD))           ? " PSFD"           : "",
            (_7d0 & cpufeat_mask(X86_FEATURE_L1D_FLUSH))      ? " L1D_FLUSH"      : "",
            (_7d0 & cpufeat_mask(X86_FEATURE_MD_CLEAR))       ? " MD_CLEAR"       : "",
            (_7d0 & cpufeat_mask(X86_FEATURE_SRBDS_CTRL))     ? " SRBDS_CTRL"     : "",
-- 
2.11.0


