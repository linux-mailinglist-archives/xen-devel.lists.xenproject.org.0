Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41004968C94
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 19:01:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788309.1197843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQm-0003eb-Tp; Mon, 02 Sep 2024 17:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788309.1197843; Mon, 02 Sep 2024 17:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slAQm-0003Zk-Ph; Mon, 02 Sep 2024 17:01:32 +0000
Received: by outflank-mailman (input) for mailman id 788309;
 Mon, 02 Sep 2024 17:01:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uz6k=QA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1slAQl-0002dz-CI
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 17:01:31 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0010c8c2-694d-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 19:01:30 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-53345dcd377so6096598e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 10:01:30 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408410f5sm1677618e87.211.2024.09.02.10.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 10:01:28 -0700 (PDT)
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
X-Inumbo-ID: 0010c8c2-694d-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725296490; x=1725901290; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPFUgxD5pd1DjI8ASySFWknVUuYZwJp16fd5d9eZPSQ=;
        b=Z8mqfPmzjYVEzhM+4/engyJZZvxxqk4P45ivZofVHkzAm6PntSr2eu9MwDU1/x6KSp
         G+MowupmLnqaWIplStnQ45vLNO0zlKTxXcdi+8huTFy0lACCq4uYynzenWD9wjaJltkn
         u/JpkvKQMm7/rQ0HxFiu61r8oE02AuY0DykDjoXKiJEBr8tJL/UF+RkgNOQkrLdBYOlR
         k3VguRTlXHMao7pYOlKwA4jABZ08KZ63h0gaL3VIVeCnH3MeXmFKA+6q70jL5M3WG0nW
         HGcrYPvYQrv+RoWUcnwLGV64dmwIE8cbJEfkJFJk6UEtIy2gpKyvcr0fmm9+CkoJu8wW
         NJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725296490; x=1725901290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPFUgxD5pd1DjI8ASySFWknVUuYZwJp16fd5d9eZPSQ=;
        b=KeqaQHFaefxM2CPeVwfFWpOaUYga1u++PjjJmISSgaFwNr/bgwSPAkjP3KoXiqLuXs
         MAb1W5v00L4OPAxYeY7rVzdHgtdhMO5cHHGgWDExAp/zTb5vG2SjScqUGe5gmu5QFZ7d
         w0GLm58t6MqR5dIDgR5q5hodfefFQGk3B6i1KLSQaHLGMlUQGrqXAqoQJ+OukwwcPEfD
         KkRX06XPX9w+8qOEQg42fmxvTUJkRSQGIRjO7x95zm8xXD5WJqLTN+FoXOYOGMHPMey0
         OoV4BP5YIUkcVLRsMmccrLsvGyLtmjOOpGErbm8s/r9PLE3z3Nn4xuW9/zxGHyaFrlYW
         o3WA==
X-Gm-Message-State: AOJu0YwZlvfv9S/MziecqzFlKDMJ46Jh9jzXPxoyxudp3n82Xnw69Z0U
	8pWACUSb1W9VB5n+FLCgM8oUu/0ZwuF6oMfIX0aq7itnTOw/2P8e3RKPBQ==
X-Google-Smtp-Source: AGHT+IEmKYMalE+GwzB6g0cS/IUuO05dapj8qriChg/TZd17yUvGuNuasw6DheGy/hVHekRXpTZqIw==
X-Received: by 2002:a05:6512:31d0:b0:52c:825e:3b1c with SMTP id 2adb3069b0e04-53546b29ec5mr7099359e87.26.1725296489174;
        Mon, 02 Sep 2024 10:01:29 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 4/9] xen/riscv: set up fixmap mappings
Date: Mon,  2 Sep 2024 19:01:17 +0200
Message-ID: <a05babb0982a3a0709ed08c3eeb9a729421e1bd1.1725295716.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1725295716.git.oleksii.kurochko@gmail.com>
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set up fixmap mappings and the L0 page table for fixmap support.

Modify the Page Table Entries (PTEs) directly in arch_pmap_map()
instead of using set_fixmap() ( which relies on map_pages_to_xen() ).
This change is necessary because PMAP is used when the domain map
page infrastructure is not yet initialized so map_pages_to_xen()
called by set_fixmap() needs to map pages on demand, which then
calls pmap() again, resulting in a loop.
The same reasoning applies to pmap_unmap(), which also modifies
PTEs directly to avoid this issue.

Define new macros in riscv/config.h for calculating
the FIXMAP_BASE address, including BOOT_FDT_VIRT_{START, SIZE},
XEN_VIRT_SIZE, and XEN_VIRT_END.

Update the check for Xen size in riscv/lds.S to use
XEN_VIRT_SIZE instead of a hardcoded constant.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - avoid case mixing for address in RISC-V64 layout table.
 - move definition of FIXMAP_BASE to new line.
 - update the commit message.
---
Changes in V5:
 - move definition of FIXMAP_ADDR() to asm/fixmap.h
 - add gap size equal to 2 MB ( 512 * 4K one page table entry in L1 page table )
   between Xen, FDT and Fixmap.
 - drop the comment for FIX_LAST.
 - move +1 from FIX_LAST definition to FIXADDR_TOP to be aligned with Arm.
   ( probably everything below FIX_LAST will be moved to a separate header in asm/generic.h )
 - correct the "changes in V4: s/'fence r,r'/'fence rw, rw'
 - use write_atomic() in set_pte().
 - introduce read_pte().
---
Changes in V4:
 - move definitions of XEN_VIRT_SIZE, BOOT_FDT_VIRT_{START,SIZE}, FIXMAP_{BASE,ADDR}
   below XEN_VIRT_START to have definitions appear in order.
 - define FIX_LAST as (FIX_MISC + 1) to have a guard slot at the end.
 - s/enumerated/numbered in the comment
 - update the cycle which looks for L1 page table in setup_fixmap_mapping_function() and
   the comment above him.
 - drop fences inside write_pte() and put 'fence rw,rw' in setup_fixmap() before sfence_vma().
 - update the commit message
 - drop printk message inside setup_fixmap().
---
Changes in V3:
 - s/XEN_SIZE/XEN_VIRT_SIZE
 - drop usage of XEN_VIRT_END.
 - sort newly introduced defines in config.h by address
 - code style fixes
 - drop runtime check of that pte is valid as it was checked in L1 page table finding cycle by BUG_ON().
 - update implementation of write_pte() with FENCE rw, rw.
 - add BUILD_BUG_ON() to check that amount of entries aren't bigger then entries in page table.
 - drop set_fixmap, clear_fixmap declarations as they aren't used and defined now
 - update the commit message.
 - s/__ASM_FIXMAP_H/ASM_FIXMAP_H
 - add SPDX-License-Identifier: GPL-2.0 
---
 xen/arch/riscv/include/asm/config.h | 16 ++++++++--
 xen/arch/riscv/include/asm/fixmap.h | 46 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/mm.h     |  2 ++
 xen/arch/riscv/include/asm/page.h   | 13 ++++++++
 xen/arch/riscv/mm.c                 | 43 +++++++++++++++++++++++++++
 xen/arch/riscv/setup.c              |  2 ++
 xen/arch/riscv/xen.lds.S            |  2 +-
 7 files changed, 121 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/riscv/include/asm/fixmap.h

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 50583aafdc..7dbb235685 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -41,8 +41,10 @@
  * Start addr          | End addr         | Slot       | area description
  * ============================================================================
  *                   .....                 L2 511          Unused
- *  0xffffffffc0600000  0xffffffffc0800000 L2 511          Fixmap
- *  0xffffffffc0200000  0xffffffffc0600000 L2 511          FDT
+ *  0xffffffffc0a00000  0xffffffffc0c00000 L2 511          Fixmap
+ *                   ..... ( 2 MB gap )
+ *  0xffffffffc0400000  0xffffffffc0800000 L2 511          FDT
+ *                   ..... ( 2 MB gap )
  *  0xffffffffc0000000  0xffffffffc0200000 L2 511          Xen
  *                   .....                 L2 510          Unused
  *  0x3200000000        0x7f40000000       L2 200-509      Direct map
@@ -74,6 +76,16 @@
 #error "unsupported RV_STAGE1_MODE"
 #endif
 
+#define GAP_SIZE                MB(2)
+
+#define XEN_VIRT_SIZE           MB(2)
+
+#define BOOT_FDT_VIRT_START     (XEN_VIRT_START + XEN_VIRT_SIZE + GAP_SIZE)
+#define BOOT_FDT_VIRT_SIZE      MB(4)
+
+#define FIXMAP_BASE \
+    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE + GAP_SIZE)
+
 #define DIRECTMAP_SLOT_END      509
 #define DIRECTMAP_SLOT_START    200
 #define DIRECTMAP_VIRT_START    SLOTN(DIRECTMAP_SLOT_START)
diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
new file mode 100644
index 0000000000..63732df36c
--- /dev/null
+++ b/xen/arch/riscv/include/asm/fixmap.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * fixmap.h: compile-time virtual memory allocation
+ */
+#ifndef ASM_FIXMAP_H
+#define ASM_FIXMAP_H
+
+#include <xen/bug.h>
+#include <xen/page-size.h>
+#include <xen/pmap.h>
+
+#include <asm/page.h>
+
+#define FIXMAP_ADDR(n) (FIXMAP_BASE + (n) * PAGE_SIZE)
+
+/* Fixmap slots */
+#define FIX_PMAP_BEGIN (0) /* Start of PMAP */
+#define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */
+#define FIX_MISC (FIX_PMAP_END + 1)  /* Ephemeral mappings of hardware */
+
+#define FIX_LAST FIX_MISC
+
+#define FIXADDR_START FIXMAP_ADDR(0)
+#define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST + 1)
+
+#ifndef __ASSEMBLY__
+
+/*
+ * Direct access to xen_fixmap[] should only happen when {set,
+ * clear}_fixmap() is unusable (e.g. where we would end up to
+ * recursively call the helpers).
+ */
+extern pte_t xen_fixmap[];
+
+#define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
+
+static inline unsigned int virt_to_fix(vaddr_t vaddr)
+{
+    BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
+
+    return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* ASM_FIXMAP_H */
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 25af9e1aaa..a0bdc2bc3a 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -255,4 +255,6 @@ static inline unsigned int arch_get_dma_bitsize(void)
     return 32; /* TODO */
 }
 
+void setup_fixmap_mappings(void);
+
 #endif /* _ASM_RISCV_MM_H */
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index c831e16417..a7419b93b2 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -9,6 +9,7 @@
 #include <xen/bug.h>
 #include <xen/types.h>
 
+#include <asm/atomic.h>
 #include <asm/mm.h>
 #include <asm/page-bits.h>
 
@@ -81,6 +82,18 @@ static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
     BUG_ON("unimplemented");
 }
 
+/* Write a pagetable entry. */
+static inline void write_pte(pte_t *p, pte_t pte)
+{
+    write_atomic(p, pte);
+}
+
+/* Read a pagetable entry. */
+static inline pte_t read_pte(pte_t *p)
+{
+    return read_atomic(p);
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PAGE_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 7d09e781bf..b8ff91cf4e 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -12,6 +12,7 @@
 #include <asm/early_printk.h>
 #include <asm/csr.h>
 #include <asm/current.h>
+#include <asm/fixmap.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 
@@ -49,6 +50,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PAGETABLE_ENTRIES];
 
+pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+xen_fixmap[PAGETABLE_ENTRIES];
+
 #define HANDLE_PGTBL(curr_lvl_num)                                          \
     index = pt_index(curr_lvl_num, page_addr);                              \
     if ( pte_is_valid(pgtbl[index]) )                                       \
@@ -191,6 +195,45 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
     return is_mode_supported;
 }
 
+void __init setup_fixmap_mappings(void)
+{
+    pte_t *pte, tmp;
+    unsigned int i;
+
+    BUILD_BUG_ON(FIX_LAST >= PAGETABLE_ENTRIES);
+
+    pte = &stage1_pgtbl_root[pt_index(HYP_PT_ROOT_LEVEL, FIXMAP_ADDR(0))];
+
+    /*
+     * In RISC-V page table levels are numbered from Lx to L0 where
+     * x is the highest page table level for currect  MMU mode ( for example,
+     * for Sv39 has 3 page tables so the x = 2 (L2 -> L1 -> L0) ).
+     *
+     * In this cycle we want to find L1 page table because as L0 page table
+     * xen_fixmap[] will be used.
+     */
+    for ( i = HYP_PT_ROOT_LEVEL; i-- > 1; )
+    {
+        BUG_ON(!pte_is_valid(*pte));
+
+        pte = (pte_t *)LOAD_TO_LINK(pte_to_paddr(*pte));
+        pte = &pte[pt_index(i, FIXMAP_ADDR(0))];
+    }
+
+    BUG_ON(pte_is_valid(*pte));
+
+    tmp = paddr_to_pte(LINK_TO_LOAD((unsigned long)&xen_fixmap), PTE_TABLE);
+    write_pte(pte, tmp);
+
+    RISCV_FENCE(rw, rw);
+    sfence_vma();
+
+    /*
+     * We only need the zeroeth table allocated, but not the PTEs set, because
+     * set_fixmap() will set them on the fly.
+     */
+}
+
 /*
  * setup_initial_pagetables:
  *
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 4defad68f4..13f0e8c77d 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -46,6 +46,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
     test_macros_from_bug_h();
 #endif
 
+    setup_fixmap_mappings();
+
     printk("All set up\n");
 
     for ( ;; )
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 070b19d915..7a683f6065 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -181,6 +181,6 @@ ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
  * Changing the size of Xen binary can require an update of
  * PGTBL_INITIAL_COUNT.
  */
-ASSERT(_end - _start <= MB(2), "Xen too large for early-boot assumptions")
+ASSERT(_end - _start <= XEN_VIRT_SIZE, "Xen too large for early-boot assumptions")
 
 ASSERT(_ident_end - _ident_start <= IDENT_AREA_SIZE, "identity region is too big");
-- 
2.46.0


