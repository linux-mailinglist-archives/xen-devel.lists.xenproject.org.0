Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE0B0BEEF
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jul 2025 10:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051151.1419453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udlwi-0006Ta-0n; Mon, 21 Jul 2025 08:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051151.1419453; Mon, 21 Jul 2025 08:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1udlwh-0006S5-Tm; Mon, 21 Jul 2025 08:32:27 +0000
Received: by outflank-mailman (input) for mailman id 1051151;
 Mon, 21 Jul 2025 08:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1oiY=2C=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1udlwh-0005OI-1w
 for xen-devel@lists.xenproject.org; Mon, 21 Jul 2025 08:32:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3a7f46fb-660d-11f0-b894-0df219b8e170;
 Mon, 21 Jul 2025 10:32:25 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4EE4153B;
 Mon, 21 Jul 2025 01:32:18 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.71.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6F333F66E;
 Mon, 21 Jul 2025 01:32:22 -0700 (PDT)
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
X-Inumbo-ID: 3a7f46fb-660d-11f0-b894-0df219b8e170
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
Subject: [PATCH v4 3/6] arm/mpu: Populate a new region in Xen MPU mapping table
Date: Mon, 21 Jul 2025 09:31:44 +0100
Message-ID: <740a990a7579a53f69bb2b27b55a74093fd52d7e.1753084737.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1753084737.git.hari.limaye@arm.com>
References: <cover.1753084737.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

Introduce map_pages_to_xen() that is implemented using a new helper,
xen_mpumap_update(), which is responsible for updating Xen MPU memory
mapping table(xen_mpumap), including creating a new entry, updating
or destroying an existing one, it is equivalent to xen_pt_update in MMU.

This commit only implements populating a new entry in Xen MPU memory mapping
table(xen_mpumap).

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from v1:
- Simplify if condition
- Use normal printk
- Use %# over 0x%
- Add same asserts as in Patch 4

Changes from v2:
- Improve clarity in xen_mpumap_alloc_entry comment
- Simplify if condition
- Remove redundant ASSERT statements
- Add check for `base >= limit`
- Pass virt directly in map_pages_to_xen
- Move call to `context_sync_mpu` inside locked section of `xen_mpumap_update`
- Move _PAGE_PRESENT check before calling `mpumap_contains_region`

Changes from v3:
- Add Michal's R-b
---
 xen/arch/arm/include/asm/mpu/mm.h |  12 ++++
 xen/arch/arm/mpu/mm.c             | 103 ++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+)

diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 5a2b9b498b..c32fac8905 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -64,6 +64,7 @@ static inline void context_sync_mpu(void)
  * The following API requires context_sync_mpu() after being used to modify MPU
  * regions:
  *  - write_protection_region
+ *  - xen_mpumap_update
  */
 
 /* Reads the MPU region (into @pr_read) with index @sel from the HW */
@@ -72,6 +73,17 @@ void read_protection_region(pr_t *pr_read, uint8_t sel);
 /* Writes the MPU region (from @pr_write) with index @sel to the HW */
 void write_protection_region(const pr_t *pr_write, uint8_t sel);
 
+/*
+ * Maps an address range into the MPU data structure and updates the HW.
+ * Equivalent to xen_pt_update in an MMU system.
+ *
+ * @param base      Base address of the range to map (inclusive).
+ * @param limit     Limit address of the range to map (exclusive).
+ * @param flags     Flags for the memory range to map.
+ * @return          0 on success, negative on error.
+ */
+int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
+
 /*
  * Creates a pr_t structure describing a protection region.
  *
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 407264a88c..d5426525af 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -6,6 +6,7 @@
 #include <xen/lib.h>
 #include <xen/mm.h>
 #include <xen/sizes.h>
+#include <xen/spinlock.h>
 #include <xen/types.h>
 #include <asm/mpu.h>
 #include <asm/mpu/mm.h>
@@ -29,6 +30,8 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
 /* EL2 Xen MPU memory region mapping table. */
 pr_t __cacheline_aligned __section(".data") xen_mpumap[MAX_MPU_REGION_NR];
 
+static DEFINE_SPINLOCK(xen_mpumap_lock);
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
@@ -165,6 +168,106 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
     return MPUMAP_REGION_NOTFOUND;
 }
 
+/*
+ * Allocate an entry for a new EL2 MPU region in the bitmap xen_mpumap_mask.
+ * @param idx   Set to the index of the allocated EL2 MPU region on success.
+ * @return      0 on success, otherwise -ENOENT on failure.
+ */
+static int xen_mpumap_alloc_entry(uint8_t *idx)
+{
+    ASSERT(spin_is_locked(&xen_mpumap_lock));
+
+    *idx = find_first_zero_bit(xen_mpumap_mask, max_mpu_regions);
+    if ( *idx == max_mpu_regions )
+    {
+        printk(XENLOG_ERR "mpu: EL2 MPU memory region mapping pool exhausted\n");
+        return -ENOENT;
+    }
+
+    set_bit(*idx, xen_mpumap_mask);
+
+    return 0;
+}
+
+/*
+ * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
+ * given memory range and flags, creating one if none exists.
+ *
+ * @param base  Base address (inclusive).
+ * @param limit Limit address (exclusive).
+ * @param flags Region attributes (a combination of PAGE_HYPERVISOR_XXX)
+ * @return      0 on success, otherwise negative on error.
+ */
+static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
+                                   unsigned int flags)
+{
+    uint8_t idx;
+    int rc;
+
+    ASSERT(spin_is_locked(&xen_mpumap_lock));
+
+    /* Currently only region creation is supported. */
+    if ( !(flags & _PAGE_PRESENT) )
+        return -EINVAL;
+
+    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, base, limit, &idx);
+    if ( rc != MPUMAP_REGION_NOTFOUND )
+        return -EINVAL;
+
+    /* We are inserting a mapping => Create new region. */
+    rc = xen_mpumap_alloc_entry(&idx);
+    if ( rc )
+        return -ENOENT;
+
+    xen_mpumap[idx] = pr_of_addr(base, limit, flags);
+
+    write_protection_region(&xen_mpumap[idx], idx);
+
+    return 0;
+}
+
+int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
+{
+    int rc;
+
+    if ( flags_has_rwx(flags) )
+    {
+        printk("Mappings should not be both Writeable and Executable\n");
+        return -EINVAL;
+    }
+
+    if ( base >= limit )
+    {
+        printk("Base address %#"PRIpaddr" must be smaller than limit address %#"PRIpaddr"\n",
+               base, limit);
+        return -EINVAL;
+    }
+
+    if ( !IS_ALIGNED(base, PAGE_SIZE) || !IS_ALIGNED(limit, PAGE_SIZE) )
+    {
+        printk("base address %#"PRIpaddr", or limit address %#"PRIpaddr" is not page aligned\n",
+               base, limit);
+        return -EINVAL;
+    }
+
+    spin_lock(&xen_mpumap_lock);
+
+    rc = xen_mpumap_update_entry(base, limit, flags);
+    if ( !rc )
+        context_sync_mpu();
+
+    spin_unlock(&xen_mpumap_lock);
+
+    return rc;
+}
+
+int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
+                     unsigned int flags)
+{
+    /* MPU systems have no translation, ma == va, so pass virt directly */
+    return xen_mpumap_update(virt, mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
+}
+
 void __init setup_mm(void)
 {
     BUG_ON("unimplemented");
-- 
2.34.1


