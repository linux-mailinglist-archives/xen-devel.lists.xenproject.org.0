Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F180D23A4C5
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 14:30:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2Zar-0007OK-70; Mon, 03 Aug 2020 12:29:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rQjY=BN=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2Zaq-0007NV-0p
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 12:29:28 +0000
X-Inumbo-ID: f5855de0-d584-11ea-af26-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5855de0-d584-11ea-af26-12813bfff9fa;
 Mon, 03 Aug 2020 12:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gp6KEn5GkdD039Rg54pQRN4h4pTnAudvyLFE5D9IDcA=; b=q0ZeG5rXc1cTe6YOJ6RpE7Q9+p
 YKTIe5GlwNZyVXie+vRQ1/Twik7JBjY766K1ngLqVdOP7IySRMCDk0JjHt4zRppRQpyL7bCltvP4W
 loKrRirEwKHW7CTIobxOCSyq41Ae2M+4n4MzpeD1tg1UKQwRhcNcNqbApbldQ6cs7zkM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2Zah-0000SI-Dv; Mon, 03 Aug 2020 12:29:19 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2Zah-0000zk-5d; Mon, 03 Aug 2020 12:29:19 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 01/11] x86/iommu: re-arrange arch_iommu to separate common
 fields...
Date: Mon,  3 Aug 2020 13:29:04 +0100
Message-Id: <20200803122914.2259-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200803122914.2259-1-paul@xen.org>
References: <20200803122914.2259-1-paul@xen.org>
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
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

... from those specific to VT-d or AMD IOMMU, and put the latter in a union.

There is no functional change in this patch, although the initialization of
the 'mapped_rmrrs' list occurs slightly later in iommu_domain_init() since
it is now done (correctly) in VT-d specific code rather than in general x86
code.

NOTE: I have not combined the AMD IOMMU 'root_table' and VT-d 'pgd_maddr'
      fields even though they perform essentially the same function. The
      concept of 'root table' in the VT-d code is different from that in the
      AMD code so attempting to use a common name will probably only serve
      to confuse the reader.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>

v2:
 - s/amd_iommu/amd
 - Definitions still left inline as re-arrangement into implementation
   headers is non-trivial
 - Also s/u64/uint64_t and s/int/unsigned int
---
 xen/arch/x86/tboot.c                        |  4 +-
 xen/drivers/passthrough/amd/iommu_guest.c   |  8 ++--
 xen/drivers/passthrough/amd/iommu_map.c     | 14 +++---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 35 +++++++-------
 xen/drivers/passthrough/vtd/iommu.c         | 53 +++++++++++----------
 xen/drivers/passthrough/x86/iommu.c         |  1 -
 xen/include/asm-x86/iommu.h                 | 27 +++++++----
 7 files changed, 78 insertions(+), 64 deletions(-)

diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index 320e06f129..e66b0940c4 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -230,8 +230,8 @@ static void tboot_gen_domain_integrity(const uint8_t key[TB_KEY_SIZE],
         {
             const struct domain_iommu *dio = dom_iommu(d);
 
-            update_iommu_mac(&ctx, dio->arch.pgd_maddr,
-                             agaw_to_level(dio->arch.agaw));
+            update_iommu_mac(&ctx, dio->arch.vtd.pgd_maddr,
+                             agaw_to_level(dio->arch.vtd.agaw));
         }
     }
 
diff --git a/xen/drivers/passthrough/amd/iommu_guest.c b/xen/drivers/passthrough/amd/iommu_guest.c
index 014a72a54b..30b7353cd6 100644
--- a/xen/drivers/passthrough/amd/iommu_guest.c
+++ b/xen/drivers/passthrough/amd/iommu_guest.c
@@ -50,12 +50,12 @@ static uint16_t guest_bdf(struct domain *d, uint16_t machine_bdf)
 
 static inline struct guest_iommu *domain_iommu(struct domain *d)
 {
-    return dom_iommu(d)->arch.g_iommu;
+    return dom_iommu(d)->arch.amd.g_iommu;
 }
 
 static inline struct guest_iommu *vcpu_iommu(struct vcpu *v)
 {
-    return dom_iommu(v->domain)->arch.g_iommu;
+    return dom_iommu(v->domain)->arch.amd.g_iommu;
 }
 
 static void guest_iommu_enable(struct guest_iommu *iommu)
@@ -823,7 +823,7 @@ int guest_iommu_init(struct domain* d)
     guest_iommu_reg_init(iommu);
     iommu->mmio_base = ~0ULL;
     iommu->domain = d;
-    hd->arch.g_iommu = iommu;
+    hd->arch.amd.g_iommu = iommu;
 
     tasklet_init(&iommu->cmd_buffer_tasklet, guest_iommu_process_command, d);
 
@@ -845,5 +845,5 @@ void guest_iommu_destroy(struct domain *d)
     tasklet_kill(&iommu->cmd_buffer_tasklet);
     xfree(iommu);
 
-    dom_iommu(d)->arch.g_iommu = NULL;
+    dom_iommu(d)->arch.amd.g_iommu = NULL;
 }
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index 93e96cd69c..47b4472e8a 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -180,8 +180,8 @@ static int iommu_pde_from_dfn(struct domain *d, unsigned long dfn,
     struct page_info *table;
     const struct domain_iommu *hd = dom_iommu(d);
 
-    table = hd->arch.root_table;
-    level = hd->arch.paging_mode;
+    table = hd->arch.amd.root_table;
+    level = hd->arch.amd.paging_mode;
 
     BUG_ON( table == NULL || level < 1 || level > 6 );
 
@@ -325,7 +325,7 @@ int amd_iommu_unmap_page(struct domain *d, dfn_t dfn,
 
     spin_lock(&hd->arch.mapping_lock);
 
-    if ( !hd->arch.root_table )
+    if ( !hd->arch.amd.root_table )
     {
         spin_unlock(&hd->arch.mapping_lock);
         return 0;
@@ -450,7 +450,7 @@ int __init amd_iommu_quarantine_init(struct domain *d)
     unsigned int level = amd_iommu_get_paging_mode(end_gfn);
     struct amd_iommu_pte *table;
 
-    if ( hd->arch.root_table )
+    if ( hd->arch.amd.root_table )
     {
         ASSERT_UNREACHABLE();
         return 0;
@@ -458,11 +458,11 @@ int __init amd_iommu_quarantine_init(struct domain *d)
 
     spin_lock(&hd->arch.mapping_lock);
 
-    hd->arch.root_table = alloc_amd_iommu_pgtable();
-    if ( !hd->arch.root_table )
+    hd->arch.amd.root_table = alloc_amd_iommu_pgtable();
+    if ( !hd->arch.amd.root_table )
         goto out;
 
-    table = __map_domain_page(hd->arch.root_table);
+    table = __map_domain_page(hd->arch.amd.root_table);
     while ( level )
     {
         struct page_info *pg;
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 5f5f4a2eac..c27bfbd48e 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -91,7 +91,8 @@ static void amd_iommu_setup_domain_device(
     u8 bus = pdev->bus;
     const struct domain_iommu *hd = dom_iommu(domain);
 
-    BUG_ON( !hd->arch.root_table || !hd->arch.paging_mode ||
+    BUG_ON( !hd->arch.amd.root_table ||
+            !hd->arch.amd.paging_mode ||
             !iommu->dev_table.buffer );
 
     if ( iommu_hwdom_passthrough && is_hardware_domain(domain) )
@@ -110,8 +111,8 @@ static void amd_iommu_setup_domain_device(
 
         /* bind DTE to domain page-tables */
         amd_iommu_set_root_page_table(
-            dte, page_to_maddr(hd->arch.root_table), domain->domain_id,
-            hd->arch.paging_mode, valid);
+            dte, page_to_maddr(hd->arch.amd.root_table),
+            domain->domain_id, hd->arch.amd.paging_mode, valid);
 
         /* Undo what amd_iommu_disable_domain_device() may have done. */
         ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
@@ -131,8 +132,8 @@ static void amd_iommu_setup_domain_device(
                         "root table = %#"PRIx64", "
                         "domain = %d, paging mode = %d\n",
                         req_id, pdev->type,
-                        page_to_maddr(hd->arch.root_table),
-                        domain->domain_id, hd->arch.paging_mode);
+                        page_to_maddr(hd->arch.amd.root_table),
+                        domain->domain_id, hd->arch.amd.paging_mode);
     }
 
     spin_unlock_irqrestore(&iommu->lock, flags);
@@ -206,10 +207,10 @@ static int iov_enable_xt(void)
 
 int amd_iommu_alloc_root(struct domain_iommu *hd)
 {
-    if ( unlikely(!hd->arch.root_table) )
+    if ( unlikely(!hd->arch.amd.root_table) )
     {
-        hd->arch.root_table = alloc_amd_iommu_pgtable();
-        if ( !hd->arch.root_table )
+        hd->arch.amd.root_table = alloc_amd_iommu_pgtable();
+        if ( !hd->arch.amd.root_table )
             return -ENOMEM;
     }
 
@@ -239,7 +240,7 @@ static int amd_iommu_domain_init(struct domain *d)
      *   physical address space we give it, but this isn't known yet so use 4
      *   unilaterally.
      */
-    hd->arch.paging_mode = amd_iommu_get_paging_mode(
+    hd->arch.amd.paging_mode = amd_iommu_get_paging_mode(
         is_hvm_domain(d)
         ? 1ul << (DEFAULT_DOMAIN_ADDRESS_WIDTH - PAGE_SHIFT)
         : get_upper_mfn_bound() + 1);
@@ -305,7 +306,7 @@ static void amd_iommu_disable_domain_device(const struct domain *domain,
         AMD_IOMMU_DEBUG("Disable: device id = %#x, "
                         "domain = %d, paging mode = %d\n",
                         req_id,  domain->domain_id,
-                        dom_iommu(domain)->arch.paging_mode);
+                        dom_iommu(domain)->arch.amd.paging_mode);
     }
     spin_unlock_irqrestore(&iommu->lock, flags);
 
@@ -420,10 +421,11 @@ static void deallocate_iommu_page_tables(struct domain *d)
     struct domain_iommu *hd = dom_iommu(d);
 
     spin_lock(&hd->arch.mapping_lock);
-    if ( hd->arch.root_table )
+    if ( hd->arch.amd.root_table )
     {
-        deallocate_next_page_table(hd->arch.root_table, hd->arch.paging_mode);
-        hd->arch.root_table = NULL;
+        deallocate_next_page_table(hd->arch.amd.root_table,
+                                   hd->arch.amd.paging_mode);
+        hd->arch.amd.root_table = NULL;
     }
     spin_unlock(&hd->arch.mapping_lock);
 }
@@ -598,11 +600,12 @@ static void amd_dump_p2m_table(struct domain *d)
 {
     const struct domain_iommu *hd = dom_iommu(d);
 
-    if ( !hd->arch.root_table )
+    if ( !hd->arch.amd.root_table )
         return;
 
-    printk("p2m table has %d levels\n", hd->arch.paging_mode);
-    amd_dump_p2m_table_level(hd->arch.root_table, hd->arch.paging_mode, 0, 0);
+    printk("p2m table has %d levels\n", hd->arch.amd.paging_mode);
+    amd_dump_p2m_table_level(hd->arch.amd.root_table,
+                             hd->arch.amd.paging_mode, 0, 0);
 }
 
 static const struct iommu_ops __initconstrel _iommu_ops = {
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index deaeab095d..94e0455a4d 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -257,20 +257,20 @@ static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
 static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
 {
     struct domain_iommu *hd = dom_iommu(domain);
-    int addr_width = agaw_to_width(hd->arch.agaw);
+    int addr_width = agaw_to_width(hd->arch.vtd.agaw);
     struct dma_pte *parent, *pte = NULL;
-    int level = agaw_to_level(hd->arch.agaw);
+    int level = agaw_to_level(hd->arch.vtd.agaw);
     int offset;
     u64 pte_maddr = 0;
 
     addr &= (((u64)1) << addr_width) - 1;
     ASSERT(spin_is_locked(&hd->arch.mapping_lock));
-    if ( !hd->arch.pgd_maddr &&
+    if ( !hd->arch.vtd.pgd_maddr &&
          (!alloc ||
-          ((hd->arch.pgd_maddr = alloc_pgtable_maddr(1, hd->node)) == 0)) )
+          ((hd->arch.vtd.pgd_maddr = alloc_pgtable_maddr(1, hd->node)) == 0)) )
         goto out;
 
-    parent = (struct dma_pte *)map_vtd_domain_page(hd->arch.pgd_maddr);
+    parent = (struct dma_pte *)map_vtd_domain_page(hd->arch.vtd.pgd_maddr);
     while ( level > 1 )
     {
         offset = address_level_offset(addr, level);
@@ -593,7 +593,7 @@ static int __must_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
     {
         iommu = drhd->iommu;
 
-        if ( !test_bit(iommu->index, &hd->arch.iommu_bitmap) )
+        if ( !test_bit(iommu->index, &hd->arch.vtd.iommu_bitmap) )
             continue;
 
         flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
@@ -1278,7 +1278,10 @@ void __init iommu_free(struct acpi_drhd_unit *drhd)
 
 static int intel_iommu_domain_init(struct domain *d)
 {
-    dom_iommu(d)->arch.agaw = width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH);
+    struct domain_iommu *hd = dom_iommu(d);
+
+    hd->arch.vtd.agaw = width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH);
+    INIT_LIST_HEAD(&hd->arch.vtd.mapped_rmrrs);
 
     return 0;
 }
@@ -1375,10 +1378,10 @@ int domain_context_mapping_one(
         spin_lock(&hd->arch.mapping_lock);
 
         /* Ensure we have pagetables allocated down to leaf PTE. */
-        if ( hd->arch.pgd_maddr == 0 )
+        if ( hd->arch.vtd.pgd_maddr == 0 )
         {
             addr_to_dma_page_maddr(domain, 0, 1);
-            if ( hd->arch.pgd_maddr == 0 )
+            if ( hd->arch.vtd.pgd_maddr == 0 )
             {
             nomem:
                 spin_unlock(&hd->arch.mapping_lock);
@@ -1389,7 +1392,7 @@ int domain_context_mapping_one(
         }
 
         /* Skip top levels of page tables for 2- and 3-level DRHDs. */
-        pgd_maddr = hd->arch.pgd_maddr;
+        pgd_maddr = hd->arch.vtd.pgd_maddr;
         for ( agaw = level_to_agaw(4);
               agaw != level_to_agaw(iommu->nr_pt_levels);
               agaw-- )
@@ -1443,7 +1446,7 @@ int domain_context_mapping_one(
     if ( rc > 0 )
         rc = 0;
 
-    set_bit(iommu->index, &hd->arch.iommu_bitmap);
+    set_bit(iommu->index, &hd->arch.vtd.iommu_bitmap);
 
     unmap_vtd_domain_page(context_entries);
 
@@ -1714,7 +1717,7 @@ static int domain_context_unmap(struct domain *domain, u8 devfn,
     {
         int iommu_domid;
 
-        clear_bit(iommu->index, &dom_iommu(domain)->arch.iommu_bitmap);
+        clear_bit(iommu->index, &dom_iommu(domain)->arch.vtd.iommu_bitmap);
 
         iommu_domid = domain_iommu_domid(domain, iommu);
         if ( iommu_domid == -1 )
@@ -1739,7 +1742,7 @@ static void iommu_domain_teardown(struct domain *d)
     if ( list_empty(&acpi_drhd_units) )
         return;
 
-    list_for_each_entry_safe ( mrmrr, tmp, &hd->arch.mapped_rmrrs, list )
+    list_for_each_entry_safe ( mrmrr, tmp, &hd->arch.vtd.mapped_rmrrs, list )
     {
         list_del(&mrmrr->list);
         xfree(mrmrr);
@@ -1751,8 +1754,9 @@ static void iommu_domain_teardown(struct domain *d)
         return;
 
     spin_lock(&hd->arch.mapping_lock);
-    iommu_free_pagetable(hd->arch.pgd_maddr, agaw_to_level(hd->arch.agaw));
-    hd->arch.pgd_maddr = 0;
+    iommu_free_pagetable(hd->arch.vtd.pgd_maddr,
+                         agaw_to_level(hd->arch.vtd.agaw));
+    hd->arch.vtd.pgd_maddr = 0;
     spin_unlock(&hd->arch.mapping_lock);
 }
 
@@ -1892,7 +1896,7 @@ static void iommu_set_pgd(struct domain *d)
     mfn_t pgd_mfn;
 
     pgd_mfn = pagetable_get_mfn(p2m_get_pagetable(p2m_get_hostp2m(d)));
-    dom_iommu(d)->arch.pgd_maddr =
+    dom_iommu(d)->arch.vtd.pgd_maddr =
         pagetable_get_paddr(pagetable_from_mfn(pgd_mfn));
 }
 
@@ -1912,7 +1916,7 @@ static int rmrr_identity_mapping(struct domain *d, bool_t map,
      * No need to acquire hd->arch.mapping_lock: Both insertion and removal
      * get done while holding pcidevs_lock.
      */
-    list_for_each_entry( mrmrr, &hd->arch.mapped_rmrrs, list )
+    list_for_each_entry( mrmrr, &hd->arch.vtd.mapped_rmrrs, list )
     {
         if ( mrmrr->base == rmrr->base_address &&
              mrmrr->end == rmrr->end_address )
@@ -1959,7 +1963,7 @@ static int rmrr_identity_mapping(struct domain *d, bool_t map,
     mrmrr->base = rmrr->base_address;
     mrmrr->end = rmrr->end_address;
     mrmrr->count = 1;
-    list_add_tail(&mrmrr->list, &hd->arch.mapped_rmrrs);
+    list_add_tail(&mrmrr->list, &hd->arch.vtd.mapped_rmrrs);
 
     return 0;
 }
@@ -2657,8 +2661,9 @@ static void vtd_dump_p2m_table(struct domain *d)
         return;
 
     hd = dom_iommu(d);
-    printk("p2m table has %d levels\n", agaw_to_level(hd->arch.agaw));
-    vtd_dump_p2m_table_level(hd->arch.pgd_maddr, agaw_to_level(hd->arch.agaw), 0, 0);
+    printk("p2m table has %d levels\n", agaw_to_level(hd->arch.vtd.agaw));
+    vtd_dump_p2m_table_level(hd->arch.vtd.pgd_maddr,
+                             agaw_to_level(hd->arch.vtd.agaw), 0, 0);
 }
 
 static int __init intel_iommu_quarantine_init(struct domain *d)
@@ -2669,7 +2674,7 @@ static int __init intel_iommu_quarantine_init(struct domain *d)
     unsigned int level = agaw_to_level(agaw);
     int rc;
 
-    if ( hd->arch.pgd_maddr )
+    if ( hd->arch.vtd.pgd_maddr )
     {
         ASSERT_UNREACHABLE();
         return 0;
@@ -2677,11 +2682,11 @@ static int __init intel_iommu_quarantine_init(struct domain *d)
 
     spin_lock(&hd->arch.mapping_lock);
 
-    hd->arch.pgd_maddr = alloc_pgtable_maddr(1, hd->node);
-    if ( !hd->arch.pgd_maddr )
+    hd->arch.vtd.pgd_maddr = alloc_pgtable_maddr(1, hd->node);
+    if ( !hd->arch.vtd.pgd_maddr )
         goto out;
 
-    parent = map_vtd_domain_page(hd->arch.pgd_maddr);
+    parent = map_vtd_domain_page(hd->arch.vtd.pgd_maddr);
     while ( level )
     {
         uint64_t maddr;
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 3d7670e8c6..a12109a1de 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -139,7 +139,6 @@ int arch_iommu_domain_init(struct domain *d)
     struct domain_iommu *hd = dom_iommu(d);
 
     spin_lock_init(&hd->arch.mapping_lock);
-    INIT_LIST_HEAD(&hd->arch.mapped_rmrrs);
 
     return 0;
 }
diff --git a/xen/include/asm-x86/iommu.h b/xen/include/asm-x86/iommu.h
index 6c9d5e5632..8ce97c981f 100644
--- a/xen/include/asm-x86/iommu.h
+++ b/xen/include/asm-x86/iommu.h
@@ -45,16 +45,23 @@ typedef uint64_t daddr_t;
 
 struct arch_iommu
 {
-    u64 pgd_maddr;                 /* io page directory machine address */
-    spinlock_t mapping_lock;            /* io page table lock */
-    int agaw;     /* adjusted guest address width, 0 is level 2 30-bit */
-    u64 iommu_bitmap;              /* bitmap of iommu(s) that the domain uses */
-    struct list_head mapped_rmrrs;
-
-    /* amd iommu support */
-    int paging_mode;
-    struct page_info *root_table;
-    struct guest_iommu *g_iommu;
+    spinlock_t mapping_lock; /* io page table lock */
+
+    union {
+        /* Intel VT-d */
+        struct {
+            uint64_t pgd_maddr; /* io page directory machine address */
+            unsigned int agaw; /* adjusted guest address width, 0 is level 2 30-bit */
+            uint64_t iommu_bitmap; /* bitmap of iommu(s) that the domain uses */
+            struct list_head mapped_rmrrs;
+        } vtd;
+        /* AMD IOMMU */
+        struct {
+            unsigned int paging_mode;
+            struct page_info *root_table;
+            struct guest_iommu *g_iommu;
+        } amd;
+    };
 };
 
 extern struct iommu_ops iommu_ops;
-- 
2.20.1


