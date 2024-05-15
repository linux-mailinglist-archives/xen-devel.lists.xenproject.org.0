Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C9B8C689A
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 16:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722426.1126392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Fae-00037S-QA; Wed, 15 May 2024 14:26:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722426.1126392; Wed, 15 May 2024 14:26:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Fae-000334-MT; Wed, 15 May 2024 14:26:44 +0000
Received: by outflank-mailman (input) for mailman id 722426;
 Wed, 15 May 2024 14:26:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kRjG=MS=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1s7Fad-0002KG-3T
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 14:26:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 259d49db-12c7-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 16:26:41 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 853561042;
 Wed, 15 May 2024 07:27:05 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2BAA3F7A6;
 Wed, 15 May 2024 07:26:39 -0700 (PDT)
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
X-Inumbo-ID: 259d49db-12c7-11ef-b4bb-af5377834399
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/7] xen/arm: Parse xen,shared-mem when host phys address is not provided
Date: Wed, 15 May 2024 15:26:22 +0100
Message-Id: <20240515142626.3480640-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515142626.3480640-1-luca.fancellu@arm.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Handle the parsing of the 'xen,shared-mem' property when the host physical
address is not provided, this commit is introducing the logic to parse it,
but the functionality is still not implemented and will be part of future
commits.

Rework the logic inside process_shm_node to check the shm_id before doing
the other checks, because it ease the logic itself, add more comment on
the logic.
Now when the host physical address is not provided, the value
INVALID_PADDR is chosen to signal this condition and it is stored as
start of the bank, due to that change also early_print_info_shmem and
init_sharedmem_pages are changed, to don't handle banks with start equal
to INVALID_PADDR.

Another change is done inside meminfo_overlap_check, to skip banks that
are starting with the start address INVALID_PADDR, that function is used
to check banks from reserved memory, shared memory and ACPI and since
the comment above the function states that wrapping around is not handled,
it's unlikely for these bank to have the start address as INVALID_PADDR.
Same change is done inside consider_modules, find_unallocated_memory and
dt_unreserved_regions functions, in order to skip banks that starts with
INVALID_PADDR from any computation.
The changes above holds because of this consideration.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2 changes:
 - fix comments, add parenthesis to some conditions, remove unneeded
   variables, remove else branch, increment counter in the for loop,
   skip INVALID_PADDR start banks from also consider_modules,
   find_unallocated_memory and dt_unreserved_regions. (Michal)
---
 xen/arch/arm/arm32/mmu/mm.c |  11 +++-
 xen/arch/arm/domain_build.c |   5 ++
 xen/arch/arm/setup.c        |  14 +++-
 xen/arch/arm/static-shmem.c | 125 +++++++++++++++++++++++++-----------
 4 files changed, 111 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index 23150122f7c4..3d46f32831bf 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -128,8 +128,15 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
     nr += reserved_mem->nr_banks;
     for ( ; i - nr < shmem->nr_banks; i++ )
     {
-        paddr_t r_s = shmem->bank[i - nr].start;
-        paddr_t r_e = r_s + shmem->bank[i - nr].size;
+        paddr_t r_s, r_e;
+
+        r_s = shmem->bank[i - nr].start;
+
+        /* Shared memory banks can contain INVALID_PADDR as start */
+        if ( INVALID_PADDR == r_s )
+            continue;
+
+        r_e = r_s + shmem->bank[i - nr].size;
 
         if ( s < r_e && r_s < e )
         {
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f6550809cfdf..4febba69ef63 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -926,6 +926,11 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
         for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
         {
             start = mem_banks[i]->bank[j].start;
+
+            /* Shared memory banks can contain INVALID_PADDR as start */
+            if ( INVALID_PADDR == start )
+                continue;
+
             end = mem_banks[i]->bank[j].start + mem_banks[i]->bank[j].size;
             res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
                                         PFN_DOWN(end - 1));
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d242674381d4..016859f6982a 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -265,8 +265,15 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
     nr += reserved_mem->nr_banks;
     for ( ; i - nr < shmem->nr_banks; i++ )
     {
-        paddr_t r_s = shmem->bank[i - nr].start;
-        paddr_t r_e = r_s + shmem->bank[i - nr].size;
+        paddr_t r_s, r_e;
+
+        r_s = shmem->bank[i - nr].start;
+
+        /* Shared memory banks can contain INVALID_PADDR as start */
+        if ( INVALID_PADDR == r_s )
+            continue;
+
+        r_e = r_s + shmem->bank[i - nr].size;
 
         if ( s < r_e && r_s < e )
         {
@@ -297,7 +304,8 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
         bank_start = mem->bank[i].start;
         bank_end = bank_start + mem->bank[i].size;
 
-        if ( region_end <= bank_start || region_start >= bank_end )
+        if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
+             region_start >= bank_end )
             continue;
         else
         {
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 8a14d120690c..ddaacbc77740 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -265,6 +265,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         pbase = boot_shm_bank->start;
         psize = boot_shm_bank->size;
 
+        if ( INVALID_PADDR == pbase )
+        {
+            printk("%pd: host physical address must be chosen by users at the moment", d);
+            return -EINVAL;
+        }
+
         /*
          * xen,shared-mem = <pbase, gbase, size>;
          * TODO: pbase is optional.
@@ -377,7 +383,8 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
 {
     const struct fdt_property *prop, *prop_id, *prop_role;
     const __be32 *cell;
-    paddr_t paddr, gaddr, size, end;
+    paddr_t paddr = INVALID_PADDR;
+    paddr_t gaddr, size, end;
     struct membanks *mem = bootinfo_get_shmem();
     struct shmem_membank_extra *shmem_extra = bootinfo_get_shmem_extra();
     unsigned int i;
@@ -432,24 +439,37 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
     if ( !prop )
         return -ENOENT;
 
+    cell = (const __be32 *)prop->data;
     if ( len != dt_cells_to_size(address_cells + size_cells + address_cells) )
     {
-        if ( len == dt_cells_to_size(size_cells + address_cells) )
-            printk("fdt: host physical address must be chosen by users at the moment.\n");
-
-        printk("fdt: invalid `xen,shared-mem` property.\n");
-        return -EINVAL;
+        if ( len == dt_cells_to_size(address_cells + size_cells) )
+            device_tree_get_reg(&cell, address_cells, size_cells, &gaddr,
+                                &size);
+        else
+        {
+            printk("fdt: invalid `xen,shared-mem` property.\n");
+            return -EINVAL;
+        }
     }
+    else
+    {
+        device_tree_get_reg(&cell, address_cells, address_cells, &paddr,
+                            &gaddr);
+        size = dt_next_cell(size_cells, &cell);
 
-    cell = (const __be32 *)prop->data;
-    device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
-    size = dt_next_cell(size_cells, &cell);
+        if ( !IS_ALIGNED(paddr, PAGE_SIZE) )
+        {
+            printk("fdt: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
+                paddr);
+            return -EINVAL;
+        }
 
-    if ( !IS_ALIGNED(paddr, PAGE_SIZE) )
-    {
-        printk("fdt: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
-               paddr);
-        return -EINVAL;
+        end = paddr + size;
+        if ( end <= paddr )
+        {
+            printk("fdt: static shared memory region %s overflow\n", shm_id);
+            return -EINVAL;
+        }
     }
 
     if ( !IS_ALIGNED(gaddr, PAGE_SIZE) )
@@ -471,39 +491,64 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
         return -EINVAL;
     }
 
-    end = paddr + size;
-    if ( end <= paddr )
-    {
-        printk("fdt: static shared memory region %s overflow\n", shm_id);
-        return -EINVAL;
-    }
-
     for ( i = 0; i < mem->nr_banks; i++ )
     {
         /*
          * Meet the following check:
-         * 1) The shm ID matches and the region exactly match
-         * 2) The shm ID doesn't match and the region doesn't overlap
-         * with an existing one
+         * - when host address is provided:
+         *   1) The shm ID matches and the region exactly match
+         *   2) The shm ID doesn't match and the region doesn't overlap
+         *      with an existing one
+         * - when host address is not provided:
+         *   1) The shm ID matches and the region size exactly match
          */
-        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
+        bool paddr_assigned = (INVALID_PADDR == paddr);
+
+        if ( strncmp(shm_id, shmem_extra[i].shm_id, MAX_SHM_ID_LENGTH) == 0 )
         {
-            if ( strncmp(shm_id, shmem_extra[i].shm_id,
-                         MAX_SHM_ID_LENGTH) == 0  )
+            /*
+             * Regions have same shm_id (cases):
+             * 1) physical host address is supplied:
+             *    - OK:   paddr is equal and size is equal (same region)
+             *    - Fail: paddr doesn't match or size doesn't match (there
+             *            cannot exists two shmem regions with same shm_id)
+             * 2) physical host address is NOT supplied:
+             *    - OK:   size is equal (same region)
+             *    - Fail: size is not equal (same shm_id must identify only one
+             *            region, there can't be two different regions with same
+             *            shm_id)
+             */
+            bool start_match = paddr_assigned ? (paddr == mem->bank[i].start) :
+                                                true;
+
+            if ( start_match && (size == mem->bank[i].size) )
                 break;
             else
             {
-                printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
+                printk("fdt: different shared memory region could not share the same shm ID %s\n",
                        shm_id);
                 return -EINVAL;
             }
         }
-        else if ( strncmp(shm_id, shmem_extra[i].shm_id,
-                          MAX_SHM_ID_LENGTH) != 0 )
+
+        /*
+         * Regions have different shm_id (cases):
+         * 1) physical host address is supplied:
+         *    - OK:   paddr different, or size different (case where paddr
+         *            is equal but psize is different are wrong, but they
+         *            are handled later when checking for overlapping)
+         *    - Fail: paddr equal and size equal (the same region can't be
+         *            identified with different shm_id)
+         * 2) physical host address is NOT supplied:
+         *    - OK:   Both have different shm_id so even with same size they
+         *            can exists
+         */
+        if ( !paddr_assigned || (paddr != mem->bank[i].start) ||
+             (size != mem->bank[i].size) )
             continue;
         else
         {
-            printk("fdt: different shared memory region could not share the same shm ID %s\n",
+            printk("fdt: xen,shm-id %s does not match for all the nodes using the same region\n",
                    shm_id);
             return -EINVAL;
         }
@@ -513,7 +558,8 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
     {
         if (i < mem->max_banks)
         {
-            if ( check_reserved_regions_overlap(paddr, size) )
+            if ( (paddr != INVALID_PADDR) &&
+                 check_reserved_regions_overlap(paddr, size) )
                 return -EINVAL;
 
             /* Static shared memory shall be reserved from any other use. */
@@ -583,13 +629,13 @@ void __init early_print_info_shmem(void)
 {
     const struct membanks *shmem = bootinfo_get_shmem();
     unsigned int bank;
+    unsigned int printed = 0;
 
-    for ( bank = 0; bank < shmem->nr_banks; bank++ )
-    {
-        printk(" SHMEM[%u]: %"PRIpaddr" - %"PRIpaddr"\n", bank,
-               shmem->bank[bank].start,
-               shmem->bank[bank].start + shmem->bank[bank].size - 1);
-    }
+    for ( bank = 0; bank < shmem->nr_banks; bank++, printed++ )
+        if ( shmem->bank[bank].start != INVALID_PADDR )
+            printk(" SHMEM[%u]: %"PRIpaddr" - %"PRIpaddr"\n", printed,
+                shmem->bank[bank].start,
+                shmem->bank[bank].start + shmem->bank[bank].size - 1);
 }
 
 void __init init_sharedmem_pages(void)
@@ -598,7 +644,8 @@ void __init init_sharedmem_pages(void)
     unsigned int bank;
 
     for ( bank = 0 ; bank < shmem->nr_banks; bank++ )
-        init_staticmem_bank(&shmem->bank[bank]);
+        if ( shmem->bank[bank].start != INVALID_PADDR )
+            init_staticmem_bank(&shmem->bank[bank]);
 }
 
 int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
-- 
2.34.1


