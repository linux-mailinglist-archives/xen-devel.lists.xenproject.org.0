Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FD494D47D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 18:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774847.1185257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLL-0001oW-6x; Fri, 09 Aug 2024 16:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774847.1185257; Fri, 09 Aug 2024 16:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLL-0001lM-2C; Fri, 09 Aug 2024 16:19:55 +0000
Received: by outflank-mailman (input) for mailman id 774847;
 Fri, 09 Aug 2024 16:19:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3r+=PI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1scSLJ-0001id-RD
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 16:19:53 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 353d8451-566b-11ef-bc04-fd08da9f4363;
 Fri, 09 Aug 2024 18:19:52 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ef2c56da6cso24210571fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 09:19:52 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de481f09sm1028479e87.285.2024.08.09.09.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 09:19:51 -0700 (PDT)
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
X-Inumbo-ID: 353d8451-566b-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723220392; x=1723825192; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+rGL53DR8g+1PldoLMvMKzqZyZHWG7XWVOFuQUg5t4=;
        b=BjLPE3yaUFBKIFuF5uv6hY2pWtkI0LVTNLQk0KY3k1GSXhMkml20CXCQ0AZNn537QU
         I+ipRF/YndguVkElFyDNLgTGAOEGEbl6qEoRvjAk15EzcbFM38uFNFEZfoqt0lfgxsAV
         ZInQs6BSZx71r1hD466I5L4zoUkIDzY33Bfth2ZN3LkESF/rslsVGXlAiTAwEEP/TJ0u
         Lw5YAtHeJLrgWc4rblLt0YmhqL6SveF5wEW9cCRsfGJO68S2nIn0kroKTxJJleBh5E53
         DdEtyu7hePwRSFq2NnWRbQJJXaAIxz9GDOz4L2YRJ4xBGaliYmtxqNYASTSevnfAO1Gc
         Uqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220392; x=1723825192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+rGL53DR8g+1PldoLMvMKzqZyZHWG7XWVOFuQUg5t4=;
        b=C5bsMUXgJdQqtIaebQ7VJ+4rpFiZVTtnUyjHS+uUHhkS3g73ZIuSPYMcZFbDZRakaK
         dEp6z4TybEUlUNIdLrTtMQZJvCVGG2xoqXLETRIFhEuZVmq4J1SffCOI6HJDjUXs6lgJ
         qPP89fy1A+ic0lDXtHwgbRD201HV+Rulzvvzg12gedZDpZxhJGeumSCOQmGfNoio0z9r
         XDki0x0nBY4zMKQg3RjLSNfViKIKBfNeU9GlGOxjWCihHCPWba2qsm4bwRD7ceVTRHfY
         5dSSULRGB3jIwOpM8LsojazU9rDnVfwoPjDXOlATsC9gwpV1ziHJPFXcuu5dGKilK5ux
         2HZg==
X-Gm-Message-State: AOJu0YxdXM9hNws8+4DvWOLUxLJ/u8E3lhViKsoxneMEUN0XRN3q6v21
	35jfyfsDXhtFkLSQTjyoBJbZi+Fyn22jsYztqOcSS/f4Iet1oSPSOtKgkA==
X-Google-Smtp-Source: AGHT+IElnAVZxzNp1lHvVLN6ebdKd5oOVm+ueArvtZAFYVO8PyYipTsWQTeP1Lkmegy5GnNEisenOg==
X-Received: by 2002:a05:6512:ad5:b0:52e:f9f1:c13a with SMTP id 2adb3069b0e04-530ee9818a2mr1631118e87.12.1723220391572;
        Fri, 09 Aug 2024 09:19:51 -0700 (PDT)
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
Subject: [PATCH v4 2/7] xen/riscv: set up fixmap mappings
Date: Fri,  9 Aug 2024 18:19:40 +0200
Message-ID: <1c1c0f912a9abbb542baa1ce92e75d64ec8043e9.1723214540.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1723214540.git.oleksii.kurochko@gmail.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set up fixmap mappings and the L0 page table for fixmap support.

Define new macros in riscv/config.h for calculating
the FIXMAP_BASE address, including BOOT_FDT_VIRT_{START, SIZE},
XEN_VIRT_SIZE, and XEN_VIRT_END.

Update the check for Xen size in riscv/lds.S to use
XEN_VIRT_SIZE instead of a hardcoded constant.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - move definitions of XEN_VIRT_SIZE, BOOT_FDT_VIRT_{START,SIZE}, FIXMAP_{BASE,ADDR}
   below XEN_VIRT_START to have definitions appear in order.
 - define FIX_LAST as (FIX_MISC + 1) to have a guard slot at the end.
 - s/enumerated/numbered in the comment
 - update the cycle which looks for L1 page table in setup_fixmap_mapping_function() and
   the comment above him.
 - drop fences inside write_pte() and put 'fence r,r' in setup_fixmap() before sfence_vma().
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
 xen/arch/riscv/include/asm/config.h |  8 ++++++
 xen/arch/riscv/include/asm/fixmap.h | 44 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/mm.h     |  2 ++
 xen/arch/riscv/include/asm/page.h   |  6 ++++
 xen/arch/riscv/mm.c                 | 43 ++++++++++++++++++++++++++++
 xen/arch/riscv/setup.c              |  2 ++
 xen/arch/riscv/xen.lds.S            |  2 +-
 7 files changed, 106 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/fixmap.h

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 50583aafdc..4b4cc529a9 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -74,6 +74,14 @@
 #error "unsupported RV_STAGE1_MODE"
 #endif
 
+#define XEN_VIRT_SIZE           MB(2)
+
+#define BOOT_FDT_VIRT_START     (XEN_VIRT_START + XEN_VIRT_SIZE)
+#define BOOT_FDT_VIRT_SIZE      MB(4)
+
+#define FIXMAP_BASE             (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
+#define FIXMAP_ADDR(n)          (FIXMAP_BASE + (n) * PAGE_SIZE)
+
 #define DIRECTMAP_SLOT_END      509
 #define DIRECTMAP_SLOT_START    200
 #define DIRECTMAP_VIRT_START    SLOTN(DIRECTMAP_SLOT_START)
diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
new file mode 100644
index 0000000000..2ecd05dd9f
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
+#define FIX_LAST (FIX_MISC + 1) /* +1 means a guard slot */
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
index c831e16417..5db3edb100 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -81,6 +81,12 @@ static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
     BUG_ON("unimplemented");
 }
 
+/* Write a pagetable entry. */
+static inline void write_pte(pte_t *p, pte_t pte)
+{
+    *p = pte;
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
2.45.2


