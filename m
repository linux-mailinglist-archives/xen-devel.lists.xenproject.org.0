Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70699265B6F
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 10:21:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGeIZ-0006kC-EW; Fri, 11 Sep 2020 08:20:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p+pG=CU=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kGeIY-0006hc-IS
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 08:20:46 +0000
X-Inumbo-ID: 2ef0509e-ea37-45a0-892d-0fe93e3bee82
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ef0509e-ea37-45a0-892d-0fe93e3bee82;
 Fri, 11 Sep 2020 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=c3W6BzUdEp/q001xl2vCV3jPE2gcfmRf27QFyhScWn4=; b=qnbgecyKhweSnfTl/6kPsluUMb
 CHwSmppgbllog0n6M+UVWI18JHT6xOoXQoEQnhuixhncHJqiR2RjstkrLZEXoATywD1Fbiqb0nkwP
 SqbdvHQWThMzfifXwJhR9zlFULCt/TmX4/FfocVTm4aO5/ILfXFdL8zL4v8KtaUJeIuA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGeIS-0002tS-1U; Fri, 11 Sep 2020 08:20:40 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGeIR-0006YQ-PT; Fri, 11 Sep 2020 08:20:39 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: [PATCH v8 4/8] iommu: make map and unmap take a page count,
 similar to flush
Date: Fri, 11 Sep 2020 09:20:28 +0100
Message-Id: <20200911082032.1466-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911082032.1466-1-paul@xen.org>
References: <20200911082032.1466-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

At the moment iommu_map() and iommu_unmap() take a page order rather than a
count, whereas iommu_iotlb_flush() takes a page count rather than an order.
This patch makes them consistent with each other, opting for a page count since
CPU page orders are not necessarily the same as those of an IOMMU.

NOTE: The 'page_count' parameter is also made an unsigned long in all the
      aforementioned functions.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jun Nakajima <jun.nakajima@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>

v8:
 - Fix IPMMU-VMSA code too

v7:
 - Fix ARM build

v6:
 - Fix missing conversion to unsigned long in AMD code
 - Fixed unconverted call to iommu_legacy_unmap() in x86/mm.c
 - s/1ul/1 in the grant table code

v5:
 - Re-worked to just use a page count, rather than both a count and an order

v2:
 - New in v2
---
 xen/arch/x86/mm.c                        |  8 ++++--
 xen/arch/x86/mm/p2m-ept.c                |  6 ++--
 xen/arch/x86/mm/p2m-pt.c                 |  4 +--
 xen/arch/x86/mm/p2m.c                    |  5 ++--
 xen/arch/x86/x86_64/mm.c                 |  4 +--
 xen/common/grant_table.c                 |  6 ++--
 xen/drivers/passthrough/amd/iommu.h      |  2 +-
 xen/drivers/passthrough/amd/iommu_map.c  |  4 +--
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  2 +-
 xen/drivers/passthrough/arm/smmu.c       |  2 +-
 xen/drivers/passthrough/iommu.c          | 35 +++++++++++-------------
 xen/drivers/passthrough/vtd/iommu.c      |  4 +--
 xen/drivers/passthrough/x86/iommu.c      |  2 +-
 xen/include/xen/iommu.h                  | 12 ++++----
 14 files changed, 48 insertions(+), 48 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 56bf7add2b..095422024a 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2422,7 +2422,7 @@ static int cleanup_page_mappings(struct page_info *page)
 
         if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
         {
-            int rc2 = iommu_legacy_unmap(d, _dfn(mfn), PAGE_ORDER_4K);
+            int rc2 = iommu_legacy_unmap(d, _dfn(mfn), 1u << PAGE_ORDER_4K);
 
             if ( !rc )
                 rc = rc2;
@@ -2949,9 +2949,11 @@ static int _get_page_type(struct page_info *page, unsigned long type,
             mfn_t mfn = page_to_mfn(page);
 
             if ( (x & PGT_type_mask) == PGT_writable_page )
-                rc = iommu_legacy_unmap(d, _dfn(mfn_x(mfn)), PAGE_ORDER_4K);
+                rc = iommu_legacy_unmap(d, _dfn(mfn_x(mfn)),
+                                        1ul << PAGE_ORDER_4K);
             else
-                rc = iommu_legacy_map(d, _dfn(mfn_x(mfn)), mfn, PAGE_ORDER_4K,
+                rc = iommu_legacy_map(d, _dfn(mfn_x(mfn)), mfn,
+                                      1ul << PAGE_ORDER_4K,
                                       IOMMUF_readable | IOMMUF_writable);
 
             if ( unlikely(rc) )
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index b8154a7ecc..12cf38f6eb 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -843,14 +843,14 @@ out:
          need_modify_vtd_table )
     {
         if ( iommu_use_hap_pt(d) )
-            rc = iommu_iotlb_flush(d, _dfn(gfn), (1u << order),
+            rc = iommu_iotlb_flush(d, _dfn(gfn), 1ul << order,
                                    (iommu_flags ? IOMMU_FLUSHF_added : 0) |
                                    (vtd_pte_present ? IOMMU_FLUSHF_modified
                                                     : 0));
         else if ( need_iommu_pt_sync(d) )
             rc = iommu_flags ?
-                iommu_legacy_map(d, _dfn(gfn), mfn, order, iommu_flags) :
-                iommu_legacy_unmap(d, _dfn(gfn), order);
+                iommu_legacy_map(d, _dfn(gfn), mfn, 1ul << order, iommu_flags) :
+                iommu_legacy_unmap(d, _dfn(gfn), 1ul << order);
     }
 
     unmap_domain_page(table);
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index badb26bc34..3af51be78e 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -679,9 +679,9 @@ p2m_pt_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
     if ( need_iommu_pt_sync(p2m->domain) &&
          (iommu_old_flags != iommu_pte_flags || old_mfn != mfn_x(mfn)) )
         rc = iommu_pte_flags
-             ? iommu_legacy_map(d, _dfn(gfn), mfn, page_order,
+             ? iommu_legacy_map(d, _dfn(gfn), mfn, 1ul << page_order,
                                 iommu_pte_flags)
-             : iommu_legacy_unmap(d, _dfn(gfn), page_order);
+             : iommu_legacy_unmap(d, _dfn(gfn), 1ul << page_order);
 
     /*
      * Free old intermediate tables if necessary.  This has to be the
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index db7bde0230..928344be30 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1352,7 +1352,8 @@ int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
     {
         if ( !is_iommu_enabled(d) )
             return 0;
-        return iommu_legacy_map(d, _dfn(gfn_l), _mfn(gfn_l), PAGE_ORDER_4K,
+        return iommu_legacy_map(d, _dfn(gfn_l), _mfn(gfn_l),
+                                1ul << PAGE_ORDER_4K,
                                 IOMMUF_readable | IOMMUF_writable);
     }
 
@@ -1443,7 +1444,7 @@ int clear_identity_p2m_entry(struct domain *d, unsigned long gfn_l)
     {
         if ( !is_iommu_enabled(d) )
             return 0;
-        return iommu_legacy_unmap(d, _dfn(gfn_l), PAGE_ORDER_4K);
+        return iommu_legacy_unmap(d, _dfn(gfn_l), 1ul << PAGE_ORDER_4K);
     }
 
     gfn_lock(p2m, gfn, 0);
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 1f32062c15..98924447e1 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1286,7 +1286,7 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
     {
         for ( i = spfn; i < epfn; i++ )
             if ( iommu_legacy_map(hardware_domain, _dfn(i), _mfn(i),
-                                  PAGE_ORDER_4K,
+                                  1ul << PAGE_ORDER_4K,
                                   IOMMUF_readable | IOMMUF_writable) )
                 break;
         if ( i != epfn )
@@ -1294,7 +1294,7 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
             while (i-- > old_max)
                 /* If statement to satisfy __must_check. */
                 if ( iommu_legacy_unmap(hardware_domain, _dfn(i),
-                                        PAGE_ORDER_4K) )
+                                        1ul << PAGE_ORDER_4K) )
                     continue;
 
             goto destroy_m2p;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 9f0cae52c0..a5d3ed8bda 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1225,7 +1225,7 @@ map_grant_ref(
             kind = IOMMUF_readable;
         else
             kind = 0;
-        if ( kind && iommu_legacy_map(ld, _dfn(mfn_x(mfn)), mfn, 0, kind) )
+        if ( kind && iommu_legacy_map(ld, _dfn(mfn_x(mfn)), mfn, 1, kind) )
         {
             double_gt_unlock(lgt, rgt);
             rc = GNTST_general_error;
@@ -1479,9 +1479,9 @@ unmap_common(
 
         kind = mapkind(lgt, rd, op->mfn);
         if ( !kind )
-            err = iommu_legacy_unmap(ld, _dfn(mfn_x(op->mfn)), 0);
+            err = iommu_legacy_unmap(ld, _dfn(mfn_x(op->mfn)), 1);
         else if ( !(kind & MAPKIND_WRITE) )
-            err = iommu_legacy_map(ld, _dfn(mfn_x(op->mfn)), op->mfn, 0,
+            err = iommu_legacy_map(ld, _dfn(mfn_x(op->mfn)), op->mfn, 1,
                                    IOMMUF_readable);
 
         double_gt_unlock(lgt, rgt);
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index e2d174f3b4..f1f0415469 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -231,7 +231,7 @@ int amd_iommu_reserve_domain_unity_map(struct domain *domain,
                                        paddr_t phys_addr, unsigned long size,
                                        int iw, int ir);
 int __must_check amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
-                                             unsigned int page_count,
+                                             unsigned long page_count,
                                              unsigned int flush_flags);
 int __must_check amd_iommu_flush_iotlb_all(struct domain *d);
 
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index 54b991294a..0cb948d114 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -351,7 +351,7 @@ int amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
     return 0;
 }
 
-static unsigned long flush_count(unsigned long dfn, unsigned int page_count,
+static unsigned long flush_count(unsigned long dfn, unsigned long page_count,
                                  unsigned int order)
 {
     unsigned long start = dfn >> order;
@@ -362,7 +362,7 @@ static unsigned long flush_count(unsigned long dfn, unsigned int page_count,
 }
 
 int amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
-                                unsigned int page_count,
+                                unsigned long page_count,
                                 unsigned int flush_flags)
 {
     unsigned long dfn_l = dfn_x(dfn);
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index b2a65dfaaf..346165c3fa 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -945,7 +945,7 @@ static int __must_check ipmmu_iotlb_flush_all(struct domain *d)
 }
 
 static int __must_check ipmmu_iotlb_flush(struct domain *d, dfn_t dfn,
-                                          unsigned int page_count,
+                                          unsigned long page_count,
                                           unsigned int flush_flags)
 {
     ASSERT(flush_flags);
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 94662a8501..06f9bda47d 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2534,7 +2534,7 @@ static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
 }
 
 static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t dfn,
-					     unsigned int page_count,
+					     unsigned long page_count,
 					     unsigned int flush_flags)
 {
 	ASSERT(flush_flags);
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index eb65631d59..87f9a857bb 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -235,7 +235,7 @@ void iommu_domain_destroy(struct domain *d)
 }
 
 int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
-              unsigned int page_order, unsigned int flags,
+              unsigned long page_count, unsigned int flags,
               unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -245,10 +245,7 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
     if ( !is_iommu_enabled(d) )
         return 0;
 
-    ASSERT(IS_ALIGNED(dfn_x(dfn), (1ul << page_order)));
-    ASSERT(IS_ALIGNED(mfn_x(mfn), (1ul << page_order)));
-
-    for ( i = 0; i < (1ul << page_order); i++ )
+    for ( i = 0; i < page_count; i++ )
     {
         rc = iommu_call(hd->platform_ops, map_page, d, dfn_add(dfn, i),
                         mfn_add(mfn, i), flags, flush_flags);
@@ -278,25 +275,26 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
      * Something went wrong so, if we were dealing with more than a single
      * page, flush everything and clear flush flags.
      */
-    if ( page_order && unlikely(rc) && !iommu_iotlb_flush_all(d, *flush_flags) )
+    if ( page_count > 1 && unlikely(rc) &&
+         !iommu_iotlb_flush_all(d, *flush_flags) )
         *flush_flags = 0;
 
     return rc;
 }
 
 int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
-                     unsigned int page_order, unsigned int flags)
+                     unsigned long page_count, unsigned int flags)
 {
     unsigned int flush_flags = 0;
-    int rc = iommu_map(d, dfn, mfn, page_order, flags, &flush_flags);
+    int rc = iommu_map(d, dfn, mfn, page_count, flags, &flush_flags);
 
     if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
-        rc = iommu_iotlb_flush(d, dfn, (1u << page_order), flush_flags);
+        rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
 
     return rc;
 }
 
-int iommu_unmap(struct domain *d, dfn_t dfn, unsigned int page_order,
+int iommu_unmap(struct domain *d, dfn_t dfn, unsigned long page_count,
                 unsigned int *flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -306,9 +304,7 @@ int iommu_unmap(struct domain *d, dfn_t dfn, unsigned int page_order,
     if ( !is_iommu_enabled(d) )
         return 0;
 
-    ASSERT(IS_ALIGNED(dfn_x(dfn), (1ul << page_order)));
-
-    for ( i = 0; i < (1ul << page_order); i++ )
+    for ( i = 0; i < page_count; i++ )
     {
         int err = iommu_call(hd->platform_ops, unmap_page, d, dfn_add(dfn, i),
                              flush_flags);
@@ -335,19 +331,20 @@ int iommu_unmap(struct domain *d, dfn_t dfn, unsigned int page_order,
      * Something went wrong so, if we were dealing with more than a single
      * page, flush everything and clear flush flags.
      */
-    if ( page_order && unlikely(rc) && !iommu_iotlb_flush_all(d, *flush_flags) )
+    if ( page_count > 1 && unlikely(rc) &&
+         !iommu_iotlb_flush_all(d, *flush_flags) )
         *flush_flags = 0;
 
     return rc;
 }
 
-int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned int page_order)
+int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned long page_count)
 {
     unsigned int flush_flags = 0;
-    int rc = iommu_unmap(d, dfn, page_order, &flush_flags);
+    int rc = iommu_unmap(d, dfn, page_count, &flush_flags);
 
     if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
-        rc = iommu_iotlb_flush(d, dfn, (1u << page_order), flush_flags);
+        rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
 
     return rc;
 }
@@ -363,7 +360,7 @@ int iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
     return iommu_call(hd->platform_ops, lookup_page, d, dfn, mfn, flags);
 }
 
-int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned int page_count,
+int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned long page_count,
                       unsigned int flush_flags)
 {
     const struct domain_iommu *hd = dom_iommu(d);
@@ -382,7 +379,7 @@ int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned int page_count,
     {
         if ( !d->is_shutting_down && printk_ratelimit() )
             printk(XENLOG_ERR
-                   "d%d: IOMMU IOTLB flush failed: %d, dfn %"PRI_dfn", page count %u flags %x\n",
+                   "d%d: IOMMU IOTLB flush failed: %d, dfn %"PRI_dfn", page count %lu flags %x\n",
                    d->domain_id, rc, dfn_x(dfn), page_count, flush_flags);
 
         if ( !is_hardware_domain(d) )
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 607e8b5e65..68cf0e535a 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -584,7 +584,7 @@ static int __must_check iommu_flush_all(void)
 
 static int __must_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
                                           bool_t dma_old_pte_present,
-                                          unsigned int page_count)
+                                          unsigned long page_count)
 {
     struct domain_iommu *hd = dom_iommu(d);
     struct acpi_drhd_unit *drhd;
@@ -632,7 +632,7 @@ static int __must_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
 
 static int __must_check iommu_flush_iotlb_pages(struct domain *d,
                                                 dfn_t dfn,
-                                                unsigned int page_count,
+                                                unsigned long page_count,
                                                 unsigned int flush_flags)
 {
     ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index aea07e47c4..f17b1820f4 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -244,7 +244,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
         else if ( paging_mode_translate(d) )
             rc = set_identity_p2m_entry(d, pfn, p2m_access_rw, 0);
         else
-            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), PAGE_ORDER_4K,
+            rc = iommu_map(d, _dfn(pfn), _mfn(pfn), 1ul << PAGE_ORDER_4K,
                            IOMMUF_readable | IOMMUF_writable, &flush_flags);
 
         if ( rc )
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 1831dc66b0..13f68dc93d 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -146,23 +146,23 @@ enum
 #define IOMMU_FLUSHF_modified (1u << _IOMMU_FLUSHF_modified)
 
 int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
-                           unsigned int page_order, unsigned int flags,
+                           unsigned long page_count, unsigned int flags,
                            unsigned int *flush_flags);
 int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
-                             unsigned int page_order,
+                             unsigned long page_count,
                              unsigned int *flush_flags);
 
 int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
-                                  unsigned int page_order,
+                                  unsigned long page_count,
                                   unsigned int flags);
 int __must_check iommu_legacy_unmap(struct domain *d, dfn_t dfn,
-                                    unsigned int page_order);
+                                    unsigned long page_count);
 
 int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
                                    unsigned int *flags);
 
 int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
-                                   unsigned int page_count,
+                                   unsigned long page_count,
                                    unsigned int flush_flags);
 int __must_check iommu_iotlb_flush_all(struct domain *d,
                                        unsigned int flush_flags);
@@ -281,7 +281,7 @@ struct iommu_ops {
     void (*share_p2m)(struct domain *d);
     void (*crash_shutdown)(void);
     int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
-                                    unsigned int page_count,
+                                    unsigned long page_count,
                                     unsigned int flush_flags);
     int __must_check (*iotlb_flush_all)(struct domain *d);
     int (*get_reserved_device_memory)(iommu_grdm_t *, void *);
-- 
2.20.1


