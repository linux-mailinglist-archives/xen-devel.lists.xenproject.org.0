Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 176AF7D2864
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 04:14:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620922.966791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qukSH-0001mc-Fh; Mon, 23 Oct 2023 02:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620922.966791; Mon, 23 Oct 2023 02:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qukSH-0001kD-Be; Mon, 23 Oct 2023 02:14:09 +0000
Received: by outflank-mailman (input) for mailman id 620922;
 Mon, 23 Oct 2023 02:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JdWI=GF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qukSG-0001U7-1g
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 02:14:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d4faa739-7149-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 04:14:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDD33C15;
 Sun, 22 Oct 2023 19:14:41 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 681B03F738;
 Sun, 22 Oct 2023 19:13:57 -0700 (PDT)
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
X-Inumbo-ID: d4faa739-7149-11ee-9b0e-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 1/8] xen/arm: Split page table related code to mmu/pt.c
Date: Mon, 23 Oct 2023 10:13:38 +0800
Message-Id: <20231023021345.1731436-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023021345.1731436-1-Henry.Wang@arm.com>
References: <20231023021345.1731436-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The extraction of MMU related code is the basis of MPU support.
This commit starts this work by firstly splitting the page table
related code to mmu/pt.c, so that we will not end up with again
massive mm.c files.

Introduce a mmu specific directory and setup the Makefiles for it.
Move the page table related functions and macros from arch/arm/mm.c
to arch/arm/mmu/pt.c.

Take the opportunity to fix the in-code comment coding styles when
possible, and drop the unnecessary #include headers in the original
arch/arm/mm.c.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v8:
- Add Julien's Reviewed-by tag.
v7:
- Do not move pte_of_xenaddr() to mmu/pt.c.
- Do not expose global variable phys_offset.
v6:
- Rework the original patch "[v5,07/13] xen/arm: Extract MMU-specific
  code", only split the page table related code out in this patch.
---
 xen/arch/arm/Makefile     |   1 +
 xen/arch/arm/mm.c         | 717 -------------------------------------
 xen/arch/arm/mmu/Makefile |   1 +
 xen/arch/arm/mmu/pt.c     | 736 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 738 insertions(+), 717 deletions(-)
 create mode 100644 xen/arch/arm/mmu/Makefile
 create mode 100644 xen/arch/arm/mmu/pt.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7bf07e9920..c45b08b31e 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
+obj-$(CONFIG_MMU) += mmu/
 obj-$(CONFIG_ACPI) += acpi/
 obj-$(CONFIG_HAS_PCI) += pci/
 ifneq ($(CONFIG_NO_PLAT),y)
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index c34cc94c90..fd02493564 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -9,22 +9,14 @@
  */
 
 #include <xen/domain_page.h>
-#include <xen/errno.h>
 #include <xen/grant_table.h>
 #include <xen/guest_access.h>
-#include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
-#include <xen/pfn.h>
-#include <xen/pmap.h>
-#include <xen/sched.h>
 #include <xen/sizes.h>
-#include <xen/types.h>
-#include <xen/vmap.h>
 
 #include <xsm/xsm.h>
 
-#include <asm/fixmap.h>
 #include <asm/setup.h>
 
 #include <public/memory.h>
@@ -35,19 +27,6 @@
 #undef mfn_to_virt
 #define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
 
-#ifdef NDEBUG
-static inline void
-__attribute__ ((__format__ (__printf__, 1, 2)))
-mm_printk(const char *fmt, ...) {}
-#else
-#define mm_printk(fmt, args...)             \
-    do                                      \
-    {                                       \
-        dprintk(XENLOG_ERR, fmt, ## args);  \
-        WARN();                             \
-    } while (0)
-#endif
-
 /* Static start-of-day pagetables that we use before the allocators
  * are up. These are used by all CPUs during bringup before switching
  * to the CPUs own pagetables.
@@ -92,12 +71,10 @@ DEFINE_BOOT_PAGE_TABLES(boot_third, XEN_NR_ENTRIES(2));
  */
 
 #ifdef CONFIG_ARM_64
-#define HYP_PT_ROOT_LEVEL 0
 DEFINE_PAGE_TABLE(xen_pgtable);
 static DEFINE_PAGE_TABLE(xen_first);
 #define THIS_CPU_PGTABLE xen_pgtable
 #else
-#define HYP_PT_ROOT_LEVEL 1
 /* Per-CPU pagetable pages */
 /* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
 DEFINE_PER_CPU(lpae_t *, xen_pgtable);
@@ -200,179 +177,6 @@ static void __init __maybe_unused build_assertions(void)
 #undef CHECK_DIFFERENT_SLOT
 }
 
-static lpae_t *xen_map_table(mfn_t mfn)
-{
-    /*
-     * During early boot, map_domain_page() may be unusable. Use the
-     * PMAP to map temporarily a page-table.
-     */
-    if ( system_state == SYS_STATE_early_boot )
-        return pmap_map(mfn);
-
-    return map_domain_page(mfn);
-}
-
-static void xen_unmap_table(const lpae_t *table)
-{
-    /*
-     * During early boot, xen_map_table() will not use map_domain_page()
-     * but the PMAP.
-     */
-    if ( system_state == SYS_STATE_early_boot )
-        pmap_unmap(table);
-    else
-        unmap_domain_page(table);
-}
-
-void dump_pt_walk(paddr_t ttbr, paddr_t addr,
-                  unsigned int root_level,
-                  unsigned int nr_root_tables)
-{
-    static const char *level_strs[4] = { "0TH", "1ST", "2ND", "3RD" };
-    const mfn_t root_mfn = maddr_to_mfn(ttbr);
-    DECLARE_OFFSETS(offsets, addr);
-    lpae_t pte, *mapping;
-    unsigned int level, root_table;
-
-#ifdef CONFIG_ARM_32
-    BUG_ON(root_level < 1);
-#endif
-    BUG_ON(root_level > 3);
-
-    if ( nr_root_tables > 1 )
-    {
-        /*
-         * Concatenated root-level tables. The table number will be
-         * the offset at the previous level. It is not possible to
-         * concatenate a level-0 root.
-         */
-        BUG_ON(root_level == 0);
-        root_table = offsets[root_level - 1];
-        printk("Using concatenated root table %u\n", root_table);
-        if ( root_table >= nr_root_tables )
-        {
-            printk("Invalid root table offset\n");
-            return;
-        }
-    }
-    else
-        root_table = 0;
-
-    mapping = xen_map_table(mfn_add(root_mfn, root_table));
-
-    for ( level = root_level; ; level++ )
-    {
-        if ( offsets[level] > XEN_PT_LPAE_ENTRIES )
-            break;
-
-        pte = mapping[offsets[level]];
-
-        printk("%s[0x%03x] = 0x%"PRIx64"\n",
-               level_strs[level], offsets[level], pte.bits);
-
-        if ( level == 3 || !pte.walk.valid || !pte.walk.table )
-            break;
-
-        /* For next iteration */
-        xen_unmap_table(mapping);
-        mapping = xen_map_table(lpae_get_mfn(pte));
-    }
-
-    xen_unmap_table(mapping);
-}
-
-void dump_hyp_walk(vaddr_t addr)
-{
-    uint64_t ttbr = READ_SYSREG64(TTBR0_EL2);
-
-    printk("Walking Hypervisor VA 0x%"PRIvaddr" "
-           "on CPU%d via TTBR 0x%016"PRIx64"\n",
-           addr, smp_processor_id(), ttbr);
-
-    dump_pt_walk(ttbr, addr, HYP_PT_ROOT_LEVEL, 1);
-}
-
-lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
-{
-    lpae_t e = (lpae_t) {
-        .pt = {
-            .valid = 1,           /* Mappings are present */
-            .table = 0,           /* Set to 1 for links and 4k maps */
-            .ai = attr,
-            .ns = 1,              /* Hyp mode is in the non-secure world */
-            .up = 1,              /* See below */
-            .ro = 0,              /* Assume read-write */
-            .af = 1,              /* No need for access tracking */
-            .ng = 1,              /* Makes TLB flushes easier */
-            .contig = 0,          /* Assume non-contiguous */
-            .xn = 1,              /* No need to execute outside .text */
-            .avail = 0,           /* Reference count for domheap mapping */
-        }};
-    /*
-     * For EL2 stage-1 page table, up (aka AP[1]) is RES1 as the translation
-     * regime applies to only one exception level (see D4.4.4 and G4.6.1
-     * in ARM DDI 0487B.a). If this changes, remember to update the
-     * hard-coded values in head.S too.
-     */
-
-    switch ( attr )
-    {
-    case MT_NORMAL_NC:
-        /*
-         * ARM ARM: Overlaying the shareability attribute (DDI
-         * 0406C.b B3-1376 to 1377)
-         *
-         * A memory region with a resultant memory type attribute of Normal,
-         * and a resultant cacheability attribute of Inner Non-cacheable,
-         * Outer Non-cacheable, must have a resultant shareability attribute
-         * of Outer Shareable, otherwise shareability is UNPREDICTABLE.
-         *
-         * On ARMv8 sharability is ignored and explicitly treated as Outer
-         * Shareable for Normal Inner Non_cacheable, Outer Non-cacheable.
-         */
-        e.pt.sh = LPAE_SH_OUTER;
-        break;
-    case MT_DEVICE_nGnRnE:
-    case MT_DEVICE_nGnRE:
-        /*
-         * Shareability is ignored for non-Normal memory, Outer is as
-         * good as anything.
-         *
-         * On ARMv8 sharability is ignored and explicitly treated as Outer
-         * Shareable for any device memory type.
-         */
-        e.pt.sh = LPAE_SH_OUTER;
-        break;
-    default:
-        e.pt.sh = LPAE_SH_INNER;  /* Xen mappings are SMP coherent */
-        break;
-    }
-
-    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
-
-    lpae_set_mfn(e, mfn);
-
-    return e;
-}
-
-/* Map a 4k page in a fixmap entry */
-void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
-{
-    int res;
-
-    res = map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags);
-    BUG_ON(res != 0);
-}
-
-/* Remove a mapping from a fixmap entry */
-void clear_fixmap(unsigned int map)
-{
-    int res;
-
-    res = destroy_xen_mappings(FIXMAP_ADDR(map), FIXMAP_ADDR(map) + PAGE_SIZE);
-    BUG_ON(res != 0);
-}
-
 void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
     void *v = map_domain_page(_mfn(mfn));
@@ -733,527 +537,6 @@ void *__init arch_vmap_virt_end(void)
     return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
 }
 
-/*
- * This function should only be used to remap device address ranges
- * TODO: add a check to verify this assumption
- */
-void *ioremap_attr(paddr_t start, size_t len, unsigned int attributes)
-{
-    mfn_t mfn = _mfn(PFN_DOWN(start));
-    unsigned int offs = start & (PAGE_SIZE - 1);
-    unsigned int nr = PFN_UP(offs + len);
-    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
-
-    if ( ptr == NULL )
-        return NULL;
-
-    return ptr + offs;
-}
-
-void *ioremap(paddr_t pa, size_t len)
-{
-    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
-}
-
-static int create_xen_table(lpae_t *entry)
-{
-    mfn_t mfn;
-    void *p;
-    lpae_t pte;
-
-    if ( system_state != SYS_STATE_early_boot )
-    {
-        struct page_info *pg = alloc_domheap_page(NULL, 0);
-
-        if ( pg == NULL )
-            return -ENOMEM;
-
-        mfn = page_to_mfn(pg);
-    }
-    else
-        mfn = alloc_boot_pages(1, 1);
-
-    p = xen_map_table(mfn);
-    clear_page(p);
-    xen_unmap_table(p);
-
-    pte = mfn_to_xen_entry(mfn, MT_NORMAL);
-    pte.pt.table = 1;
-    write_pte(entry, pte);
-    /*
-     * No ISB here. It is deferred to xen_pt_update() as the new table
-     * will not be used for hardware translation table access as part of
-     * the mapping update.
-     */
-
-    return 0;
-}
-
-#define XEN_TABLE_MAP_FAILED 0
-#define XEN_TABLE_SUPER_PAGE 1
-#define XEN_TABLE_NORMAL_PAGE 2
-
-/*
- * Take the currently mapped table, find the corresponding entry,
- * and map the next table, if available.
- *
- * The read_only parameters indicates whether intermediate tables should
- * be allocated when not present.
- *
- * Return values:
- *  XEN_TABLE_MAP_FAILED: Either read_only was set and the entry
- *  was empty, or allocating a new page failed.
- *  XEN_TABLE_NORMAL_PAGE: next level mapped normally
- *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
- */
-static int xen_pt_next_level(bool read_only, unsigned int level,
-                             lpae_t **table, unsigned int offset)
-{
-    lpae_t *entry;
-    int ret;
-    mfn_t mfn;
-
-    entry = *table + offset;
-
-    if ( !lpae_is_valid(*entry) )
-    {
-        if ( read_only )
-            return XEN_TABLE_MAP_FAILED;
-
-        ret = create_xen_table(entry);
-        if ( ret )
-            return XEN_TABLE_MAP_FAILED;
-    }
-
-    /* The function xen_pt_next_level is never called at the 3rd level */
-    if ( lpae_is_mapping(*entry, level) )
-        return XEN_TABLE_SUPER_PAGE;
-
-    mfn = lpae_get_mfn(*entry);
-
-    xen_unmap_table(*table);
-    *table = xen_map_table(mfn);
-
-    return XEN_TABLE_NORMAL_PAGE;
-}
-
-/* Sanity check of the entry */
-static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
-                               unsigned int flags)
-{
-    /* Sanity check when modifying an entry. */
-    if ( (flags & _PAGE_PRESENT) && mfn_eq(mfn, INVALID_MFN) )
-    {
-        /* We don't allow modifying an invalid entry. */
-        if ( !lpae_is_valid(entry) )
-        {
-            mm_printk("Modifying invalid entry is not allowed.\n");
-            return false;
-        }
-
-        /* We don't allow modifying a table entry */
-        if ( !lpae_is_mapping(entry, level) )
-        {
-            mm_printk("Modifying a table entry is not allowed.\n");
-            return false;
-        }
-
-        /* We don't allow changing memory attributes. */
-        if ( entry.pt.ai != PAGE_AI_MASK(flags) )
-        {
-            mm_printk("Modifying memory attributes is not allowed (0x%x -> 0x%x).\n",
-                      entry.pt.ai, PAGE_AI_MASK(flags));
-            return false;
-        }
-
-        /* We don't allow modifying entry with contiguous bit set. */
-        if ( entry.pt.contig )
-        {
-            mm_printk("Modifying entry with contiguous bit set is not allowed.\n");
-            return false;
-        }
-    }
-    /* Sanity check when inserting a mapping */
-    else if ( flags & _PAGE_PRESENT )
-    {
-        /* We should be here with a valid MFN. */
-        ASSERT(!mfn_eq(mfn, INVALID_MFN));
-
-        /*
-         * We don't allow replacing any valid entry.
-         *
-         * Note that the function xen_pt_update() relies on this
-         * assumption and will skip the TLB flush. The function will need
-         * to be updated if the check is relaxed.
-         */
-        if ( lpae_is_valid(entry) )
-        {
-            if ( lpae_is_mapping(entry, level) )
-                mm_printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
-                          mfn_x(lpae_get_mfn(entry)), mfn_x(mfn));
-            else
-                mm_printk("Trying to replace a table with a mapping.\n");
-            return false;
-        }
-    }
-    /* Sanity check when removing a mapping. */
-    else if ( (flags & (_PAGE_PRESENT|_PAGE_POPULATE)) == 0 )
-    {
-        /* We should be here with an invalid MFN. */
-        ASSERT(mfn_eq(mfn, INVALID_MFN));
-
-        /* We don't allow removing a table */
-        if ( lpae_is_table(entry, level) )
-        {
-            mm_printk("Removing a table is not allowed.\n");
-            return false;
-        }
-
-        /* We don't allow removing a mapping with contiguous bit set. */
-        if ( entry.pt.contig )
-        {
-            mm_printk("Removing entry with contiguous bit set is not allowed.\n");
-            return false;
-        }
-    }
-    /* Sanity check when populating the page-table. No check so far. */
-    else
-    {
-        ASSERT(flags & _PAGE_POPULATE);
-        /* We should be here with an invalid MFN */
-        ASSERT(mfn_eq(mfn, INVALID_MFN));
-    }
-
-    return true;
-}
-
-/* Update an entry at the level @target. */
-static int xen_pt_update_entry(mfn_t root, unsigned long virt,
-                               mfn_t mfn, unsigned int target,
-                               unsigned int flags)
-{
-    int rc;
-    unsigned int level;
-    lpae_t *table;
-    /*
-     * The intermediate page tables are read-only when the MFN is not valid
-     * and we are not populating page table.
-     * This means we either modify permissions or remove an entry.
-     */
-    bool read_only = mfn_eq(mfn, INVALID_MFN) && !(flags & _PAGE_POPULATE);
-    lpae_t pte, *entry;
-
-    /* convenience aliases */
-    DECLARE_OFFSETS(offsets, (paddr_t)virt);
-
-    /* _PAGE_POPULATE and _PAGE_PRESENT should never be set together. */
-    ASSERT((flags & (_PAGE_POPULATE|_PAGE_PRESENT)) != (_PAGE_POPULATE|_PAGE_PRESENT));
-
-    table = xen_map_table(root);
-    for ( level = HYP_PT_ROOT_LEVEL; level < target; level++ )
-    {
-        rc = xen_pt_next_level(read_only, level, &table, offsets[level]);
-        if ( rc == XEN_TABLE_MAP_FAILED )
-        {
-            /*
-             * We are here because xen_pt_next_level has failed to map
-             * the intermediate page table (e.g the table does not exist
-             * and the pt is read-only). It is a valid case when
-             * removing a mapping as it may not exist in the page table.
-             * In this case, just ignore it.
-             */
-            if ( flags & (_PAGE_PRESENT|_PAGE_POPULATE) )
-            {
-                mm_printk("%s: Unable to map level %u\n", __func__, level);
-                rc = -ENOENT;
-                goto out;
-            }
-            else
-            {
-                rc = 0;
-                goto out;
-            }
-        }
-        else if ( rc != XEN_TABLE_NORMAL_PAGE )
-            break;
-    }
-
-    if ( level != target )
-    {
-        mm_printk("%s: Shattering superpage is not supported\n", __func__);
-        rc = -EOPNOTSUPP;
-        goto out;
-    }
-
-    entry = table + offsets[level];
-
-    rc = -EINVAL;
-    if ( !xen_pt_check_entry(*entry, mfn, level, flags) )
-        goto out;
-
-    /* If we are only populating page-table, then we are done. */
-    rc = 0;
-    if ( flags & _PAGE_POPULATE )
-        goto out;
-
-    /* We are removing the page */
-    if ( !(flags & _PAGE_PRESENT) )
-        memset(&pte, 0x00, sizeof(pte));
-    else
-    {
-        /* We are inserting a mapping => Create new pte. */
-        if ( !mfn_eq(mfn, INVALID_MFN) )
-        {
-            pte = mfn_to_xen_entry(mfn, PAGE_AI_MASK(flags));
-
-            /*
-             * First and second level pages set pte.pt.table = 0, but
-             * third level entries set pte.pt.table = 1.
-             */
-            pte.pt.table = (level == 3);
-        }
-        else /* We are updating the permission => Copy the current pte. */
-            pte = *entry;
-
-        /* Set permission */
-        pte.pt.ro = PAGE_RO_MASK(flags);
-        pte.pt.xn = PAGE_XN_MASK(flags);
-        /* Set contiguous bit */
-        pte.pt.contig = !!(flags & _PAGE_CONTIG);
-    }
-
-    write_pte(entry, pte);
-    /*
-     * No ISB or TLB flush here. They are deferred to xen_pt_update()
-     * as the entry will not be used as part of the mapping update.
-     */
-
-    rc = 0;
-
-out:
-    xen_unmap_table(table);
-
-    return rc;
-}
-
-/* Return the level where mapping should be done */
-static int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
-                                unsigned int flags)
-{
-    unsigned int level;
-    unsigned long mask;
-
-    /*
-      * Don't take into account the MFN when removing mapping (i.e
-      * MFN_INVALID) to calculate the correct target order.
-      *
-      * Per the Arm Arm, `vfn` and `mfn` must be both superpage aligned.
-      * They are or-ed together and then checked against the size of
-      * each level.
-      *
-      * `left` is not included and checked separately to allow
-      * superpage mapping even if it is not properly aligned (the
-      * user may have asked to map 2MB + 4k).
-      */
-     mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
-     mask |= vfn;
-
-     /*
-      * Always use level 3 mapping unless the caller request block
-      * mapping.
-      */
-     if ( likely(!(flags & _PAGE_BLOCK)) )
-         level = 3;
-     else if ( !(mask & (BIT(FIRST_ORDER, UL) - 1)) &&
-               (nr >= BIT(FIRST_ORDER, UL)) )
-         level = 1;
-     else if ( !(mask & (BIT(SECOND_ORDER, UL) - 1)) &&
-               (nr >= BIT(SECOND_ORDER, UL)) )
-         level = 2;
-     else
-         level = 3;
-
-     return level;
-}
-
-#define XEN_PT_4K_NR_CONTIG 16
-
-/*
- * Check whether the contiguous bit can be set. Return the number of
- * contiguous entry allowed. If not allowed, return 1.
- */
-static unsigned int xen_pt_check_contig(unsigned long vfn, mfn_t mfn,
-                                        unsigned int level, unsigned long left,
-                                        unsigned int flags)
-{
-    unsigned long nr_contig;
-
-    /*
-     * Allow the contiguous bit to set when the caller requests block
-     * mapping.
-     */
-    if ( !(flags & _PAGE_BLOCK) )
-        return 1;
-
-    /*
-     * We don't allow to remove mapping with the contiguous bit set.
-     * So shortcut the logic and directly return 1.
-     */
-    if ( mfn_eq(mfn, INVALID_MFN) )
-        return 1;
-
-    /*
-     * The number of contiguous entries varies depending on the page
-     * granularity used. The logic below assumes 4KB.
-     */
-    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
-
-    /*
-     * In order to enable the contiguous bit, we should have enough entries
-     * to map left and both the virtual and physical address should be
-     * aligned to the size of 16 translation tables entries.
-     */
-    nr_contig = BIT(XEN_PT_LEVEL_ORDER(level), UL) * XEN_PT_4K_NR_CONTIG;
-
-    if ( (left < nr_contig) || ((mfn_x(mfn) | vfn) & (nr_contig - 1)) )
-        return 1;
-
-    return XEN_PT_4K_NR_CONTIG;
-}
-
-static DEFINE_SPINLOCK(xen_pt_lock);
-
-static int xen_pt_update(unsigned long virt,
-                         mfn_t mfn,
-                         /* const on purpose as it is used for TLB flush */
-                         const unsigned long nr_mfns,
-                         unsigned int flags)
-{
-    int rc = 0;
-    unsigned long vfn = virt >> PAGE_SHIFT;
-    unsigned long left = nr_mfns;
-
-    /*
-     * For arm32, page-tables are different on each CPUs. Yet, they share
-     * some common mappings. It is assumed that only common mappings
-     * will be modified with this function.
-     *
-     * XXX: Add a check.
-     */
-    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
-
-    /*
-     * The hardware was configured to forbid mapping both writeable and
-     * executable.
-     * When modifying/creating mapping (i.e _PAGE_PRESENT is set),
-     * prevent any update if this happen.
-     */
-    if ( (flags & _PAGE_PRESENT) && !PAGE_RO_MASK(flags) &&
-         !PAGE_XN_MASK(flags) )
-    {
-        mm_printk("Mappings should not be both Writeable and Executable.\n");
-        return -EINVAL;
-    }
-
-    if ( flags & _PAGE_CONTIG )
-    {
-        mm_printk("_PAGE_CONTIG is an internal only flag.\n");
-        return -EINVAL;
-    }
-
-    if ( !IS_ALIGNED(virt, PAGE_SIZE) )
-    {
-        mm_printk("The virtual address is not aligned to the page-size.\n");
-        return -EINVAL;
-    }
-
-    spin_lock(&xen_pt_lock);
-
-    while ( left )
-    {
-        unsigned int order, level, nr_contig, new_flags;
-
-        level = xen_pt_mapping_level(vfn, mfn, left, flags);
-        order = XEN_PT_LEVEL_ORDER(level);
-
-        ASSERT(left >= BIT(order, UL));
-
-        /*
-         * Check if we can set the contiguous mapping and update the
-         * flags accordingly.
-         */
-        nr_contig = xen_pt_check_contig(vfn, mfn, level, left, flags);
-        new_flags = flags | ((nr_contig > 1) ? _PAGE_CONTIG : 0);
-
-        for ( ; nr_contig > 0; nr_contig-- )
-        {
-            rc = xen_pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level,
-                                     new_flags);
-            if ( rc )
-                break;
-
-            vfn += 1U << order;
-            if ( !mfn_eq(mfn, INVALID_MFN) )
-                mfn = mfn_add(mfn, 1U << order);
-
-            left -= (1U << order);
-        }
-
-        if ( rc )
-            break;
-    }
-
-    /*
-     * The TLBs flush can be safely skipped when a mapping is inserted
-     * as we don't allow mapping replacement (see xen_pt_check_entry()).
-     * Although we still need an ISB to ensure any DSB in
-     * write_pte() will complete because the mapping may be used soon
-     * after.
-     *
-     * For all the other cases, the TLBs will be flushed unconditionally
-     * even if the mapping has failed. This is because we may have
-     * partially modified the PT. This will prevent any unexpected
-     * behavior afterwards.
-     */
-    if ( !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN)) )
-        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
-    else
-        isb();
-
-    spin_unlock(&xen_pt_lock);
-
-    return rc;
-}
-
-int map_pages_to_xen(unsigned long virt,
-                     mfn_t mfn,
-                     unsigned long nr_mfns,
-                     unsigned int flags)
-{
-    return xen_pt_update(virt, mfn, nr_mfns, flags);
-}
-
-int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
-{
-    return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
-}
-
-int destroy_xen_mappings(unsigned long s, unsigned long e)
-{
-    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
-    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
-    ASSERT(s <= e);
-    return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
-}
-
-int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
-{
-    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
-    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
-    ASSERT(s <= e);
-    return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, flags);
-}
-
 /* Release all __init and __initdata ranges to be reused */
 void free_init_memory(void)
 {
diff --git a/xen/arch/arm/mmu/Makefile b/xen/arch/arm/mmu/Makefile
new file mode 100644
index 0000000000..bdfc2e077d
--- /dev/null
+++ b/xen/arch/arm/mmu/Makefile
@@ -0,0 +1 @@
+obj-y += pt.o
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
new file mode 100644
index 0000000000..e6fc5ed45a
--- /dev/null
+++ b/xen/arch/arm/mmu/pt.c
@@ -0,0 +1,736 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/mmu/pt.c
+ *
+ * MMU system page table related functions.
+ */
+
+#include <xen/domain_page.h>
+#include <xen/init.h>
+#include <xen/pfn.h>
+#include <xen/sizes.h>
+#include <xen/vmap.h>
+
+#include <asm/fixmap.h>
+
+#ifdef NDEBUG
+static inline void
+__attribute__ ((__format__ (__printf__, 1, 2)))
+mm_printk(const char *fmt, ...) {}
+#else
+#define mm_printk(fmt, args...)             \
+    do                                      \
+    {                                       \
+        dprintk(XENLOG_ERR, fmt, ## args);  \
+        WARN();                             \
+    } while (0)
+#endif
+
+#ifdef CONFIG_ARM_64
+#define HYP_PT_ROOT_LEVEL 0
+#else
+#define HYP_PT_ROOT_LEVEL 1
+#endif
+
+static lpae_t *xen_map_table(mfn_t mfn)
+{
+    /*
+     * During early boot, map_domain_page() may be unusable. Use the
+     * PMAP to map temporarily a page-table.
+     */
+    if ( system_state == SYS_STATE_early_boot )
+        return pmap_map(mfn);
+
+    return map_domain_page(mfn);
+}
+
+static void xen_unmap_table(const lpae_t *table)
+{
+    /*
+     * During early boot, xen_map_table() will not use map_domain_page()
+     * but the PMAP.
+     */
+    if ( system_state == SYS_STATE_early_boot )
+        pmap_unmap(table);
+    else
+        unmap_domain_page(table);
+}
+
+void dump_pt_walk(paddr_t ttbr, paddr_t addr,
+                  unsigned int root_level,
+                  unsigned int nr_root_tables)
+{
+    static const char *level_strs[4] = { "0TH", "1ST", "2ND", "3RD" };
+    const mfn_t root_mfn = maddr_to_mfn(ttbr);
+    DECLARE_OFFSETS(offsets, addr);
+    lpae_t pte, *mapping;
+    unsigned int level, root_table;
+
+#ifdef CONFIG_ARM_32
+    BUG_ON(root_level < 1);
+#endif
+    BUG_ON(root_level > 3);
+
+    if ( nr_root_tables > 1 )
+    {
+        /*
+         * Concatenated root-level tables. The table number will be
+         * the offset at the previous level. It is not possible to
+         * concatenate a level-0 root.
+         */
+        BUG_ON(root_level == 0);
+        root_table = offsets[root_level - 1];
+        printk("Using concatenated root table %u\n", root_table);
+        if ( root_table >= nr_root_tables )
+        {
+            printk("Invalid root table offset\n");
+            return;
+        }
+    }
+    else
+        root_table = 0;
+
+    mapping = xen_map_table(mfn_add(root_mfn, root_table));
+
+    for ( level = root_level; ; level++ )
+    {
+        if ( offsets[level] > XEN_PT_LPAE_ENTRIES )
+            break;
+
+        pte = mapping[offsets[level]];
+
+        printk("%s[0x%03x] = 0x%"PRIx64"\n",
+               level_strs[level], offsets[level], pte.bits);
+
+        if ( level == 3 || !pte.walk.valid || !pte.walk.table )
+            break;
+
+        /* For next iteration */
+        xen_unmap_table(mapping);
+        mapping = xen_map_table(lpae_get_mfn(pte));
+    }
+
+    xen_unmap_table(mapping);
+}
+
+void dump_hyp_walk(vaddr_t addr)
+{
+    uint64_t ttbr = READ_SYSREG64(TTBR0_EL2);
+
+    printk("Walking Hypervisor VA 0x%"PRIvaddr" "
+           "on CPU%d via TTBR 0x%016"PRIx64"\n",
+           addr, smp_processor_id(), ttbr);
+
+    dump_pt_walk(ttbr, addr, HYP_PT_ROOT_LEVEL, 1);
+}
+
+lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
+{
+    lpae_t e = (lpae_t) {
+        .pt = {
+            .valid = 1,           /* Mappings are present */
+            .table = 0,           /* Set to 1 for links and 4k maps */
+            .ai = attr,
+            .ns = 1,              /* Hyp mode is in the non-secure world */
+            .up = 1,              /* See below */
+            .ro = 0,              /* Assume read-write */
+            .af = 1,              /* No need for access tracking */
+            .ng = 1,              /* Makes TLB flushes easier */
+            .contig = 0,          /* Assume non-contiguous */
+            .xn = 1,              /* No need to execute outside .text */
+            .avail = 0,           /* Reference count for domheap mapping */
+        }};
+    /*
+     * For EL2 stage-1 page table, up (aka AP[1]) is RES1 as the translation
+     * regime applies to only one exception level (see D4.4.4 and G4.6.1
+     * in ARM DDI 0487B.a). If this changes, remember to update the
+     * hard-coded values in head.S too.
+     */
+
+    switch ( attr )
+    {
+    case MT_NORMAL_NC:
+        /*
+         * ARM ARM: Overlaying the shareability attribute (DDI
+         * 0406C.b B3-1376 to 1377)
+         *
+         * A memory region with a resultant memory type attribute of Normal,
+         * and a resultant cacheability attribute of Inner Non-cacheable,
+         * Outer Non-cacheable, must have a resultant shareability attribute
+         * of Outer Shareable, otherwise shareability is UNPREDICTABLE.
+         *
+         * On ARMv8 sharability is ignored and explicitly treated as Outer
+         * Shareable for Normal Inner Non_cacheable, Outer Non-cacheable.
+         */
+        e.pt.sh = LPAE_SH_OUTER;
+        break;
+    case MT_DEVICE_nGnRnE:
+    case MT_DEVICE_nGnRE:
+        /*
+         * Shareability is ignored for non-Normal memory, Outer is as
+         * good as anything.
+         *
+         * On ARMv8 sharability is ignored and explicitly treated as Outer
+         * Shareable for any device memory type.
+         */
+        e.pt.sh = LPAE_SH_OUTER;
+        break;
+    default:
+        e.pt.sh = LPAE_SH_INNER;  /* Xen mappings are SMP coherent */
+        break;
+    }
+
+    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
+
+    lpae_set_mfn(e, mfn);
+
+    return e;
+}
+
+/* Map a 4k page in a fixmap entry */
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
+{
+    int res;
+
+    res = map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags);
+    BUG_ON(res != 0);
+}
+
+/* Remove a mapping from a fixmap entry */
+void clear_fixmap(unsigned int map)
+{
+    int res;
+
+    res = destroy_xen_mappings(FIXMAP_ADDR(map), FIXMAP_ADDR(map) + PAGE_SIZE);
+    BUG_ON(res != 0);
+}
+
+/*
+ * This function should only be used to remap device address ranges
+ * TODO: add a check to verify this assumption
+ */
+void *ioremap_attr(paddr_t start, size_t len, unsigned int attributes)
+{
+    mfn_t mfn = _mfn(PFN_DOWN(start));
+    unsigned int offs = start & (PAGE_SIZE - 1);
+    unsigned int nr = PFN_UP(offs + len);
+    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
+
+    if ( ptr == NULL )
+        return NULL;
+
+    return ptr + offs;
+}
+
+void *ioremap(paddr_t pa, size_t len)
+{
+    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
+}
+
+static int create_xen_table(lpae_t *entry)
+{
+    mfn_t mfn;
+    void *p;
+    lpae_t pte;
+
+    if ( system_state != SYS_STATE_early_boot )
+    {
+        struct page_info *pg = alloc_domheap_page(NULL, 0);
+
+        if ( pg == NULL )
+            return -ENOMEM;
+
+        mfn = page_to_mfn(pg);
+    }
+    else
+        mfn = alloc_boot_pages(1, 1);
+
+    p = xen_map_table(mfn);
+    clear_page(p);
+    xen_unmap_table(p);
+
+    pte = mfn_to_xen_entry(mfn, MT_NORMAL);
+    pte.pt.table = 1;
+    write_pte(entry, pte);
+    /*
+     * No ISB here. It is deferred to xen_pt_update() as the new table
+     * will not be used for hardware translation table access as part of
+     * the mapping update.
+     */
+
+    return 0;
+}
+
+#define XEN_TABLE_MAP_FAILED 0
+#define XEN_TABLE_SUPER_PAGE 1
+#define XEN_TABLE_NORMAL_PAGE 2
+
+/*
+ * Take the currently mapped table, find the corresponding entry,
+ * and map the next table, if available.
+ *
+ * The read_only parameters indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  XEN_TABLE_MAP_FAILED: Either read_only was set and the entry
+ *  was empty, or allocating a new page failed.
+ *  XEN_TABLE_NORMAL_PAGE: next level mapped normally
+ *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
+ */
+static int xen_pt_next_level(bool read_only, unsigned int level,
+                             lpae_t **table, unsigned int offset)
+{
+    lpae_t *entry;
+    int ret;
+    mfn_t mfn;
+
+    entry = *table + offset;
+
+    if ( !lpae_is_valid(*entry) )
+    {
+        if ( read_only )
+            return XEN_TABLE_MAP_FAILED;
+
+        ret = create_xen_table(entry);
+        if ( ret )
+            return XEN_TABLE_MAP_FAILED;
+    }
+
+    /* The function xen_pt_next_level is never called at the 3rd level */
+    if ( lpae_is_mapping(*entry, level) )
+        return XEN_TABLE_SUPER_PAGE;
+
+    mfn = lpae_get_mfn(*entry);
+
+    xen_unmap_table(*table);
+    *table = xen_map_table(mfn);
+
+    return XEN_TABLE_NORMAL_PAGE;
+}
+
+/* Sanity check of the entry */
+static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
+                               unsigned int flags)
+{
+    /* Sanity check when modifying an entry. */
+    if ( (flags & _PAGE_PRESENT) && mfn_eq(mfn, INVALID_MFN) )
+    {
+        /* We don't allow modifying an invalid entry. */
+        if ( !lpae_is_valid(entry) )
+        {
+            mm_printk("Modifying invalid entry is not allowed.\n");
+            return false;
+        }
+
+        /* We don't allow modifying a table entry */
+        if ( !lpae_is_mapping(entry, level) )
+        {
+            mm_printk("Modifying a table entry is not allowed.\n");
+            return false;
+        }
+
+        /* We don't allow changing memory attributes. */
+        if ( entry.pt.ai != PAGE_AI_MASK(flags) )
+        {
+            mm_printk("Modifying memory attributes is not allowed (0x%x -> 0x%x).\n",
+                      entry.pt.ai, PAGE_AI_MASK(flags));
+            return false;
+        }
+
+        /* We don't allow modifying entry with contiguous bit set. */
+        if ( entry.pt.contig )
+        {
+            mm_printk("Modifying entry with contiguous bit set is not allowed.\n");
+            return false;
+        }
+    }
+    /* Sanity check when inserting a mapping */
+    else if ( flags & _PAGE_PRESENT )
+    {
+        /* We should be here with a valid MFN. */
+        ASSERT(!mfn_eq(mfn, INVALID_MFN));
+
+        /*
+         * We don't allow replacing any valid entry.
+         *
+         * Note that the function xen_pt_update() relies on this
+         * assumption and will skip the TLB flush. The function will need
+         * to be updated if the check is relaxed.
+         */
+        if ( lpae_is_valid(entry) )
+        {
+            if ( lpae_is_mapping(entry, level) )
+                mm_printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
+                          mfn_x(lpae_get_mfn(entry)), mfn_x(mfn));
+            else
+                mm_printk("Trying to replace a table with a mapping.\n");
+            return false;
+        }
+    }
+    /* Sanity check when removing a mapping. */
+    else if ( (flags & (_PAGE_PRESENT|_PAGE_POPULATE)) == 0 )
+    {
+        /* We should be here with an invalid MFN. */
+        ASSERT(mfn_eq(mfn, INVALID_MFN));
+
+        /* We don't allow removing a table */
+        if ( lpae_is_table(entry, level) )
+        {
+            mm_printk("Removing a table is not allowed.\n");
+            return false;
+        }
+
+        /* We don't allow removing a mapping with contiguous bit set. */
+        if ( entry.pt.contig )
+        {
+            mm_printk("Removing entry with contiguous bit set is not allowed.\n");
+            return false;
+        }
+    }
+    /* Sanity check when populating the page-table. No check so far. */
+    else
+    {
+        ASSERT(flags & _PAGE_POPULATE);
+        /* We should be here with an invalid MFN */
+        ASSERT(mfn_eq(mfn, INVALID_MFN));
+    }
+
+    return true;
+}
+
+/* Update an entry at the level @target. */
+static int xen_pt_update_entry(mfn_t root, unsigned long virt,
+                               mfn_t mfn, unsigned int target,
+                               unsigned int flags)
+{
+    int rc;
+    unsigned int level;
+    lpae_t *table;
+    /*
+     * The intermediate page tables are read-only when the MFN is not valid
+     * and we are not populating page table.
+     * This means we either modify permissions or remove an entry.
+     */
+    bool read_only = mfn_eq(mfn, INVALID_MFN) && !(flags & _PAGE_POPULATE);
+    lpae_t pte, *entry;
+
+    /* convenience aliases */
+    DECLARE_OFFSETS(offsets, (paddr_t)virt);
+
+    /* _PAGE_POPULATE and _PAGE_PRESENT should never be set together. */
+    ASSERT((flags & (_PAGE_POPULATE|_PAGE_PRESENT)) != (_PAGE_POPULATE|_PAGE_PRESENT));
+
+    table = xen_map_table(root);
+    for ( level = HYP_PT_ROOT_LEVEL; level < target; level++ )
+    {
+        rc = xen_pt_next_level(read_only, level, &table, offsets[level]);
+        if ( rc == XEN_TABLE_MAP_FAILED )
+        {
+            /*
+             * We are here because xen_pt_next_level has failed to map
+             * the intermediate page table (e.g the table does not exist
+             * and the pt is read-only). It is a valid case when
+             * removing a mapping as it may not exist in the page table.
+             * In this case, just ignore it.
+             */
+            if ( flags & (_PAGE_PRESENT|_PAGE_POPULATE) )
+            {
+                mm_printk("%s: Unable to map level %u\n", __func__, level);
+                rc = -ENOENT;
+                goto out;
+            }
+            else
+            {
+                rc = 0;
+                goto out;
+            }
+        }
+        else if ( rc != XEN_TABLE_NORMAL_PAGE )
+            break;
+    }
+
+    if ( level != target )
+    {
+        mm_printk("%s: Shattering superpage is not supported\n", __func__);
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    entry = table + offsets[level];
+
+    rc = -EINVAL;
+    if ( !xen_pt_check_entry(*entry, mfn, level, flags) )
+        goto out;
+
+    /* If we are only populating page-table, then we are done. */
+    rc = 0;
+    if ( flags & _PAGE_POPULATE )
+        goto out;
+
+    /* We are removing the page */
+    if ( !(flags & _PAGE_PRESENT) )
+        memset(&pte, 0x00, sizeof(pte));
+    else
+    {
+        /* We are inserting a mapping => Create new pte. */
+        if ( !mfn_eq(mfn, INVALID_MFN) )
+        {
+            pte = mfn_to_xen_entry(mfn, PAGE_AI_MASK(flags));
+
+            /*
+             * First and second level pages set pte.pt.table = 0, but
+             * third level entries set pte.pt.table = 1.
+             */
+            pte.pt.table = (level == 3);
+        }
+        else /* We are updating the permission => Copy the current pte. */
+            pte = *entry;
+
+        /* Set permission */
+        pte.pt.ro = PAGE_RO_MASK(flags);
+        pte.pt.xn = PAGE_XN_MASK(flags);
+        /* Set contiguous bit */
+        pte.pt.contig = !!(flags & _PAGE_CONTIG);
+    }
+
+    write_pte(entry, pte);
+    /*
+     * No ISB or TLB flush here. They are deferred to xen_pt_update()
+     * as the entry will not be used as part of the mapping update.
+     */
+
+    rc = 0;
+
+out:
+    xen_unmap_table(table);
+
+    return rc;
+}
+
+/* Return the level where mapping should be done */
+static int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
+                                unsigned int flags)
+{
+    unsigned int level;
+    unsigned long mask;
+
+    /*
+      * Don't take into account the MFN when removing mapping (i.e
+      * MFN_INVALID) to calculate the correct target order.
+      *
+      * Per the Arm Arm, `vfn` and `mfn` must be both superpage aligned.
+      * They are or-ed together and then checked against the size of
+      * each level.
+      *
+      * `left` is not included and checked separately to allow
+      * superpage mapping even if it is not properly aligned (the
+      * user may have asked to map 2MB + 4k).
+      */
+     mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
+     mask |= vfn;
+
+     /*
+      * Always use level 3 mapping unless the caller request block
+      * mapping.
+      */
+     if ( likely(!(flags & _PAGE_BLOCK)) )
+         level = 3;
+     else if ( !(mask & (BIT(FIRST_ORDER, UL) - 1)) &&
+               (nr >= BIT(FIRST_ORDER, UL)) )
+         level = 1;
+     else if ( !(mask & (BIT(SECOND_ORDER, UL) - 1)) &&
+               (nr >= BIT(SECOND_ORDER, UL)) )
+         level = 2;
+     else
+         level = 3;
+
+     return level;
+}
+
+#define XEN_PT_4K_NR_CONTIG 16
+
+/*
+ * Check whether the contiguous bit can be set. Return the number of
+ * contiguous entry allowed. If not allowed, return 1.
+ */
+static unsigned int xen_pt_check_contig(unsigned long vfn, mfn_t mfn,
+                                        unsigned int level, unsigned long left,
+                                        unsigned int flags)
+{
+    unsigned long nr_contig;
+
+    /*
+     * Allow the contiguous bit to set when the caller requests block
+     * mapping.
+     */
+    if ( !(flags & _PAGE_BLOCK) )
+        return 1;
+
+    /*
+     * We don't allow to remove mapping with the contiguous bit set.
+     * So shortcut the logic and directly return 1.
+     */
+    if ( mfn_eq(mfn, INVALID_MFN) )
+        return 1;
+
+    /*
+     * The number of contiguous entries varies depending on the page
+     * granularity used. The logic below assumes 4KB.
+     */
+    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
+
+    /*
+     * In order to enable the contiguous bit, we should have enough entries
+     * to map left and both the virtual and physical address should be
+     * aligned to the size of 16 translation tables entries.
+     */
+    nr_contig = BIT(XEN_PT_LEVEL_ORDER(level), UL) * XEN_PT_4K_NR_CONTIG;
+
+    if ( (left < nr_contig) || ((mfn_x(mfn) | vfn) & (nr_contig - 1)) )
+        return 1;
+
+    return XEN_PT_4K_NR_CONTIG;
+}
+
+static DEFINE_SPINLOCK(xen_pt_lock);
+
+static int xen_pt_update(unsigned long virt,
+                         mfn_t mfn,
+                         /* const on purpose as it is used for TLB flush */
+                         const unsigned long nr_mfns,
+                         unsigned int flags)
+{
+    int rc = 0;
+    unsigned long vfn = virt >> PAGE_SHIFT;
+    unsigned long left = nr_mfns;
+
+    /*
+     * For arm32, page-tables are different on each CPUs. Yet, they share
+     * some common mappings. It is assumed that only common mappings
+     * will be modified with this function.
+     *
+     * XXX: Add a check.
+     */
+    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
+
+    /*
+     * The hardware was configured to forbid mapping both writeable and
+     * executable.
+     * When modifying/creating mapping (i.e _PAGE_PRESENT is set),
+     * prevent any update if this happen.
+     */
+    if ( (flags & _PAGE_PRESENT) && !PAGE_RO_MASK(flags) &&
+         !PAGE_XN_MASK(flags) )
+    {
+        mm_printk("Mappings should not be both Writeable and Executable.\n");
+        return -EINVAL;
+    }
+
+    if ( flags & _PAGE_CONTIG )
+    {
+        mm_printk("_PAGE_CONTIG is an internal only flag.\n");
+        return -EINVAL;
+    }
+
+    if ( !IS_ALIGNED(virt, PAGE_SIZE) )
+    {
+        mm_printk("The virtual address is not aligned to the page-size.\n");
+        return -EINVAL;
+    }
+
+    spin_lock(&xen_pt_lock);
+
+    while ( left )
+    {
+        unsigned int order, level, nr_contig, new_flags;
+
+        level = xen_pt_mapping_level(vfn, mfn, left, flags);
+        order = XEN_PT_LEVEL_ORDER(level);
+
+        ASSERT(left >= BIT(order, UL));
+
+        /*
+         * Check if we can set the contiguous mapping and update the
+         * flags accordingly.
+         */
+        nr_contig = xen_pt_check_contig(vfn, mfn, level, left, flags);
+        new_flags = flags | ((nr_contig > 1) ? _PAGE_CONTIG : 0);
+
+        for ( ; nr_contig > 0; nr_contig-- )
+        {
+            rc = xen_pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level,
+                                     new_flags);
+            if ( rc )
+                break;
+
+            vfn += 1U << order;
+            if ( !mfn_eq(mfn, INVALID_MFN) )
+                mfn = mfn_add(mfn, 1U << order);
+
+            left -= (1U << order);
+        }
+
+        if ( rc )
+            break;
+    }
+
+    /*
+     * The TLBs flush can be safely skipped when a mapping is inserted
+     * as we don't allow mapping replacement (see xen_pt_check_entry()).
+     * Although we still need an ISB to ensure any DSB in
+     * write_pte() will complete because the mapping may be used soon
+     * after.
+     *
+     * For all the other cases, the TLBs will be flushed unconditionally
+     * even if the mapping has failed. This is because we may have
+     * partially modified the PT. This will prevent any unexpected
+     * behavior afterwards.
+     */
+    if ( !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN)) )
+        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
+    else
+        isb();
+
+    spin_unlock(&xen_pt_lock);
+
+    return rc;
+}
+
+int map_pages_to_xen(unsigned long virt,
+                     mfn_t mfn,
+                     unsigned long nr_mfns,
+                     unsigned int flags)
+{
+    return xen_pt_update(virt, mfn, nr_mfns, flags);
+}
+
+int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+{
+    return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
+}
+
+int destroy_xen_mappings(unsigned long s, unsigned long e)
+{
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
+    ASSERT(s <= e);
+    return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
+}
+
+int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
+{
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
+    ASSERT(s <= e);
+    return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, flags);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1


