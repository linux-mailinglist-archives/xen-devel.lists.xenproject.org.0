Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD395A269
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 18:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781298.1190896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqv-0005Kg-9w; Wed, 21 Aug 2024 16:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781298.1190896; Wed, 21 Aug 2024 16:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgnqv-0005Gc-2x; Wed, 21 Aug 2024 16:06:29 +0000
Received: by outflank-mailman (input) for mailman id 781298;
 Wed, 21 Aug 2024 16:06:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Njk=PU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sgnqs-0003sE-Te
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 16:06:27 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5136678b-5fd7-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 18:06:25 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5334c4cc17fso230257e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 09:06:25 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5334c75a2cbsm18101e87.187.2024.08.21.09.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 09:06:23 -0700 (PDT)
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
X-Inumbo-ID: 5136678b-5fd7-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724256385; x=1724861185; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDV1tsPkyyZ0s31JtDUobwApmNzZwqQvW5WKBrf+ijM=;
        b=eeo05hGViEiI7CAgy6qEBQ/58vf4PMNICbjCCeVo7Bi9NOJsm6Qk/4C6E/XHxUeLQQ
         FN3gTivCdBsFvUiwUXsTsGsaMimPceyv3uwq3r1efkHT2qPRGKfWTFrh7ezwY3mvrFeq
         5x0lHAxunRLNrMZzOYsSg6Mkj9hELUVERlXzHMF6DWIShDJVm29QdYl4tLC9SVJg01hJ
         wej8R5+RRr6w5PaqS8tOqyz72SHmJuQshGjmD9pqKsIekGQFrG3K6GLY3xpxfS7gDQUQ
         /7ExJq/qw3h5e+absQwXoNpQ+W7kwTa9MHdnbEYBFjeVRIwgHfbRkpWJ6cz3K8IURqps
         4brA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724256385; x=1724861185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rDV1tsPkyyZ0s31JtDUobwApmNzZwqQvW5WKBrf+ijM=;
        b=qVhUkoe9Fi01o+OR12jst9+j5wL1fvFadDgz+zyWC4WDT0xpubDkNfFTolIKSeydOI
         nD80k3kR2vN74GjCgZ0NSuyx3KborGA1RoYU4tsK3r1pYwYxj6YoZjVu1Yheh+xwi4ji
         yNgT2wklq5p2ikRq4NzhEfWrJzGbO+k3JUlMHwUtUkS1shEz+8SMtlCA+8P6/JAugKg2
         tkLp0ZStYQTwab3b+hFJwNcbDGkIc/U2YgnZ71gh20rv0FBZh3+Pw1uEItPLgxpCtc9l
         SNPNxYzxKHSk3Awjb7UdtNeBhIMXjnCkPo6YdxIGJYBrPlJQUq8EnrmpH2KZmE1GNqqd
         8pew==
X-Gm-Message-State: AOJu0YzREQ7H2d9+DLj8sxVVUSvAI4UFHwqVPE9MlUVPhOfUSWkZBgZM
	BUB1jOnsDyusXsduDF0KQctjc1ymq6ih1AHUTonzQnbbC4oDb1gnWJJdSg==
X-Google-Smtp-Source: AGHT+IHkJMA6ZZyJm2XOTUKm9KDM2CMTVwxBL7LghDaYLdumE2y3Rrvrz3/hda0YCi9QCwZqzhEtbg==
X-Received: by 2002:a05:6512:3f12:b0:52c:d819:517e with SMTP id 2adb3069b0e04-533485a6c58mr1902513e87.30.1724256384211;
        Wed, 21 Aug 2024 09:06:24 -0700 (PDT)
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
Subject: [PATCH v5 6/7] xen/riscv: page table handling
Date: Wed, 21 Aug 2024 18:06:15 +0200
Message-ID: <090e617d88b279ae88f1a7859875a7e1a0c6ae73.1724256027.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1724256026.git.oleksii.kurochko@gmail.com>
References: <cover.1724256026.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
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

Introduce internal macros starting with PTE_* for convenience.
These macros closely resemble PTE bits, with the exception of
PTE_SMALL, which indicates that 4KB is needed.

In addition introduce flush_tlb_range_va() for TLB flushing across
CPUs after updating the PTE for the requested mapping.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/flushtlb.h       |  12 +
 xen/arch/riscv/include/asm/mm.h             |   2 +
 xen/arch/riscv/include/asm/page.h           |  57 +++
 xen/arch/riscv/include/asm/riscv_encoding.h |   1 +
 xen/arch/riscv/mm.c                         |   9 -
 xen/arch/riscv/pt.c                         | 420 ++++++++++++++++++++
 7 files changed, 493 insertions(+), 9 deletions(-)
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
index f4a735fd6c..031d781aa2 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -5,12 +5,24 @@
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
index 55916eaa92..f148d82261 100644
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
@@ -34,15 +39,53 @@
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
+#define PTE_R_MASK(x)   ((x) & PTE_READABLE)
+#define PTE_W_MASK(x)   ((x) & PTE_WRITABLE)
+#define PTE_X_MASK(x)   ((x) & PTE_EXECUTABLE)
+
+#define PTE_RWX_MASK(x) ((x) & (PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE))
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
@@ -68,6 +111,20 @@ static inline bool pte_is_valid(pte_t p)
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
+           (p.pte & (PTE_WRITABLE | PTE_EXECUTABLE));
+}
+
 static inline void invalidate_icache(void)
 {
     BUG_ON("unimplemented");
diff --git a/xen/arch/riscv/include/asm/riscv_encoding.h b/xen/arch/riscv/include/asm/riscv_encoding.h
index 58abe5eccc..d80cef0093 100644
--- a/xen/arch/riscv/include/asm/riscv_encoding.h
+++ b/xen/arch/riscv/include/asm/riscv_encoding.h
@@ -164,6 +164,7 @@
 #define SSTATUS_SD			SSTATUS64_SD
 #define SATP_MODE			SATP64_MODE
 #define SATP_MODE_SHIFT			SATP64_MODE_SHIFT
+#define SATP_PPN_MASK			_UL(0x00000FFFFFFFFFFF)
 
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
index 0000000000..15eb02fe9e
--- /dev/null
+++ b/xen/arch/riscv/pt.c
@@ -0,0 +1,420 @@
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
+    paddr_t root_maddr = (csr_read(CSR_SATP) & SATP_PPN_MASK) << PAGE_SHIFT;
+
+    return maddr_to_mfn(root_maddr);
+}
+
+/* Sanity check of the entry. */
+static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned int flags)
+{
+    /*
+     * See the comment about the possible combination of (mfn, flags) in
+     * the comment above pt_update().
+     */
+
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
+         * Note that the function pt_update() relies on this
+         * assumption and will skip the TLB flush (when Svvptc
+         * extension will be ratified). The function will need
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
+static int create_table(pte_t *entry)
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
+    p = map_table(mfn);
+    clear_page(p);
+    unmap_table(p);
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
+ * The alloc_tbl parameters indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  XEN_TABLE_MAP_FAILED: Either alloc_only was set and the entry
+ *  was empty, or allocating a new page failed.
+ *  XEN_TABLE_NORMAL: next level or leaf mapped normally
+ *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
+ */
+static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned int offset)
+{
+    pte_t *entry;
+    int ret;
+    mfn_t mfn;
+
+    entry = *table + offset;
+
+    if ( !pte_is_valid(*entry) )
+    {
+        if ( alloc_tbl )
+            return XEN_TABLE_MAP_FAILED;
+
+        ret = create_table(entry);
+        if ( ret )
+            return XEN_TABLE_MAP_FAILED;
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
+static int pt_update_entry(mfn_t root, unsigned long virt,
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
+    bool alloc_tbl = mfn_eq(mfn, INVALID_MFN) && !(flags & PTE_POPULATE);
+    pte_t pte, *entry;
+
+    /* convenience aliases */
+    DECLARE_OFFSETS(offsets, virt);
+
+    table = map_table(root);
+    for ( ; level > target; level-- )
+    {
+        rc = pt_next_level(alloc_tbl, &table, offsets[level]);
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
+    /* Use blocking mapping unless the caller requests 4K mapping */
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
+static DEFINE_SPINLOCK(xen_pt_lock);
+
+/*
+ * If `mfn` equals `INVALID_MFN`, it indicates that the following page table
+ * update operation might be related to either populating the table (
+ * PTE_POPULATE will be set additionaly), destroying a mapping, or modifying
+ * an existing mapping.
+ *
+ * If `mfn` is valid and flags has PTE_VALID bit set then it means that
+ * inserting will be done.
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
+    spin_unlock(&xen_pt_lock);
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
+    ASSERT(!mfn_eq(mfn, INVALID_MFN) || (flags & PTE_VALID));
+
+    return pt_update(virt, mfn, nr_mfns, flags);
+}
-- 
2.46.0


