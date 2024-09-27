Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E73988934
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806454.1217850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDyg-0007Pw-7L; Fri, 27 Sep 2024 16:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806454.1217850; Fri, 27 Sep 2024 16:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDyg-0007OP-4e; Fri, 27 Sep 2024 16:37:58 +0000
Received: by outflank-mailman (input) for mailman id 806454;
 Fri, 27 Sep 2024 16:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDuN-0001aC-T9
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:31 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39931e38-7cee-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 18:33:28 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f761461150so35137521fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:28 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27d47a2sm150697966b.89.2024.09.27.09.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:33:26 -0700 (PDT)
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
X-Inumbo-ID: 39931e38-7cee-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454807; x=1728059607; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwSoUGEZl7grVzkdzdM2ghnra4ddaVuK/Ny9WfROoWY=;
        b=NJ6sstZUveYpMf/i8cUHoztTVKumMKYYozyZaqJXft4DqggqxThvHStDnIWFGU/54J
         v9s09jvsCDc//3bR0ZIvuObp4iVvNz86biQUhSVzZYrYgtYd7v7Gte0HvI0318rjcRDG
         FqzI2n5/tjaLEXL71WWICS6JYf9LT7zzZerVCzm5RMLd/itYrdr+Z5e3Cq+ESfr5ELxP
         HhAay1MZ/Y01fFXg6LTpTWUmemCB9rS2OOelumLP/yf0P6PrU7KuPZBk+vr5YhUTAs16
         MvnU25j8/t+fMK4bo6SSPjMkDaGylH6cDqTgi62YpEqjuLXliNFBETDTfqVGvUpKHxKU
         7kSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454807; x=1728059607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BwSoUGEZl7grVzkdzdM2ghnra4ddaVuK/Ny9WfROoWY=;
        b=KxJSSxA4+gtPhmYiLuqbcsdEI6GCvb+BHjZxKBcWLD+cTt8FU6YhbsHEFFbhpfK7MQ
         ylwtNMfBwajmaWj+aZXSBFvGwo19RRQJSacFv+hukuUHfaPrhwBEX116t/djmuZNDo2A
         hahnTFM10yYipTZBQx3lPm+m7+8ycwDb5aobk2XbSPzTL11OxratiydCuzN6xKCmK9D5
         BaZS5WWFYrWRLB5bOCfBP5RUjLlxDD2Vs9IyiySbKxQFD3oYDXzJiLbO4zcmtpfkWPzK
         xCrwnTHUNwU8kTrCtuIXKb9NE8pPq/A1SiouRCaFIt/Id3J/uPn74Zz3bFBQ4BS2HzYm
         PeRA==
X-Gm-Message-State: AOJu0YzAHT2fRUu6rcWDRL/F++yxBsegeVMHJEl8K3h+FuWMl7Fua5rm
	2SiG+MDyMO9z/1efW3yIpvuIXnjLKFwu5wDC5tMp03L3Db4A7/pARfac2g==
X-Google-Smtp-Source: AGHT+IH5CH+SY/GIpkAiTnx4/CnjlsFKE+BAUA496qjogEk9Pmzyrb0HX0xmG+p2IYfvi15tJJHr3w==
X-Received: by 2002:a05:6512:3e05:b0:52c:cd77:fe03 with SMTP id 2adb3069b0e04-5389fc3bd31mr3443461e87.14.1727454806952;
        Fri, 27 Sep 2024 09:33:26 -0700 (PDT)
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
Subject: [PATCH v8 2/7] xen/riscv: set up fixmap mappings
Date: Fri, 27 Sep 2024 18:33:14 +0200
Message-ID: <87bc91db10442273d3f99cd1777571515b287297.1727449154.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727449154.git.oleksii.kurochko@gmail.com>
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set up fixmap mappings and the L0 page table for fixmap support.

Modify the PTEs (xen_fixmap[]) directly in arch_pmap_map() instead
of using set_fixmap() which is expected to be implemented using
map_pages_to_xen(), which, in turn, is expected to use
arch_pmap_map() during early boot, resulting in a loop.

Define new macros in riscv/config.h for calculating
the FIXMAP_BASE address, including BOOT_FDT_VIRT_{START, SIZE},
XEN_VIRT_SIZE, and XEN_VIRT_END.

Update the check for Xen size in riscv/xen.lds.S to use
XEN_VIRT_SIZE instead of a hardcoded constant.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index c831e16417..d4a5009823 100644
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
+static inline pte_t read_pte(const pte_t *p)
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
index 97c599db44..82c5752da1 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -47,6 +47,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
     test_macros_from_bug_h();
 #endif
 
+    setup_fixmap_mappings();
+
     printk("All set up\n");
 
     machine_halt();
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 871b47a235..558a5a992a 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -174,6 +174,6 @@ ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
  * Changing the size of Xen binary can require an update of
  * PGTBL_INITIAL_COUNT.
  */
-ASSERT(_end - _start <= MB(2), "Xen too large for early-boot assumptions")
+ASSERT(_end - _start <= XEN_VIRT_SIZE, "Xen too large for early-boot assumptions")
 
 ASSERT(_ident_end - _ident_start <= IDENT_AREA_SIZE, "identity region is too big");
-- 
2.46.1


