Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B98B0538F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043596.1413579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaMH-0002hV-Mf; Tue, 15 Jul 2025 07:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043596.1413579; Tue, 15 Jul 2025 07:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaMH-0002gD-JF; Tue, 15 Jul 2025 07:45:49 +0000
Received: by outflank-mailman (input) for mailman id 1043596;
 Tue, 15 Jul 2025 07:45:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCR=Z4=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1ubaMF-0002PZ-L5
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:45:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b802aa1e-614f-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 09:45:46 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64FD512FC;
 Tue, 15 Jul 2025 00:45:37 -0700 (PDT)
Received: from PWQ0QT7DJ1.emea.arm.com (PWQ0QT7DJ1.cambridge.arm.com
 [10.1.25.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 05AE43F66E;
 Tue, 15 Jul 2025 00:45:44 -0700 (PDT)
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
X-Inumbo-ID: b802aa1e-614f-11f0-a319-13f23c93f187
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 1/6] arm/mpu: Find MPU region by range
Date: Tue, 15 Jul 2025 08:45:23 +0100
Message-ID: <3da52fda916ad2487ede9b193143d06debdcfc88.1752565274.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1752565274.git.hari.limaye@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
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

Changes from v2:
- Replace conditional with assert
- Improve comments regarding base and limit
- Space between ( and uint8_t.
---
 xen/arch/arm/include/asm/mpu/mm.h | 29 ++++++++++++++++
 xen/arch/arm/mpu/mm.c             | 55 +++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index a7f970b465..5a2b9b498b 100644
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
+                           paddr_t limit, uint8_t *index);
+
 #endif /* __ARM_MPU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index ccfb37a67b..407264a88c 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -110,6 +110,61 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
     return region;
 }
 
+int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
+                           paddr_t limit, uint8_t *index)
+{
+    ASSERT(index);
+    *index = INVALID_REGION_IDX;
+
+    /*
+     * The caller supplies a half-open interval [base, limit), i.e. limit is the
+     * first byte *after* the region. Require limit strictly greater than base,
+     * which is necessarily a non-empty region.
+     */
+    ASSERT(base < limit);
+
+    /*
+     * Internally we use inclusive bounds, so convert range to [base, limit-1].
+     * The prior assertion guarantees the subtraction will not underflow.
+     */
+    limit = limit - 1;
+
+    for ( uint8_t i = 0; i < nr_regions; i++ )
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


