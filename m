Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAF973D434
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jun 2023 22:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554876.866336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfk-0003uS-4b; Sun, 25 Jun 2023 20:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554876.866336; Sun, 25 Jun 2023 20:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDWfj-0003sQ-UH; Sun, 25 Jun 2023 20:49:23 +0000
Received: by outflank-mailman (input) for mailman id 554876;
 Sun, 25 Jun 2023 20:49:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qDWfi-0003jB-9H
 for xen-devel@lists.xenproject.org; Sun, 25 Jun 2023 20:49:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfh-0003N2-Ul; Sun, 25 Jun 2023 20:49:21 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qDWfh-00021M-Jp; Sun, 25 Jun 2023 20:49:21 +0000
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
	bh=Zz5lkbOFdCDJuz1jjvaHY6dTr1nKg4m1ZU7qib9ysjI=; b=sMK3CCjnHN2zpPQ1zHwpLwOuf0
	JovbFsupmAoHmxoCfwHktot0ya6DZ/FgAGRwVun6BrpeiJk4dCVJ3ifPfAZEQLnNYwf7CuB2HGhFz
	qW/srwGRUVUeVa7+x5hmnsMyJ9sxJrrJW18Az2bKSmwxpj5fawBp5iN7Ia++ZUx5eWWI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/9] xen/arm: Rework the code mapping Xen to avoid relying on the size of Xen
Date: Sun, 25 Jun 2023 21:49:03 +0100
Message-Id: <20230625204907.57291-6-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230625204907.57291-1-julien@xen.org>
References: <20230625204907.57291-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, the maximum size of Xen binary we can support is 2MB.
This is what we reserved in the virtual address but also what all
the code in Xen relies on as we only allocate one L3 page-table.

When feature like UBSAN (will be enabled in a follow-up patch) and GCOV
are enabled, the binary will be way over 2MB.

The code is now reworked so it doesn't realy on a specific size but
will instead look at the reversed size and compute the number of
page-table to allocate/map.

While at it, replace any reference to 4KB mappings with a more
generic word because the page-size may change in the future.

Also fix the typo s/tlb/tbl/ in code move in arm32/head.S

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S         | 61 ++++++++++++++++++++++++-------
 xen/arch/arm/arm64/head.S         | 51 +++++++++++++++++++++-----
 xen/arch/arm/include/asm/config.h |  1 +
 xen/arch/arm/include/asm/lpae.h   |  8 ++--
 xen/arch/arm/mm.c                 | 24 +++++++-----
 5 files changed, 108 insertions(+), 37 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 5e3692eb3abf..5448671de897 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -373,35 +373,55 @@ ENDPROC(cpu_init)
 .endm
 
 /*
- * Macro to create a page table entry in \ptbl to \tbl
+ * Macro to create a page table entry in \ptbl to \tbl (physical
+ * address)
  *
  * ptbl:    table symbol where the entry will be created
- * tbl:     table symbol to point to
+ * tbl:     physical address of the table to point to
  * virt:    virtual address
  * lvl:     page-table level
  *
  * Preserves \virt
- * Clobbers r1 - r4
+ * Clobbers \tbl, r1 - r3
  *
  * Also use r10 for the phys offset.
  *
- * Note that \virt should be in a register other than r1 - r4
+ * Note that \tbl and \virt should be in a register other than r1 - r3
  */
-.macro create_table_entry, ptbl, tbl, virt, lvl
-        get_table_slot r1, \virt, \lvl  /* r1 := slot in \tlb */
-        lsl   r1, r1, #3                /* r1 := slot offset in \tlb */
-
-        load_paddr r4, \tbl
+.macro create_table_entry_from_paddr, ptbl, tbl, virt, lvl
+        get_table_slot r1, \virt, \lvl  /* r1 := slot in \tbl */
+        lsl   r1, r1, #3                /* r1 := slot offset in \tbl */
 
         movw  r2, #PT_PT             /* r2:r3 := right for linear PT */
-        orr   r2, r2, r4             /*           + \tlb paddr */
+        orr   r2, r2, \tbl           /*           + \tbl paddr */
         mov   r3, #0
 
-        adr_l r4, \ptbl
+        adr_l \tbl, \ptbl            /* \tbl := (v,p)addr of \ptbl */
 
-        strd  r2, r3, [r4, r1]
+        strd  r2, r3, [\tbl, r1]
 .endm
 
+
+/*
+ * Macro to create a page table entry in \ptbl to \tbl (symbol)
+ *
+ * ptbl:    table symbol where the entry will be created
+ * tbl:     table symbol to point to
+ * virt:    virtual address
+ * lvl:     page-table level
+ *
+ * Preserves \virt
+ * Clobbers r1 - r4
+ *
+ * Also use r10 for the phys offset.
+ *
+ * Note that \virt should be in a register other than r1 - r4
+ */
+.macro create_table_entry, ptbl, tbl, virt, lvl
+        load_paddr r4, \tbl
+        create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
+ .endm
+
 /*
  * Macro to create a mapping entry in \tbl to \paddr. Only mapping in 3rd
  * level table (i.e page granularity) is supported.
@@ -451,13 +471,26 @@ ENDPROC(cpu_init)
  * Output:
  *   r12: Was a temporary mapping created?
  *
- * Clobbers r0 - r4
+ * Clobbers r0 - r5
  */
 create_page_tables:
         /* Prepare the page-tables for mapping Xen */
         mov_w r0, XEN_VIRT_START
         create_table_entry boot_pgtable, boot_second, r0, 1
-        create_table_entry boot_second, boot_third, r0, 2
+
+        /*
+         * We need to use a stash register because
+         * create_table_entry_paddr() will clobber the register storing
+         * the physical address of the table to point to.
+         */
+        load_paddr r5, boot_third
+        mov_w r4, XEN_VIRT_START
+.rept XEN_NR_ENTRIES(2)
+        mov   r0, r5                        /* r0 := paddr(l3 table) */
+        create_table_entry_from_paddr boot_second, r0, r4, 2
+        add   r4, r4, #XEN_PT_LEVEL_SIZE(2) /* r4 := Next vaddr */
+        add   r5, r5, #PAGE_SIZE            /* r5 := Next table */
+.endr
 
         /*
          * Find the size of Xen in pages and multiply by the size of a
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 66bc85d4c39e..c9e2e36506d9 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -490,6 +490,31 @@ ENDPROC(cpu_init)
         ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
 .endm
 
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
+        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
+
+        mov   \tmp2, #PT_PT                 /* \tmp2 := right for linear PT */
+        orr   \tmp2, \tmp2, \tbl            /*          + \tlb */
+
+        adr_l \tbl, \ptbl                   /* \tlb := address(\ptbl) */
+
+        str   \tmp2, [\tbl, \tmp1, lsl #3]
+.endm
+
 /*
  * Macro to create a page table entry in \ptbl to \tbl
  *
@@ -509,15 +534,8 @@ ENDPROC(cpu_init)
  * Note that all parameters using registers should be distinct.
  */
 .macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
-        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
-
-        load_paddr \tmp2, \tbl
-        mov   \tmp3, #PT_PT                 /* \tmp3 := right for linear PT */
-        orr   \tmp3, \tmp3, \tmp2           /*          + \tlb paddr */
-
-        adr_l \tmp2, \ptbl
-
-        str   \tmp3, [\tmp2, \tmp1, lsl #3]
+        load_paddr \tmp1, \tbl
+        create_table_entry_from_paddr \ptbl, \tmp1, \virt, \lvl, \tmp2, \tmp3
 .endm
 
 /*
@@ -570,7 +588,20 @@ create_page_tables:
         ldr   x0, =XEN_VIRT_START
         create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
         create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
-        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
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
 
         /*
          * Find the size of Xen in pages and multiply by the size of a
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index c969e6da589d..6d246ab23c48 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -125,6 +125,7 @@
 #endif
 
 #define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
+#define XEN_NR_ENTRIES(lvl)     (XEN_VIRT_SIZE / XEN_PT_LEVEL_SIZE(lvl))
 
 #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
 #define FIXMAP_VIRT_SIZE        _AT(vaddr_t, MB(2))
diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 7d2f6fd1bd5a..93e824f01125 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -267,15 +267,17 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
 
 /*
  * Macros to define page-tables:
- *  - DEFINE_BOOT_PAGE_TABLE is used to define page-table that are used
+ *  - DEFINE_BOOT_PAGE_TABLE{,S} are used to define page-table that are used
  *  in assembly code before BSS is zeroed.
  *  - DEFINE_PAGE_TABLE{,S} are used to define one or multiple
  *  page-tables to be used after BSS is zeroed (typically they are only used
  *  in C).
  */
-#define DEFINE_BOOT_PAGE_TABLE(name)                                          \
+#define DEFINE_BOOT_PAGE_TABLES(name, nr)                                     \
 lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")                   \
-    name[XEN_PT_LPAE_ENTRIES]
+    name[XEN_PT_LPAE_ENTRIES * (nr)]
+
+#define DEFINE_BOOT_PAGE_TABLE(name) DEFINE_BOOT_PAGE_TABLES(name, 1)
 
 #define DEFINE_PAGE_TABLES(name, nr)                    \
 lpae_t __aligned(PAGE_SIZE) name[XEN_PT_LPAE_ENTRIES * (nr)]
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index e460249736c3..2b2ff6015ebd 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -53,8 +53,8 @@ mm_printk(const char *fmt, ...) {}
  * to the CPUs own pagetables.
  *
  * These pagetables have a very simple structure. They include:
- *  - 2MB worth of 4K mappings of xen at XEN_VIRT_START, boot_first and
- *    boot_second are used to populate the tables down to boot_third
+ *  - XEN_VIRT_SIZE worth of L3 mappings of xen at XEN_VIRT_START, boot_first
+ *    and boot_second are used to populate the tables down to boot_third
  *    which contains the actual mapping.
  *  - a 1:1 mapping of xen at its current physical address. This uses a
  *    section mapping at whichever of boot_{pgtable,first,second}
@@ -79,7 +79,7 @@ DEFINE_BOOT_PAGE_TABLE(boot_first_id);
 DEFINE_BOOT_PAGE_TABLE(boot_second_id);
 DEFINE_BOOT_PAGE_TABLE(boot_third_id);
 DEFINE_BOOT_PAGE_TABLE(boot_second);
-DEFINE_BOOT_PAGE_TABLE(boot_third);
+DEFINE_BOOT_PAGE_TABLES(boot_third, XEN_NR_ENTRIES(2));
 
 /* Main runtime page tables */
 
@@ -115,7 +115,7 @@ DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
  * Third level page table used to map Xen itself with the XN bit set
  * as appropriate.
  */
-static DEFINE_PAGE_TABLE(xen_xenmap);
+static DEFINE_PAGE_TABLES(xen_xenmap, XEN_NR_ENTRIES(2));
 
 /* Non-boot CPUs use this to find the correct pagetables. */
 uint64_t init_ttbr;
@@ -518,15 +518,15 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     p[0].pt.table = 1;
     p[0].pt.xn = 0;
 
-    /* Break up the Xen mapping into 4k pages and protect them separately. */
-    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
+    /* Break up the Xen mapping into pages and protect them separately. */
+    for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
     {
         vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
 
         if ( !is_kernel(va) )
             break;
         pte = pte_of_xenaddr(va);
-        pte.pt.table = 1; /* 4k mappings always have this bit set */
+        pte.pt.table = 1; /* third level mappings always have this bit set */
         if ( is_kernel_text(va) || is_kernel_inittext(va) )
         {
             pte.pt.xn = 0;
@@ -539,10 +539,14 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 
     /* Initialise xen second level entries ... */
     /* ... Xen's text etc */
+    for ( i = 0; i < XEN_NR_ENTRIES(2); i++ )
+    {
+        vaddr_t va = XEN_VIRT_START + i * XEN_PT_LEVEL_SIZE(2);
 
-    pte = pte_of_xenaddr((vaddr_t)xen_xenmap);
-    pte.pt.table = 1;
-    xen_second[second_table_offset(XEN_VIRT_START)] = pte;
+        pte = pte_of_xenaddr((vaddr_t)(xen_xenmap + i * XEN_PT_LPAE_ENTRIES));
+        pte.pt.table = 1;
+        xen_second[second_table_offset(va)] = pte;
+    }
 
     /* ... Fixmap */
     pte = pte_of_xenaddr((vaddr_t)xen_fixmap);
-- 
2.40.1


