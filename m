Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C687AF5AC5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:14:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031203.1404964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyEC-0007wX-Nm; Wed, 02 Jul 2025 14:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031203.1404964; Wed, 02 Jul 2025 14:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyEC-0007vg-GV; Wed, 02 Jul 2025 14:14:24 +0000
Received: by outflank-mailman (input) for mailman id 1031203;
 Wed, 02 Jul 2025 14:14:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WqgU=ZP=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uWyEB-0007en-1n
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:14:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d6e9efb0-574e-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 16:14:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25E2B22C7;
 Wed,  2 Jul 2025 07:14:02 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.65.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6A183F6A8;
 Wed,  2 Jul 2025 07:14:15 -0700 (PDT)
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
X-Inumbo-ID: d6e9efb0-574e-11f0-b894-0df219b8e170
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/6] arm/mpu: Find MPU region by range
Date: Wed,  2 Jul 2025 15:13:56 +0100
Message-ID: <a78ce013dcf68a79955653751953e023af112849.1751464757.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1751464757.git.hari.limaye@arm.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

Implement a function to find the index of a MPU region in the xen_mpumap
MPU region array. This function will be used in future commits to
implement creating and destroying MPU regions.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
---
Changes from v1:
- Update commit message
- Remove internal _index variable
- Simplify logic by disallowing NULL index parameter
- Use normal printk
- Reorder conditional checks
- Update some comments
---
 xen/arch/arm/include/asm/mpu/mm.h | 29 +++++++++++++++++
 xen/arch/arm/mpu/mm.c             | 52 +++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index a7f970b465..81e47b9d0b 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -10,6 +10,13 @@
 #include <asm/mm.h>
 #include <asm/mpu.h>
 
+#define MPUMAP_REGION_OVERLAP      -1
+#define MPUMAP_REGION_NOTFOUND      0
+#define MPUMAP_REGION_FOUND         1
+#define MPUMAP_REGION_INCLUSIVE     2
+
+#define INVALID_REGION_IDX     0xFFU
+
 extern struct page_info *frame_table;
 
 extern uint8_t max_mpu_regions;
@@ -75,6 +82,28 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel);
  */
 pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
 
+/*
+ * Checks whether a given memory range is present in the provided table of
+ * MPU protection regions.
+ *
+ * @param table         Array of pr_t protection regions.
+ * @param r_regions     Number of elements in `table`.
+ * @param base          Start of the memory region to be checked (inclusive).
+ * @param limit         End of the memory region to be checked (exclusive).
+ * @param index         Set to the index of the region if an exact or inclusive
+ *                      match is found, and INVALID_REGION otherwise.
+ * @return: Return code indicating the result of the search:
+ *          MPUMAP_REGION_NOTFOUND: no part of the range is present in `table`
+ *          MPUMAP_REGION_FOUND: found an exact match in `table`
+ *          MPUMAP_REGION_INCLUSIVE: found an inclusive match in `table`
+ *          MPUMAP_REGION_OVERLAP: found an overlap with a mapping in `table`
+ *
+ * Note: make sure that the range [`base`, `limit`) refers to the memory region
+ * inclusive of `base` and exclusive of `limit`.
+ */
+int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
+                          paddr_t limit, uint8_t *index);
+
 #endif /* __ARM_MPU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index ccfb37a67b..25e7f36c1e 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -110,6 +110,58 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
     return region;
 }
 
+int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
+                          paddr_t limit, uint8_t *index)
+{
+    ASSERT(index);
+    *index = INVALID_REGION_IDX;
+
+    /* Convert [base, limit) to [base, limit - 1] for inclusive comparison */
+    limit = limit - 1;
+
+    if ( limit < base )
+    {
+        printk("Base address %#"PRIpaddr" must be smaller than limit address %#"PRIpaddr"\n",
+               base, limit);
+        return -EINVAL;
+    }
+
+    for (uint8_t i = 0; i < nr_regions; i++ )
+    {
+        paddr_t iter_base = pr_get_base(&table[i]);
+        paddr_t iter_limit = pr_get_limit(&table[i]);
+
+        /* Skip invalid (disabled) regions */
+        if ( !region_is_valid(&table[i]) )
+            continue;
+
+        /* No match */
+        if ( (iter_limit < base) || (iter_base > limit) )
+            continue;
+
+        /* Exact match */
+        if ( (iter_base == base) && (iter_limit == limit) )
+        {
+            *index = i;
+            return MPUMAP_REGION_FOUND;
+        }
+
+        /* Inclusive match */
+        if ( (base >= iter_base) && (limit <= iter_limit) )
+        {
+            *index = i;
+            return MPUMAP_REGION_INCLUSIVE;
+        }
+
+        /* Overlap */
+        printk("Range %#"PRIpaddr" - %#"PRIpaddr" overlaps with the existing region %#"PRIpaddr" - %#"PRIpaddr"\n",
+               base, limit + 1, iter_base, iter_limit + 1);
+        return MPUMAP_REGION_OVERLAP;
+    }
+
+    return MPUMAP_REGION_NOTFOUND;
+}
+
 void __init setup_mm(void)
 {
     BUG_ON("unimplemented");
-- 
2.34.1


