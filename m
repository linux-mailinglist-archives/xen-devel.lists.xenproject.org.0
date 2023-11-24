Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC5C7F7069
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 10:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640334.998361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Sny-0000TY-M0; Fri, 24 Nov 2023 09:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640334.998361; Fri, 24 Nov 2023 09:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Sny-0000N3-H1; Fri, 24 Nov 2023 09:48:58 +0000
Received: by outflank-mailman (input) for mailman id 640334;
 Fri, 24 Nov 2023 09:48:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vqky=HF=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1r6Snw-0007mP-8G
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 09:48:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ada343af-8aae-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 10:48:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B10FD1063
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 01:49:39 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB8C43F7A6
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 01:48:52 -0800 (PST)
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
X-Inumbo-ID: ada343af-8aae-11ee-98e2-6d05b1d4d9a1
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 4/5] xen/arm: Move static memory build code in separate modules
Date: Fri, 24 Nov 2023 09:48:40 +0000
Message-Id: <20231124094841.1475381-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124094841.1475381-1-luca.fancellu@arm.com>
References: <20231124094841.1475381-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move static memory and static shared memory code in separate modules
so that they are included only when the corresponding feature is
enabled, doing that we modularise the features and we remove some
ifdefs from the code to improve readability.

Move process_shm_node function from bootfdt module and make it
externally visible.

A static inline helper called process_shm_chosen is introduced, it
will call the process_shm function for the '/chosen' node, and will
be used by the function construct_dom0 instead of using directly
process_shm, allowing some #ifdef to be removed.

No functional changes are intended.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from v5:
 - removed init_staticmem_pages prototype from setup.h, add
   static-memory.h include in arm{32,64}/mmu/mm.c, dropped
   Michal R-by given the changes
Changes from v4:
 - Removed header from static-*.{c,h} files, fixed style issue,
   renamed inclusion define __ARM_* to __ASM_*, fixed emacs
   local variables. (Michal)
Changes from v3:
 - Moved make_resv_memory_node from domain_build to static-shmem,
   make make_shm_memory_node static.
Changes from v2:
 - no changes
---
 xen/arch/arm/Makefile                    |   2 +
 xen/arch/arm/arm32/mmu/mm.c              |   1 +
 xen/arch/arm/arm64/mmu/mm.c              |   1 +
 xen/arch/arm/bootfdt.c                   | 161 +-----
 xen/arch/arm/dom0less-build.c            |   4 +-
 xen/arch/arm/domain_build.c              | 654 +----------------------
 xen/arch/arm/include/asm/domain_build.h  |  26 -
 xen/arch/arm/include/asm/setup.h         |   1 -
 xen/arch/arm/include/asm/static-memory.h |  45 ++
 xen/arch/arm/include/asm/static-shmem.h  |  66 +++
 xen/arch/arm/setup.c                     |  24 -
 xen/arch/arm/static-memory.c             | 287 ++++++++++
 xen/arch/arm/static-shmem.c              | 547 +++++++++++++++++++
 13 files changed, 954 insertions(+), 865 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/static-memory.h
 create mode 100644 xen/arch/arm/include/asm/static-shmem.h
 create mode 100644 xen/arch/arm/static-memory.c
 create mode 100644 xen/arch/arm/static-shmem.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index d65920b0a8cf..2fcc3c2535fd 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -51,6 +51,8 @@ obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
 obj-y += smpboot.o
+obj-$(CONFIG_STATIC_MEMORY) += static-memory.init.o
+obj-$(CONFIG_STATIC_SHM) += static-shmem.init.o
 obj-y += sysctl.o
 obj-y += time.o
 obj-y += traps.o
diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index 94d6cab49cc9..cb441ca87c0d 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -6,6 +6,7 @@
 #include <xen/param.h>
 #include <xen/pfn.h>
 #include <asm/fixmap.h>
+#include <asm/static-memory.h>
 
 static unsigned long opt_xenheap_megabytes __initdata;
 integer_param("xenheap_megabytes", opt_xenheap_megabytes);
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index e05d54c850ac..d2651c948698 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -5,6 +5,7 @@
 #include <xen/pfn.h>
 
 #include <asm/setup.h>
+#include <asm/static-memory.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index d73f8e497193..b1f03eb2fcdd 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -15,6 +15,7 @@
 #include <xen/sort.h>
 #include <xsm/xsm.h>
 #include <asm/setup.h>
+#include <asm/static-shmem.h>
 
 static bool __init device_tree_node_is_available(const void *fdt, int node)
 {
@@ -423,166 +424,6 @@ static int __init process_domain_node(const void *fdt, int node,
                                    MEMBANK_STATIC_DOMAIN);
 }
 
-#ifdef CONFIG_STATIC_SHM
-static int __init process_shm_node(const void *fdt, int node,
-                                   uint32_t address_cells, uint32_t size_cells)
-{
-    const struct fdt_property *prop, *prop_id, *prop_role;
-    const __be32 *cell;
-    paddr_t paddr, gaddr, size;
-    struct meminfo *mem = &bootinfo.reserved_mem;
-    unsigned int i;
-    int len;
-    bool owner = false;
-    const char *shm_id;
-
-    if ( address_cells < 1 || size_cells < 1 )
-    {
-        printk("fdt: invalid #address-cells or #size-cells for static shared memory node.\n");
-        return -EINVAL;
-    }
-
-    /*
-     * "xen,shm-id" property holds an arbitrary string with a strict limit
-     * on the number of characters, MAX_SHM_ID_LENGTH
-     */
-    prop_id = fdt_get_property(fdt, node, "xen,shm-id", NULL);
-    if ( !prop_id )
-        return -ENOENT;
-    shm_id = (const char *)prop_id->data;
-    if ( strnlen(shm_id, MAX_SHM_ID_LENGTH) == MAX_SHM_ID_LENGTH )
-    {
-        printk("fdt: invalid xen,shm-id %s, it must be limited to %u characters\n",
-               shm_id, MAX_SHM_ID_LENGTH);
-        return -EINVAL;
-    }
-
-    /*
-     * "role" property is optional and if it is defined explicitly,
-     * it must be either `owner` or `borrower`.
-     */
-    prop_role = fdt_get_property(fdt, node, "role", NULL);
-    if ( prop_role )
-    {
-        if ( !strcmp(prop_role->data, "owner") )
-            owner = true;
-        else if ( strcmp(prop_role->data, "borrower") )
-        {
-            printk("fdt: invalid `role` property for static shared memory node.\n");
-            return -EINVAL;
-        }
-    }
-
-    /*
-     * xen,shared-mem = <paddr, gaddr, size>;
-     * Memory region starting from physical address #paddr of #size shall
-     * be mapped to guest physical address #gaddr as static shared memory
-     * region.
-     */
-    prop = fdt_get_property(fdt, node, "xen,shared-mem", &len);
-    if ( !prop )
-        return -ENOENT;
-
-    if ( len != dt_cells_to_size(address_cells + size_cells + address_cells) )
-    {
-        if ( len == dt_cells_to_size(size_cells + address_cells) )
-            printk("fdt: host physical address must be chosen by users at the moment.\n");
-
-        printk("fdt: invalid `xen,shared-mem` property.\n");
-        return -EINVAL;
-    }
-
-    cell = (const __be32 *)prop->data;
-    device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
-    size = dt_next_cell(size_cells, &cell);
-
-    if ( !size )
-    {
-        printk("fdt: the size for static shared memory region can not be zero\n");
-        return -EINVAL;
-    }
-
-    for ( i = 0; i < mem->nr_banks; i++ )
-    {
-        /*
-         * Meet the following check:
-         * 1) The shm ID matches and the region exactly match
-         * 2) The shm ID doesn't match and the region doesn't overlap
-         * with an existing one
-         */
-        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
-        {
-            if ( strncmp(shm_id, mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) == 0 )
-                break;
-            else
-            {
-                printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
-                       shm_id);
-                return -EINVAL;
-            }
-        }
-        else
-        {
-            paddr_t end = paddr + size;
-            paddr_t bank_end = mem->bank[i].start + mem->bank[i].size;
-
-            if ( (end <= paddr) || (bank_end <= mem->bank[i].start) )
-            {
-                printk("fdt: static shared memory region %s overflow\n", shm_id);
-                return -EINVAL;
-            }
-
-            if ( check_reserved_regions_overlap(paddr, size) )
-                return -EINVAL;
-            else
-            {
-                if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
-                    continue;
-                else
-                {
-                    printk("fdt: different shared memory region could not share the same shm ID %s\n",
-                           shm_id);
-                    return -EINVAL;
-                }
-            }
-        }
-    }
-
-    if ( i == mem->nr_banks )
-    {
-        if ( i < NR_MEM_BANKS )
-        {
-            /* Static shared memory shall be reserved from any other use. */
-            safe_strcpy(mem->bank[mem->nr_banks].shm_id, shm_id);
-            mem->bank[mem->nr_banks].start = paddr;
-            mem->bank[mem->nr_banks].size = size;
-            mem->bank[mem->nr_banks].type = MEMBANK_STATIC_DOMAIN;
-            mem->nr_banks++;
-        }
-        else
-        {
-            printk("Warning: Max number of supported memory regions reached.\n");
-            return -ENOSPC;
-        }
-    }
-    /*
-     * keep a count of the number of borrowers, which later may be used
-     * to calculate the reference count.
-     */
-    if ( !owner )
-        mem->bank[i].nr_shm_borrowers++;
-
-    return 0;
-}
-#else
-static int __init process_shm_node(const void *fdt, int node,
-                                   uint32_t address_cells, uint32_t size_cells)
-{
-    printk("CONFIG_STATIC_SHM must be enabled for parsing static shared memory nodes\n");
-    return -EINVAL;
-}
-#endif
-
 static int __init early_scan_node(const void *fdt,
                                   int node, const char *name, int depth,
                                   u32 address_cells, u32 size_cells,
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 1ca9d39043d6..d39cbd969aca 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -13,6 +13,8 @@
 #include <asm/arm64/sve.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
+#include <asm/static-memory.h>
+#include <asm/static-shmem.h>
 
 bool __init is_dom0less_mode(void)
 {
@@ -806,11 +808,9 @@ static int __init construct_domU(struct domain *d,
     else
         assign_static_memory_11(d, &kinfo, node);
 
-#ifdef CONFIG_STATIC_SHM
     rc = process_shm(d, &kinfo, node);
     if ( rc < 0 )
         return rc;
-#endif
 
     /*
      * Base address and irq number are needed when creating vpl011 device
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 90dba16e42c9..7eb766da9c63 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -31,6 +31,7 @@
 #include <asm/cpufeature.h>
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
+#include <asm/static-shmem.h>
 #include <xen/event.h>
 
 #include <xen/irq.h>
@@ -477,533 +478,6 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
     return true;
 }
 
-#ifdef CONFIG_STATIC_MEMORY
-static bool __init append_static_memory_to_bank(struct domain *d,
-                                                struct membank *bank,
-                                                mfn_t smfn,
-                                                paddr_t size)
-{
-    int res;
-    unsigned int nr_pages = PFN_DOWN(size);
-    gfn_t sgfn;
-
-    /*
-     * For direct-mapped domain, the GFN match the MFN.
-     * Otherwise, this is inferred on what has already been allocated
-     * in the bank.
-     */
-    if ( !is_domain_direct_mapped(d) )
-        sgfn = gaddr_to_gfn(bank->start + bank->size);
-    else
-        sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
-
-    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
-    if ( res )
-    {
-        dprintk(XENLOG_ERR, "Failed to map pages to DOMU: %d", res);
-        return false;
-    }
-
-    bank->size = bank->size + size;
-
-    return true;
-}
-
-static mfn_t __init acquire_static_memory_bank(struct domain *d,
-                                               const __be32 **cell,
-                                               u32 addr_cells, u32 size_cells,
-                                               paddr_t *pbase, paddr_t *psize)
-{
-    mfn_t smfn;
-    int res;
-
-    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
-    ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
-    if ( PFN_DOWN(*psize) > UINT_MAX )
-    {
-        printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
-               d, *psize);
-        return INVALID_MFN;
-    }
-
-    smfn = maddr_to_mfn(*pbase);
-    res = acquire_domstatic_pages(d, smfn, PFN_DOWN(*psize), 0);
-    if ( res )
-    {
-        printk(XENLOG_ERR
-               "%pd: failed to acquire static memory: %d.\n", d, res);
-        return INVALID_MFN;
-    }
-
-    return smfn;
-}
-
-static int __init parse_static_mem_prop(const struct dt_device_node *node,
-                                        u32 *addr_cells, u32 *size_cells,
-                                        int *length, const __be32 **cell)
-{
-    const struct dt_property *prop;
-
-    prop = dt_find_property(node, "xen,static-mem", NULL);
-
-    *addr_cells = dt_n_addr_cells(node);
-    *size_cells = dt_n_size_cells(node);
-
-    *cell = (const __be32 *)prop->value;
-    *length = prop->length;
-
-    return 0;
-}
-
-/* Allocate memory from static memory as RAM for one specific domain d. */
-void __init allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
-                                   const struct dt_device_node *node)
-{
-    u32 addr_cells, size_cells, reg_cells;
-    unsigned int nr_banks, gbank, bank = 0;
-    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
-    const uint64_t ramsize[] = GUEST_RAM_BANK_SIZES;
-    const __be32 *cell;
-    u64 tot_size = 0;
-    paddr_t pbase, psize, gsize;
-    mfn_t smfn;
-    int length;
-
-    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
-        goto fail;
-    reg_cells = addr_cells + size_cells;
-
-    /*
-     * The static memory will be mapped in the guest at the usual guest memory
-     * addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
-     * xen/include/public/arch-arm.h.
-     */
-    gbank = 0;
-    gsize = ramsize[gbank];
-    kinfo->mem.bank[gbank].start = rambase[gbank];
-    nr_banks = length / (reg_cells * sizeof (u32));
-
-    for ( ; bank < nr_banks; bank++ )
-    {
-        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
-                                          &pbase, &psize);
-        if ( mfn_eq(smfn, INVALID_MFN) )
-            goto fail;
-
-        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
-               d, bank, pbase, pbase + psize);
-
-        while ( 1 )
-        {
-            /* Map as much as possible the static range to the guest bank */
-            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank], smfn,
-                                               min(psize, gsize)) )
-                goto fail;
-
-            /*
-             * The current physical bank is fully mapped.
-             * Handle the next physical bank.
-             */
-            if ( gsize >= psize )
-            {
-                gsize = gsize - psize;
-                break;
-            }
-            /*
-             * When current guest bank is not enough to map, exhaust
-             * the current one and seek to the next.
-             * Before seeking to the next, check if we still have available
-             * guest bank.
-             */
-            else if ( (gbank + 1) >= GUEST_RAM_BANKS )
-            {
-                printk(XENLOG_ERR "Exhausted all possible guest banks.\n");
-                goto fail;
-            }
-            else
-            {
-                psize = psize - gsize;
-                smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
-                /* Update to the next guest bank. */
-                gbank++;
-                gsize = ramsize[gbank];
-                kinfo->mem.bank[gbank].start = rambase[gbank];
-            }
-        }
-
-        tot_size += psize;
-    }
-
-    kinfo->mem.nr_banks = ++gbank;
-
-    kinfo->unassigned_mem -= tot_size;
-    /*
-     * The property 'memory' should match the amount of memory given to the
-     * guest.
-     * Currently, it is only possible to either acquire static memory or let
-     * Xen allocate. *Mixing* is not supported.
-     */
-    if ( kinfo->unassigned_mem )
-    {
-        printk(XENLOG_ERR
-               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\". Unsupported configuration.\n");
-        goto fail;
-    }
-
-    return;
-
- fail:
-    panic("Failed to allocate requested static memory for domain %pd.\n", d);
-}
-
-/*
- * Allocate static memory as RAM for one specific domain d.
- * The static memory will be directly mapped in the guest(Guest Physical
- * Address == Physical Address).
- */
-void __init assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
-                                    const struct dt_device_node *node)
-{
-    u32 addr_cells, size_cells, reg_cells;
-    unsigned int nr_banks, bank = 0;
-    const __be32 *cell;
-    paddr_t pbase, psize;
-    mfn_t smfn;
-    int length;
-
-    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
-    {
-        printk(XENLOG_ERR
-               "%pd: failed to parse \"xen,static-mem\" property.\n", d);
-        goto fail;
-    }
-    reg_cells = addr_cells + size_cells;
-    nr_banks = length / (reg_cells * sizeof(u32));
-
-    if ( nr_banks > NR_MEM_BANKS )
-    {
-        printk(XENLOG_ERR
-               "%pd: exceed max number of supported guest memory banks.\n", d);
-        goto fail;
-    }
-
-    for ( ; bank < nr_banks; bank++ )
-    {
-        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
-                                          &pbase, &psize);
-        if ( mfn_eq(smfn, INVALID_MFN) )
-            goto fail;
-
-        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
-               d, bank, pbase, pbase + psize);
-
-        /* One guest memory bank is matched with one physical memory bank. */
-        kinfo->mem.bank[bank].start = pbase;
-        if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[bank],
-                                           smfn, psize) )
-            goto fail;
-
-        kinfo->unassigned_mem -= psize;
-    }
-
-    kinfo->mem.nr_banks = nr_banks;
-
-    /*
-     * The property 'memory' should match the amount of memory given to
-     * the guest.
-     * Currently, it is only possible to either acquire static memory or
-     * let Xen allocate. *Mixing* is not supported.
-     */
-    if ( kinfo->unassigned_mem != 0 )
-    {
-        printk(XENLOG_ERR
-               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\".\n");
-        goto fail;
-    }
-
-    return;
-
- fail:
-    panic("Failed to assign requested static memory for direct-map domain %pd.\n",
-          d);
-}
-
-#ifdef CONFIG_STATIC_SHM
-static int __init acquire_nr_borrower_domain(struct domain *d,
-                                             paddr_t pbase, paddr_t psize,
-                                             unsigned long *nr_borrowers)
-{
-    unsigned int bank;
-
-    /* Iterate reserved memory to find requested shm bank. */
-    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
-    {
-        paddr_t bank_start = bootinfo.reserved_mem.bank[bank].start;
-        paddr_t bank_size = bootinfo.reserved_mem.bank[bank].size;
-
-        if ( (pbase == bank_start) && (psize == bank_size) )
-            break;
-    }
-
-    if ( bank == bootinfo.reserved_mem.nr_banks )
-        return -ENOENT;
-
-    *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_borrowers;
-
-    return 0;
-}
-
-/*
- * This function checks whether the static shared memory region is
- * already allocated to dom_io.
- */
-static bool __init is_shm_allocated_to_domio(paddr_t pbase)
-{
-    struct page_info *page;
-    struct domain *d;
-
-    page = maddr_to_page(pbase);
-    d = page_get_owner_and_reference(page);
-    if ( d == NULL )
-        return false;
-    put_page(page);
-
-    if ( d != dom_io )
-    {
-        printk(XENLOG_ERR
-               "shm memory node has already been allocated to a specific owner %pd, Please check your configuration\n",
-               d);
-        return false;
-    }
-
-    return true;
-}
-
-static mfn_t __init acquire_shared_memory_bank(struct domain *d,
-                                               paddr_t pbase, paddr_t psize)
-{
-    mfn_t smfn;
-    unsigned long nr_pfns;
-    int res;
-
-    /*
-     * Pages of statically shared memory shall be included
-     * into domain_tot_pages().
-     */
-    nr_pfns = PFN_DOWN(psize);
-    if ( (UINT_MAX - d->max_pages) < nr_pfns )
-    {
-        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages: %lu.\n",
-               d, nr_pfns);
-        return INVALID_MFN;
-    }
-    d->max_pages += nr_pfns;
-
-    smfn = maddr_to_mfn(pbase);
-    res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
-    if ( res )
-    {
-        printk(XENLOG_ERR
-               "%pd: failed to acquire static memory: %d.\n", d, res);
-        d->max_pages -= nr_pfns;
-        return INVALID_MFN;
-    }
-
-    return smfn;
-}
-
-static int __init assign_shared_memory(struct domain *d,
-                                       uint32_t addr_cells, uint32_t size_cells,
-                                       paddr_t pbase, paddr_t psize,
-                                       paddr_t gbase)
-{
-    mfn_t smfn;
-    int ret = 0;
-    unsigned long nr_pages, nr_borrowers, i;
-    struct page_info *page;
-
-    printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
-           d, pbase, pbase + psize);
-
-    smfn = acquire_shared_memory_bank(d, pbase, psize);
-    if ( mfn_eq(smfn, INVALID_MFN) )
-        return -EINVAL;
-
-    /*
-     * DOMID_IO is not auto-translated (i.e. it sees RAM 1:1). So we do not need
-     * to create mapping in the P2M.
-     */
-    nr_pages = PFN_DOWN(psize);
-    if ( d != dom_io )
-    {
-        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn,
-                                      PFN_DOWN(psize));
-        if ( ret )
-        {
-            printk(XENLOG_ERR "Failed to map shared memory to %pd.\n", d);
-            return ret;
-        }
-    }
-
-    /*
-     * Get the right amount of references per page, which is the number of
-     * borrower domains.
-     */
-    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
-    if ( ret )
-        return ret;
-
-    /*
-     * Instead of letting borrower domain get a page ref, we add as many
-     * additional reference as the number of borrowers when the owner
-     * is allocated, since there is a chance that owner is created
-     * after borrower.
-     * So if the borrower is created first, it will cause adding pages
-     * in the P2M without reference.
-     */
-    page = mfn_to_page(smfn);
-    for ( i = 0; i < nr_pages; i++ )
-    {
-        if ( !get_page_nr(page + i, d, nr_borrowers) )
-        {
-            printk(XENLOG_ERR
-                   "Failed to add %lu references to page %"PRI_mfn".\n",
-                   nr_borrowers, mfn_x(smfn) + i);
-            goto fail;
-        }
-    }
-
-    return 0;
-
- fail:
-    while ( --i >= 0 )
-        put_page_nr(page + i, nr_borrowers);
-    return ret;
-}
-
-static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
-                                            paddr_t start, paddr_t size,
-                                            const char *shm_id)
-{
-    if ( kinfo->shm_mem.nr_banks >= NR_MEM_BANKS )
-        return -ENOMEM;
-
-    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
-    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
-    safe_strcpy(kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id, shm_id);
-    kinfo->shm_mem.nr_banks++;
-
-    return 0;
-}
-
-int __init process_shm(struct domain *d, struct kernel_info *kinfo,
-                       const struct dt_device_node *node)
-{
-    struct dt_device_node *shm_node;
-
-    dt_for_each_child_node(node, shm_node)
-    {
-        const struct dt_property *prop;
-        const __be32 *cells;
-        uint32_t addr_cells, size_cells;
-        paddr_t gbase, pbase, psize;
-        int ret = 0;
-        unsigned int i;
-        const char *role_str;
-        const char *shm_id;
-        bool owner_dom_io = true;
-
-        if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
-            continue;
-
-        /*
-         * xen,shared-mem = <pbase, gbase, size>;
-         * TODO: pbase is optional.
-         */
-        addr_cells = dt_n_addr_cells(shm_node);
-        size_cells = dt_n_size_cells(shm_node);
-        prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
-        BUG_ON(!prop);
-        cells = (const __be32 *)prop->value;
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
-
-        for ( i = 0; i < PFN_DOWN(psize); i++ )
-            if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
-            {
-                printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
-                       d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
-                return -EINVAL;
-            }
-
-        /*
-         * "role" property is optional and if it is defined explicitly,
-         * then the owner domain is not the default "dom_io" domain.
-         */
-        if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
-            owner_dom_io = false;
-
-        if ( dt_property_read_string(shm_node, "xen,shm-id", &shm_id) )
-        {
-            printk("%pd: invalid \"xen,shm-id\" property", d);
-            return -EINVAL;
-        }
-        BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
-
-        /*
-         * DOMID_IO is a fake domain and is not described in the Device-Tree.
-         * Therefore when the owner of the shared region is DOMID_IO, we will
-         * only find the borrowers.
-         */
-        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
-             (!owner_dom_io && strcmp(role_str, "owner") == 0) )
-        {
-            /*
-             * We found the first borrower of the region, the owner was not
-             * specified, so they should be assigned to dom_io.
-             */
-            ret = assign_shared_memory(owner_dom_io ? dom_io : d,
-                                       addr_cells, size_cells,
-                                       pbase, psize, gbase);
-            if ( ret )
-                return ret;
-        }
-
-        if ( owner_dom_io || (strcmp(role_str, "borrower") == 0) )
-        {
-            /* Set up P2M foreign mapping for borrower domain. */
-            ret = map_regions_p2mt(d, _gfn(PFN_UP(gbase)), PFN_DOWN(psize),
-                                   _mfn(PFN_UP(pbase)), p2m_map_foreign_rw);
-            if ( ret )
-                return ret;
-        }
-
-        /*
-         * Record static shared memory region info for later setting
-         * up shm-node in guest device tree.
-         */
-        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
-        if ( ret )
-            return ret;
-    }
-
-    return 0;
-}
-#endif /* CONFIG_STATIC_SHM */
-#endif
-
 /*
  * When PCI passthrough is available we want to keep the
  * "linux,pci-domain" in sync for every host bridge.
@@ -1337,125 +811,6 @@ int __init make_memory_node(const struct domain *d,
     return res;
 }
 
-#ifdef CONFIG_STATIC_SHM
-static int __init make_shm_memory_node(const struct domain *d,
-                                       void *fdt,
-                                       int addrcells, int sizecells,
-                                       const struct meminfo *mem)
-{
-    unsigned int i = 0;
-    int res = 0;
-
-    if ( mem->nr_banks == 0 )
-        return -ENOENT;
-
-    /*
-     * For each shared memory region, a range is exposed under
-     * the /reserved-memory node as a child node. Each range sub-node is
-     * named xen-shmem@<address>.
-     */
-    dt_dprintk("Create xen-shmem node\n");
-
-    for ( ; i < mem->nr_banks; i++ )
-    {
-        uint64_t start = mem->bank[i].start;
-        uint64_t size = mem->bank[i].size;
-        const char compat[] = "xen,shared-memory-v1";
-        /* Worst case addrcells + sizecells */
-        __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
-        __be32 *cells;
-        unsigned int len = (addrcells + sizecells) * sizeof(__be32);
-
-        res = domain_fdt_begin_node(fdt, "xen-shmem", mem->bank[i].start);
-        if ( res )
-            return res;
-
-        res = fdt_property(fdt, "compatible", compat, sizeof(compat));
-        if ( res )
-            return res;
-
-        cells = reg;
-        dt_child_set_range(&cells, addrcells, sizecells, start, size);
-
-        res = fdt_property(fdt, "reg", reg, len);
-        if ( res )
-            return res;
-
-        dt_dprintk("Shared memory bank %u: %#"PRIx64"->%#"PRIx64"\n",
-                   i, start, start + size);
-
-        res = fdt_property_string(fdt, "xen,id", mem->bank[i].shm_id);
-        if ( res )
-            return res;
-
-        /*
-         * TODO:
-         * - xen,offset: (borrower VMs only)
-         *   64 bit integer offset within the owner virtual machine's shared
-         *   memory region used for the mapping in the borrower VM
-         */
-        res = fdt_property_u64(fdt, "xen,offset", 0);
-        if ( res )
-            return res;
-
-        res = fdt_end_node(fdt);
-        if ( res )
-            return res;
-    }
-
-    return res;
-}
-#else
-static int __init make_shm_memory_node(const struct domain *d,
-                                       void *fdt,
-                                       int addrcells, int sizecells,
-                                       const struct meminfo *mem)
-{
-    ASSERT_UNREACHABLE();
-    return -EOPNOTSUPP;
-}
-#endif
-
-int __init make_resv_memory_node(const struct domain *d,
-                                 void *fdt,
-                                 int addrcells, int sizecells,
-                                 const struct meminfo *mem)
-{
-    int res = 0;
-    /* Placeholder for reserved-memory\0 */
-    const char resvbuf[16] = "reserved-memory";
-
-    if ( mem->nr_banks == 0 )
-        /* No shared memory provided. */
-        return 0;
-
-    dt_dprintk("Create reserved-memory node\n");
-
-    res = fdt_begin_node(fdt, resvbuf);
-    if ( res )
-        return res;
-
-    res = fdt_property(fdt, "ranges", NULL, 0);
-    if ( res )
-        return res;
-
-    res = fdt_property_cell(fdt, "#address-cells", addrcells);
-    if ( res )
-        return res;
-
-    res = fdt_property_cell(fdt, "#size-cells", sizecells);
-    if ( res )
-        return res;
-
-    res = make_shm_memory_node(d, fdt, addrcells, sizecells, mem);
-    if ( res )
-        return res;
-
-    res = fdt_end_node(fdt);
-
-    return res;
-}
-
 static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
                                   void *data)
 {
@@ -2828,9 +2183,6 @@ static int __init construct_dom0(struct domain *d)
 {
     struct kernel_info kinfo = {};
     int rc;
-#ifdef CONFIG_STATIC_SHM
-    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
-#endif
 
     /* Sanity! */
     BUG_ON(d->domain_id != 0);
@@ -2865,11 +2217,9 @@ static int __init construct_dom0(struct domain *d)
     allocate_memory_11(d, &kinfo);
     find_gnttab_region(d, &kinfo);
 
-#ifdef CONFIG_STATIC_SHM
-    rc = process_shm(d, &kinfo, chosen);
+    rc = process_shm_chosen(d, &kinfo);
     if ( rc < 0 )
         return rc;
-#endif
 
     /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
     rc = gic_map_hwdom_extra_mappings(d);
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index b9ae0d170c5c..da9e6025f37c 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -10,8 +10,6 @@ bool allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
                           gfn_t sgfn, paddr_t tot_size);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
-int make_resv_memory_node(const struct domain *d, void *fdt, int addrcells,
-                          int sizecells, const struct meminfo *mem);
 int make_chosen_node(const struct kernel_info *kinfo);
 int make_cpus_node(const struct domain *d, void *fdt);
 int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
@@ -42,9 +40,6 @@ int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
 void set_interrupt(gic_interrupt_t interrupt, unsigned int irq,
                    unsigned int cpumask, unsigned int level);
 
-int process_shm(struct domain *d, struct kernel_info *kinfo,
-                const struct dt_device_node *node);
-
 #ifndef CONFIG_ACPI
 static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo)
 {
@@ -56,27 +51,6 @@ static inline int prepare_acpi(struct domain *d, struct kernel_info *kinfo)
 int prepare_acpi(struct domain *d, struct kernel_info *kinfo);
 #endif
 
-#ifdef CONFIG_STATIC_MEMORY
-void allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
-                            const struct dt_device_node *node);
-void assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
-                             const struct dt_device_node *node);
-#else
-static inline void allocate_static_memory(struct domain *d,
-                                          struct kernel_info *kinfo,
-                                          const struct dt_device_node *node)
-{
-    ASSERT_UNREACHABLE();
-}
-
-static inline void assign_static_memory_11(struct domain *d,
-                                           struct kernel_info *kinfo,
-                                           const struct dt_device_node *node)
-{
-    ASSERT_UNREACHABLE();
-}
-#endif
-
 #endif
 
 /*
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 6d670d68aed3..bda3c07b8797 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -160,7 +160,6 @@ struct bootcmdline * boot_cmdline_find_by_name(const char *name);
 const char *boot_module_kind_as_string(bootmodule_kind kind);
 
 void init_pdx(void);
-void init_staticmem_pages(void);
 void populate_boot_allocator(void);
 void setup_mm(void);
 
diff --git a/xen/arch/arm/include/asm/static-memory.h b/xen/arch/arm/include/asm/static-memory.h
new file mode 100644
index 000000000000..3e3efd70c38d
--- /dev/null
+++ b/xen/arch/arm/include/asm/static-memory.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_STATIC_MEMORY_H_
+#define __ASM_STATIC_MEMORY_H_
+
+#include <asm/kernel.h>
+
+#ifdef CONFIG_STATIC_MEMORY
+
+void allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
+                            const struct dt_device_node *node);
+void assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
+                             const struct dt_device_node *node);
+void init_staticmem_pages(void);
+
+#else /* !CONFIG_STATIC_MEMORY */
+
+static inline void allocate_static_memory(struct domain *d,
+                                          struct kernel_info *kinfo,
+                                          const struct dt_device_node *node)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void assign_static_memory_11(struct domain *d,
+                                           struct kernel_info *kinfo,
+                                           const struct dt_device_node *node)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void init_staticmem_pages(void) {};
+
+#endif /* CONFIG_STATIC_MEMORY */
+
+#endif /* __ASM_STATIC_MEMORY_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
new file mode 100644
index 000000000000..1536ff18b895
--- /dev/null
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_STATIC_SHMEM_H_
+#define __ASM_STATIC_SHMEM_H_
+
+#include <asm/kernel.h>
+
+#ifdef CONFIG_STATIC_SHM
+
+int make_resv_memory_node(const struct domain *d, void *fdt, int addrcells,
+                          int sizecells, const struct meminfo *mem);
+
+int process_shm(struct domain *d, struct kernel_info *kinfo,
+                const struct dt_device_node *node);
+
+static inline int process_shm_chosen(struct domain *d,
+                                     struct kernel_info *kinfo)
+{
+    const struct dt_device_node *node = dt_find_node_by_path("/chosen");
+
+    return process_shm(d, kinfo, node);
+}
+
+int process_shm_node(const void *fdt, int node, uint32_t address_cells,
+                     uint32_t size_cells);
+
+#else /* !CONFIG_STATIC_SHM */
+
+static inline int make_resv_memory_node(const struct domain *d, void *fdt,
+                                        int addrcells, int sizecells,
+                                        const struct meminfo *mem)
+{
+    return 0;
+}
+
+static inline int process_shm(struct domain *d, struct kernel_info *kinfo,
+                              const struct dt_device_node *node)
+{
+    return 0;
+}
+
+static inline int process_shm_chosen(struct domain *d,
+                                     struct kernel_info *kinfo)
+{
+    return 0;
+}
+
+static inline int process_shm_node(const void *fdt, int node,
+                                   uint32_t address_cells, uint32_t size_cells)
+{
+    printk("CONFIG_STATIC_SHM must be enabled for parsing static shared memory nodes\n");
+    return -EINVAL;
+}
+
+#endif /* CONFIG_STATIC_SHM */
+
+#endif /* __ASM_STATIC_SHMEM_H_ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 3f1081bed2e2..d2a47416e462 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -621,30 +621,6 @@ void __init init_pdx(void)
     }
 }
 
-/* Static memory initialization */
-void __init init_staticmem_pages(void)
-{
-#ifdef CONFIG_STATIC_MEMORY
-    unsigned int bank;
-
-    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
-    {
-        if ( bootinfo.reserved_mem.bank[bank].type == MEMBANK_STATIC_DOMAIN )
-        {
-            mfn_t bank_start = _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
-            unsigned long bank_pages = PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
-            mfn_t bank_end = mfn_add(bank_start, bank_pages);
-
-            if ( mfn_x(bank_end) <= mfn_x(bank_start) )
-                return;
-
-            unprepare_staticmem_pages(mfn_to_page(bank_start),
-                                      bank_pages, false);
-        }
-    }
-#endif
-}
-
 /*
  * Populate the boot allocator.
  * If a static heap was not provided by the admin, all the RAM but the
diff --git a/xen/arch/arm/static-memory.c b/xen/arch/arm/static-memory.c
new file mode 100644
index 000000000000..cffbab7241b7
--- /dev/null
+++ b/xen/arch/arm/static-memory.c
@@ -0,0 +1,287 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/sched.h>
+
+#include <asm/static-memory.h>
+
+static bool __init append_static_memory_to_bank(struct domain *d,
+                                                struct membank *bank,
+                                                mfn_t smfn,
+                                                paddr_t size)
+{
+    int res;
+    unsigned int nr_pages = PFN_DOWN(size);
+    gfn_t sgfn;
+
+    /*
+     * For direct-mapped domain, the GFN match the MFN.
+     * Otherwise, this is inferred on what has already been allocated
+     * in the bank.
+     */
+    if ( !is_domain_direct_mapped(d) )
+        sgfn = gaddr_to_gfn(bank->start + bank->size);
+    else
+        sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
+
+    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
+    if ( res )
+    {
+        dprintk(XENLOG_ERR, "Failed to map pages to DOMU: %d", res);
+        return false;
+    }
+
+    bank->size = bank->size + size;
+
+    return true;
+}
+
+static mfn_t __init acquire_static_memory_bank(struct domain *d,
+                                               const __be32 **cell,
+                                               u32 addr_cells, u32 size_cells,
+                                               paddr_t *pbase, paddr_t *psize)
+{
+    mfn_t smfn;
+    int res;
+
+    device_tree_get_reg(cell, addr_cells, size_cells, pbase, psize);
+    ASSERT(IS_ALIGNED(*pbase, PAGE_SIZE) && IS_ALIGNED(*psize, PAGE_SIZE));
+    if ( PFN_DOWN(*psize) > UINT_MAX )
+    {
+        printk(XENLOG_ERR "%pd: static memory size too large: %#"PRIpaddr,
+               d, *psize);
+        return INVALID_MFN;
+    }
+
+    smfn = maddr_to_mfn(*pbase);
+    res = acquire_domstatic_pages(d, smfn, PFN_DOWN(*psize), 0);
+    if ( res )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to acquire static memory: %d.\n", d, res);
+        return INVALID_MFN;
+    }
+
+    return smfn;
+}
+
+static int __init parse_static_mem_prop(const struct dt_device_node *node,
+                                        u32 *addr_cells, u32 *size_cells,
+                                        int *length, const __be32 **cell)
+{
+    const struct dt_property *prop;
+
+    prop = dt_find_property(node, "xen,static-mem", NULL);
+
+    *addr_cells = dt_n_addr_cells(node);
+    *size_cells = dt_n_size_cells(node);
+
+    *cell = (const __be32 *)prop->value;
+    *length = prop->length;
+
+    return 0;
+}
+
+/* Allocate memory from static memory as RAM for one specific domain d. */
+void __init allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
+                                   const struct dt_device_node *node)
+{
+    u32 addr_cells, size_cells, reg_cells;
+    unsigned int nr_banks, gbank, bank = 0;
+    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t ramsize[] = GUEST_RAM_BANK_SIZES;
+    const __be32 *cell;
+    u64 tot_size = 0;
+    paddr_t pbase, psize, gsize;
+    mfn_t smfn;
+    int length;
+
+    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
+        goto fail;
+    reg_cells = addr_cells + size_cells;
+
+    /*
+     * The static memory will be mapped in the guest at the usual guest memory
+     * addresses (GUEST_RAM0_BASE, GUEST_RAM1_BASE) defined by
+     * xen/include/public/arch-arm.h.
+     */
+    gbank = 0;
+    gsize = ramsize[gbank];
+    kinfo->mem.bank[gbank].start = rambase[gbank];
+    nr_banks = length / (reg_cells * sizeof (u32));
+
+    for ( ; bank < nr_banks; bank++ )
+    {
+        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
+                                          &pbase, &psize);
+        if ( mfn_eq(smfn, INVALID_MFN) )
+            goto fail;
+
+        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
+               d, bank, pbase, pbase + psize);
+
+        while ( 1 )
+        {
+            /* Map as much as possible the static range to the guest bank */
+            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank], smfn,
+                                               min(psize, gsize)) )
+                goto fail;
+
+            /*
+             * The current physical bank is fully mapped.
+             * Handle the next physical bank.
+             */
+            if ( gsize >= psize )
+            {
+                gsize = gsize - psize;
+                break;
+            }
+            /*
+             * When current guest bank is not enough to map, exhaust
+             * the current one and seek to the next.
+             * Before seeking to the next, check if we still have available
+             * guest bank.
+             */
+            else if ( (gbank + 1) >= GUEST_RAM_BANKS )
+            {
+                printk(XENLOG_ERR "Exhausted all possible guest banks.\n");
+                goto fail;
+            }
+            else
+            {
+                psize = psize - gsize;
+                smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
+                /* Update to the next guest bank. */
+                gbank++;
+                gsize = ramsize[gbank];
+                kinfo->mem.bank[gbank].start = rambase[gbank];
+            }
+        }
+
+        tot_size += psize;
+    }
+
+    kinfo->mem.nr_banks = ++gbank;
+
+    kinfo->unassigned_mem -= tot_size;
+    /*
+     * The property 'memory' should match the amount of memory given to the
+     * guest.
+     * Currently, it is only possible to either acquire static memory or let
+     * Xen allocate. *Mixing* is not supported.
+     */
+    if ( kinfo->unassigned_mem )
+    {
+        printk(XENLOG_ERR
+               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\". Unsupported configuration.\n");
+        goto fail;
+    }
+
+    return;
+
+ fail:
+    panic("Failed to allocate requested static memory for domain %pd.\n", d);
+}
+
+/*
+ * Allocate static memory as RAM for one specific domain d.
+ * The static memory will be directly mapped in the guest(Guest Physical
+ * Address == Physical Address).
+ */
+void __init assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
+                                    const struct dt_device_node *node)
+{
+    u32 addr_cells, size_cells, reg_cells;
+    unsigned int nr_banks, bank = 0;
+    const __be32 *cell;
+    paddr_t pbase, psize;
+    mfn_t smfn;
+    int length;
+
+    if ( parse_static_mem_prop(node, &addr_cells, &size_cells, &length, &cell) )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to parse \"xen,static-mem\" property.\n", d);
+        goto fail;
+    }
+    reg_cells = addr_cells + size_cells;
+    nr_banks = length / (reg_cells * sizeof(u32));
+
+    if ( nr_banks > NR_MEM_BANKS )
+    {
+        printk(XENLOG_ERR
+               "%pd: exceed max number of supported guest memory banks.\n", d);
+        goto fail;
+    }
+
+    for ( ; bank < nr_banks; bank++ )
+    {
+        smfn = acquire_static_memory_bank(d, &cell, addr_cells, size_cells,
+                                          &pbase, &psize);
+        if ( mfn_eq(smfn, INVALID_MFN) )
+            goto fail;
+
+        printk(XENLOG_INFO "%pd: STATIC BANK[%u] %#"PRIpaddr"-%#"PRIpaddr"\n",
+               d, bank, pbase, pbase + psize);
+
+        /* One guest memory bank is matched with one physical memory bank. */
+        kinfo->mem.bank[bank].start = pbase;
+        if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[bank],
+                                           smfn, psize) )
+            goto fail;
+
+        kinfo->unassigned_mem -= psize;
+    }
+
+    kinfo->mem.nr_banks = nr_banks;
+
+    /*
+     * The property 'memory' should match the amount of memory given to
+     * the guest.
+     * Currently, it is only possible to either acquire static memory or
+     * let Xen allocate. *Mixing* is not supported.
+     */
+    if ( kinfo->unassigned_mem != 0 )
+    {
+        printk(XENLOG_ERR
+               "Size of \"memory\" property doesn't match up with the sum-up of \"xen,static-mem\".\n");
+        goto fail;
+    }
+
+    return;
+
+ fail:
+    panic("Failed to assign requested static memory for direct-map domain %pd.\n",
+          d);
+}
+
+/* Static memory initialization */
+void __init init_staticmem_pages(void)
+{
+    unsigned int bank;
+
+    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
+    {
+        if ( bootinfo.reserved_mem.bank[bank].type == MEMBANK_STATIC_DOMAIN )
+        {
+            mfn_t bank_start = _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
+            unsigned long bank_pages = PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
+            mfn_t bank_end = mfn_add(bank_start, bank_pages);
+
+            if ( mfn_x(bank_end) <= mfn_x(bank_start) )
+                return;
+
+            unprepare_staticmem_pages(mfn_to_page(bank_start),
+                                      bank_pages, false);
+        }
+    }
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
new file mode 100644
index 000000000000..9097bc8b1511
--- /dev/null
+++ b/xen/arch/arm/static-shmem.c
@@ -0,0 +1,547 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/libfdt/libfdt.h>
+#include <xen/sched.h>
+
+#include <asm/domain_build.h>
+#include <asm/static-shmem.h>
+
+static int __init acquire_nr_borrower_domain(struct domain *d,
+                                             paddr_t pbase, paddr_t psize,
+                                             unsigned long *nr_borrowers)
+{
+    unsigned int bank;
+
+    /* Iterate reserved memory to find requested shm bank. */
+    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
+    {
+        paddr_t bank_start = bootinfo.reserved_mem.bank[bank].start;
+        paddr_t bank_size = bootinfo.reserved_mem.bank[bank].size;
+
+        if ( (pbase == bank_start) && (psize == bank_size) )
+            break;
+    }
+
+    if ( bank == bootinfo.reserved_mem.nr_banks )
+        return -ENOENT;
+
+    *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_borrowers;
+
+    return 0;
+}
+
+/*
+ * This function checks whether the static shared memory region is
+ * already allocated to dom_io.
+ */
+static bool __init is_shm_allocated_to_domio(paddr_t pbase)
+{
+    struct page_info *page;
+    struct domain *d;
+
+    page = maddr_to_page(pbase);
+    d = page_get_owner_and_reference(page);
+    if ( d == NULL )
+        return false;
+    put_page(page);
+
+    if ( d != dom_io )
+    {
+        printk(XENLOG_ERR
+               "shm memory node has already been allocated to a specific owner %pd, Please check your configuration\n",
+               d);
+        return false;
+    }
+
+    return true;
+}
+
+static mfn_t __init acquire_shared_memory_bank(struct domain *d,
+                                               paddr_t pbase, paddr_t psize)
+{
+    mfn_t smfn;
+    unsigned long nr_pfns;
+    int res;
+
+    /*
+     * Pages of statically shared memory shall be included
+     * into domain_tot_pages().
+     */
+    nr_pfns = PFN_DOWN(psize);
+    if ( (UINT_MAX - d->max_pages) < nr_pfns )
+    {
+        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages: %lu.\n",
+               d, nr_pfns);
+        return INVALID_MFN;
+    }
+    d->max_pages += nr_pfns;
+
+    smfn = maddr_to_mfn(pbase);
+    res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
+    if ( res )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to acquire static memory: %d.\n", d, res);
+        d->max_pages -= nr_pfns;
+        return INVALID_MFN;
+    }
+
+    return smfn;
+}
+
+static int __init assign_shared_memory(struct domain *d,
+                                       uint32_t addr_cells, uint32_t size_cells,
+                                       paddr_t pbase, paddr_t psize,
+                                       paddr_t gbase)
+{
+    mfn_t smfn;
+    int ret = 0;
+    unsigned long nr_pages, nr_borrowers, i;
+    struct page_info *page;
+
+    printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
+           d, pbase, pbase + psize);
+
+    smfn = acquire_shared_memory_bank(d, pbase, psize);
+    if ( mfn_eq(smfn, INVALID_MFN) )
+        return -EINVAL;
+
+    /*
+     * DOMID_IO is not auto-translated (i.e. it sees RAM 1:1). So we do not need
+     * to create mapping in the P2M.
+     */
+    nr_pages = PFN_DOWN(psize);
+    if ( d != dom_io )
+    {
+        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn,
+                                      PFN_DOWN(psize));
+        if ( ret )
+        {
+            printk(XENLOG_ERR "Failed to map shared memory to %pd.\n", d);
+            return ret;
+        }
+    }
+
+    /*
+     * Get the right amount of references per page, which is the number of
+     * borrower domains.
+     */
+    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
+    if ( ret )
+        return ret;
+
+    /*
+     * Instead of letting borrower domain get a page ref, we add as many
+     * additional reference as the number of borrowers when the owner
+     * is allocated, since there is a chance that owner is created
+     * after borrower.
+     * So if the borrower is created first, it will cause adding pages
+     * in the P2M without reference.
+     */
+    page = mfn_to_page(smfn);
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        if ( !get_page_nr(page + i, d, nr_borrowers) )
+        {
+            printk(XENLOG_ERR
+                   "Failed to add %lu references to page %"PRI_mfn".\n",
+                   nr_borrowers, mfn_x(smfn) + i);
+            goto fail;
+        }
+    }
+
+    return 0;
+
+ fail:
+    while ( --i >= 0 )
+        put_page_nr(page + i, nr_borrowers);
+    return ret;
+}
+
+static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
+                                            paddr_t start, paddr_t size,
+                                            const char *shm_id)
+{
+    if ( kinfo->shm_mem.nr_banks >= NR_MEM_BANKS )
+        return -ENOMEM;
+
+    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
+    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
+    safe_strcpy(kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id, shm_id);
+    kinfo->shm_mem.nr_banks++;
+
+    return 0;
+}
+
+int __init process_shm(struct domain *d, struct kernel_info *kinfo,
+                       const struct dt_device_node *node)
+{
+    struct dt_device_node *shm_node;
+
+    dt_for_each_child_node(node, shm_node)
+    {
+        const struct dt_property *prop;
+        const __be32 *cells;
+        uint32_t addr_cells, size_cells;
+        paddr_t gbase, pbase, psize;
+        int ret = 0;
+        unsigned int i;
+        const char *role_str;
+        const char *shm_id;
+        bool owner_dom_io = true;
+
+        if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
+            continue;
+
+        /*
+         * xen,shared-mem = <pbase, gbase, size>;
+         * TODO: pbase is optional.
+         */
+        addr_cells = dt_n_addr_cells(shm_node);
+        size_cells = dt_n_size_cells(shm_node);
+        prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
+        BUG_ON(!prop);
+        cells = (const __be32 *)prop->value;
+        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
+        psize = dt_read_paddr(cells, size_cells);
+        if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
+        {
+            printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
+                   d, pbase, gbase);
+            return -EINVAL;
+        }
+        if ( !IS_ALIGNED(psize, PAGE_SIZE) )
+        {
+            printk("%pd: size 0x%"PRIpaddr" is not suitably aligned\n",
+                   d, psize);
+            return -EINVAL;
+        }
+
+        for ( i = 0; i < PFN_DOWN(psize); i++ )
+            if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
+            {
+                printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
+                       d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
+                return -EINVAL;
+            }
+
+        /*
+         * "role" property is optional and if it is defined explicitly,
+         * then the owner domain is not the default "dom_io" domain.
+         */
+        if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
+            owner_dom_io = false;
+
+        if ( dt_property_read_string(shm_node, "xen,shm-id", &shm_id) )
+        {
+            printk("%pd: invalid \"xen,shm-id\" property", d);
+            return -EINVAL;
+        }
+        BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
+
+        /*
+         * DOMID_IO is a fake domain and is not described in the Device-Tree.
+         * Therefore when the owner of the shared region is DOMID_IO, we will
+         * only find the borrowers.
+         */
+        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
+             (!owner_dom_io && strcmp(role_str, "owner") == 0) )
+        {
+            /*
+             * We found the first borrower of the region, the owner was not
+             * specified, so they should be assigned to dom_io.
+             */
+            ret = assign_shared_memory(owner_dom_io ? dom_io : d,
+                                       addr_cells, size_cells,
+                                       pbase, psize, gbase);
+            if ( ret )
+                return ret;
+        }
+
+        if ( owner_dom_io || (strcmp(role_str, "borrower") == 0) )
+        {
+            /* Set up P2M foreign mapping for borrower domain. */
+            ret = map_regions_p2mt(d, _gfn(PFN_UP(gbase)), PFN_DOWN(psize),
+                                   _mfn(PFN_UP(pbase)), p2m_map_foreign_rw);
+            if ( ret )
+                return ret;
+        }
+
+        /*
+         * Record static shared memory region info for later setting
+         * up shm-node in guest device tree.
+         */
+        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
+        if ( ret )
+            return ret;
+    }
+
+    return 0;
+}
+
+static int __init make_shm_memory_node(const struct domain *d, void *fdt,
+                                       int addrcells, int sizecells,
+                                       const struct meminfo *mem)
+{
+    unsigned int i = 0;
+    int res = 0;
+
+    if ( mem->nr_banks == 0 )
+        return -ENOENT;
+
+    /*
+     * For each shared memory region, a range is exposed under
+     * the /reserved-memory node as a child node. Each range sub-node is
+     * named xen-shmem@<address>.
+     */
+    dt_dprintk("Create xen-shmem node\n");
+
+    for ( ; i < mem->nr_banks; i++ )
+    {
+        uint64_t start = mem->bank[i].start;
+        uint64_t size = mem->bank[i].size;
+        const char compat[] = "xen,shared-memory-v1";
+        /* Worst case addrcells + sizecells */
+        __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
+        __be32 *cells;
+        unsigned int len = (addrcells + sizecells) * sizeof(__be32);
+
+        res = domain_fdt_begin_node(fdt, "xen-shmem", mem->bank[i].start);
+        if ( res )
+            return res;
+
+        res = fdt_property(fdt, "compatible", compat, sizeof(compat));
+        if ( res )
+            return res;
+
+        cells = reg;
+        dt_child_set_range(&cells, addrcells, sizecells, start, size);
+
+        res = fdt_property(fdt, "reg", reg, len);
+        if ( res )
+            return res;
+
+        dt_dprintk("Shared memory bank %u: %#"PRIx64"->%#"PRIx64"\n",
+                   i, start, start + size);
+
+        res = fdt_property_string(fdt, "xen,id", mem->bank[i].shm_id);
+        if ( res )
+            return res;
+
+        /*
+         * TODO:
+         * - xen,offset: (borrower VMs only)
+         *   64 bit integer offset within the owner virtual machine's shared
+         *   memory region used for the mapping in the borrower VM
+         */
+        res = fdt_property_u64(fdt, "xen,offset", 0);
+        if ( res )
+            return res;
+
+        res = fdt_end_node(fdt);
+        if ( res )
+            return res;
+    }
+
+    return res;
+}
+
+int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
+                            uint32_t size_cells)
+{
+    const struct fdt_property *prop, *prop_id, *prop_role;
+    const __be32 *cell;
+    paddr_t paddr, gaddr, size;
+    struct meminfo *mem = &bootinfo.reserved_mem;
+    unsigned int i;
+    int len;
+    bool owner = false;
+    const char *shm_id;
+
+    if ( address_cells < 1 || size_cells < 1 )
+    {
+        printk("fdt: invalid #address-cells or #size-cells for static shared memory node.\n");
+        return -EINVAL;
+    }
+
+    /*
+     * "xen,shm-id" property holds an arbitrary string with a strict limit
+     * on the number of characters, MAX_SHM_ID_LENGTH
+     */
+    prop_id = fdt_get_property(fdt, node, "xen,shm-id", NULL);
+    if ( !prop_id )
+        return -ENOENT;
+    shm_id = (const char *)prop_id->data;
+    if ( strnlen(shm_id, MAX_SHM_ID_LENGTH) == MAX_SHM_ID_LENGTH )
+    {
+        printk("fdt: invalid xen,shm-id %s, it must be limited to %u characters\n",
+               shm_id, MAX_SHM_ID_LENGTH);
+        return -EINVAL;
+    }
+
+    /*
+     * "role" property is optional and if it is defined explicitly,
+     * it must be either `owner` or `borrower`.
+     */
+    prop_role = fdt_get_property(fdt, node, "role", NULL);
+    if ( prop_role )
+    {
+        if ( !strcmp(prop_role->data, "owner") )
+            owner = true;
+        else if ( strcmp(prop_role->data, "borrower") )
+        {
+            printk("fdt: invalid `role` property for static shared memory node.\n");
+            return -EINVAL;
+        }
+    }
+
+    /*
+     * xen,shared-mem = <paddr, gaddr, size>;
+     * Memory region starting from physical address #paddr of #size shall
+     * be mapped to guest physical address #gaddr as static shared memory
+     * region.
+     */
+    prop = fdt_get_property(fdt, node, "xen,shared-mem", &len);
+    if ( !prop )
+        return -ENOENT;
+
+    if ( len != dt_cells_to_size(address_cells + size_cells + address_cells) )
+    {
+        if ( len == dt_cells_to_size(size_cells + address_cells) )
+            printk("fdt: host physical address must be chosen by users at the moment.\n");
+
+        printk("fdt: invalid `xen,shared-mem` property.\n");
+        return -EINVAL;
+    }
+
+    cell = (const __be32 *)prop->data;
+    device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
+    size = dt_next_cell(size_cells, &cell);
+
+    if ( !size )
+    {
+        printk("fdt: the size for static shared memory region can not be zero\n");
+        return -EINVAL;
+    }
+
+    for ( i = 0; i < mem->nr_banks; i++ )
+    {
+        /*
+         * Meet the following check:
+         * 1) The shm ID matches and the region exactly match
+         * 2) The shm ID doesn't match and the region doesn't overlap
+         * with an existing one
+         */
+        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
+        {
+            if ( strncmp(shm_id, mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) == 0 )
+                break;
+            else
+            {
+                printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
+                       shm_id);
+                return -EINVAL;
+            }
+        }
+        else
+        {
+            paddr_t end = paddr + size;
+            paddr_t bank_end = mem->bank[i].start + mem->bank[i].size;
+
+            if ( (end <= paddr) || (bank_end <= mem->bank[i].start) )
+            {
+                printk("fdt: static shared memory region %s overflow\n", shm_id);
+                return -EINVAL;
+            }
+
+            if ( check_reserved_regions_overlap(paddr, size) )
+                return -EINVAL;
+            else
+            {
+                if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
+                    continue;
+                else
+                {
+                    printk("fdt: different shared memory region could not share the same shm ID %s\n",
+                           shm_id);
+                    return -EINVAL;
+                }
+            }
+        }
+    }
+
+    if ( i == mem->nr_banks )
+    {
+        if ( i < NR_MEM_BANKS )
+        {
+            /* Static shared memory shall be reserved from any other use. */
+            safe_strcpy(mem->bank[mem->nr_banks].shm_id, shm_id);
+            mem->bank[mem->nr_banks].start = paddr;
+            mem->bank[mem->nr_banks].size = size;
+            mem->bank[mem->nr_banks].type = MEMBANK_STATIC_DOMAIN;
+            mem->nr_banks++;
+        }
+        else
+        {
+            printk("Warning: Max number of supported memory regions reached.\n");
+            return -ENOSPC;
+        }
+    }
+    /*
+     * keep a count of the number of borrowers, which later may be used
+     * to calculate the reference count.
+     */
+    if ( !owner )
+        mem->bank[i].nr_shm_borrowers++;
+
+    return 0;
+}
+
+int __init make_resv_memory_node(const struct domain *d, void *fdt,
+                                 int addrcells, int sizecells,
+                                 const struct meminfo *mem)
+{
+    int res = 0;
+    /* Placeholder for reserved-memory\0 */
+    const char resvbuf[16] = "reserved-memory";
+
+    if ( mem->nr_banks == 0 )
+        /* No shared memory provided. */
+        return 0;
+
+    dt_dprintk("Create reserved-memory node\n");
+
+    res = fdt_begin_node(fdt, resvbuf);
+    if ( res )
+        return res;
+
+    res = fdt_property(fdt, "ranges", NULL, 0);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#address-cells", addrcells);
+    if ( res )
+        return res;
+
+    res = fdt_property_cell(fdt, "#size-cells", sizecells);
+    if ( res )
+        return res;
+
+    res = make_shm_memory_node(d, fdt, addrcells, sizecells, mem);
+    if ( res )
+        return res;
+
+    res = fdt_end_node(fdt);
+
+    return res;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.34.1


