Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314F63EEE8B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 16:31:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167908.306580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG076-0006wC-Cr; Tue, 17 Aug 2021 14:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167908.306580; Tue, 17 Aug 2021 14:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG076-0006tM-9E; Tue, 17 Aug 2021 14:30:48 +0000
Received: by outflank-mailman (input) for mailman id 167908;
 Tue, 17 Aug 2021 14:30:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSHW=NI=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mG075-0006rF-2I
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 14:30:47 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 800b47b0-f7c7-4287-b1f9-2fd43673fe40;
 Tue, 17 Aug 2021 14:30:46 +0000 (UTC)
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
X-Inumbo-ID: 800b47b0-f7c7-4287-b1f9-2fd43673fe40
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629210646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0F/eC+ZQL+tzTHQ9DEa02brpEmz+uk1auQTeRxAeWTQ=;
  b=ZaqyYAPSnT6AwBjOl8sPLtijE0cmcmL493E8Ttotu+Hz0rx45rPS/rFt
   hR0fYkRlCMXzicHu4wn50OucQC+kmJqTegSJP/f0t+RJULAJl5CA0qdvr
   OEla+K2TXk5KHzp73+OCGsvpnz6lkPQ0iyUzrfTntd8HKGq0EkWe3n5Ax
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NQjNzKlI58qAtC/9jdjXSfwGuIaBX7uJ5+Q/iURErrjBghTYvOLeEPmteJqJ5sRSuAtffFDVWz
 61mLjJ7l5tl3A8jka9xz6hEgP5j/Q44ipNsPSmxlqoFTDaGHshaY3aQlcRKeuR44V5ZD1Ce8gm
 D8iu2yDga1KbAOAUNIgdTymKwifSWQarJjBK0eRTDsjFes+0vtgxhWWUv3g10h3NrIi8RlZXWq
 9Gsx/6DdHo7eueKv8sCR511zVTd2RQxzrf/PA9VD7+US1l9kpSd0as0GuTePC64iNQzoh4TA3O
 c8V6EYAcxTPrFi6+Jsz1Fcx8
X-SBRS: 5.1
X-MesageID: 50666693
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:leWhmKDRkB9JeeXlHemW55DYdb4zR+YMi2TC1yhKKCC9Ffbo7/
 xG/c5rrCMc5wxhO03I9eruBEDEewK5yXcX2/h2AV7BZniFhILAFugLhuGOrwEIWReOkdK1vZ
 0QCJSWY+eRMbEVt6jHCXGDYrMd/OU=
X-IronPort-AV: E=Sophos;i="5.84,329,1620705600"; 
   d="scan'208";a="50666693"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] x86/spec-ctrl: Split the "Hardware features" diagnostic line
Date: Tue, 17 Aug 2021 15:30:04 +0100
Message-ID: <20210817143006.2821-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210817143006.2821-1-andrew.cooper3@citrix.com>
References: <20210817143006.2821-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Separate the read-only hints from the features requiring active actions on
Xen's behalf.

Also take the opportunity split the IBRS/IBPB and IBPB mess.  More features
with overlapping enumeration are on the way, and and it is not useful to split
them like this.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/spec_ctrl.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 739b7913ff86..9bf0fbf99813 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -317,23 +317,30 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
 
     printk("Speculative mitigation facilities:\n");
 
-    /* Hardware features which pertain to speculative mitigations. */
-    printk("  Hardware features:%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
-           (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB)) ? " IBRS/IBPB" : "",
-           (_7d0 & cpufeat_mask(X86_FEATURE_STIBP)) ? " STIBP"     : "",
-           (_7d0 & cpufeat_mask(X86_FEATURE_L1D_FLUSH)) ? " L1D_FLUSH" : "",
-           (_7d0 & cpufeat_mask(X86_FEATURE_SSBD))  ? " SSBD"      : "",
-           (_7d0 & cpufeat_mask(X86_FEATURE_MD_CLEAR)) ? " MD_CLEAR" : "",
-           (_7d0 & cpufeat_mask(X86_FEATURE_SRBDS_CTRL)) ? " SRBDS_CTRL" : "",
-           (e8b  & cpufeat_mask(X86_FEATURE_IBPB))  ? " IBPB"      : "",
-           (caps & ARCH_CAPS_IBRS_ALL)              ? " IBRS_ALL"  : "",
-           (caps & ARCH_CAPS_RDCL_NO)               ? " RDCL_NO"   : "",
-           (caps & ARCH_CAPS_RSBA)                  ? " RSBA"      : "",
-           (caps & ARCH_CAPS_SKIP_L1DFL)            ? " SKIP_L1DFL": "",
-           (caps & ARCH_CAPS_SSB_NO)                ? " SSB_NO"    : "",
-           (caps & ARCH_CAPS_MDS_NO)                ? " MDS_NO"    : "",
-           (caps & ARCH_CAPS_TSX_CTRL)              ? " TSX_CTRL"  : "",
-           (caps & ARCH_CAPS_TAA_NO)                ? " TAA_NO"    : "");
+    /*
+     * Hardware read-only information, stating immunity to certain issues, or
+     * suggestions of which mitigation to use.
+     */
+    printk("  Hardware hints:%s%s%s%s%s%s%s\n",
+           (caps & ARCH_CAPS_RDCL_NO)                        ? " RDCL_NO"        : "",
+           (caps & ARCH_CAPS_IBRS_ALL)                       ? " IBRS_ALL"       : "",
+           (caps & ARCH_CAPS_RSBA)                           ? " RSBA"           : "",
+           (caps & ARCH_CAPS_SKIP_L1DFL)                     ? " SKIP_L1DFL"     : "",
+           (caps & ARCH_CAPS_SSB_NO)                         ? " SSB_NO"         : "",
+           (caps & ARCH_CAPS_MDS_NO)                         ? " MDS_NO"         : "",
+           (caps & ARCH_CAPS_TAA_NO)                         ? " TAA_NO"         : "");
+
+    /* Hardware features which need driving to mitigate issues. */
+    printk("  Hardware features:%s%s%s%s%s%s%s%s\n",
+           (e8b  & cpufeat_mask(X86_FEATURE_IBPB)) ||
+           (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB))          ? " IBPB"           : "",
+           (_7d0 & cpufeat_mask(X86_FEATURE_IBRSB))          ? " IBRS"           : "",
+           (_7d0 & cpufeat_mask(X86_FEATURE_STIBP))          ? " STIBP"          : "",
+           (_7d0 & cpufeat_mask(X86_FEATURE_SSBD))           ? " SSBD"           : "",
+           (_7d0 & cpufeat_mask(X86_FEATURE_L1D_FLUSH))      ? " L1D_FLUSH"      : "",
+           (_7d0 & cpufeat_mask(X86_FEATURE_MD_CLEAR))       ? " MD_CLEAR"       : "",
+           (_7d0 & cpufeat_mask(X86_FEATURE_SRBDS_CTRL))     ? " SRBDS_CTRL"     : "",
+           (caps & ARCH_CAPS_TSX_CTRL)                       ? " TSX_CTRL"       : "");
 
     /* Compiled-in support which pertains to mitigations. */
     if ( IS_ENABLED(CONFIG_INDIRECT_THUNK) || IS_ENABLED(CONFIG_SHADOW_PAGING) )
-- 
2.11.0


