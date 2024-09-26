Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D9987B26
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 00:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805920.1217201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stwv5-0003F8-Q3; Thu, 26 Sep 2024 22:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805920.1217201; Thu, 26 Sep 2024 22:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stwv5-0003Br-Mv; Thu, 26 Sep 2024 22:25:07 +0000
Received: by outflank-mailman (input) for mailman id 805920;
 Thu, 26 Sep 2024 22:25:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ruc3=QY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1stwv3-0002V3-W8
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 22:25:05 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c8c2c18-7c56-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 00:25:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9A15582875D8;
 Thu, 26 Sep 2024 17:25:02 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QOKNOPx6MOA3; Thu, 26 Sep 2024 17:25:00 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C7CD68287AF6;
 Thu, 26 Sep 2024 17:25:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id b1KiKTt7BInO; Thu, 26 Sep 2024 17:25:00 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 6E2A282870A9;
 Thu, 26 Sep 2024 17:25:00 -0500 (CDT)
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
X-Inumbo-ID: 2c8c2c18-7c56-11ef-99a2-01e77a169b0f
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C7CD68287AF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1727389500; bh=YYxx5HUZxjPW1IsF8Z0FYs/3hWd+njQij1zrklGXAr0=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=TUZvxOEv2KZWyOL4nnxd35TUBKQlklUaLNvhZLoeFxQs5Fp74q5+aCr38tGzKoUWu
	 dQUxkmZsoryNus49bmMTihf/m/EF86SWiremd6WSCGO9URvsG0R5nlacWNDIRHKw/c
	 Y43b74pc1kD4XTWL86Hz0Sovb9L5uiWrkUpvr/zk=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v5 3/3] xen/ppc: mm-radix: Allocate all paging structures at runtime
Date: Thu, 26 Sep 2024 17:24:44 -0500
Message-Id: <c34ab55cd5ccc7658216e9122eb30569815958d3.1727388925.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1727388925.git.sanastasio@raptorengineering.com>
References: <cover.1727388925.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

In the initial mm-radix implementation, the in-memory partition and
process tables required to configure the MMU, as well as the page tables
themselves were all allocated statically since the boot allocator was
not yet available.

Now that it is, allocate these structures at runtime and bump the size
of the Process Table to its maximum supported value (on POWER9).

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in v5:
  - Add more clarification comments to min/max mfn variable decls.

Changes in v4:
  - use mfn_add in initial_page_alloc()
  - zero pages returned by initial_page_alloc()

 xen/arch/ppc/mm-radix.c | 238 ++++++++++++++++++++++------------------
 1 file changed, 130 insertions(+), 108 deletions(-)

diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index 24232f3907..e3bf41675b 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -22,69 +22,112 @@ void enable_mmu(void);
 #define radix_dprintk(...)
 #endif

-#define INITIAL_LVL1_PD_COUNT      1
-#define INITIAL_LVL2_LVL3_PD_COUNT 2
-#define INITIAL_LVL4_PT_COUNT      256
-
-static size_t __initdata initial_lvl1_pd_pool_used;
-static struct lvl1_pd initial_lvl1_pd_pool[INITIAL_LVL1_PD_COUNT];
-
-static size_t __initdata initial_lvl2_lvl3_pd_pool_used;
-static struct lvl2_pd initial_lvl2_lvl3_pd_pool[INITIAL_LVL2_LVL3_PD_COUNT];
-
-static size_t __initdata initial_lvl4_pt_pool_used;
-static struct lvl4_pt initial_lvl4_pt_pool[INITIAL_LVL4_PT_COUNT];
-
-/* Only reserve minimum Partition and Process tables  */
 #define PATB_SIZE_LOG2 16 /* Only supported partition table size on POWER9 */
 #define PATB_SIZE      (1UL << PATB_SIZE_LOG2)
-#define PRTB_SIZE_LOG2 12
+#define PRTB_SIZE_LOG2 24 /* Maximum process table size on POWER9 */
 #define PRTB_SIZE      (1UL << PRTB_SIZE_LOG2)

-static struct patb_entry
-    __aligned(PATB_SIZE) initial_patb[PATB_SIZE / sizeof(struct patb_entry)];
+static struct patb_entry *initial_patb;
+static struct prtb_entry *initial_prtb;

-static struct prtb_entry
-    __aligned(PRTB_SIZE) initial_prtb[PRTB_SIZE / sizeof(struct prtb_entry)];
+/*
+ * The highest and lowest mfns returned by initial_page_alloc. In order to
+ * bootstrap the xen's initial page tables, the mfns allocated to store the
+ * paging structurs needs to be tracked so that they can be included in the
+ * mapping. This is most simply accomplished by keeping track of the minimum
+ * and maximum mfn numbers so that the whole range from min->max can be mapped.
+ */
+static mfn_t __initdata min_alloc_mfn = {-1};
+static mfn_t __initdata max_alloc_mfn = {0};

-static __init struct lvl1_pd *lvl1_pd_pool_alloc(void)
+/*
+ * A thin wrapper for alloc_boot_pages that keeps track of the maximum and
+ * minimum mfns that have been allocated. This information is used by
+ * setup_initial_mapping to include the allocated pages in the initial
+ * page mapping.
+ *
+ * Additionally, allocated pages are zeroed before return.
+ */
+static mfn_t __init initial_page_alloc(unsigned long nr_pfns,
+                                       unsigned long pfn_align)
 {
-    if ( initial_lvl1_pd_pool_used >= INITIAL_LVL1_PD_COUNT )
-    {
-        early_printk("Ran out of space for LVL1 PD!\n");
-        die();
-    }
+    mfn_t mfn_first, mfn_last;

-    return &initial_lvl1_pd_pool[initial_lvl1_pd_pool_used++];
-}
+    mfn_first = alloc_boot_pages(nr_pfns, pfn_align);
+    mfn_last = mfn_add(mfn_first, nr_pfns - 1);

-static __init struct lvl2_pd *lvl2_pd_pool_alloc(void)
-{
-    if ( initial_lvl2_lvl3_pd_pool_used >= INITIAL_LVL2_LVL3_PD_COUNT )
-    {
-        early_printk("Ran out of space for LVL2/3 PD!\n");
-        die();
-    }
+    min_alloc_mfn = _mfn(min(mfn_x(min_alloc_mfn), mfn_x(mfn_first)));
+    max_alloc_mfn = _mfn(max(mfn_x(max_alloc_mfn), mfn_x(mfn_last)));
+
+    memset(__va(mfn_to_maddr(mfn_first)), 0, nr_pfns << PAGE_SHIFT);

-    return &initial_lvl2_lvl3_pd_pool[initial_lvl2_lvl3_pd_pool_used++];
+    return mfn_first;
 }

-static __init struct lvl3_pd *lvl3_pd_pool_alloc(void)
+static __init void *initial_pd_pt_alloc(void)
 {
-    BUILD_BUG_ON(sizeof(struct lvl3_pd) != sizeof(struct lvl2_pd));
+    BUILD_BUG_ON(sizeof(struct lvl1_pd) > PAGE_SIZE);
+    BUILD_BUG_ON(sizeof(struct lvl2_pd) > PAGE_SIZE);
+    BUILD_BUG_ON(sizeof(struct lvl3_pd) > PAGE_SIZE);
+    BUILD_BUG_ON(sizeof(struct lvl4_pt) > PAGE_SIZE);

-    return (struct lvl3_pd *) lvl2_pd_pool_alloc();
+    return __va(mfn_to_maddr(initial_page_alloc(1, 1)));
 }

-static __init struct lvl4_pt *lvl4_pt_pool_alloc(void)
+static void map_page_initial(struct lvl1_pd *lvl1, vaddr_t virt, paddr_t phys,
+                             unsigned long flags)
 {
-    if ( initial_lvl4_pt_pool_used >= INITIAL_LVL4_PT_COUNT )
+    struct lvl2_pd *lvl2;
+    struct lvl3_pd *lvl3;
+    struct lvl4_pt *lvl4;
+    pde_t *pde;
+    pte_t *pte;
+
+    /* Allocate LVL 2 PD if necessary */
+    pde = pt_entry(lvl1, virt);
+    if ( !pde_is_valid(*pde) )
     {
-        early_printk("Ran out of space for LVL4 PT!\n");
-        die();
+        lvl2 = initial_pd_pt_alloc();
+        *pde = paddr_to_pde(__pa(lvl2), PDE_VALID,
+                            XEN_PT_ENTRIES_LOG2_LVL_2);
     }
+    else
+        lvl2 = __va(pde_to_paddr(*pde));

-    return &initial_lvl4_pt_pool[initial_lvl4_pt_pool_used++];
+    /* Allocate LVL 3 PD if necessary */
+    pde = pt_entry(lvl2, virt);
+    if ( !pde_is_valid(*pde) )
+    {
+        lvl3 = initial_pd_pt_alloc();
+        *pde = paddr_to_pde(__pa(lvl3), PDE_VALID,
+                            XEN_PT_ENTRIES_LOG2_LVL_3);
+    }
+    else
+        lvl3 = __va(pde_to_paddr(*pde));
+
+    /* Allocate LVL 4 PT if necessary */
+    pde = pt_entry(lvl3, virt);
+    if ( !pde_is_valid(*pde) )
+    {
+        lvl4 = initial_pd_pt_alloc();
+        *pde = paddr_to_pde(__pa(lvl4), PDE_VALID,
+                            XEN_PT_ENTRIES_LOG2_LVL_4);
+    }
+    else
+        lvl4 = __va(pde_to_paddr(*pde));
+
+    /* Finally, create PTE in LVL 4 PT */
+    pte = pt_entry(lvl4, virt);
+    if ( !pte_is_valid(*pte) )
+    {
+        radix_dprintk("%016lx being mapped to %016lx\n", phys, virt);
+        *pte = paddr_to_pte(phys, flags);
+    }
+    else
+    {
+        early_printk("BUG: Tried to create PTE for already-mapped page!");
+        die();
+    }
 }

 static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
@@ -93,6 +136,7 @@ static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
                                          paddr_t phys_base)
 {
     uint64_t page_addr;
+    mfn_t previous_max_alloc_mfn;

     if ( map_start & ~PAGE_MASK )
     {
@@ -106,81 +150,47 @@ static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
         die();
     }

+    /* Identity map Xen itself */
     for ( page_addr = map_start; page_addr < map_end; page_addr += PAGE_SIZE )
     {
-        struct lvl2_pd *lvl2;
-        struct lvl3_pd *lvl3;
-        struct lvl4_pt *lvl4;
-        pde_t *pde;
-        pte_t *pte;
-
-        /* Allocate LVL 2 PD if necessary */
-        pde = pt_entry(lvl1, page_addr);
-        if ( !pde_is_valid(*pde) )
-        {
-            lvl2 = lvl2_pd_pool_alloc();
-            *pde = paddr_to_pde(__pa(lvl2), PDE_VALID,
-                                XEN_PT_ENTRIES_LOG2_LVL_2);
-        }
-        else
-            lvl2 = __va(pde_to_paddr(*pde));
-
-        /* Allocate LVL 3 PD if necessary */
-        pde = pt_entry(lvl2, page_addr);
-        if ( !pde_is_valid(*pde) )
-        {
-            lvl3 = lvl3_pd_pool_alloc();
-            *pde = paddr_to_pde(__pa(lvl3), PDE_VALID,
-                                XEN_PT_ENTRIES_LOG2_LVL_3);
-        }
-        else
-            lvl3 = __va(pde_to_paddr(*pde));
+        unsigned long flags;

-        /* Allocate LVL 4 PT if necessary */
-        pde = pt_entry(lvl3, page_addr);
-        if ( !pde_is_valid(*pde) )
+        if ( is_kernel_text(page_addr) || is_kernel_inittext(page_addr) )
         {
-            lvl4 = lvl4_pt_pool_alloc();
-            *pde = paddr_to_pde(__pa(lvl4), PDE_VALID,
-                                XEN_PT_ENTRIES_LOG2_LVL_4);
+            radix_dprintk("%016lx being marked as TEXT (RX)\n", page_addr);
+            flags = PTE_XEN_RX;
         }
-        else
-            lvl4 = __va(pde_to_paddr(*pde));
-
-        /* Finally, create PTE in LVL 4 PT */
-        pte = pt_entry(lvl4, page_addr);
-        if ( !pte_is_valid(*pte) )
+        else if ( is_kernel_rodata(page_addr) )
         {
-            unsigned long paddr = (page_addr - map_start) + phys_base;
-            unsigned long flags;
-
-            radix_dprintk("%016lx being mapped to %016lx\n", paddr, page_addr);
-            if ( is_kernel_text(page_addr) || is_kernel_inittext(page_addr) )
-            {
-                radix_dprintk("%016lx being marked as TEXT (RX)\n", page_addr);
-                flags = PTE_XEN_RX;
-            }
-            else if ( is_kernel_rodata(page_addr) )
-            {
-                radix_dprintk("%016lx being marked as RODATA (RO)\n", page_addr);
-                flags = PTE_XEN_RO;
-            }
-            else
-            {
-                radix_dprintk("%016lx being marked as DEFAULT (RW)\n", page_addr);
-                flags = PTE_XEN_RW;
-            }
-
-            *pte = paddr_to_pte(paddr, flags);
-            radix_dprintk("%016lx is the result of PTE map\n",
-                paddr_to_pte(paddr, flags).pte);
+            radix_dprintk("%016lx being marked as RODATA (RO)\n", page_addr);
+            flags = PTE_XEN_RO;
         }
         else
         {
-            early_printk("BUG: Tried to create PTE for already-mapped page!");
-            die();
+            radix_dprintk("%016lx being marked as DEFAULT (RW)\n", page_addr);
+            flags = PTE_XEN_RW;
         }
+
+        map_page_initial(lvl1, page_addr, (page_addr - map_start) + phys_base, flags);
     }
+
+    previous_max_alloc_mfn = max_alloc_mfn;
+
+    /*
+     * Identity map all pages we've allocated for paging structures. This act
+     * itself will allocate more pages, so continue until we've mapped from
+     * `max_alloc_mfn` down to `min_alloc_mfn`. This assumes that the heap grows
+     * downwards, which matches the behavior of alloc_boot_pages.
+     */
+    for ( page_addr = (vaddr_t)__va(mfn_to_maddr(max_alloc_mfn));
+          mfn_to_maddr(min_alloc_mfn) <= __pa(page_addr);
+          page_addr -= PAGE_SIZE)
+    {
+        map_page_initial(lvl1, page_addr, __pa(page_addr), PTE_XEN_RW);
+    }
+
+    if ( mfn_x(previous_max_alloc_mfn) != mfn_x(max_alloc_mfn) )
+        panic("Early page heap unexpectedly grew upwards\n");
 }

 static void __init setup_partition_table(struct lvl1_pd *root)
@@ -209,9 +219,21 @@ static void __init setup_process_table(struct lvl1_pd *root)

 void __init setup_initial_pagetables(void)
 {
-    struct lvl1_pd *root = lvl1_pd_pool_alloc();
+    struct lvl1_pd *root;
     unsigned long lpcr;
+    mfn_t patb_mfn, prtb_mfn;
+
+    /* Allocate mfns for in-memory tables using the boot allocator */
+    prtb_mfn = initial_page_alloc(PRTB_SIZE / PAGE_SIZE,
+                                  1 << (PRTB_SIZE_LOG2 - PAGE_SHIFT));
+    patb_mfn = initial_page_alloc(PATB_SIZE / PAGE_SIZE,
+                                  1 << (PATB_SIZE_LOG2 - PAGE_SHIFT));
+
+    initial_patb = __va(mfn_to_maddr(patb_mfn));
+    initial_prtb = __va(mfn_to_maddr(prtb_mfn));

+    /* Allocate and create page tables */
+    root = initial_pd_pt_alloc();
     setup_initial_mapping(root, (vaddr_t)_start, (vaddr_t)_end, __pa(_start));

     /* Enable Radix mode in LPCR */
--
2.30.2


