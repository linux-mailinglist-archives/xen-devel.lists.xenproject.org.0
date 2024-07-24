Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5593B3AE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764293.1174740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdy5-0008HI-QY; Wed, 24 Jul 2024 15:31:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764293.1174740; Wed, 24 Jul 2024 15:31:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWdy5-00087U-Lc; Wed, 24 Jul 2024 15:31:53 +0000
Received: by outflank-mailman (input) for mailman id 764293;
 Wed, 24 Jul 2024 15:31:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdy3-0005Od-KJ
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:51 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d81d47e1-49d1-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 17:31:49 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eefe705510so76141901fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:49 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef2b568858sm13237311fa.35.2024.07.24.08.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:48 -0700 (PDT)
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
X-Inumbo-ID: d81d47e1-49d1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835109; x=1722439909; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5JfDcjOdJ3XraQIsEMUmJEphHgWVY7ZxFBh+8Ru7ag=;
        b=iRvZPcocC+w/FdK0I8LwGhnr8ofeVKtLyOTcCuXfJnEXHtG5Yo38dkUMp7R2bFPa+y
         DliwlVuexEAb4pkrNEtC6ObRmcPUE10pbRj5iFWm1PCsEZVoD669aKaJw44YI/YM4nAU
         sHWLGF0GweaSPPgTQ965oGmSyKECwBVckoiIPJe5uXMwqjaqNsnbQ32xn3Ur7DJRylXa
         MnmVeP8y8JZHuCD3mRB3FzKWCrvYAqWfJPyN8vdGp/LCYy9xk8xgJTCBTcBW6odHeXEh
         9R6UQ/LbwYovpDbZ463Xj247uf9RvwRyn9AOa+zP4RB0nGLlvRhmZXWz50iKZyX0RAlp
         GXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835109; x=1722439909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5JfDcjOdJ3XraQIsEMUmJEphHgWVY7ZxFBh+8Ru7ag=;
        b=FtHtxfwZ2pbJULL9tb0FBnfW8wPDiZ8ZItKaKhX4n31cOUuODanJrMky16T/aXuQdG
         ZJcb4Yd/oGF5iaNyElqx2H93UIWQzBkQKxptUp4DtfN6RXcCClRNG4RWh5Y52o0rrrB7
         U8nL2mDKo+Osv9MgKbHEN+5oDXZJXPkbWqgr0VLx4RvRMY1YgnPgoqpIbQgmgtrix3mN
         4q6EM/8+teqHjiyOH3z6RlkXEmAcTScqyVKMQRjTW9+FUnoVVVpZcYgwqo0bhrGEGW5e
         E6aZean+gu8Xb9ckI8gcGm59oeAKuClZYy+uK5xDOBCz00L4q0M/p6pterUfmTAvhHli
         MCow==
X-Gm-Message-State: AOJu0YydUWrxeHeBcPGmHaEsmEEKiYbX6DXoOPpYMlDqnj/3T8vxAWQh
	gxbIs6CdRGc5K3vLf1tCzl85u+vjfG4LoeO9QNNUYTBq/n2eSDmGZGxSF2tb
X-Google-Smtp-Source: AGHT+IFiBgT3XwFsReTDHlEwUN/Jqa4gn0ffbAC+D7oyHWup6bKLbWzzuzfNPdDOsXX1Le1M97rjNw==
X-Received: by 2002:a2e:9dc2:0:b0:2ef:23ec:9356 with SMTP id 38308e7fff4ca-2f039c4e0cdmr1827781fa.8.1721835108566;
        Wed, 24 Jul 2024 08:31:48 -0700 (PDT)
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
Subject: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
Date: Wed, 24 Jul 2024 17:31:35 +0200
Message-ID: <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721834549.git.oleksii.kurochko@gmail.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a function to set up fixmap mappings and L0 page
table for fixmap.

Additionally, defines were introduced in riscv/config.h to
calculate the FIXMAP_BASE address.
This involved introducing BOOT_FDT_VIRT_{START, SIZE} and
XEN_VIRT_SIZE, XEN_VIRT_END.

Also, the check of Xen size was updated in the riscv/lds.S
script to use XEN_VIRT_SIZE instead of a hardcoded constant.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/config.h |  8 +++++
 xen/arch/riscv/include/asm/fixmap.h | 44 +++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/mm.h     |  2 ++
 xen/arch/riscv/include/asm/page.h   |  9 ++++++
 xen/arch/riscv/mm.c                 | 47 +++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c              |  2 ++
 xen/arch/riscv/xen.lds.S            |  2 +-
 7 files changed, 113 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/fixmap.h

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 50583aafdc..f517684cbb 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -66,6 +66,14 @@
 #define SLOTN_ENTRY_BITS        (HYP_PT_ROOT_LEVEL * VPN_BITS + PAGE_SHIFT)
 #define SLOTN(slot)             (_AT(vaddr_t, slot) << SLOTN_ENTRY_BITS)
 
+#define XEN_VIRT_SIZE           MB(2)
+
+#define BOOT_FDT_VIRT_START     (XEN_VIRT_START + XEN_VIRT_SIZE)
+#define BOOT_FDT_VIRT_SIZE      MB(4)
+
+#define FIXMAP_BASE             (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
+#define FIXMAP_ADDR(n)          (FIXMAP_BASE + (n) * PAGE_SIZE)
+
 #if RV_STAGE1_MODE == SATP_MODE_SV39
 #define XEN_VIRT_START 0xFFFFFFFFC0000000
 #elif RV_STAGE1_MODE == SATP_MODE_SV48
diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
new file mode 100644
index 0000000000..d3f5ee4944
--- /dev/null
+++ b/xen/arch/riscv/include/asm/fixmap.h
@@ -0,0 +1,44 @@
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
+/* Fixmap slots */
+#define FIX_PMAP_BEGIN (0) /* Start of PMAP */
+#define FIX_PMAP_END (FIX_PMAP_BEGIN + NUM_FIX_PMAP - 1) /* End of PMAP */
+#define FIX_MISC (FIX_PMAP_END + 1)  /* Ephemeral mappings of hardware */
+
+#define FIX_LAST FIX_MISC
+
+#define FIXADDR_START FIXMAP_ADDR(0)
+#define FIXADDR_TOP FIXMAP_ADDR(FIX_LAST)
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
index c831e16417..0cc2f37cf8 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -11,6 +11,7 @@
 
 #include <asm/mm.h>
 #include <asm/page-bits.h>
+#include <asm/system.h>
 
 #define VPN_MASK                    (PAGETABLE_ENTRIES - 1UL)
 
@@ -81,6 +82,14 @@ static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
     BUG_ON("unimplemented");
 }
 
+/* Write a pagetable entry. */
+static inline void write_pte(pte_t *p, pte_t pte)
+{
+    RISCV_FENCE(rw, rw);
+    *p = pte;
+    RISCV_FENCE(rw, rw);
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PAGE_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 7d09e781bf..35724505ec 100644
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
@@ -191,6 +195,49 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
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
+     * In RISC-V page table levels are enumerated from Lx to L0 where
+     * x is the highest page table level for currect  MMU mode ( for example,
+     * for Sv39 has 3 page tables so the x = 2 (L2 -> L1 -> L0) ).
+     *
+     * In this cycle we want to find L1 page table because as L0 page table
+     * xen_fixmap[] will be used.
+     *
+     * i is defined ( HYP_PT_ROOT_LEVEL - 1 ) becuase pte for L2 ( in
+     * case of Sv39 ) has been recieved above.
+     */
+    for ( i = HYP_PT_ROOT_LEVEL - 1; i != 0; i-- )
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
+    sfence_vma();
+
+    printk("(XEN) fixmap is mapped\n");
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
2.45.2


