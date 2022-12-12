Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB454649B7F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 10:55:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459265.717033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fX8-0005Hl-Rj; Mon, 12 Dec 2022 09:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459265.717033; Mon, 12 Dec 2022 09:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fX8-0005BO-DF; Mon, 12 Dec 2022 09:55:38 +0000
Received: by outflank-mailman (input) for mailman id 459265;
 Mon, 12 Dec 2022 09:55:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fX7-00056q-Dt
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:55:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fX7-0001Tn-6g; Mon, 12 Dec 2022 09:55:37 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fX6-0001lz-SD; Mon, 12 Dec 2022 09:55:37 +0000
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
	bh=pVEHru+1CtSdyMmbPddZjEdJ+KHD70SICai9fj43B/4=; b=onZgKwiZwf80GeQFs1sv86LS9Z
	tmQhkrvofKU9jPnomm1uvOvnwJw8C0w3FyFyNuoqabA9HzLbk4ylmX7jAQqQAa7ApNAmCVfL74UHf
	J9kZPnbY85L3oL/EOzb/D9WTSuEP4w37xLUBSbgyKqTem4ROmeI6nsMC6q+damxfAjRc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 09/18] xen/arm32: head: Remove restriction where to load Xen
Date: Mon, 12 Dec 2022 09:55:14 +0000
Message-Id: <20221212095523.52683-10-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212095523.52683-1-julien@xen.org>
References: <20221212095523.52683-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, bootloaders can load Xen anywhere in memory but the
region 2MB - 4MB. While I am not aware of any issue, we have no way
to tell the bootloader to avoid that region.

In addition to that, in the future, Xen may grow over 2MB if we
enable feature like UBSAN or GCOV. To avoid widening the restriction
on the load address, it would be better to get rid of it.

When the identity mapping is clashing with the Xen runtime mapping,
we need an extra indirection to be able to replace the identity
mapping with the Xen runtime mapping.

Reserve a new memory region that will be used to temporarily map Xen.
For convenience, the new area is re-using the same first slot as the
domheap which is used for per-cpu temporary mapping after a CPU has
booted.

Furthermore, directly map boot_second (which cover Xen and more)
to the temporary area. This will avoid to allocate an extra page-table
for the second-level and will helpful for follow-up patches (we will
want to use the fixmap whilst in the temporary mapping).

Lastly, some part of the code now needs to know whether the temporary
mapping was created. So reserve r12 to store this information.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
    Changes in v3:
        - Remove the ASSERT() in init_domheap_mappings() because it was
          bogus (secondary CPU root tables are initialized to the CPU0
          root table so the entry will be valid). Also, it is not
          related to this patch as the CPU0 root table are rebuilt
          during boot. The ASSERT() will be re-introduced later.

    Changes in v2:
        - Patch added
---
 xen/arch/arm/arm32/head.S         | 139 ++++++++++++++++++++++++++----
 xen/arch/arm/domain_page.c        |   1 +
 xen/arch/arm/include/asm/config.h |  14 +++
 xen/arch/arm/mm.c                 |  14 +++
 4 files changed, 153 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 315abbbaebec..50adb887ceaf 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -35,6 +35,9 @@
 #define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
 #define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
 
+/* Offset between the early boot xen mapping and the runtime xen mapping */
+#define XEN_TEMPORARY_OFFSET      (TEMPORARY_XEN_VIRT_START - XEN_VIRT_START)
+
 #if defined(CONFIG_EARLY_PRINTK) && defined(CONFIG_EARLY_PRINTK_INC)
 #include CONFIG_EARLY_PRINTK_INC
 #endif
@@ -94,7 +97,7 @@
  *   r9  - paddr(start)
  *   r10 - phys offset
  *   r11 - UART address
- *   r12 -
+ *   r12 - Temporary mapping created
  *   r13 - SP
  *   r14 - LR
  *   r15 - PC
@@ -445,6 +448,9 @@ ENDPROC(cpu_init)
  *   r9 : paddr(start)
  *   r10: phys offset
  *
+ * Output:
+ *   r12: Was a temporary mapping created?
+ *
  * Clobbers r0 - r4, r6
  *
  * Register usage within this function:
@@ -484,7 +490,11 @@ create_page_tables:
         /*
          * Setup the 1:1 mapping so we can turn the MMU on. Note that
          * only the first page of Xen will be part of the 1:1 mapping.
+         *
+         * In all the cases, we will link boot_third_id. So create the
+         * mapping in advance.
          */
+        create_mapping_entry boot_third_id, r9, r9
 
         /*
          * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
@@ -501,8 +511,7 @@ create_page_tables:
         /*
          * Find the second slot used. If the slot is XEN_SECOND_SLOT, then the
          * 1:1 mapping will use its own set of page-tables from the
-         * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to handle
-         * it.
+         * third level.
          */
         get_table_slot r1, r9, 2     /* r1 := second slot */
         cmp   r1, #XEN_SECOND_SLOT
@@ -513,13 +522,33 @@ create_page_tables:
 link_from_second_id:
         create_table_entry boot_second_id, boot_third_id, r9, 2
 link_from_third_id:
-        create_mapping_entry boot_third_id, r9, r9
+        /* Good news, we are not clashing with Xen virtual mapping */
+        mov   r12, #0                /* r12 := temporary mapping not created */
         mov   pc, lr
 
 virtphys_clash:
-        /* Identity map clashes with boot_third, which we cannot handle yet */
-        PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
-        b     fail
+        /*
+         * The identity map clashes with boot_third. Link boot_first_id and
+         * map Xen to a temporary mapping. See switch_to_runtime_mapping
+         * for more details.
+         */
+        PRINT("- Virt and Phys addresses clash  -\r\n")
+        PRINT("- Create temporary mapping -\r\n")
+
+        /*
+         * This will override the link to boot_second in XEN_FIRST_SLOT.
+         * The page-tables are not live yet. So no need to use
+         * break-before-make.
+         */
+        create_table_entry boot_pgtable, boot_second_id, r9, 1
+        create_table_entry boot_second_id, boot_third_id, r9, 2
+
+        /* Map boot_second (cover Xen mappings) to the temporary 1st slot */
+        mov_w r0, TEMPORARY_XEN_VIRT_START
+        create_table_entry boot_pgtable, boot_second, r0, 1
+
+        mov   r12, #1                /* r12 := temporary mapping created */
+        mov   pc, lr
 ENDPROC(create_page_tables)
 
 /*
@@ -528,9 +557,10 @@ ENDPROC(create_page_tables)
  *
  * Inputs:
  *   r9 : paddr(start)
+ *  r12 : Was the temporary mapping created?
  *   lr : Virtual address to return to
  *
- * Clobbers r0 - r3
+ * Clobbers r0 - r5
  */
 enable_mmu:
         PRINT("- Turning on paging -\r\n")
@@ -558,21 +588,79 @@ enable_mmu:
          * The MMU is turned on and we are in the 1:1 mapping. Switch
          * to the runtime mapping.
          */
-        mov_w r0, 1f
-        mov   pc, r0
+        mov   r5, lr                /* Save LR before overwritting it */
+        mov_w lr, 1f                /* Virtual address in the runtime mapping */
+        b     switch_to_runtime_mapping
 1:
+        mov   lr, r5                /* Restore LR */
         /*
-         * The 1:1 map may clash with other parts of the Xen virtual memory
-         * layout. As it is not used anymore, remove it completely to
-         * avoid having to worry about replacing existing mapping
-         * afterwards.
+         * At this point, either the 1:1 map or the temporary mapping
+         * will be present. The former may clash with other parts of the
+         * Xen virtual memory layout. As both of them are not used
+         * anymore, remove them completely to avoid having to worry
+         * about replacing existing mapping afterwards.
          *
          * On return this will jump to the virtual address requested by
          * the caller.
          */
-        b     remove_identity_mapping
+        teq   r12, #0
+        beq   remove_identity_mapping
+        b     remove_temporary_mapping
 ENDPROC(enable_mmu)
 
+/*
+ * Switch to the runtime mapping. The logic depends on whether the
+ * runtime virtual region is clashing with the physical address
+ *
+ *  - If it is not clashing, we can directly jump to the address in
+ *    the runtime mapping.
+ *  - If it is clashing, create_page_tables() would have mapped Xen to
+ *    a temporary virtual address. We need to switch to the temporary
+ *    mapping so we can remove the identity mapping and map Xen at the
+ *    correct position.
+ *
+ * Inputs
+ *    r9: paddr(start)
+ *   r12: Was a temporary mapping created?
+ *    lr: Address in the runtime mapping to jump to
+ *
+ * Clobbers r0 - r4
+ */
+switch_to_runtime_mapping:
+        /*
+         * Jump to the runtime mapping if the virt and phys are not
+         * clashing
+         */
+        teq   r12, #0
+        beq   ready_to_switch
+
+        /* We are still in the 1:1 mapping. Jump to the temporary Virtual address. */
+        mov_w r0, 1f
+        add   r0, r0, #XEN_TEMPORARY_OFFSET /* r0 := address in temporary mapping */
+        mov   pc, r0
+
+1:
+        /* Remove boot_second_id */
+        mov   r2, #0
+        mov   r3, #0
+        adr_l r0, boot_pgtable
+        get_table_slot r1, r9, 1            /* r1 := first slot */
+        lsl   r1, r1, #3                    /* r1 := first slot offset */
+        strd  r2, r3, [r0, r1]
+
+        flush_xen_tlb_local r0
+
+        /* Map boot_second into boot_pgtable */
+        mov_w r0, XEN_VIRT_START
+        create_table_entry boot_pgtable, boot_second, r0, 1
+
+        /* Ensure any page table updates are visible before continuing */
+        dsb   nsh
+
+ready_to_switch:
+        mov   pc, lr
+ENDPROC(switch_to_runtime_mapping)
+
 /*
  * Remove the 1:1 map from the page-tables. It is not easy to keep track
  * where the 1:1 map was mapped, so we will look for the top-level entry
@@ -618,6 +706,27 @@ identity_mapping_removed:
         mov   pc, lr
 ENDPROC(remove_identity_mapping)
 
+/*
+ * Remove the temporary mapping of Xen starting at TEMPORARY_XEN_VIRT_START.
+ *
+ * Clobbers r0 - r1
+ */
+remove_temporary_mapping:
+        /* r2:r3 := invalid page-table entry */
+        mov   r2, #0
+        mov   r3, #0
+
+        adr_l r0, boot_pgtable
+        mov_w r1, TEMPORARY_XEN_VIRT_START
+        get_table_slot r1, r1, 1     /* r1 := first slot */
+        lsl   r1, r1, #3             /* r1 := first slot offset */
+        strd  r2, r3, [r0, r1]
+
+        flush_xen_tlb_local r0
+
+        mov  pc, lr
+ENDPROC(remove_temporary_mapping)
+
 /*
  * Map the UART in the fixmap (when earlyprintk is used) and hook the
  * fixmap table in the page tables.
diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
index b7c02c919064..907fb93d4df0 100644
--- a/xen/arch/arm/domain_page.c
+++ b/xen/arch/arm/domain_page.c
@@ -60,6 +60,7 @@ bool init_domheap_mappings(unsigned int cpu)
     for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
     {
         lpae_t pte = mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
+
         pte.pt.table = 1;
         write_pte(&root[first_idx + i], pte);
     }
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 87851e677701..6c1b762e976d 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -148,6 +148,20 @@
 /* Number of domheap pagetable pages required at the second level (2MB mappings) */
 #define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
 
+/*
+ * The temporary area is overlapping with the domheap area. This may
+ * be used to create an alias of the first slot containing Xen mappings
+ * when turning on/off the MMU.
+ */
+#define TEMPORARY_AREA_FIRST_SLOT    (first_table_offset(DOMHEAP_VIRT_START))
+
+/* Calculate the address in the temporary area */
+#define TEMPORARY_AREA_ADDR(addr)                           \
+     (((addr) & ~XEN_PT_LEVEL_MASK(1)) |                    \
+      (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
+
+#define TEMPORARY_XEN_VIRT_START    TEMPORARY_AREA_ADDR(XEN_VIRT_START)
+
 #else /* ARM_64 */
 
 #define SLOT0_ENTRY_BITS  39
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 630175276f6a..1315a2c87db7 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -167,6 +167,9 @@ static void __init __maybe_unused build_assertions(void)
 #define CHECK_SAME_SLOT(level, virt1, virt2) \
     BUILD_BUG_ON(level##_table_offset(virt1) != level##_table_offset(virt2))
 
+#define CHECK_DIFFERENT_SLOT(level, virt1, virt2) \
+    BUILD_BUG_ON(level##_table_offset(virt1) == level##_table_offset(virt2))
+
 #ifdef CONFIG_ARM_64
     CHECK_SAME_SLOT(zeroeth, XEN_VIRT_START, FIXMAP_ADDR(0));
     CHECK_SAME_SLOT(zeroeth, XEN_VIRT_START, BOOT_FDT_VIRT_START);
@@ -174,7 +177,18 @@ static void __init __maybe_unused build_assertions(void)
     CHECK_SAME_SLOT(first, XEN_VIRT_START, FIXMAP_ADDR(0));
     CHECK_SAME_SLOT(first, XEN_VIRT_START, BOOT_FDT_VIRT_START);
 
+    /*
+     * For arm32, the temporary mapping will re-use the domheap
+     * first slot and the second slots will match.
+     */
+#ifdef CONFIG_ARM_32
+    CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START, DOMHEAP_VIRT_START);
+    CHECK_DIFFERENT_SLOT(first, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
+    CHECK_SAME_SLOT(second, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
+#endif
+
 #undef CHECK_SAME_SLOT
+#undef CHECK_DIFFERENT_SLOT
 }
 
 void dump_pt_walk(paddr_t ttbr, paddr_t addr,
-- 
2.38.1


