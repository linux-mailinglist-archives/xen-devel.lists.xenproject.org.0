Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 451DD6BD61D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 17:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510729.788992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqhv-00035X-5s; Thu, 16 Mar 2023 16:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510729.788992; Thu, 16 Mar 2023 16:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcqhv-0002zz-18; Thu, 16 Mar 2023 16:44:03 +0000
Received: by outflank-mailman (input) for mailman id 510729;
 Thu, 16 Mar 2023 16:44:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcqht-0001vH-NM
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 16:44:01 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0e6dddb-c419-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 17:44:00 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id w9so10166957edc.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 09:44:00 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 hp12-20020a1709073e0c00b00925ce7c7705sm4019163ejc.162.2023.03.16.09.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:43:59 -0700 (PDT)
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
X-Inumbo-ID: c0e6dddb-c419-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678985040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGVL/CfPnzewnAsXjG29SUeWKmwBMkBIJaaDApBELM4=;
        b=QCr3G4hZHJabhkiRevIyeL5ZJEWKvthmnSk4MjsWOYhch66dxW88fWif615DVloFiM
         6EO8pvUj+vhVvsbIwdsLbGLwAazYly76MX+tIgkCHqmIjlkyq2B6g8bLaI+d+1GaAqXW
         iV8HD6aqxdiXecVGEmuksgqNETQ6xa3A5hE+oUBAvgXZUfby8fZlnOq3A8E7xfvW1NnY
         bs05X1Wpzdfn7eA4FViT8cfrX+vk2u3HNrGhZ6I5hgtEVM4YdLlnUtG4uO2HFncWNbrx
         rsc70lFoY3jrMm9uKc/GXttjhcQoYh5ssAe5ugU4AhTKWJ+U1bxKdXXneT0vxt+6G580
         zjnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678985040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGVL/CfPnzewnAsXjG29SUeWKmwBMkBIJaaDApBELM4=;
        b=cAXSMtYCzA1RAUH4GHpZ0VgFTBgGEs6nC3sEZCogGsFFM1bt/J+zJy4nJFuy6tJa5A
         R3zKWLZDS7Z6O+BRlIaXb0zAgHWi4A1Q0xPvwOb1EzpVHuRboSDpLpE0wDifF+smc5f2
         eEVInKxfTE0vjB1EmVXl/5gdieCcKBvjpMQNYI/dIlOTExtlZ1L3ssJaFgDc/pyA/rBQ
         sk1/WKTWrE3h+n/1phovV9UJJGSSlAgaHHbLJCnhnc9MtWQt+rLouPitcSHEfczC/tr+
         TH/9bI4l6kaesw8eJrjfphQgOlyxTS8wOO9GKCCpDuhqUm/gZpHLbag12MFu+jS9GY+K
         Akuw==
X-Gm-Message-State: AO0yUKWhKw+GRNng1mAExZK7Di2C1j4WN+5P1kzKamx8FGO1FRXcEGIv
	l9jpiTJ5j5whY1JNko5pw6UwpwkT3OyWOA==
X-Google-Smtp-Source: AK7set/KY55BlVnTQ3oed3mzLNX9p6NhyE5sg4Jt2Fj/mMET8lAeFBv1QRfDL3gp+C3JsE+Z/K3rZg==
X-Received: by 2002:a17:906:c047:b0:926:8992:4310 with SMTP id bm7-20020a170906c04700b0092689924310mr12501235ejb.38.1678985040053;
        Thu, 16 Mar 2023 09:44:00 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v2 1/3] xen/riscv: introduce setup_initial_pages
Date: Thu, 16 Mar 2023 18:43:52 +0200
Message-Id: <85a21ada5a0fc44bb9db1dcc1f6cf191a6e66bfb.1678984041.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678984041.git.oleksii.kurochko@gmail.com>
References: <cover.1678984041.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mostly the code for setup_initial_pages was taken from Bobby's
repo except for the following changes:
* Use only a minimal part of the code enough to enable MMU
* rename {_}setup_initial_pagetables functions
* add an argument for setup_initial_mapping to have
  an opportunity to make set PTE flags.
* update setup_initial_pagetables function to map sections
  with correct PTE flags.
* introduce separate enable_mmu() to be able for proper
  handling the case when load start address isn't equal to
  linker start address.
* map linker addresses range to load addresses range without
  1:1 mapping.
* add safety checks such as:
  * Xen size is less than page size
  * linker addresses range doesn't overlap load addresses
    range
* Rework macros {THIRD,SECOND,FIRST,ZEROETH}_{SHIFT,MASK}
* change PTE_LEAF_DEFAULT to RX instead of RWX.
* Remove phys_offset as it isn't used now.
* Remove alignment  of {map, pa}_start &= XEN_PT_LEVEL_MAP_MASK(0); in
  setup_inital_mapping() as they should be already aligned.
* Remove clear_pagetables() as initial pagetables will be
  zeroed during bss initialization
* Remove __attribute__((section(".entry")) for setup_initial_pagetables()
  as there is no such section in xen.lds.S
* Update the argument of pte_is_valid() to "const pte_t *p"

Origin: https://gitlab.com/xen-on-risc-v/xen/-/tree/riscv-rebase 4af165b468af
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 * update the commit message:
 * Remove {ZEROETH,FIRST,...}_{SHIFT,MASK, SIZE,...} and
   introduce instead of them XEN_PT_LEVEL_*() and LEVEL_*
 * Rework pt_linear_offset() and pt_index based on  XEN_PT_LEVEL_*()
 * Remove clear_pagetables() functions as pagetables were zeroed during
   .bss initialization
 * Rename _setup_initial_pagetables() to setup_initial_mapping()
 * Make PTE_DEFAULT equal to RX.
 * Update prototype of setup_initial_mapping(..., bool writable) -> 
   setup_initial_mapping(..., UL flags)  
 * Update calls of setup_initial_mapping according to new prototype
 * Remove unnecessary call of:
   _setup_initial_pagetables(..., load_addr_start, load_addr_end, load_addr_start, ...)
 * Define index* in the loop of setup_initial_mapping
 * Remove attribute "__attribute__((section(".entry")))" for setup_initial_pagetables()
   as we don't have such section
 * make arguments of paddr_to_pte() and pte_is_valid() as const.
 * make xen_second_pagetable static.
 * use <xen/kernel.h> instead of declaring extern unsigned long _stext, 0etext, _srodata, _erodata
 * update  'extern unsigned long __init_begin' to 'extern unsigned long __init_begin[]'
 * use aligned() instead of "__attribute__((__aligned__(PAGE_SIZE)))"
 * set __section(".bss.page_aligned") for page tables arrays
 * fix identatations
 * Change '__attribute__((section(".entry")))' to '__init'
 * Remove phys_offset as it isn't used now.
 * Remove alignment  of {map, pa}_start &= XEN_PT_LEVEL_MAP_MASK(0); in
   setup_inital_mapping() as they should be already aligned.
 * Remove clear_pagetables() as initial pagetables will be
   zeroed during bss initialization
 * Remove __attribute__((section(".entry")) for setup_initial_pagetables()
   as there is no such section in xen.lds.S
 * Update the argument of pte_is_valid() to "const pte_t *p"
---
 xen/arch/riscv/Makefile           |   1 +
 xen/arch/riscv/include/asm/mm.h   |   8 ++
 xen/arch/riscv/include/asm/page.h |  67 +++++++++++++++++
 xen/arch/riscv/mm.c               | 121 ++++++++++++++++++++++++++++++
 xen/arch/riscv/riscv64/head.S     |  65 ++++++++++++++++
 xen/arch/riscv/xen.lds.S          |   2 +
 6 files changed, 264 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/mm.h
 create mode 100644 xen/arch/riscv/include/asm/page.h
 create mode 100644 xen/arch/riscv/mm.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 443f6bf15f..956ceb02df 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
+obj-y += mm.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
new file mode 100644
index 0000000000..3cc98fe45b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -0,0 +1,8 @@
+#ifndef _ASM_RISCV_MM_H
+#define _ASM_RISCV_MM_H
+
+void setup_initial_pagetables(void);
+
+extern void enable_mmu(void);
+
+#endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
new file mode 100644
index 0000000000..fb8329a191
--- /dev/null
+++ b/xen/arch/riscv/include/asm/page.h
@@ -0,0 +1,67 @@
+#ifndef _ASM_RISCV_PAGE_H
+#define _ASM_RISCV_PAGE_H
+
+#include <xen/const.h>
+#include <xen/types.h>
+
+#define PAGE_ENTRIES                (1 << PAGETABLE_ORDER)
+#define VPN_MASK                    ((unsigned long)(PAGE_ENTRIES - 1))
+
+#define PAGE_ORDER                  (12)
+
+#ifdef CONFIG_RISCV_64
+#define PAGETABLE_ORDER             (9)
+#else /* CONFIG_RISCV_32 */
+#define PAGETABLE_ORDER             (10)
+#endif
+
+#define LEVEL_ORDER(lvl)            (lvl * PAGETABLE_ORDER)
+#define LEVEL_SHIFT(lvl)            (LEVEL_ORDER(lvl) + PAGE_ORDER)
+#define LEVEL_SIZE(lvl)             (_AT(paddr_t, 1) << LEVEL_SHIFT(lvl))
+
+#define XEN_PT_LEVEL_SHIFT(lvl)     LEVEL_SHIFT(lvl)
+#define XEN_PT_LEVEL_ORDER(lvl)     LEVEL_ORDER(lvl)
+#define XEN_PT_LEVEL_SIZE(lvl)      LEVEL_SIZE(lvl)
+#define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
+#define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK << XEN_PT_LEVEL_SHIFT(lvl))
+
+#define PTE_SHIFT                   10
+
+#define PTE_VALID                   BIT(0, UL)
+#define PTE_READABLE                BIT(1, UL)
+#define PTE_WRITABLE                BIT(2, UL)
+#define PTE_EXECUTABLE              BIT(3, UL)
+#define PTE_USER                    BIT(4, UL)
+#define PTE_GLOBAL                  BIT(5, UL)
+#define PTE_ACCESSED                BIT(6, UL)
+#define PTE_DIRTY                   BIT(7, UL)
+#define PTE_RSW                     (BIT(8, UL) | BIT(9, UL))
+
+#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
+#define PTE_TABLE                   (PTE_VALID)
+
+/* Calculate the offsets into the pagetables for a given VA */
+#define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
+
+#define pt_index(lvl, va)   pt_linear_offset(lvl, (va) & XEN_PT_LEVEL_MASK(lvl))
+
+/* Page Table entry */
+typedef struct {
+    uint64_t pte;
+} pte_t;
+
+/* Shift the VPN[x] or PPN[x] fields of a virtual or physical address
+ * to become the shifted PPN[x] fields of a page table entry */
+#define addr_to_ppn(x) (((x) >> PAGE_SHIFT) << PTE_SHIFT)
+
+static inline pte_t paddr_to_pte(const unsigned long paddr)
+{
+    return (pte_t) { .pte = addr_to_ppn(paddr) };
+}
+
+static inline bool pte_is_valid(const pte_t *p)
+{
+    return p->pte & PTE_VALID;
+}
+
+#endif /* _ASM_RISCV_PAGE_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
new file mode 100644
index 0000000000..0df6b47441
--- /dev/null
+++ b/xen/arch/riscv/mm.c
@@ -0,0 +1,121 @@
+#include <xen/compiler.h>
+#include <xen/init.h>
+#include <xen/kernel.h>
+#include <xen/lib.h>
+#include <xen/page-size.h>
+
+#include <asm/boot-info.h>
+#include <asm/config.h>
+#include <asm/csr.h>
+#include <asm/mm.h>
+#include <asm/page.h>
+#include <asm/traps.h>
+
+/*
+ * xen_second_pagetable is indexed with the VPN[2] page table entry field
+ * xen_first_pagetable is accessed from the VPN[1] page table entry field
+ * xen_zeroeth_pagetable is accessed from the VPN[0] page table entry field
+ */
+pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+    xen_second_pagetable[PAGE_ENTRIES];
+static pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+    xen_first_pagetable[PAGE_ENTRIES];
+static pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+    xen_zeroeth_pagetable[PAGE_ENTRIES];
+
+extern unsigned long __init_begin[];
+extern unsigned long __init_end[];
+extern unsigned char cpu0_boot_stack[STACK_SIZE];
+
+static void __init
+setup_initial_mapping(pte_t *second, pte_t *first, pte_t *zeroeth,
+                      unsigned long map_start,
+                      unsigned long map_end,
+                      unsigned long pa_start,
+                      unsigned long flags)
+{
+    unsigned long page_addr;
+
+    // /* align start addresses */
+    // map_start &= XEN_PT_LEVEL_MAP_MASK(0);
+    // pa_start &= XEN_PT_LEVEL_MAP_MASK(0);
+
+    page_addr = map_start;
+    while ( page_addr < map_end )
+    {
+        unsigned long index2 = pt_index(2, page_addr);
+        unsigned long index1 = pt_index(1, page_addr);
+        unsigned long index0 = pt_index(0, page_addr);
+
+        /* Setup level2 table */
+        second[index2] = paddr_to_pte((unsigned long)first);
+        second[index2].pte |= PTE_TABLE;
+
+        /* Setup level1 table */
+        first[index1] = paddr_to_pte((unsigned long)zeroeth);
+        first[index1].pte |= PTE_TABLE;
+
+
+        /* Setup level0 table */
+        if ( !pte_is_valid(&zeroeth[index0]) )
+        {
+            /* Update level0 table */
+            zeroeth[index0] = paddr_to_pte((page_addr - map_start) + pa_start);
+            zeroeth[index0].pte |= flags;
+        }
+
+        /* Point to next page */
+        page_addr += XEN_PT_LEVEL_SIZE(0);
+    }
+}
+
+/*
+ * setup_initial_pagetables:
+ *
+ * Build the page tables for Xen that map the following:
+ *   load addresses to linker addresses
+ */
+void __init setup_initial_pagetables(void)
+{
+    pte_t *second;
+    pte_t *first;
+    pte_t *zeroeth;
+
+    unsigned long load_addr_start   = boot_info.load_start;
+    unsigned long load_addr_end     = boot_info.load_end;
+    unsigned long linker_addr_start = boot_info.linker_start;
+    unsigned long linker_addr_end   = boot_info.linker_end;
+
+    BUG_ON(load_addr_start % (PAGE_ENTRIES * PAGE_SIZE) != 0);
+    if (load_addr_start != linker_addr_start)
+        BUG_ON((linker_addr_end > load_addr_start && load_addr_end > linker_addr_start));
+
+    /* Get the addresses where the page tables were loaded */
+    second  = (pte_t *)(&xen_second_pagetable);
+    first   = (pte_t *)(&xen_first_pagetable);
+    zeroeth = (pte_t *)(&xen_zeroeth_pagetable);
+
+    setup_initial_mapping(second, first, zeroeth,
+                          LOAD_TO_LINK((unsigned long)&_stext),
+                          LOAD_TO_LINK((unsigned long)&_etext),
+                          (unsigned long)&_stext,
+                          PTE_LEAF_DEFAULT);
+
+    setup_initial_mapping(second, first, zeroeth,
+                          LOAD_TO_LINK((unsigned long)&__init_begin),
+                          LOAD_TO_LINK((unsigned long)&__init_end),
+                          (unsigned long)&__init_begin,
+                          PTE_LEAF_DEFAULT | PTE_WRITABLE);
+
+    setup_initial_mapping(second, first, zeroeth,
+                          LOAD_TO_LINK((unsigned long)&_srodata),
+                          LOAD_TO_LINK((unsigned long)&_erodata),
+                          (unsigned long)(&_srodata),
+                          PTE_VALID | PTE_READABLE);
+
+    setup_initial_mapping(second, first, zeroeth,
+                          linker_addr_start,
+                          linker_addr_end,
+                          load_addr_start,
+                          PTE_LEAF_DEFAULT | PTE_READABLE);
+}
diff --git a/xen/arch/riscv/riscv64/head.S b/xen/arch/riscv/riscv64/head.S
index 8887f0cbd4..f4a0582727 100644
--- a/xen/arch/riscv/riscv64/head.S
+++ b/xen/arch/riscv/riscv64/head.S
@@ -1,4 +1,5 @@
 #include <asm/asm.h>
+#include <asm/asm-offsets.h>
 #include <asm/riscv_encoding.h>
 
         .section .text.header, "ax", %progbits
@@ -32,3 +33,67 @@ ENTRY(start)
         add     sp, sp, t0
 
         tail    start_xen
+
+ENTRY(enable_mmu)
+        /* Calculate physical offset between linker and load addresses */
+        la      t0, boot_info
+        REG_L   t1, BI_LINKER_START(t0)
+        REG_L   t2, BI_LOAD_START(t0)
+        sub     t1, t1, t2
+
+        /*
+         * Calculate and update a linker time address of the .L_mmu_is_enabled
+         * label and update CSR_STVEC with it.
+         * MMU is configured in a way where linker addresses are mapped
+         * on load addresses so case when linker addresses are not equal to
+         * load addresses, and thereby, after MMU is enabled, it will cause
+         * an exception and jump to linker time addresses
+         */
+        la      t3, .L_mmu_is_enabled
+        add     t3, t3, t1
+        csrw    CSR_STVEC, t3
+
+        /* Calculate a value for SATP register */
+        li      t5, SATP_MODE_SV39
+        li      t6, SATP_MODE_SHIFT
+        sll     t5, t5, t6
+
+        la      t4, xen_second_pagetable
+        srl     t4, t4, PAGE_SHIFT
+        or      t4, t4, t5
+        sfence.vma
+        csrw    CSR_SATP, t4
+
+        .align 2
+.L_mmu_is_enabled:
+        /*
+         * Stack should be re-inited as:
+         * 1. Right now an address of the stack is relative to load time
+         *    addresses what will cause an issue in case of load start address
+         *    isn't equal to linker start address.
+         * 2. Addresses in stack are all load time relative which can be an
+         *    issue in case when load start address isn't equal to linker
+         *    start address.
+         */
+        la      sp, cpu0_boot_stack
+        li      t0, STACK_SIZE
+        add     sp, sp, t0
+
+        /*
+         * Re-init an address of exception handler as it was overwritten  with
+         * the address of the .L_mmu_is_enabled label.
+         * Before jump to trap_init save return address of enable_mmu() to
+         * know where we should back after enable_mmu() will be finished.
+         */
+        mv      s0, ra
+        lla     t0, trap_init
+        jalr    ra, t0
+
+        /*
+         * Re-calculate the return address of enable_mmu() function for case
+         * when linker start address isn't equal to load start address
+         */
+        add     s0, s0, t1
+        mv      ra, s0
+
+        ret
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index eed457c492..e4ac4e84b6 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -179,3 +179,5 @@ SECTIONS
 
 ASSERT(!SIZEOF(.got),      ".got non-empty")
 ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
+
+ASSERT(_end - _start <= MB(2), "Xen too large for early-boot assumptions")
-- 
2.39.2


