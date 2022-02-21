Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 437144BD90C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:22:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275988.472024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5pr-0004nl-8C; Mon, 21 Feb 2022 10:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275988.472024; Mon, 21 Feb 2022 10:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5pr-0004lL-1A; Mon, 21 Feb 2022 10:22:27 +0000
Received: by outflank-mailman (input) for mailman id 275988;
 Mon, 21 Feb 2022 10:22:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM5pp-0004Fz-7X
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:22:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pp-0002Am-04; Mon, 21 Feb 2022 10:22:25 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5po-00070b-La; Mon, 21 Feb 2022 10:22:24 +0000
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
	bh=kU4hAjZM1wdm5Xqt+UCg0gYAV4Ows97+OkKeN1riEcM=; b=ZRQT9wpIvJ8XngTAuCy2o98Zv9
	F1wRj4oruAZrLEbM/0UUOrDYR2UciO8hAf54JexWiiOk8mOWYwh3cZ7of4mIsgdTqpfOz+c9RfLi2
	arvH2hCu7ArcQQIOflrogwsYwsLDpv66HiawyWafsqv8lIbFtPNXaFE4D1SCU/655ewc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 02/19] xen/arm: lpae: Use the generic helpers to defined the Xen PT helpers
Date: Mon, 21 Feb 2022 10:22:01 +0000
Message-Id: <20220221102218.33785-3-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Currently, Xen PT helpers are only working with 4KB page granularity
and open-code the generic helpers. To allow more flexibility, we can
re-use the generic helpers and pass Xen's page granularity
(PAGE_SHIFT).

As Xen PT helpers are used in both C and assembly, we need to move
the generic helpers definition outside of the !__ASSEMBLY__ section.

Take the opportunity to prefix LPAE_ENTRIES, LPAE_ENTRIES and
LPAE_ENTRIES_MASK with XEN_PT_.

Note the aliases for each level are still kept for the time being so we
can avoid a massive patch to change all the callers.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v3:
      - Prefix the new define with XEN_PT_

    Changes in v2:
        - New patch
---
 xen/arch/arm/arm32/head.S       | 14 +++----
 xen/arch/arm/arm64/head.S       | 14 +++----
 xen/arch/arm/include/asm/lpae.h | 73 ++++++++++++++++++---------------
 xen/arch/arm/mm.c               | 33 ++++++++-------
 xen/arch/arm/p2m.c              | 13 +++---
 5 files changed, 80 insertions(+), 67 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index b5912d381b98..b1d209ea2842 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -375,7 +375,7 @@ ENDPROC(cpu_init)
  */
 .macro create_table_entry, ptbl, tbl, virt, shift, mmu=0
         lsr   r1, \virt, #\shift
-        mov_w r2, LPAE_ENTRY_MASK
+        mov_w r2, XEN_PT_LPAE_ENTRY_MASK
         and   r1, r1, r2             /* r1 := slot in \tlb */
         lsl   r1, r1, #3             /* r1 := slot offset in \tlb */
 
@@ -410,7 +410,7 @@ ENDPROC(cpu_init)
  * and be distinct.
  */
 .macro create_mapping_entry, ptbl, virt, phys, type=PT_MEM_L3, mmu=0
-        mov_w r2, LPAE_ENTRY_MASK
+        mov_w r2, XEN_PT_LPAE_ENTRY_MASK
         lsr   r1, \virt, #THIRD_SHIFT
         and   r1, r1, r2             /* r1 := slot in \tlb */
         lsl   r1, r1, #3             /* r1 := slot offset in \tlb */
@@ -465,7 +465,7 @@ create_page_tables:
 1:      strd  r2, r3, [r4, r1]       /* Map vaddr(start) */
         add   r2, r2, #PAGE_SIZE     /* Next page */
         add   r1, r1, #8             /* Next slot */
-        cmp   r1, #(LPAE_ENTRIES<<3) /* 512*8-byte entries per page */
+        cmp   r1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512*8-byte entries per page */
         blo   1b
 
         /*
@@ -487,7 +487,7 @@ create_page_tables:
          * the second level.
          */
         lsr   r1, r9, #FIRST_SHIFT
-        mov_w r0, LPAE_ENTRY_MASK
+        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
         and   r1, r1, r0              /* r1 := first slot */
         cmp   r1, #XEN_FIRST_SLOT
         beq   1f
@@ -502,7 +502,7 @@ create_page_tables:
          * it.
          */
         lsr   r1, r9, #SECOND_SHIFT
-        mov_w r0, LPAE_ENTRY_MASK
+        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
         and   r1, r1, r0             /* r1 := second slot */
         cmp   r1, #XEN_SECOND_SLOT
         beq   virtphys_clash
@@ -573,7 +573,7 @@ remove_identity_mapping:
          * table if the slot is not XEN_FIRST_SLOT.
          */
         lsr   r1, r9, #FIRST_SHIFT
-        mov_w r0, LPAE_ENTRY_MASK
+        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
         and   r1, r1, r0              /* r1 := first slot */
         cmp   r1, #XEN_FIRST_SLOT
         beq   1f
@@ -589,7 +589,7 @@ remove_identity_mapping:
          * table if the slot is not XEN_SECOND_SLOT.
          */
         lsr   r1, r9, #SECOND_SHIFT
-        mov_w r0, LPAE_ENTRY_MASK
+        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
         and   r1, r1, r0             /* r1 := second slot */
         cmp   r1, #XEN_SECOND_SLOT
         beq   identity_mapping_removed
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 51b00ab0bea6..314b800b3f8e 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -509,7 +509,7 @@ ENDPROC(cpu_init)
  */
 .macro create_table_entry, ptbl, tbl, virt, shift, tmp1, tmp2, tmp3
         lsr   \tmp1, \virt, #\shift
-        and   \tmp1, \tmp1, #LPAE_ENTRY_MASK/* \tmp1 := slot in \tlb */
+        and   \tmp1, \tmp1, #XEN_PT_LPAE_ENTRY_MASK/* \tmp1 := slot in \tlb */
 
         load_paddr \tmp2, \tbl
         mov   \tmp3, #PT_PT                 /* \tmp3 := right for linear PT */
@@ -541,7 +541,7 @@ ENDPROC(cpu_init)
         and   \tmp3, \phys, #THIRD_MASK     /* \tmp3 := PAGE_ALIGNED(phys) */
 
         lsr   \tmp1, \virt, #THIRD_SHIFT
-        and   \tmp1, \tmp1, #LPAE_ENTRY_MASK/* \tmp1 := slot in \tlb */
+        and   \tmp1, \tmp1, #XEN_PT_LPAE_ENTRY_MASK/* \tmp1 := slot in \tlb */
 
         mov   \tmp2, #\type                 /* \tmp2 := right for section PT */
         orr   \tmp2, \tmp2, \tmp3           /*          + PAGE_ALIGNED(phys) */
@@ -586,7 +586,7 @@ create_page_tables:
 1:      str   x2, [x4, x1]           /* Map vaddr(start) */
         add   x2, x2, #PAGE_SIZE     /* Next page */
         add   x1, x1, #8             /* Next slot */
-        cmp   x1, #(LPAE_ENTRIES<<3) /* 512 entries per page */
+        cmp   x1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512 entries per page */
         b.lt  1b
 
         /*
@@ -621,7 +621,7 @@ create_page_tables:
          * the second level.
          */
         lsr   x0, x19, #FIRST_SHIFT
-        and   x0, x0, #LPAE_ENTRY_MASK  /* x0 := first slot */
+        and   x0, x0, #XEN_PT_LPAE_ENTRY_MASK  /* x0 := first slot */
         cmp   x0, #XEN_FIRST_SLOT
         beq   1f
         create_table_entry boot_first, boot_second_id, x19, FIRST_SHIFT, x0, x1, x2
@@ -635,7 +635,7 @@ create_page_tables:
          * it.
          */
         lsr   x0, x19, #SECOND_SHIFT
-        and   x0, x0, #LPAE_ENTRY_MASK  /* x0 := first slot */
+        and   x0, x0, #XEN_PT_LPAE_ENTRY_MASK  /* x0 := first slot */
         cmp   x0, #XEN_SECOND_SLOT
         beq   virtphys_clash
         create_table_entry boot_second, boot_third_id, x19, SECOND_SHIFT, x0, x1, x2
@@ -715,7 +715,7 @@ remove_identity_mapping:
          * table if the slot is not XEN_FIRST_SLOT.
          */
         lsr   x1, x19, #FIRST_SHIFT
-        and   x1, x1, #LPAE_ENTRY_MASK  /* x1 := first slot */
+        and   x1, x1, #XEN_PT_LPAE_ENTRY_MASK  /* x1 := first slot */
         cmp   x1, #XEN_FIRST_SLOT
         beq   1f
         /* It is not in slot XEN_FIRST_SLOT, remove the entry. */
@@ -729,7 +729,7 @@ remove_identity_mapping:
          * table if the slot is not XEN_SECOND_SLOT.
          */
         lsr   x1, x19, #SECOND_SHIFT
-        and   x1, x1, #LPAE_ENTRY_MASK  /* x1 := first slot */
+        and   x1, x1, #XEN_PT_LPAE_ENTRY_MASK  /* x1 := first slot */
         cmp   x1, #XEN_SECOND_SLOT
         beq   identity_mapping_removed
         /* It is not in slot 1, remove the entry */
diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 4fb9a40a4ca9..8cf932b5c947 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -159,6 +159,17 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
 #define lpae_get_mfn(pte)    (_mfn((pte).walk.base))
 #define lpae_set_mfn(pte, mfn)  ((pte).walk.base = mfn_x(mfn))
 
+/* Generate an array @var containing the offset for each level from @addr */
+#define DECLARE_OFFSETS(var, addr)          \
+    const unsigned int var[4] = {           \
+        zeroeth_table_offset(addr),         \
+        first_table_offset(addr),           \
+        second_table_offset(addr),          \
+        third_table_offset(addr)            \
+    }
+
+#endif /* __ASSEMBLY__ */
+
 /*
  * AArch64 supports pages with different sizes (4K, 16K, and 64K).
  * Provide a set of generic helpers that will compute various
@@ -190,17 +201,6 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
 #define LPAE_TABLE_INDEX_GS(gs, lvl, addr)   \
     (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRY_MASK_GS(gs))
 
-/* Generate an array @var containing the offset for each level from @addr */
-#define DECLARE_OFFSETS(var, addr)          \
-    const unsigned int var[4] = {           \
-        zeroeth_table_offset(addr),         \
-        first_table_offset(addr),           \
-        second_table_offset(addr),          \
-        third_table_offset(addr)            \
-    }
-
-#endif /* __ASSEMBLY__ */
-
 /*
  * These numbers add up to a 48-bit input address space.
  *
@@ -211,26 +211,35 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
  * therefore 39-bits are sufficient.
  */
 
-#define LPAE_SHIFT      9
-#define LPAE_ENTRIES    (_AC(1,U) << LPAE_SHIFT)
-#define LPAE_ENTRY_MASK (LPAE_ENTRIES - 1)
-
-#define THIRD_SHIFT    (PAGE_SHIFT)
-#define THIRD_ORDER    (THIRD_SHIFT - PAGE_SHIFT)
-#define THIRD_SIZE     (_AT(paddr_t, 1) << THIRD_SHIFT)
-#define THIRD_MASK     (~(THIRD_SIZE - 1))
-#define SECOND_SHIFT   (THIRD_SHIFT + LPAE_SHIFT)
-#define SECOND_ORDER   (SECOND_SHIFT - PAGE_SHIFT)
-#define SECOND_SIZE    (_AT(paddr_t, 1) << SECOND_SHIFT)
-#define SECOND_MASK    (~(SECOND_SIZE - 1))
-#define FIRST_SHIFT    (SECOND_SHIFT + LPAE_SHIFT)
-#define FIRST_ORDER    (FIRST_SHIFT - PAGE_SHIFT)
-#define FIRST_SIZE     (_AT(paddr_t, 1) << FIRST_SHIFT)
-#define FIRST_MASK     (~(FIRST_SIZE - 1))
-#define ZEROETH_SHIFT  (FIRST_SHIFT + LPAE_SHIFT)
-#define ZEROETH_ORDER  (ZEROETH_SHIFT - PAGE_SHIFT)
-#define ZEROETH_SIZE   (_AT(paddr_t, 1) << ZEROETH_SHIFT)
-#define ZEROETH_MASK   (~(ZEROETH_SIZE - 1))
+#define XEN_PT_LPAE_SHIFT         LPAE_SHIFT_GS(PAGE_SHIFT)
+#define XEN_PT_LPAE_ENTRIES       LPAE_ENTRIES_GS(PAGE_SHIFT)
+#define XEN_PT_LPAE_ENTRY_MASK    LPAE_ENTRY_MASK_GS(PAGE_SHIFT)
+
+#define XEN_PT_LEVEL_SHIFT(lvl)   LEVEL_SHIFT_GS(PAGE_SHIFT, lvl)
+#define XEN_PT_LEVEL_ORDER(lvl)   LEVEL_ORDER_GS(PAGE_SHIFT, lvl)
+#define XEN_PT_LEVEL_SIZE(lvl)    LEVEL_SIZE_GS(PAGE_SHIFT, lvl)
+#define XEN_PT_LEVEL_MASK(lvl)    (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
+
+/* Convenience aliases */
+#define THIRD_SHIFT         XEN_PT_LEVEL_SHIFT(3)
+#define THIRD_ORDER         XEN_PT_LEVEL_ORDER(3)
+#define THIRD_SIZE          XEN_PT_LEVEL_SIZE(3)
+#define THIRD_MASK          XEN_PT_LEVEL_MASK(3)
+
+#define SECOND_SHIFT        XEN_PT_LEVEL_SHIFT(2)
+#define SECOND_ORDER        XEN_PT_LEVEL_ORDER(2)
+#define SECOND_SIZE         XEN_PT_LEVEL_SIZE(2)
+#define SECOND_MASK         XEN_PT_LEVEL_MASK(2)
+
+#define FIRST_SHIFT         XEN_PT_LEVEL_SHIFT(1)
+#define FIRST_ORDER         XEN_PT_LEVEL_ORDER(1)
+#define FIRST_SIZE          XEN_PT_LEVEL_SIZE(1)
+#define FIRST_MASK          XEN_PT_LEVEL_MASK(1)
+
+#define ZEROETH_SHIFT       XEN_PT_LEVEL_SHIFT(0)
+#define ZEROETH_ORDER       XEN_PT_LEVEL_ORDER(0)
+#define ZEROETH_SIZE        XEN_PT_LEVEL_SIZE(0)
+#define ZEROETH_MASK        XEN_PT_LEVEL_MASK(0)
 
 /* Calculate the offsets into the pagetables for a given VA */
 #define zeroeth_linear_offset(va) ((va) >> ZEROETH_SHIFT)
@@ -238,7 +247,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
 #define second_linear_offset(va) ((va) >> SECOND_SHIFT)
 #define third_linear_offset(va) ((va) >> THIRD_SHIFT)
 
-#define TABLE_OFFSET(offs) (_AT(unsigned int, offs) & LPAE_ENTRY_MASK)
+#define TABLE_OFFSET(offs) (_AT(unsigned int, offs) & XEN_PT_LPAE_ENTRY_MASK)
 #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
 #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
 #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b1eae767c27c..515d0906f85b 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -71,10 +71,11 @@ mm_printk(const char *fmt, ...) {}
  *  in C).
  */
 #define DEFINE_BOOT_PAGE_TABLE(name)                                          \
-lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned") name[LPAE_ENTRIES]
+lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")                   \
+    name[XEN_PT_LPAE_ENTRIES]
 
 #define DEFINE_PAGE_TABLES(name, nr)                    \
-lpae_t __aligned(PAGE_SIZE) name[LPAE_ENTRIES * (nr)]
+lpae_t __aligned(PAGE_SIZE) name[XEN_PT_LPAE_ENTRIES * (nr)]
 
 #define DEFINE_PAGE_TABLE(name) DEFINE_PAGE_TABLES(name, 1)
 
@@ -207,7 +208,7 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
 #endif
     BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
-    BUILD_BUG_ON(second_linear_offset(XEN_VIRT_START) >= LPAE_ENTRIES);
+    BUILD_BUG_ON(second_linear_offset(XEN_VIRT_START) >= XEN_PT_LPAE_ENTRIES);
 #ifdef CONFIG_DOMAIN_PAGE
     BUILD_BUG_ON(DOMHEAP_VIRT_START & ~FIRST_MASK);
 #endif
@@ -256,7 +257,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 
     for ( level = root_level; ; level++ )
     {
-        if ( offsets[level] > LPAE_ENTRIES )
+        if ( offsets[level] > XEN_PT_LPAE_ENTRIES )
             break;
 
         pte = mapping[offsets[level]];
@@ -395,15 +396,15 @@ static void __init create_mappings(lpae_t *second,
     ASSERT(!(base_mfn % granularity));
     ASSERT(!(nr_mfns % granularity));
 
-    count = nr_mfns / LPAE_ENTRIES;
+    count = nr_mfns / XEN_PT_LPAE_ENTRIES;
     p = second + second_linear_offset(virt_offset);
     pte = mfn_to_xen_entry(_mfn(base_mfn), MT_NORMAL);
-    if ( granularity == 16 * LPAE_ENTRIES )
+    if ( granularity == 16 * XEN_PT_LPAE_ENTRIES )
         pte.pt.contig = 1;  /* These maps are in 16-entry contiguous chunks. */
     for ( i = 0; i < count; i++ )
     {
         write_pte(p + i, pte);
-        pte.pt.base += 1 << LPAE_SHIFT;
+        pte.pt.base += 1 << XEN_PT_LPAE_SHIFT;
     }
     flush_xen_tlb_local();
 }
@@ -424,7 +425,7 @@ void *map_domain_page(mfn_t mfn)
 {
     unsigned long flags;
     lpae_t *map = this_cpu(xen_dommap);
-    unsigned long slot_mfn = mfn_x(mfn) & ~LPAE_ENTRY_MASK;
+    unsigned long slot_mfn = mfn_x(mfn) & ~XEN_PT_LPAE_ENTRY_MASK;
     vaddr_t va;
     lpae_t pte;
     int i, slot;
@@ -435,7 +436,7 @@ void *map_domain_page(mfn_t mfn)
      * entry is a 2MB superpage pte.  We use the available bits of each
      * PTE as a reference count; when the refcount is zero the slot can
      * be reused. */
-    for ( slot = (slot_mfn >> LPAE_SHIFT) % DOMHEAP_ENTRIES, i = 0;
+    for ( slot = (slot_mfn >> XEN_PT_LPAE_SHIFT) % DOMHEAP_ENTRIES, i = 0;
           i < DOMHEAP_ENTRIES;
           slot = (slot + 1) % DOMHEAP_ENTRIES, i++ )
     {
@@ -477,7 +478,7 @@ void *map_domain_page(mfn_t mfn)
 
     va = (DOMHEAP_VIRT_START
           + (slot << SECOND_SHIFT)
-          + ((mfn_x(mfn) & LPAE_ENTRY_MASK) << THIRD_SHIFT));
+          + ((mfn_x(mfn) & XEN_PT_LPAE_ENTRY_MASK) << THIRD_SHIFT));
 
     /*
      * We may not have flushed this specific subpage at map time,
@@ -513,7 +514,7 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
     unsigned long va = (unsigned long)ptr;
     lpae_t *map = this_cpu(xen_dommap);
     int slot = (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
-    unsigned long offset = (va>>THIRD_SHIFT) & LPAE_ENTRY_MASK;
+    unsigned long offset = (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
 
     if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
         return virt_to_mfn(va);
@@ -654,7 +655,8 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     /* Initialise first level entries, to point to second level entries */
     for ( i = 0; i < 2; i++)
     {
-        p[i] = pte_of_xenaddr((uintptr_t)(xen_second+i*LPAE_ENTRIES));
+        p[i] = pte_of_xenaddr((uintptr_t)(xen_second +
+                                          i * XEN_PT_LPAE_ENTRIES));
         p[i].pt.table = 1;
         p[i].pt.xn = 0;
     }
@@ -663,13 +665,14 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
     {
         p[first_table_offset(DOMHEAP_VIRT_START+i*FIRST_SIZE)]
-            = pte_of_xenaddr((uintptr_t)(cpu0_dommap+i*LPAE_ENTRIES));
+            = pte_of_xenaddr((uintptr_t)(cpu0_dommap +
+                                         i * XEN_PT_LPAE_ENTRIES));
         p[first_table_offset(DOMHEAP_VIRT_START+i*FIRST_SIZE)].pt.table = 1;
     }
 #endif
 
     /* Break up the Xen mapping into 4k pages and protect them separately. */
-    for ( i = 0; i < LPAE_ENTRIES; i++ )
+    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
     {
         vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
 
@@ -768,7 +771,7 @@ int init_secondary_pagetables(int cpu)
      * domheap mapping pages. */
     for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
     {
-        pte = mfn_to_xen_entry(virt_to_mfn(domheap+i*LPAE_ENTRIES),
+        pte = mfn_to_xen_entry(virt_to_mfn(domheap + i * XEN_PT_LPAE_ENTRIES),
                                MT_NORMAL);
         pte.pt.table = 1;
         write_pte(&first[first_table_offset(DOMHEAP_VIRT_START+i*FIRST_SIZE)], pte);
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 02cf852d4cf1..493a1e25879a 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -233,7 +233,8 @@ static lpae_t *p2m_get_root_pointer(struct p2m_domain *p2m,
      * we can't use (P2M_ROOT_LEVEL - 1) because the root level might be
      * 0. Yet we still want to check if all the unused bits are zeroed.
      */
-    root_table = gfn_x(gfn) >> (level_orders[P2M_ROOT_LEVEL] + LPAE_SHIFT);
+    root_table = gfn_x(gfn) >> (level_orders[P2M_ROOT_LEVEL] +
+                                XEN_PT_LPAE_SHIFT);
     if ( root_table >= P2M_ROOT_PAGES )
         return NULL;
 
@@ -773,7 +774,7 @@ static void p2m_free_entry(struct p2m_domain *p2m,
     }
 
     table = map_domain_page(lpae_get_mfn(entry));
-    for ( i = 0; i < LPAE_ENTRIES; i++ )
+    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
         p2m_free_entry(p2m, *(table + i), level + 1);
 
     unmap_domain_page(table);
@@ -827,7 +828,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, lpae_t *entry,
      * We are either splitting a first level 1G page into 512 second level
      * 2M pages, or a second level 2M page into 512 third level 4K pages.
      */
-    for ( i = 0; i < LPAE_ENTRIES; i++ )
+    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
     {
         lpae_t *new_entry = table + i;
 
@@ -850,7 +851,7 @@ static bool p2m_split_superpage(struct p2m_domain *p2m, lpae_t *entry,
     /* Update stats */
     p2m->stats.shattered[level]++;
     p2m->stats.mappings[level]--;
-    p2m->stats.mappings[next_level] += LPAE_ENTRIES;
+    p2m->stats.mappings[next_level] += XEN_PT_LPAE_ENTRIES;
 
     /*
      * Shatter superpage in the page to the level we want to make the
@@ -888,7 +889,7 @@ static int __p2m_set_entry(struct p2m_domain *p2m,
                            p2m_access_t a)
 {
     unsigned int level = 0;
-    unsigned int target = 3 - (page_order / LPAE_SHIFT);
+    unsigned int target = 3 - (page_order / XEN_PT_LPAE_SHIFT);
     lpae_t *entry, *table, orig_pte;
     int rc;
     /* A mapping is removed if the MFN is invalid. */
@@ -1142,7 +1143,7 @@ static void p2m_invalidate_table(struct p2m_domain *p2m, mfn_t mfn)
 
     table = map_domain_page(mfn);
 
-    for ( i = 0; i < LPAE_ENTRIES; i++ )
+    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
     {
         lpae_t pte = table[i];
 
-- 
2.32.0


