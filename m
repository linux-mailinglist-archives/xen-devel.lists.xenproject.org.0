Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3388B2241
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 15:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712060.1112458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzysw-0000Bw-TW; Thu, 25 Apr 2024 13:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712060.1112458; Thu, 25 Apr 2024 13:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzysw-0000A8-OP; Thu, 25 Apr 2024 13:11:34 +0000
Received: by outflank-mailman (input) for mailman id 712060;
 Thu, 25 Apr 2024 13:11:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2YU=L6=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rzysu-0008LR-Iy
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 13:11:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 54417f5a-0305-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 15:11:30 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5496E1063;
 Thu, 25 Apr 2024 06:11:57 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 481A73F7BD;
 Thu, 25 Apr 2024 06:11:28 -0700 (PDT)
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
X-Inumbo-ID: 54417f5a-0305-11ef-b4bb-af5377834399
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 1/2] xen/arm: Add DT reserve map regions to bootinfo.reserved_mem
Date: Thu, 25 Apr 2024 14:11:18 +0100
Message-Id: <20240425131119.2299629-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425131119.2299629-1-luca.fancellu@arm.com>
References: <20240425131119.2299629-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the code is listing device tree reserve map regions
as reserved memory for Xen, but they are not added into
bootinfo.reserved_mem and they are fetched in multiple places
using the same code sequence, causing duplication. Fix this
by adding them to the bootinfo.reserved_mem at early stage.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/arm32/mmu/mm.c      | 29 +----------------
 xen/arch/arm/bootfdt.c           | 51 ++++++++++++++++++------------
 xen/arch/arm/domain_build.c      |  3 +-
 xen/arch/arm/include/asm/setup.h |  5 +++
 xen/arch/arm/setup.c             | 53 +++++++++-----------------------
 5 files changed, 53 insertions(+), 88 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index 23150122f7c4..be480c31ea05 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -73,33 +73,6 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
         }
     }
 
-    /* Now check any fdt reserved areas. */
-
-    nr = fdt_num_mem_rsv(device_tree_flattened);
-
-    for ( ; i < mi->nr_mods + nr; i++ )
-    {
-        paddr_t mod_s, mod_e;
-
-        if ( fdt_get_mem_rsv_paddr(device_tree_flattened,
-                                   i - mi->nr_mods,
-                                   &mod_s, &mod_e ) < 0 )
-            /* If we can't read it, pretend it doesn't exist... */
-            continue;
-
-        /* fdt_get_mem_rsv_paddr returns length */
-        mod_e += mod_s;
-
-        if ( s < mod_e && mod_s < e )
-        {
-            mod_e = consider_modules(mod_e, e, size, align, i+1);
-            if ( mod_e )
-                return mod_e;
-
-            return consider_modules(s, mod_s, size, align, i+1);
-        }
-    }
-
     /*
      * i is the current bootmodule we are evaluating, across all
      * possible kinds of bootmodules.
@@ -108,7 +81,7 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
      * need to index the reserved_mem bank starting from 0, and only counting
      * the reserved-memory modules. Hence, we need to use i - nr.
      */
-    nr += mi->nr_mods;
+    nr = mi->nr_mods;
     for ( ; i - nr < reserved_mem->nr_banks; i++ )
     {
         paddr_t r_s = reserved_mem->bank[i - nr].start;
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 4d708442a19e..6e060111d95b 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -475,8 +475,7 @@ static void __init early_print_info(void)
     const struct membanks *mem_resv = bootinfo_get_reserved_mem();
     struct bootmodules *mods = &bootinfo.modules;
     struct bootcmdlines *cmds = &bootinfo.cmdlines;
-    unsigned int i, j;
-    int nr_rsvd;
+    unsigned int i;
 
     for ( i = 0; i < mi->nr_banks; i++ )
         printk("RAM: %"PRIpaddr" - %"PRIpaddr"\n",
@@ -490,26 +489,11 @@ static void __init early_print_info(void)
                 mods->module[i].start + mods->module[i].size,
                 boot_module_kind_as_string(mods->module[i].kind));
 
-    nr_rsvd = fdt_num_mem_rsv(device_tree_flattened);
-    if ( nr_rsvd < 0 )
-        panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
-
-    for ( i = 0; i < nr_rsvd; i++ )
-    {
-        paddr_t s, e;
-
-        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &e) < 0 )
-            continue;
-
-        /* fdt_get_mem_rsv_paddr returns length */
-        e += s;
-        printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i, s, e);
-    }
-    for ( j = 0; j < mem_resv->nr_banks; j++, i++ )
+    for ( i = 0; i < mem_resv->nr_banks; i++ )
     {
         printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i,
-               mem_resv->bank[j].start,
-               mem_resv->bank[j].start + mem_resv->bank[j].size - 1);
+               mem_resv->bank[i].start,
+               mem_resv->bank[i].start + mem_resv->bank[i].size - 1);
     }
     early_print_info_shmem();
     printk("\n");
@@ -550,7 +534,10 @@ static void __init swap_memory_node(void *_a, void *_b, size_t size)
  */
 size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
 {
+    struct membanks *reserved_mem = bootinfo_get_reserved_mem();
     struct membanks *mem = bootinfo_get_mem();
+    unsigned int i;
+    int nr_rsvd;
     int ret;
 
     ret = fdt_check_header(fdt);
@@ -559,6 +546,30 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
 
     add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
 
+    nr_rsvd = fdt_num_mem_rsv(fdt);
+    if ( nr_rsvd < 0 )
+        panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
+
+    for ( i = 0; i < nr_rsvd; i++ )
+    {
+        struct membank *bank;
+        paddr_t s, sz;
+
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
+            continue;
+
+        if ( reserved_mem->nr_banks < reserved_mem->max_banks )
+        {
+            bank = &reserved_mem->bank[reserved_mem->nr_banks];
+            bank->start = s;
+            bank->size = sz;
+            bank->type = MEMBANK_FDT_RESVMEM;
+            reserved_mem->nr_banks++;
+        }
+        else
+            panic("Cannot allocate reserved memory bank\n");
+    }
+
     ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
     if ( ret )
         panic("Early FDT parsing failed (%d)\n", ret);
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 0784e4c5e315..6fc88a8234e4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -793,7 +793,8 @@ int __init make_memory_node(const struct kernel_info *kinfo, int addrcells,
         u64 start = mem->bank[i].start;
         u64 size = mem->bank[i].size;
 
-        if ( mem->bank[i].type == MEMBANK_STATIC_DOMAIN )
+        if ( (mem->bank[i].type == MEMBANK_STATIC_DOMAIN) ||
+             (mem->bank[i].type == MEMBANK_FDT_RESVMEM) )
             continue;
 
         nr_cells += reg_size;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 28fb659fe946..fc6967f9a435 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -42,6 +42,11 @@ enum membank_type {
      * in reserved_mem.
      */
     MEMBANK_STATIC_HEAP,
+    /*
+     * The MEMBANK_FDT_RESVMEM type is used to indicate whether the memory
+     * bank is from the FDT reserve map.
+     */
+    MEMBANK_FDT_RESVMEM,
 };
 
 /* Indicates the maximum number of characters(\0 included) for shm_id */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d242674381d4..c4e5c19b11d6 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -210,48 +210,18 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
     const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
 #ifdef CONFIG_STATIC_SHM
     const struct membanks *shmem = bootinfo_get_shmem();
+    unsigned int offset;
 #endif
-    unsigned int i, nr;
-    int rc;
-
-    rc = fdt_num_mem_rsv(device_tree_flattened);
-    if ( rc < 0 )
-        panic("Unable to retrieve the number of reserved regions (rc=%d)\n",
-              rc);
-
-    nr = rc;
-
-    for ( i = first; i < nr ; i++ )
-    {
-        paddr_t r_s, r_e;
-
-        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &r_s, &r_e ) < 0 )
-            /* If we can't read it, pretend it doesn't exist... */
-            continue;
-
-        r_e += r_s; /* fdt_get_mem_rsv_paddr returns length */
-
-        if ( s < r_e && r_s < e )
-        {
-            dt_unreserved_regions(r_e, e, cb, i+1);
-            dt_unreserved_regions(s, r_s, cb, i+1);
-            return;
-        }
-    }
+    unsigned int i;
 
     /*
      * i is the current bootmodule we are evaluating across all possible
      * kinds.
-     *
-     * When retrieving the corresponding reserved-memory addresses
-     * below, we need to index the reserved_mem->bank starting
-     * from 0, and only counting the reserved-memory modules. Hence,
-     * we need to use i - nr.
      */
-    for ( ; i - nr < reserved_mem->nr_banks; i++ )
+    for ( i = first; i < reserved_mem->nr_banks; i++ )
     {
-        paddr_t r_s = reserved_mem->bank[i - nr].start;
-        paddr_t r_e = r_s + reserved_mem->bank[i - nr].size;
+        paddr_t r_s = reserved_mem->bank[i].start;
+        paddr_t r_e = r_s + reserved_mem->bank[i].size;
 
         if ( s < r_e && r_s < e )
         {
@@ -262,11 +232,16 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
     }
 
 #ifdef CONFIG_STATIC_SHM
-    nr += reserved_mem->nr_banks;
-    for ( ; i - nr < shmem->nr_banks; i++ )
+    /*
+     * When retrieving the corresponding shared memory addresses
+     * below, we need to index the shmem->bank starting from 0, hence
+     * we need to use i - reserved_mem->nr_banks.
+    */
+    offset = reserved_mem->nr_banks;
+    for ( ; i - offset < shmem->nr_banks; i++ )
     {
-        paddr_t r_s = shmem->bank[i - nr].start;
-        paddr_t r_e = r_s + shmem->bank[i - nr].size;
+        paddr_t r_s = shmem->bank[i - offset].start;
+        paddr_t r_e = r_s + shmem->bank[i - offset].size;
 
         if ( s < r_e && r_s < e )
         {
-- 
2.34.1


