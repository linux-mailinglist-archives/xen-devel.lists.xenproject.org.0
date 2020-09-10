Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 602FF264850
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 16:50:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGNu9-0007Rv-7U; Thu, 10 Sep 2020 14:50:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S6nR=CT=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kGNu7-0007KD-9j
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 14:50:27 +0000
X-Inumbo-ID: 24e9e05c-7021-4502-9d2d-42ceba3c2396
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24e9e05c-7021-4502-9d2d-42ceba3c2396;
 Thu, 10 Sep 2020 14:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=IBya8It80fKh60FjKmKLdWSze09wKfnEA5q1qER2H+c=; b=xEL9roDv0bGJxcpyopyV7lM7rb
 6LrsBYf/W95/9hO8kWg06dxFB2cJDwBucnAZLcn4EG2yX69y/Mxx0ig1kw70FmqmiqdwI9tMkbHj3
 QM9M3L3Pwuz3sCOpMsuB9vGSBlEZvrAp6uqyfnB7Aihn82KGs5/Kpwly2U/mlgslcgmo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGNtz-0006vK-4q; Thu, 10 Sep 2020 14:50:19 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGNty-0004ZM-So; Thu, 10 Sep 2020 14:50:19 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v6 7/8] iommu: remove the share_p2m operation
Date: Thu, 10 Sep 2020 15:50:06 +0100
Message-Id: <20200910145007.14107-8-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200910145007.14107-1-paul@xen.org>
References: <20200910145007.14107-1-paul@xen.org>
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

Sharing of HAP tables is now VT-d specific so the operation is never defined
for AMD IOMMU any more. There's also no need to pro-actively set vtd.pgd_maddr
when using shared EPT as it is straightforward to simply define a helper
function to return the appropriate value in the shared and non-shared cases.

NOTE: This patch also modifies unmap_vtd_domain_page() to take a const
      pointer since the only thing it calls, unmap_domain_page(), also takes
      a const pointer.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>

v6:
 - Adjust code to return P2M paddr
 - Add removed comment back in

v5:
 - Pass 'nr_pt_levels' into domain_pgd_maddr() directly

v2:
 - Put the PGD level adjust into the helper function too, since it is
   irrelevant in the shared EPT case
---
 xen/arch/x86/mm/p2m.c                 |  3 -
 xen/drivers/passthrough/iommu.c       |  8 ---
 xen/drivers/passthrough/vtd/extern.h  |  2 +-
 xen/drivers/passthrough/vtd/iommu.c   | 90 +++++++++++++++------------
 xen/drivers/passthrough/vtd/x86/vtd.c |  2 +-
 xen/include/xen/iommu.h               |  3 -
 6 files changed, 52 insertions(+), 56 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 01ff92862d..d382199c88 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -726,9 +726,6 @@ int p2m_alloc_table(struct p2m_domain *p2m)
 
     p2m->phys_table = pagetable_from_mfn(top_mfn);
 
-    if ( hap_enabled(d) )
-        iommu_share_p2m_table(d);
-
     p2m_unlock(p2m);
     return 0;
 }
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index e0d36e6bef..e9b6c9a1ec 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -500,14 +500,6 @@ int iommu_do_domctl(
     return ret;
 }
 
-void iommu_share_p2m_table(struct domain* d)
-{
-    ASSERT(hap_enabled(d));
-
-    if ( iommu_use_hap_pt(d) )
-        iommu_get_ops()->share_p2m(d);
-}
-
 void iommu_crash_shutdown(void)
 {
     if ( !iommu_crash_disable )
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index ada3c3098c..9cf5b578c9 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -72,7 +72,7 @@ void flush_all_cache(void);
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
 void free_pgtable_maddr(u64 maddr);
 void *map_vtd_domain_page(u64 maddr);
-void unmap_vtd_domain_page(void *va);
+void unmap_vtd_domain_page(const void *va);
 int domain_context_mapping_one(struct domain *domain, struct vtd_iommu *iommu,
                                u8 bus, u8 devfn, const struct pci_dev *);
 int domain_context_unmap_one(struct domain *domain, struct vtd_iommu *iommu,
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 68cf0e535a..58d4550a4c 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -318,6 +318,48 @@ static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
     return pte_maddr;
 }
 
+static uint64_t domain_pgd_maddr(struct domain *d, unsigned int nr_pt_levels)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    uint64_t pgd_maddr;
+    unsigned int agaw;
+
+    ASSERT(spin_is_locked(&hd->arch.mapping_lock));
+
+    if ( iommu_use_hap_pt(d) )
+    {
+        pagetable_t pgt = p2m_get_pagetable(p2m_get_hostp2m(d));
+
+        return pagetable_get_paddr(pgt);
+    }
+
+    if ( !hd->arch.vtd.pgd_maddr )
+    {
+        /* Ensure we have pagetables allocated down to leaf PTE. */
+        addr_to_dma_page_maddr(d, 0, 1);
+
+        if ( !hd->arch.vtd.pgd_maddr )
+            return 0;
+    }
+
+    pgd_maddr = hd->arch.vtd.pgd_maddr;
+
+    /* Skip top levels of page tables for 2- and 3-level DRHDs. */
+    for ( agaw = level_to_agaw(4);
+          agaw != level_to_agaw(nr_pt_levels);
+          agaw-- )
+    {
+        const struct dma_pte *p = map_vtd_domain_page(pgd_maddr);
+
+        pgd_maddr = dma_pte_addr(*p);
+        unmap_vtd_domain_page(p);
+        if ( !pgd_maddr )
+            return 0;
+    }
+
+    return pgd_maddr;
+}
+
 static void iommu_flush_write_buffer(struct vtd_iommu *iommu)
 {
     u32 val;
@@ -1286,7 +1328,7 @@ int domain_context_mapping_one(
     struct context_entry *context, *context_entries;
     u64 maddr, pgd_maddr;
     u16 seg = iommu->drhd->segment;
-    int agaw, rc, ret;
+    int rc, ret;
     bool_t flush_dev_iotlb;
 
     ASSERT(pcidevs_locked());
@@ -1340,37 +1382,18 @@ int domain_context_mapping_one(
     if ( iommu_hwdom_passthrough && is_hardware_domain(domain) )
     {
         context_set_translation_type(*context, CONTEXT_TT_PASS_THRU);
-        agaw = level_to_agaw(iommu->nr_pt_levels);
     }
     else
     {
         spin_lock(&hd->arch.mapping_lock);
 
-        /* Ensure we have pagetables allocated down to leaf PTE. */
-        if ( hd->arch.vtd.pgd_maddr == 0 )
-        {
-            addr_to_dma_page_maddr(domain, 0, 1);
-            if ( hd->arch.vtd.pgd_maddr == 0 )
-            {
-            nomem:
-                spin_unlock(&hd->arch.mapping_lock);
-                spin_unlock(&iommu->lock);
-                unmap_vtd_domain_page(context_entries);
-                return -ENOMEM;
-            }
-        }
-
-        /* Skip top levels of page tables for 2- and 3-level DRHDs. */
-        pgd_maddr = hd->arch.vtd.pgd_maddr;
-        for ( agaw = level_to_agaw(4);
-              agaw != level_to_agaw(iommu->nr_pt_levels);
-              agaw-- )
+        pgd_maddr = domain_pgd_maddr(domain, iommu->nr_pt_levels);
+        if ( !pgd_maddr )
         {
-            struct dma_pte *p = map_vtd_domain_page(pgd_maddr);
-            pgd_maddr = dma_pte_addr(*p);
-            unmap_vtd_domain_page(p);
-            if ( pgd_maddr == 0 )
-                goto nomem;
+            spin_unlock(&hd->arch.mapping_lock);
+            spin_unlock(&iommu->lock);
+            unmap_vtd_domain_page(context_entries);
+            return -ENOMEM;
         }
 
         context_set_address_root(*context, pgd_maddr);
@@ -1389,7 +1412,7 @@ int domain_context_mapping_one(
         return -EFAULT;
     }
 
-    context_set_address_width(*context, agaw);
+    context_set_address_width(*context, level_to_agaw(iommu->nr_pt_levels));
     context_set_fault_enable(*context);
     context_set_present(*context);
     iommu_sync_cache(context, sizeof(struct context_entry));
@@ -1848,18 +1871,6 @@ static int __init vtd_ept_page_compatible(struct vtd_iommu *iommu)
            (ept_has_1gb(ept_cap) && opt_hap_1gb) <= cap_sps_1gb(vtd_cap);
 }
 
-/*
- * set VT-d page table directory to EPT table if allowed
- */
-static void iommu_set_pgd(struct domain *d)
-{
-    mfn_t pgd_mfn;
-
-    pgd_mfn = pagetable_get_mfn(p2m_get_pagetable(p2m_get_hostp2m(d)));
-    dom_iommu(d)->arch.vtd.pgd_maddr =
-        pagetable_get_paddr(pagetable_from_mfn(pgd_mfn));
-}
-
 static int rmrr_identity_mapping(struct domain *d, bool_t map,
                                  const struct acpi_rmrr_unit *rmrr,
                                  u32 flag)
@@ -2719,7 +2730,6 @@ static struct iommu_ops __initdata vtd_ops = {
     .adjust_irq_affinities = adjust_vtd_irq_affinities,
     .suspend = vtd_suspend,
     .resume = vtd_resume,
-    .share_p2m = iommu_set_pgd,
     .crash_shutdown = vtd_crash_shutdown,
     .iotlb_flush = iommu_flush_iotlb_pages,
     .iotlb_flush_all = iommu_flush_iotlb_all,
diff --git a/xen/drivers/passthrough/vtd/x86/vtd.c b/xen/drivers/passthrough/vtd/x86/vtd.c
index bbe358dc36..6681dccd69 100644
--- a/xen/drivers/passthrough/vtd/x86/vtd.c
+++ b/xen/drivers/passthrough/vtd/x86/vtd.c
@@ -42,7 +42,7 @@ void *map_vtd_domain_page(u64 maddr)
     return map_domain_page(_mfn(paddr_to_pfn(maddr)));
 }
 
-void unmap_vtd_domain_page(void *va)
+void unmap_vtd_domain_page(const void *va)
 {
     unmap_domain_page(va);
 }
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index a2eefe8582..373145266f 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -270,7 +270,6 @@ struct iommu_ops {
 
     int __must_check (*suspend)(void);
     void (*resume)(void);
-    void (*share_p2m)(struct domain *d);
     void (*crash_shutdown)(void);
     int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
                                     unsigned long page_count,
@@ -347,8 +346,6 @@ void iommu_resume(void);
 void iommu_crash_shutdown(void);
 int iommu_get_reserved_device_memory(iommu_grdm_t *, void *);
 
-void iommu_share_p2m_table(struct domain *d);
-
 #ifdef CONFIG_HAS_PCI
 int iommu_do_pci_domctl(struct xen_domctl *, struct domain *d,
                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
-- 
2.20.1


