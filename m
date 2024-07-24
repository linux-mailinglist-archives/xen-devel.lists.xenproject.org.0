Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3422593B3DC
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 17:36:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764353.1174800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWe2Q-0005ne-IT; Wed, 24 Jul 2024 15:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764353.1174800; Wed, 24 Jul 2024 15:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWe2Q-0005li-Ec; Wed, 24 Jul 2024 15:36:22 +0000
Received: by outflank-mailman (input) for mailman id 764353;
 Wed, 24 Jul 2024 15:36:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fJNX=OY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWdy8-0005Od-Lf
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 15:31:56 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dadb5699-49d1-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 17:31:54 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2f032cb782dso9068661fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 08:31:54 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef2b568858sm13237311fa.35.2024.07.24.08.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 08:31:52 -0700 (PDT)
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
X-Inumbo-ID: dadb5699-49d1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835113; x=1722439913; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lI5HWGurPenfum8/x5dM5na/gvlX/NTHbcJKhmKmsaw=;
        b=fjysHqPwsWHfHhBAuFL4TqYpd/nf0wUFQoL6qTmMgV/+cCWqVCBZ0k6vCJ9bpWREDt
         lIBNaTUTDx3e+MC+kEiI0GVk3sMfCxIbnzTioUsr+gY/cbyagTAW+tqLrouQ25wGpysR
         705W8Ua/iCO24Y+JYEiHzYECaVVQ/AANbjR8IjLgrzDADPn/W5R3AYWXc88cD4BrVCsC
         a101FCKTxM4XlmJLZy+XqXscW6jCaJHic7o15ey4XwdPZgE+enY/2jW1gOkl3btGodk9
         nGqFDPUfzO/MjMEW8FPpyWmMHVenNkKueexvtXlK/Q4u4fwRnxcNxp9DFovX+A2lHZ+n
         Uukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835113; x=1722439913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lI5HWGurPenfum8/x5dM5na/gvlX/NTHbcJKhmKmsaw=;
        b=cl+79nlLPUXeXYImlTKKSNBQtzpQj3uDBIRO6lxoIOw+SGJBVIuKmzuQIC4NnUSfIy
         Z3DfiWfqXkfRZWvr4f3HfHBt88bmi4Dxy00h8NOoHezra6BEEvbR7hoG5WOC/l2y2a6P
         r9EOOT39AhLE5ZK6j+MbictQbjArZf7nXmqTW1Av2L5cPOQ79TCbzW5Rk10X1h327J6f
         8C1WPrlTfj8kt/WOJQm5ClUcDDs6qAUw6cK9DITDyWPq7PKsjQUT+a8qVRp3gxzgE6pk
         qvVbyqSAe2p3kd7ZSobAhtCAM3QYafpYr/FSx0miKg8G0YBG1NOsXlzDaGXKe1MrPZUj
         um1Q==
X-Gm-Message-State: AOJu0YzO7PodCjE+VbOd1f6jTrPL0JFm6CkIhX+5erOHJjsYu5C243Cd
	9cTuXmEdYjfsdBhz72rTDD1wBQc/7e/8vyHC5V74nwKM/plSOnXTJyMZTIRM
X-Google-Smtp-Source: AGHT+IFP73Maz9Gt5qpz141xPSg5oqeenO+HdR2JthQ4dCu0M1ouI1mY9DQ70NdFpK9qTDh6tCawmg==
X-Received: by 2002:a2e:9f0f:0:b0:2f0:1fb6:344b with SMTP id 38308e7fff4ca-2f039f3b8d9mr1028491fa.47.1721835113139;
        Wed, 24 Jul 2024 08:31:53 -0700 (PDT)
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
Subject: [PATCH v3 8/9] xen/riscv: page table handling
Date: Wed, 24 Jul 2024 17:31:39 +0200
Message-ID: <595c7b6736d6f718bafc7a677fb13881584ce4dc.1721834549.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721834549.git.oleksii.kurochko@gmail.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduces an implementation of map_pages_to_xen() which requires multiple
functions to work with page tables/entries:
- xen_pt_update()
- xen_pt_mapping_level()
- xen_pt_update_entry()
- xen_pt_next_level()
- xen_pt_check_entry()

During the mentioned above function it is necessary to create Xen tables
or map/unmap them. For that it were introduced the following functions:
- create_xen_table()
- xen_map_table()
- xen_unmap_table()

Also it was introduced various internal macros for convience started with
_PAGE_* which almost duplicate the bits in PTE except _PAGE_BLOCK which
actually doesn't present in PTE which indicates that page larger then 4k
is needed. RISC-V doesn't have a specific bit in PTE and it detect if it
is a superpage or not only by using pte.x and pte.r. From the RISC-V spec:
```
  ...
  4. Otherwise, the PTE is valid. If pte.r = 1 or pte.x = 1, go to step 5.
     Otherwise, this PTE is a pointer to the next level of the page table.
     ... .
  5. A leaf PTE has been found.
     ...
  ...
```

Except that it was introduced flush_xen_tlb_range_va() for TLB flushing
accross CPUs when PTE for requested mapping was properly updated.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - new patch. ( Technically it is reworked version of the generic approach
   which I tried to suggest in the previous version )
---
 xen/arch/riscv/Kconfig                 |   1 +
 xen/arch/riscv/Makefile                |   1 +
 xen/arch/riscv/include/asm/flushtlb.h  |  15 +
 xen/arch/riscv/include/asm/mm.h        |   2 +
 xen/arch/riscv/include/asm/page-bits.h |  36 +++
 xen/arch/riscv/include/asm/page.h      |  73 ++++-
 xen/arch/riscv/mm.c                    |   9 -
 xen/arch/riscv/pt.c                    | 410 +++++++++++++++++++++++++
 8 files changed, 537 insertions(+), 10 deletions(-)
 create mode 100644 xen/arch/riscv/pt.c

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
index cf66e90773..90c65b153f 100644
--- a/xen/arch/riscv/include/asm/flushtlb.h
+++ b/xen/arch/riscv/include/asm/flushtlb.h
@@ -5,6 +5,8 @@
 #include <xen/bug.h>
 #include <xen/cpumask.h>
 
+#include <asm/sbi.h>
+
 /* Flush TLB of local processor for address va. */
 static inline void flush_xen_tlb_one_local(vaddr_t va)
 {
@@ -27,6 +29,19 @@ static inline void flush_xen_tlb_range_va_local(vaddr_t va,
     }
 }
 
+/*
+ * Flush a range of VA's hypervisor mappings from the TLB of all
+ * processors in the inner-shareable domain.
+ */
+static inline void flush_xen_tlb_range_va(vaddr_t va,
+                                          unsigned long size)
+{
+    if ( sbi_has_rfence() )
+        sbi_remote_sfence_vma(NULL, va, size);
+    else
+        BUG_ON("IPI support is need for remote TLB flush");
+}
+
 /*
  * Filter the given set of CPUs, removing those that definitely flushed their
  * TLB since @page_timestamp.
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index a0bdc2bc3a..a7550e77a7 100644
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
diff --git a/xen/arch/riscv/include/asm/page-bits.h b/xen/arch/riscv/include/asm/page-bits.h
index 8f1f474371..8e40a607d8 100644
--- a/xen/arch/riscv/include/asm/page-bits.h
+++ b/xen/arch/riscv/include/asm/page-bits.h
@@ -3,6 +3,42 @@
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
+ *
+ * _PAGE_BLOCK was introduced to have ability to tell that superpage
+ * should be allocated.
+ */
+#define _PAGE_BLOCK         BIT(9, UL)
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
index 2308cefb0a..0da52b03a3 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -34,6 +34,7 @@
 #define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 #define PTE_TABLE                   (PTE_VALID)
 
+#define PAGE_HYPERVISOR_RO          (PTE_VALID | PTE_READABLE)
 #define PAGE_HYPERVISOR_RW          (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
 
 #define PAGE_HYPERVISOR             PAGE_HYPERVISOR_RW
@@ -43,13 +44,68 @@
 
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
 
 pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int access_bits);
@@ -70,6 +126,21 @@ static inline bool pte_is_valid(pte_t p)
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
index 959b6fc63e..ecb0f15fa8 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -374,15 +374,6 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     return -1;
 }
 
-int map_pages_to_xen(unsigned long virt,
-                     mfn_t mfn,
-                     unsigned long nr_mfns,
-                     unsigned int flags)
-{
-    BUG_ON("unimplemented");
-    return -1;
-}
-
 static inline pte_t mfn_from_pte(mfn_t mfn)
 {
     unsigned long pte = mfn_x(mfn) << PTE_PPN_SHIFT;
diff --git a/xen/arch/riscv/pt.c b/xen/arch/riscv/pt.c
new file mode 100644
index 0000000000..e057bc4e98
--- /dev/null
+++ b/xen/arch/riscv/pt.c
@@ -0,0 +1,410 @@
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
+    unsigned long root_maddr = csr_read(CSR_SATP) << PAGE_SHIFT;
+
+    return maddr_to_mfn(root_maddr);
+}
+
+static inline void set_pte_permissions(pte_t *pte, unsigned int flags)
+{
+    pte->bits.r = PAGE_RO_MASK(flags);
+    pte->bits.x = ~PAGE_XN_MASK(flags);
+    pte->bits.w = PAGE_W_MASK(flags);
+
+    pte->pte |= PTE_ACCESSED | PTE_DIRTY;
+}
+
+/* Sanity check of the entry */
+static bool xen_pt_check_entry(pte_t entry, mfn_t mfn, unsigned int level,
+                               unsigned int flags)
+{
+    /* Sanity check when modifying an entry. */
+    if ( mfn_eq(mfn, INVALID_MFN) )
+    {
+        /* We don't allow modifying an invalid entry. */
+        if ( !pte_is_valid(entry) )
+        {
+            printk("Modifying invalid entry is not allowed.\n");
+            return false;
+        }
+
+        /* We don't allow modifying a table entry */
+        if ( !pte_is_mapping(entry, level) )
+        {
+            printk("Modifying a table entry is not allowed.\n");
+            return false;
+        }
+    }
+    /* Sanity check when inserting a mapping */
+    else if ( flags & _PAGE_PRESENT )
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
+            if ( pte_is_mapping(entry, level) )
+                printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
+                          mfn_x(pte_get_mfn(entry)), mfn_x(mfn));
+            else
+                printk("Trying to replace a table with a mapping.\n");
+            return false;
+        }
+    }
+    /* Sanity check when removing a mapping. */
+    else if ( (flags & _PAGE_PRESENT) == 0 )
+    {
+        /* We should be here with an invalid MFN. */
+        ASSERT(mfn_eq(mfn, INVALID_MFN));
+
+        /* We don't allow removing a table */
+        if ( pte_is_table(entry, level) )
+        {
+            printk("Removing a table is not allowed.\n");
+            return false;
+        }
+    }
+    /* No check so far. */
+    else
+    {
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
+    pte = mfn_to_xen_entry(mfn, PTE_TABLE);
+    write_pte(entry, pte);
+
+    return 0;
+}
+
+#define XEN_TABLE_MAP_FAILED 0
+#define XEN_TABLE_SUPER_PAGE 1
+#define XEN_TABLE_NORMAL_PAGE 2
+
+/*
+ * Take the currently mapped table, find the corresponding entry,
+ * and map the next table, if available.
+ *
+ * The read_only parameters indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  XEN_TABLE_MAP_FAILED: Either read_only was set and the entry
+ *  was empty, or allocating a new page failed.
+ *  XEN_TABLE_NORMAL_PAGE: next level mapped normally
+ *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
+ */
+static int xen_pt_next_level(bool read_only, unsigned int level,
+                             pte_t **table, unsigned int offset)
+{
+    pte_t *entry;
+    int ret;
+    mfn_t mfn;
+
+    entry = *table + offset;
+
+    if ( !pte_is_valid(*entry) )
+    {
+        if ( read_only )
+            return XEN_TABLE_MAP_FAILED;
+
+        ret = create_xen_table(entry);
+        if ( ret )
+            return XEN_TABLE_MAP_FAILED;
+    }
+
+    if ( pte_is_mapping(*entry, level) )
+    {
+        return XEN_TABLE_SUPER_PAGE;
+    }
+
+    mfn = pte_get_mfn(*entry);
+
+    xen_unmap_table(*table);
+    *table = xen_map_table(mfn);
+
+    return XEN_TABLE_NORMAL_PAGE;
+}
+
+/* Update an entry at the level @target. */
+static int xen_pt_update_entry(mfn_t root, unsigned long virt,
+                               mfn_t mfn, unsigned int arch_target,
+                               unsigned int flags)
+{
+    int rc;
+    unsigned int level = HYP_PT_ROOT_LEVEL;
+    unsigned int arch_level = level;
+    unsigned int target = arch_target;
+    pte_t *table;
+    /*
+     * The intermediate page tables are read-only when the MFN is not valid
+     * This means we either modify permissions or remove an entry.
+     */
+    bool read_only = mfn_eq(mfn, INVALID_MFN);
+    pte_t pte, *entry;
+
+    /* convenience aliases */
+    DECLARE_OFFSETS(offsets, (paddr_t)virt);
+
+    table = xen_map_table(root);
+    for ( ; level > target; level--, arch_level = level )
+    {
+        rc = xen_pt_next_level(read_only, arch_level, &table, offsets[arch_level]);
+        if ( rc == XEN_TABLE_MAP_FAILED )
+        {
+            /*
+             * We are here because xen_pt_next_level has failed to map
+             * the intermediate page table (e.g the table does not exist
+             * and the pt is read-only). It is a valid case when
+             * removing a mapping as it may not exist in the page table.
+             * In this case, just ignore it.
+             */
+            if ( flags & _PAGE_PRESENT )
+            {
+                printk("%s: Unable to map level %u\n", __func__, arch_level);
+                rc = -ENOENT;
+                goto out;
+            }
+            else
+            {
+                rc = 0;
+                goto out;
+            }
+        }
+        else if ( rc != XEN_TABLE_NORMAL_PAGE ) {
+            break;
+        }
+    }
+
+    if ( arch_level != arch_target )
+    {
+        printk("%s: Shattering superpage is not supported\n", __func__);
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    entry = table + offsets[arch_level];
+
+    rc = -EINVAL;
+    if ( !xen_pt_check_entry(*entry, mfn, arch_level, flags) )
+        goto out;
+
+    /* We are removing the page */
+    if ( !(flags & _PAGE_PRESENT) )
+        memset(&pte, 0x00, sizeof(pte));
+    else
+    {
+        /* We are inserting a mapping => Create new pte. */
+        if ( !mfn_eq(mfn, INVALID_MFN) )
+        {
+            pte = mfn_to_xen_entry(mfn, PTE_VALID);
+        }
+        else /* We are updating the permission => Copy the current pte. */
+            pte = *entry;
+
+        set_pte_permissions(&pte, flags);
+    }
+
+    write_pte(entry, pte);
+
+    rc = 0;
+
+out:
+    xen_unmap_table(table);
+
+    return rc;
+}
+
+static DEFINE_SPINLOCK(xen_pt_lock);
+
+/* Return the level where mapping should be done */
+static int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
+                                unsigned int flags)
+{
+    unsigned int level = 0;
+    unsigned long mask;
+    int i;
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
+    /*
+     * Always use level 0 ( 4k mapping ) mapping unless the caller request
+     * block mapping.
+     */
+    if ( likely(!(flags & _PAGE_BLOCK)) )
+        return level;
+
+    for ( i = HYP_PT_ROOT_LEVEL; i > 0; i-- )
+    {
+        if ( !(mask & (BIT(XEN_PT_LEVEL_ORDER(i), UL) - 1)) &&
+            (nr >= BIT(XEN_PT_LEVEL_ORDER(i), UL)) )
+        {
+            level = i;
+            break;
+        }
+    }
+
+    return level;
+}
+
+static int xen_pt_update(unsigned long virt,
+                         mfn_t mfn,
+                         /* const on purpose as it is used for TLB flush */
+                         const unsigned long nr_mfns,
+                         unsigned int flags)
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
+     * When modifying/creating mapping (i.e _PAGE_PRESENT is set),
+     * prevent any update if this happen.
+     */
+    if ( (flags & _PAGE_PRESENT) && !PAGE_RO_MASK(flags) &&
+         !PAGE_XN_MASK(flags) )
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
+        level = xen_pt_mapping_level(vfn, mfn, left, flags);
+        order = XEN_PT_LEVEL_ORDER(level);
+
+        ASSERT(left >= BIT(order, UL));
+
+        rc = xen_pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level,
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
+    /*
+     * The TLBs flush can be safely skipped when a mapping is inserted
+     * as we don't allow mapping replacement (see xen_pt_check_entry()).
+     *
+     * For all the other cases, the TLBs will be flushed unconditionally
+     * even if the mapping has failed. This is because we may have
+     * partially modified the PT. This will prevent any unexpected
+     * behavior afterwards.
+     */
+    if ( !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN)) )
+        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
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
+    return xen_pt_update(virt, mfn, nr_mfns, flags);
+}
-- 
2.45.2


