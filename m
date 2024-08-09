Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FB594D480
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 18:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774853.1185321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLQ-0003SW-Hj; Fri, 09 Aug 2024 16:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774853.1185321; Fri, 09 Aug 2024 16:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scSLQ-0003N5-Av; Fri, 09 Aug 2024 16:20:00 +0000
Received: by outflank-mailman (input) for mailman id 774853;
 Fri, 09 Aug 2024 16:19:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k3r+=PI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1scSLO-0001ij-OX
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 16:19:58 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 373781ff-566b-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 18:19:56 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52ed741fe46so2582337e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 09:19:56 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-530de481f09sm1028479e87.285.2024.08.09.09.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2024 09:19:54 -0700 (PDT)
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
X-Inumbo-ID: 373781ff-566b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723220395; x=1723825195; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8AZqpn/vuySXbDV9hKMxfpPsYMsIP1Be1fWVrZj6Y7E=;
        b=mPS0DPo7xN0xHylwEq7JFVav0C50scY76XR5tEqhtyk0uRnaFRS9dpu2dFyn7FQ3rP
         irQV6FE3xCG0q9nOGxIhLuQUxXBSY3St9AQoeMrMd7nndbOCtG/Pu6IJXgQV89f5JVXm
         Al++LMVyqaeq0ZFpOUiPiCvauJNYixX6zsTkNzES1EYVabEeccKGKFafiwLVa4W+1T5f
         jOPdFGM3MFNf9oQqcrzk/R0DjsARuxO18FzT9DeybKvD4TMqVoXnpREFibytlYaH4X4+
         16G7TLu6ArIOsdNQW/SOJ4xviRWahZvjgBFLcJWni9KA1cqH0/YBY+LoAb0Rhl0uwX0e
         gYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723220395; x=1723825195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8AZqpn/vuySXbDV9hKMxfpPsYMsIP1Be1fWVrZj6Y7E=;
        b=ELD07yKkYGfWNSNKvdJGDjQAjuAZNJNW4U5oCI+8zxi9glX8evnFmQCpkZBOQFgWt9
         n9oy23B6SKsYs/E/5o2hwlsGajSbl4glB7GhJ5wEXfXotpLk/p099KXVVLo8BZEyTDBe
         UIZei/ZxUOM7qOe8cuuV3MB+8dh1+XpCYp3yD98+V/vVbYu/1tWZGGWhQf6V0tBI2mta
         VFDEccFpF79GS5T8Udo4hKcduKaReYP1D6KOi/l7BRzcONi1D2jeAwUaHJhgdoyHOyMU
         aG6WBwMCVYx8RjLTHKL34IJWgamEYmbPFTDAHsLhGMGJ4fDEbjAnkEoqzer/ihvBxWJb
         SBmw==
X-Gm-Message-State: AOJu0YxyUtjuKOrdx1wfS7oDnv1bpAyGXyKEWDTjaUGLaNhPPkCKDnHm
	j0ipmaMfiOHixJexbpqgnYSxFvQZrM7w5YU4gj0j2MJcqR73440uwK0ztQ==
X-Google-Smtp-Source: AGHT+IHoI4PvUXrDPfHiv6ps732wzeUfztjJFbU08renNA8ZqUMhQoumtTy5wvABMJS8Xu680I1AwQ==
X-Received: by 2002:a05:6512:3ba4:b0:530:c323:46a8 with SMTP id 2adb3069b0e04-530ee9bc0edmr1587783e87.23.1723220394662;
        Fri, 09 Aug 2024 09:19:54 -0700 (PDT)
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
Subject: [PATCH v4 6/7] xen/riscv: page table handling
Date: Fri,  9 Aug 2024 18:19:44 +0200
Message-ID: <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1723214540.git.oleksii.kurochko@gmail.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implement map_pages_to_xen() which requires several
functions to manage page tables and entries:
- pt_update()
- pt_mapping_level()
- pt_update_entry()
- pt_next_level()
- pt_check_entry()

To support these operations, add functions for creating,
mapping, and unmapping Xen tables:
- create_xen_table()
- xen_map_table()
- xen_unmap_table()

Introduce internal macros starting with PTE_* for convenience.
These macros closely resemble PTE bits, with the exception of
PTE_BLOCK, which indicates that a page larger than 4KB is
needed.
RISC-V detects superpages using `pte.x` and `pte.r`, as there
is no specific bit in the PTE for this purpose. From the RISC-V spec:
```
  ...
  4. Otherwise, the PTE is valid. If pte.r = 1 or pte.x = 1, go to step 5.
     Otherwise, this PTE is a pointer to the next level of the page table.
     ... .
  5. A leaf PTE has been found.
     ...
  ...
```

The code doesn’t support super page shattering so 4KB pages are used as
default.
Additionaly as mentioed in RISC-V priviliged spec:
```
 After much deliberation, we have settled on a conventional page size of
 4 KiB for both RV32 and RV64. We expect this decision to ease the porting
 of low-level runtime software and device drivers.

 The TLB reach problem is ameliorated by transparent superpage support in
 modern operating systems [2]. Additionally, multi-level TLB hierarchies
 are quite inexpensive relative to the multi-level cache hierarchies whose
 address space they map.

 [2] Juan Navarro, Sitaram Iyer, Peter Druschel, and Alan Cox. Practical,
     transparent operating system support for superpages.
     SIGOPS Oper. Syst. Rev., 36(SI):89–104, December 2002.
```

In addition introduce flush_tlb_range_va() for TLB flushing across
CPUs after updating the PTE for the requested mapping.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - update the commit message.
 - drop xen_ prefix for functions: xen_pt_update(), xen_pt_mapping_level(),
   xen_pt_update_entry(), xen_pt_next_level(), xen_pt_check_entry().
 - drop 'select GENERIC_PT' for CONFIG_RISCV. There is no GENERIC_PT anymore.
 - update implementation of flush_xen_tlb_range_va and s/flush_xen_tlb_range_va/flush_tlb_range_va
 - s/pte_get_mfn/mfn_from_pte. Others similar definitions I decided not to touch as
   they were introduced before and this patter of naming such type of macros will be applied
   for newly introduced macros.
 - drop _PAGE_* definitions and use analogues of PTE_*.
 - introduce PTE_{W,X,R}_MASK and drop PAGE_{XN,W,X}_MASK. Also drop _PAGE_{*}_BIT
 - introduce PAGE_HYPERVISOR_RX.
 - drop unused now l3_table_offset.
 - drop struct pt_t as it was used only for one function. If it will be needed in the future
   pt_t will be re-introduced.
 - code styles fixes in pte_is_table(). drop level argument from t.
 - update implementation and prototype of pte_is_mapping().
 - drop level argument from pt_next_level().
 - introduce definition of SATP_PPN_MASK.
 - isolate PPN of CSR_SATP before shift by PAGE_SHIFT.
 - drop set_permission() functions as it is not used more then once.
 - update prototype of pt_check_entry(): drop level argument as it is not used.
 - pt_check_entry():
   - code style fixes
   - update the sanity check when modifying an entry
   - update the sanity check when when removing a mapping.
 - s/read_only/alloc_only.
 - code style fixes for pt_next_level().
 - pt_update_entry() changes:
   - drop arch_level variable inisde pt_update_entry()
   - drop convertion near virt to paddr_t in DECLARE_OFFSETS(offsets, virt);
   - pull out "goto out inside first 'for' cycle.
   - drop braces for 'if' cases which has only one line.
   - ident 'out' label with one blank.
   - update the comment above alloc_only and also definition to take into
     account  that if pte population was requested or not.
   - drop target variable and rename arch_target argument of the function to
     target.
 - pt_mapping_level() changes:
   - move the check if PTE_BLOCK should be mapped on the top of the function.
   - change int i to unsigned int and update 'for' cycle correspondingly.
 - update prototye of pt_update():
   - drop the comment  above nr_mfns and drop const to be consistent with other
     arguments.
   - always flush TLB at the end of the function as non-present entries can be put
     in the TLB.
   - add fence before TLB flush to ensure that PTEs are all updated before flushing.
 - s/XEN_TABLE_NORMAL_PAGE/XEN_TABLE_NORMAL
 - add a check in map_pages_to_xen() the mfn is not INVALID_MFN.
 - add the comment on top of pt_update() how mfn = INVALID_MFN is considered.
 - s/_PAGE_BLOCK/PTE_BLOCK.
 - add the comment with additional explanation for PTE_BLOCK.
 - drop defintion of FIRST_SIZE as it isn't used.
---
Changes in V3:
 - new patch. ( Technically it is reworked version of the generic approach
   which I tried to suggest in the previous version )
---

 xen/arch/riscv/Makefile                     |   1 +
 xen/arch/riscv/include/asm/flushtlb.h       |  13 +
 xen/arch/riscv/include/asm/mm.h             |   2 +
 xen/arch/riscv/include/asm/page.h           |  76 ++++
 xen/arch/riscv/include/asm/riscv_encoding.h |   1 +
 xen/arch/riscv/mm.c                         |   9 -
 xen/arch/riscv/pt.c                         | 408 ++++++++++++++++++++
 7 files changed, 501 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/riscv/pt.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 334fd24547..d058ea4e95 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
 obj-y += mm.o
+obj-y += pt.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
diff --git a/xen/arch/riscv/include/asm/flushtlb.h b/xen/arch/riscv/include/asm/flushtlb.h
index f4a735fd6c..d18b416a60 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -5,12 +5,25 @@
 #include <xen/bug.h>
 #include <xen/cpumask.h>
 
+#include <asm/sbi.h>
+
 /* Flush TLB of local processor for address va. */
 static inline void flush_tlb_one_local(vaddr_t va)
 {
     asm volatile ( "sfence.vma %0" :: "r" (va) : "memory" );
 }
 
+/*
+ * Flush a range of VA's hypervisor mappings from the TLB of all
+ * processors in the inner-shareable domain.
+ */
+static inline void flush_tlb_range_va(vaddr_t va,
+                                      size_t size)
+{
+    BUG_ON(!sbi_has_rfence());
+    sbi_remote_sfence_vma(NULL, va, size);
+}
+
 /*
  * Filter the given set of CPUs, removing those that definitely flushed their
  * TLB since @page_timestamp.
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index a0bdc2bc3a..ce1557bb27 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -42,6 +42,8 @@ static inline void *maddr_to_virt(paddr_t ma)
 #define virt_to_mfn(va)     __virt_to_mfn(va)
 #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
 
+#define mfn_from_pte(pte) maddr_to_mfn(pte_to_paddr(pte))
+
 struct page_info
 {
     /* Each frame can be threaded onto a doubly-linked list. */
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index d96db0e322..0deb1d36aa 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -20,6 +20,11 @@
 #define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
 #define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK << XEN_PT_LEVEL_SHIFT(lvl))
 
+/*
+ * PTE format:
+ * | XLEN-1  10 | 9             8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0
+ *       PFN      reserved for SW   D   A   G   U   X   W   R   V
+ */
 #define PTE_VALID                   BIT(0, UL)
 #define PTE_READABLE                BIT(1, UL)
 #define PTE_WRITABLE                BIT(2, UL)
@@ -33,15 +38,72 @@
 #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 #define PTE_TABLE                   (PTE_VALID)
 
+#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
 #define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
+#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
 
 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
 
+
+/*
+ * There are no such bits in PTE format for RISC-V.
+ *
+ * The code doesn’t support super page shattering so at the moment superpages
+ * can't be used as a default so PTE_BLOCK is introduced to have ability to
+ * tell that superpage should be allocated.
+ * Additionaly as mentioed in RISC-V priviliged spec:
+ * ```
+ *  After much deliberation, we have settled on a conventional page size of
+ *  4 KiB for both RV32 and RV64. We expect this decision to ease the porting
+ *  of low-level runtime software and device drivers.
+ *
+ *  The TLB reach problem is ameliorated by transparent superpage support in
+ *  modern operating systems [2]. Additionally, multi-level TLB hierarchies
+ *  are quite inexpensive relative to the multi-level cache hierarchies whose
+ *  address space they map.
+ *
+ *  [2] Juan Navarro, Sitaram Iyer, Peter Druschel, and Alan Cox. Practical,
+ *      transparent operating system support for superpages.
+ *      SIGOPS Oper. Syst. Rev., 36(SI):89–104, December 2002.
+ * ```
+ *
+ * PTE_POPULATE is introduced to have ability to tell that page tables
+ * shoud be populated.
+ */
+#define PTE_BLOCK       BIT(10, UL)
+#define PTE_POPULATE    BIT(11, UL)
+
+#define PTE_R_MASK(x)   ((x) & PTE_READABLE)
+#define PTE_W_MASK(x)   ((x) & PTE_WRITABLE)
+#define PTE_X_MASK(x)   ((x) & PTE_EXECUTABLE)
+
+#define PTE_RWX_MASK(x) ((x) & (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE))
+
 /* Calculate the offsets into the pagetables for a given VA */
 #define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
 
 #define pt_index(lvl, va) (pt_linear_offset((lvl), (va)) & VPN_MASK)
 
+#define TABLE_OFFSET(offs) (_AT(unsigned int, offs) & ((_AC(1, U) << PAGETABLE_ORDER) - 1))
+
+#if RV_STAGE1_MODE > SATP_MODE_SV48
+#error "need to to update DECLARE_OFFSETS macros"
+#else
+
+#define l0_table_offset(va) TABLE_OFFSET(pt_linear_offset(0, va))
+#define l1_table_offset(va) TABLE_OFFSET(pt_linear_offset(1, va))
+#define l2_table_offset(va) TABLE_OFFSET(pt_linear_offset(2, va))
+
+/* Generate an array @var containing the offset for each level from @addr */
+#define DECLARE_OFFSETS(var, addr)          \
+    const unsigned int var[] = {            \
+        l0_table_offset(addr),              \
+        l1_table_offset(addr),              \
+        l2_table_offset(addr),              \
+    }
+
+#endif
+
 /* Page Table entry */
 typedef struct {
 #ifdef CONFIG_RISCV_64
@@ -67,6 +129,20 @@ static inline bool pte_is_valid(pte_t p)
     return p.pte & PTE_VALID;
 }
 
+inline bool pte_is_table(const pte_t p)
+{
+    return ((p.pte & (PTE_VALID |
+                      PTE_READABLE |
+                      PTE_WRITABLE |
+                      PTE_EXECUTABLE)) == PTE_VALID);
+}
+
+static inline bool pte_is_mapping(const pte_t p)
+{
+    return (p.pte & PTE_VALID) &&
+           ((p.pte & PTE_WRITABLE) || (p.pte & PTE_EXECUTABLE));
+}
+
 static inline void invalidate_icache(void)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 58abe5eccc..1a05d06597 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -164,6 +164,7 @@
 #define SSTATUS_SD			SSTATUS64_SD
 #define SATP_MODE			SATP64_MODE
 #define SATP_MODE_SHIFT			SATP64_MODE_SHIFT
+#define SATP_PPN_MASK			_ULL(0x00000FFFFFFFFFFF)
 
 #define HGATP_PPN			HGATP64_PPN
 #define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index b8ff91cf4e..e8430def14 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -369,12 +369,3 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     BUG_ON("unimplemented");
     return -1;
 }
-
-int map_pages_to_xen(unsigned long virt,
-                     mfn_t mfn,
-                     unsigned long nr_mfns,
-                     unsigned int flags)
-{
-    BUG_ON("unimplemented");
-    return -1;
-}
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
new file mode 100644
index 0000000000..25f69c899b
--- /dev/null
+++ b/xen/arch/riscv/pt.c
@@ -0,0 +1,408 @@
+#include <xen/bug.h>
+#include <xen/domain_page.h>
+#include <xen/errno.h>
+#include <xen/mm.h>
+#include <xen/mm-frame.h>
+#include <xen/pmap.h>
+#include <xen/spinlock.h>
+
+#include <asm/flushtlb.h>
+#include <asm/page.h>
+
+static inline const mfn_t get_root_page(void)
+{
+    unsigned long root_maddr =
+        (csr_read(CSR_SATP) & SATP_PPN_MASK) << PAGE_SHIFT;
+
+    return maddr_to_mfn(root_maddr);
+}
+
+/*
+ * Sanity check of the entry
+ * mfn is not valid and we are not populating page table. This means
+ * we either modify entry or remove an entry.
+ */
+static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int flags)
+{
+    /* Sanity check when modifying an entry. */
+    if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) )
+    {
+        /* We don't allow modifying an invalid entry. */
+        if ( !pte_is_valid(entry) )
+        {
+            printk("Modifying invalid entry is not allowed.\n");
+            return false;
+        }
+
+        /* We don't allow modifying a table entry */
+        if ( pte_is_table(entry) )
+        {
+            printk("Modifying a table entry is not allowed.\n");
+            return false;
+        }
+    }
+    /* Sanity check when inserting a mapping */
+    else if ( flags & PTE_VALID )
+    {
+        /* We should be here with a valid MFN. */
+        ASSERT(!mfn_eq(mfn, INVALID_MFN));
+
+        /*
+         * We don't allow replacing any valid entry.
+         *
+         * Note that the function xen_pt_update() relies on this
+         * assumption and will skip the TLB flush. The function will need
+         * to be updated if the check is relaxed.
+         */
+        if ( pte_is_valid(entry) )
+        {
+            if ( pte_is_mapping(entry) )
+                printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
+                       mfn_x(mfn_from_pte(entry)), mfn_x(mfn));
+            else
+                printk("Trying to replace a table with a mapping.\n");
+            return false;
+        }
+    }
+    /* Sanity check when removing a mapping. */
+    else if ( (flags & (PTE_VALID | PTE_POPULATE)) == 0 )
+    {
+        /* We should be here with an invalid MFN. */
+        ASSERT(mfn_eq(mfn, INVALID_MFN));
+
+        /* We don't allow removing a table */
+        if ( pte_is_table(entry) )
+        {
+            printk("Removing a table is not allowed.\n");
+            return false;
+        }
+    }
+    /* Sanity check when populating the page-table. No check so far. */
+    else
+    {
+        ASSERT(flags & PTE_POPULATE);
+        /* We should be here with an invalid MFN */
+        ASSERT(mfn_eq(mfn, INVALID_MFN));
+    }
+
+    return true;
+}
+
+static pte_t *xen_map_table(mfn_t mfn)
+{
+    /*
+     * During early boot, map_domain_page() may be unusable. Use the
+     * PMAP to map temporarily a page-table.
+     */
+    if ( system_state == SYS_STATE_early_boot )
+        return pmap_map(mfn);
+
+    return map_domain_page(mfn);
+}
+
+static void xen_unmap_table(const pte_t *table)
+{
+    /*
+     * During early boot, xen_map_table() will not use map_domain_page()
+     * but the PMAP.
+     */
+    if ( system_state == SYS_STATE_early_boot )
+        pmap_unmap(table);
+    else
+        unmap_domain_page(table);
+}
+
+static int create_xen_table(pte_t *entry)
+{
+    mfn_t mfn;
+    void *p;
+    pte_t pte;
+
+    if ( system_state != SYS_STATE_early_boot )
+    {
+        struct page_info *pg = alloc_domheap_page(NULL, 0);
+
+        if ( pg == NULL )
+            return -ENOMEM;
+
+        mfn = page_to_mfn(pg);
+    }
+    else
+        mfn = alloc_boot_pages(1, 1);
+
+    p = xen_map_table(mfn);
+    clear_page(p);
+    xen_unmap_table(p);
+
+    pte = pte_from_mfn(mfn, PTE_TABLE);
+    write_pte(entry, pte);
+
+    return 0;
+}
+
+#define XEN_TABLE_MAP_FAILED 0
+#define XEN_TABLE_SUPER_PAGE 1
+#define XEN_TABLE_NORMAL 2
+
+/*
+ * Take the currently mapped table, find the corresponding entry,
+ * and map the next table, if available.
+ *
+ * The alloc_only parameters indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  XEN_TABLE_MAP_FAILED: Either alloc_only was set and the entry
+ *  was empty, or allocating a new page failed.
+ *  XEN_TABLE_NORMAL: next level or leaf mapped normally
+ *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
+ */
+static int pt_next_level(bool alloc_only, pte_t **table, unsigned int offset)
+{
+    pte_t *entry;
+    int ret;
+    mfn_t mfn;
+
+    entry = *table + offset;
+
+    if ( !pte_is_valid(*entry) )
+    {
+        if ( alloc_only )
+            return XEN_TABLE_MAP_FAILED;
+
+        ret = create_xen_table(entry);
+        if ( ret )
+            return XEN_TABLE_MAP_FAILED;
+    }
+
+    if ( pte_is_mapping(*entry) )
+        return XEN_TABLE_SUPER_PAGE;
+
+    mfn = mfn_from_pte(*entry);
+
+    xen_unmap_table(*table);
+    *table = xen_map_table(mfn);
+
+    return XEN_TABLE_NORMAL;
+}
+
+/* Update an entry at the level @target. */
+static int pt_update_entry(mfn_t root, unsigned long virt,
+                           mfn_t mfn, unsigned int target,
+                           unsigned int flags)
+{
+    int rc;
+    unsigned int level = HYP_PT_ROOT_LEVEL;
+    pte_t *table;
+    /*
+     * The intermediate page tables are read-only when the MFN is not valid
+     * and we are not populating page table.
+     * This means we either modify permissions or remove an entry.
+     */
+    bool alloc_only = mfn_eq(mfn, INVALID_MFN) && !(flags & PTE_POPULATE);
+    pte_t pte, *entry;
+
+    /* convenience aliases */
+    DECLARE_OFFSETS(offsets, virt);
+
+    table = xen_map_table(root);
+    for ( ; level > target; level-- )
+    {
+        rc = pt_next_level(alloc_only, &table, offsets[level]);
+        if ( rc == XEN_TABLE_MAP_FAILED )
+        {
+            rc = 0;
+
+            /*
+             * We are here because pt_next_level has failed to map
+             * the intermediate page table (e.g the table does not exist
+             * and the pt is read-only). It is a valid case when
+             * removing a mapping as it may not exist in the page table.
+             * In this case, just ignore it.
+             */
+            if ( flags & PTE_VALID )
+            {
+                printk("%s: Unable to map level %u\n", __func__, level);
+                rc = -ENOENT;
+            }
+
+            goto out;
+        }
+        else if ( rc != XEN_TABLE_NORMAL )
+            break;
+    }
+
+    if ( level != target )
+    {
+        printk("%s: Shattering superpage is not supported\n", __func__);
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    entry = table + offsets[level];
+
+    rc = -EINVAL;
+    if ( !pt_check_entry(*entry, mfn, flags) )
+        goto out;
+
+    /* We are removing the page */
+    if ( !(flags & PTE_VALID) )
+        memset(&pte, 0x00, sizeof(pte));
+    else
+    {
+        /* We are inserting a mapping => Create new pte. */
+        if ( !mfn_eq(mfn, INVALID_MFN) )
+            pte = pte_from_mfn(mfn, PTE_VALID);
+        else /* We are updating the permission => Copy the current pte. */
+            pte = *entry;
+
+        /* update permission according to the flags */
+        pte.pte |= PTE_RWX_MASK(flags) | PTE_ACCESSED | PTE_DIRTY;
+    }
+
+    write_pte(entry, pte);
+
+    rc = 0;
+
+ out:
+    xen_unmap_table(table);
+
+    return rc;
+}
+
+static DEFINE_SPINLOCK(xen_pt_lock);
+
+/* Return the level where mapping should be done */
+static int pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
+                            unsigned int flags)
+{
+    unsigned int level = 0;
+    unsigned long mask;
+    unsigned int i;
+
+    /*
+     * Always use level 0 ( 4k mapping ) mapping unless the caller request
+     * block mapping.
+     */
+    if ( likely(!(flags & PTE_BLOCK)) )
+        return level;
+
+    /*
+     * Don't take into account the MFN when removing mapping (i.e
+     * MFN_INVALID) to calculate the correct target order.
+     *
+     * `vfn` and `mfn` must be both superpage aligned.
+     * They are or-ed together and then checked against the size of
+     * each level.
+     *
+     * `left` is not included and checked separately to allow
+     * superpage mapping even if it is not properly aligned (the
+     * user may have asked to map 2MB + 4k).
+     */
+    mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
+    mask |= vfn;
+
+    for ( i = HYP_PT_ROOT_LEVEL; i != 0; i-- )
+    {
+        if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) &&
+             (nr >= BIT(XEN_PT_LEVEL_ORDER(i), UL)) )
+        {
+            level = i;
+            break;
+        }
+    }
+
+    return level;
+}
+
+/*
+ * If `mfn` equals `INVALID_MFN`, it indicates that the following page table
+ * update operation might be related to either populating the table,
+ * destroying a mapping, or modifying an existing mapping.
+ */
+static int pt_update(unsigned long virt,
+                     mfn_t mfn,
+                     unsigned long nr_mfns,
+                     unsigned int flags)
+{
+    int rc = 0;
+    unsigned long vfn = virt >> PAGE_SHIFT;
+    unsigned long left = nr_mfns;
+
+    const mfn_t root = get_root_page();
+
+    /*
+     * It is bad idea to have mapping both writeable and
+     * executable.
+     * When modifying/creating mapping (i.e PTE_VALID is set),
+     * prevent any update if this happen.
+     */
+    if ( (flags & PTE_VALID) && PTE_W_MASK(flags) && PTE_X_MASK(flags) )
+    {
+        printk("Mappings should not be both Writeable and Executable.\n");
+        return -EINVAL;
+    }
+
+    if ( !IS_ALIGNED(virt, PAGE_SIZE) )
+    {
+        printk("The virtual address is not aligned to the page-size.\n");
+        return -EINVAL;
+    }
+
+    spin_lock(&xen_pt_lock);
+
+    while ( left )
+    {
+        unsigned int order, level;
+
+        level = pt_mapping_level(vfn, mfn, left, flags);
+        order = XEN_PT_LEVEL_ORDER(level);
+
+        ASSERT(left >= BIT(order, UL));
+
+        rc = pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level,
+                                    flags);
+        if ( rc )
+            break;
+
+        vfn += 1U << order;
+        if ( !mfn_eq(mfn, INVALID_MFN) )
+            mfn = mfn_add(mfn, 1U << order);
+
+        left -= (1U << order);
+
+        if ( rc )
+            break;
+    }
+
+
+    /* ensure that PTEs are all updated before flushing */
+    RISCV_FENCE(rw, rw);
+
+    /*
+     * always flush TLB at the end of the function as non-present entries
+     * can be put in the TLB
+     */
+    flush_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
+
+    spin_unlock(&xen_pt_lock);
+
+    return rc;
+}
+
+int map_pages_to_xen(unsigned long virt,
+                     mfn_t mfn,
+                     unsigned long nr_mfns,
+                     unsigned int flags)
+{
+    /*
+     * Ensure that we have a valid MFN before proceeding.
+     *
+     * If the MFN is invalid, pt_update() might misinterpret the operation,
+     * treating it as either a population, a mapping destruction,
+     * or a mapping modification.
+     */
+    ASSERT(!mfn_eq(mfn, INVALID_MFN));
+
+    return pt_update(virt, mfn, nr_mfns, flags);
+}
-- 
2.45.2


