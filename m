Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1021BAA29
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 18:37:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT6k0-0005Bw-IS; Mon, 27 Apr 2020 16:36:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtrQ=6L=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jT6jz-0005Br-HO
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 16:36:19 +0000
X-Inumbo-ID: 370f49d8-88a5-11ea-b9cf-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 370f49d8-88a5-11ea-b9cf-bc764e2007e4;
 Mon, 27 Apr 2020 16:36:16 +0000 (UTC)
IronPort-SDR: 6aKooz1thBqvXDvwqwubCtsRfPA4ZJdjTh2JQkaKZZGZKF3Q80cPJEwg3x0mrJ1wi839j+W7pn
 SKWy4e45k6pA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 09:36:15 -0700
IronPort-SDR: fIxKDoxW3NEB5x0T+1W2eUbk66JHIjak0g21kHPa7AFHzxGqpCiPR93bd1TRSH7U+PAEforAfx
 MAAfaMbbD5lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,324,1583222400"; d="scan'208";a="247457283"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.135.4.141])
 by fmsmga007.fm.intel.com with ESMTP; 27 Apr 2020 09:36:14 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] mem_sharing: map shared_info page to same gfn during fork
Date: Mon, 27 Apr 2020 09:36:05 -0700
Message-Id: <08d022bbca06c59624817ac9e23ddcb288121763.1588004969.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

During a VM fork we copy the shared_info page; however, we also need to ensure
that the page is mapped into the same GFN in the fork as its in the parent.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
Suggested-by: Roger Pau Monne <roger.pau@citrix.com>
---
 xen/arch/x86/mm/mem_sharing.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 344a5bfb3d..acbf21b22c 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1656,6 +1656,7 @@ static void copy_tsc(struct domain *cd, struct domain *d)
 static int copy_special_pages(struct domain *cd, struct domain *d)
 {
     mfn_t new_mfn, old_mfn;
+    gfn_t old_gfn;
     struct p2m_domain *p2m = p2m_get_hostp2m(cd);
     static const unsigned int params[] =
     {
@@ -1701,6 +1702,34 @@ static int copy_special_pages(struct domain *cd, struct domain *d)
     new_mfn = _mfn(virt_to_mfn(cd->shared_info));
     copy_domain_page(new_mfn, old_mfn);
 
+    old_gfn = _gfn(get_gpfn_from_mfn(mfn_x(old_mfn)));
+
+    if ( !gfn_eq(old_gfn, INVALID_GFN) )
+    {
+        /* let's make sure shared_info is mapped to the same gfn */
+        gfn_t new_gfn = _gfn(get_gpfn_from_mfn(mfn_x(new_mfn)));
+
+        if ( !gfn_eq(new_gfn, INVALID_GFN) && !gfn_eq(old_gfn, new_gfn) )
+        {
+            /* if shared info is mapped to a different gfn just remove it */
+            rc = p2m->set_entry(p2m, new_gfn, INVALID_MFN, PAGE_ORDER_4K,
+                                p2m_invalid, p2m->default_access, -1);
+            if ( rc )
+                return rc;
+
+            new_gfn = INVALID_GFN;
+        }
+
+        if ( gfn_eq(new_gfn, INVALID_GFN) )
+        {
+            /* if shared info is not currently mapped then map it */
+            rc = p2m->set_entry(p2m, old_gfn, new_mfn, PAGE_ORDER_4K,
+                                p2m_ram_rw, p2m->default_access, -1);
+            if ( rc )
+                return rc;
+        }
+    }
+
     return 0;
 }
 
-- 
2.20.1


