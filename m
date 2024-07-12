Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1547E92FE63
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:23:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758171.1167567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ37-0000hh-I6; Fri, 12 Jul 2024 16:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758171.1167567; Fri, 12 Jul 2024 16:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ37-0000bo-3S; Fri, 12 Jul 2024 16:23:09 +0000
Received: by outflank-mailman (input) for mailman id 758171;
 Fri, 12 Jul 2024 16:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSJ35-0008O1-8Q
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:23:07 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0433258d-406b-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 18:23:04 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a77cc73d35fso578310766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 09:23:04 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ffa13sm358464966b.129.2024.07.12.09.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:23:03 -0700 (PDT)
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
X-Inumbo-ID: 0433258d-406b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720801384; x=1721406184; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiCQr1BuhZqgp4BT/aK5SpqOx731stYHJnnEoVaWdiY=;
        b=jMjMhRqs2rYmIUrAOU3FEbQBQTci/7E3K+GuI5PN5Hu7Z+9MGOYTkFjCMqqKQJkNon
         erfVVe8uD2DigcYq31cmZl3NeWdqJMw4hoKZumDMRrXff//BTBdoNkMUOcp2Zu9801C+
         MkxOJqrFZ4E+aOdElagsGphXpRB5Nz+2mnceP4FEFHie7ldyMGWOpTln1sdyryJrUs+A
         xk8sDQ1MqNnaQxmLt8kESdoqBkFtM/fj6guMpJu1YQvMC/7Tza63azhY0oGN5KyclIXV
         Hh4xmUFsidSVdt3out8KCuI1d3LqUpnN4S+fvqbW0AUwLzgVhIeWO7ZpH7PTuh21R6hg
         ae3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801384; x=1721406184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eiCQr1BuhZqgp4BT/aK5SpqOx731stYHJnnEoVaWdiY=;
        b=OOu5lrXnei91BSUpUEog1WT2k0Y/NhFTEWP7ipTTni5nCas4QweJfKGaTY4OrsQOCN
         rceGouLypx/nSDECSIYH5KLeQxZEwbGICS+9b2W3/3lMrwHqoOjJXlqrC/5iFkh50ZXC
         rz10QpnBGzttpY6ndcG55xy8HxhjrQVlJMaDL3+ZluVYm4iG0wQE0PXIkbipPYiULmUq
         wHczjybK0BmVCC/P4wf4QCaBbta4vDU4meXQU/7y3IJrZjj6+0AFHmtb3ccQwfIiTdZV
         wdjkHY6LhpD4MAsbQwUBjd0gwtXYBaaOkqhmPCPYNDV/mPMOOgsBI/bJdSzXi1bgZVGM
         Q8MQ==
X-Gm-Message-State: AOJu0YyLM2YzzxSno3rJwqMects7XXG24/7ENfJsScJncX1o6udRtU/L
	d19S+amg8dz9yhknizzd1tKH2MS+A7cPTzPJN99rMjAQ2TMAX/IDyZiJ40QG
X-Google-Smtp-Source: AGHT+IGZcF6qjdB1uApmKaBeqzPxwBZXy58jd0MovIoZR4nIchXdEcdHWmRHtyEXnlUWr9/FE4wHkw==
X-Received: by 2002:a17:907:6d03:b0:a72:7ede:4d12 with SMTP id a640c23a62f3a-a799d3019bcmr297516366b.5.1720801383977;
        Fri, 12 Jul 2024 09:23:03 -0700 (PDT)
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
Subject: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
Date: Fri, 12 Jul 2024 18:22:53 +0200
Message-ID: <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720799925.git.oleksii.kurochko@gmail.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a function to set up fixmap mappings and L0 page
table for fixmap.

Additionally, defines were introduced in riscv/config.h to
calculate the FIXMAP_BASE address.
This involved introducing BOOT_FDT_VIRT_{START, SIZE} and
XEN_SIZE, XEN_VIRT_END.

Also, the check of Xen size was updated in the riscv/lds.S
script to use XEN_SIZE instead of a hardcoded constant.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - newly introduced patch
---
 xen/arch/riscv/include/asm/config.h |  9 ++++++
 xen/arch/riscv/include/asm/fixmap.h | 48 +++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/mm.h     |  2 ++
 xen/arch/riscv/include/asm/page.h   |  7 +++++
 xen/arch/riscv/mm.c                 | 35 +++++++++++++++++++++
 xen/arch/riscv/setup.c              |  2 ++
 xen/arch/riscv/xen.lds.S            |  2 +-
 7 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/riscv/include/asm/fixmap.h

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index 50583aafdc..3275477c17 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -74,11 +74,20 @@
 #error "unsupported RV_STAGE1_MODE"
 #endif
 
+#define XEN_SIZE                MB(2)
+#define XEN_VIRT_END            (XEN_VIRT_START + XEN_SIZE)
+
+#define BOOT_FDT_VIRT_START     XEN_VIRT_END
+#define BOOT_FDT_VIRT_SIZE      MB(4)
+
 #define DIRECTMAP_SLOT_END      509
 #define DIRECTMAP_SLOT_START    200
 #define DIRECTMAP_VIRT_START    SLOTN(DIRECTMAP_SLOT_START)
 #define DIRECTMAP_SIZE          (SLOTN(DIRECTMAP_SLOT_END) - SLOTN(DIRECTMAP_SLOT_START))
 
+#define FIXMAP_BASE             (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
+#define FIXMAP_ADDR(n)          (FIXMAP_BASE + (n) * PAGE_SIZE)
+
 #define FRAMETABLE_SCALE_FACTOR  (PAGE_SIZE/sizeof(struct page_info))
 #define FRAMETABLE_SIZE_IN_SLOTS (((DIRECTMAP_SIZE / SLOTN(1)) / FRAMETABLE_SCALE_FACTOR) + 1)
 
diff --git a/xen/arch/riscv/include/asm/fixmap.h b/xen/arch/riscv/include/asm/fixmap.h
new file mode 100644
index 0000000000..fcfb82d69c
--- /dev/null
+++ b/xen/arch/riscv/include/asm/fixmap.h
@@ -0,0 +1,48 @@
+/*
+ * fixmap.h: compile-time virtual memory allocation
+ */
+#ifndef __ASM_FIXMAP_H
+#define __ASM_FIXMAP_H
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
+/* Map a page in a fixmap entry */
+extern void set_fixmap(unsigned int map, mfn_t mfn, unsigned int attributes);
+/* Remove a mapping from a fixmap entry */
+extern void clear_fixmap(unsigned int map);
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
+#endif /* __ASM_FIXMAP_H */
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
index c831e16417..cbbf3656d1 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -81,6 +81,13 @@ static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
     BUG_ON("unimplemented");
 }
 
+/* Write a pagetable entry. */
+static inline void write_pte(pte_t *p, pte_t pte)
+{
+    *p = pte;
+    asm volatile ("sfence.vma");
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PAGE_H */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 7d09e781bf..d69a174b5d 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -49,6 +49,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
 pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
 stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT * PAGETABLE_ENTRIES];
 
+pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
+xen_fixmap[PAGETABLE_ENTRIES];
+
 #define HANDLE_PGTBL(curr_lvl_num)                                          \
     index = pt_index(curr_lvl_num, page_addr);                              \
     if ( pte_is_valid(pgtbl[index]) )                                       \
@@ -191,6 +194,38 @@ static bool __init check_pgtbl_mode_support(struct mmu_desc *mmu_desc,
     return is_mode_supported;
 }
 
+void __init setup_fixmap_mappings(void)
+{
+    pte_t *pte;
+    unsigned int i;
+
+    pte = &stage1_pgtbl_root[pt_index(HYP_PT_ROOT_LEVEL, FIXMAP_ADDR(0))];
+
+    for ( i = HYP_PT_ROOT_LEVEL - 1; i != 0; i-- )
+    {
+        BUG_ON(!pte_is_valid(*pte));
+
+        pte = (pte_t *)LOAD_TO_LINK(pte_to_paddr(*pte));
+        pte = &pte[pt_index(i, FIXMAP_ADDR(0))];
+    }
+
+    BUG_ON( pte_is_valid(*pte) );
+
+    if ( !pte_is_valid(*pte) )
+    {
+        pte_t tmp = paddr_to_pte(LINK_TO_LOAD((unsigned long)&xen_fixmap), PTE_TABLE);
+
+        write_pte(pte, tmp);
+
+        printk("(XEN) fixmap is mapped\n");
+    }
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
index 070b19d915..63b1dd7bb6 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -181,6 +181,6 @@ ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
  * Changing the size of Xen binary can require an update of
  * PGTBL_INITIAL_COUNT.
  */
-ASSERT(_end - _start <= MB(2), "Xen too large for early-boot assumptions")
+ASSERT(_end - _start <= XEN_SIZE, "Xen too large for early-boot assumptions")
 
 ASSERT(_ident_end - _ident_start <= IDENT_AREA_SIZE, "identity region is too big");
-- 
2.45.2


