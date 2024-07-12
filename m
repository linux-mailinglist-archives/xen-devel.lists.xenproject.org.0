Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E09792FE60
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:23:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758172.1167574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ38-0000ud-4I; Fri, 12 Jul 2024 16:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758172.1167574; Fri, 12 Jul 2024 16:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ37-0000lD-RD; Fri, 12 Jul 2024 16:23:09 +0000
Received: by outflank-mailman (input) for mailman id 758172;
 Fri, 12 Jul 2024 16:23:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSJ36-00088h-2K
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:23:08 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05ac88bb-406b-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 18:23:07 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a77b60cafecso282126166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 09:23:07 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ffa13sm358464966b.129.2024.07.12.09.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:23:06 -0700 (PDT)
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
X-Inumbo-ID: 05ac88bb-406b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720801386; x=1721406186; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tAQCFotTkzWpbcCEY17RKs5ihbwYU4L2egMLjkuPzI=;
        b=H+A6xc54tUQNbpqPZeM7AdGrfphiLrLQVF9BT7H/0nAH0jLarXksyIVJCf1i48qSVh
         W+JtYYQ1v7wy6MRPdP0UOK1sP0pjI5wpyLa5B3v1xBQxYynDH8/IXbrnVuuj7Bt5Jag4
         F687IlSJSy8z38NhHxUeR8AvhVCOLc5hEdmAtfGg7tADhgrU6z1RqqsOW2akKMRXwZwB
         ZsilAFfqEZarRxF+WRantTPUbVmT1V6UOdK6qi3E9xybYSxHJF4+qLR7Pf+qNZheEwV2
         h7ZIxewEoFoHHItI2G/5kN7OOeOXj/VgkKqtU1qrAI6Dq/13Afv5RnvUiceodpmhRAkH
         Efiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801386; x=1721406186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tAQCFotTkzWpbcCEY17RKs5ihbwYU4L2egMLjkuPzI=;
        b=vlZaCNbHrZBsVLuswV9AaBUzomjvcWgBZ2PXdKOcLrcmhCvKb/2XrmWESSfAxL2BfS
         GUgWnl2rr5yM0bVv8RsISNfPlNd92QuT/v9jD0xs+ahZWQ3EwCkt9AiXlvqFo4bt1VNT
         3ZxqbiS9lyahQa7TJlFwM/GFlNa1G9ttNtOCN+HUEoixPO7cy6zEULibhbewZL51JinP
         Lv10HHrVwfhP455F9I2azibq75pu/kqkZde82fkPXa5b0hb9C7cAy5M/vMd4KD8KO392
         fd1EH8Z1H6w9JiSY9IAwQuaYz/0p4MsQgRYyjzT+bRuQP2nMUWIT5+11dQ4JNtQJzrKP
         1OXg==
X-Gm-Message-State: AOJu0YxcsZgf5JrNpPqnsRFuIQU/fbtAlS9K+sZEyZnkHQxqM+WFsfxa
	YVoN18/SSMD9POY4dPObMRIGK/UyWD5mLwpCvig3fGRVRgysIp0ZDOxiETXN
X-Google-Smtp-Source: AGHT+IGU0EVtnlXSs7iV0mEKpEinafKa+k0K4nCPdZBW+AYcPo7BKPJxYX3zuqg01vri+w90KvZMEg==
X-Received: by 2002:a17:906:4119:b0:a72:46f3:ffc4 with SMTP id a640c23a62f3a-a780b6b196emr762454166b.26.1720801386586;
        Fri, 12 Jul 2024 09:23:06 -0700 (PDT)
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
Subject: [PATCH v2 7/8] xen/riscv: select CONFIG_GENREIC_PT
Date: Fri, 12 Jul 2024 18:22:56 +0200
Message-ID: <e6406b4eeb9a0efea607427109602cdd4094a7de.1720799926.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720799925.git.oleksii.kurochko@gmail.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable GENERIC_PT functionalities for RISC-V and also introduce some
RISC-V specific functions necessary to make the GENERIC_PT code
work and compilable.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - newly introduced patch
---
 xen/arch/riscv/Kconfig                 |  1 +
 xen/arch/riscv/include/asm/mm.h        |  9 ++++
 xen/arch/riscv/include/asm/page-bits.h | 45 ++++++++++++++++
 xen/arch/riscv/include/asm/page.h      | 73 +++++++++++++++++++++++++-
 xen/arch/riscv/mm.c                    | 63 +++++++++++++++++++---
 5 files changed, 184 insertions(+), 7 deletions(-)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 0112aa8778..9827a12d34 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -2,6 +2,7 @@ config RISCV
 	def_bool y
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
+	select GENERIC_PT
 	select HAS_DEVICE_TREE
 	select HAS_PMAP
 
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index a0bdc2bc3a..c54546c275 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -42,6 +42,8 @@ static inline void *maddr_to_virt(paddr_t ma)
 #define virt_to_mfn(va)     __virt_to_mfn(va)
 #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
 
+#define pte_get_mfn(pte) maddr_to_mfn(pte_to_paddr(pte))
+
 struct page_info
 {
     /* Each frame can be threaded onto a doubly-linked list. */
@@ -238,6 +240,13 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 
 #define PFN_ORDER(pg) ((pg)->v.free.order)
 
+/*
+ *  Generic code that works with page tables expects the page table
+ *  levels to be numbered in the order L0 -> L1 -> ...;
+ *  RISC-V uses the opposite enumeration: Lx -> L1 -> L0
+ */
+#define convert_level(level) (HYP_PT_ROOT_LEVEL - level)
+
 extern unsigned char cpu0_boot_stack[];
 
 void setup_initial_pagetables(void);
diff --git a/xen/arch/riscv/include/asm/page-bits.h b/xen/arch/riscv/include/asm/page-bits.h
index 8f1f474371..1d3a0adda6 100644
--- a/xen/arch/riscv/include/asm/page-bits.h
+++ b/xen/arch/riscv/include/asm/page-bits.h
@@ -3,6 +3,51 @@
 #ifndef __RISCV_PAGE_BITS_H__
 #define __RISCV_PAGE_BITS_H__
 
+/*
+ * PTE format:
+ * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
+ *       PFN      reserved for SW   D   A   G   U   X   W   R   V
+ */
+
+#define _PAGE_PRESENT   BIT(0, UL)
+#define _PAGE_READ      BIT(1, UL)    /* Readable */
+#define _PAGE_WRITE     BIT(2, UL)    /* Writable */
+#define _PAGE_EXEC      BIT(3, UL)    /* Executable */
+#define _PAGE_USER      BIT(4, UL)    /* User */
+#define _PAGE_GLOBAL    BIT(5, UL)    /* Global */
+#define _PAGE_ACCESSED  BIT(6, UL)    /* Set by hardware on any access */
+#define _PAGE_DIRTY     BIT(7, UL)    /* Set by hardware on any write */
+#define _PAGE_SOFT      BIT(8, UL)    /* Reserved for software */
+
+/*
+ * There is no such bits in PTE format for RISC-V.
+ * Most of the definition below are just to make PT generic code happy,
+ * except _PAGE_BLOCK which is used to map 2 MB page table entries.
+ */
+#define _PAGE_BLOCK         BIT(9, UL)
+#define _PAGE_CONTIG        BIT(10, UL)
+#define _PAGE_POPULATE      BIT(11, UL)
+#define MT_NORMAL           BIT(12, UL)
+
+/* Set of bits to preserve across pte_modify() */
+#define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |  \
+                         _PAGE_WRITE | _PAGE_EXEC | \
+                         _PAGE_USER | _PAGE_GLOBAL))
+
+#define PAGE_AI_MASK(x) ((x) & _PAGE_CHG_MASK)
+
+#define _PAGE_W_BIT     2
+#define _PAGE_XN_BIT    3
+#define _PAGE_RO_BIT    1
+
+/* TODO: move to somewhere generic part/header ? */
+#define _PAGE_XN        (1U << _PAGE_XN_BIT)
+#define _PAGE_RO        (1U << _PAGE_RO_BIT)
+#define _PAGE_W         (1U << _PAGE_W_BIT)
+#define PAGE_XN_MASK(x) (((x) >> _PAGE_XN_BIT) & 0x1U)
+#define PAGE_RO_MASK(x) (((x) >> _PAGE_RO_BIT) & 0x1U)
+#define PAGE_W_MASK(x)  (((x) >> _PAGE_W_BIT) & 0x1U)
+
 #define PAGE_SHIFT              12 /* 4 KiB Pages */
 #define PADDR_BITS              56 /* 44-bit PPN */
 
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index 339074d502..bb2da05693 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -33,6 +33,7 @@
 #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 #define PTE_TABLE                   (PTE_VALID)
 
+#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
 #define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 
 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
@@ -42,13 +43,68 @@
 
 #define pt_index(lvl, va) (pt_linear_offset((lvl), (va)) & VPN_MASK)
 
-/* Page Table entry */
+#define FIRST_SIZE (XEN_PT_LEVEL_SIZE(2))
+
+#define TABLE_OFFSET(offs) (_AT(unsigned int, offs) & ((_AC(1, U) << PAGETABLE_ORDER) - 1))
+
+#if RV_STAGE1_MODE > SATP_MODE_SV48
+#error "need to to update DECLARE_OFFSETS macros"
+#else
+
+#define l0_table_offset(va) TABLE_OFFSET(pt_linear_offset(0, va))
+#define l1_table_offset(va) TABLE_OFFSET(pt_linear_offset(1, va))
+#define l2_table_offset(va) TABLE_OFFSET(pt_linear_offset(2, va))
+#define l3_table_offset(va) TABLE_OFFSET(pt_linear_offset(3, va))
+
+/* Generate an array @var containing the offset for each level from @addr */
+#define DECLARE_OFFSETS(var, addr)          \
+    const unsigned int var[4] = {           \
+        l0_table_offset(addr),              \
+        l1_table_offset(addr),              \
+        l2_table_offset(addr),              \
+        l3_table_offset(addr)               \
+    }
+
+#endif
+
 typedef struct {
+    unsigned long v:1;
+    unsigned long r:1;
+    unsigned long w:1;
+    unsigned long x:1;
+    unsigned long u:1;
+    unsigned long g:1;
+    unsigned long a:1;
+    unsigned long d:1;
+    unsigned long rsw:2;
+#if RV_STAGE1_MODE == SATP_MODE_SV39
+    unsigned long ppn0:9;
+    unsigned long ppn1:9;
+    unsigned long ppn2:26;
+    unsigned long rsw2:7;
+    unsigned long pbmt:2;
+    unsigned long n:1;
+#elif RV_STAGE1_MODE == SATP_MODE_SV48
+    unsigned long ppn0:9;
+    unsigned long ppn1:9;
+    unsigned long ppn2:9;
+    unsigned long ppn3:17;
+    unsigned long rsw2:7;
+    unsigned long pbmt:2;
+    unsigned long n:1;
+#else
+#error "Add proper bits for SATP_MODE"
+#endif
+} pt_t;
+
+/* Page Table entry */
+typedef union {
 #ifdef CONFIG_RISCV_64
     uint64_t pte;
 #else
     uint32_t pte;
 #endif
+pt_t bits;
 } pte_t;
 
 pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
@@ -69,6 +125,21 @@ static inline bool pte_is_valid(pte_t p)
     return p.pte & PTE_VALID;
 }
 
+inline bool pte_is_table(const pte_t p, unsigned int level)
+{
+    (void) level;
+
+    return (((p.pte) & (PTE_VALID
+                       | PTE_READABLE
+                       | PTE_WRITABLE
+                       | PTE_EXECUTABLE)) == PTE_VALID);
+}
+
+static inline bool pte_is_mapping(const pte_t pte, unsigned int level)
+{
+    return !pte_is_table(pte, level);
+}
+
 static inline void invalidate_icache(void)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 445319af08..44f36359c8 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -362,13 +362,64 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     return -1;
 }
 
-int map_pages_to_xen(unsigned long virt,
-                     mfn_t mfn,
-                     unsigned long nr_mfns,
-                     unsigned int flags)
+const mfn_t get_root_page(void)
 {
-    BUG_ON("unimplemented");
-    return -1;
+    unsigned long root_maddr = csr_read(CSR_SATP) << PAGE_SHIFT;
+
+    return maddr_to_mfn(root_maddr);
+}
+
+/*
+ * Check whether the contiguous bit can be set. Return the number of
+ * contiguous entry allowed. If not allowed, return 1.
+ */
+unsigned int xen_pt_check_contig(unsigned long vfn, mfn_t mfn,
+                                 unsigned int level, unsigned long left,
+                                 unsigned int flags)
+{
+    /* there is no contig bit in RISC-V */
+    return 1;
+}
+
+void set_pte_table_bit(pte_t *pte, unsigned int tbl_bit_val)
+{
+    /* table bit for RISC-V is always equal to PTE_TABLE */
+    (void) tbl_bit_val;
+
+    pte->pte |= PTE_TABLE;
+}
+
+bool sanity_arch_specific_pte_checks(pte_t entry)
+{
+    /* there is no RISC-V specific PTE checks */
+    return true;
+}
+
+unsigned int get_contig_bit(pte_t entry)
+{
+    /* there is no contig bit */
+    (void) entry;
+
+    return 0;
+}
+
+void set_pte_permissions(pte_t *pte, unsigned int flags)
+{
+    pte->bits.r = PAGE_RO_MASK(flags);
+    pte->bits.x = ~PAGE_XN_MASK(flags);
+    pte->bits.w = PAGE_W_MASK(flags);
+
+    pte->pte |= PTE_ACCESSED | PTE_DIRTY;
+}
+
+inline void flush_xen_tlb_range_va(vaddr_t va,
+                                   unsigned long size)
+{
+    /* TODO: implement  flush of specific range va */
+    (void) va;
+    (void) size;
+
+    asm volatile("sfence.vma");
 }
 
 static inline pte_t mfn_to_pte(mfn_t mfn)
-- 
2.45.2


