Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B9322CB64
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 18:46:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz0qJ-0001CS-Vu; Fri, 24 Jul 2020 16:46:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yL+a=BD=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jz0qI-00015d-EB
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 16:46:42 +0000
X-Inumbo-ID: 3b709e24-cdcd-11ea-a42a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b709e24-cdcd-11ea-a42a-12813bfff9fa;
 Fri, 24 Jul 2020 16:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hPWM6csyUMwffzj4JmSc+ReN9q/RGN5MRKt+OXyzDgc=; b=WI+SOeayTYJXOwV1a/7osUm/8r
 myWTAuywvxg+Fsj/nEulRnchp+XY5sMNkLIEY7SO/zRq4PL5Gi+uIovYKpcZDDXLmEk6A0mJtU5d7
 IZG/kgLgl7uA3xNhej/ePuX0tfhUCU/yG8Wn0LxB2p8//kPHJCkHTkyU1xsQMZj+y/I8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jz0q8-00054i-9D; Fri, 24 Jul 2020 16:46:32 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jz0q8-0006WL-0C; Fri, 24 Jul 2020 16:46:32 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 5/6] iommu: remove the share_p2m operation
Date: Fri, 24 Jul 2020 17:46:18 +0100
Message-Id: <20200724164619.1245-6-paul@xen.org>
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
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Sharing of HAP tables is VT-d specific so the operation is never defined for
AMD IOMMU. There's also no need to pro-actively set vtd.pgd_maddr when using
shared EPT as it is straightforward to simply define a helper function to
return the appropriate value in the shared and non-shared cases.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/mm/p2m.c               |  3 --
 xen/drivers/passthrough/iommu.c     |  8 -----
 xen/drivers/passthrough/vtd/iommu.c | 55 ++++++++++++++---------------
 xen/include/xen/iommu.h             |  3 --
 4 files changed, 27 insertions(+), 42 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index c5f52a4118..95b5055648 100644
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
index f32d8e25a8..6a3803ff2c 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -478,14 +478,6 @@ int iommu_do_domctl(
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
index 149d7122c3..d09ca3fb3d 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -313,6 +313,26 @@ static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
     return pte_maddr;
 }
 
+static u64 domain_pgd_maddr(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
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
+        addr_to_dma_page_maddr(d, 0, 1);
+
+    return hd->arch.vtd.pgd_maddr;
+}
+
 static void iommu_flush_write_buffer(struct vtd_iommu *iommu)
 {
     u32 val;
@@ -1347,22 +1367,17 @@ int domain_context_mapping_one(
     {
         spin_lock(&hd->arch.mapping_lock);
 
-        /* Ensure we have pagetables allocated down to leaf PTE. */
-        if ( hd->arch.vtd.pgd_maddr == 0 )
+        pgd_maddr = domain_pgd_maddr(domain);
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
+        nomem:
+            spin_unlock(&hd->arch.mapping_lock);
+            spin_unlock(&iommu->lock);
+            unmap_vtd_domain_page(context_entries);
+            return -ENOMEM;
         }
 
         /* Skip top levels of page tables for 2- and 3-level DRHDs. */
-        pgd_maddr = hd->arch.vtd.pgd_maddr;
         for ( agaw = level_to_agaw(4);
               agaw != level_to_agaw(iommu->nr_pt_levels);
               agaw-- )
@@ -1727,9 +1742,6 @@ static void iommu_domain_teardown(struct domain *d)
 
     ASSERT(is_iommu_enabled(d));
 
-    if ( iommu_use_hap_pt(d) )
-        return;
-
     hd->arch.vtd.pgd_maddr = 0;
 }
 
@@ -1821,18 +1833,6 @@ static int __init vtd_ept_page_compatible(struct vtd_iommu *iommu)
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
@@ -2682,7 +2682,6 @@ static struct iommu_ops __initdata vtd_ops = {
     .adjust_irq_affinities = adjust_vtd_irq_affinities,
     .suspend = vtd_suspend,
     .resume = vtd_resume,
-    .share_p2m = iommu_set_pgd,
     .crash_shutdown = vtd_crash_shutdown,
     .iotlb_flush = iommu_flush_iotlb_pages,
     .iotlb_flush_all = iommu_flush_iotlb_all,
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index ec639ba128..cc122fd10b 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -266,7 +266,6 @@ struct iommu_ops {
 
     int __must_check (*suspend)(void);
     void (*resume)(void);
-    void (*share_p2m)(struct domain *d);
     void (*crash_shutdown)(void);
     int __must_check (*iotlb_flush)(struct domain *d, dfn_t dfn,
                                     unsigned int page_count,
@@ -343,8 +342,6 @@ void iommu_resume(void);
 void iommu_crash_shutdown(void);
 int iommu_get_reserved_device_memory(iommu_grdm_t *, void *);
 
-void iommu_share_p2m_table(struct domain *d);
-
 #ifdef CONFIG_HAS_PCI
 int iommu_do_pci_domctl(struct xen_domctl *, struct domain *d,
                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
-- 
2.20.1


