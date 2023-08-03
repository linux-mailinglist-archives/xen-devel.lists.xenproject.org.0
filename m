Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D31776E5A2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576204.902121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVY6-0000dz-WC; Thu, 03 Aug 2023 10:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576204.902121; Thu, 03 Aug 2023 10:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVY6-0000b6-St; Thu, 03 Aug 2023 10:27:18 +0000
Received: by outflank-mailman (input) for mailman id 576204;
 Thu, 03 Aug 2023 10:27:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVY6-0000aV-3w
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:27:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 513cee2c-31e8-11ee-8613-37d641c3527e;
 Thu, 03 Aug 2023 12:27:16 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 752E24EE0737;
 Thu,  3 Aug 2023 12:27:15 +0200 (CEST)
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
X-Inumbo-ID: 513cee2c-31e8-11ee-8613-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 09/13] x86/mm: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:24 +0200
Message-Id: <feae9122f4fc761f24bed0d015f30849f52449bd.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
states:
"The lowercase character 'l' shall not be used in a literal suffix".

Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

The changes in this patch are mechanical.

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/arch/x86/mm/p2m-pt.c  |  6 +++---
 xen/arch/x86/mm/p2m.c     | 20 ++++++++++----------
 xen/arch/x86/mm/physmap.c |  4 ++--
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 6d1bb5daad..b2b14746c1 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -552,7 +552,7 @@ static void check_entry(mfn_t mfn, p2m_type_t new, p2m_type_t old,
     if ( new == p2m_mmio_direct )
         ASSERT(!mfn_eq(mfn, INVALID_MFN) &&
                !rangeset_overlaps_range(mmio_ro_ranges, mfn_x(mfn),
-                                        mfn_x(mfn) + (1ul << order)));
+                                        mfn_x(mfn) + (1UL << order)));
     else if ( p2m_allows_invalid_mfn(new) || new == p2m_invalid ||
               new == p2m_mmio_dm )
         ASSERT(mfn_valid(mfn) || mfn_eq(mfn, INVALID_MFN));
@@ -745,9 +745,9 @@ p2m_pt_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
     if ( need_iommu_pt_sync(p2m->domain) &&
          (iommu_old_flags != iommu_pte_flags || old_mfn != mfn_x(mfn)) )
         rc = iommu_pte_flags
-             ? iommu_legacy_map(d, _dfn(gfn), mfn, 1ul << page_order,
+             ? iommu_legacy_map(d, _dfn(gfn), mfn, 1UL << page_order,
                                 iommu_pte_flags)
-             : iommu_legacy_unmap(d, _dfn(gfn), 1ul << page_order);
+             : iommu_legacy_unmap(d, _dfn(gfn), 1UL << page_order);
 
     /*
      * Free old intermediate tables if necessary.  This has to be the
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index f6df35767a..0983bd71d9 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -392,7 +392,7 @@ int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                   unsigned int page_order, p2m_type_t p2mt, p2m_access_t p2ma)
 {
     bool hap = hap_enabled(p2m->domain);
-    unsigned long todo = 1ul << page_order;
+    unsigned long todo = 1UL << page_order;
     int set_rc, rc = 0;
 
     ASSERT(gfn_locked_by_me(p2m, gfn));
@@ -401,10 +401,10 @@ int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
     {
         unsigned long fn_mask = (!mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0) |
                                 gfn_x(gfn) | todo;
-        unsigned int order = (!(fn_mask & ((1ul << PAGE_ORDER_1G) - 1)) &&
+        unsigned int order = (!(fn_mask & ((1UL << PAGE_ORDER_1G) - 1)) &&
                               hap && hap_has_1gb)
                              ? PAGE_ORDER_1G
-                             : (!(fn_mask & ((1ul << PAGE_ORDER_2M) - 1)) &&
+                             : (!(fn_mask & ((1UL << PAGE_ORDER_2M) - 1)) &&
                                 (!hap || hap_has_2mb))
                                ? PAGE_ORDER_2M : PAGE_ORDER_4K;
 
@@ -412,10 +412,10 @@ int p2m_set_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
         if ( set_rc )
             rc = set_rc;
 
-        gfn = gfn_add(gfn, 1ul << order);
+        gfn = gfn_add(gfn, 1UL << order);
         if ( !mfn_eq(mfn, INVALID_MFN) )
-            mfn = mfn_add(mfn, 1ul << order);
-        todo -= 1ul << order;
+            mfn = mfn_add(mfn, 1UL << order);
+        todo -= 1UL << order;
     }
 
     return rc;
@@ -1407,7 +1407,7 @@ void np2m_flush_base(struct vcpu *v, unsigned long np2m_base)
     struct p2m_domain *p2m;
     unsigned int i;
 
-    np2m_base &= ~(0xfffull);
+    np2m_base &= ~(0xfffULL);
 
     nestedp2m_lock(d);
     for ( i = 0; i < MAX_NESTEDP2M; i++ )
@@ -1456,7 +1456,7 @@ p2m_get_nestedp2m_locked(struct vcpu *v)
     bool needs_flush = true;
 
     /* Mask out low bits; this avoids collisions with P2M_BASE_EADDR */
-    np2m_base &= ~(0xfffull);
+    np2m_base &= ~(0xfffULL);
 
     if (nv->nv_flushp2m && nv->nv_p2m) {
         nv->nv_p2m = NULL;
@@ -1614,8 +1614,8 @@ unsigned long paging_gva_to_gfn(struct vcpu *v,
          * Sanity check that l1_gfn can be used properly as a 4K mapping, even
          * if it mapped by a nested superpage.
          */
-        ASSERT((l2_gfn & ((1ul << l1_page_order) - 1)) ==
-               (l1_gfn & ((1ul << l1_page_order) - 1)));
+        ASSERT((l2_gfn & ((1UL << l1_page_order) - 1)) ==
+               (l1_gfn & ((1UL << l1_page_order) - 1)));
 
         return l1_gfn;
     }
diff --git a/xen/arch/x86/mm/physmap.c b/xen/arch/x86/mm/physmap.c
index f1695e456e..098ccdf541 100644
--- a/xen/arch/x86/mm/physmap.c
+++ b/xen/arch/x86/mm/physmap.c
@@ -72,7 +72,7 @@ int set_identity_p2m_entry(struct domain *d, unsigned long gfn,
         if ( !is_iommu_enabled(d) )
             return 0;
         return iommu_legacy_map(d, _dfn(gfn), _mfn(gfn),
-                                1ul << PAGE_ORDER_4K,
+                                1UL << PAGE_ORDER_4K,
                                 p2m_access_to_iommu_flags(p2ma));
     }
 
@@ -85,7 +85,7 @@ int clear_identity_p2m_entry(struct domain *d, unsigned long gfn)
     {
         if ( !is_iommu_enabled(d) )
             return 0;
-        return iommu_legacy_unmap(d, _dfn(gfn), 1ul << PAGE_ORDER_4K);
+        return iommu_legacy_unmap(d, _dfn(gfn), 1UL << PAGE_ORDER_4K);
     }
 
     return p2m_remove_identity_entry(d, gfn);
-- 
2.34.1


