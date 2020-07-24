Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6588422CB62
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 18:46:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz0q9-000165-6f; Fri, 24 Jul 2020 16:46:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yL+a=BD=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jz0q8-00015t-1H
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 16:46:32 +0000
X-Inumbo-ID: 3973b03e-cdcd-11ea-8855-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3973b03e-cdcd-11ea-8855-bc764e2007e4;
 Fri, 24 Jul 2020 16:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ps1c79dS8Hxss26DESmmy5+bX2VNTeAFQ2QuKg57l58=; b=RaJZh4Tnwh4AzAyIlYnGnWgJKq
 PPH7unRrbDmv8YApUVNbuNr8vjQ+OvXhndPp/VttG9dexJ8FWwRG5WgrcbCD1shmfE10AAb7/n/8H
 SG+aQyFLfMdpdUgaFgMRzlSnvHm/fWWNnmhlr2uj+H2G1VXGXKPzbtpExyO0R/YunsXg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jz0q4-00054O-Ky; Fri, 24 Jul 2020 16:46:28 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jz0q4-0006WL-Ag; Fri, 24 Jul 2020 16:46:28 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 2/6] x86/iommu: add common page-table allocator
Date: Fri, 24 Jul 2020 17:46:15 +0100
Message-Id: <20200724164619.1245-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724164619.1245-1-paul@xen.org>
References: <20200724164619.1245-1-paul@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Instead of having separate page table allocation functions in VT-d and AMD
IOMMU code, use a common allocation function in the general x86 code.
Also, rather than walking the page tables and using a tasklet to free them
during iommu_domain_destroy(), add allocated page table pages to a list and
then simply walk the list to free them. This saves ~90 lines of code overall.

NOTE: There is no need to clear and sync PTEs during teardown since the per-
      device root entries will have already been cleared (when devices were
      de-assigned) so the page tables can no longer be accessed by the IOMMU.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/drivers/passthrough/amd/iommu.h         | 18 +----
 xen/drivers/passthrough/amd/iommu_map.c     | 10 +--
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 74 +++------------------
 xen/drivers/passthrough/iommu.c             | 23 -------
 xen/drivers/passthrough/vtd/iommu.c         | 51 ++------------
 xen/drivers/passthrough/x86/iommu.c         | 41 ++++++++++++
 xen/include/asm-x86/iommu.h                 |  6 ++
 xen/include/xen/iommu.h                     |  5 --
 8 files changed, 68 insertions(+), 160 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 3489c2a015..e2d174f3b4 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -226,7 +226,7 @@ int __must_check amd_iommu_map_page(struct domain *d, dfn_t dfn,
                                     unsigned int *flush_flags);
 int __must_check amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
                                       unsigned int *flush_flags);
-int __must_check amd_iommu_alloc_root(struct domain_iommu *hd);
+int __must_check amd_iommu_alloc_root(struct domain *d);
 int amd_iommu_reserve_domain_unity_map(struct domain *domain,
                                        paddr_t phys_addr, unsigned long size,
                                        int iw, int ir);
@@ -356,22 +356,6 @@ static inline int amd_iommu_get_paging_mode(unsigned long max_frames)
     return level;
 }
 
-static inline struct page_info *alloc_amd_iommu_pgtable(void)
-{
-    struct page_info *pg = alloc_domheap_page(NULL, 0);
-
-    if ( pg )
-        clear_domain_page(page_to_mfn(pg));
-
-    return pg;
-}
-
-static inline void free_amd_iommu_pgtable(struct page_info *pg)
-{
-    if ( pg )
-        free_domheap_page(pg);
-}
-
 static inline void *__alloc_amd_iommu_tables(unsigned int order)
 {
     return alloc_xenheap_pages(order, 0);
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index 06c564968c..d54cbf1cb9 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -217,7 +217,7 @@ static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
             mfn = next_table_mfn;
 
             /* allocate lower level page table */
-            table = alloc_amd_iommu_pgtable();
+            table = iommu_alloc_pgtable(d);
             if ( table == NULL )
             {
                 AMD_IOMMU_DEBUG("Cannot allocate I/O page table\n");
@@ -248,7 +248,7 @@ static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
 
             if ( next_table_mfn == 0 )
             {
-                table = alloc_amd_iommu_pgtable();
+                table = iommu_alloc_pgtable(d);
                 if ( table == NULL )
                 {
                     AMD_IOMMU_DEBUG("Cannot allocate I/O page table\n");
@@ -286,7 +286,7 @@ int amd_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
 
     spin_lock(&hd->arch.mapping_lock);
 
-    rc = amd_iommu_alloc_root(hd);
+    rc = amd_iommu_alloc_root(d);
     if ( rc )
     {
         spin_unlock(&hd->arch.mapping_lock);
@@ -458,7 +458,7 @@ int __init amd_iommu_quarantine_init(struct domain *d)
 
     spin_lock(&hd->arch.mapping_lock);
 
-    hd->arch.amd_iommu.root_table = alloc_amd_iommu_pgtable();
+    hd->arch.amd_iommu.root_table = iommu_alloc_pgtable(d);
     if ( !hd->arch.amd_iommu.root_table )
         goto out;
 
@@ -473,7 +473,7 @@ int __init amd_iommu_quarantine_init(struct domain *d)
          * page table pages, and the resulting allocations are always
          * zeroed.
          */
-        pg = alloc_amd_iommu_pgtable();
+        pg = iommu_alloc_pgtable(d);
         if ( !pg )
             break;
 
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index c386dc4387..fd9b1e7bd5 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -206,11 +206,13 @@ static int iov_enable_xt(void)
     return 0;
 }
 
-int amd_iommu_alloc_root(struct domain_iommu *hd)
+int amd_iommu_alloc_root(struct domain *d)
 {
+    struct domain_iommu *hd = dom_iommu(d);
+
     if ( unlikely(!hd->arch.amd_iommu.root_table) )
     {
-        hd->arch.amd_iommu.root_table = alloc_amd_iommu_pgtable();
+        hd->arch.amd_iommu.root_table = iommu_alloc_pgtable(d);
         if ( !hd->arch.amd_iommu.root_table )
             return -ENOMEM;
     }
@@ -218,12 +220,13 @@ int amd_iommu_alloc_root(struct domain_iommu *hd)
     return 0;
 }
 
-static int __must_check allocate_domain_resources(struct domain_iommu *hd)
+static int __must_check allocate_domain_resources(struct domain *d)
 {
+    struct domain_iommu *hd = dom_iommu(d);
     int rc;
 
     spin_lock(&hd->arch.mapping_lock);
-    rc = amd_iommu_alloc_root(hd);
+    rc = amd_iommu_alloc_root(d);
     spin_unlock(&hd->arch.mapping_lock);
 
     return rc;
@@ -255,7 +258,7 @@ static void __hwdom_init amd_iommu_hwdom_init(struct domain *d)
 {
     const struct amd_iommu *iommu;
 
-    if ( allocate_domain_resources(dom_iommu(d)) )
+    if ( allocate_domain_resources(d) )
         BUG();
 
     for_each_amd_iommu ( iommu )
@@ -324,7 +327,6 @@ static int reassign_device(struct domain *source, struct domain *target,
 {
     struct amd_iommu *iommu;
     int bdf, rc;
-    struct domain_iommu *t = dom_iommu(target);
 
     bdf = PCI_BDF2(pdev->bus, pdev->devfn);
     iommu = find_iommu_for_device(pdev->seg, bdf);
@@ -345,7 +347,7 @@ static int reassign_device(struct domain *source, struct domain *target,
         pdev->domain = target;
     }
 
-    rc = allocate_domain_resources(t);
+    rc = allocate_domain_resources(target);
     if ( rc )
         return rc;
 
@@ -378,64 +380,9 @@ static int amd_iommu_assign_device(struct domain *d, u8 devfn,
     return reassign_device(pdev->domain, d, devfn, pdev);
 }
 
-static void deallocate_next_page_table(struct page_info *pg, int level)
-{
-    PFN_ORDER(pg) = level;
-    spin_lock(&iommu_pt_cleanup_lock);
-    page_list_add_tail(pg, &iommu_pt_cleanup_list);
-    spin_unlock(&iommu_pt_cleanup_lock);
-}
-
-static void deallocate_page_table(struct page_info *pg)
-{
-    struct amd_iommu_pte *table_vaddr;
-    unsigned int index, level = PFN_ORDER(pg);
-
-    PFN_ORDER(pg) = 0;
-
-    if ( level <= 1 )
-    {
-        free_amd_iommu_pgtable(pg);
-        return;
-    }
-
-    table_vaddr = __map_domain_page(pg);
-
-    for ( index = 0; index < PTE_PER_TABLE_SIZE; index++ )
-    {
-        struct amd_iommu_pte *pde = &table_vaddr[index];
-
-        if ( pde->mfn && pde->next_level && pde->pr )
-        {
-            /* We do not support skip levels yet */
-            ASSERT(pde->next_level == level - 1);
-            deallocate_next_page_table(mfn_to_page(_mfn(pde->mfn)),
-                                       pde->next_level);
-        }
-    }
-
-    unmap_domain_page(table_vaddr);
-    free_amd_iommu_pgtable(pg);
-}
-
-static void deallocate_iommu_page_tables(struct domain *d)
-{
-    struct domain_iommu *hd = dom_iommu(d);
-
-    spin_lock(&hd->arch.mapping_lock);
-    if ( hd->arch.amd_iommu.root_table )
-    {
-        deallocate_next_page_table(hd->arch.amd_iommu.root_table,
-                                   hd->arch.amd_iommu.paging_mode);
-        hd->arch.amd_iommu.root_table = NULL;
-    }
-    spin_unlock(&hd->arch.mapping_lock);
-}
-
-
 static void amd_iommu_domain_destroy(struct domain *d)
 {
-    deallocate_iommu_page_tables(d);
+    dom_iommu(d)->arch.amd_iommu.root_table = NULL;
     amd_iommu_flush_all_pages(d);
 }
 
@@ -627,7 +574,6 @@ static const struct iommu_ops __initconstrel _iommu_ops = {
     .unmap_page = amd_iommu_unmap_page,
     .iotlb_flush = amd_iommu_flush_iotlb_pages,
     .iotlb_flush_all = amd_iommu_flush_iotlb_all,
-    .free_page_table = deallocate_page_table,
     .reassign_device = reassign_device,
     .get_device_group_id = amd_iommu_group_id,
     .enable_x2apic = iov_enable_xt,
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 1d644844ab..dad4088531 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -49,10 +49,6 @@ bool_t __read_mostly amd_iommu_perdev_intremap = 1;
 
 DEFINE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
 
-DEFINE_SPINLOCK(iommu_pt_cleanup_lock);
-PAGE_LIST_HEAD(iommu_pt_cleanup_list);
-static struct tasklet iommu_pt_cleanup_tasklet;
-
 static int __init parse_iommu_param(const char *s)
 {
     const char *ss;
@@ -226,7 +222,6 @@ static void iommu_teardown(struct domain *d)
     struct domain_iommu *hd = dom_iommu(d);
 
     hd->platform_ops->teardown(d);
-    tasklet_schedule(&iommu_pt_cleanup_tasklet);
 }
 
 void iommu_domain_destroy(struct domain *d)
@@ -366,23 +361,6 @@ int iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
     return iommu_call(hd->platform_ops, lookup_page, d, dfn, mfn, flags);
 }
 
-static void iommu_free_pagetables(void *unused)
-{
-    do {
-        struct page_info *pg;
-
-        spin_lock(&iommu_pt_cleanup_lock);
-        pg = page_list_remove_head(&iommu_pt_cleanup_list);
-        spin_unlock(&iommu_pt_cleanup_lock);
-        if ( !pg )
-            return;
-        iommu_vcall(iommu_get_ops(), free_page_table, pg);
-    } while ( !softirq_pending(smp_processor_id()) );
-
-    tasklet_schedule_on_cpu(&iommu_pt_cleanup_tasklet,
-                            cpumask_cycle(smp_processor_id(), &cpu_online_map));
-}
-
 int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned int page_count,
                       unsigned int flush_flags)
 {
@@ -506,7 +484,6 @@ int __init iommu_setup(void)
 #ifndef iommu_intremap
         printk("Interrupt remapping %sabled\n", iommu_intremap ? "en" : "dis");
 #endif
-        tasklet_init(&iommu_pt_cleanup_tasklet, iommu_free_pagetables, NULL);
     }
 
     return rc;
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index ac1373fb99..40834e2e7a 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -279,13 +279,16 @@ static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
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
@@ -675,45 +678,6 @@ static void dma_pte_clear_one(struct domain *domain, uint64_t addr,
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
@@ -1766,11 +1730,7 @@ static void iommu_domain_teardown(struct domain *d)
     if ( iommu_use_hap_pt(d) )
         return;
 
-    spin_lock(&hd->arch.mapping_lock);
-    iommu_free_pagetable(hd->arch.vtd.pgd_maddr,
-                         agaw_to_level(hd->arch.vtd.agaw));
     hd->arch.vtd.pgd_maddr = 0;
-    spin_unlock(&hd->arch.mapping_lock);
 }
 
 static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
@@ -2751,7 +2711,6 @@ static struct iommu_ops __initdata vtd_ops = {
     .map_page = intel_iommu_map_page,
     .unmap_page = intel_iommu_unmap_page,
     .lookup_page = intel_iommu_lookup_page,
-    .free_page_table = iommu_free_page_table,
     .reassign_device = reassign_device_ownership,
     .get_device_group_id = intel_iommu_group_id,
     .enable_x2apic = intel_iommu_enable_eim,
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index a12109a1de..b3c7da0fe2 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -140,11 +140,19 @@ int arch_iommu_domain_init(struct domain *d)
 
     spin_lock_init(&hd->arch.mapping_lock);
 
+    INIT_PAGE_LIST_HEAD(&hd->arch.pgtables.list);
+    spin_lock_init(&hd->arch.pgtables.lock);
+
     return 0;
 }
 
 void arch_iommu_domain_destroy(struct domain *d)
 {
+    struct domain_iommu *hd = dom_iommu(d);
+    struct page_info *pg;
+
+    while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
+        free_domheap_page(pg);
 }
 
 static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
@@ -257,6 +265,39 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
         return;
 }
 
+struct page_info *iommu_alloc_pgtable(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+#ifdef CONFIG_NUMA
+    unsigned int memflags = (hd->node == NUMA_NO_NODE) ?
+        0 : MEMF_node(hd->node);
+#else
+    unsigned int memflags = 0;
+#endif
+    struct page_info *pg;
+    void *p;
+
+    BUG_ON(!iommu_enabled);
+
+    pg = alloc_domheap_page(NULL, memflags);
+    if ( !pg )
+        return NULL;
+
+    p = __map_domain_page(pg);
+    clear_page(p);
+
+    if ( hd->platform_ops->sync_cache )
+        iommu_vcall(hd->platform_ops, sync_cache, p, PAGE_SIZE);
+
+    unmap_domain_page(p);
+
+    spin_lock(&hd->arch.pgtables.lock);
+    page_list_add(pg, &hd->arch.pgtables.list);
+    spin_unlock(&hd->arch.pgtables.lock);
+
+    return pg;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/asm-x86/iommu.h b/xen/include/asm-x86/iommu.h
index a7add5208c..280515966c 100644
--- a/xen/include/asm-x86/iommu.h
+++ b/xen/include/asm-x86/iommu.h
@@ -46,6 +46,10 @@ typedef uint64_t daddr_t;
 struct arch_iommu
 {
     spinlock_t mapping_lock; /* io page table lock */
+    struct {
+        struct page_list_head list;
+        spinlock_t lock;
+    } pgtables;
 
     union {
         /* Intel VT-d */
@@ -131,6 +135,8 @@ int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
         iommu_vcall(ops, sync_cache, addr, size);       \
 })
 
+struct page_info * __must_check iommu_alloc_pgtable(struct domain *d);
+
 #endif /* !__ARCH_X86_IOMMU_H__ */
 /*
  * Local variables:
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 3272874958..51c29180a4 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -263,8 +263,6 @@ struct iommu_ops {
     int __must_check (*lookup_page)(struct domain *d, dfn_t dfn, mfn_t *mfn,
                                     unsigned int *flags);
 
-    void (*free_page_table)(struct page_info *);
-
 #ifdef CONFIG_X86
     int (*enable_x2apic)(void);
     void (*disable_x2apic)(void);
@@ -381,9 +379,6 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
  */
 DECLARE_PER_CPU(bool_t, iommu_dont_flush_iotlb);
 
-extern struct spinlock iommu_pt_cleanup_lock;
-extern struct page_list_head iommu_pt_cleanup_list;
-
 #endif /* _IOMMU_H_ */
 
 /*
-- 
2.20.1


