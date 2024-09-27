Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C17988938
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 18:38:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806456.1217860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDz0-000851-FW; Fri, 27 Sep 2024 16:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806456.1217860; Fri, 27 Sep 2024 16:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1suDz0-00083M-Bz; Fri, 27 Sep 2024 16:38:18 +0000
Received: by outflank-mailman (input) for mailman id 806456;
 Fri, 27 Sep 2024 16:38:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1suDuS-0001aC-U0
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 16:33:37 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bde271f-7cee-11ef-99a2-01e77a169b0f;
 Fri, 27 Sep 2024 18:33:32 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c4146c7b28so2640037a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 09:33:32 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c27d47a2sm150697966b.89.2024.09.27.09.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:33:30 -0700 (PDT)
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
X-Inumbo-ID: 3bde271f-7cee-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727454811; x=1728059611; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4Ld+5lPduJk2yBXbctOw9z79Y28xifXYie/Iqgy91c=;
        b=V1y/fJqvbsHHrXXkHrG1QL2TkJ/3C/9ty5MvDLJNLbTy4uUjUA5g4gJ/Nj1rNXGyf0
         bqSSafyiYBVwr1AgA8x833UVefO22wJ1pFhDAR2VxTP1G6h0vGn46JwWNiNSw90xzTZ7
         FhkJgmL60SxsWAgzFJaAuVBbAgA4uwZ7s6bZtc8NwKE1XGSzUw4/9YzTa/WTRO2JsuXV
         Iw7BMAExi93PBMXjM9lX2j3EjlGgcvKgpxdA4aSSTiwi/4LFHF5iqur4/HPaszTxc4QY
         jNfv+QMCQncaZLYTimrjtKaxrTWqMx/Pa341+HFIjP3e/dc/d/MDv5PXhy93oqxGfq9T
         UmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727454811; x=1728059611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4Ld+5lPduJk2yBXbctOw9z79Y28xifXYie/Iqgy91c=;
        b=hlL3cS9oT+D71n4D8SrEgZcW7D/2N1mMAH1iXhXW4UKN9ADVJKf/vdkvkZ+/DMiZap
         dLvFH0+r7UxKLeuAZvLftFlABGMF07P68kKOv40r0FaMxoYppnBuyiCM4qmf0otRei1c
         EVp2TY09t4WQBRdZZoQTtqWKlkqMJoYqchtQ0xhU/IqHPHjVBoTbQJiJf6nX2hGniggZ
         ixnLFB+dZhIMMu1w/N3q0spqWcLrJxhyDRsPGbEHBlllQFCd5A89x+bL9IQ7+jvBZh9J
         9Y0BICQw0MRYUWcGZ5KNZ2pGMPAE1xbIStglr1P5B7C86kwwI/cGKdRjqyyA2g2P8PPd
         D+Rw==
X-Gm-Message-State: AOJu0YwCx9/P/bcK5zIaAQONGNScwxA8zfNG1vMKlMREMgr2SRgRayQH
	2XZrJuZTjzQTCaXjr8EfmjGjf03/wzOf/KtW7LZBKop0aiph/yBUqWPODg==
X-Google-Smtp-Source: AGHT+IF8teEmKIG4mTsq3h0tqrtMmJixRzLVLm2FcMMGLN6zCMd0xYrgm/qX2FjdDzaKwNQ2Y2NGTA==
X-Received: by 2002:a17:907:7e85:b0:a8d:1284:6de5 with SMTP id a640c23a62f3a-a93c49042e6mr270527766b.14.1727454810863;
        Fri, 27 Sep 2024 09:33:30 -0700 (PDT)
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
Subject: [PATCH v8 6/7] xen/riscv: page table handling
Date: Fri, 27 Sep 2024 18:33:18 +0200
Message-ID: <ead52f68ce47d55a78e2062aa4ef4d8675258091.1727449154.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727449154.git.oleksii.kurochko@gmail.com>
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
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
index 0000000000..a5552a4871
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
+                       mfn_x(mfn_from_pte(entry)), mfn_x(mfn));
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
+ *  XEN_TABLE_MAP_FAILED: Either alloc_only was set and the entry
+ *  was empty, or allocating a new page failed.
+ *  XEN_TABLE_NORMAL: next level or leaf mapped normally
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
+        if ( create_table(entry) )
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


