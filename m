Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667D3559628
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 11:12:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355325.582963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fM4-0004YI-TZ; Fri, 24 Jun 2022 09:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355325.582963; Fri, 24 Jun 2022 09:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fM4-0004Ug-Kt; Fri, 24 Jun 2022 09:11:56 +0000
Received: by outflank-mailman (input) for mailman id 355325;
 Fri, 24 Jun 2022 09:11:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4fM3-00048Y-75
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 09:11:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4fM3-000205-2C; Fri, 24 Jun 2022 09:11:55 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4fM2-0005kh-QK; Fri, 24 Jun 2022 09:11:55 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=qe4fAnsClmSDMh+3jhKIrIzURJjOhtWwCwowArSR7bI=; b=dLbiIYSwg5zh1fKeVRUsS4pdwX
	BM3I/Gf0Q8F3Gyl+esUsc9XqoB1DWEhIumeadx0cqqUtREJRKQEAHo2+DD9R+TIHu3i50Xoi0Sa/6
	5FuyuavKDPZxX+54AGI/KarcHWbw8n2p0OPJsv7wgSCNKe/VaoPAYkEprYTYxOB2cDpo=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/7] xen/arm32: mm: Consolidate the domheap mappings initialization
Date: Fri, 24 Jun 2022 10:11:44 +0100
Message-Id: <20220624091146.35716-6-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220624091146.35716-1-julien@xen.org>
References: <20220624091146.35716-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, the domheap mappings initialization is done separately for
the boot CPU and secondary CPUs. The main difference is for the former
the pages are part of Xen binary whilst for the latter they are
dynamically allocated.

It would be good to have a single helper so it is easier to rework
on the domheap is initialized.

For CPU0, we still need to use pre-allocated pages because the
allocators may use domain_map_page(), so we need to have the domheap
area ready first. But we can still delay the initialization to setup_mm().

Introduce a new helper domheap_mapping_init() that will be called
from setup_mm() for the boot CPU and from init_secondary_pagetables()
for secondary CPUs.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/include/asm/arm32/mm.h |  2 +
 xen/arch/arm/mm.c                   | 92 +++++++++++++++++++----------
 xen/arch/arm/setup.c                |  8 +++
 3 files changed, 71 insertions(+), 31 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
index 6b039d9ceaa2..575373aeb985 100644
--- a/xen/arch/arm/include/asm/arm32/mm.h
+++ b/xen/arch/arm/include/asm/arm32/mm.h
@@ -10,6 +10,8 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
     return false;
 }
 
+bool init_domheap_mappings(unsigned int cpu);
+
 #endif /* __ARM_ARM32_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 20733afebce4..995aa1e4480e 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -372,6 +372,58 @@ void clear_fixmap(unsigned map)
 }
 
 #ifdef CONFIG_DOMAIN_PAGE
+/*
+ * Prepare the area that will be used to map domheap pages. They are
+ * mapped in 2MB chunks, so we need to allocate the page-tables up to
+ * the 2nd level.
+ *
+ * The caller should make sure the root page-table for @cpu has been
+ * been allocated.
+ */
+bool init_domheap_mappings(unsigned int cpu)
+{
+    unsigned int order = get_order_from_pages(DOMHEAP_SECOND_PAGES);
+    lpae_t *root = per_cpu(xen_pgtable, cpu);
+    unsigned int i, first_idx;
+    lpae_t *domheap;
+    mfn_t mfn;
+
+    ASSERT(root);
+    ASSERT(!per_cpu(xen_dommap, cpu));
+
+    /*
+     * The domheap for cpu0 is before the heap is initialized. So we
+     * need to use pre-allocated pages.
+     */
+    if ( !cpu )
+        domheap = cpu0_dommap;
+    else
+        domheap = alloc_xenheap_pages(order, 0);
+
+    if ( !domheap )
+        return false;
+
+    /* Ensure the domheap has no stray mappings */
+    memset(domheap, 0, DOMHEAP_SECOND_PAGES * PAGE_SIZE);
+
+    /*
+     * Update the first level mapping to reference the local CPUs
+     * domheap mapping pages.
+     */
+    mfn = virt_to_mfn(domheap);
+    first_idx = first_table_offset(DOMHEAP_VIRT_START);
+    for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
+    {
+        lpae_t pte = mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
+        pte.pt.table = 1;
+        write_pte(&root[first_idx + i], pte);
+    }
+
+    per_cpu(xen_dommap, cpu) = domheap;
+
+    return true;
+}
+
 void *map_domain_page_global(mfn_t mfn)
 {
     return vmap(&mfn, 1);
@@ -633,16 +685,6 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
         p[i].pt.xn = 0;
     }
 
-#ifdef CONFIG_ARM_32
-    for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
-    {
-        p[first_table_offset(DOMHEAP_VIRT_START+i*FIRST_SIZE)]
-            = pte_of_xenaddr((uintptr_t)(cpu0_dommap +
-                                         i * XEN_PT_LPAE_ENTRIES));
-        p[first_table_offset(DOMHEAP_VIRT_START+i*FIRST_SIZE)].pt.table = 1;
-    }
-#endif
-
     /* Break up the Xen mapping into 4k pages and protect them separately. */
     for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
     {
@@ -686,7 +728,6 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 
 #ifdef CONFIG_ARM_32
     per_cpu(xen_pgtable, 0) = cpu0_pgtable;
-    per_cpu(xen_dommap, 0) = cpu0_dommap;
 #endif
 }
 
@@ -719,39 +760,28 @@ int init_secondary_pagetables(int cpu)
 #else
 int init_secondary_pagetables(int cpu)
 {
-    lpae_t *first, *domheap, pte;
-    int i;
+    lpae_t *first;
 
     first = alloc_xenheap_page(); /* root == first level on 32-bit 3-level trie */
-    domheap = alloc_xenheap_pages(get_order_from_pages(DOMHEAP_SECOND_PAGES), 0);
 
-    if ( domheap == NULL || first == NULL )
+    if ( !first )
     {
-        printk("Not enough free memory for secondary CPU%d pagetables\n", cpu);
-        free_xenheap_pages(domheap, get_order_from_pages(DOMHEAP_SECOND_PAGES));
-        free_xenheap_page(first);
+        printk("CPU%u: Unable to allocate the first page-table\n", cpu);
         return -ENOMEM;
     }
 
     /* Initialise root pagetable from root of boot tables */
     memcpy(first, cpu0_pgtable, PAGE_SIZE);
+    per_cpu(xen_pgtable, cpu) = first;
 
-    /* Ensure the domheap has no stray mappings */
-    memset(domheap, 0, DOMHEAP_SECOND_PAGES*PAGE_SIZE);
-
-    /* Update the first level mapping to reference the local CPUs
-     * domheap mapping pages. */
-    for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
+    if ( !init_domheap_mappings(cpu) )
     {
-        pte = mfn_to_xen_entry(virt_to_mfn(domheap + i * XEN_PT_LPAE_ENTRIES),
-                               MT_NORMAL);
-        pte.pt.table = 1;
-        write_pte(&first[first_table_offset(DOMHEAP_VIRT_START+i*FIRST_SIZE)], pte);
+        printk("CPU%u: Unable to prepare the domheap page-tables\n", cpu);
+        per_cpu(xen_pgtable, cpu) = NULL;
+        free_xenheap_page(first);
+        return -ENOMEM;
     }
 
-    per_cpu(xen_pgtable, cpu) = first;
-    per_cpu(xen_dommap, cpu) = domheap;
-
     clear_boot_pagetables();
 
     /* Set init_ttbr for this CPU coming up */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 577c54e6fbfa..31574996f36d 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -783,6 +783,14 @@ static void __init setup_mm(void)
     setup_frametable_mappings(ram_start, ram_end);
     max_page = PFN_DOWN(ram_end);
 
+    /*
+     * The allocators may need to use map_domain_page() (such as for
+     * scrubbing pages). So we need to prepare the domheap area first.
+     */
+    if ( !init_domheap_mappings(smp_processor_id()) )
+        panic("CPU%u: Unable to prepare the domheap page-tables\n",
+              smp_processor_id());
+
     /* Add xenheap memory that was not already added to the boot allocator. */
     init_xenheap_pages(mfn_to_maddr(xenheap_mfn_start),
                        mfn_to_maddr(xenheap_mfn_end));
-- 
2.32.0


