Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22B573D67C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555049.866712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5H-00044x-9C; Mon, 26 Jun 2023 03:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555049.866712; Mon, 26 Jun 2023 03:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5G-0003hT-9w; Mon, 26 Jun 2023 03:40:10 +0000
Received: by outflank-mailman (input) for mailman id 555049;
 Mon, 26 Jun 2023 03:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1w-0007ej-4x
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id aad60b95-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:36:42 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 473F21FB;
 Sun, 25 Jun 2023 20:37:26 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C3963F64C;
 Sun, 25 Jun 2023 20:36:39 -0700 (PDT)
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
X-Inumbo-ID: aad60b95-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 30/52] xen/mpu: populate a new region in Xen MPU mapping table
Date: Mon, 26 Jun 2023 11:34:21 +0800
Message-Id: <20230626033443.2943270-31-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new helper xen_mpumap_update() is responsible for updating Xen MPU memory
mapping table(xen_mpumap), including creating a new entry, updating
or destroying an existing one. It is equivalent to xen_pt_update in MMU.
This commit only talks about populating a new entry in Xen MPU memory mapping
table(xen_mpumap). Others will be introduced in the following commits.

When populating a new entry in Xen MPU memory mapping table(xen_mpumap),
firstly, we shall check if requested address range [base, limit) is mapped.
If not, we shall find a free slot in xen_mpumap to insert, based on bitmap
xen_mpumap_mask, and use standard entry pr_of_xenaddr() to build up MPU memory
region structure(pr_t)
In the last, we set memory attribute and permission based on variable @flags.

To summarize all region attributes in one variable @flags, layout of the
flags is elaborated as follows:
[0:2] Memory attribute Index
[3:4] Execute Never
[5:6] Access Permission
[7]   Region Present
Also, we provide a set of definitions(REGION_HYPERVISOR_RW, etc) that combine
the memory attribute and permission for common combinations.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- implement pr_set_base/pr_set_limit/region_is_valid using static
inline.
- define index uint8_t to limit its size
- stay the same major entry map_pages_to_xen, then go different path
in different context(xen_pt_update in MMU, and xen_mpumap_update in MPU)
---
 xen/arch/arm/include/asm/arm64/mpu.h |  64 +++++++
 xen/arch/arm/include/asm/mm.h        |   3 +
 xen/arch/arm/include/asm/mpu/mm.h    |  16 ++
 xen/arch/arm/include/asm/page.h      |  22 +++
 xen/arch/arm/mm.c                    |  20 +++
 xen/arch/arm/mmu/mm.c                |   9 +-
 xen/arch/arm/mpu/mm.c                | 255 +++++++++++++++++++++++++++
 7 files changed, 381 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 407fec66c9..a6b07bab02 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -6,6 +6,10 @@
 #ifndef __ARM64_MPU_H__
 #define __ARM64_MPU_H__
 
+#define MPU_REGION_SHIFT  6
+#define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
+#define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
+
 /*
  * MPUIR_EL2.Region identifies the number of regions supported by the EL2 MPU.
  * It is a 8-bit field, so 255 MPU memory regions at most.
@@ -21,8 +25,33 @@
 #define REGION_UART_SEL            0x07
 #define MPUIR_REGION_MASK          ((_AC(1, UL) << 8) - 1)
 
+/* Access permission attributes. */
+/* Read/Write at EL2, No Access at EL1/EL0. */
+#define AP_RW_EL2 0x0
+/* Read/Write at EL2/EL1/EL0 all levels. */
+#define AP_RW_ALL 0x1
+/* Read-only at EL2, No Access at EL1/EL0. */
+#define AP_RO_EL2 0x2
+/* Read-only at EL2/EL1/EL0 all levels. */
+#define AP_RO_ALL 0x3
+
+/*
+ * Excute never.
+ * Stage 1 EL2 translation regime.
+ * XN[1] determines whether execution of the instruction fetched from the MPU
+ * memory region is permitted.
+ * Stage 2 EL1/EL0 translation regime.
+ * XN[0] determines whether execution of the instruction fetched from the MPU
+ * memory region is permitted.
+ */
+#define XN_DISABLED    0x0
+#define XN_P2M_ENABLED 0x1
+#define XN_ENABLED     0x2
+
 #ifndef __ASSEMBLY__
 
+#define INVALID_REGION_IDX 0xff
+
 /* Protection Region Base Address Register */
 typedef union {
     struct __packed {
@@ -54,6 +83,41 @@ typedef struct {
     prlar_t prlar;
 } pr_t;
 
+/* Access to set base address of MPU protection region(pr_t). */
+static inline void pr_set_base(pr_t *pr, paddr_t base)
+{
+    pr->prbar.reg.base = (base >> MPU_REGION_SHIFT);
+}
+
+/* Access to set limit address of MPU protection region(pr_t). */
+static inline void pr_set_limit(pr_t *pr, paddr_t limit)
+{
+    pr->prlar.reg.limit = (limit >> MPU_REGION_SHIFT);
+}
+
+/*
+ * Access to get base address of MPU protection region(pr_t).
+ * The base address shall be zero extended.
+ */
+static inline paddr_t pr_get_base(pr_t *pr)
+{
+    return (paddr_t)(pr->prbar.reg.base << MPU_REGION_SHIFT);
+}
+
+/*
+ * Access to get limit address of MPU protection region(pr_t).
+ * The limit address shall be concatenated with 0x3f.
+ */
+static inline paddr_t pr_get_limit(pr_t *pr)
+{
+    return (paddr_t)((pr->prlar.reg.limit << MPU_REGION_SHIFT) | ~MPU_REGION_MASK);
+}
+
+static inline bool region_is_valid(pr_t *pr)
+{
+    return pr->prlar.reg.en;
+}
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ARM64_MPU_H__ */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index ea4847c12b..daa6329505 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -16,6 +16,8 @@
 
 #ifdef CONFIG_HAS_MMU
 #include <asm/mmu/mm.h>
+#else
+#include <asm/mpu/mm.h>
 #endif
 
 /* Align Xen to a 2 MiB boundary. */
@@ -203,6 +205,7 @@ extern uint64_t init_mm;
 
 /* Boot-time memory mapping setup */
 extern void setup_mm_mappings(unsigned long boot_phys_offset);
+extern bool flags_has_rwx(unsigned int flags);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
new file mode 100644
index 0000000000..eec572ecfc
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __ARCH_ARM_MM_MPU__
+#define __ARCH_ARM_MM_MPU__
+
+extern int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
+
+#endif /* __ARCH_ARM_MM_MPU__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index 3893303c8f..85ecd5e4de 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -62,6 +62,7 @@
 
 #define MAIRVAL (MAIR1VAL << 32 | MAIR0VAL)
 
+#ifndef CONFIG_HAS_MPU
 /*
  * Layout of the flags used for updating the hypervisor page tables
  *
@@ -89,6 +90,27 @@
 
 #define _PAGE_CONTIG_BIT    8
 #define _PAGE_CONTIG        (1U << _PAGE_CONTIG_BIT)
+#else
+/*
+ * Layout of the flags used for updating MPU memory region attributes
+ * [0:2] Memory attribute Index
+ * [3:4] Execute Never
+ * [5:6] Access Permission
+ * [7]   Region Present
+ */
+#define _PAGE_AI_BIT            0
+#define _PAGE_XN_BIT            3
+#define _PAGE_AP_BIT            5
+#define _PAGE_PRESENT_BIT       7
+#define _PAGE_AI                (7U << _PAGE_AI_BIT)
+#define _PAGE_XN                (2U << _PAGE_XN_BIT)
+#define _PAGE_RO                (2U << _PAGE_AP_BIT)
+#define _PAGE_PRESENT           (1U << _PAGE_PRESENT_BIT)
+#define PAGE_AI_MASK(x)         (((x) >> _PAGE_AI_BIT) & 0x7U)
+#define PAGE_XN_MASK(x)         (((x) >> _PAGE_XN_BIT) & 0x3U)
+#define PAGE_AP_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x3U)
+#define PAGE_RO_MASK(x)         (((x) >> _PAGE_AP_BIT) & 0x2U)
+#endif /* CONFIG_HAS_MPU */
 
 /*
  * _PAGE_DEVICE and _PAGE_NORMAL are convenience defines. They are not
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 97642f35d3..d35e7e280f 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -117,12 +117,32 @@ void *ioremap(paddr_t pa, size_t len)
     return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
 }
 
+bool flags_has_rwx(unsigned int flags)
+{
+    /*
+     * The hardware was configured to forbid mapping both writeable and
+     * executable.
+     * When modifying/creating mapping (i.e _PAGE_PRESENT is set),
+     * prevent any update if this happen.
+     */
+    if ( (flags & _PAGE_PRESENT) && !PAGE_RO_MASK(flags) &&
+         !PAGE_XN_MASK(flags) )
+        return true;
+    else
+        return false;
+}
+
 int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
                      unsigned int flags)
 {
+#ifndef CONFIG_HAS_MPU
     return xen_pt_update(virt, mfn, nr_mfns, flags);
+#else
+    return xen_mpumap_update(mfn_to_maddr(mfn),
+                             mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
+#endif
 }
 
 int destroy_xen_mappings(unsigned long s, unsigned long e)
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
index d7d5bf7287..2f29cb53fe 100644
--- a/xen/arch/arm/mmu/mm.c
+++ b/xen/arch/arm/mmu/mm.c
@@ -1037,14 +1037,7 @@ int xen_pt_update(unsigned long virt, mfn_t mfn,
      */
     const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
 
-    /*
-     * The hardware was configured to forbid mapping both writeable and
-     * executable.
-     * When modifying/creating mapping (i.e _PAGE_PRESENT is set),
-     * prevent any update if this happen.
-     */
-    if ( (flags & _PAGE_PRESENT) && !PAGE_RO_MASK(flags) &&
-         !PAGE_XN_MASK(flags) )
+    if ( flags_has_rwx(flags) )
     {
         mm_printk("Mappings should not be both Writeable and Executable.\n");
         return -EINVAL;
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 7b1b5d6e27..14a1309ca1 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -23,6 +23,19 @@
 #include <xen/mm.h>
 #include <xen/page-size.h>
 #include <asm/arm64/mpu.h>
+#include <asm/page.h>
+
+#ifdef NDEBUG
+static inline void __attribute__ ((__format__ (__printf__, 1, 2)))
+region_printk(const char *fmt, ...) {}
+#else
+#define region_printk(fmt, args...)         \
+    do                                      \
+    {                                       \
+        dprintk(XENLOG_ERR, fmt, ## args);  \
+        WARN();                             \
+    } while (0)
+#endif
 
 /* EL2 Xen MPU memory region mapping table. */
 pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
@@ -39,6 +52,10 @@ uint8_t __ro_after_init max_xen_mpumap;
  */
 static DECLARE_BITMAP(xen_mpumap_mask, ARM_MAX_MPU_MEMORY_REGIONS);
 
+static DEFINE_SPINLOCK(xen_mpumap_lock);
+
+static DEFINE_SPINLOCK(xen_mpumap_alloc_lock);
+
 /* Write a MPU protection region */
 #define WRITE_PROTECTION_REGION(pr, prbar_el2, prlar_el2) ({    \
     const pr_t *_pr = pr;                                       \
@@ -230,6 +247,244 @@ static void write_protection_region(const pr_t *pr_write, uint8_t sel)
     }
 }
 
+/*
+ * Standard entry for building up the structure of MPU memory region(pr_t).
+ * It is equivalent to mfn_to_xen_entry in MMU system.
+ * base and limit both refer to inclusive address.
+ */
+static inline pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned attr)
+{
+    prbar_t prbar;
+    prlar_t prlar;
+    pr_t region;
+
+    /* Build up value for PRBAR_EL2. */
+    prbar = (prbar_t) {
+        .reg = {
+            .ap = AP_RW_EL2,  /* Read/Write at EL2, no access at EL1/EL0. */
+            .xn = XN_ENABLED, /* No need to execute outside .text */
+        }};
+
+    switch ( attr )
+    {
+    case MT_NORMAL_NC:
+        /*
+         * ARM ARM: Overlaying the shareability attribute (DDI
+         * 0406C.b B3-1376 to 1377)
+         *
+         * A memory region with a resultant memory type attribute of normal,
+         * and a resultant cacheability attribute of Inner non-cacheable,
+         * outer non-cacheable, must have a resultant shareability attribute
+         * of outer shareable, otherwise shareability is UNPREDICTABLE.
+         *
+         * On ARMv8 sharability is ignored and explicitly treated as outer
+         * shareable for normal inner non-cacheable, outer non-cacheable.
+         */
+        prbar.reg.sh = LPAE_SH_OUTER;
+        break;
+    case MT_DEVICE_nGnRnE:
+    case MT_DEVICE_nGnRE:
+        /*
+         * Shareability is ignored for non-normal memory, Outer is as
+         * good as anything.
+         *
+         * On ARMv8 sharability is ignored and explicitly treated as outer
+         * shareable for any device memory type.
+         */
+        prbar.reg.sh = LPAE_SH_OUTER;
+        break;
+    default:
+        /* Xen mappings are SMP coherent */
+        prbar.reg.sh = LPAE_SH_INNER;
+        break;
+    }
+
+    /* Build up value for PRLAR_EL2. */
+    prlar = (prlar_t) {
+        .reg = {
+            .ns = 0,        /* Hyp mode is in secure world */
+            .ai = attr,
+            .en = 1,        /* Region enabled */
+        }};
+
+    /* Build up MPU memory region. */
+    region = (pr_t) {
+        .prbar = prbar,
+        .prlar = prlar,
+    };
+
+    /* Set base address and limit address. */
+    pr_set_base(&region, base);
+    pr_set_limit(&region, limit);
+
+    return region;
+}
+
+/*
+ * Allocate a new free EL2 MPU memory region, based on bitmap xen_mpumap_mask.
+ * If success, the associated index will be filled up.
+ * If failed, non-zero value -ENOENT will be returned.
+ */
+static int xen_mpumap_alloc_entry(uint8_t *idx)
+{
+    int rc = 0;
+
+    spin_lock(&xen_mpumap_alloc_lock);
+
+    *idx = find_first_zero_bit(xen_mpumap_mask, max_xen_mpumap);
+    if ( *idx == max_xen_mpumap )
+    {
+        rc = -ENOENT;
+        printk(XENLOG_ERR "mpu: EL2 MPU memory region mapping pool exhausted\n");
+        goto out;
+    }
+
+    set_bit(*idx, xen_mpumap_mask);
+
+out:
+    spin_unlock(&xen_mpumap_alloc_lock);
+    return rc;
+}
+
+#define MPUMAP_REGION_FAILED    0
+#define MPUMAP_REGION_FOUND     1
+#define MPUMAP_REGION_INCLUSIVE 2
+#define MPUMAP_REGION_OVERLAP   3
+/*
+ * Check whether memory range [base, limit] is mapped in MPU memory region
+ * mapping table #table. Only address range is checked, memory attributes
+ * and permission are not considered here.
+ * If we find the match, the associated index will be filled up.
+ * If the entry is not present, INVALID_REGION will be set in #index and
+ * specific non-zero error message will be returned.
+ *
+ * Make sure that parameter #base and #limit are both referring
+ * inclusive addresss
+ *
+ * Return values:
+ *  MPUMAP_REGION_FAILED: no mapping and no overlapping
+ *  MPUMAP_REGION_FOUND: find an exact match in #table
+ *  MPUMAP_REGION_INCLUSIVE: find an inclusive match in #table
+ *  MPUMAP_REGION_OVERLAP: overlap with the existing mapping
+ */
+static int mpumap_contain_region(pr_t *table, uint8_t nr_regions,
+                                 paddr_t base, paddr_t limit, uint8_t *index)
+{
+    uint8_t i = 0, _index = INVALID_REGION_IDX;
+
+    /* Allow index to be NULL */
+    index = index ? : &_index;
+
+    if ( limit < base )
+    {
+        region_printk("Base address 0x%"PRIpaddr" must be smaller than limit address 0x%"PRIpaddr"\n",
+                      base, limit);
+        return -EINVAL;
+    }
+
+    for ( ; i < nr_regions; i++ )
+    {
+        paddr_t iter_base = pr_get_base(&table[i]);
+        paddr_t iter_limit = pr_get_limit(&table[i]);
+
+        /* Found an exact valid match */
+        if ( (iter_base == base) && (iter_limit == limit) &&
+             region_is_valid(&table[i]) )
+        {
+            *index = i;
+            return MPUMAP_REGION_FOUND;
+        }
+
+        /* No overlapping */
+        if ( (iter_limit < base) || (iter_base > limit) )
+            continue;
+        /* Inclusive and valid */
+        else if ( (base >= iter_base) && (limit <= iter_limit) &&
+                  region_is_valid(&table[i]) )
+        {
+            *index = i;
+            return MPUMAP_REGION_INCLUSIVE;
+        }
+        else
+        {
+            region_printk("Range 0x%"PRIpaddr" - 0x%"PRIpaddr" overlaps with the existing region 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
+                          base, limit + 1, iter_base, iter_limit + 1);
+            return MPUMAP_REGION_OVERLAP;
+        }
+    }
+
+    return MPUMAP_REGION_FAILED;
+}
+
+/*
+ * Update an entry in Xen MPU memory region mapping table(xen_mpumap) at
+ * the index @idx.
+ * @base:  base address(inclusive)
+ * @limit: limit address(exclusive)
+ * @flags: region attributes, should be the combination of PAGE_HYPERVISOR_xx
+ */
+static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
+                                   unsigned int flags)
+{
+    uint8_t idx;
+    int rc;
+
+    rc = mpumap_contain_region(xen_mpumap, max_xen_mpumap, base, limit - 1,
+                               &idx);
+    if ( (rc < 0) || (rc == MPUMAP_REGION_OVERLAP) )
+        return -EINVAL;
+
+    /* We are inserting a mapping => Create new region. */
+    if ( flags & _PAGE_PRESENT )
+    {
+        if ( rc != MPUMAP_REGION_FAILED )
+            return -EINVAL;
+
+        rc = xen_mpumap_alloc_entry(&idx);
+        if ( rc )
+            return -ENOENT;
+
+        xen_mpumap[idx] = pr_of_xenaddr(base, limit - 1, PAGE_AI_MASK(flags));
+        /* Set permission */
+        xen_mpumap[idx].prbar.reg.ap = PAGE_AP_MASK(flags);
+        xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
+
+        write_protection_region((const pr_t*)(&xen_mpumap[idx]), idx);
+    }
+
+    return 0;
+}
+
+/*
+ * It is equivalent to xen_pt_update in MMU system.
+ * base refers to inclusive address and limit refers to exclusive address.
+ */
+int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
+{
+    int rc;
+
+    if ( flags_has_rwx(flags) )
+    {
+        region_printk("Mappings should not be both Writeable and Executable\n");
+        return -EINVAL;
+    }
+
+    if ( !IS_ALIGNED(base, PAGE_SIZE) || !IS_ALIGNED(limit, PAGE_SIZE) )
+    {
+        region_printk("base address 0x%"PRIpaddr", or limit address 0x%"PRIpaddr" is not page aligned\n",
+                      base, limit);
+        return -EINVAL;
+    }
+
+    spin_lock(&xen_mpumap_lock);
+
+    rc = xen_mpumap_update_entry(base, limit, flags);
+
+    spin_unlock(&xen_mpumap_lock);
+
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


