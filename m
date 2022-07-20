Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E843057BE02
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 20:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372158.604046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEh5-0004Zt-Fl; Wed, 20 Jul 2022 18:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372158.604046; Wed, 20 Jul 2022 18:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEh5-0004Ua-BK; Wed, 20 Jul 2022 18:45:11 +0000
Received: by outflank-mailman (input) for mailman id 372158;
 Wed, 20 Jul 2022 18:45:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oEEh3-0004FA-UJ
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 18:45:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEh3-00078B-Hq; Wed, 20 Jul 2022 18:45:09 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEh3-000309-74; Wed, 20 Jul 2022 18:45:09 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=5eiQZQZs5fJEBjxXTKP6HOuojy96rusV1MzRtnzOfTg=; b=EtDWPMqUAWteB5yasJHq/KXHVB
	SXLNrFdO5At3cb8XkIxePvaC6EYvRA5p7+aRrP0zMyO0HaQ2CUkn7IkExZJRyunsolSeGzQLEmWYR
	SIMgb4bKXPJZuPVtsgbQpLFgx5lqi3HMYwMJRheXbdM5ROoY9bgGwhQ4MMWsv7JxQ3fk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/5] xen/arm: mm: Move domain_{,un}map_* helpers in a separate file
Date: Wed, 20 Jul 2022 19:44:58 +0100
Message-Id: <20220720184459.51582-5-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220720184459.51582-1-julien@xen.org>
References: <20220720184459.51582-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The file xen/arch/mm.c has been growing quite a lot. It now contains
various independent part of the MM subsytem.

One of them is the helpers to map/unmap a page which is only used
by arm32 and protected by CONFIG_ARCH_MAP_DOMAIN_PAGE. Move them in a
new file xen/arch/arm/domain_page.c.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----
    Changes in v2:
        - Move CONFIG_* to Kconfig is now in a separate patch
---
 xen/arch/arm/Makefile               |   1 +
 xen/arch/arm/domain_page.c          | 193 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/mm.h |   6 +
 xen/arch/arm/include/asm/lpae.h     |  17 +++
 xen/arch/arm/mm.c                   | 198 +---------------------------
 xen/common/Kconfig                  |   3 +
 6 files changed, 222 insertions(+), 196 deletions(-)
 create mode 100644 xen/arch/arm/domain_page.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index bb7a6151c13c..4d076b278b10 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -17,6 +17,7 @@ obj-y += device.o
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += domain_build.init.o
+obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
 obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
new file mode 100644
index 000000000000..63e97730cf57
--- /dev/null
+++ b/xen/arch/arm/domain_page.c
@@ -0,0 +1,193 @@
+#include <xen/mm.h>
+#include <xen/pmap.h>
+#include <xen/vmap.h>
+
+/* Override macros from asm/page.h to make them work with mfn_t */
+#undef virt_to_mfn
+#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
+
+/* cpu0's domheap page tables */
+static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
+
+/*
+ * xen_dommap == pages used by map_domain_page, these pages contain
+ * the second level pagetables which map the domheap region
+ * starting at DOMHEAP_VIRT_START in 2MB chunks.
+ */
+static DEFINE_PER_CPU(lpae_t *, xen_dommap);
+
+/*
+ * Prepare the area that will be used to map domheap pages. They are
+ * mapped in 2MB chunks, so we need to allocate the page-tables up to
+ * the 2nd level.
+ *
+ * The caller should make sure the root page-table for @cpu has been
+ * allocated.
+ */
+bool init_domheap_mappings(unsigned int cpu)
+{
+    unsigned int order = get_order_from_pages(DOMHEAP_SECOND_PAGES);
+    lpae_t *root = per_cpu(xen_pgtable, cpu);
+    unsigned int i, first_idx;
+    lpae_t *domheap;
+    mfn_t mfn;
+
+    ASSERT(root);
+    ASSERT(!per_cpu(xen_dommap, cpu));
+
+    /*
+     * The domheap for cpu0 is before the heap is initialized. So we
+     * need to use pre-allocated pages.
+     */
+    if ( !cpu )
+        domheap = cpu0_dommap;
+    else
+        domheap = alloc_xenheap_pages(order, 0);
+
+    if ( !domheap )
+        return false;
+
+    /* Ensure the domheap has no stray mappings */
+    memset(domheap, 0, DOMHEAP_SECOND_PAGES * PAGE_SIZE);
+
+    /*
+     * Update the first level mapping to reference the local CPUs
+     * domheap mapping pages.
+     */
+    mfn = virt_to_mfn(domheap);
+    first_idx = first_table_offset(DOMHEAP_VIRT_START);
+    for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
+    {
+        lpae_t pte = mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
+        pte.pt.table = 1;
+        write_pte(&root[first_idx + i], pte);
+    }
+
+    per_cpu(xen_dommap, cpu) = domheap;
+
+    return true;
+}
+
+void *map_domain_page_global(mfn_t mfn)
+{
+    return vmap(&mfn, 1);
+}
+
+void unmap_domain_page_global(const void *va)
+{
+    vunmap(va);
+}
+
+/* Map a page of domheap memory */
+void *map_domain_page(mfn_t mfn)
+{
+    unsigned long flags;
+    lpae_t *map = this_cpu(xen_dommap);
+    unsigned long slot_mfn = mfn_x(mfn) & ~XEN_PT_LPAE_ENTRY_MASK;
+    vaddr_t va;
+    lpae_t pte;
+    int i, slot;
+
+    local_irq_save(flags);
+
+    /* The map is laid out as an open-addressed hash table where each
+     * entry is a 2MB superpage pte.  We use the available bits of each
+     * PTE as a reference count; when the refcount is zero the slot can
+     * be reused. */
+    for ( slot = (slot_mfn >> XEN_PT_LPAE_SHIFT) % DOMHEAP_ENTRIES, i = 0;
+          i < DOMHEAP_ENTRIES;
+          slot = (slot + 1) % DOMHEAP_ENTRIES, i++ )
+    {
+        if ( map[slot].pt.avail < 0xf &&
+             map[slot].pt.base == slot_mfn &&
+             map[slot].pt.valid )
+        {
+            /* This slot already points to the right place; reuse it */
+            map[slot].pt.avail++;
+            break;
+        }
+        else if ( map[slot].pt.avail == 0 )
+        {
+            /* Commandeer this 2MB slot */
+            pte = mfn_to_xen_entry(_mfn(slot_mfn), MT_NORMAL);
+            pte.pt.avail = 1;
+            write_pte(map + slot, pte);
+            break;
+        }
+
+    }
+    /* If the map fills up, the callers have misbehaved. */
+    BUG_ON(i == DOMHEAP_ENTRIES);
+
+#ifndef NDEBUG
+    /* Searching the hash could get slow if the map starts filling up.
+     * Cross that bridge when we come to it */
+    {
+        static int max_tries = 32;
+        if ( i >= max_tries )
+        {
+            dprintk(XENLOG_WARNING, "Domheap map is filling: %i tries\n", i);
+            max_tries *= 2;
+        }
+    }
+#endif
+
+    local_irq_restore(flags);
+
+    va = (DOMHEAP_VIRT_START
+          + (slot << SECOND_SHIFT)
+          + ((mfn_x(mfn) & XEN_PT_LPAE_ENTRY_MASK) << THIRD_SHIFT));
+
+    /*
+     * We may not have flushed this specific subpage at map time,
+     * since we only flush the 4k page not the superpage
+     */
+    flush_xen_tlb_range_va_local(va, PAGE_SIZE);
+
+    return (void *)va;
+}
+
+/* Release a mapping taken with map_domain_page() */
+void unmap_domain_page(const void *va)
+{
+    unsigned long flags;
+    lpae_t *map = this_cpu(xen_dommap);
+    int slot = ((unsigned long) va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
+
+    if ( !va )
+        return;
+
+    local_irq_save(flags);
+
+    ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
+    ASSERT(map[slot].pt.avail != 0);
+
+    map[slot].pt.avail--;
+
+    local_irq_restore(flags);
+}
+
+mfn_t domain_page_map_to_mfn(const void *ptr)
+{
+    unsigned long va = (unsigned long)ptr;
+    lpae_t *map = this_cpu(xen_dommap);
+    int slot = (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
+    unsigned long offset = (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
+
+    if ( (va >= VMAP_VIRT_START) && ((va - VMAP_VIRT_START) < VMAP_VIRT_SIZE) )
+        return virt_to_mfn(va);
+
+    ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
+    ASSERT(map[slot].pt.avail != 0);
+
+    return mfn_add(lpae_get_mfn(map[slot]), offset);
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
diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
index 575373aeb985..8bfc906e7178 100644
--- a/xen/arch/arm/include/asm/arm32/mm.h
+++ b/xen/arch/arm/include/asm/arm32/mm.h
@@ -1,6 +1,12 @@
 #ifndef __ARM_ARM32_MM_H__
 #define __ARM_ARM32_MM_H__
 
+#include <xen/percpu.h>
+
+#include <asm/lpae.h>
+
+DECLARE_PER_CPU(lpae_t *, xen_pgtable);
+
 /*
  * Only a limited amount of RAM, called xenheap, is always mapped on ARM32.
  * For convenience always return false.
diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index fc19cbd84772..3fdd5d0de28e 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -261,6 +261,23 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
 #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
 #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
 
+/*
+ * Macros to define page-tables:
+ *  - DEFINE_BOOT_PAGE_TABLE is used to define page-table that are used
+ *  in assembly code before BSS is zeroed.
+ *  - DEFINE_PAGE_TABLE{,S} are used to define one or multiple
+ *  page-tables to be used after BSS is zeroed (typically they are only used
+ *  in C).
+ */
+#define DEFINE_BOOT_PAGE_TABLE(name)                                          \
+lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")                   \
+    name[XEN_PT_LPAE_ENTRIES]
+
+#define DEFINE_PAGE_TABLES(name, nr)                    \
+lpae_t __aligned(PAGE_SIZE) name[XEN_PT_LPAE_ENTRIES * (nr)]
+
+#define DEFINE_PAGE_TABLE(name) DEFINE_PAGE_TABLES(name, 1)
+
 #endif /* __ARM_LPAE_H__ */
 
 /*
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 7a722d6c86c6..ad26ad740308 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -57,23 +57,6 @@ mm_printk(const char *fmt, ...) {}
     } while (0)
 #endif
 
-/*
- * Macros to define page-tables:
- *  - DEFINE_BOOT_PAGE_TABLE is used to define page-table that are used
- *  in assembly code before BSS is zeroed.
- *  - DEFINE_PAGE_TABLE{,S} are used to define one or multiple
- *  page-tables to be used after BSS is zeroed (typically they are only used
- *  in C).
- */
-#define DEFINE_BOOT_PAGE_TABLE(name)                                          \
-lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")                   \
-    name[XEN_PT_LPAE_ENTRIES]
-
-#define DEFINE_PAGE_TABLES(name, nr)                    \
-lpae_t __aligned(PAGE_SIZE) name[XEN_PT_LPAE_ENTRIES * (nr)]
-
-#define DEFINE_PAGE_TABLE(name) DEFINE_PAGE_TABLES(name, 1)
-
 /* Static start-of-day pagetables that we use before the allocators
  * are up. These are used by all CPUs during bringup before switching
  * to the CPUs own pagetables.
@@ -110,7 +93,7 @@ DEFINE_BOOT_PAGE_TABLE(boot_third);
 /* Main runtime page tables */
 
 /*
- * For arm32 xen_pgtable and xen_dommap are per-PCPU and are allocated before
+ * For arm32 xen_pgtable are per-PCPU and are allocated before
  * bringing up each CPU. For arm64 xen_pgtable is common to all PCPUs.
  *
  * xen_second, xen_fixmap and xen_xenmap are always shared between all
@@ -126,18 +109,10 @@ static DEFINE_PAGE_TABLE(xen_first);
 #define HYP_PT_ROOT_LEVEL 1
 /* Per-CPU pagetable pages */
 /* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
-static DEFINE_PER_CPU(lpae_t *, xen_pgtable);
+DEFINE_PER_CPU(lpae_t *, xen_pgtable);
 #define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
-/*
- * xen_dommap == pages used by map_domain_page, these pages contain
- * the second level pagetables which map the domheap region
- * starting at DOMHEAP_VIRT_START in 2MB chunks.
- */
-static DEFINE_PER_CPU(lpae_t *, xen_dommap);
 /* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
 static DEFINE_PAGE_TABLE(cpu0_pgtable);
-/* cpu0's domheap page tables */
-static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
 #endif
 
 /* Common pagetable leaves */
@@ -371,175 +346,6 @@ void clear_fixmap(unsigned int map)
     BUG_ON(res != 0);
 }
 
-#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
-/*
- * Prepare the area that will be used to map domheap pages. They are
- * mapped in 2MB chunks, so we need to allocate the page-tables up to
- * the 2nd level.
- *
- * The caller should make sure the root page-table for @cpu has been
- * allocated.
- */
-bool init_domheap_mappings(unsigned int cpu)
-{
-    unsigned int order = get_order_from_pages(DOMHEAP_SECOND_PAGES);
-    lpae_t *root = per_cpu(xen_pgtable, cpu);
-    unsigned int i, first_idx;
-    lpae_t *domheap;
-    mfn_t mfn;
-
-    ASSERT(root);
-    ASSERT(!per_cpu(xen_dommap, cpu));
-
-    /*
-     * The domheap for cpu0 is before the heap is initialized. So we
-     * need to use pre-allocated pages.
-     */
-    if ( !cpu )
-        domheap = cpu0_dommap;
-    else
-        domheap = alloc_xenheap_pages(order, 0);
-
-    if ( !domheap )
-        return false;
-
-    /* Ensure the domheap has no stray mappings */
-    memset(domheap, 0, DOMHEAP_SECOND_PAGES * PAGE_SIZE);
-
-    /*
-     * Update the first level mapping to reference the local CPUs
-     * domheap mapping pages.
-     */
-    mfn = virt_to_mfn(domheap);
-    first_idx = first_table_offset(DOMHEAP_VIRT_START);
-    for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
-    {
-        lpae_t pte = mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
-        pte.pt.table = 1;
-        write_pte(&root[first_idx + i], pte);
-    }
-
-    per_cpu(xen_dommap, cpu) = domheap;
-
-    return true;
-}
-
-void *map_domain_page_global(mfn_t mfn)
-{
-    return vmap(&mfn, 1);
-}
-
-void unmap_domain_page_global(const void *va)
-{
-    vunmap(va);
-}
-
-/* Map a page of domheap memory */
-void *map_domain_page(mfn_t mfn)
-{
-    unsigned long flags;
-    lpae_t *map = this_cpu(xen_dommap);
-    unsigned long slot_mfn = mfn_x(mfn) & ~XEN_PT_LPAE_ENTRY_MASK;
-    vaddr_t va;
-    lpae_t pte;
-    int i, slot;
-
-    local_irq_save(flags);
-
-    /* The map is laid out as an open-addressed hash table where each
-     * entry is a 2MB superpage pte.  We use the available bits of each
-     * PTE as a reference count; when the refcount is zero the slot can
-     * be reused. */
-    for ( slot = (slot_mfn >> XEN_PT_LPAE_SHIFT) % DOMHEAP_ENTRIES, i = 0;
-          i < DOMHEAP_ENTRIES;
-          slot = (slot + 1) % DOMHEAP_ENTRIES, i++ )
-    {
-        if ( map[slot].pt.avail < 0xf &&
-             map[slot].pt.base == slot_mfn &&
-             map[slot].pt.valid )
-        {
-            /* This slot already points to the right place; reuse it */
-            map[slot].pt.avail++;
-            break;
-        }
-        else if ( map[slot].pt.avail == 0 )
-        {
-            /* Commandeer this 2MB slot */
-            pte = mfn_to_xen_entry(_mfn(slot_mfn), MT_NORMAL);
-            pte.pt.avail = 1;
-            write_pte(map + slot, pte);
-            break;
-        }
-
-    }
-    /* If the map fills up, the callers have misbehaved. */
-    BUG_ON(i == DOMHEAP_ENTRIES);
-
-#ifndef NDEBUG
-    /* Searching the hash could get slow if the map starts filling up.
-     * Cross that bridge when we come to it */
-    {
-        static int max_tries = 32;
-        if ( i >= max_tries )
-        {
-            dprintk(XENLOG_WARNING, "Domheap map is filling: %i tries\n", i);
-            max_tries *= 2;
-        }
-    }
-#endif
-
-    local_irq_restore(flags);
-
-    va = (DOMHEAP_VIRT_START
-          + (slot << SECOND_SHIFT)
-          + ((mfn_x(mfn) & XEN_PT_LPAE_ENTRY_MASK) << THIRD_SHIFT));
-
-    /*
-     * We may not have flushed this specific subpage at map time,
-     * since we only flush the 4k page not the superpage
-     */
-    flush_xen_tlb_range_va_local(va, PAGE_SIZE);
-
-    return (void *)va;
-}
-
-/* Release a mapping taken with map_domain_page() */
-void unmap_domain_page(const void *va)
-{
-    unsigned long flags;
-    lpae_t *map = this_cpu(xen_dommap);
-    int slot = ((unsigned long) va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
-
-    if ( !va )
-        return;
-
-    local_irq_save(flags);
-
-    ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
-    ASSERT(map[slot].pt.avail != 0);
-
-    map[slot].pt.avail--;
-
-    local_irq_restore(flags);
-}
-
-mfn_t domain_page_map_to_mfn(const void *ptr)
-{
-    unsigned long va = (unsigned long)ptr;
-    lpae_t *map = this_cpu(xen_dommap);
-    int slot = (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
-    unsigned long offset = (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
-
-    if ( (va >= VMAP_VIRT_START) && ((va - VMAP_VIRT_START) < VMAP_VIRT_SIZE) )
-        return virt_to_mfn(va);
-
-    ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
-    ASSERT(map[slot].pt.avail != 0);
-
-    return mfn_add(lpae_get_mfn(map[slot]), offset);
-}
-#endif
-
 void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
     void *v = map_domain_page(_mfn(mfn));
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index f1ea3199c8eb..f0aee2cfd9f8 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -11,6 +11,9 @@ config COMPAT
 config CORE_PARKING
 	bool
 
+config DOMAIN_PAGE
+	bool
+
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
 	default y
-- 
2.32.0


