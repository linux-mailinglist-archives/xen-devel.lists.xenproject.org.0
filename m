Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E341BC3AF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 17:29:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTSAd-0004e4-Vf; Tue, 28 Apr 2020 15:29:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jz34=6M=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1jTSAc-0004dz-JO
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 15:29:14 +0000
X-Inumbo-ID: 026b3d0c-8965-11ea-b9cf-bc764e2007e4
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 026b3d0c-8965-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 15:29:11 +0000 (UTC)
IronPort-SDR: EdMYaLnUHsftwJTNCVwDNzKpjjKDqJs94bQxQDIwTiV6JPJhyhJYeKTBU9tnwkngHNDZhoIUvd
 Q1aPO5MyoqHw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 08:29:10 -0700
IronPort-SDR: xj0EbWvHko3qZ+zrB/VnZT14E9RwkXTMaOZtUZ539XzXawhJoh+nXipBTLHQHjab549XZxzWQG
 srL6R4Yhue6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="302736438"
Received: from saborios-mobl3.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.213.167.78])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Apr 2020 08:29:09 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2] mem_sharing: map shared_info page to same gfn during fork
Date: Tue, 28 Apr 2020 08:29:00 -0700
Message-Id: <6497e71a791bbc17b1ace3f5f260bd61275b76ba.1588087596.git.tamas.lengyel@intel.com>
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
 xen/arch/x86/mm/mem_sharing.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 344a5bfb3d..a1dea8fedb 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1656,6 +1656,7 @@ static void copy_tsc(struct domain *cd, struct domain *d)
 static int copy_special_pages(struct domain *cd, struct domain *d)
 {
     mfn_t new_mfn, old_mfn;
+    gfn_t new_gfn, old_gfn;
     struct p2m_domain *p2m = p2m_get_hostp2m(cd);
     static const unsigned int params[] =
     {
@@ -1701,6 +1702,30 @@ static int copy_special_pages(struct domain *cd, struct domain *d)
     new_mfn = _mfn(virt_to_mfn(cd->shared_info));
     copy_domain_page(new_mfn, old_mfn);
 
+    old_gfn = _gfn(get_gpfn_from_mfn(mfn_x(old_mfn)));
+    new_gfn = _gfn(get_gpfn_from_mfn(mfn_x(new_mfn)));
+
+    if ( !gfn_eq(old_gfn, new_gfn) )
+    {
+        if ( !gfn_eq(new_gfn, INVALID_GFN) )
+        {
+            /* if shared_info is mapped to a different gfn just remove it */
+            rc = p2m->set_entry(p2m, new_gfn, INVALID_MFN, PAGE_ORDER_4K,
+                                p2m_invalid, p2m->default_access, -1);
+            if ( rc )
+                return rc;
+        }
+
+        if ( !gfn_eq(old_gfn, INVALID_GFN) )
+        {
+            /* now map it to the same gfn as the parent */
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


