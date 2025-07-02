Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CF6AF5AC7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:14:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031204.1404973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyED-0008Dd-RJ; Wed, 02 Jul 2025 14:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031204.1404973; Wed, 02 Jul 2025 14:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyED-0008Bl-Nz; Wed, 02 Jul 2025 14:14:25 +0000
Received: by outflank-mailman (input) for mailman id 1031204;
 Wed, 02 Jul 2025 14:14:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WqgU=ZP=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1uWyEC-0007Ob-BA
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:14:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id da64d48e-574e-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 16:14:23 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E541122C7;
 Wed,  2 Jul 2025 07:14:07 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.65.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36FF73F6A8;
 Wed,  2 Jul 2025 07:14:21 -0700 (PDT)
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
X-Inumbo-ID: da64d48e-574e-11f0-a313-13f23c93f187
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
Subject: [PATCH v2 3/6] arm/mpu: Populate a new region in Xen MPU mapping table
Date: Wed,  2 Jul 2025 15:13:58 +0100
Message-ID: <5b67459af62106197fb551d35ef1708f0bb5beb6.1751464757.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1751464757.git.hari.limaye@arm.com>
References: <cover.1751464757.git.hari.limaye@arm.com>
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
---
Changes from v1:
- Simplify if condition
- Use normal printk
- Use %# over 0x%
- Add same asserts as in Patch 4
---
 xen/arch/arm/include/asm/mpu/mm.h |  12 ++++
 xen/arch/arm/mpu/mm.c             | 100 ++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 81e47b9d0b..101002f7d4 100644
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
index 25e7f36c1e..dd54b66901 100644
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
@@ -162,6 +165,103 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
     return MPUMAP_REGION_NOTFOUND;
 }
 
+/*
+ * Allocate a new free EL2 MPU memory region, based on bitmap xen_mpumap_mask.
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
+    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, base, limit, &idx);
+    if ( !(rc == MPUMAP_REGION_NOTFOUND) )
+        return -EINVAL;
+
+    /* We are inserting a mapping => Create new region. */
+    if ( flags & _PAGE_PRESENT )
+    {
+        rc = xen_mpumap_alloc_entry(&idx);
+        if ( rc )
+            return -ENOENT;
+
+        xen_mpumap[idx] = pr_of_addr(base, limit, flags);
+
+        write_protection_region(&xen_mpumap[idx], idx);
+    }
+
+    return 0;
+}
+
+int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
+{
+    int rc;
+
+    ASSERT(IS_ALIGNED(base, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(limit, PAGE_SIZE));
+    ASSERT(base <= limit);
+
+    if ( flags_has_rwx(flags) )
+    {
+        printk("Mappings should not be both Writeable and Executable\n");
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
+
+    spin_unlock(&xen_mpumap_lock);
+
+    return rc;
+}
+
+int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
+                     unsigned int flags)
+{
+    int rc = xen_mpumap_update(mfn_to_maddr(mfn),
+                               mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
+    if ( !rc )
+        context_sync_mpu();
+
+    return rc;
+}
+
 void __init setup_mm(void)
 {
     BUG_ON("unimplemented");
-- 
2.34.1


