Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629FEAF5AC8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:14:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031206.1404984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyEH-000084-Ah; Wed, 02 Jul 2025 14:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031206.1404984; Wed, 02 Jul 2025 14:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyEH-0008WA-6c; Wed, 02 Jul 2025 14:14:29 +0000
Received: by outflank-mailman (input) for mailman id 1031206;
 Wed, 02 Jul 2025 14:14:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WqgU=ZP=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uWyEE-0007Ob-S6
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:14:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id dbed749b-574e-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 16:14:26 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9166B22C7;
 Wed,  2 Jul 2025 07:14:10 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.65.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D6E233F6A8;
 Wed,  2 Jul 2025 07:14:23 -0700 (PDT)
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
X-Inumbo-ID: dbed749b-574e-11f0-a313-13f23c93f187
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
Subject: [PATCH v2 4/6] arm/mpu: Destroy an existing entry in Xen MPU memory mapping table
Date: Wed,  2 Jul 2025 15:13:59 +0100
Message-ID: <b3ed60f28d7234f4091196d7bdab8c9ae12ea6d0.1751464757.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1751464757.git.hari.limaye@arm.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
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
---
 xen/arch/arm/include/asm/mpu.h        |  2 +
 xen/arch/arm/include/asm/mpu/cpregs.h |  4 ++
 xen/arch/arm/mpu/mm.c                 | 69 ++++++++++++++++++++++++++-
 3 files changed, 73 insertions(+), 2 deletions(-)

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
index dd54b66901..2e88c467d5 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -185,6 +185,42 @@ static int xen_mpumap_alloc_entry(uint8_t *idx)
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
+        uint64_t val = READ_SYSREG(PRENR_EL2) & (~(1UL << index));
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
@@ -203,11 +239,11 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
     ASSERT(spin_is_locked(&xen_mpumap_lock));
 
     rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, base, limit, &idx);
-    if ( !(rc == MPUMAP_REGION_NOTFOUND) )
+    if ( rc < 0 )
         return -EINVAL;
 
     /* We are inserting a mapping => Create new region. */
-    if ( flags & _PAGE_PRESENT )
+    if ( (flags & _PAGE_PRESENT) && (MPUMAP_REGION_NOTFOUND == rc) )
     {
         rc = xen_mpumap_alloc_entry(&idx);
         if ( rc )
@@ -218,6 +254,20 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
         write_protection_region(&xen_mpumap[idx], idx);
     }
 
+    /*
+     * Currently, we only support destroying a *WHOLE* MPU memory region.
+     * Part-region removal is not supported as in the worst case it will leave
+     * two fragments behind.
+     */
+    if ( rc == MPUMAP_REGION_INCLUSIVE )
+    {
+        printk("mpu: part-region removal is not supported\n");
+        return -EINVAL;
+    }
+
+    if ( !(flags & _PAGE_PRESENT) && (rc >= MPUMAP_REGION_FOUND) )
+        disable_mpu_region_from_index(idx);
+
     return 0;
 }
 
@@ -251,6 +301,21 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
     return rc;
 }
 
+int destroy_xen_mappings(unsigned long s, unsigned long e)
+{
+    int rc;
+
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
+    ASSERT(s <= e);
+
+    rc = xen_mpumap_update(virt_to_maddr(s), virt_to_maddr(e), 0);
+    if ( !rc )
+        context_sync_mpu();
+
+    return rc;
+}
+
 int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
                      unsigned int flags)
 {
-- 
2.34.1


