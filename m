Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC5B23346D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 16:30:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k19ZI-0005dm-3y; Thu, 30 Jul 2020 14:30:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B5Vg=BJ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k19ZH-0005Pz-70
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 14:29:59 +0000
X-Inumbo-ID: 1a452e4c-d271-11ea-8d70-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a452e4c-d271-11ea-8d70-bc764e2007e4;
 Thu, 30 Jul 2020 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o+lwGz261z94OzG7Pbq+kthB5fb4mouB8CYMb0gpCAk=; b=bGb45gtRGl0qTWB53rk9Rpk5CS
 USsUdxwZwWo3uXFjAcjZukbUQyIU8Jm5UWvPp9eum8JwzdyNw5CX4kyusfNGj+UwtmSC5waShlZq1
 Wb1AXbaGmr0KBmTdDBaTdJFu/jagtrBauDnHU11eiozBUgGbe5eMI/6rhXM4ERP7Nrt8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k19Yw-0002Ot-IH; Thu, 30 Jul 2020 14:29:38 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k19Yw-0005aN-BD; Thu, 30 Jul 2020 14:29:38 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 08/10] remove remaining uses of iommu_legacy_map/unmap
Date: Thu, 30 Jul 2020 15:29:24 +0100
Message-Id: <20200730142926.6051-9-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200730142926.6051-1-paul@xen.org>
References: <20200730142926.6051-1-paul@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

The 'legacy' functions do implicit flushing so amend the callers to do the
appropriate flushing.

Unfortunately, because of the structure of the P2M code, we cannot remove
the per-CPU 'iommu_dont_flush_iotlb' global and the optimization it
facilitates. It is now checked directly iommu_iotlb_flush(). Also, it is
now declared as bool (rather than bool_t) and setting/clearing it are no
longer pointlessly gated on is_iommu_enabled() returning true. (Arguably
it is also pointless to gate the call to iommu_iotlb_flush() on that
condition - since it is a no-op in that case - but the if clause allows
the scope of a stack variable to be restricted).

NOTE: The code in memory_add() now fails if the number of pages passed to
      a single call overflows an unsigned int. I don't believe this will
      ever happen in practice.

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

v2:
 - Shorten the diff (mainly because of a prior patch introducing automatic
   flush-on-fail into iommu_map() and iommu_unmap())
---
 xen/arch/x86/mm.c               | 21 +++++++++++++++-----
 xen/arch/x86/mm/p2m-ept.c       | 20 +++++++++++--------
 xen/arch/x86/mm/p2m-pt.c        | 15 +++++++++++----
 xen/arch/x86/mm/p2m.c           | 26 ++++++++++++++++++-------
 xen/arch/x86/x86_64/mm.c        | 27 +++++++++++++-------------
 xen/common/grant_table.c        | 34 ++++++++++++++++++++++++---------
 xen/common/memory.c             |  5 +++--
 xen/drivers/passthrough/iommu.c | 25 +-----------------------
 xen/include/xen/iommu.h         | 21 +++++---------------
 9 files changed, 106 insertions(+), 88 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 82bc676553..f7e84f12fa 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2446,10 +2446,16 @@ static int cleanup_page_mappings(struct page_info *page)
 
         if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
         {
-            int rc2 = iommu_legacy_unmap(d, _dfn(mfn), PAGE_ORDER_4K);
+            unsigned int flush_flags = 0;
+            int err;
 
+            err = iommu_unmap(d, _dfn(mfn), PAGE_ORDER_4K, 1, &flush_flags);
             if ( !rc )
-                rc = rc2;
+                rc = err;
+
+            err = iommu_iotlb_flush(d, _dfn(mfn), PAGE_ORDER_4K, 1, flush_flags);
+            if ( !rc )
+                rc = err;
         }
 
         if ( likely(!is_special_page(page)) )
@@ -2971,12 +2977,17 @@ static int _get_page_type(struct page_info *page, unsigned long type,
         if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
         {
             mfn_t mfn = page_to_mfn(page);
+            dfn_t dfn = _dfn(mfn_x(mfn));
+            unsigned int flush_flags = 0;
 
             if ( (x & PGT_type_mask) == PGT_writable_page )
-                rc = iommu_legacy_unmap(d, _dfn(mfn_x(mfn)), PAGE_ORDER_4K);
+                rc = iommu_unmap(d, dfn, PAGE_ORDER_4K, 1, &flush_flags);
             else
-                rc = iommu_legacy_map(d, _dfn(mfn_x(mfn)), mfn, PAGE_ORDER_4K,
-                                      IOMMUF_readable | IOMMUF_writable);
+                rc = iommu_map(d, dfn, mfn, PAGE_ORDER_4K, 1,
+                               IOMMUF_readable | IOMMUF_writable, &flush_flags);
+
+            if ( !rc )
+                rc = iommu_iotlb_flush(d, dfn, PAGE_ORDER_4K, 1, flush_flags);
 
             if ( unlikely(rc) )
             {
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index b2ac912cde..e38b0bf95c 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -842,15 +842,19 @@ out:
     if ( rc == 0 && p2m_is_hostp2m(p2m) &&
          need_modify_vtd_table )
     {
-        if ( iommu_use_hap_pt(d) )
-            rc = iommu_iotlb_flush(d, _dfn(gfn), (1u << order), 1,
-                                   (iommu_flags ? IOMMU_FLUSHF_added : 0) |
-                                   (vtd_pte_present ? IOMMU_FLUSHF_modified
-                                                    : 0));
-        else if ( need_iommu_pt_sync(d) )
+        unsigned int flush_flags = 0;
+
+        if ( need_iommu_pt_sync(d) )
             rc = iommu_flags ?
-                iommu_legacy_map(d, _dfn(gfn), mfn, order, iommu_flags) :
-                iommu_legacy_unmap(d, _dfn(gfn), order);
+                iommu_map(d, _dfn(gfn), mfn, order, 1, iommu_flags, &flush_flags) :
+                iommu_unmap(d, _dfn(gfn), order, 1, &flush_flags);
+        else if ( iommu_use_hap_pt(d) )
+            flush_flags =
+                (iommu_flags ? IOMMU_FLUSHF_added : 0) |
+                (vtd_pte_present ? IOMMU_FLUSHF_modified : 0);
+
+        if ( !rc )
+            rc = iommu_iotlb_flush(d, _dfn(gfn), order, 1, flush_flags);
     }
 
     unmap_domain_page(table);
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index badb26bc34..3c0901b56c 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -678,10 +678,17 @@ p2m_pt_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
 
     if ( need_iommu_pt_sync(p2m->domain) &&
          (iommu_old_flags != iommu_pte_flags || old_mfn != mfn_x(mfn)) )
-        rc = iommu_pte_flags
-             ? iommu_legacy_map(d, _dfn(gfn), mfn, page_order,
-                                iommu_pte_flags)
-             : iommu_legacy_unmap(d, _dfn(gfn), page_order);
+    {
+        unsigned int flush_flags = 0;
+
+        rc = iommu_pte_flags ?
+            iommu_map(d, _dfn(gfn), mfn, page_order, 1, iommu_pte_flags,
+                      &flush_flags) :
+            iommu_unmap(d, _dfn(gfn), page_order, 1, &flush_flags);
+
+        if ( !rc )
+            rc = iommu_iotlb_flush(d, _dfn(gfn), page_order, 1, flush_flags);
+    }
 
     /*
      * Free old intermediate tables if necessary.  This has to be the
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index db7bde0230..9f8b9bc5fd 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1350,10 +1350,15 @@ int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
 
     if ( !paging_mode_translate(p2m->domain) )
     {
-        if ( !is_iommu_enabled(d) )
-            return 0;
-        return iommu_legacy_map(d, _dfn(gfn_l), _mfn(gfn_l), PAGE_ORDER_4K,
-                                IOMMUF_readable | IOMMUF_writable);
+        unsigned int flush_flags = 0;
+
+        ret = iommu_map(d, _dfn(gfn_l), _mfn(gfn_l), PAGE_ORDER_4K, 1,
+                        IOMMUF_readable | IOMMUF_writable, &flush_flags);
+        if ( !ret )
+            ret = iommu_iotlb_flush(d, _dfn(gfn_l), PAGE_ORDER_4K, 1,
+                                    flush_flags);
+
+        return ret;
     }
 
     gfn_lock(p2m, gfn, 0);
@@ -1441,9 +1446,16 @@ int clear_identity_p2m_entry(struct domain *d, unsigned long gfn_l)
 
     if ( !paging_mode_translate(d) )
     {
-        if ( !is_iommu_enabled(d) )
-            return 0;
-        return iommu_legacy_unmap(d, _dfn(gfn_l), PAGE_ORDER_4K);
+        unsigned int flush_flags = 0;
+        int err;
+
+        ret = iommu_unmap(d, _dfn(gfn_l), PAGE_ORDER_4K, 1, &flush_flags);
+
+        err = iommu_iotlb_flush(d, _dfn(gfn_l), PAGE_ORDER_4K, 1, flush_flags);
+        if ( !ret )
+            ret = err;
+
+        return ret;
     }
 
     gfn_lock(p2m, gfn, 0);
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index 102079a801..02684bcf9d 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1413,21 +1413,22 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
          !iommu_use_hap_pt(hardware_domain) &&
          !need_iommu_pt_sync(hardware_domain) )
     {
-        for ( i = spfn; i < epfn; i++ )
-            if ( iommu_legacy_map(hardware_domain, _dfn(i), _mfn(i),
-                                  PAGE_ORDER_4K,
-                                  IOMMUF_readable | IOMMUF_writable) )
-                break;
-        if ( i != epfn )
-        {
-            while (i-- > old_max)
-                /* If statement to satisfy __must_check. */
-                if ( iommu_legacy_unmap(hardware_domain, _dfn(i),
-                                        PAGE_ORDER_4K) )
-                    continue;
+        unsigned int flush_flags = 0;
+        unsigned int n = epfn - spfn;
+        int rc;
 
+        ret = -EOVERFLOW;
+        if ( spfn + n != epfn )
+            goto destroy_m2p;
+
+        rc = iommu_map(hardware_domain, _dfn(i), _mfn(i),
+                       PAGE_ORDER_4K, n, IOMMUF_readable | IOMMUF_writable,
+                       &flush_flags);
+        if ( !rc )
+            rc = iommu_iotlb_flush(hardware_domain, _dfn(i), PAGE_ORDER_4K, n,
+                                       flush_flags);
+        if ( rc )
             goto destroy_m2p;
-        }
     }
 
     /* We can't revert any more */
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index 9f0cae52c0..d6526bca12 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1225,11 +1225,23 @@ map_grant_ref(
             kind = IOMMUF_readable;
         else
             kind = 0;
-        if ( kind && iommu_legacy_map(ld, _dfn(mfn_x(mfn)), mfn, 0, kind) )
+        if ( kind )
         {
-            double_gt_unlock(lgt, rgt);
-            rc = GNTST_general_error;
-            goto undo_out;
+            dfn_t dfn = _dfn(mfn_x(mfn));
+            unsigned int flush_flags = 0;
+            int err;
+
+            err = iommu_map(ld, dfn, mfn, 0, 1, kind, &flush_flags);
+            if ( !err )
+                err = iommu_iotlb_flush(ld, dfn, 0, 1, flush_flags);
+            if ( err )
+                rc = GNTST_general_error;
+
+            if ( rc != GNTST_okay )
+            {
+                double_gt_unlock(lgt, rgt);
+                goto undo_out;
+            }
         }
     }
 
@@ -1473,21 +1485,25 @@ unmap_common(
     if ( rc == GNTST_okay && gnttab_need_iommu_mapping(ld) )
     {
         unsigned int kind;
+        dfn_t dfn = _dfn(mfn_x(op->mfn));
+        unsigned int flush_flags = 0;
         int err = 0;
 
         double_gt_lock(lgt, rgt);
 
         kind = mapkind(lgt, rd, op->mfn);
         if ( !kind )
-            err = iommu_legacy_unmap(ld, _dfn(mfn_x(op->mfn)), 0);
+            err = iommu_unmap(ld, dfn, 0, 1, &flush_flags);
         else if ( !(kind & MAPKIND_WRITE) )
-            err = iommu_legacy_map(ld, _dfn(mfn_x(op->mfn)), op->mfn, 0,
-                                   IOMMUF_readable);
-
-        double_gt_unlock(lgt, rgt);
+            err = iommu_map(ld, dfn, op->mfn, 0, 1, IOMMUF_readable,
+                            &flush_flags);
 
+        if ( !err )
+            err = iommu_iotlb_flush(ld, dfn, 0, 1, flush_flags);
         if ( err )
             rc = GNTST_general_error;
+
+        double_gt_unlock(lgt, rgt);
     }
 
     /* If just unmapped a writable mapping, mark as dirtied */
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 8de334ff10..2891bef57b 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -824,8 +824,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
     xatp->gpfn += start;
     xatp->size -= start;
 
-    if ( is_iommu_enabled(d) )
-       this_cpu(iommu_dont_flush_iotlb) = 1;
+    this_cpu(iommu_dont_flush_iotlb) = true;
 
     while ( xatp->size > done )
     {
@@ -845,6 +844,8 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
         }
     }
 
+    this_cpu(iommu_dont_flush_iotlb) = false;
+
     if ( is_iommu_enabled(d) )
     {
         int ret;
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 568a4a5661..ab44c332bb 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -281,18 +281,6 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
     return rc;
 }
 
-int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
-                     unsigned int page_order, unsigned int flags)
-{
-    unsigned int flush_flags = 0;
-    int rc = iommu_map(d, dfn, mfn, page_order, 1, flags, &flush_flags);
-
-    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
-        rc = iommu_iotlb_flush(d, dfn, (1u << page_order), 1, flush_flags);
-
-    return rc;
-}
-
 int iommu_unmap(struct domain *d, dfn_t dfn, unsigned int page_order,
                 unsigned int page_count, unsigned int *flush_flags)
 {
@@ -335,17 +323,6 @@ int iommu_unmap(struct domain *d, dfn_t dfn, unsigned int page_order,
     return rc;
 }
 
-int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned int page_order)
-{
-    unsigned int flush_flags = 0;
-    int rc = iommu_unmap(d, dfn, page_order, 1, &flush_flags);
-
-    if ( !this_cpu(iommu_dont_flush_iotlb) && ! rc )
-        rc = iommu_iotlb_flush(d, dfn, (1u << page_order), 1, flush_flags);
-
-    return rc;
-}
-
 int iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
                       unsigned int *flags)
 {
@@ -364,7 +341,7 @@ int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned int page_order,
     int rc;
 
     if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
-         !page_count || !flush_flags )
+         !page_count || !flush_flags || this_cpu(iommu_dont_flush_iotlb) )
         return 0;
 
     if ( dfn_eq(dfn, INVALID_DFN) )
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index d9c2e764aa..b7e5d3da09 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -151,16 +151,8 @@ int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
 int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
                              unsigned int page_order, unsigned int page_count,
                              unsigned int *flush_flags);
-
-int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
-                                  unsigned int page_order,
-                                  unsigned int flags);
-int __must_check iommu_legacy_unmap(struct domain *d, dfn_t dfn,
-                                    unsigned int page_order);
-
 int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
                                    unsigned int *flags);
-
 int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
                                    unsigned int page_order,
                                    unsigned int page_count,
@@ -370,15 +362,12 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
 
 /*
  * The purpose of the iommu_dont_flush_iotlb optional cpu flag is to
- * avoid unecessary iotlb_flush in the low level IOMMU code.
- *
- * iommu_map_page/iommu_unmap_page must flush the iotlb but somethimes
- * this operation can be really expensive. This flag will be set by the
- * caller to notify the low level IOMMU code to avoid the iotlb flushes.
- * iommu_iotlb_flush/iommu_iotlb_flush_all will be explicitly called by
- * the caller.
+ * avoid unecessary IOMMU flushing while updating the P2M.
+ * Setting the value to true will cause iommu_iotlb_flush() to return without
+ * actually performing a flush. A batch flush must therefore be done by the
+ * calling code after setting the value back to false.
  */
-DECLARE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
+DECLARE_PER_CPU(bool, iommu_dont_flush_iotlb);
 
 extern struct spinlock iommu_pt_cleanup_lock;
 extern struct page_list_head iommu_pt_cleanup_list;
-- 
2.20.1


