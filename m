Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2258CBC5A
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 09:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727263.1131692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9glZ-0005ft-AC; Wed, 22 May 2024 07:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727263.1131692; Wed, 22 May 2024 07:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9glZ-0005cP-4x; Wed, 22 May 2024 07:52:05 +0000
Received: by outflank-mailman (input) for mailman id 727263;
 Wed, 22 May 2024 07:52:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfTZ=MZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1s9glX-0005YY-M3
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 07:52:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2c9faaab-1810-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 09:52:02 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF224DA7;
 Wed, 22 May 2024 00:52:25 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8DDB3F766;
 Wed, 22 May 2024 00:52:00 -0700 (PDT)
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
X-Inumbo-ID: 2c9faaab-1810-11ef-90a0-e314d9c70b13
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 1/7] xen/arm: Lookup bootinfo shm bank during the mapping
Date: Wed, 22 May 2024 08:51:45 +0100
Message-Id: <20240522075151.3373899-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522075151.3373899-1-luca.fancellu@arm.com>
References: <20240522075151.3373899-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current static shared memory code is using bootinfo banks when it
needs to find the number of borrowers, so every time assign_shared_memory
is called, the bank is searched in the bootinfo.shmem structure.

There is nothing wrong with it, however the bank can be used also to
retrieve the start address and size and also to pass less argument to
assign_shared_memory. When retrieving the information from the bootinfo
bank, it's also possible to move the checks on alignment to
process_shm_node in the early stages.

So create a new function find_shm_bank_by_id() which takes a
'struct shared_meminfo' structure and the shared memory ID, to look for a
bank with a matching ID, take the physical host address and size from the
bank, pass the bank to assign_shared_memory() removing the now unnecessary
arguments and finally remove the acquire_nr_borrower_domain() function
since now the information can be extracted from the passed bank.
Move the "xen,shm-id" parsing early in process_shm to bail out quickly in
case of errors (unlikely), as said above, move the checks on alignment
to process_shm_node.

Drawback of this change is that now the bootinfo are used also when the
bank doesn't need to be allocated, however it will be convenient later
to use it as an argument for assign_shared_memory when dealing with
the use case where the Host physical address is not supplied by the user.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v3 changes:
 - switch strncmp with strcmp in find_shm_bank_by_id, fix commit msg typo,
   add R-by Michal.
v2 changes:
 - fix typo commit msg, renamed find_shm() to find_shm_bank_by_id(),
   swap region size check different from zero and size alignment, remove
   not necessary BUGON(). (Michal)
---
 xen/arch/arm/static-shmem.c | 100 +++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 47 deletions(-)

diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 78881dd1d3f7..0a1c327e90ea 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -19,29 +19,21 @@ static void __init __maybe_unused build_assertions(void)
                  offsetof(struct shared_meminfo, bank)));
 }
 
-static int __init acquire_nr_borrower_domain(struct domain *d,
-                                             paddr_t pbase, paddr_t psize,
-                                             unsigned long *nr_borrowers)
+static const struct membank __init *
+find_shm_bank_by_id(const struct membanks *shmem, const char *shm_id)
 {
-    const struct membanks *shmem = bootinfo_get_shmem();
     unsigned int bank;
 
-    /* Iterate reserved memory to find requested shm bank. */
     for ( bank = 0 ; bank < shmem->nr_banks; bank++ )
     {
-        paddr_t bank_start = shmem->bank[bank].start;
-        paddr_t bank_size = shmem->bank[bank].size;
-
-        if ( (pbase == bank_start) && (psize == bank_size) )
+        if ( strcmp(shm_id, shmem->bank[bank].shmem_extra->shm_id) == 0 )
             break;
     }
 
     if ( bank == shmem->nr_banks )
-        return -ENOENT;
+        return NULL;
 
-    *nr_borrowers = shmem->bank[bank].shmem_extra->nr_shm_borrowers;
-
-    return 0;
+    return &shmem->bank[bank];
 }
 
 /*
@@ -103,14 +95,18 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
     return smfn;
 }
 
-static int __init assign_shared_memory(struct domain *d,
-                                       paddr_t pbase, paddr_t psize,
-                                       paddr_t gbase)
+static int __init assign_shared_memory(struct domain *d, paddr_t gbase,
+                                       const struct membank *shm_bank)
 {
     mfn_t smfn;
     int ret = 0;
     unsigned long nr_pages, nr_borrowers, i;
     struct page_info *page;
+    paddr_t pbase, psize;
+
+    pbase = shm_bank->start;
+    psize = shm_bank->size;
+    nr_borrowers = shm_bank->shmem_extra->nr_shm_borrowers;
 
     printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
            d, pbase, pbase + psize);
@@ -135,14 +131,6 @@ static int __init assign_shared_memory(struct domain *d,
         }
     }
 
-    /*
-     * Get the right amount of references per page, which is the number of
-     * borrower domains.
-     */
-    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
-    if ( ret )
-        return ret;
-
     /*
      * Instead of letting borrower domain get a page ref, we add as many
      * additional reference as the number of borrowers when the owner
@@ -199,6 +187,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
 
     dt_for_each_child_node(node, shm_node)
     {
+        const struct membank *boot_shm_bank;
         const struct dt_property *prop;
         const __be32 *cells;
         uint32_t addr_cells, size_cells;
@@ -212,6 +201,23 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
             continue;
 
+        if ( dt_property_read_string(shm_node, "xen,shm-id", &shm_id) )
+        {
+            printk("%pd: invalid \"xen,shm-id\" property", d);
+            return -EINVAL;
+        }
+        BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
+
+        boot_shm_bank = find_shm_bank_by_id(bootinfo_get_shmem(), shm_id);
+        if ( !boot_shm_bank )
+        {
+            printk("%pd: static shared memory bank not found: '%s'", d, shm_id);
+            return -ENOENT;
+        }
+
+        pbase = boot_shm_bank->start;
+        psize = boot_shm_bank->size;
+
         /*
          * xen,shared-mem = <pbase, gbase, size>;
          * TODO: pbase is optional.
@@ -221,20 +227,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
         BUG_ON(!prop);
         cells = (const __be32 *)prop->value;
-        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
-        psize = dt_read_paddr(cells, size_cells);
-        if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
-        {
-            printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
-                   d, pbase, gbase);
-            return -EINVAL;
-        }
-        if ( !IS_ALIGNED(psize, PAGE_SIZE) )
-        {
-            printk("%pd: size 0x%"PRIpaddr" is not suitably aligned\n",
-                   d, psize);
-            return -EINVAL;
-        }
+        gbase = dt_read_paddr(cells + addr_cells, addr_cells);
 
         for ( i = 0; i < PFN_DOWN(psize); i++ )
             if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
@@ -251,13 +244,6 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
             owner_dom_io = false;
 
-        if ( dt_property_read_string(shm_node, "xen,shm-id", &shm_id) )
-        {
-            printk("%pd: invalid \"xen,shm-id\" property", d);
-            return -EINVAL;
-        }
-        BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
-
         /*
          * DOMID_IO is a fake domain and is not described in the Device-Tree.
          * Therefore when the owner of the shared region is DOMID_IO, we will
@@ -270,8 +256,8 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
              * We found the first borrower of the region, the owner was not
              * specified, so they should be assigned to dom_io.
              */
-            ret = assign_shared_memory(owner_dom_io ? dom_io : d,
-                                       pbase, psize, gbase);
+            ret = assign_shared_memory(owner_dom_io ? dom_io : d, gbase,
+                                       boot_shm_bank);
             if ( ret )
                 return ret;
         }
@@ -439,12 +425,32 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
     device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
     size = dt_next_cell(size_cells, &cell);
 
+    if ( !IS_ALIGNED(paddr, PAGE_SIZE) )
+    {
+        printk("fdt: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
+               paddr);
+        return -EINVAL;
+    }
+
+    if ( !IS_ALIGNED(gaddr, PAGE_SIZE) )
+    {
+        printk("fdt: guest address 0x%"PRIpaddr" is not suitably aligned.\n",
+               gaddr);
+        return -EINVAL;
+    }
+
     if ( !size )
     {
         printk("fdt: the size for static shared memory region can not be zero\n");
         return -EINVAL;
     }
 
+    if ( !IS_ALIGNED(size, PAGE_SIZE) )
+    {
+        printk("fdt: size 0x%"PRIpaddr" is not suitably aligned\n", size);
+        return -EINVAL;
+    }
+
     end = paddr + size;
     if ( end <= paddr )
     {
-- 
2.34.1


