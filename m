Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4300F77B068
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 06:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583059.913111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVP9i-0003Qh-Rx; Mon, 14 Aug 2023 04:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583059.913111; Mon, 14 Aug 2023 04:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVP9i-0003Mk-N2; Mon, 14 Aug 2023 04:26:14 +0000
Received: by outflank-mailman (input) for mailman id 583059;
 Mon, 14 Aug 2023 04:26:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M3t=D7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qVP9h-0002FE-Q3
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 04:26:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b2ecd30d-3a5a-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 06:26:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D92542F4;
 Sun, 13 Aug 2023 21:26:53 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 178E53F64C;
 Sun, 13 Aug 2023 21:26:07 -0700 (PDT)
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
X-Inumbo-ID: b2ecd30d-3a5a-11ee-b288-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v5 04/13] xen/arm64: Split and move MMU-specific head.S to mmu/head.S
Date: Mon, 14 Aug 2023 12:25:27 +0800
Message-Id: <20230814042536.878720-5-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814042536.878720-1-Henry.Wang@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MMU specific code in head.S will not be used on MPU systems.
Instead of introducing more #ifdefs which will bring complexity
to the code, move MMU related code to mmu/head.S and keep common
code in head.S. Two notes while moving:
- As "fail" in original head.S is very simple and this name is too
  easy to be conflicted, duplicate it in mmu/head.S instead of
  exporting it.
- Use ENTRY() for enable_secondary_cpu_mm, enable_boot_cpu_mm and
  setup_fixmap to please the compiler after the code movement.

Also move the assembly macros shared by head.S and mmu/head.S to
macros.h.

Note that, only the first 4KB of Xen image will be mapped as
identity (PA == VA). At the moment, Xen guarantees this by having
everything that needs to be used in the identity mapping in
.text.header section of head.S, and the size will be checked by
_idmap_start and _idmap_end at link time if this fits in 4KB.
Since we are introducing a new head.S in this patch, although
we can add .text.header to the new file to guarantee all identity
map code still in the first 4KB. However, the order of these two
files on this 4KB depends on the build toolchains. Hence, introduce
a new section named .text.idmap in the region between _idmap_start
and _idmap_end. And in Xen linker script, we force the .text.idmap
contents to linked after .text.header. This will ensure code of
head.S always be at the top of Xen binary.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v5:
- Rebase on top of commit
  "xen/arm64: head: Introduce a helper to flush local TLBs".
v4:
- Rework "[v3,08/52] xen/arm64: move MMU related code from
  head.S to mmu/head.S"
- Don't move the "yet to shared" macro such as print_reg.
- Fold "[v3,04/52] xen/arm: add .text.idmap in ld script for Xen
  identity map sections" to this patch. Rework commit msg.
---
 xen/arch/arm/arm64/Makefile             |   1 +
 xen/arch/arm/arm64/head.S               | 492 +-----------------------
 xen/arch/arm/arm64/mmu/Makefile         |   1 +
 xen/arch/arm/arm64/mmu/head.S           | 488 +++++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/macros.h |  36 ++
 xen/arch/arm/xen.lds.S                  |   1 +
 6 files changed, 528 insertions(+), 491 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mmu/Makefile
 create mode 100644 xen/arch/arm/arm64/mmu/head.S

diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 54ad55c75c..f89d5fb4fb 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -1,4 +1,5 @@
 obj-y += lib/
+obj-$(CONFIG_MMU) += mmu/
 
 obj-y += cache.o
 obj-y += cpufeature.o
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index f25a41d36c..3c8a12eda7 100644
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
@@ -85,19 +74,7 @@
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
-        adr_l x0, 98f ;    \
-        bl    asm_puts ;   \
-        mov   lr, x3 ;     \
-        RODATA_STR(98, _s)
-
+ #ifdef CONFIG_EARLY_PRINTK
 /*
  * Macro to print the value of register \xb
  *
@@ -111,43 +88,11 @@
 .endm
 
 #else /* CONFIG_EARLY_PRINTK */
-#define PRINT(s)
-
 .macro print_reg xb
 .endm
 
 #endif /* !CONFIG_EARLY_PRINTK */
 
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
-/*
- * Flush local TLBs
- *
- * See asm/arm64/flushtlb.h for the explanation of the sequence.
- */
-.macro flush_xen_tlb_local
-        dsb   nshst
-        tlbi  alle2
-        dsb   nsh
-        isb
-.endm
-
 .section .text.header, "ax", %progbits
 /*.aarch64*/
 
@@ -484,402 +429,6 @@ cpu_init:
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
- * ptbl:    table symbol where the entry will be created
- * tbl:     physical address of the table to point to
- * virt:    virtual address
- * lvl:     page-table level
- * tmp1:    scratch register
- * tmp2:    scratch register
- *
- * Preserves \virt
- * Clobbers \tbl, \tmp1, \tmp2
- *
- * Note that all parameters using registers should be distinct.
- */
-.macro create_table_entry_from_paddr, ptbl, tbl, virt, lvl, tmp1, tmp2
-        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tbl */
-
-        mov   \tmp2, #PT_PT                 /* \tmp2 := right for linear PT */
-        orr   \tmp2, \tmp2, \tbl            /*          + \tbl */
-
-        adr_l \tbl, \ptbl                   /* \tbl := address(\ptbl) */
-
-        str   \tmp2, [\tbl, \tmp1, lsl #3]
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
-        load_paddr \tmp1, \tbl
-        create_table_entry_from_paddr \ptbl, \tmp1, \virt, \lvl, \tmp2, \tmp3
-.endm
-
-/*
- * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
- * level table (i.e page granularity) is supported.
- *
- * ptbl:    table symbol where the entry will be created
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
-create_page_tables:
-        /* Prepare the page-tables for mapping Xen */
-        ldr   x0, =XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
-        create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
-
-        /*
-         * We need to use a stash register because
-         * create_table_entry_paddr() will clobber the register storing
-         * the physical address of the table to point to.
-         */
-        load_paddr x4, boot_third
-        ldr   x1, =XEN_VIRT_START
-.rept XEN_NR_ENTRIES(2)
-        mov   x0, x4                            /* x0 := paddr(l3 table) */
-        create_table_entry_from_paddr boot_second, x0, x1, 2, x2, x3
-        add   x1, x1, #XEN_PT_LEVEL_SIZE(2)     /* x1 := Next vaddr */
-        add   x4, x4, #PAGE_SIZE                /* x4 := Next table */
-.endr
-
-        /*
-         * Find the size of Xen in pages and multiply by the size of a
-         * PTE. This will then be compared in the mapping loop below.
-         *
-         * Note the multiplication is just to avoid using an extra
-         * register/instruction per iteration.
-         */
-        ldr   x0, =_start            /* x0 := vaddr(_start) */
-        ldr   x1, =_end              /* x1 := vaddr(_end) */
-        sub   x0, x1, x0             /* x0 := effective size of Xen */
-        lsr   x0, x0, #PAGE_SHIFT    /* x0 := Number of pages for Xen */
-        lsl   x0, x0, #3             /* x0 := Number of pages * PTE size */
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
-        cmp   x1, x0                 /* Loop until we map all of Xen */
-        b.lt  1b
-
-        /*
-         * If Xen is loaded at exactly XEN_VIRT_START then we don't
-         * need an additional 1:1 mapping, the virtual mapping will
-         * suffice.
-         */
-        ldr   x0, =XEN_VIRT_START
-        cmp   x19, x0
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
- * Inputs:
- *   x0 : Physical address of the page tables.
- *
- * Clobbers x0 - x4
- */
-enable_mmu:
-        mov   x4, x0
-        PRINT("- Turning on paging -\r\n")
-
-        /*
-         * The state of the TLBs is unknown before turning on the MMU.
-         * Flush them to avoid stale one.
-         */
-        flush_xen_tlb_local
-
-        /* Write Xen's PT's paddr into TTBR0_EL2 */
-        msr   TTBR0_EL2, x4
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
- * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
- * The function will return to the virtual address provided in LR (e.g. the
- * runtime mapping).
- *
- * Inputs:
- *   lr : Virtual address to return to.
- *
- * Clobbers x0 - x5
- */
-enable_secondary_cpu_mm:
-        mov   x5, lr
-
-        load_paddr x0, init_ttbr
-        ldr   x0, [x0]
-
-        bl    enable_mmu
-        mov   lr, x5
-
-        /* Return to the virtual address requested by the caller. */
-        ret
-ENDPROC(enable_secondary_cpu_mm)
-
-/*
- * Enable mm (turn on the data cache and the MMU) for the boot CPU.
- * The function will return to the virtual address provided in LR (e.g. the
- * runtime mapping).
- *
- * Inputs:
- *   lr : Virtual address to return to.
- *
- * Clobbers x0 - x5
- */
-enable_boot_cpu_mm:
-        mov   x5, lr
-
-        bl    create_page_tables
-        load_paddr x0, boot_pgtable
-
-        bl    enable_mmu
-
-        /*
-         * The MMU is turned on and we are in the 1:1 mapping. Switch
-         * to the runtime mapping.
-         */
-        ldr   x0, =1f
-        br    x0
-1:
-        mov   lr, x5
-        /*
-         * The 1:1 map may clash with other parts of the Xen virtual memory
-         * layout. As it is not used anymore, remove it completely to avoid
-         * having to worry about replacing existing mapping afterwards.
-         * Function will return to the virtual address requested by the caller.
-         */
-        b     remove_identity_mapping
-ENDPROC(enable_boot_cpu_mm)
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
-remove_identity_mapping:
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
-        flush_xen_tlb_local
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
-setup_fixmap:
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
-        /*
-         * The fixmap area will be used soon after. So ensure no hardware
-         * translation happens before the dsb completes.
-         */
-        isb
-
-        ret
-ENDPROC(setup_fixmap)
-
 /*
  * Setup the initial stack and jump to the C world
  *
@@ -908,45 +457,6 @@ fail:   PRINT("- Boot failed -\r\n")
         b     1b
 ENDPROC(fail)
 
-/*
- * Switch TTBR
- *
- * x0    ttbr
- */
-ENTRY(switch_ttbr_id)
-        /* 1) Ensure any previous read/write have completed */
-        dsb    ish
-        isb
-
-        /* 2) Turn off MMU */
-        mrs    x1, SCTLR_EL2
-        bic    x1, x1, #SCTLR_Axx_ELx_M
-        msr    SCTLR_EL2, x1
-        isb
-
-        /* 3) Flush the TLBs */
-        flush_xen_tlb_local
-
-        /* 4) Update the TTBR */
-        msr   TTBR0_EL2, x0
-        isb
-
-        /*
-         * 5) Flush I-cache
-         * This should not be necessary but it is kept for safety.
-         */
-        ic     iallu
-        isb
-
-        /* 6) Turn on the MMU */
-        mrs   x1, SCTLR_EL2
-        orr   x1, x1, #SCTLR_Axx_ELx_M  /* Enable MMU */
-        msr   SCTLR_EL2, x1
-        isb
-
-        ret
-ENDPROC(switch_ttbr_id)
-
 #ifdef CONFIG_EARLY_PRINTK
 /*
  * Initialize the UART. Should only be called on the boot CPU.
diff --git a/xen/arch/arm/arm64/mmu/Makefile b/xen/arch/arm/arm64/mmu/Makefile
new file mode 100644
index 0000000000..3340058c08
--- /dev/null
+++ b/xen/arch/arm/arm64/mmu/Makefile
@@ -0,0 +1 @@
+obj-y += head.o
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
new file mode 100644
index 0000000000..97d872c3cb
--- /dev/null
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -0,0 +1,488 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/arm64/mmu/head.S
+ *
+ * Arm64 MMU specific start-of-day code.
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
+ * Flush local TLBs
+ *
+ * See asm/arm64/flushtlb.h for the explanation of the sequence.
+ */
+.macro flush_xen_tlb_local
+        dsb   nshst
+        tlbi  alle2
+        dsb   nsh
+        isb
+.endm
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
+ * ptbl:    table symbol where the entry will be created
+ * tbl:     physical address of the table to point to
+ * virt:    virtual address
+ * lvl:     page-table level
+ * tmp1:    scratch register
+ * tmp2:    scratch register
+ *
+ * Preserves \virt
+ * Clobbers \tbl, \tmp1, \tmp2
+ *
+ * Note that all parameters using registers should be distinct.
+ */
+.macro create_table_entry_from_paddr, ptbl, tbl, virt, lvl, tmp1, tmp2
+        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tbl */
+
+        mov   \tmp2, #PT_PT                 /* \tmp2 := right for linear PT */
+        orr   \tmp2, \tmp2, \tbl            /*          + \tbl */
+
+        adr_l \tbl, \ptbl                   /* \tbl := address(\ptbl) */
+
+        str   \tmp2, [\tbl, \tmp1, lsl #3]
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
+        load_paddr \tmp1, \tbl
+        create_table_entry_from_paddr \ptbl, \tmp1, \virt, \lvl, \tmp2, \tmp3
+.endm
+
+/*
+ * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
+ * level table (i.e page granularity) is supported.
+ *
+ * ptbl:    table symbol where the entry will be created
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
+.section .text.idmap, "ax", %progbits
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
+create_page_tables:
+        /* Prepare the page-tables for mapping Xen */
+        ldr   x0, =XEN_VIRT_START
+        create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
+        create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
+
+        /*
+         * We need to use a stash register because
+         * create_table_entry_paddr() will clobber the register storing
+         * the physical address of the table to point to.
+         */
+        load_paddr x4, boot_third
+        ldr   x1, =XEN_VIRT_START
+.rept XEN_NR_ENTRIES(2)
+        mov   x0, x4                            /* x0 := paddr(l3 table) */
+        create_table_entry_from_paddr boot_second, x0, x1, 2, x2, x3
+        add   x1, x1, #XEN_PT_LEVEL_SIZE(2)     /* x1 := Next vaddr */
+        add   x4, x4, #PAGE_SIZE                /* x4 := Next table */
+.endr
+
+        /*
+         * Find the size of Xen in pages and multiply by the size of a
+         * PTE. This will then be compared in the mapping loop below.
+         *
+         * Note the multiplication is just to avoid using an extra
+         * register/instruction per iteration.
+         */
+        ldr   x0, =_start            /* x0 := vaddr(_start) */
+        ldr   x1, =_end              /* x1 := vaddr(_end) */
+        sub   x0, x1, x0             /* x0 := effective size of Xen */
+        lsr   x0, x0, #PAGE_SHIFT    /* x0 := Number of pages for Xen */
+        lsl   x0, x0, #3             /* x0 := Number of pages * PTE size */
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
+        cmp   x1, x0                 /* Loop until we map all of Xen */
+        b.lt  1b
+
+        /*
+         * If Xen is loaded at exactly XEN_VIRT_START then we don't
+         * need an additional 1:1 mapping, the virtual mapping will
+         * suffice.
+         */
+        ldr   x0, =XEN_VIRT_START
+        cmp   x19, x0
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
+ * Inputs:
+ *   x0 : Physical address of the page tables.
+ *
+ * Clobbers x0 - x4
+ */
+enable_mmu:
+        mov   x4, x0
+        PRINT("- Turning on paging -\r\n")
+
+        /*
+         * The state of the TLBs is unknown before turning on the MMU.
+         * Flush them to avoid stale one.
+         */
+        flush_xen_tlb_local
+
+        /* Write Xen's PT's paddr into TTBR0_EL2 */
+        msr   TTBR0_EL2, x4
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
+ * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
+ * The function will return to the virtual address provided in LR (e.g. the
+ * runtime mapping).
+ *
+ * Inputs:
+ *   lr : Virtual address to return to.
+ *
+ * Clobbers x0 - x5
+ */
+ENTRY(enable_secondary_cpu_mm)
+        mov   x5, lr
+
+        load_paddr x0, init_ttbr
+        ldr   x0, [x0]
+
+        bl    enable_mmu
+        mov   lr, x5
+
+        /* return to secondary_switched */
+        ret
+ENDPROC(enable_secondary_cpu_mm)
+
+/*
+ * Enable mm (turn on the data cache and the MMU) for the boot CPU.
+ * The function will return to the virtual address provided in LR (e.g. the
+ * runtime mapping).
+ *
+ * Inputs:
+ *   lr : Virtual address to return to.
+ *
+ * Clobbers x0 - x5
+ */
+ENTRY(enable_boot_cpu_mm)
+        mov   x5, lr
+
+        bl    create_page_tables
+        load_paddr x0, boot_pgtable
+
+        bl    enable_mmu
+        mov   lr, x5
+
+        /*
+         * The MMU is turned on and we are in the 1:1 mapping. Switch
+         * to the runtime mapping.
+         */
+        ldr   x0, =1f
+        br    x0
+1:
+        /*
+         * The 1:1 map may clash with other parts of the Xen virtual memory
+         * layout. As it is not used anymore, remove it completely to
+         * avoid having to worry about replacing existing mapping
+         * afterwards. Function will return to primary_switched.
+         */
+        b     remove_identity_mapping
+
+        /*
+         * Below is supposed to be unreachable code, as "ret" in
+         * remove_identity_mapping will use the return address in LR in advance.
+         */
+        b     fail
+ENDPROC(enable_boot_cpu_mm)
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
+remove_identity_mapping:
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
+        flush_xen_tlb_local
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
+        /*
+         * The fixmap area will be used soon after. So ensure no hardware
+         * translation happens before the dsb completes.
+         */
+        isb
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
+/*
+ * Switch TTBR
+ *
+ * x0    ttbr
+ */
+ENTRY(switch_ttbr_id)
+        /* 1) Ensure any previous read/write have completed */
+        dsb    ish
+        isb
+
+        /* 2) Turn off MMU */
+        mrs    x1, SCTLR_EL2
+        bic    x1, x1, #SCTLR_Axx_ELx_M
+        msr    SCTLR_EL2, x1
+        isb
+
+        /* 3) Flush the TLBs */
+        flush_xen_tlb_local
+
+        /* 4) Update the TTBR */
+        msr   TTBR0_EL2, x0
+        isb
+
+        /*
+         * 5) Flush I-cache
+         * This should not be necessary but it is kept for safety.
+         */
+        ic     iallu
+        isb
+
+        /* 6) Turn on the MMU */
+        mrs   x1, SCTLR_EL2
+        orr   x1, x1, #SCTLR_Axx_ELx_M  /* Enable MMU */
+        msr   SCTLR_EL2, x1
+        isb
+
+        ret
+ENDPROC(switch_ttbr_id)
+
+/*
+ * Local variables:
+ * mode: ASM
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
index 140e223b4c..99c401fcaf 100644
--- a/xen/arch/arm/include/asm/arm64/macros.h
+++ b/xen/arch/arm/include/asm/arm64/macros.h
@@ -32,6 +32,42 @@
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
+        adr_l x0, 98f ;    \
+        bl    asm_puts ;   \
+        mov   lr, x3 ;     \
+        RODATA_STR(98, _s)
+
+#else /* CONFIG_EARLY_PRINTK */
+#define PRINT(s)
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
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index a3c90ca823..59b80d122f 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -34,6 +34,7 @@ SECTIONS
        _stext = .;             /* Text section */
        _idmap_start = .;
        *(.text.header)
+       *(.text.idmap)
        _idmap_end = .;
 
        *(.text.cold)
-- 
2.25.1


