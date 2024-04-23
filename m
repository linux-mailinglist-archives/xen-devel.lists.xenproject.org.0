Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0528ADFB0
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 10:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710384.1109600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBTL-0003W3-KG; Tue, 23 Apr 2024 08:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710384.1109600; Tue, 23 Apr 2024 08:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzBTL-0003Py-GH; Tue, 23 Apr 2024 08:25:51 +0000
Received: by outflank-mailman (input) for mailman id 710384;
 Tue, 23 Apr 2024 08:25:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHxu=L4=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rzBTK-0002TX-35
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 08:25:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1648df22-014b-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 10:25:48 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B67DD339;
 Tue, 23 Apr 2024 01:26:15 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B81B93F64C;
 Tue, 23 Apr 2024 01:25:46 -0700 (PDT)
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
X-Inumbo-ID: 1648df22-014b-11ef-b4bb-af5377834399
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 4/7] xen/arm: Parse xen,shared-mem when host phys address is not provided
Date: Tue, 23 Apr 2024 09:25:29 +0100
Message-Id: <20240423082532.776623-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423082532.776623-1-luca.fancellu@arm.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
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
to check banks from reserved memory and ACPI and it's unlikely for these
bank to have the start address as INVALID_PADDR. The change holds
because of this consideration.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/setup.c        |   3 +-
 xen/arch/arm/static-shmem.c | 129 +++++++++++++++++++++++++-----------
 2 files changed, 93 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index d242674381d4..f15d40a85a5f 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -297,7 +297,8 @@ static bool __init meminfo_overlap_check(const struct membanks *mem,
         bank_start = mem->bank[i].start;
         bank_end = bank_start + mem->bank[i].size;
 
-        if ( region_end <= bank_start || region_start >= bank_end )
+        if ( INVALID_PADDR == bank_start || region_end <= bank_start ||
+             region_start >= bank_end )
             continue;
         else
         {
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 24e40495a481..1c03bb7f1882 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -264,6 +264,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         pbase = boot_shm_bank->start;
         psize = boot_shm_bank->size;
 
+        if ( INVALID_PADDR == pbase )
+        {
+            printk("%pd: host physical address must be chosen by users at the moment.", d);
+            return -EINVAL;
+        }
+
         /*
          * xen,shared-mem = <pbase, gbase, size>;
          * TODO: pbase is optional.
@@ -382,7 +388,8 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
 {
     const struct fdt_property *prop, *prop_id, *prop_role;
     const __be32 *cell;
-    paddr_t paddr, gaddr, size, end;
+    paddr_t paddr = INVALID_PADDR;
+    paddr_t gaddr, size, end;
     struct membanks *mem = bootinfo_get_shmem();
     struct shmem_membank_extra *shmem_extra = bootinfo_get_shmem_extra();
     unsigned int i;
@@ -437,24 +444,37 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
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
@@ -476,41 +496,69 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
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
+         * when host address is provided:
          * 1) The shm ID matches and the region exactly match
          * 2) The shm ID doesn't match and the region doesn't overlap
          * with an existing one
+         * when host address is not provided:
+         * 1) The shm ID matches and the region size exactly match
          */
-        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
+        bool paddr_assigned = INVALID_PADDR == paddr;
+        bool shm_id_match = strncmp(shm_id, shmem_extra[i].shm_id,
+                                    MAX_SHM_ID_LENGTH) == 0;
+        if ( shm_id_match )
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
+            if ( start_match && size == mem->bank[i].size )
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
-            continue;
         else
         {
-            printk("fdt: different shared memory region could not share the same shm ID %s\n",
-                   shm_id);
-            return -EINVAL;
+            /*
+             * Regions have different shm_id (cases):
+             * 1) physical host address is supplied:
+             *    - OK:   paddr different, or size different (case where paddr
+             *            is equal but psize is different are wrong, but they
+             *            are handled later when checking for overlapping)
+             *    - Fail: paddr equal and size equal (the same region can't be
+             *            identified with different shm_id)
+             * 2) physical host address is NOT supplied:
+             *    - OK:   Both have different shm_id so even with same size they
+             *            can exists
+             */
+            if ( !paddr_assigned || paddr != mem->bank[i].start ||
+                 size != mem->bank[i].size )
+                continue;
+            else
+            {
+                printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
+                       shm_id);
+                return -EINVAL;
+            }
         }
     }
 
@@ -518,7 +566,8 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
     {
         if (i < mem->max_banks)
         {
-            if ( check_reserved_regions_overlap(paddr, size) )
+            if ( (paddr != INVALID_PADDR) &&
+                 check_reserved_regions_overlap(paddr, size) )
                 return -EINVAL;
 
             /* Static shared memory shall be reserved from any other use. */
@@ -588,13 +637,16 @@ void __init early_print_info_shmem(void)
 {
     const struct membanks *shmem = bootinfo_get_shmem();
     unsigned int bank;
+    unsigned int printed = 0;
 
     for ( bank = 0; bank < shmem->nr_banks; bank++ )
-    {
-        printk(" SHMEM[%u]: %"PRIpaddr" - %"PRIpaddr"\n", bank,
-               shmem->bank[bank].start,
-               shmem->bank[bank].start + shmem->bank[bank].size - 1);
-    }
+        if ( shmem->bank[bank].start != INVALID_PADDR )
+        {
+            printk(" SHMEM[%u]: %"PRIpaddr" - %"PRIpaddr"\n", printed,
+                shmem->bank[bank].start,
+                shmem->bank[bank].start + shmem->bank[bank].size - 1);
+            printed++;
+        }
 }
 
 void __init init_sharedmem_pages(void)
@@ -603,7 +655,8 @@ void __init init_sharedmem_pages(void)
     unsigned int bank;
 
     for ( bank = 0 ; bank < shmem->nr_banks; bank++ )
-        init_staticmem_bank(&shmem->bank[bank]);
+        if ( shmem->bank[bank].start != INVALID_PADDR )
+            init_staticmem_bank(&shmem->bank[bank]);
 }
 
 int __init remove_shm_from_rangeset(const struct kernel_info *kinfo,
-- 
2.34.1


