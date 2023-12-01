Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2E58013D5
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:01:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645684.1007944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99gg-0001Gb-0Z; Fri, 01 Dec 2023 20:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645684.1007944; Fri, 01 Dec 2023 20:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99gf-0001BR-T4; Fri, 01 Dec 2023 20:00:33 +0000
Received: by outflank-mailman (input) for mailman id 645684;
 Fri, 01 Dec 2023 20:00:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dz9Y=HM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r99gd-0000tO-QJ
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:00:31 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45287b97-9084-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 21:00:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5529C8285518;
 Fri,  1 Dec 2023 14:00:26 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AJ12H23B5E7Y; Fri,  1 Dec 2023 14:00:25 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7D19082855D4;
 Fri,  1 Dec 2023 14:00:25 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PfznH4LraZze; Fri,  1 Dec 2023 14:00:25 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 112B48285A3A;
 Fri,  1 Dec 2023 14:00:25 -0600 (CST)
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
X-Inumbo-ID: 45287b97-9084-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 7D19082855D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701460825; bh=6IecuqXFYX4NR7LCnK3DtB9eOXIqDkT3g8LO9AuZntk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=cZB8rwTCXJJH+Nhm+bqHQcsLnqpdAH/4iZBEGjg7pCc7DtapgMUxMOcFYlgiozPi/
	 SEzAsOyj5URaTHsOZURHi94cEb+jw8cq19fqB/rgDj3L2/A8IaBAx+WN1dL4i1aa9y
	 gJ5NYVIiqbh9uaFGpeEvdrkEZhKdfTHhkcqMYqw0=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 3/3] xen/ppc: mm-radix: Allocate Partition and Process Tables at runtime
Date: Fri,  1 Dec 2023 13:59:56 -0600
Message-Id: <b3943c96d4a97a87b6d79853de76d3775b093063.1701384928.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1701384928.git.sanastasio@raptorengineering.com>
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

In the initial mm-radix implementation, the in-memory partition and
process tables required to configure the MMU were allocated statically
since the boot allocator was not yet available.

Now that it is, allocate these tables at runtime and bump the size of
the Process Table to its maximum supported value (on POWER9).

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/mm-radix.c | 167 +++++++++++++++++++++++-----------------
 1 file changed, 96 insertions(+), 71 deletions(-)

diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index de181cf6f1..fae5ebfdcc 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
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


