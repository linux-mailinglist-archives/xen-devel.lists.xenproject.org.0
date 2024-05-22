Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AE78CBC5B
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 09:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727268.1131739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9gle-0006s8-14; Wed, 22 May 2024 07:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727268.1131739; Wed, 22 May 2024 07:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9gld-0006lk-SA; Wed, 22 May 2024 07:52:09 +0000
Received: by outflank-mailman (input) for mailman id 727268;
 Wed, 22 May 2024 07:52:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfTZ=MZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1s9glc-0005YY-No
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 07:52:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2fe6d436-1810-11ef-90a0-e314d9c70b13;
 Wed, 22 May 2024 09:52:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A861150C;
 Wed, 22 May 2024 00:52:31 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A431B3F766;
 Wed, 22 May 2024 00:52:06 -0700 (PDT)
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
X-Inumbo-ID: 2fe6d436-1810-11ef-90a0-e314d9c70b13
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 6/7] xen/arm: Implement the logic for static shared memory from Xen heap
Date: Wed, 22 May 2024 08:51:50 +0100
Message-Id: <20240522075151.3373899-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522075151.3373899-1-luca.fancellu@arm.com>
References: <20240522075151.3373899-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit implements the logic to have the static shared memory banks
from the Xen heap instead of having the host physical address passed from
the user.

When the host physical address is not supplied, the physical memory is
taken from the Xen heap using allocate_domheap_memory, the allocation
needs to occur at the first handled DT node and the allocated banks
need to be saved somewhere.

Introduce the 'shm_heap_banks' for that reason, a struct that will hold
the banks allocated from the heap, its field bank[].shmem_extra will be
used to point to the bootinfo shared memory banks .shmem_extra space, so
that there is not further allocation of memory and every bank in
shm_heap_banks can be safely identified by the shm_id to reconstruct its
traceability and if it was allocated or not.

A search into 'shm_heap_banks' will reveal if the banks were allocated
or not, in case the host address is not passed, and the callback given
to allocate_domheap_memory will store the banks in the structure and
map them to the current domain, to do that, some changes to
acquire_shared_memory_bank are made to let it differentiate if the bank
is from the heap and if it is, then assign_pages is called for every
bank.

When the bank is already allocated, for every bank allocated with the
corresponding shm_id, handle_shared_mem_bank is called and the mapping
are done.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v3 changes:
 - reworded commit msg section, swap role_str and gbase in
   alloc_heap_pages_cb_extra to avoid padding hole in arm32, remove
   not needed printk, modify printk to print KB instead of MB, swap
   strncmp for strcmp, reduced memory footprint for shm_heap_banks.
   (Michal)
v2 changes:
 - add static inline get_shmem_heap_banks(), given the changes to the
   struct membanks interface. Rebase changes due to removal of
   owner_dom_io arg from handle_shared_mem_bank.
   Change save_map_heap_pages return type given the changes to the
   allocate_domheap_memory callback type.
---
 xen/arch/arm/static-shmem.c | 187 ++++++++++++++++++++++++++++++------
 1 file changed, 155 insertions(+), 32 deletions(-)

diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 74c81904b8a4..53e8d3ecf030 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -9,6 +9,25 @@
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
+typedef struct {
+    struct domain *d;
+    const char *role_str;
+    paddr_t gbase;
+    struct shmem_membank_extra *bank_extra_info;
+} alloc_heap_pages_cb_extra;
+
+static struct {
+    struct membanks_hdr common;
+    struct membank bank[NR_SHMEM_BANKS];
+} shm_heap_banks __initdata = {
+    .common.max_banks = NR_SHMEM_BANKS
+};
+
+static inline struct membanks *get_shmem_heap_banks(void)
+{
+    return container_of(&shm_heap_banks.common, struct membanks, common);
+}
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
@@ -63,7 +82,8 @@ static bool __init is_shm_allocated_to_domio(paddr_t pbase)
 }
 
 static mfn_t __init acquire_shared_memory_bank(struct domain *d,
-                                               paddr_t pbase, paddr_t psize)
+                                               paddr_t pbase, paddr_t psize,
+                                               bool bank_from_heap)
 {
     mfn_t smfn;
     unsigned long nr_pfns;
@@ -83,19 +103,31 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
     d->max_pages += nr_pfns;
 
     smfn = maddr_to_mfn(pbase);
-    res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
+    if ( bank_from_heap )
+        /*
+         * When host address is not provided, static shared memory is
+         * allocated from heap and shall be assigned to owner domain.
+         */
+        res = assign_pages(maddr_to_page(pbase), nr_pfns, d, 0);
+    else
+        res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
+
     if ( res )
     {
-        printk(XENLOG_ERR
-               "%pd: failed to acquire static memory: %d.\n", d, res);
-        d->max_pages -= nr_pfns;
-        return INVALID_MFN;
+        printk(XENLOG_ERR "%pd: failed to %s static memory: %d.\n", d,
+               bank_from_heap ? "assign" : "acquire", res);
+        goto fail;
     }
 
     return smfn;
+
+ fail:
+    d->max_pages -= nr_pfns;
+    return INVALID_MFN;
 }
 
 static int __init assign_shared_memory(struct domain *d, paddr_t gbase,
+                                       bool bank_from_heap,
                                        const struct membank *shm_bank)
 {
     mfn_t smfn;
@@ -108,10 +140,7 @@ static int __init assign_shared_memory(struct domain *d, paddr_t gbase,
     psize = shm_bank->size;
     nr_borrowers = shm_bank->shmem_extra->nr_shm_borrowers;
 
-    printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
-           d, pbase, pbase + psize);
-
-    smfn = acquire_shared_memory_bank(d, pbase, psize);
+    smfn = acquire_shared_memory_bank(d, pbase, psize, bank_from_heap);
     if ( mfn_eq(smfn, INVALID_MFN) )
         return -EINVAL;
 
@@ -182,6 +211,7 @@ append_shm_bank_to_domain(struct kernel_info *kinfo, paddr_t start,
 
 static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
                                          const char *role_str,
+                                         bool bank_from_heap,
                                          const struct membank *shm_bank)
 {
     bool owner_dom_io = true;
@@ -210,7 +240,8 @@ static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
          * We found the first borrower of the region, the owner was not
          * specified, so they should be assigned to dom_io.
          */
-        ret = assign_shared_memory(owner_dom_io ? dom_io : d, gbase, shm_bank);
+        ret = assign_shared_memory(owner_dom_io ? dom_io : d, gbase,
+                                   bank_from_heap, shm_bank);
         if ( ret )
             return ret;
     }
@@ -227,6 +258,39 @@ static int __init handle_shared_mem_bank(struct domain *d, paddr_t gbase,
     return 0;
 }
 
+static bool __init save_map_heap_pages(struct domain *d, struct page_info *pg,
+                                       unsigned int order, void *extra)
+{
+    alloc_heap_pages_cb_extra *b_extra = (alloc_heap_pages_cb_extra *)extra;
+    int idx = shm_heap_banks.common.nr_banks;
+    int ret = -ENOSPC;
+
+    BUG_ON(!b_extra);
+
+    if ( idx < shm_heap_banks.common.max_banks )
+    {
+        shm_heap_banks.bank[idx].start = page_to_maddr(pg);
+        shm_heap_banks.bank[idx].size = (1ULL << (PAGE_SHIFT + order));
+        shm_heap_banks.bank[idx].shmem_extra = b_extra->bank_extra_info;
+        shm_heap_banks.common.nr_banks++;
+
+        ret = handle_shared_mem_bank(b_extra->d, b_extra->gbase,
+                                     b_extra->role_str, true,
+                                     &shm_heap_banks.bank[idx]);
+        if ( !ret )
+        {
+            /* Increment guest physical address for next mapping */
+            b_extra->gbase += shm_heap_banks.bank[idx].size;
+            return true;
+        }
+    }
+
+    printk("Failed to allocate static shared memory from Xen heap: (%d)\n",
+           ret);
+
+    return false;
+}
+
 int __init process_shm(struct domain *d, struct kernel_info *kinfo,
                        const struct dt_device_node *node)
 {
@@ -264,38 +328,97 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         pbase = boot_shm_bank->start;
         psize = boot_shm_bank->size;
 
-        if ( INVALID_PADDR == pbase )
-        {
-            printk("%pd: host physical address must be chosen by users at the moment", d);
-            return -EINVAL;
-        }
+        /* "role" property is optional */
+        if ( dt_property_read_string(shm_node, "role", &role_str) != 0 )
+            role_str = NULL;
 
         /*
-         * xen,shared-mem = <pbase, gbase, size>;
-         * TODO: pbase is optional.
+         * xen,shared-mem = <[pbase,] gbase, size>;
+         * pbase is optional.
          */
         addr_cells = dt_n_addr_cells(shm_node);
         size_cells = dt_n_size_cells(shm_node);
         prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
         BUG_ON(!prop);
         cells = (const __be32 *)prop->value;
-        gbase = dt_read_paddr(cells + addr_cells, addr_cells);
 
-        for ( i = 0; i < PFN_DOWN(psize); i++ )
-            if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
-            {
-                printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
-                       d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
-                return -EINVAL;
-            }
+        if ( pbase != INVALID_PADDR )
+        {
+            /* guest phys address is after host phys address */
+            gbase = dt_read_paddr(cells + addr_cells, addr_cells);
+
+            for ( i = 0; i < PFN_DOWN(psize); i++ )
+                if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
+                {
+                    printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
+                        d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
+                    return -EINVAL;
+                }
+
+            /* The host physical address is supplied by the user */
+            ret = handle_shared_mem_bank(d, gbase, role_str, false,
+                                         boot_shm_bank);
+            if ( ret )
+                return ret;
+        }
+        else
+        {
+            /*
+             * The host physical address is not supplied by the user, so it
+             * means that the banks needs to be allocated from the Xen heap,
+             * look into the already allocated banks from the heap.
+             */
+            const struct membank *alloc_bank =
+                find_shm_bank_by_id(get_shmem_heap_banks(), shm_id);
 
-        /* "role" property is optional */
-        if ( dt_property_read_string(shm_node, "role", &role_str) != 0 )
-            role_str = NULL;
+            /* guest phys address is right at the beginning */
+            gbase = dt_read_paddr(cells, addr_cells);
 
-        ret = handle_shared_mem_bank(d, gbase, role_str, boot_shm_bank);
-        if ( ret )
-            return ret;
+            if ( !alloc_bank )
+            {
+                alloc_heap_pages_cb_extra cb_arg = { d, role_str, gbase,
+                    boot_shm_bank->shmem_extra };
+
+                /* shm_id identified bank is not yet allocated */
+                if ( !allocate_domheap_memory(NULL, psize, save_map_heap_pages,
+                                              &cb_arg) )
+                {
+                    printk(XENLOG_ERR
+                           "Failed to allocate (%"PRIpaddr"KB) pages as static shared memory from heap\n",
+                           psize >> 10);
+                    return -EINVAL;
+                }
+            }
+            else
+            {
+                /* shm_id identified bank is already allocated */
+                const struct membank *end_bank =
+                        &shm_heap_banks.bank[shm_heap_banks.common.nr_banks];
+                paddr_t gbase_bank = gbase;
+
+                /*
+                 * Static shared memory banks that are taken from the Xen heap
+                 * are allocated sequentially in shm_heap_banks, so starting
+                 * from the first bank found identified by shm_id, the code can
+                 * just advance by one bank at the time until it reaches the end
+                 * of the array or it finds another bank NOT identified by
+                 * shm_id
+                 */
+                for ( ; alloc_bank < end_bank; alloc_bank++ )
+                {
+                    if ( strcmp(shm_id, alloc_bank->shmem_extra->shm_id) != 0 )
+                        break;
+
+                    ret = handle_shared_mem_bank(d, gbase_bank, role_str, true,
+                                                 alloc_bank);
+                    if ( ret )
+                        return ret;
+
+                    /* Increment guest physical address for next mapping */
+                    gbase_bank += alloc_bank->size;
+                }
+            }
+        }
 
         /*
          * Record static shared memory region info for later setting
-- 
2.34.1


