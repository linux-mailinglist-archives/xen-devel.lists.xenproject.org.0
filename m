Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 345042BAB0E
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 14:25:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32187.63179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg6PB-0001kk-JL; Fri, 20 Nov 2020 13:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32187.63179; Fri, 20 Nov 2020 13:24:49 +0000
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
	id 1kg6PB-0001k0-C7; Fri, 20 Nov 2020 13:24:49 +0000
Received: by outflank-mailman (input) for mailman id 32187;
 Fri, 20 Nov 2020 13:24:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kg6P9-0001i7-Eq
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 13:24:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg6P7-0007Cr-B6; Fri, 20 Nov 2020 13:24:45 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg6P7-00028m-0U; Fri, 20 Nov 2020 13:24:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6P9-0001i7-Eq
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 13:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=tMs2Q+q+Bnm5wtjajtQeaabWNgddOKx30PoGNnvP4Nw=; b=oEp7b6dZ3+ZtBLX0fRNZ6H4RMH
	iQcOY5SY+SYYo97SksNgjrgufy8ilaEDTX5SXst01KxUWSe3z4/toO18zRNL3atXp/EGfQUEJGoLn
	xUn2mYOgm98D0DNkC0mlOa155Fjl91GoY/3JRKzsG+6T9ig1jqP1u8aiBg+gyBaDJ6Vk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6P7-0007Cr-B6; Fri, 20 Nov 2020 13:24:45 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6P7-00028m-0U; Fri, 20 Nov 2020 13:24:45 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Julien Grall <jgrall@amazon.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: [PATCH v10 1/7] remove remaining uses of iommu_legacy_map/unmap
Date: Fri, 20 Nov 2020 13:24:34 +0000
Message-Id: <20201120132440.1141-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201120132440.1141-1-paul@xen.org>
References: <20201120132440.1141-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

The 'legacy' functions do implicit flushing so amend the callers to do the
appropriate flushing.

Unfortunately, because of the structure of the P2M code, we cannot remove
the per-CPU 'iommu_dont_flush_iotlb' global and the optimization it
facilitates. Checking of this flag is now done only in relevant callers of
iommu_iotlb_flush(). Also, 'iommu_dont_flush_iotlb' is now declared
as bool (rather than bool_t) and setting/clearing it are no longer pointlessly
gated on is_iommu_enabled() returning true. (Arguably it is also pointless to
gate the call to iommu_iotlb_flush() on that condition - since it is a no-op
in that case - but the if clause allows the scope of a stack variable to be
restricted).

NOTE: The code in memory_add() now sets 'ret' if iommu_map() or
      iommu_iotlb_flush() fails.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Acked-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Julien Grall <jgrall@amazon.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jun Nakajima <jun.nakajima@intel.com>

v10:
 - Re-base

v9:
 - Moved check of 'iommu_dont_flush_iotlb' out of iommu_iotlb_flush() and
   into callers to avoid re-introducing a problem on Arm
 - Dropped Jan's R-b due to change

v6:
 - Fix formatting problem in memory_add()

v5:
 - Re-base
 - Removed failure case on overflow of unsigned int as it is no longer
   necessary

v3:
 - Same as v2; elected to implement batch flushing in the grant table code as
   a subsequent patch

v2:
 - Shorten the diff (mainly because of a prior patch introducing automatic
   flush-on-fail into iommu_map() and iommu_unmap())
---
 xen/arch/x86/mm.c               | 26 +++++++++++++++++++-------
 xen/arch/x86/mm/p2m-ept.c       | 20 ++++++++++++--------
 xen/arch/x86/mm/p2m-pt.c        | 16 ++++++++++++----
 xen/arch/x86/mm/p2m.c           | 25 +++++++++++++++++--------
 xen/arch/x86/x86_64/mm.c        | 20 +++++++-------------
 xen/common/grant_table.c        | 29 ++++++++++++++++++++++-------
 xen/common/memory.c             |  6 +++---
 xen/drivers/passthrough/iommu.c | 23 -----------------------
 xen/include/xen/iommu.h         | 21 +++++----------------
 9 files changed, 97 insertions(+), 89 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 5a50339284c7..bb5f504b84e2 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2489,10 +2489,16 @@ static int cleanup_page_mappings(struct page_info *page)
 
         if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
         {
-            int rc2 = iommu_legacy_unmap(d, _dfn(mfn), 1u << PAGE_ORDER_4K);
+            unsigned int flush_flags = 0;
+            int err;
+
+            err = iommu_unmap(d, _dfn(mfn), 1ul << PAGE_ORDER_4K, &flush_flags);
+            if ( !err && !this_cpu(iommu_dont_flush_iotlb) )
+                err = iommu_iotlb_flush(d, _dfn(mfn), 1ul << PAGE_ORDER_4K,
+                                        flush_flags);
 
             if ( !rc )
-                rc = rc2;
+                rc = err;
         }
 
         if ( likely(!is_special_page(page)) )
@@ -3014,14 +3020,20 @@ static int _get_page_type(struct page_info *page, unsigned long type,
         if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
         {
             mfn_t mfn = page_to_mfn(page);
+            dfn_t dfn = _dfn(mfn_x(mfn));
+            unsigned int flush_flags = 0;
 
             if ( (x & PGT_type_mask) == PGT_writable_page )
-                rc = iommu_legacy_unmap(d, _dfn(mfn_x(mfn)),
-                                        1ul << PAGE_ORDER_4K);
+                rc = iommu_unmap(d, dfn, 1ul << PAGE_ORDER_4K, &flush_flags);
             else
-                rc = iommu_legacy_map(d, _dfn(mfn_x(mfn)), mfn,
-                                      1ul << PAGE_ORDER_4K,
-                                      IOMMUF_readable | IOMMUF_writable);
+            {
+                rc = iommu_map(d, dfn, mfn, 1ul << PAGE_ORDER_4K,
+                               IOMMUF_readable | IOMMUF_writable, &flush_flags);
+            }
+
+            if ( !rc && !this_cpu(iommu_dont_flush_iotlb) )
+                rc = iommu_iotlb_flush(d, dfn, 1ul << PAGE_ORDER_4K,
+                                       flush_flags);
 
             if ( unlikely(rc) )
             {
diff --git a/xen/arch/x86/mm/p2m-ept.c b/xen/arch/x86/mm/p2m-ept.c
index 975ab403f235..c04a30eecc65 100644
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -842,15 +842,19 @@ out:
     if ( rc == 0 && p2m_is_hostp2m(p2m) &&
          need_modify_vtd_table )
     {
-        if ( iommu_use_hap_pt(d) && !this_cpu(iommu_dont_flush_iotlb) )
-            rc = iommu_iotlb_flush(d, _dfn(gfn), 1ul << order,
-                                   (iommu_flags ? IOMMU_FLUSHF_added : 0) |
-                                   (vtd_pte_present ? IOMMU_FLUSHF_modified
-                                                    : 0));
-        else if ( need_iommu_pt_sync(d) )
+        unsigned int flush_flags = 0;
+
+        if ( need_iommu_pt_sync(d) )
             rc = iommu_flags ?
-                iommu_legacy_map(d, _dfn(gfn), mfn, 1ul << order, iommu_flags) :
-                iommu_legacy_unmap(d, _dfn(gfn), 1ul << order);
+                iommu_map(d, _dfn(gfn), mfn, 1ul << order, iommu_flags,
+                          &flush_flags) :
+                iommu_unmap(d, _dfn(gfn), 1ul << order, &flush_flags);
+        else if ( iommu_use_hap_pt(d) )
+            flush_flags = (iommu_flags ? IOMMU_FLUSHF_added : 0) |
+                          (vtd_pte_present ? IOMMU_FLUSHF_modified : 0);
+
+        if ( !rc && !this_cpu(iommu_dont_flush_iotlb) )
+            rc = iommu_iotlb_flush(d, _dfn(gfn), 1ul << order, flush_flags);
     }
 
     unmap_domain_page(table);
diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
index 5fa0d30ce7d2..d8ffc6f7e078 100644
--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -741,10 +741,18 @@ p2m_pt_set_entry(struct p2m_domain *p2m, gfn_t gfn_, mfn_t mfn,
 
     if ( need_iommu_pt_sync(p2m->domain) &&
          (iommu_old_flags != iommu_pte_flags || old_mfn != mfn_x(mfn)) )
-        rc = iommu_pte_flags
-             ? iommu_legacy_map(d, _dfn(gfn), mfn, 1ul << page_order,
-                                iommu_pte_flags)
-             : iommu_legacy_unmap(d, _dfn(gfn), 1ul << page_order);
+    {
+        unsigned int flush_flags = 0;
+
+        rc = iommu_pte_flags ?
+            iommu_map(d, _dfn(gfn), mfn, 1ul << page_order, iommu_pte_flags,
+                      &flush_flags) :
+            iommu_unmap(d, _dfn(gfn), 1ul << page_order, &flush_flags);
+
+        if ( !rc && !this_cpu(iommu_dont_flush_iotlb) )
+            rc = iommu_iotlb_flush(d, _dfn(gfn), 1ul << page_order,
+                                   flush_flags);
+    }
 
     /*
      * Free old intermediate tables if necessary.  This has to be the
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index d9cc1856bb80..8ee33b25ca72 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1351,11 +1351,15 @@ int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
 
     if ( !paging_mode_translate(p2m->domain) )
     {
-        if ( !is_iommu_enabled(d) )
-            return 0;
-        return iommu_legacy_map(d, _dfn(gfn_l), _mfn(gfn_l),
-                                1ul << PAGE_ORDER_4K,
-                                IOMMUF_readable | IOMMUF_writable);
+        unsigned int flush_flags = 0;
+
+        ret = iommu_map(d, _dfn(gfn_l), _mfn(gfn_l), 1ul << PAGE_ORDER_4K,
+                        IOMMUF_readable | IOMMUF_writable, &flush_flags);
+        if ( !ret )
+            ret = iommu_iotlb_flush(d, _dfn(gfn_l), 1ul << PAGE_ORDER_4K,
+                                    flush_flags);
+
+        return ret;
     }
 
     gfn_lock(p2m, gfn, 0);
@@ -1443,9 +1447,14 @@ int clear_identity_p2m_entry(struct domain *d, unsigned long gfn_l)
 
     if ( !paging_mode_translate(d) )
     {
-        if ( !is_iommu_enabled(d) )
-            return 0;
-        return iommu_legacy_unmap(d, _dfn(gfn_l), 1ul << PAGE_ORDER_4K);
+        unsigned int flush_flags = 0;
+
+        ret = iommu_unmap(d, _dfn(gfn_l), 1ul << PAGE_ORDER_4K, &flush_flags);
+        if ( !ret )
+            ret = iommu_iotlb_flush(d, _dfn(gfn_l), 1ul << PAGE_ORDER_4K,
+                                    flush_flags);
+
+        return ret;
     }
 
     gfn_lock(p2m, gfn, 0);
diff --git a/xen/arch/x86/x86_64/mm.c b/xen/arch/x86/x86_64/mm.c
index bce1561e1a80..7e9d16544915 100644
--- a/xen/arch/x86/x86_64/mm.c
+++ b/xen/arch/x86/x86_64/mm.c
@@ -1284,21 +1284,15 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
          !iommu_use_hap_pt(hardware_domain) &&
          !need_iommu_pt_sync(hardware_domain) )
     {
-        for ( i = spfn; i < epfn; i++ )
-            if ( iommu_legacy_map(hardware_domain, _dfn(i), _mfn(i),
-                                  1ul << PAGE_ORDER_4K,
-                                  IOMMUF_readable | IOMMUF_writable) )
-                break;
-        if ( i != epfn )
-        {
-            while (i-- > old_max)
-                /* If statement to satisfy __must_check. */
-                if ( iommu_legacy_unmap(hardware_domain, _dfn(i),
-                                        1ul << PAGE_ORDER_4K) )
-                    continue;
+        unsigned int flush_flags = 0;
+        unsigned long n = epfn - spfn;
 
+        ret = iommu_map(hardware_domain, _dfn(i), _mfn(i), n,
+                        IOMMUF_readable | IOMMUF_writable, &flush_flags);
+        if ( !ret )
+            ret = iommu_iotlb_flush(hardware_domain, _dfn(i), n, flush_flags);
+        if ( ret )
             goto destroy_m2p;
-        }
     }
 
     /* We can't revert any more */
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index a5d3ed8bdaac..beb6b2d40d68 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1225,11 +1225,22 @@ map_grant_ref(
             kind = IOMMUF_readable;
         else
             kind = 0;
-        if ( kind && iommu_legacy_map(ld, _dfn(mfn_x(mfn)), mfn, 1, kind) )
+
+        if ( kind )
         {
-            double_gt_unlock(lgt, rgt);
-            rc = GNTST_general_error;
-            goto undo_out;
+            dfn_t dfn = _dfn(mfn_x(mfn));
+            unsigned int flush_flags = 0;
+            int err;
+
+            err = iommu_map(ld, dfn, mfn, 1, kind, &flush_flags);
+            if ( !err )
+                err = iommu_iotlb_flush(ld, dfn, 1, flush_flags);
+            if ( err )
+            {
+                double_gt_unlock(lgt, rgt);
+                rc = GNTST_general_error;
+                goto undo_out;
+            }
         }
     }
 
@@ -1473,19 +1484,23 @@ unmap_common(
     if ( rc == GNTST_okay && gnttab_need_iommu_mapping(ld) )
     {
         unsigned int kind;
+        dfn_t dfn = _dfn(mfn_x(op->mfn));
+        unsigned int flush_flags = 0;
         int err = 0;
 
         double_gt_lock(lgt, rgt);
 
         kind = mapkind(lgt, rd, op->mfn);
         if ( !kind )
-            err = iommu_legacy_unmap(ld, _dfn(mfn_x(op->mfn)), 1);
+            err = iommu_unmap(ld, dfn, 1, &flush_flags);
         else if ( !(kind & MAPKIND_WRITE) )
-            err = iommu_legacy_map(ld, _dfn(mfn_x(op->mfn)), op->mfn, 1,
-                                   IOMMUF_readable);
+            err = iommu_map(ld, dfn, op->mfn, 1, IOMMUF_readable,
+                            &flush_flags);
 
         double_gt_unlock(lgt, rgt);
 
+        if ( !err )
+            err = iommu_iotlb_flush(ld, dfn, 1, flush_flags);
         if ( err )
             rc = GNTST_general_error;
     }
diff --git a/xen/common/memory.c b/xen/common/memory.c
index df85b550a1b1..14137c68393c 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -836,8 +836,8 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
 
     if ( is_iommu_enabled(d) )
     {
-       this_cpu(iommu_dont_flush_iotlb) = 1;
-       extra.ppage = &pages[0];
+        this_cpu(iommu_dont_flush_iotlb) = true;
+        extra.ppage = &pages[0];
     }
 
     while ( xatp->size > done )
@@ -867,7 +867,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
         int ret;
         unsigned int i;
 
-        this_cpu(iommu_dont_flush_iotlb) = 0;
+        this_cpu(iommu_dont_flush_iotlb) = false;
 
         ret = iommu_iotlb_flush(d, _dfn(xatp->idx - done), done,
                                 IOMMU_FLUSHF_modified);
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 87f9a857bbae..a9da4d2b0645 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -282,18 +282,6 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
     return rc;
 }
 
-int iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
-                     unsigned long page_count, unsigned int flags)
-{
-    unsigned int flush_flags = 0;
-    int rc = iommu_map(d, dfn, mfn, page_count, flags, &flush_flags);
-
-    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
-        rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
-
-    return rc;
-}
-
 int iommu_unmap(struct domain *d, dfn_t dfn, unsigned long page_count,
                 unsigned int *flush_flags)
 {
@@ -338,17 +326,6 @@ int iommu_unmap(struct domain *d, dfn_t dfn, unsigned long page_count,
     return rc;
 }
 
-int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned long page_count)
-{
-    unsigned int flush_flags = 0;
-    int rc = iommu_unmap(d, dfn, page_count, &flush_flags);
-
-    if ( !this_cpu(iommu_dont_flush_iotlb) && !rc )
-        rc = iommu_iotlb_flush(d, dfn, page_count, flush_flags);
-
-    return rc;
-}
-
 int iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
                       unsigned int *flags)
 {
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 191021870fed..244a11b9b494 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -151,16 +151,8 @@ int __must_check iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
 int __must_check iommu_unmap(struct domain *d, dfn_t dfn,
                              unsigned long page_count,
                              unsigned int *flush_flags);
-
-int __must_check iommu_legacy_map(struct domain *d, dfn_t dfn, mfn_t mfn,
-                                  unsigned long page_count,
-                                  unsigned int flags);
-int __must_check iommu_legacy_unmap(struct domain *d, dfn_t dfn,
-                                    unsigned long page_count);
-
 int __must_check iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
                                    unsigned int *flags);
-
 int __must_check iommu_iotlb_flush(struct domain *d, dfn_t dfn,
                                    unsigned long page_count,
                                    unsigned int flush_flags);
@@ -368,15 +360,12 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
 
 /*
  * The purpose of the iommu_dont_flush_iotlb optional cpu flag is to
- * avoid unecessary iotlb_flush in the low level IOMMU code.
- *
- * iommu_map_page/iommu_unmap_page must flush the iotlb but somethimes
- * this operation can be really expensive. This flag will be set by the
- * caller to notify the low level IOMMU code to avoid the iotlb flushes.
- * iommu_iotlb_flush/iommu_iotlb_flush_all will be explicitly called by
- * the caller.
+ * avoid unnecessary IOMMU flushing while updating the P2M.
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


