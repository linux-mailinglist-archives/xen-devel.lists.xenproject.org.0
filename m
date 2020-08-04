Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287D923BBCC
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 16:10:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2xde-0002tI-ES; Tue, 04 Aug 2020 14:09:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hzL0=BO=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2xdd-0002sb-2d
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 14:09:57 +0000
X-Inumbo-ID: 8aa9938d-f19e-463d-9cf1-90edaedb9d7c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8aa9938d-f19e-463d-9cf1-90edaedb9d7c;
 Tue, 04 Aug 2020 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JvpjW2yuqqsP9Nf9RqSvKwq47T2XEc66z0tnFgkOJgM=; b=xwRDKOxBVWnuOYXjXfJ1l7Y7RT
 /Re88HAIGfds3UwtASLEhpS8cDOsiSt7FpdYq0ztVDs4/pkOX5/+iulbdk1eQTT/LihBH4oHxAgDD
 2IBjcQt0Vz67LtoBJYqfbuBdZwQxCWKgNpGf69gxnQFP0botnfTkpGZAQJCbPRAHHN8s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2xdW-0000NX-8o; Tue, 04 Aug 2020 14:09:50 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2xD0-0003ag-Kz; Tue, 04 Aug 2020 13:42:26 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 10/14] iommu: remove the share_p2m operation
Date: Tue,  4 Aug 2020 14:42:05 +0100
Message-Id: <20200804134209.8717-11-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200804134209.8717-1-paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Sharing of HAP tables is now VT-d specific so the operation is never defined
for AMD IOMMU any more. There's also no need to pro-actively set vtd.pgd_maddr
when using shared EPT as it is straightforward to simply define a helper
function to return the appropriate value in the shared and non-shared cases.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>

v2:
  - Put the PGD level adjust into the helper function too, since it is
    irrelevant in the shared EPT case
---
 xen/arch/x86/mm/p2m.c               |  3 -
 xen/drivers/passthrough/iommu.c     |  8 ---
 xen/drivers/passthrough/vtd/iommu.c | 90 ++++++++++++++++-------------
 xen/include/xen/iommu.h             |  3 -
 4 files changed, 50 insertions(+), 54 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 9f8b9bc5fd..3bd8d83d23 100644
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
index ab44c332bb..7464f10d1c 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -498,14 +498,6 @@ int iommu_do_domctl(
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
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 68cf0e535a..a532d9e88c 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -318,6 +318,48 @@ static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
     return pte_maddr;
 }
 
+static uint64_t domain_pgd_maddr(struct domain *d, struct vtd_iommu *iommu)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+    uint64_t pgd_maddr;
+    unsigned int agaw;
+
+    ASSERT(spin_is_locked(&hd->arch.mapping_lock));
+
+    if ( iommu_use_hap_pt(d) )
+    {
+        mfn_t pgd_mfn =
+            pagetable_get_mfn(p2m_get_pagetable(p2m_get_hostp2m(d)));
+
+        return pagetable_get_paddr(pagetable_from_mfn(pgd_mfn));
+    }
+
+    if ( !hd->arch.vtd.pgd_maddr )
+    {
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
+          agaw != level_to_agaw(iommu->nr_pt_levels);
+          agaw-- )
+    {
+        struct dma_pte *p = map_vtd_domain_page(pgd_maddr);
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
+        pgd_maddr = domain_pgd_maddr(domain, iommu);
+        if ( !pgd_maddr )
         {
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
-        {
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
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index b7e5d3da09..1f25d2082f 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -271,7 +271,6 @@ struct iommu_ops {
 
     int __must_check (*suspend)(void);
     void (*resume)(void);
-    void (*share_p2m)(struct domain *d);
     void (*crash_shutdown)(void);
     int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
                                     unsigned long page_count,
@@ -348,8 +347,6 @@ void iommu_resume(void);
 void iommu_crash_shutdown(void);
 int iommu_get_reserved_device_memory(iommu_grdm_t *, void *);
 
-void iommu_share_p2m_table(struct domain *d);
-
 #ifdef CONFIG_HAS_PCI
 int iommu_do_pci_domctl(struct xen_domctl *, struct domain *d,
                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
-- 
2.20.1


