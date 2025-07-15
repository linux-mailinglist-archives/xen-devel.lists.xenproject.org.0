Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926E9B05393
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:46:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043600.1413610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaMS-0003hy-IW; Tue, 15 Jul 2025 07:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043600.1413610; Tue, 15 Jul 2025 07:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaMS-0003eR-Ei; Tue, 15 Jul 2025 07:46:00 +0000
Received: by outflank-mailman (input) for mailman id 1043600;
 Tue, 15 Jul 2025 07:45:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCR=Z4=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1ubaMQ-0003TX-NG
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:45:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id bdfd8f2c-614f-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 09:45:56 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D9AB12FC;
 Tue, 15 Jul 2025 00:45:47 -0700 (PDT)
Received: from PWQ0QT7DJ1.emea.arm.com (PWQ0QT7DJ1.cambridge.arm.com
 [10.1.25.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A75493F66E;
 Tue, 15 Jul 2025 00:45:54 -0700 (PDT)
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
X-Inumbo-ID: bdfd8f2c-614f-11f0-b894-0df219b8e170
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 4/6] arm/mpu: Destroy an existing entry in Xen MPU memory mapping table
Date: Tue, 15 Jul 2025 08:45:26 +0100
Message-ID: <cd3a8bdf3e18af688426a83f873654210f449e47.1752565274.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1752565274.git.hari.limaye@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

This commit expands xen_mpumap_update/xen_mpumap_update_entry to include
destroying an existing entry.

We define a new helper "disable_mpu_region_from_index" to disable the MPU
region based on index. If region is within [0, 31], we could quickly
disable the MPU region through PRENR_EL2 which provides direct access to the
PRLAR_EL2.EN bits of EL2 MPU regions.

Rignt now, we only support destroying a *WHOLE* MPU memory region,
part-region removing is not supported, as in worst case, it will
leave two fragments behind.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
---
Changes from v1:
- Move check for part-region removal outside if condition
- Use normal printk

Changes from v2:
- Fix assert from `ASSERT(s <= e)` -> `ASSERT(s < e)`
- Remove call to context_sync_mpu
- Use register_t
- Improve sanity checking to catch modification & removing non-existent
  entries
- Update check for MPUMAP_REGION_INCLUSIVE to be generic
---
 xen/arch/arm/include/asm/mpu.h        |  2 +
 xen/arch/arm/include/asm/mpu/cpregs.h |  4 ++
 xen/arch/arm/mpu/mm.c                 | 92 ++++++++++++++++++++++++---
 3 files changed, 89 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 63560c613b..5053edaf63 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -23,6 +23,8 @@
 #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
 #define MAX_MPU_REGION_NR       NUM_MPU_REGIONS_MASK
 
+#define PRENR_MASK  GENMASK(31, 0)
+
 #ifndef __ASSEMBLY__
 
 /*
diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
index bb15e02df6..9f3b32acd7 100644
--- a/xen/arch/arm/include/asm/mpu/cpregs.h
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -6,6 +6,9 @@
 /* CP15 CR0: MPU Type Register */
 #define HMPUIR          p15,4,c0,c0,4
 
+/* CP15 CR6: Protection Region Enable Register */
+#define HPRENR          p15,4,c6,c1,1
+
 /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
 #define HPRSELR         p15,4,c6,c2,1
 #define HPRBAR          p15,4,c6,c3,0
@@ -82,6 +85,7 @@
 /* Alphabetically... */
 #define MPUIR_EL2       HMPUIR
 #define PRBAR_EL2       HPRBAR
+#define PRENR_EL2       HPRENR
 #define PRLAR_EL2       HPRLAR
 #define PRSELR_EL2      HPRSELR
 #endif /* CONFIG_ARM_32 */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index d5426525af..a5b1c95793 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -189,6 +189,42 @@ static int xen_mpumap_alloc_entry(uint8_t *idx)
     return 0;
 }
 
+/*
+ * Disable and remove an MPU region from the data structure and MPU registers.
+ *
+ * @param index Index of the MPU region to be disabled.
+ */
+static void disable_mpu_region_from_index(uint8_t index)
+{
+    ASSERT(spin_is_locked(&xen_mpumap_lock));
+    ASSERT(index != INVALID_REGION_IDX);
+
+    if ( !region_is_valid(&xen_mpumap[index]) )
+    {
+        printk(XENLOG_WARNING
+               "mpu: MPU memory region[%u] is already disabled\n", index);
+        return;
+    }
+
+    /* Zeroing the region will also zero the region enable */
+    memset(&xen_mpumap[index], 0, sizeof(pr_t));
+    clear_bit(index, xen_mpumap_mask);
+
+    /*
+     * Both Armv8-R AArch64 and AArch32 have direct access to the enable bit for
+     * MPU regions numbered from 0 to 31.
+     */
+    if ( (index & PRENR_MASK) != 0 )
+    {
+        /* Clear respective bit */
+        register_t val = READ_SYSREG(PRENR_EL2) & (~(1UL << index));
+
+        WRITE_SYSREG(val, PRENR_EL2);
+    }
+    else
+        write_protection_region(&xen_mpumap[index], index);
+}
+
 /*
  * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
  * given memory range and flags, creating one if none exists.
@@ -206,22 +242,51 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
 
     ASSERT(spin_is_locked(&xen_mpumap_lock));
 
-    /* Currently only region creation is supported. */
-    if ( !(flags & _PAGE_PRESENT) )
+    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, base, limit, &idx);
+    if ( rc < 0 )
         return -EINVAL;
 
-    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, base, limit, &idx);
-    if ( rc != MPUMAP_REGION_NOTFOUND )
+    /*
+     * Currently, we only support removing/modifying a *WHOLE* MPU memory
+     * region. Part-region removal/modification is not supported as in the worst
+     * case it will leave two/three fragments behind.
+     */
+    if ( rc == MPUMAP_REGION_INCLUSIVE )
+    {
+        printk("mpu: part-region removal/modification is not supported\n");
         return -EINVAL;
+    }
+
+    /* Currently we don't support modifying an existing entry. */
+    if ( (flags & _PAGE_PRESENT) && (rc >= MPUMAP_REGION_FOUND) )
+    {
+        printk("mpu: modifying an existing entry is not supported\n");
+        return -EINVAL;
+    }
 
     /* We are inserting a mapping => Create new region. */
-    rc = xen_mpumap_alloc_entry(&idx);
-    if ( rc )
-        return -ENOENT;
+    if ( (flags & _PAGE_PRESENT) && (MPUMAP_REGION_NOTFOUND == rc) )
+    {
+        rc = xen_mpumap_alloc_entry(&idx);
+        if ( rc )
+            return -ENOENT;
 
-    xen_mpumap[idx] = pr_of_addr(base, limit, flags);
+        xen_mpumap[idx] = pr_of_addr(base, limit, flags);
 
-    write_protection_region(&xen_mpumap[idx], idx);
+        write_protection_region(&xen_mpumap[idx], idx);
+    }
+
+    /* Removing a mapping */
+    if ( !(flags & _PAGE_PRESENT) )
+    {
+        if ( rc == MPUMAP_REGION_NOTFOUND )
+        {
+            printk("mpu: cannot remove an entry that does not exist\n");
+            return -EINVAL;
+        }
+
+        disable_mpu_region_from_index(idx);
+    }
 
     return 0;
 }
@@ -261,6 +326,15 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
     return rc;
 }
 
+int destroy_xen_mappings(unsigned long s, unsigned long e)
+{
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
+    ASSERT(s < e);
+
+    return xen_mpumap_update(virt_to_maddr(s), virt_to_maddr(e), 0);
+}
+
 int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
                      unsigned int flags)
 {
-- 
2.34.1


