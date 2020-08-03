Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841A523A4C3
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 14:30:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2Zav-0007PT-S6; Mon, 03 Aug 2020 12:29:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rQjY=BN=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2Zav-0007NV-0y
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 12:29:33 +0000
X-Inumbo-ID: f5e9f548-d584-11ea-af26-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5e9f548-d584-11ea-af26-12813bfff9fa;
 Mon, 03 Aug 2020 12:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=elpnTLLUZTjtNMvn+dphJvziiTX8WkV+tBvTSKCuAxs=; b=h7/WGRhL/brWZsD60ugtkY+z4H
 OvVOeBW5Do6tKAMB7+KM7b9mP8agqqgAnfHxsxNuxSHd8VD2/HjA2j10SwaSvtXuZ/cYJGNxXSe70
 MTqXmW+V4Sa//PQTmYS5ol8cyLwrFiA2hpvm4OYtX2pPJad91yQBjCA3rFTjypcM8kmE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2Zaj-0000SM-37; Mon, 03 Aug 2020 12:29:21 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2Zai-0000zk-Rd; Mon, 03 Aug 2020 12:29:21 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 03/11] x86/iommu: convert VT-d code to use new page table
 allocator
Date: Mon,  3 Aug 2020 13:29:06 +0100
Message-Id: <20200803122914.2259-4-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803122914.2259-1-paul@xen.org>
References: <20200803122914.2259-1-paul@xen.org>
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
Cc: Paul Durrant <pdurrant@amazon.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

This patch converts the VT-d code to use the new IOMMU page table allocator
function. This allows all the free-ing code to be removed (since it is now
handled by the general x86 code) which reduces TLB and cache thrashing as well
as shortening the code.

The scope of the mapping_lock in intel_iommu_quarantine_init() has also been
increased slightly; it should have always covered accesses to
'arch.vtd.pgd_maddr'.

NOTE: The common IOMMU needs a slight modification to avoid scheduling the
      cleanup tasklet if the free_page_table() method is not present (since
      the tasklet will unconditionally call it).

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>

v2:
 - New in v2 (split from "add common page-table allocator")
---
 xen/drivers/passthrough/iommu.c     |   6 +-
 xen/drivers/passthrough/vtd/iommu.c | 101 ++++++++++------------------
 2 files changed, 39 insertions(+), 68 deletions(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 1d644844ab..2b1db8022c 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -225,8 +225,10 @@ static void iommu_teardown(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
 
-    hd->platform_ops->teardown(d);
-    tasklet_schedule(&iommu_pt_cleanup_tasklet);
+    iommu_vcall(hd->platform_ops, teardown, d);
+
+    if ( hd->platform_ops->free_page_table )
+        tasklet_schedule(&iommu_pt_cleanup_tasklet);
 }
 
 void iommu_domain_destroy(struct domain *d)
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 94e0455a4d..607e8b5e65 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -265,10 +265,15 @@ static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
 
     addr &= (((u64)1) << addr_width) - 1;
     ASSERT(spin_is_locked(&hd->arch.mapping_lock));
-    if ( !hd->arch.vtd.pgd_maddr &&
-         (!alloc ||
-          ((hd->arch.vtd.pgd_maddr = alloc_pgtable_maddr(1, hd->node)) == 0)) )
-        goto out;
+    if ( !hd->arch.vtd.pgd_maddr )
+    {
+        struct page_info *pg;
+
+        if ( !alloc || !(pg = iommu_alloc_pgtable(domain)) )
+            goto out;
+
+        hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
+    }
 
     parent = (struct dma_pte *)map_vtd_domain_page(hd->arch.vtd.pgd_maddr);
     while ( level > 1 )
@@ -279,13 +284,16 @@ static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
         pte_maddr = dma_pte_addr(*pte);
         if ( !pte_maddr )
         {
+            struct page_info *pg;
+
             if ( !alloc )
                 break;
 
-            pte_maddr = alloc_pgtable_maddr(1, hd->node);
-            if ( !pte_maddr )
+            pg = iommu_alloc_pgtable(domain);
+            if ( !pg )
                 break;
 
+            pte_maddr = page_to_maddr(pg);
             dma_set_pte_addr(*pte, pte_maddr);
 
             /*
@@ -675,45 +683,6 @@ static void dma_pte_clear_one(struct domain *domain, uint64_t addr,
     unmap_vtd_domain_page(page);
 }
 
-static void iommu_free_pagetable(u64 pt_maddr, int level)
-{
-    struct page_info *pg = maddr_to_page(pt_maddr);
-
-    if ( pt_maddr == 0 )
-        return;
-
-    PFN_ORDER(pg) = level;
-    spin_lock(&iommu_pt_cleanup_lock);
-    page_list_add_tail(pg, &iommu_pt_cleanup_list);
-    spin_unlock(&iommu_pt_cleanup_lock);
-}
-
-static void iommu_free_page_table(struct page_info *pg)
-{
-    unsigned int i, next_level = PFN_ORDER(pg) - 1;
-    u64 pt_maddr = page_to_maddr(pg);
-    struct dma_pte *pt_vaddr, *pte;
-
-    PFN_ORDER(pg) = 0;
-    pt_vaddr = (struct dma_pte *)map_vtd_domain_page(pt_maddr);
-
-    for ( i = 0; i < PTE_NUM; i++ )
-    {
-        pte = &pt_vaddr[i];
-        if ( !dma_pte_present(*pte) )
-            continue;
-
-        if ( next_level >= 1 )
-            iommu_free_pagetable(dma_pte_addr(*pte), next_level);
-
-        dma_clear_pte(*pte);
-        iommu_sync_cache(pte, sizeof(struct dma_pte));
-    }
-
-    unmap_vtd_domain_page(pt_vaddr);
-    free_pgtable_maddr(pt_maddr);
-}
-
 static int iommu_set_root_entry(struct vtd_iommu *iommu)
 {
     u32 sts;
@@ -1748,16 +1717,7 @@ static void iommu_domain_teardown(struct domain *d)
         xfree(mrmrr);
     }
 
-    ASSERT(is_iommu_enabled(d));
-
-    if ( iommu_use_hap_pt(d) )
-        return;
-
-    spin_lock(&hd->arch.mapping_lock);
-    iommu_free_pagetable(hd->arch.vtd.pgd_maddr,
-                         agaw_to_level(hd->arch.vtd.agaw));
     hd->arch.vtd.pgd_maddr = 0;
-    spin_unlock(&hd->arch.mapping_lock);
 }
 
 static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
@@ -2669,23 +2629,28 @@ static void vtd_dump_p2m_table(struct domain *d)
 static int __init intel_iommu_quarantine_init(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
+    struct page_info *pg;
     struct dma_pte *parent;
     unsigned int agaw = width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH);
     unsigned int level = agaw_to_level(agaw);
-    int rc;
+    int rc = 0;
+
+    spin_lock(&hd->arch.mapping_lock);
 
     if ( hd->arch.vtd.pgd_maddr )
     {
         ASSERT_UNREACHABLE();
-        return 0;
+        goto out;
     }
 
-    spin_lock(&hd->arch.mapping_lock);
+    pg = iommu_alloc_pgtable(d);
 
-    hd->arch.vtd.pgd_maddr = alloc_pgtable_maddr(1, hd->node);
-    if ( !hd->arch.vtd.pgd_maddr )
+    rc = -ENOMEM;
+    if ( !pg )
         goto out;
 
+    hd->arch.vtd.pgd_maddr = page_to_maddr(pg);
+
     parent = map_vtd_domain_page(hd->arch.vtd.pgd_maddr);
     while ( level )
     {
@@ -2697,10 +2662,12 @@ static int __init intel_iommu_quarantine_init(struct domain *d)
          * page table pages, and the resulting allocations are always
          * zeroed.
          */
-        maddr = alloc_pgtable_maddr(1, hd->node);
-        if ( !maddr )
-            break;
+        pg = iommu_alloc_pgtable(d);
+
+        if ( !pg )
+            goto out;
 
+        maddr = page_to_maddr(pg);
         for ( offset = 0; offset < PTE_NUM; offset++ )
         {
             struct dma_pte *pte = &parent[offset];
@@ -2716,13 +2683,16 @@ static int __init intel_iommu_quarantine_init(struct domain *d)
     }
     unmap_vtd_domain_page(parent);
 
+    rc = 0;
+
  out:
     spin_unlock(&hd->arch.mapping_lock);
 
-    rc = iommu_flush_iotlb_all(d);
+    if ( !rc )
+        rc = iommu_flush_iotlb_all(d);
 
-    /* Pages leaked in failure case */
-    return level ? -ENOMEM : rc;
+    /* Pages may be leaked in failure case */
+    return rc;
 }
 
 static struct iommu_ops __initdata vtd_ops = {
@@ -2737,7 +2707,6 @@ static struct iommu_ops __initdata vtd_ops = {
     .map_page = intel_iommu_map_page,
     .unmap_page = intel_iommu_unmap_page,
     .lookup_page = intel_iommu_lookup_page,
-    .free_page_table = iommu_free_page_table,
     .reassign_device = reassign_device_ownership,
     .get_device_group_id = intel_iommu_group_id,
     .enable_x2apic = intel_iommu_enable_eim,
-- 
2.20.1


