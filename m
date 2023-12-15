Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0913814045
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 03:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654840.1022300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJk-0004JH-Cy; Fri, 15 Dec 2023 02:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654840.1022300; Fri, 15 Dec 2023 02:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJk-00048m-4u; Fri, 15 Dec 2023 02:52:48 +0000
Received: by outflank-mailman (input) for mailman id 654840;
 Fri, 15 Dec 2023 02:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onWf=H2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rDyJi-0002yh-Et
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 02:52:46 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05c8c75b-9af5-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 03:52:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C21728285463;
 Thu, 14 Dec 2023 20:52:44 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0f5zos89AOXS; Thu, 14 Dec 2023 20:52:44 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DDA77828698C;
 Thu, 14 Dec 2023 20:52:43 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rDbIojDsXB3J; Thu, 14 Dec 2023 20:52:43 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E2FB182868E0;
 Thu, 14 Dec 2023 20:52:42 -0600 (CST)
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
X-Inumbo-ID: 05c8c75b-9af5-11ee-98ea-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DDA77828698C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1702608763; bh=omGeWwxxs1EefNj9oLx+tt5P0J41D7DMHK4/6rhqXn8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=JycP26csV4eCNTiWpwYj0UO1/1zMIq/ZdY4Vho8OAcEWRnTNRR0fasALiSnxiJFiE
	 AY1j+f/dhj3GBPqFEIVY8OuFoU4UGnoErZPCda9BL732szXoFY5Qg0YZJnE34oucvV
	 KVfpHH8JjwtSPDcggbVfGm/W5+l4w+QoEWSiBDAk=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 7/7] xen/ppc: mm-radix: Allocate Partition and Process Tables at runtime
Date: Thu, 14 Dec 2023 20:44:02 -0600
Message-Id: <f49a4a372a9f82e217fa56ba0dc3068deff32ef5.1702607884.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1702607884.git.sanastasio@raptorengineering.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

In the initial mm-radix implementation, the in-memory partition and
process tables required to configure the MMU were allocated statically
since the boot allocator was not yet available.

Now that it is, allocate these tables at runtime and bump the size of
the Process Table to its maximum supported value (on POWER9). Also bump
the number of static LVL2/3 PD frames to tolerate cases where the boot
allocator returns an address outside of the range of the LVL2 frame used
for Xen.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in v2:
  - Bump LVL2/3 PD count to 3 to avoid running out in case the boot
  allocator returns a suitably high address.

 xen/arch/ppc/mm-radix.c | 169 +++++++++++++++++++++++-----------------
 1 file changed, 97 insertions(+), 72 deletions(-)

diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index de181cf6f1..e5604d8fb3 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -22,7 +22,7 @@ void enable_mmu(void);
 #endif

 #define INITIAL_LVL1_PD_COUNT      1
-#define INITIAL_LVL2_LVL3_PD_COUNT 2
+#define INITIAL_LVL2_LVL3_PD_COUNT 3
 #define INITIAL_LVL4_PT_COUNT      256

 static size_t __initdata initial_lvl1_pd_pool_used;
@@ -34,17 +34,13 @@ static struct lvl2_pd initial_lvl2_lvl3_pd_pool[INITIAL_LVL2_LVL3_PD_COUNT];
 static size_t __initdata initial_lvl4_pt_pool_used;
 static struct lvl4_pt initial_lvl4_pt_pool[INITIAL_LVL4_PT_COUNT];

-/* Only reserve minimum Partition and Process tables  */
 #define PATB_SIZE_LOG2 16 /* Only supported partition table size on POWER9 */
 #define PATB_SIZE      (1UL << PATB_SIZE_LOG2)
-#define PRTB_SIZE_LOG2 12
+#define PRTB_SIZE_LOG2 24 /* Maximum process table size on POWER9 */
 #define PRTB_SIZE      (1UL << PRTB_SIZE_LOG2)

-static struct patb_entry
-    __aligned(PATB_SIZE) initial_patb[PATB_SIZE / sizeof(struct patb_entry)];
-
-static struct prtb_entry
-    __aligned(PRTB_SIZE) initial_prtb[PRTB_SIZE / sizeof(struct prtb_entry)];
+static struct patb_entry *initial_patb;
+static struct prtb_entry *initial_prtb;

 static __init struct lvl1_pd *lvl1_pd_pool_alloc(void)
 {
@@ -86,6 +82,62 @@ static __init struct lvl4_pt *lvl4_pt_pool_alloc(void)
     return &initial_lvl4_pt_pool[initial_lvl4_pt_pool_used++];
 }

+static void map_page_initial(struct lvl1_pd *lvl1, vaddr_t virt, paddr_t phys,
+                             unsigned long flags)
+{
+    struct lvl2_pd *lvl2;
+    struct lvl3_pd *lvl3;
+    struct lvl4_pt *lvl4;
+    pde_t *pde;
+    pte_t *pte;
+
+    /* Allocate LVL 2 PD if necessary */
+    pde = pt_entry(lvl1, virt);
+    if ( !pde_is_valid(*pde) )
+    {
+        lvl2 = lvl2_pd_pool_alloc();
+        *pde = paddr_to_pde(__pa(lvl2), PDE_VALID,
+                            XEN_PT_ENTRIES_LOG2_LVL_2);
+    }
+    else
+        lvl2 = __va(pde_to_paddr(*pde));
+
+    /* Allocate LVL 3 PD if necessary */
+    pde = pt_entry(lvl2, virt);
+    if ( !pde_is_valid(*pde) )
+    {
+        lvl3 = lvl3_pd_pool_alloc();
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
+        lvl4 = lvl4_pt_pool_alloc();
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
+}
+
 static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
                                          vaddr_t map_start,
                                          vaddr_t map_end,
@@ -105,80 +157,43 @@ static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
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
+        unsigned long flags;

-        /* Allocate LVL 3 PD if necessary */
-        pde = pt_entry(lvl2, page_addr);
-        if ( !pde_is_valid(*pde) )
+        if ( is_kernel_text(page_addr) || is_kernel_inittext(page_addr) )
         {
-            lvl3 = lvl3_pd_pool_alloc();
-            *pde = paddr_to_pde(__pa(lvl3), PDE_VALID,
-                                XEN_PT_ENTRIES_LOG2_LVL_3);
+            radix_dprintk("%016lx being marked as TEXT (RX)\n", page_addr);
+            flags = PTE_XEN_RX;
         }
-        else
-            lvl3 = __va(pde_to_paddr(*pde));
-
-        /* Allocate LVL 4 PT if necessary */
-        pde = pt_entry(lvl3, page_addr);
-        if ( !pde_is_valid(*pde) )
-        {
-            lvl4 = lvl4_pt_pool_alloc();
-            *pde = paddr_to_pde(__pa(lvl4), PDE_VALID,
-                                XEN_PT_ENTRIES_LOG2_LVL_4);
-        }
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
+    }
+
+    /* Map runtime-allocated PATB, PRTB */
+    for ( page_addr = (uint64_t)initial_patb;
+          page_addr < (uint64_t)initial_patb + PATB_SIZE;
+          page_addr += PAGE_SIZE )
+    {
+        map_page_initial(lvl1, page_addr, __pa(page_addr), PTE_XEN_RW);
+    }
+
+    for ( page_addr = (uint64_t)initial_prtb;
+          page_addr < (uint64_t)initial_prtb + PRTB_SIZE;
+          page_addr += PAGE_SIZE )
+    {
+        map_page_initial(lvl1, page_addr, __pa(page_addr), PTE_XEN_RW);
     }
 }

@@ -210,6 +225,16 @@ void __init setup_initial_pagetables(void)
 {
     struct lvl1_pd *root = lvl1_pd_pool_alloc();
     unsigned long lpcr;
+    mfn_t patb_mfn, prtb_mfn;
+
+    /* Allocate mfns for in-memory tables using the boot allocator */
+    prtb_mfn = alloc_boot_pages(PRTB_SIZE / PAGE_SIZE,
+                                max(1, PRTB_SIZE_LOG2 - PAGE_SHIFT));
+    patb_mfn = alloc_boot_pages(PATB_SIZE / PAGE_SIZE,
+                                max(1, PATB_SIZE_LOG2 - PAGE_SHIFT));
+
+    initial_patb = __va(mfn_to_maddr(patb_mfn));
+    initial_prtb = __va(mfn_to_maddr(prtb_mfn));

     setup_initial_mapping(root, (vaddr_t)_start, (vaddr_t)_end, __pa(_start));

--
2.30.2


