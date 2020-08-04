Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0820823BB49
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 15:42:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2xD4-0008PK-5I; Tue, 04 Aug 2020 13:42:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hzL0=BO=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2xD3-0008MP-2J
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 13:42:29 +0000
X-Inumbo-ID: 0bfa964c-5a51-4f97-a22f-1aa24d18082b
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bfa964c-5a51-4f97-a22f-1aa24d18082b;
 Tue, 04 Aug 2020 13:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GNYwqPcBwnk0vcKVQIQgGJidOYMSGwZ6dlJjnlwKlHg=; b=WIk9AlvMkwRZEeLweZZubkx39X
 Z+/W4kJLtbkoD3LTXSVVd1MSJqnfhYz6pN+CpG4XtLBymtV7CEjzl1cHypw5RjK6M1uq6tSitsBFH
 nbKakrEZNkcNlYGoK7llKKmFmA/nDNOoEq6BMk5y0CcWPd9b+Xp0acqw7h4NByiy7kaM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2xCt-000845-2k; Tue, 04 Aug 2020 13:42:19 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2xCs-0003ag-Ra; Tue, 04 Aug 2020 13:42:19 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 04/14] x86/iommu: convert AMD IOMMU code to use new page
 table allocator
Date: Tue,  4 Aug 2020 14:41:59 +0100
Message-Id: <20200804134209.8717-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200804134209.8717-1-paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

This patch converts the AMD IOMMU code to use the new page table allocator
function. This allows all the free-ing code to be removed (since it is now
handled by the general x86 code) which reduces TLB and cache thrashing as well
as shortening the code.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>

v2:
  - New in v2 (split from "add common page-table allocator")
---
 xen/drivers/passthrough/amd/iommu.h         | 18 +----
 xen/drivers/passthrough/amd/iommu_map.c     | 10 +--
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 75 +++------------------
 3 files changed, 16 insertions(+), 87 deletions(-)

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
index 47b4472e8a..54b991294a 100644
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
 
-    hd->arch.amd.root_table = alloc_amd_iommu_pgtable();
+    hd->arch.amd.root_table = iommu_alloc_pgtable(d);
     if ( !hd->arch.amd.root_table )
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
index 09a05f9d75..3390c22cf3 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -205,11 +205,13 @@ static int iov_enable_xt(void)
     return 0;
 }
 
-int amd_iommu_alloc_root(struct domain_iommu *hd)
+int amd_iommu_alloc_root(struct domain *d)
 {
+    struct domain_iommu *hd = dom_iommu(d);
+
     if ( unlikely(!hd->arch.amd.root_table) )
     {
-        hd->arch.amd.root_table = alloc_amd_iommu_pgtable();
+        hd->arch.amd.root_table = iommu_alloc_pgtable(d);
         if ( !hd->arch.amd.root_table )
             return -ENOMEM;
     }
@@ -217,12 +219,13 @@ int amd_iommu_alloc_root(struct domain_iommu *hd)
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
@@ -254,7 +257,7 @@ static void __hwdom_init amd_iommu_hwdom_init(struct domain *d)
 {
     const struct amd_iommu *iommu;
 
-    if ( allocate_domain_resources(dom_iommu(d)) )
+    if ( allocate_domain_resources(d) )
         BUG();
 
     for_each_amd_iommu ( iommu )
@@ -323,7 +326,6 @@ static int reassign_device(struct domain *source, struct domain *target,
 {
     struct amd_iommu *iommu;
     int bdf, rc;
-    struct domain_iommu *t = dom_iommu(target);
 
     bdf = PCI_BDF2(pdev->bus, pdev->devfn);
     iommu = find_iommu_for_device(pdev->seg, bdf);
@@ -344,7 +346,7 @@ static int reassign_device(struct domain *source, struct domain *target,
         pdev->domain = target;
     }
 
-    rc = allocate_domain_resources(t);
+    rc = allocate_domain_resources(target);
     if ( rc )
         return rc;
 
@@ -376,65 +378,9 @@ static int amd_iommu_assign_device(struct domain *d, u8 devfn,
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
-    if ( hd->arch.amd.root_table )
-    {
-        deallocate_next_page_table(hd->arch.amd.root_table,
-                                   hd->arch.amd.paging_mode);
-        hd->arch.amd.root_table = NULL;
-    }
-    spin_unlock(&hd->arch.mapping_lock);
-}
-
-
 static void amd_iommu_domain_destroy(struct domain *d)
 {
-    deallocate_iommu_page_tables(d);
-    amd_iommu_flush_all_pages(d);
+    dom_iommu(d)->arch.amd.root_table = NULL;
 }
 
 static int amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
@@ -620,7 +566,6 @@ static const struct iommu_ops __initconstrel _iommu_ops = {
     .unmap_page = amd_iommu_unmap_page,
     .iotlb_flush = amd_iommu_flush_iotlb_pages,
     .iotlb_flush_all = amd_iommu_flush_iotlb_all,
-    .free_page_table = deallocate_page_table,
     .reassign_device = reassign_device,
     .get_device_group_id = amd_iommu_group_id,
     .enable_x2apic = iov_enable_xt,
-- 
2.20.1


