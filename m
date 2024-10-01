Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA75F98BAE8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 13:22:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808012.1219817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svaxA-0006j2-7z; Tue, 01 Oct 2024 11:22:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808012.1219817; Tue, 01 Oct 2024 11:22:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svaxA-0006ag-2v; Tue, 01 Oct 2024 11:22:04 +0000
Received: by outflank-mailman (input) for mailman id 808012;
 Tue, 01 Oct 2024 11:22:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Um4/=Q5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svax8-0006KJ-0W
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 11:22:02 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 602c978b-7fe7-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 13:22:00 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-539885dd4bcso4419795e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 04:22:00 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53980fcdcd6sm1445087e87.153.2024.10.01.04.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2024 04:21:58 -0700 (PDT)
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
X-Inumbo-ID: 602c978b-7fe7-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727781719; x=1728386519; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEDhR/79dEYv5D4TyLlFyLvFsiBEwyjBpV/3OO5dpSU=;
        b=k4PsK7z3CLY8bNcABin6UEQJ6WSU/VT/S4h2xysWzgr2CHWfi3mH2fyiMWnVSqmh3E
         snA65CUk0KVwixd02+K13xC3CxLk8o/zGokGVLaF6qtXRZZWuobUPxpmTBSuDV+GeTHx
         qQN/OnjewWquItcvKWxc4K/jZ7uvPuptP0jaEPyc/ALXDq/QvNy4LOIWyTTBiMsCTJMt
         kZ50rC53flnG6+KNxX6onvCyQ7N4Ts/VYZBSVAmPybJLw+CwTOdUd+sHSISSHvrmKApa
         KNLSjrQNkpk5dMsWnvQeDiiR1v1eyu+ssZH8IX49UAsglZz+zIriorHaIJnRe4VKmC1I
         Wf4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727781719; x=1728386519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rEDhR/79dEYv5D4TyLlFyLvFsiBEwyjBpV/3OO5dpSU=;
        b=ZoChhJ6qXH4vbovpA0xs4IPtE5DTuKI91iWgkk2HY+zRKQW/zgPM8MQhrh7tToK4kM
         akaKxFEUjcwOjkUO91+FOZr0C7ueChlq8O134gxpjmlicW8p4/olrH0Sry/9nv2J1cNT
         IyZ1kvbILpxz7330vo7GS3VBWvidx/uoqTdTWUfAc8SzqLlWSry4gVG4mCyWVLysz06c
         Z2D/bq5ySkUw1Gg96wIUWcCj4V4lFODf1YlCXGGV5V5kHJ1SgUmWAbC2DDWv5HPqaHpk
         6XvpDFfIxh3ema5dJrHlhux+8xSzPOjzPzKk1hyzwG2wUbCwqOZH7GDS5sA+X0186STh
         CAmw==
X-Gm-Message-State: AOJu0Yz+ykHQHwiF74eZo7u4WrPFxYvUxpTBD4Y2jHwpWZ3fOIXIMX5f
	E6tARUbSH/O+pJH6myI2tQVgBSpOPVc/AWQyOMw3BUnoX+SW/tTkIh+v9A==
X-Google-Smtp-Source: AGHT+IF5oYkm6kQutY7dZnu3s/V97yqwlb1ymdYtJ2tGqcu6FzgRWFayCNvxKBycOmEJCNHwFQbEiA==
X-Received: by 2002:a05:6512:6c2:b0:52f:1ef:bafe with SMTP id 2adb3069b0e04-5389fc3dc56mr8023263e87.22.1727781718743;
        Tue, 01 Oct 2024 04:21:58 -0700 (PDT)
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
Subject: [PATCH v9 1/2] xen/riscv: page table handling
Date: Tue,  1 Oct 2024 13:21:21 +0200
Message-ID: <55244e67032d3a8f6064aeccff44ebb0138cafaf.1727781468.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727781468.git.oleksii.kurochko@gmail.com>
References: <cover.1727781468.git.oleksii.kurochko@gmail.com>
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
- create_table()
- map_table()
- unmap_table()

Introduce PTE_SMALL to indicate that 4KB mapping is needed
and PTE_POPULATE.

In addition introduce flush_tlb_range_va() for TLB flushing across
CPUs after updating the PTE for the requested mapping.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V9:
 - fix indentation alignment for dprintk() in pt_check_entry().
 - update the stale comment ( add explanation for XEN_TABLE_MAP_NOMEM and
   XEN_TABLE_MAP_NONE )
 - change return type to bool for create_table() so it returns false when
   allocation is falied; otherwise - true.
---
Changes in V8:
 - drop PTE_LEAF_MASK.
 - update the comment above pte_is_table(): drop table number and use
   just "the encoding of the permission bits".
 - declare pte_is_table() as static.
 - drop const from the argument of pte_is_table
 - drop the "const" comment before the argument of pte_is_mapping().
 - update the comment above ASSERT() in pte_is_mapping() to : See pte_is_table().
 - drop "const" from the return type of get_root_page().
 - update the comment above "pt_check_entry()".
 - start the comment with capital letter.
 - update the way how PTE_ACCESS_MASK bits are cleared before being updated by
   the value in flags.
 - use dprintk() instead of printk() in riscv/pt.c
 - introduce XEN_TABLE_MAP_NONE and XEN_TABLE_MAP_NOMEM instead of XEN_TABLE_MAP_FAILED
   and correspondingly update part of the code of pt_next_level()'s return value
   handling in pt_update_entry.
 - update type of virt to vaddr_t for pt_update_entry()
---
Changes in V7:
 - rename PTE_XWV_BITS to PTE_LEAF_MASK.
 - drop PTE_XWV_MASK, PTE_RWX_MASK.
 - introduce PTE_ACCESS_MASK.
 - update the ASSERT and the comment about it in pte_is_mapping().
 - add the same ASSERT as in pte_is_mapping() to pte_is_table().
 - update the comment above pte_is_table().
 - use PTE_ACCESS_MASK inside pte_is_{table,mapping} instead of encoding
   access bit explicitly.
 - define SATP_PPN_MASK using SATP{32,64}_PPN.
 - drop inclusion of #include <xen/mm-frame.h> in riscv/pt.c as xen/mm.h is
   included.
 - use pfn_to_paddr() in get_root_page() instead of open-coding of pfn_to_paddr().
 - update if the comment and the if (...) in pt_update_entry() above the check
   in case of pt_next_level() returns XEN_TABLE_MAP_FAILED.
 - update the the comment above pt_update(): drop unecessary mentioning of INVALID_MFN
   and blanks inside parentheses.
 - drop "full stops" in printk().
 - correct the condition in ASSERT() in map_pages_to_xen().
 - clear permission bits before updating the permissions in pt_update_entry().
---
Changes in V6:
 - update the commit message.
 - correct the comment above flush_tlb_range_va().
 - add PTE_READABLE to the check of pte.rwx permissions in
   pte_is_mapping().
 - s/printk/dprintk in pt_check_entry().
 - drop unnecessary ASSERTS() in pt_check_entry().
 - drop checking of PTE_VALID flags in /* Sanity check when removing
   a mapping */ because of the earlier check.
 - drop ASSERT(flags & PTE_POPULATE) in /* Sanity check when populating the page-table */
   section as in the earlier if it is checked.
 - pt_next_level() changes:
   - invert if ( alloc_tbl ) condition.
   - drop local variable ret.
 - pt_update_entry() changes:
   - invert definition of alloc_tbl.
   - update the comment inside "if ( rc == XEN_TABLE_MAP_FAILED )".
   - drop else for mentioned above if (...).
   - clear some PTE flags before update.
 - s/xen_pt_lock/pt_lock
 - use PFN_DOWN() for vfn variable definition in pt_update().
 - drop definition of PTE_{R,W,X}_MASK.
 - introduce PTE_XWV_BITS and PTE_XWV_MASK() for convenience and use them in if (...)
   in pt_update().
 - update the comment above pt_update().
 - change memset(&pte, 0x00, sizeof(pte)) to pte.pte = 0.
 - add the comment above pte_is_table().
 - add ASSERT in pte_is_mapping() to check the cases which are reserved for future
   use.
---
Changes in V5:
 - s/xen_{un}map/{un}map
 - introduce PTE_SMALL instead of PTE_BLOCK.
 - update the comment above defintion of PTE_4K_PAGES.
 - code style fixes.
 - s/RV_STAGE1_MODE > SATP_MODE_SV48/RV_STAGE1_MODE > SATP_MODE_SV39 around
   DECLARE_OFFSETS macros.
 - change type of root_maddr from unsgined long to maddr_t.
 - drop duplicated check ( if (rc) break ) in pt_update() inside while cycle.
 - s/1U/1UL
 - put 'spin_unlock(&xen_pt_lock);' ahead of TLB flush in pt_update().
 - update the commit message.
 - update the comment above ASSERT() in map_pages_to_xen() and also update
   the check within ASSERT() to check that flags has PTE_VALID bit set.
 - update the comment above pt_update() function.
 - add the comment inside pt_check_entry().
 - update the TLB flushing region in pt_update().
 - s/alloc_only/alloc_tbl
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
 xen/arch/riscv/include/asm/flushtlb.h       |   9 +
 xen/arch/riscv/include/asm/mm.h             |   2 +
 xen/arch/riscv/include/asm/page.h           |  80 ++++
 xen/arch/riscv/include/asm/riscv_encoding.h |   2 +
 xen/arch/riscv/mm.c                         |   9 -
 xen/arch/riscv/pt.c                         | 421 ++++++++++++++++++++
 7 files changed, 515 insertions(+), 9 deletions(-)
 create mode 100644 xen/arch/riscv/pt.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 6832549133..a5eb2aed4b 100644
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
index f4a735fd6c..43214f5e95 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -5,12 +5,21 @@
 #include <xen/bug.h>
 #include <xen/cpumask.h>
 
+#include <asm/sbi.h>
+
 /* Flush TLB of local processor for address va. */
 static inline void flush_tlb_one_local(vaddr_t va)
 {
     asm volatile ( "sfence.vma %0" :: "r" (va) : "memory" );
 }
 
+/* Flush a range of VA's hypervisor mappings from the TLB of all processors. */
+static inline void flush_tlb_range_va(vaddr_t va, size_t size)
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
index eb79cb9409..89fa290697 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -21,6 +21,11 @@
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
@@ -34,15 +39,49 @@
 #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 #define PTE_TABLE                   (PTE_VALID)
 
+#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
 #define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
+#define PAGE_HYPERVISOR_RX          (PTE_VALID | PTE_READABLE | PTE_EXECUTABLE)
 
 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
 
+/*
+ * The PTE format does not contain the following bits within itself;
+ * they are created artificially to inform the Xen page table
+ * handling algorithm. These bits should not be explicitly written
+ * to the PTE entry.
+ */
+#define PTE_SMALL       BIT(10, UL)
+#define PTE_POPULATE    BIT(11, UL)
+
+#define PTE_ACCESS_MASK (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
+
 /* Calculate the offsets into the pagetables for a given VA */
 #define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
 
 #define pt_index(lvl, va) (pt_linear_offset((lvl), (va)) & VPN_MASK)
 
+#define PAGETABLE_ORDER_MASK ((_AC(1, U) << PAGETABLE_ORDER) - 1)
+#define TABLE_OFFSET(offs) (_AT(unsigned int, offs) & PAGETABLE_ORDER_MASK)
+
+#if RV_STAGE1_MODE > SATP_MODE_SV39
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
@@ -68,6 +107,47 @@ static inline bool pte_is_valid(pte_t p)
     return p.pte & PTE_VALID;
 }
 
+/*
+ * From the RISC-V spec:
+ *   The V bit indicates whether the PTE is valid; if it is 0, all other bits
+ *   in the PTE are don’t-cares and may be used freely by software.
+ *
+ *   If V=1 the encoding of PTE R/W/X bits could be find in "the encoding
+ *   of the permission bits" table.
+ *
+ *   The encoding of the permission bits table:
+ *      X W R Meaning
+ *      0 0 0 Pointer to next level of page table.
+ *      0 0 1 Read-only page.
+ *      0 1 0 Reserved for future use.
+ *      0 1 1 Read-write page.
+ *      1 0 0 Execute-only page.
+ *      1 0 1 Read-execute page.
+ *      1 1 0 Reserved for future use.
+ *      1 1 1 Read-write-execute page.
+ */
+static inline bool pte_is_table(pte_t p)
+{
+    /*
+     * According to the spec if V=1 and W=1 then R also needs to be 1 as
+     * R = 0 is reserved for future use ( look at the Table 4.5 ) so check
+     * in ASSERT that if (V==1 && W==1) then R isn't 0.
+     *
+     * PAGE_HYPERVISOR_RW contains PTE_VALID too.
+     */
+    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
+
+    return ((p.pte & (PTE_VALID | PTE_ACCESS_MASK)) == PTE_VALID);
+}
+
+static inline bool pte_is_mapping(pte_t p)
+{
+    /* See pte_is_table() */
+    ASSERT(((p.pte & PAGE_HYPERVISOR_RW) != (PTE_VALID | PTE_WRITABLE)));
+
+    return (p.pte & PTE_VALID) && (p.pte & PTE_ACCESS_MASK);
+}
+
 static inline void invalidate_icache(void)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 58abe5eccc..e31e94e77e 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -164,6 +164,7 @@
 #define SSTATUS_SD			SSTATUS64_SD
 #define SATP_MODE			SATP64_MODE
 #define SATP_MODE_SHIFT			SATP64_MODE_SHIFT
+#define SATP_PPN_MASK			SATP64_PPN
 
 #define HGATP_PPN			HGATP64_PPN
 #define HGATP_VMID_SHIFT		HGATP64_VMID_SHIFT
@@ -174,6 +175,7 @@
 #define SSTATUS_SD			SSTATUS32_SD
 #define SATP_MODE			SATP32_MODE
 #define SATP_MODE_SHIFT			SATP32_MODE_SHIFT
+#define SATP_PPN_MASK			SATP32_PPN
 
 #define HGATP_PPN			HGATP32_PPN
 #define HGATP_VMID_SHIFT		HGATP32_VMID_SHIFT
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
index 0000000000..cc5e2d3266
--- /dev/null
+++ b/xen/arch/riscv/pt.c
@@ -0,0 +1,421 @@
+#include <xen/bug.h>
+#include <xen/domain_page.h>
+#include <xen/errno.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
+#include <xen/pfn.h>
+#include <xen/pmap.h>
+#include <xen/spinlock.h>
+
+#include <asm/flushtlb.h>
+#include <asm/page.h>
+
+static inline mfn_t get_root_page(void)
+{
+    paddr_t root_maddr = pfn_to_paddr(csr_read(CSR_SATP) & SATP_PPN_MASK);
+
+    return maddr_to_mfn(root_maddr);
+}
+
+/*
+ * Sanity check a page table entry about to be updated as per an (MFN,flags)
+ * tuple.
+ * See the comment about the possible combination of (mfn, flags) in
+ * the comment above pt_update().
+ */
+static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int flags)
+{
+    /* Sanity check when modifying an entry. */
+    if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID_MFN) )
+    {
+        /* We don't allow modifying an invalid entry. */
+        if ( !pte_is_valid(entry) )
+        {
+            dprintk(XENLOG_ERR, "Modifying invalid entry is not allowed\n");
+            return false;
+        }
+
+        /* We don't allow modifying a table entry */
+        if ( pte_is_table(entry) )
+        {
+            dprintk(XENLOG_ERR, "Modifying a table entry is not allowed\n");
+            return false;
+        }
+    }
+    /* Sanity check when inserting a mapping */
+    else if ( flags & PTE_VALID )
+    {
+        /*
+         * We don't allow replacing any valid entry.
+         *
+         * Note that the function pt_update() relies on this
+         * assumption and will skip the TLB flush (when Svvptc
+         * extension will be ratified). The function will need
+         * to be updated if the check is relaxed.
+         */
+        if ( pte_is_valid(entry) )
+        {
+            if ( pte_is_mapping(entry) )
+                dprintk(XENLOG_ERR, "Changing MFN for valid PTE is not allowed (%#"PRI_mfn" -> %#"PRI_mfn")\n",
+                        mfn_x(mfn_from_pte(entry)), mfn_x(mfn));
+            else
+                dprintk(XENLOG_ERR, "Trying to replace table with mapping\n");
+            return false;
+        }
+    }
+    /* Sanity check when removing a mapping. */
+    else if ( !(flags & PTE_POPULATE) )
+    {
+        /* We should be here with an invalid MFN. */
+        ASSERT(mfn_eq(mfn, INVALID_MFN));
+
+        /* We don't allow removing a table */
+        if ( pte_is_table(entry) )
+        {
+            dprintk(XENLOG_ERR, "Removing a table is not allowed\n");
+            return false;
+        }
+    }
+    /* Sanity check when populating the page-table. No check so far. */
+    else
+    {
+        /* We should be here with an invalid MFN */
+        ASSERT(mfn_eq(mfn, INVALID_MFN));
+    }
+
+    return true;
+}
+
+static pte_t *map_table(mfn_t mfn)
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
+static void unmap_table(const pte_t *table)
+{
+    /*
+     * During early boot, map_table() will not use map_domain_page()
+     * but the PMAP.
+     */
+    if ( system_state == SYS_STATE_early_boot )
+        pmap_unmap(table);
+    else
+        unmap_domain_page(table);
+}
+
+static bool create_table(pte_t *entry)
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
+            return false;
+
+        mfn = page_to_mfn(pg);
+    }
+    else
+        mfn = alloc_boot_pages(1, 1);
+
+    p = map_table(mfn);
+    clear_page(p);
+    unmap_table(p);
+
+    pte = pte_from_mfn(mfn, PTE_TABLE);
+    write_pte(entry, pte);
+
+    return true;
+}
+
+#define XEN_TABLE_MAP_NONE 0
+#define XEN_TABLE_MAP_NOMEM 1
+#define XEN_TABLE_SUPER_PAGE 2
+#define XEN_TABLE_NORMAL 3
+
+/*
+ * Take the currently mapped table, find the corresponding entry,
+ * and map the next table, if available.
+ *
+ * The alloc_tbl parameters indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  XEN_TABLE_MAP_NONE: a table allocation isn't permitted.
+ *  XEN_TABLE_MAP_NOMEM: allocating a new page failed.
+ *  XEN_TABLE_NORMAL: next level or leaf mapped normally.
+ *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
+ */
+static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
+{
+    pte_t *entry;
+    mfn_t mfn;
+
+    entry = *table + offset;
+
+    if ( !pte_is_valid(*entry) )
+    {
+        if ( !alloc_tbl )
+            return XEN_TABLE_MAP_NONE;
+
+        if ( !create_table(entry) )
+            return XEN_TABLE_MAP_NOMEM;
+    }
+
+    if ( pte_is_mapping(*entry) )
+        return XEN_TABLE_SUPER_PAGE;
+
+    mfn = mfn_from_pte(*entry);
+
+    unmap_table(*table);
+    *table = map_table(mfn);
+
+    return XEN_TABLE_NORMAL;
+}
+
+/* Update an entry at the level @target. */
+static int pt_update_entry(mfn_t root, vaddr_t virt,
+                           mfn_t mfn, unsigned int target,
+                           unsigned int flags)
+{
+    int rc;
+    unsigned int level = HYP_PT_ROOT_LEVEL;
+    pte_t *table;
+    /*
+     * The intermediate page table shouldn't be allocated when MFN isn't
+     * valid and we are not populating page table.
+     * This means we either modify permissions or remove an entry, or
+     * inserting brand new entry.
+     *
+     * See the comment above pt_update() for an additional explanation about
+     * combinations of (mfn, flags).
+    */
+    bool alloc_tbl = !mfn_eq(mfn, INVALID_MFN) || (flags & PTE_POPULATE);
+    pte_t pte, *entry;
+
+    /* convenience aliases */
+    DECLARE_OFFSETS(offsets, virt);
+
+    table = map_table(root);
+    for ( ; level > target; level-- )
+    {
+        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
+        if ( rc == XEN_TABLE_MAP_NOMEM )
+        {
+            rc = -ENOMEM;
+            goto out;
+        }
+
+        if ( rc == XEN_TABLE_MAP_NONE )
+        {
+            rc = 0;
+            goto out;
+        }
+
+        if ( rc != XEN_TABLE_NORMAL )
+            break;
+    }
+
+    if ( level != target )
+    {
+        dprintk(XENLOG_ERR,
+                "%s: Shattering superpage is not supported\n", __func__);
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
+        /*
+         * There is also a check in pt_check_entry() which check that
+         * mfn=INVALID_MFN
+         */
+        pte.pte = 0;
+    else
+    {
+        /* We are inserting a mapping => Create new pte. */
+        if ( !mfn_eq(mfn, INVALID_MFN) )
+            pte = pte_from_mfn(mfn, PTE_VALID);
+        else /* We are updating the permission => Copy the current pte. */
+        {
+            pte = *entry;
+            pte.pte &= ~PTE_ACCESS_MASK;
+        }
+
+        /* update permission according to the flags */
+        pte.pte |= (flags & PTE_ACCESS_MASK) | PTE_ACCESSED | PTE_DIRTY;
+    }
+
+    write_pte(entry, pte);
+
+    rc = 0;
+
+ out:
+    unmap_table(table);
+
+    return rc;
+}
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
+     * Use a larger mapping than 4K unless the caller specifically requests
+     * 4K mapping
+     */
+    if ( unlikely(flags & PTE_SMALL) )
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
+     * `left` ( variable declared in pt_update() ) is not included
+     * and checked separately to allow superpage mapping even if it
+     * is not properly aligned (the user may have asked to map 2MB + 4k).
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
+static DEFINE_SPINLOCK(pt_lock);
+
+/*
+ * If `mfn` equals `INVALID_MFN`, it indicates that the following page table
+ * update operation might be related to either:
+ *   - populating the table (PTE_POPULATE will be set additionaly),
+ *   - destroying a mapping (PTE_VALID=0),
+ *   - modifying an existing mapping (PTE_VALID=1).
+ *
+ * If `mfn` != INVALID_MFN and flags has PTE_VALID bit set then it means that
+ * inserting will be done.
+ */
+static int pt_update(vaddr_t virt, mfn_t mfn,
+                     unsigned long nr_mfns, unsigned int flags)
+{
+    int rc = 0;
+    unsigned long vfn = PFN_DOWN(virt);
+    unsigned long left = nr_mfns;
+    const mfn_t root = get_root_page();
+
+    /*
+     * It is bad idea to have mapping both writeable and
+     * executable.
+     * When modifying/creating mapping (i.e PTE_VALID is set),
+     * prevent any update if this happen.
+     */
+    if ( (flags & PTE_VALID) && (flags & PTE_WRITABLE) &&
+         (flags & PTE_EXECUTABLE) )
+    {
+        dprintk(XENLOG_ERR,
+                "Mappings should not be both Writeable and Executable\n");
+        return -EINVAL;
+    }
+
+    if ( !IS_ALIGNED(virt, PAGE_SIZE) )
+    {
+        dprintk(XENLOG_ERR,
+                "The virtual address is not aligned to the page-size\n");
+        return -EINVAL;
+    }
+
+    spin_lock(&pt_lock);
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
+        rc = pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level, flags);
+        if ( rc )
+            break;
+
+        vfn += 1UL << order;
+        if ( !mfn_eq(mfn, INVALID_MFN) )
+            mfn = mfn_add(mfn, 1UL << order);
+
+        left -= (1UL << order);
+    }
+
+    /* Ensure that PTEs are all updated before flushing */
+    RISCV_FENCE(rw, rw);
+
+    spin_unlock(&pt_lock);
+
+    /*
+     * Always flush TLB at the end of the function as non-present entries
+     * can be put in the TLB.
+     *
+     * The remote fence operation applies to the entire address space if
+     * either:
+     *  - start and size are both 0, or
+     *  - size is equal to 2^XLEN-1.
+     *
+     * TODO: come up with something which will allow not to flash the entire
+     *       address space.
+     */
+    flush_tlb_range_va(0, 0);
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
+     * Ensure that flags has PTE_VALID bit as map_pages_to_xen() is supposed
+     * to create a mapping.
+     *
+     * Ensure that we have a valid MFN before proceeding.
+     *
+     * If the MFN is invalid, pt_update() might misinterpret the operation,
+     * treating it as either a population, a mapping destruction,
+     * or a mapping modification.
+     */
+    ASSERT(!mfn_eq(mfn, INVALID_MFN) && (flags & PTE_VALID));
+
+    return pt_update(virt, mfn, nr_mfns, flags);
+}
-- 
2.46.1


