Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E69668B57
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:30:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476505.738762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdf-0007yr-3M; Fri, 13 Jan 2023 05:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476505.738762; Fri, 13 Jan 2023 05:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCde-0007s4-UT; Fri, 13 Jan 2023 05:30:02 +0000
Received: by outflank-mailman (input) for mailman id 476505;
 Fri, 13 Jan 2023 05:30:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCdd-0005sJ-FF
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 517a1b38-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:29:58 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B35B1FEC;
 Thu, 12 Jan 2023 21:30:39 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F37C33F587;
 Thu, 12 Jan 2023 21:29:54 -0800 (PST)
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
X-Inumbo-ID: 517a1b38-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v2 06/40] xen/arm64: move MMU related code from head.S to head_mmu.S
Date: Fri, 13 Jan 2023 13:28:39 +0800
Message-Id: <20230113052914.3845596-7-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

There are lots of MMU specific code in head.S. This code will not
be used in MPU systems. If we use #ifdef to gate them, the code
will become messy and hard to maintain. So we move MMU related
code to head_mmu.S, and keep common code still in head.S.

And some assembly macros that will be shared by MMU and MPU later,
we move them to macros.h.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v1 -> v2:
1. Move macros to macros.h
2. Remove the indention modification
3. Duplicate "fail" instead of exporting it.
---
 xen/arch/arm/arm64/Makefile             |   3 +
 xen/arch/arm/arm64/head.S               | 383 ------------------------
 xen/arch/arm/arm64/head_mmu.S           | 372 +++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/macros.h |  51 ++++
 4 files changed, 426 insertions(+), 383 deletions(-)
 create mode 100644 xen/arch/arm/arm64/head_mmu.S

diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 6d507da0d4..22da2f54b5 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -8,6 +8,9 @@ obj-y += domctl.o
 obj-y += domain.o
 obj-y += entry.o
 obj-y += head.o
+ifneq ($(CONFIG_HAS_MPU),y)
+obj-y += head_mmu.o
+endif
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += smc.o
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index b2214bc5e3..5cfa47279b 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -28,17 +28,6 @@
 #include <asm/arm64/efibind.h>
 #endif
 
-#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
-#define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
-#define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
-#define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
-#define PT_DEV_L3 0xe73 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=1 P=1 */
-
-/* Convenience defines to get slot used by Xen mapping. */
-#define XEN_ZEROETH_SLOT    zeroeth_table_offset(XEN_VIRT_START)
-#define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
-#define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
-
 #define __HEAD_FLAG_PAGE_SIZE   ((PAGE_SHIFT - 10) / 2)
 
 #define __HEAD_FLAG_PHYS_BASE   1
@@ -85,57 +74,6 @@
  *  x30 - lr
  */
 
-#ifdef CONFIG_EARLY_PRINTK
-/*
- * Macro to print a string to the UART, if there is one.
- *
- * Clobbers x0 - x3
- */
-#define PRINT(_s)          \
-        mov   x3, lr ;     \
-        adr   x0, 98f ;    \
-        bl    puts    ;    \
-        mov   lr, x3 ;     \
-        RODATA_STR(98, _s)
-
-/*
- * Macro to print the value of register \xb
- *
- * Clobbers x0 - x4
- */
-.macro print_reg xb
-        mov   x0, \xb
-        mov   x4, lr
-        bl    putn
-        mov   lr, x4
-.endm
-
-#else /* CONFIG_EARLY_PRINTK */
-#define PRINT(s)
-
-.macro print_reg xb
-.endm
-
-#endif /* !CONFIG_EARLY_PRINTK */
-
-/*
- * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
- * within the range +/- 4GB of the PC.
- *
- * @dst: destination register (64 bit wide)
- * @sym: name of the symbol
- */
-.macro  adr_l, dst, sym
-        adrp \dst, \sym
-        add  \dst, \dst, :lo12:\sym
-.endm
-
-/* Load the physical address of a symbol into xb */
-.macro load_paddr xb, sym
-        ldr \xb, =\sym
-        add \xb, \xb, x20
-.endm
-
 .section .text.header, "ax", %progbits
 /*.aarch64*/
 
@@ -500,296 +438,6 @@ cpu_init:
         ret
 ENDPROC(cpu_init)
 
-/*
- * Macro to find the slot number at a given page-table level
- *
- * slot:     slot computed
- * virt:     virtual address
- * lvl:      page-table level
- */
-.macro get_table_slot, slot, virt, lvl
-        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
-.endm
-
-/*
- * Macro to create a page table entry in \ptbl to \tbl
- *
- * ptbl:    table symbol where the entry will be created
- * tbl:     table symbol to point to
- * virt:    virtual address
- * lvl:     page-table level
- * tmp1:    scratch register
- * tmp2:    scratch register
- * tmp3:    scratch register
- *
- * Preserves \virt
- * Clobbers \tmp1, \tmp2, \tmp3
- *
- * Also use x20 for the phys offset.
- *
- * Note that all parameters using registers should be distinct.
- */
-.macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
-        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
-
-        load_paddr \tmp2, \tbl
-        mov   \tmp3, #PT_PT                 /* \tmp3 := right for linear PT */
-        orr   \tmp3, \tmp3, \tmp2           /*          + \tlb paddr */
-
-        adr_l \tmp2, \ptbl
-
-        str   \tmp3, [\tmp2, \tmp1, lsl #3]
-.endm
-
-/*
- * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
- * level table (i.e page granularity) is supported.
- *
- * ptbl:     table symbol where the entry will be created
- * virt:    virtual address
- * phys:    physical address (should be page aligned)
- * tmp1:    scratch register
- * tmp2:    scratch register
- * tmp3:    scratch register
- * type:    mapping type. If not specified it will be normal memory (PT_MEM_L3)
- *
- * Preserves \virt, \phys
- * Clobbers \tmp1, \tmp2, \tmp3
- *
- * Note that all parameters using registers should be distinct.
- */
-.macro create_mapping_entry, ptbl, virt, phys, tmp1, tmp2, tmp3, type=PT_MEM_L3
-        and   \tmp3, \phys, #THIRD_MASK     /* \tmp3 := PAGE_ALIGNED(phys) */
-
-        get_table_slot \tmp1, \virt, 3      /* \tmp1 := slot in \tlb */
-
-        mov   \tmp2, #\type                 /* \tmp2 := right for section PT */
-        orr   \tmp2, \tmp2, \tmp3           /*          + PAGE_ALIGNED(phys) */
-
-        adr_l \tmp3, \ptbl
-
-        str   \tmp2, [\tmp3, \tmp1, lsl #3]
-.endm
-
-/*
- * Rebuild the boot pagetable's first-level entries. The structure
- * is described in mm.c.
- *
- * After the CPU enables paging it will add the fixmap mapping
- * to these page tables, however this may clash with the 1:1
- * mapping. So each CPU must rebuild the page tables here with
- * the 1:1 in place.
- *
- * Inputs:
- *   x19: paddr(start)
- *   x20: phys offset
- *
- * Clobbers x0 - x4
- */
-ENTRY(create_page_tables)
-        /* Prepare the page-tables for mapping Xen */
-        ldr   x0, =XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
-        create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
-        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
-
-        /* Map Xen */
-        adr_l x4, boot_third
-
-        lsr   x2, x19, #THIRD_SHIFT  /* Base address for 4K mapping */
-        lsl   x2, x2, #THIRD_SHIFT
-        mov   x3, #PT_MEM_L3         /* x2 := Section map */
-        orr   x2, x2, x3
-
-        /* ... map of vaddr(start) in boot_third */
-        mov   x1, xzr
-1:      str   x2, [x4, x1]           /* Map vaddr(start) */
-        add   x2, x2, #PAGE_SIZE     /* Next page */
-        add   x1, x1, #8             /* Next slot */
-        cmp   x1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512 entries per page */
-        b.lt  1b
-
-        /*
-         * If Xen is loaded at exactly XEN_VIRT_START then we don't
-         * need an additional 1:1 mapping, the virtual mapping will
-         * suffice.
-         */
-        cmp   x19, #XEN_VIRT_START
-        bne   1f
-        ret
-1:
-        /*
-         * Setup the 1:1 mapping so we can turn the MMU on. Note that
-         * only the first page of Xen will be part of the 1:1 mapping.
-         */
-
-        /*
-         * Find the zeroeth slot used. If the slot is not
-         * XEN_ZEROETH_SLOT, then the 1:1 mapping will use its own set of
-         * page-tables from the first level.
-         */
-        get_table_slot x0, x19, 0       /* x0 := zeroeth slot */
-        cmp   x0, #XEN_ZEROETH_SLOT
-        beq   1f
-        create_table_entry boot_pgtable, boot_first_id, x19, 0, x0, x1, x2
-        b     link_from_first_id
-
-1:
-        /*
-         * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
-         * then the 1:1 mapping will use its own set of page-tables from
-         * the second level.
-         */
-        get_table_slot x0, x19, 1      /* x0 := first slot */
-        cmp   x0, #XEN_FIRST_SLOT
-        beq   1f
-        create_table_entry boot_first, boot_second_id, x19, 1, x0, x1, x2
-        b     link_from_second_id
-
-1:
-        /*
-         * Find the second slot used. If the slot is XEN_SECOND_SLOT, then the
-         * 1:1 mapping will use its own set of page-tables from the
-         * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to handle
-         * it.
-         */
-        get_table_slot x0, x19, 2     /* x0 := second slot */
-        cmp   x0, #XEN_SECOND_SLOT
-        beq   virtphys_clash
-        create_table_entry boot_second, boot_third_id, x19, 2, x0, x1, x2
-        b     link_from_third_id
-
-link_from_first_id:
-        create_table_entry boot_first_id, boot_second_id, x19, 1, x0, x1, x2
-link_from_second_id:
-        create_table_entry boot_second_id, boot_third_id, x19, 2, x0, x1, x2
-link_from_third_id:
-        create_mapping_entry boot_third_id, x19, x19, x0, x1, x2
-        ret
-
-virtphys_clash:
-        /* Identity map clashes with boot_third, which we cannot handle yet */
-        PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
-        b     fail
-ENDPROC(create_page_tables)
-
-/*
- * Turn on the Data Cache and the MMU. The function will return on the 1:1
- * mapping. In other word, the caller is responsible to switch to the runtime
- * mapping.
- *
- * Clobbers x0 - x3
- */
-ENTRY(enable_mmu)
-        PRINT("- Turning on paging -\r\n")
-
-        /*
-         * The state of the TLBs is unknown before turning on the MMU.
-         * Flush them to avoid stale one.
-         */
-        tlbi  alle2                  /* Flush hypervisor TLBs */
-        dsb   nsh
-
-        /* Write Xen's PT's paddr into TTBR0_EL2 */
-        load_paddr x0, boot_pgtable
-        msr   TTBR0_EL2, x0
-        isb
-
-        mrs   x0, SCTLR_EL2
-        orr   x0, x0, #SCTLR_Axx_ELx_M  /* Enable MMU */
-        orr   x0, x0, #SCTLR_Axx_ELx_C  /* Enable D-cache */
-        dsb   sy                     /* Flush PTE writes and finish reads */
-        msr   SCTLR_EL2, x0          /* now paging is enabled */
-        isb                          /* Now, flush the icache */
-        ret
-ENDPROC(enable_mmu)
-
-/*
- * Remove the 1:1 map from the page-tables. It is not easy to keep track
- * where the 1:1 map was mapped, so we will look for the top-level entry
- * exclusive to the 1:1 map and remove it.
- *
- * Inputs:
- *   x19: paddr(start)
- *
- * Clobbers x0 - x1
- */
-ENTRY(remove_identity_mapping)
-        /*
-         * Find the zeroeth slot used. Remove the entry from zeroeth
-         * table if the slot is not XEN_ZEROETH_SLOT.
-         */
-        get_table_slot x1, x19, 0       /* x1 := zeroeth slot */
-        cmp   x1, #XEN_ZEROETH_SLOT
-        beq   1f
-        /* It is not in slot XEN_ZEROETH_SLOT, remove the entry. */
-        ldr   x0, =boot_pgtable         /* x0 := root table */
-        str   xzr, [x0, x1, lsl #3]
-        b     identity_mapping_removed
-
-1:
-        /*
-         * Find the first slot used. Remove the entry for the first
-         * table if the slot is not XEN_FIRST_SLOT.
-         */
-        get_table_slot x1, x19, 1       /* x1 := first slot */
-        cmp   x1, #XEN_FIRST_SLOT
-        beq   1f
-        /* It is not in slot XEN_FIRST_SLOT, remove the entry. */
-        ldr   x0, =boot_first           /* x0 := first table */
-        str   xzr, [x0, x1, lsl #3]
-        b     identity_mapping_removed
-
-1:
-        /*
-         * Find the second slot used. Remove the entry for the first
-         * table if the slot is not XEN_SECOND_SLOT.
-         */
-        get_table_slot x1, x19, 2       /* x1 := second slot */
-        cmp   x1, #XEN_SECOND_SLOT
-        beq   identity_mapping_removed
-        /* It is not in slot 1, remove the entry */
-        ldr   x0, =boot_second          /* x0 := second table */
-        str   xzr, [x0, x1, lsl #3]
-
-identity_mapping_removed:
-        /* See asm/arm64/flushtlb.h for the explanation of the sequence. */
-        dsb   nshst
-        tlbi  alle2
-        dsb   nsh
-        isb
-
-        ret
-ENDPROC(remove_identity_mapping)
-
-/*
- * Map the UART in the fixmap (when earlyprintk is used) and hook the
- * fixmap table in the page tables.
- *
- * The fixmap cannot be mapped in create_page_tables because it may
- * clash with the 1:1 mapping.
- *
- * Inputs:
- *   x20: Physical offset
- *   x23: Early UART base physical address
- *
- * Clobbers x0 - x3
- */
-ENTRY(setup_fixmap)
-#ifdef CONFIG_EARLY_PRINTK
-        /* Add UART to the fixmap table */
-        ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
-        create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, type=PT_DEV_L3
-#endif
-        /* Map fixmap into boot_second */
-        ldr   x0, =FIXMAP_ADDR(0)
-        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
-        /* Ensure any page table updates made above have occurred. */
-        dsb   nshst
-
-        ret
-ENDPROC(setup_fixmap)
-
 /*
  * Setup the initial stack and jump to the C world
  *
@@ -818,37 +466,6 @@ fail:   PRINT("- Boot failed -\r\n")
         b     1b
 ENDPROC(fail)
 
-GLOBAL(_end_boot)
-
-/*
- * Switch TTBR
- *
- * x0    ttbr
- *
- * TODO: This code does not comply with break-before-make.
- */
-ENTRY(switch_ttbr)
-        dsb   sy                     /* Ensure the flushes happen before
-                                      * continuing */
-        isb                          /* Ensure synchronization with previous
-                                      * changes to text */
-        tlbi   alle2                 /* Flush hypervisor TLB */
-        ic     iallu                 /* Flush I-cache */
-        dsb    sy                    /* Ensure completion of TLB flush */
-        isb
-
-        msr    TTBR0_EL2, x0
-
-        isb                          /* Ensure synchronization with previous
-                                      * changes to text */
-        tlbi   alle2                 /* Flush hypervisor TLB */
-        ic     iallu                 /* Flush I-cache */
-        dsb    sy                    /* Ensure completion of TLB flush */
-        isb
-
-        ret
-ENDPROC(switch_ttbr)
-
 #ifdef CONFIG_EARLY_PRINTK
 /*
  * Initialize the UART. Should only be called on the boot CPU.
diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
new file mode 100644
index 0000000000..e2c8f07140
--- /dev/null
+++ b/xen/arch/arm/arm64/head_mmu.S
@@ -0,0 +1,372 @@
+/*
+ * xen/arch/arm/head_mmu.S
+ *
+ * Start-of-day code for an ARMv8-A.
+ *
+ * Ian Campbell <ian.campbell@citrix.com>
+ * Copyright (c) 2012 Citrix Systems.
+ *
+ * Based on ARMv7-A head.S by
+ * Tim Deegan <tim@xen.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <asm/page.h>
+#include <asm/early_printk.h>
+
+#define PT_PT     0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
+#define PT_MEM    0xf7d /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=0 P=1 */
+#define PT_MEM_L3 0xf7f /* nG=1 AF=1 SH=11 AP=01 NS=1 ATTR=111 T=1 P=1 */
+#define PT_DEV    0xe71 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=0 P=1 */
+#define PT_DEV_L3 0xe73 /* nG=1 AF=1 SH=10 AP=01 NS=1 ATTR=100 T=1 P=1 */
+
+/* Convenience defines to get slot used by Xen mapping. */
+#define XEN_ZEROETH_SLOT    zeroeth_table_offset(XEN_VIRT_START)
+#define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
+#define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
+
+/*
+ * Macro to find the slot number at a given page-table level
+ *
+ * slot:     slot computed
+ * virt:     virtual address
+ * lvl:      page-table level
+ */
+.macro get_table_slot, slot, virt, lvl
+        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
+.endm
+
+/*
+ * Macro to create a page table entry in \ptbl to \tbl
+ *
+ * ptbl:    table symbol where the entry will be created
+ * tbl:     table symbol to point to
+ * virt:    virtual address
+ * lvl:     page-table level
+ * tmp1:    scratch register
+ * tmp2:    scratch register
+ * tmp3:    scratch register
+ *
+ * Preserves \virt
+ * Clobbers \tmp1, \tmp2, \tmp3
+ *
+ * Also use x20 for the phys offset.
+ *
+ * Note that all parameters using registers should be distinct.
+ */
+.macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
+        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
+
+        load_paddr \tmp2, \tbl
+        mov   \tmp3, #PT_PT                 /* \tmp3 := right for linear PT */
+        orr   \tmp3, \tmp3, \tmp2           /*          + \tlb paddr */
+
+        adr_l \tmp2, \ptbl
+
+        str   \tmp3, [\tmp2, \tmp1, lsl #3]
+.endm
+
+/*
+ * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
+ * level table (i.e page granularity) is supported.
+ *
+ * ptbl:     table symbol where the entry will be created
+ * virt:    virtual address
+ * phys:    physical address (should be page aligned)
+ * tmp1:    scratch register
+ * tmp2:    scratch register
+ * tmp3:    scratch register
+ * type:    mapping type. If not specified it will be normal memory (PT_MEM_L3)
+ *
+ * Preserves \virt, \phys
+ * Clobbers \tmp1, \tmp2, \tmp3
+ *
+ * Note that all parameters using registers should be distinct.
+ */
+.macro create_mapping_entry, ptbl, virt, phys, tmp1, tmp2, tmp3, type=PT_MEM_L3
+        and   \tmp3, \phys, #THIRD_MASK     /* \tmp3 := PAGE_ALIGNED(phys) */
+
+        get_table_slot \tmp1, \virt, 3      /* \tmp1 := slot in \tlb */
+
+        mov   \tmp2, #\type                 /* \tmp2 := right for section PT */
+        orr   \tmp2, \tmp2, \tmp3           /*          + PAGE_ALIGNED(phys) */
+
+        adr_l \tmp3, \ptbl
+
+        str   \tmp2, [\tmp3, \tmp1, lsl #3]
+.endm
+
+.section .text.header, "ax", %progbits
+/*.aarch64*/
+
+/*
+ * Rebuild the boot pagetable's first-level entries. The structure
+ * is described in mm.c.
+ *
+ * After the CPU enables paging it will add the fixmap mapping
+ * to these page tables, however this may clash with the 1:1
+ * mapping. So each CPU must rebuild the page tables here with
+ * the 1:1 in place.
+ *
+ * Inputs:
+ *   x19: paddr(start)
+ *   x20: phys offset
+ *
+ * Clobbers x0 - x4
+ */
+ENTRY(create_page_tables)
+        /* Prepare the page-tables for mapping Xen */
+        ldr   x0, =XEN_VIRT_START
+        create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
+        create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
+        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
+
+        /* Map Xen */
+        adr_l x4, boot_third
+
+        lsr   x2, x19, #THIRD_SHIFT  /* Base address for 4K mapping */
+        lsl   x2, x2, #THIRD_SHIFT
+        mov   x3, #PT_MEM_L3         /* x2 := Section map */
+        orr   x2, x2, x3
+
+        /* ... map of vaddr(start) in boot_third */
+        mov   x1, xzr
+1:      str   x2, [x4, x1]           /* Map vaddr(start) */
+        add   x2, x2, #PAGE_SIZE     /* Next page */
+        add   x1, x1, #8             /* Next slot */
+        cmp   x1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512 entries per page */
+        b.lt  1b
+
+        /*
+         * If Xen is loaded at exactly XEN_VIRT_START then we don't
+         * need an additional 1:1 mapping, the virtual mapping will
+         * suffice.
+         */
+        cmp   x19, #XEN_VIRT_START
+        bne   1f
+        ret
+1:
+        /*
+         * Setup the 1:1 mapping so we can turn the MMU on. Note that
+         * only the first page of Xen will be part of the 1:1 mapping.
+         */
+
+        /*
+         * Find the zeroeth slot used. If the slot is not
+         * XEN_ZEROETH_SLOT, then the 1:1 mapping will use its own set of
+         * page-tables from the first level.
+         */
+        get_table_slot x0, x19, 0       /* x0 := zeroeth slot */
+        cmp   x0, #XEN_ZEROETH_SLOT
+        beq   1f
+        create_table_entry boot_pgtable, boot_first_id, x19, 0, x0, x1, x2
+        b     link_from_first_id
+
+1:
+        /*
+         * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
+         * then the 1:1 mapping will use its own set of page-tables from
+         * the second level.
+         */
+        get_table_slot x0, x19, 1      /* x0 := first slot */
+        cmp   x0, #XEN_FIRST_SLOT
+        beq   1f
+        create_table_entry boot_first, boot_second_id, x19, 1, x0, x1, x2
+        b     link_from_second_id
+
+1:
+        /*
+         * Find the second slot used. If the slot is XEN_SECOND_SLOT, then the
+         * 1:1 mapping will use its own set of page-tables from the
+         * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to handle
+         * it.
+         */
+        get_table_slot x0, x19, 2     /* x0 := second slot */
+        cmp   x0, #XEN_SECOND_SLOT
+        beq   virtphys_clash
+        create_table_entry boot_second, boot_third_id, x19, 2, x0, x1, x2
+        b     link_from_third_id
+
+link_from_first_id:
+        create_table_entry boot_first_id, boot_second_id, x19, 1, x0, x1, x2
+link_from_second_id:
+        create_table_entry boot_second_id, boot_third_id, x19, 2, x0, x1, x2
+link_from_third_id:
+        create_mapping_entry boot_third_id, x19, x19, x0, x1, x2
+        ret
+
+virtphys_clash:
+        /* Identity map clashes with boot_third, which we cannot handle yet */
+        PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
+        b     fail
+ENDPROC(create_page_tables)
+
+/*
+ * Turn on the Data Cache and the MMU. The function will return on the 1:1
+ * mapping. In other word, the caller is responsible to switch to the runtime
+ * mapping.
+ *
+ * Clobbers x0 - x3
+ */
+ENTRY(enable_mmu)
+        PRINT("- Turning on paging -\r\n")
+
+        /*
+         * The state of the TLBs is unknown before turning on the MMU.
+         * Flush them to avoid stale one.
+         */
+        tlbi  alle2                  /* Flush hypervisor TLBs */
+        dsb   nsh
+
+        /* Write Xen's PT's paddr into TTBR0_EL2 */
+        load_paddr x0, boot_pgtable
+        msr   TTBR0_EL2, x0
+        isb
+
+        mrs   x0, SCTLR_EL2
+        orr   x0, x0, #SCTLR_Axx_ELx_M  /* Enable MMU */
+        orr   x0, x0, #SCTLR_Axx_ELx_C  /* Enable D-cache */
+        dsb   sy                     /* Flush PTE writes and finish reads */
+        msr   SCTLR_EL2, x0          /* now paging is enabled */
+        isb                          /* Now, flush the icache */
+        ret
+ENDPROC(enable_mmu)
+
+/*
+ * Remove the 1:1 map from the page-tables. It is not easy to keep track
+ * where the 1:1 map was mapped, so we will look for the top-level entry
+ * exclusive to the 1:1 map and remove it.
+ *
+ * Inputs:
+ *   x19: paddr(start)
+ *
+ * Clobbers x0 - x1
+ */
+ENTRY(remove_identity_mapping)
+        /*
+         * Find the zeroeth slot used. Remove the entry from zeroeth
+         * table if the slot is not XEN_ZEROETH_SLOT.
+         */
+        get_table_slot x1, x19, 0       /* x1 := zeroeth slot */
+        cmp   x1, #XEN_ZEROETH_SLOT
+        beq   1f
+        /* It is not in slot XEN_ZEROETH_SLOT, remove the entry. */
+        ldr   x0, =boot_pgtable         /* x0 := root table */
+        str   xzr, [x0, x1, lsl #3]
+        b     identity_mapping_removed
+
+1:
+        /*
+         * Find the first slot used. Remove the entry for the first
+         * table if the slot is not XEN_FIRST_SLOT.
+         */
+        get_table_slot x1, x19, 1       /* x1 := first slot */
+        cmp   x1, #XEN_FIRST_SLOT
+        beq   1f
+        /* It is not in slot XEN_FIRST_SLOT, remove the entry. */
+        ldr   x0, =boot_first           /* x0 := first table */
+        str   xzr, [x0, x1, lsl #3]
+        b     identity_mapping_removed
+
+1:
+        /*
+         * Find the second slot used. Remove the entry for the first
+         * table if the slot is not XEN_SECOND_SLOT.
+         */
+        get_table_slot x1, x19, 2       /* x1 := second slot */
+        cmp   x1, #XEN_SECOND_SLOT
+        beq   identity_mapping_removed
+        /* It is not in slot 1, remove the entry */
+        ldr   x0, =boot_second          /* x0 := second table */
+        str   xzr, [x0, x1, lsl #3]
+
+identity_mapping_removed:
+        /* See asm/arm64/flushtlb.h for the explanation of the sequence. */
+        dsb   nshst
+        tlbi  alle2
+        dsb   nsh
+        isb
+
+        ret
+ENDPROC(remove_identity_mapping)
+
+/*
+ * Map the UART in the fixmap (when earlyprintk is used) and hook the
+ * fixmap table in the page tables.
+ *
+ * The fixmap cannot be mapped in create_page_tables because it may
+ * clash with the 1:1 mapping.
+ *
+ * Inputs:
+ *   x20: Physical offset
+ *   x23: Early UART base physical address
+ *
+ * Clobbers x0 - x3
+ */
+ENTRY(setup_fixmap)
+#ifdef CONFIG_EARLY_PRINTK
+        /* Add UART to the fixmap table */
+        ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
+        create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, type=PT_DEV_L3
+#endif
+        /* Map fixmap into boot_second */
+        ldr   x0, =FIXMAP_ADDR(0)
+        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
+        /* Ensure any page table updates made above have occurred. */
+        dsb   nshst
+
+        ret
+ENDPROC(setup_fixmap)
+
+/* Fail-stop */
+fail:   PRINT("- Boot failed -\r\n")
+1:      wfe
+        b     1b
+ENDPROC(fail)
+
+GLOBAL(_end_boot)
+
+/*
+ * Switch TTBR
+ *
+ * x0    ttbr
+ *
+ * TODO: This code does not comply with break-before-make.
+ */
+ENTRY(switch_ttbr)
+        dsb   sy                     /* Ensure the flushes happen before
+                                      * continuing */
+        isb                          /* Ensure synchronization with previous
+                                      * changes to text */
+        tlbi   alle2                 /* Flush hypervisor TLB */
+        ic     iallu                 /* Flush I-cache */
+        dsb    sy                    /* Ensure completion of TLB flush */
+        isb
+
+        msr    TTBR0_EL2, x0
+
+        isb                          /* Ensure synchronization with previous
+                                      * changes to text */
+        tlbi   alle2                 /* Flush hypervisor TLB */
+        ic     iallu                 /* Flush I-cache */
+        dsb    sy                    /* Ensure completion of TLB flush */
+        isb
+
+        ret
+ENDPROC(switch_ttbr)
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
index 140e223b4c..f28c124e66 100644
--- a/xen/arch/arm/include/asm/arm64/macros.h
+++ b/xen/arch/arm/include/asm/arm64/macros.h
@@ -32,6 +32,57 @@
         hint    #22
     .endm
 
+#ifdef CONFIG_EARLY_PRINTK
+/*
+ * Macro to print a string to the UART, if there is one.
+ *
+ * Clobbers x0 - x3
+ */
+#define PRINT(_s)          \
+        mov   x3, lr ;     \
+        adr   x0, 98f ;    \
+        bl    puts    ;    \
+        mov   lr, x3 ;     \
+        RODATA_STR(98, _s)
+
+/*
+ * Macro to print the value of register \xb
+ *
+ * Clobbers x0 - x4
+ */
+.macro print_reg xb
+        mov   x0, \xb
+        mov   x4, lr
+        bl    putn
+        mov   lr, x4
+.endm
+
+#else /* CONFIG_EARLY_PRINTK */
+#define PRINT(s)
+
+.macro print_reg xb
+.endm
+
+#endif /* !CONFIG_EARLY_PRINTK */
+
+/*
+ * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
+ * within the range +/- 4GB of the PC.
+ *
+ * @dst: destination register (64 bit wide)
+ * @sym: name of the symbol
+ */
+.macro  adr_l, dst, sym
+        adrp \dst, \sym
+        add  \dst, \dst, :lo12:\sym
+.endm
+
+/* Load the physical address of a symbol into xb */
+.macro load_paddr xb, sym
+        ldr \xb, =\sym
+        add \xb, \xb, x20
+.endm
+
 /*
  * Register aliases.
  */
-- 
2.25.1


