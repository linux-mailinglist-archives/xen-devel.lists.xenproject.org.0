Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1587B668B81
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476605.738984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjZ-0003Qn-LU; Fri, 13 Jan 2023 05:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476605.738984; Fri, 13 Jan 2023 05:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjZ-0003N8-Ff; Fri, 13 Jan 2023 05:36:09 +0000
Received: by outflank-mailman (input) for mailman id 476605;
 Fri, 13 Jan 2023 05:36:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCeZ-0005sJ-DT
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 754da6db-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:30:58 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB5B413D5;
 Thu, 12 Jan 2023 21:31:39 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2914E3F587;
 Thu, 12 Jan 2023 21:30:54 -0800 (PST)
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
X-Inumbo-ID: 754da6db-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 26/40] xen/mpu: destroy an existing entry in Xen MPU memory mapping table
Date: Fri, 13 Jan 2023 13:28:59 +0800
Message-Id: <20230113052914.3845596-27-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit expands xen_mpumap_update/xen_mpumap_update_entry to include
destroying an existing entry.

We define a new helper "control_xen_mpumap_region_from_index" to enable/disable
the MPU region based on index. If region is within [0, 31], we could quickly
disable the MPU region through PRENR_EL2 which provides direct access to the
PRLAR_EL2.EN bits of EL2 MPU regions.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/include/asm/arm64/mpu.h     | 20 ++++++
 xen/arch/arm/include/asm/arm64/sysregs.h |  3 +
 xen/arch/arm/mm_mpu.c                    | 77 ++++++++++++++++++++++--
 3 files changed, 95 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index 0044bbf05d..c1dea1c8e9 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -16,6 +16,8 @@
  */
 #define ARM_MAX_MPU_MEMORY_REGIONS 255
 
+#define MPU_PRENR_BITS    32
+
 /* Access permission attributes. */
 /* Read/Write at EL2, No Access at EL1/EL0. */
 #define AP_RW_EL2 0x0
@@ -132,6 +134,24 @@ typedef struct {
     _pr->prlar.reg.en;                                      \
 })
 
+/*
+ * Access to get base address of MPU protection region(pr_t).
+ * The base address shall be zero extended.
+ */
+#define pr_get_base(pr) ({                                  \
+    pr_t *_pr = pr;                                         \
+    (uint64_t)_pr->prbar.reg.base << MPU_REGION_SHIFT;      \
+})
+
+/*
+ * Access to get limit address of MPU protection region(pr_t).
+ * The limit address shall be concatenated with 0x3f.
+ */
+#define pr_get_limit(pr) ({                                        \
+    pr_t *_pr = pr;                                                \
+    (uint64_t)((_pr->prlar.reg.limit << MPU_REGION_SHIFT) | 0x3f); \
+})
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ARM64_MPU_H__ */
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index aca9bca5b1..c46daf6f69 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -505,6 +505,9 @@
 /* MPU Type registers encode */
 #define MPUIR_EL2 S3_4_C0_C0_4
 
+/* MPU Protection Region Enable Register encode */
+#define PRENR_EL2 S3_4_C6_C1_1
+
 #endif
 
 /* Access to system registers */
diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index d2e19e836c..3a0d110b13 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -385,6 +385,45 @@ static int mpumap_contain_region(pr_t *mpu, uint64_t nr_regions,
     return MPUMAP_REGION_FAILED;
 }
 
+/* Disable or enable EL2 MPU memory region at index #index */
+static void control_mpu_region_from_index(uint64_t index, bool enable)
+{
+    pr_t region;
+
+    access_protection_region(true, &region, NULL, index);
+    if ( (region_is_valid(&region) && enable) ||
+         (!region_is_valid(&region) && !enable) )
+    {
+        printk(XENLOG_WARNING
+               "mpu: MPU memory region[%lu] is already %s\n", index,
+               enable ? "enabled" : "disabled");
+        return;
+    }
+
+    /*
+     * ARM64v8R provides PRENR_EL2 to have direct access to the
+     * PRLAR_EL2.EN bits of EL2 MPU regions from 0 to 31.
+     */
+    if ( index < MPU_PRENR_BITS )
+    {
+        uint64_t orig, after;
+
+        orig = READ_SYSREG(PRENR_EL2);
+        if ( enable )
+            /* Set respective bit */
+            after = orig | (1UL << index);
+        else
+            /* Clear respective bit */
+            after = orig & (~(1UL << index));
+        WRITE_SYSREG(after, PRENR_EL2);
+    }
+    else
+    {
+        region.prlar.reg.en = enable ? 1 : 0;
+        access_protection_region(false, NULL, (const pr_t*)&region, index);
+    }
+}
+
 /*
  * Update an entry at the index @idx.
  * @base:  base address
@@ -449,6 +488,30 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
         if ( system_state <= SYS_STATE_active )
             update_boot_xen_mpumap_idx(idx);
     }
+    else
+    {
+        /*
+         * Currently, we only support destroying a *WHOLE* MPU memory region,
+         * part-region removing is not supported, as in worst case, it will
+         * lead to two fragments in result after destroying.
+         * part-region removing will be introduced only when actual usage
+         * comes.
+         */
+        if ( rc == MPUMAP_REGION_INCLUSIVE )
+        {
+            region_printk("mpu: part-region removing is not supported\n");
+            return -EINVAL;
+        }
+
+        /* We are removing the region */
+        if ( rc != MPUMAP_REGION_FOUND )
+            return -EINVAL;
+
+        control_mpu_region_from_index(idx, false);
+
+        /* Clear the according MPU memory region entry.*/
+        memset(&xen_mpumap[idx], 0, sizeof(pr_t));
+    }
 
     return 0;
 }
@@ -589,6 +652,15 @@ static void __init map_mpu_memory_section_on_boot(enum mpu_section_info type,
     }
 }
 
+int destroy_xen_mappings(unsigned long s, unsigned long e)
+{
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
+    ASSERT(s <= e);
+
+    return xen_mpumap_update(s, e, 0);
+}
+
 /*
  * System RAM is statically partitioned into different functionality
  * section in Device Tree, including static xenheap, guest memory
@@ -656,11 +728,6 @@ void *ioremap(paddr_t pa, size_t len)
     return NULL;
 }
 
-int destroy_xen_mappings(unsigned long s, unsigned long e)
-{
-    return -ENOSYS;
-}
-
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
 {
     return -ENOSYS;
-- 
2.25.1


