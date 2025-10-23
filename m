Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F68C00259
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 11:12:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148838.1480709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrMu-0004Va-Mk; Thu, 23 Oct 2025 09:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148838.1480709; Thu, 23 Oct 2025 09:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBrMu-0004RL-Hy; Thu, 23 Oct 2025 09:12:24 +0000
Received: by outflank-mailman (input) for mailman id 1148838;
 Thu, 23 Oct 2025 09:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9Zx=5A=bounce.vates.tech=bounce-md_30504962.68f9f172.v1-f64d70b8ebde43beb15453b031bfe318@srs-se1.protection.inumbo.net>)
 id 1vBrMt-0003Xf-3Q
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 09:12:23 +0000
Received: from mail187-3.suw11.mandrillapp.com
 (mail187-3.suw11.mandrillapp.com [198.2.187.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 617fb943-aff0-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 11:12:21 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-3.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4csgKG6yMPzDRm0l3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 09:12:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f64d70b8ebde43beb15453b031bfe318; Thu, 23 Oct 2025 09:12:18 +0000
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
X-Inumbo-ID: 617fb943-aff0-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761210739; x=1761480739;
	bh=TNIECHJXjAZW/QQA5DbqLyVqUBTsMMLyLzIaY0t8Vu8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=giNn3/G38rxzIH435qPlGZluIkS1JxThbQmMoRRyCh5Z5kJpXX5x6uyIVXLKU/Hrr
	 rhLg28VBTqesa6zdgMMrGe7FBvTVqvj5cuFCav0gkh0voWqp8R0obt2ebyfbXFfuph
	 tVan7uDI3tc4QDI9e6v5/VNEAklFBjRtkygQtvjD0hEQucXKfc4U9/HhHuoHvVWzYK
	 oGb4x9VJwa6GUt5u9DGzABkJa8dURi9Ir9AP+IZankh4tzFD0vjmzJqSoHBlf3mXqW
	 mmmCqiT6gamTLsV/vcq3wSfQ9xCY5CrIHrvx4w0Ota0WZbtT2+Ov7jpXMVIzg8f5eM
	 Xcdbu4WmPqVig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761210739; x=1761471239; i=teddy.astie@vates.tech;
	bh=TNIECHJXjAZW/QQA5DbqLyVqUBTsMMLyLzIaY0t8Vu8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=T7W8qKfDPzu3AwMJXSwDmsasvHXVYt7Y5wsIZ4KPz/x6LwjPvZHqjEIbs6V9iN19B
	 P6z4p6B61ZEki/4GZKYSTlkl0Y/YKf6C4/9nRhl49FlLZQPG+nYsAD2J/QAYeLQWlH
	 +2DlCom8jokAE3zUx8Hk+Ri8wC/lXvy6nqjYW7+4Xb/FX4k0EtHv5yFyaWvXpkG+Bx
	 LxWN22LhFCjGc9QisNQ5qhiEREznZkMLzkxIuS/WcnTb1NkqpC5un4kjK8zKLwOFJx
	 mu3bJN9ysthMTDA0rdhBob41N+y9bTE6YBgweiFSL36pPFCYzphulmMXRBXgzmRiYQ
	 xa/g1MMxhTj6Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=201/5]=20vtd:=20Drop=20(un)map=5Fvtd=5Fdomain=5Fpage=20wrapper?=
X-Mailer: git-send-email 2.51.1
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761210736376
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>
Message-Id: <a832488afe6eeb8dd83ccd1214dff87c5e6b4fc0.1761209564.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1761209564.git.teddy.astie@vates.tech>
References: <cover.1761209564.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f64d70b8ebde43beb15453b031bfe318?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251023:md
Date: Thu, 23 Oct 2025 09:12:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Replace use of (un)map_vtd_domain_page with its general
equivalents. Also take the opportunity to make iommu->root_page
(previously root_maddr) use struct page_info instead of u64.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - drop instead of moving
 - also replace `root_addr` with `root_page` (with struct page_info)

 xen/drivers/passthrough/vtd/dmar.c     |  2 +-
 xen/drivers/passthrough/vtd/extern.h   |  3 -
 xen/drivers/passthrough/vtd/intremap.c | 15 +++--
 xen/drivers/passthrough/vtd/iommu.c    | 88 ++++++++++++--------------
 xen/drivers/passthrough/vtd/iommu.h    |  7 +-
 xen/drivers/passthrough/vtd/qinval.c   | 13 ++--
 xen/drivers/passthrough/vtd/utils.c    | 25 ++++----
 xen/drivers/passthrough/vtd/x86/ats.c  | 11 ++--
 xen/drivers/passthrough/vtd/x86/vtd.c  | 10 ---
 9 files changed, 80 insertions(+), 94 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index 91c22b8330..2380825f1c 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -1107,7 +1107,7 @@ int __init acpi_dmar_init(void)
         if ( rhsa )
             iommu->node = pxm_to_node(rhsa->proximity_domain);
 
-        if ( !(iommu->root_maddr = alloc_pgtable_maddr(1, iommu->node)) )
+        if ( !(iommu->root_page = maddr_to_page(alloc_pgtable_maddr(1, iommu->node))) )
             ret = -ENOMEM;
     }
 
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index c16583c951..2be50de168 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -77,9 +77,6 @@ int __must_check qinval_device_iotlb_sync(struct vtd_iommu *iommu,
                                           u16 did, u16 size, u64 addr);
 
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node);
-void free_pgtable_maddr(u64 maddr);
-void *map_vtd_domain_page(u64 maddr);
-void unmap_vtd_domain_page(const void *va);
 int domain_context_mapping_one(struct domain *domain, struct vtd_iommu *iommu,
                                uint8_t bus, uint8_t devfn,
                                const struct pci_dev *pdev, domid_t domid,
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 7726ee618a..6c779d476d 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -17,6 +17,7 @@
  * Copyright (C) Xiaohui Xin <xiaohui.xin@intel.com>
  */
 
+#include <xen/domain_page.h>
 #include <xen/irq.h>
 #include <xen/sched.h>
 #include <xen/iommu.h>
@@ -222,7 +223,7 @@ static void free_remap_entry(struct vtd_iommu *iommu, int index)
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
 
-    unmap_vtd_domain_page(iremap_entries);
+    unmap_domain_page(iremap_entries);
     iommu->intremap.num--;
 }
 
@@ -244,7 +245,7 @@ static unsigned int alloc_remap_entry(struct vtd_iommu *iommu, unsigned int nr)
         {
             /* This entry across page boundry */
             if ( iremap_entries )
-                unmap_vtd_domain_page(iremap_entries);
+                unmap_domain_page(iremap_entries);
 
             GET_IREMAP_ENTRY(iommu->intremap.maddr, i,
                              iremap_entries, p);
@@ -259,7 +260,7 @@ static unsigned int alloc_remap_entry(struct vtd_iommu *iommu, unsigned int nr)
     }
 
     if ( iremap_entries )
-        unmap_vtd_domain_page(iremap_entries);
+        unmap_domain_page(iremap_entries);
 
     if ( i < IREMAP_ENTRY_NR )
         iommu->intremap.num += nr;
@@ -291,7 +292,7 @@ static int remap_entry_to_ioapic_rte(
         dprintk(XENLOG_ERR VTDPREFIX,
                 "IO-APIC index (%d) has an empty entry\n",
                 index);
-        unmap_vtd_domain_page(iremap_entries);
+        unmap_domain_page(iremap_entries);
         spin_unlock_irqrestore(&iommu->intremap.lock, flags);
         return -EFAULT;
     }
@@ -309,7 +310,7 @@ static int remap_entry_to_ioapic_rte(
         old_rte->dest.logical.logical_dest = iremap_entry->remap.dst >> 8;
     }
 
-    unmap_vtd_domain_page(iremap_entries);
+    unmap_domain_page(iremap_entries);
     spin_unlock_irqrestore(&iommu->intremap.lock, flags);
 
     return 0;
@@ -388,7 +389,7 @@ static int ioapic_rte_to_remap_entry(struct vtd_iommu *iommu,
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
 
-    unmap_vtd_domain_page(iremap_entries);
+    unmap_domain_page(iremap_entries);
     spin_unlock_irqrestore(&iommu->intremap.lock, flags);
     return 0;
 }
@@ -607,7 +608,7 @@ static int msi_msg_to_remap_entry(
     iommu_sync_cache(iremap_entry, sizeof(*iremap_entry));
     iommu_flush_iec_index(iommu, 0, index);
 
-    unmap_vtd_domain_page(iremap_entries);
+    unmap_domain_page(iremap_entries);
     spin_unlock_irqrestore(&iommu->intremap.lock, flags);
 
     return alloc;
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 90f36ac22b..5bd4f19848 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -272,12 +272,6 @@ uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node)
     return page_to_maddr(pg);
 }
 
-void free_pgtable_maddr(u64 maddr)
-{
-    if ( maddr != 0 )
-        free_domheap_page(maddr_to_page(maddr));
-}
-
 /* context entry handling */
 static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
 {
@@ -285,14 +279,14 @@ static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
     u64 maddr;
 
     ASSERT(spin_is_locked(&iommu->lock));
-    root_entries = (struct root_entry *)map_vtd_domain_page(iommu->root_maddr);
+    root_entries = __map_domain_page(iommu->root_page);
     root = &root_entries[bus];
     if ( !root_present(*root) )
     {
         maddr = alloc_pgtable_maddr(1, iommu->node);
         if ( maddr == 0 )
         {
-            unmap_vtd_domain_page(root_entries);
+            unmap_domain_page(root_entries);
             return 0;
         }
         set_root_value(*root, maddr);
@@ -300,7 +294,7 @@ static u64 bus_to_context_maddr(struct vtd_iommu *iommu, u8 bus)
         iommu_sync_cache(root, sizeof(struct root_entry));
     }
     maddr = (u64) get_context_addr(*root);
-    unmap_vtd_domain_page(root_entries);
+    unmap_domain_page(root_entries);
     return maddr;
 }
 
@@ -344,7 +338,7 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
     }
 
     pte_maddr = hd->arch.vtd.pgd_maddr;
-    parent = map_vtd_domain_page(pte_maddr);
+    parent = map_domain_page(maddr_to_mfn(pte_maddr));
     while ( level > target )
     {
         offset = address_level_offset(addr, level);
@@ -388,7 +382,7 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
 
             if ( dma_pte_present(*pte) )
             {
-                struct dma_pte *split = map_vtd_domain_page(pte_maddr);
+                struct dma_pte *split = map_domain_page(maddr_to_mfn(pte_maddr));
                 unsigned long inc = 1UL << level_to_offset_bits(level - 1);
 
                 split[0].val |= pte->val & ~DMA_PTE_CONTIG_MASK;
@@ -400,7 +394,7 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
                         (split[offset - 1].val & ~DMA_PTE_CONTIG_MASK) + inc;
 
                 iommu_sync_cache(split, PAGE_SIZE);
-                unmap_vtd_domain_page(split);
+                unmap_domain_page(split);
 
                 if ( flush_flags )
                     *flush_flags |= IOMMU_FLUSHF_modified;
@@ -422,11 +416,11 @@ static uint64_t addr_to_dma_page_maddr(struct domain *domain, daddr_t addr,
             break;
         }
 
-        unmap_vtd_domain_page(parent);
-        parent = map_vtd_domain_page(pte_maddr);
+        unmap_domain_page(parent);
+        parent = map_domain_page(maddr_to_mfn(pte_maddr));
     }
 
-    unmap_vtd_domain_page(parent);
+    unmap_domain_page(parent);
  out:
     return pte_maddr;
 }
@@ -469,10 +463,10 @@ static paddr_t domain_pgd_maddr(struct domain *d, paddr_t pgd_maddr,
           agaw != level_to_agaw(nr_pt_levels);
           agaw-- )
     {
-        const struct dma_pte *p = map_vtd_domain_page(pgd_maddr);
+        const struct dma_pte *p = map_domain_page(maddr_to_mfn(pgd_maddr));
 
         pgd_maddr = dma_pte_addr(*p);
-        unmap_vtd_domain_page(p);
+        unmap_domain_page(p);
         if ( !pgd_maddr )
             return 0;
     }
@@ -815,7 +809,7 @@ static int iommu_set_root_entry(struct vtd_iommu *iommu)
     unsigned long flags;
 
     spin_lock_irqsave(&iommu->register_lock, flags);
-    dmar_writeq(iommu->reg, DMAR_RTADDR_REG, iommu->root_maddr);
+    dmar_writeq(iommu->reg, DMAR_RTADDR_REG, page_to_maddr(iommu->root_page));
 
     sts = dmar_readl(iommu->reg, DMAR_GSTS_REG);
     dmar_writel(iommu->reg, DMAR_GCMD_REG, sts | DMA_GCMD_SRTP);
@@ -1408,10 +1402,10 @@ void __init iommu_free(struct acpi_drhd_unit *drhd)
 
     drhd->iommu = NULL;
 
-    if ( iommu->root_maddr != 0 )
+    if ( iommu->root_page )
     {
-        free_pgtable_maddr(iommu->root_maddr);
-        iommu->root_maddr = 0;
+        free_domheap_page(iommu->root_page);
+        iommu->root_page = NULL;
     }
 
     if ( iommu->reg )
@@ -1504,7 +1498,7 @@ int domain_context_mapping_one(
         spin_unlock(&iommu->lock);
         return -ENOMEM;
     }
-    context_entries = (struct context_entry *)map_vtd_domain_page(maddr);
+    context_entries = map_domain_page(maddr_to_mfn(maddr));
     context = &context_entries[devfn];
     old = (lctxt = *context).full;
 
@@ -1521,7 +1515,7 @@ int domain_context_mapping_one(
         if ( !prev_dom )
         {
             spin_unlock(&iommu->lock);
-            unmap_vtd_domain_page(context_entries);
+            unmap_domain_page(context_entries);
             dprintk(XENLOG_DEBUG VTDPREFIX,
                     "no domain for did %u (nr_dom %u)\n",
                     prev_did, cap_ndoms(iommu->cap));
@@ -1544,7 +1538,7 @@ int domain_context_mapping_one(
         {
             spin_unlock(&hd->arch.mapping_lock);
             spin_unlock(&iommu->lock);
-            unmap_vtd_domain_page(context_entries);
+            unmap_domain_page(context_entries);
             if ( prev_dom )
                 rcu_unlock_domain(prev_dom);
             return -ENOMEM;
@@ -1564,7 +1558,7 @@ int domain_context_mapping_one(
     {
     unlock:
         spin_unlock(&iommu->lock);
-        unmap_vtd_domain_page(context_entries);
+        unmap_domain_page(context_entries);
         if ( prev_dom )
             rcu_unlock_domain(prev_dom);
         return rc;
@@ -1632,7 +1626,7 @@ int domain_context_mapping_one(
 
     set_bit(iommu->index, hd->arch.vtd.iommu_bitmap);
 
-    unmap_vtd_domain_page(context_entries);
+    unmap_domain_page(context_entries);
 
     if ( !seg && !rc )
         rc = me_wifi_quirk(domain, bus, devfn, domid, pgd_maddr, mode);
@@ -1864,13 +1858,13 @@ int domain_context_unmap_one(
         spin_unlock(&iommu->lock);
         return 0;
     }
-    context_entries = (struct context_entry *)map_vtd_domain_page(maddr);
+    context_entries = map_domain_page(maddr_to_mfn(maddr));
     context = &context_entries[devfn];
 
     if ( !context_present(*context) )
     {
         spin_unlock(&iommu->lock);
-        unmap_vtd_domain_page(context_entries);
+        unmap_domain_page(context_entries);
         return 0;
     }
 
@@ -1902,7 +1896,7 @@ int domain_context_unmap_one(
         rc = 0;
 
     spin_unlock(&iommu->lock);
-    unmap_vtd_domain_page(context_entries);
+    unmap_domain_page(context_entries);
 
     if ( !iommu->drhd->segment && !rc )
         rc = me_wifi_quirk(domain, bus, devfn, DOMID_INVALID, 0,
@@ -2101,7 +2095,7 @@ static int __must_check cf_check intel_iommu_map_page(
         return -ENOMEM;
     }
 
-    page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
+    page = map_domain_page(maddr_to_mfn(pg_maddr));
     pte = &page[address_level_offset(dfn_to_daddr(dfn), level)];
     old = *pte;
 
@@ -2119,7 +2113,7 @@ static int __must_check cf_check intel_iommu_map_page(
     if ( !((old.val ^ new.val) & ~DMA_PTE_CONTIG_MASK) )
     {
         spin_unlock(&hd->arch.mapping_lock);
-        unmap_vtd_domain_page(page);
+        unmap_domain_page(page);
         return 0;
     }
 
@@ -2142,7 +2136,7 @@ static int __must_check cf_check intel_iommu_map_page(
     {
         struct page_info *pg = maddr_to_page(pg_maddr);
 
-        unmap_vtd_domain_page(page);
+        unmap_domain_page(page);
 
         new.val &= ~(LEVEL_MASK << level_to_offset_bits(level));
         dma_set_pte_superpage(new);
@@ -2151,7 +2145,7 @@ static int __must_check cf_check intel_iommu_map_page(
                                           flush_flags, false);
         BUG_ON(pg_maddr < PAGE_SIZE);
 
-        page = map_vtd_domain_page(pg_maddr);
+        page = map_domain_page(maddr_to_mfn(pg_maddr));
         pte = &page[address_level_offset(dfn_to_daddr(dfn), level)];
         *pte = new;
         iommu_sync_cache(pte, sizeof(*pte));
@@ -2162,7 +2156,7 @@ static int __must_check cf_check intel_iommu_map_page(
     }
 
     spin_unlock(&hd->arch.mapping_lock);
-    unmap_vtd_domain_page(page);
+    unmap_domain_page(page);
 
     *flush_flags |= IOMMU_FLUSHF_added;
     if ( dma_pte_present(old) )
@@ -2209,13 +2203,13 @@ static int __must_check cf_check intel_iommu_unmap_page(
         return pg_maddr ? -ENOMEM : 0;
     }
 
-    page = map_vtd_domain_page(pg_maddr);
+    page = map_domain_page(maddr_to_mfn(pg_maddr));
     pte = &page[address_level_offset(addr, level)];
 
     if ( !dma_pte_present(*pte) )
     {
         spin_unlock(&hd->arch.mapping_lock);
-        unmap_vtd_domain_page(page);
+        unmap_domain_page(page);
         return 0;
     }
 
@@ -2230,12 +2224,12 @@ static int __must_check cf_check intel_iommu_unmap_page(
     {
         struct page_info *pg = maddr_to_page(pg_maddr);
 
-        unmap_vtd_domain_page(page);
+        unmap_domain_page(page);
 
         pg_maddr = addr_to_dma_page_maddr(d, addr, level, flush_flags, false);
         BUG_ON(pg_maddr < PAGE_SIZE);
 
-        page = map_vtd_domain_page(pg_maddr);
+        page = map_domain_page(maddr_to_mfn(pg_maddr));
         pte = &page[address_level_offset(addr, level)];
         dma_clear_pte(*pte);
         iommu_sync_cache(pte, sizeof(*pte));
@@ -2247,7 +2241,7 @@ static int __must_check cf_check intel_iommu_unmap_page(
 
     spin_unlock(&hd->arch.mapping_lock);
 
-    unmap_vtd_domain_page(page);
+    unmap_domain_page(page);
 
     *flush_flags |= IOMMU_FLUSHF_modified;
 
@@ -3052,7 +3046,7 @@ static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
     if ( level < 1 )
         return;
 
-    pt_vaddr = map_vtd_domain_page(pt_maddr);
+    pt_vaddr = map_domain_page(maddr_to_mfn(pt_maddr));
 
     next_level = level - 1;
     for ( i = 0; i < PTE_NUM; i++ )
@@ -3077,7 +3071,7 @@ static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
                    dma_pte_write(*pte) ? 'w' : '-');
     }
 
-    unmap_vtd_domain_page(pt_vaddr);
+    unmap_domain_page(pt_vaddr);
 }
 
 static void cf_check vtd_dump_page_tables(struct domain *d)
@@ -3119,9 +3113,9 @@ static int fill_qpt(struct dma_pte *this, unsigned int level,
 
                 if ( level )
                 {
-                    next = map_vtd_domain_page(page_to_maddr(pgs[level]));
+                    next = __map_domain_page(pgs[level]);
                     rc = fill_qpt(next, level - 1, pgs);
-                    unmap_vtd_domain_page(next);
+                    unmap_domain_page(next);
                 }
             }
 
@@ -3131,9 +3125,9 @@ static int fill_qpt(struct dma_pte *this, unsigned int level,
         }
         else if ( level && !dma_pte_superpage(*pte) )
         {
-            next = map_vtd_domain_page(dma_pte_addr(*pte));
+            next = map_domain_page(maddr_to_mfn(dma_pte_addr(*pte)));
             rc = fill_qpt(next, level - 1, pgs);
-            unmap_vtd_domain_page(next);
+            unmap_domain_page(next);
         }
     }
 
@@ -3204,9 +3198,9 @@ static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
         struct dma_pte *root;
         struct page_info *pgs[6] = {};
 
-        root = map_vtd_domain_page(pdev->arch.vtd.pgd_maddr);
+        root = map_domain_page(maddr_to_mfn(pdev->arch.vtd.pgd_maddr));
         rc = fill_qpt(root, level - 1, pgs);
-        unmap_vtd_domain_page(root);
+        unmap_domain_page(root);
 
         pdev->arch.leaf_mfn = page_to_mfn(pgs[0]);
     }
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index 29d350b23d..7c40f81408 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -19,6 +19,7 @@
 #ifndef DRIVERS__PASSTHROUGH__VTD__IOMMU_H
 #define DRIVERS__PASSTHROUGH__VTD__IOMMU_H
 
+#include <xen/domain_page.h>
 #include <xen/iommu.h>
 #include <asm/msi.h>
 
@@ -366,8 +367,8 @@ struct iremap_entry {
  */
 #define GET_IREMAP_ENTRY(maddr, index, entries, entry)                        \
 do {                                                                          \
-    entries = (struct iremap_entry *)map_vtd_domain_page(                     \
-              (maddr) + (( (index) >> IREMAP_ENTRY_ORDER ) << PAGE_SHIFT ) ); \
+    entries = (struct iremap_entry *)map_domain_page(maddr_to_mfn(            \
+              (maddr) + (( (index) >> IREMAP_ENTRY_ORDER ) << PAGE_SHIFT ) ));\
     entry = &entries[(index) % (1 << IREMAP_ENTRY_ORDER)];                    \
 } while(0)
 
@@ -482,7 +483,7 @@ struct vtd_iommu {
     u64	ecap;
     spinlock_t lock; /* protect context */
     spinlock_t register_lock; /* protect iommu register handling */
-    u64 root_maddr; /* root entry machine address */
+    struct page_info *root_page; /* root entry page */
     nodeid_t node;
     struct msi_desc msi;
     struct acpi_drhd_unit *drhd;
diff --git a/xen/drivers/passthrough/vtd/qinval.c b/xen/drivers/passthrough/vtd/qinval.c
index 036f3e8505..eb37832363 100644
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -18,6 +18,7 @@
  */
 
 
+#include <xen/domain_page.h>
 #include <xen/sched.h>
 #include <xen/iommu.h>
 #include <xen/time.h>
@@ -81,7 +82,7 @@ static struct qinval_entry *qi_map_entry(const struct vtd_iommu *iommu,
 {
     paddr_t base = iommu->qinval_maddr +
                    ((index * sizeof(struct qinval_entry)) & PAGE_MASK);
-    struct qinval_entry *entries = map_vtd_domain_page(base);
+    struct qinval_entry *entries = map_domain_page(maddr_to_mfn(base));
 
     return &entries[index % (PAGE_SIZE / sizeof(*entries))];
 }
@@ -111,7 +112,7 @@ static int __must_check queue_invalidate_context_sync(struct vtd_iommu *iommu,
     qinval_update_qtail(iommu, index);
     spin_unlock_irqrestore(&iommu->register_lock, flags);
 
-    unmap_vtd_domain_page(qinval_entry);
+    unmap_domain_page(qinval_entry);
 
     return invalidate_sync(iommu);
 }
@@ -145,7 +146,7 @@ static int __must_check queue_invalidate_iotlb_sync(struct vtd_iommu *iommu,
     qinval_update_qtail(iommu, index);
     spin_unlock_irqrestore(&iommu->register_lock, flags);
 
-    unmap_vtd_domain_page(qinval_entry);
+    unmap_domain_page(qinval_entry);
 
     return invalidate_sync(iommu);
 }
@@ -176,7 +177,7 @@ static int __must_check queue_invalidate_wait(struct vtd_iommu *iommu,
     qinval_update_qtail(iommu, index);
     spin_unlock_irqrestore(&iommu->register_lock, flags);
 
-    unmap_vtd_domain_page(qinval_entry);
+    unmap_domain_page(qinval_entry);
 
     /* Now we don't support interrupt method */
     if ( sw )
@@ -277,7 +278,7 @@ int qinval_device_iotlb_sync(struct vtd_iommu *iommu, struct pci_dev *pdev,
     qinval_update_qtail(iommu, index);
     spin_unlock_irqrestore(&iommu->register_lock, flags);
 
-    unmap_vtd_domain_page(qinval_entry);
+    unmap_domain_page(qinval_entry);
 
     return dev_invalidate_sync(iommu, pdev, did);
 }
@@ -305,7 +306,7 @@ static int __must_check queue_invalidate_iec_sync(struct vtd_iommu *iommu,
     qinval_update_qtail(iommu, index);
     spin_unlock_irqrestore(&iommu->register_lock, flags);
 
-    unmap_vtd_domain_page(qinval_entry);
+    unmap_domain_page(qinval_entry);
 
     ret = invalidate_sync(iommu);
 
diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
index 7c4d032f4f..5d365ea4e9 100644
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -18,6 +18,7 @@
 
 #include <xen/sched.h>
 #include <xen/delay.h>
+#include <xen/domain_page.h>
 #include <xen/iommu.h>
 #include <xen/time.h>
 #include <xen/pci.h>
@@ -99,38 +100,38 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
            iommu->index, &PCI_SBDF(iommu->drhd->segment, bus, devfn),
            gmfn);
 
-    if ( iommu->root_maddr == 0 )
+    if ( iommu->root_page == NULL )
     {
-        printk("    iommu->root_maddr = 0\n");
+        printk("    iommu->root_maddr = NULL\n");
         return;
     }
 
-    root_entry = (struct root_entry *)map_vtd_domain_page(iommu->root_maddr);
+    root_entry = __map_domain_page(iommu->root_page);
 
     printk("    root_entry[%02x] = %"PRIx64"\n", bus, root_entry[bus].val);
     if ( !root_present(root_entry[bus]) )
     {
-        unmap_vtd_domain_page(root_entry);
+        unmap_domain_page(root_entry);
         printk("    root_entry[%02x] not present\n", bus);
         return;
     }
 
     val = root_entry[bus].val;
-    unmap_vtd_domain_page(root_entry);
-    ctxt_entry = map_vtd_domain_page(val);
+    unmap_domain_page(root_entry);
+    ctxt_entry = map_domain_page(maddr_to_mfn(val));
 
     val = ctxt_entry[devfn].lo;
     printk("    context[%02x] = %"PRIx64"_%"PRIx64"\n",
            devfn, ctxt_entry[devfn].hi, val);
     if ( !context_present(ctxt_entry[devfn]) )
     {
-        unmap_vtd_domain_page(ctxt_entry);
+        unmap_domain_page(ctxt_entry);
         printk("    ctxt_entry[%02x] not present\n", devfn);
         return;
     }
 
     level = agaw_to_level(context_address_width(ctxt_entry[devfn]));
-    unmap_vtd_domain_page(ctxt_entry);
+    unmap_domain_page(ctxt_entry);
     if ( level != VTD_PAGE_TABLE_LEVEL_3 &&
          level != VTD_PAGE_TABLE_LEVEL_4)
     {
@@ -140,10 +141,10 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
 
     do
     {
-        l = map_vtd_domain_page(val);
+        l = map_domain_page(maddr_to_mfn(val));
         l_index = get_level_index(gmfn, level);
         pte.val = l[l_index];
-        unmap_vtd_domain_page(l);
+        unmap_domain_page(l);
         printk("    l%u[%03x] = %"PRIx64" %c%c\n", level, l_index, pte.val,
                dma_pte_read(pte) ? 'r' : '-',
                dma_pte_write(pte) ? 'w' : '-');
@@ -204,7 +205,7 @@ void cf_check vtd_dump_iommu_info(unsigned char key)
                 {
                     /* This entry across page boundry */
                     if ( iremap_entries )
-                        unmap_vtd_domain_page(iremap_entries);
+                        unmap_domain_page(iremap_entries);
 
                     GET_IREMAP_ENTRY(iremap_maddr, i,
                                      iremap_entries, p);
@@ -232,7 +233,7 @@ void cf_check vtd_dump_iommu_info(unsigned char key)
                 print_cnt++;
             }
             if ( iremap_entries )
-                unmap_vtd_domain_page(iremap_entries);
+                unmap_domain_page(iremap_entries);
             if ( iommu->intremap.num != print_cnt )
                 printk("Warning: Print %u IRTE (actually have %u)!\n",
                         print_cnt, iommu->intremap.num);
diff --git a/xen/drivers/passthrough/vtd/x86/ats.c b/xen/drivers/passthrough/vtd/x86/ats.c
index 61052ef580..fed3588e8e 100644
--- a/xen/drivers/passthrough/vtd/x86/ats.c
+++ b/xen/drivers/passthrough/vtd/x86/ats.c
@@ -16,6 +16,7 @@
  * Author: Allen Kay <allen.m.kay@intel.com>
  */
 
+#include <xen/domain_page.h>
 #include <xen/sched.h>
 #include <xen/iommu.h>
 #include <xen/time.h>
@@ -83,17 +84,17 @@ static bool device_in_domain(const struct vtd_iommu *iommu,
     unsigned int tt;
     bool found = false;
 
-    if ( unlikely(!iommu->root_maddr) )
+    if ( unlikely(!iommu->root_page) )
     {
         ASSERT_UNREACHABLE();
         return false;
     }
 
-    root_entry = map_vtd_domain_page(iommu->root_maddr);
+    root_entry = __map_domain_page(iommu->root_page);
     if ( !root_present(root_entry[pdev->bus]) )
         goto out;
 
-    ctxt_entry = map_vtd_domain_page(root_entry[pdev->bus].val);
+    ctxt_entry = map_domain_page(maddr_to_mfn(root_entry[pdev->bus].val));
     if ( context_domain_id(ctxt_entry[pdev->devfn]) != did )
         goto out;
 
@@ -104,10 +105,10 @@ static bool device_in_domain(const struct vtd_iommu *iommu,
     found = true;
 out:
     if ( root_entry )
-        unmap_vtd_domain_page(root_entry);
+        unmap_domain_page(root_entry);
 
     if ( ctxt_entry )
-        unmap_vtd_domain_page(ctxt_entry);
+        unmap_domain_page(ctxt_entry);
 
     return found;
 }
diff --git a/xen/drivers/passthrough/vtd/x86/vtd.c b/xen/drivers/passthrough/vtd/x86/vtd.c
index 76f12adc23..b0798dc6a1 100644
--- a/xen/drivers/passthrough/vtd/x86/vtd.c
+++ b/xen/drivers/passthrough/vtd/x86/vtd.c
@@ -36,13 +36,3 @@
  * 1:1 iommu mappings except xen and unusable regions.
  */
 boolean_param("iommu_inclusive_mapping", iommu_hwdom_inclusive);
-
-void *map_vtd_domain_page(u64 maddr)
-{
-    return map_domain_page(_mfn(paddr_to_pfn(maddr)));
-}
-
-void unmap_vtd_domain_page(const void *va)
-{
-    unmap_domain_page(va);
-}
-- 
2.51.1



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


