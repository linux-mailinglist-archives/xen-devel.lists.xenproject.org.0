Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54492BAB0A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 14:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32192.63236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg6PG-0001wR-OJ; Fri, 20 Nov 2020 13:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32192.63236; Fri, 20 Nov 2020 13:24:54 +0000
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
	id 1kg6PG-0001ub-Do; Fri, 20 Nov 2020 13:24:54 +0000
Received: by outflank-mailman (input) for mailman id 32192;
 Fri, 20 Nov 2020 13:24:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kg6PE-0001rA-KZ
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 13:24:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg6PD-0007Dc-Eg; Fri, 20 Nov 2020 13:24:51 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg6PD-00028m-6r; Fri, 20 Nov 2020 13:24:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6PE-0001rA-KZ
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 13:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=6D3BpJmayyK/hItO29QkFAbr4QG8hgE67AhfliKmg4U=; b=udPLlgBud16lNy8EFNxWh2IO1t
	EvAJ7aMfqbGHrRFFqPYSwq8bm6twadfgwN1CO6ZBe+qIAvPdjPOyjd7admoLyZ325ky1Q8SGQDm3e
	xXXwjk0PoBRm23G7EvSYFYg3uAqoaq5BNNx1c3AywGUhyYaPDad5V0UFn8xt4glAfAQ4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6PD-0007Dc-Eg; Fri, 20 Nov 2020 13:24:51 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6PD-00028m-6r; Fri, 20 Nov 2020 13:24:51 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v10 7/7] vtd: use a bit field for dma_pte
Date: Fri, 20 Nov 2020 13:24:40 +0000
Message-Id: <20201120132440.1141-8-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201120132440.1141-1-paul@xen.org>
References: <20201120132440.1141-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

As with a prior patch for context_entry, this removes the need for much
shifting, masking and several magic numbers.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Kevin Tian <kevin.tian@intel.com>

v10:
 - Remove macros in favour of direct field access
 - Adjust field types
 - Use write_atomic() to update the live PTE

v4:
 - New in v4
---
 xen/drivers/passthrough/vtd/iommu.c | 61 +++++++++++++++--------------
 xen/drivers/passthrough/vtd/iommu.h | 43 ++++++--------------
 xen/drivers/passthrough/vtd/utils.c |  6 +--
 3 files changed, 47 insertions(+), 63 deletions(-)

diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index fdb472ad6515..2389b9fc708d 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -281,7 +281,7 @@ static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
         offset = address_level_offset(addr, level);
         pte = &parent[offset];
 
-        pte_maddr = dma_pte_addr(*pte);
+        pte_maddr = pfn_to_paddr(pte->addr);
         if ( !pte_maddr )
         {
             struct page_info *pg;
@@ -294,14 +294,14 @@ static u64 addr_to_dma_page_maddr(struct domain *domain, u64 addr, int alloc)
                 break;
 
             pte_maddr = page_to_maddr(pg);
-            dma_set_pte_addr(*pte, pte_maddr);
+            pte->addr = paddr_to_pfn(pte_maddr);
+            smp_wmb();
 
             /*
              * high level table always sets r/w, last level
              * page table control read/write
              */
-            dma_set_pte_readable(*pte);
-            dma_set_pte_writable(*pte);
+            pte->r = pte->w = true;
             iommu_sync_cache(pte, sizeof(struct dma_pte));
         }
 
@@ -351,7 +351,7 @@ static uint64_t domain_pgd_maddr(struct domain *d, unsigned int nr_pt_levels)
     {
         const struct dma_pte *p = map_vtd_domain_page(pgd_maddr);
 
-        pgd_maddr = dma_pte_addr(*p);
+        pgd_maddr = pfn_to_paddr(p->addr);
         unmap_vtd_domain_page(p);
         if ( !pgd_maddr )
             return 0;
@@ -709,20 +709,23 @@ static void dma_pte_clear_one(struct domain *domain, uint64_t addr,
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
     pte = page + address_level_offset(addr, 1);
 
-    if ( !dma_pte_present(*pte) )
+    if ( !pte->r && !pte->w )
     {
         spin_unlock(&hd->arch.mapping_lock);
         unmap_vtd_domain_page(page);
         return;
     }
 
-    dma_clear_pte(*pte);
-    *flush_flags |= IOMMU_FLUSHF_modified;
+    pte->r = pte->w = false;
+    smp_wmb();
+    pte->val = 0;
 
     spin_unlock(&hd->arch.mapping_lock);
     iommu_sync_cache(pte, sizeof(struct dma_pte));
 
     unmap_vtd_domain_page(page);
+
+    *flush_flags |= IOMMU_FLUSHF_modified;
 }
 
 static int iommu_set_root_entry(struct vtd_iommu *iommu)
@@ -1751,7 +1754,7 @@ static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
                                              unsigned int *flush_flags)
 {
     struct domain_iommu *hd = dom_iommu(d);
-    struct dma_pte *page, *pte, old, new = {};
+    struct dma_pte *page, *pte, old, new;
     u64 pg_maddr;
     int rc = 0;
 
@@ -1775,15 +1778,12 @@ static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
     page = (struct dma_pte *)map_vtd_domain_page(pg_maddr);
     pte = &page[dfn_x(dfn) & LEVEL_MASK];
     old = *pte;
-
-    dma_set_pte_addr(new, mfn_to_maddr(mfn));
-    dma_set_pte_prot(new,
-                     ((flags & IOMMUF_readable) ? DMA_PTE_READ  : 0) |
-                     ((flags & IOMMUF_writable) ? DMA_PTE_WRITE : 0));
-
-    /* Set the SNP on leaf page table if Snoop Control available */
-    if ( iommu_snoop )
-        dma_set_pte_snp(new);
+    new = (struct dma_pte){
+        .r = flags & IOMMUF_readable,
+        .w = flags & IOMMUF_writable,
+        .snp = iommu_snoop,
+        .addr = mfn_x(mfn),
+    };
 
     if ( old.val == new.val )
     {
@@ -1792,14 +1792,14 @@ static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
         return 0;
     }
 
-    *pte = new;
+    write_atomic(&pte->val, new.val);
+    spin_unlock(&hd->arch.mapping_lock);
 
     iommu_sync_cache(pte, sizeof(struct dma_pte));
-    spin_unlock(&hd->arch.mapping_lock);
     unmap_vtd_domain_page(page);
 
     *flush_flags |= IOMMU_FLUSHF_added;
-    if ( dma_pte_present(old) )
+    if ( old.r || old.w )
         *flush_flags |= IOMMU_FLUSHF_modified;
 
     return rc;
@@ -1851,12 +1851,12 @@ static int intel_iommu_lookup_page(struct domain *d, dfn_t dfn, mfn_t *mfn,
     unmap_vtd_domain_page(page);
     spin_unlock(&hd->arch.mapping_lock);
 
-    if ( !dma_pte_present(val) )
+    if ( !val.r && !val.w )
         return -ENOENT;
 
-    *mfn = maddr_to_mfn(dma_pte_addr(val));
-    *flags = dma_pte_read(val) ? IOMMUF_readable : 0;
-    *flags |= dma_pte_write(val) ? IOMMUF_writable : 0;
+    *mfn = _mfn(val.addr);
+    *flags = val.r ? IOMMUF_readable : 0;
+    *flags |= val.w ? IOMMUF_writable : 0;
 
     return 0;
 }
@@ -2611,18 +2611,18 @@ static void vtd_dump_page_table_level(paddr_t pt_maddr, int level, paddr_t gpa,
             process_pending_softirqs();
 
         pte = &pt_vaddr[i];
-        if ( !dma_pte_present(*pte) )
+        if ( !pte->r && !pte->w )
             continue;
 
         address = gpa + offset_level_address(i, level);
         if ( next_level >= 1 ) 
-            vtd_dump_page_table_level(dma_pte_addr(*pte), next_level,
+            vtd_dump_page_table_level(pfn_to_paddr(pte->addr), next_level,
                                       address, indent + 1);
         else
             printk("%*sdfn: %08lx mfn: %08lx\n",
                    indent, "",
                    (unsigned long)(address >> PAGE_SHIFT_4K),
-                   (unsigned long)(dma_pte_addr(*pte) >> PAGE_SHIFT_4K));
+                   (unsigned long)(pte->addr));
     }
 
     unmap_vtd_domain_page(pt_vaddr);
@@ -2690,8 +2690,9 @@ static int __init intel_iommu_quarantine_init(struct domain *d)
         {
             struct dma_pte *pte = &parent[offset];
 
-            dma_set_pte_addr(*pte, maddr);
-            dma_set_pte_readable(*pte);
+            pte->addr = paddr_to_pfn(maddr);
+            smp_wmb();
+            pte->r = 1;
         }
         iommu_sync_cache(parent, PAGE_SIZE);
 
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index 33b1abf98526..1b6123e0c947 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -244,38 +244,21 @@ struct context_entry {
 #define level_size(l) (1 << level_to_offset_bits(l))
 #define align_to_level(addr, l) ((addr + level_size(l) - 1) & level_mask(l))
 
-/*
- * 0: readable
- * 1: writable
- * 2-6: reserved
- * 7: super page
- * 8-11: available
- * 12-63: Host physcial address
- */
 struct dma_pte {
-    u64 val;
+    union {
+        uint64_t val;
+        struct {
+            bool r:1;
+            bool w:1;
+            unsigned int reserved0:1;
+            unsigned int ignored0:4;
+            bool ps:1;
+            unsigned int ignored1:3;
+            bool snp:1;
+            uint64_t addr:52;
+        };
+    };
 };
-#define DMA_PTE_READ (1)
-#define DMA_PTE_WRITE (2)
-#define DMA_PTE_PROT (DMA_PTE_READ | DMA_PTE_WRITE)
-#define DMA_PTE_SP   (1 << 7)
-#define DMA_PTE_SNP  (1 << 11)
-#define dma_clear_pte(p)    do {(p).val = 0;} while(0)
-#define dma_set_pte_readable(p) do {(p).val |= DMA_PTE_READ;} while(0)
-#define dma_set_pte_writable(p) do {(p).val |= DMA_PTE_WRITE;} while(0)
-#define dma_set_pte_superpage(p) do {(p).val |= DMA_PTE_SP;} while(0)
-#define dma_set_pte_snp(p)  do {(p).val |= DMA_PTE_SNP;} while(0)
-#define dma_set_pte_prot(p, prot) do { \
-        (p).val = ((p).val & ~DMA_PTE_PROT) | ((prot) & DMA_PTE_PROT); \
-    } while (0)
-#define dma_pte_prot(p) ((p).val & DMA_PTE_PROT)
-#define dma_pte_read(p) (dma_pte_prot(p) & DMA_PTE_READ)
-#define dma_pte_write(p) (dma_pte_prot(p) & DMA_PTE_WRITE)
-#define dma_pte_addr(p) ((p).val & PADDR_MASK & PAGE_MASK_4K)
-#define dma_set_pte_addr(p, addr) do {\
-            (p).val |= ((addr) & PAGE_MASK_4K); } while (0)
-#define dma_pte_present(p) (((p).val & DMA_PTE_PROT) != 0)
-#define dma_pte_superpage(p) (((p).val & DMA_PTE_SP) != 0)
 
 /* interrupt remap entry */
 struct iremap_entry {
diff --git a/xen/drivers/passthrough/vtd/utils.c b/xen/drivers/passthrough/vtd/utils.c
index 4bca160bc663..a78b02e6edc4 100644
--- a/xen/drivers/passthrough/vtd/utils.c
+++ b/xen/drivers/passthrough/vtd/utils.c
@@ -161,14 +161,14 @@ void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn)
         unmap_vtd_domain_page(l);
         printk("    l%u[%03x] = %"PRIx64"\n", level, l_index, pte.val);
 
-        if ( !dma_pte_present(pte) )
+        if ( !pte.r && !pte.w )
         {
             printk("    l%u[%03x] not present\n", level, l_index);
             break;
         }
-        if ( dma_pte_superpage(pte) )
+        if ( pte.ps )
             break;
-        val = dma_pte_addr(pte);
+        val = pfn_to_paddr(pte.addr);
     } while ( --level );
 }
 
-- 
2.20.1


