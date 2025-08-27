Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1A0B387E0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 18:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096545.1451230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urJD9-0006JU-JZ; Wed, 27 Aug 2025 16:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096545.1451230; Wed, 27 Aug 2025 16:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urJD9-0006Fn-FH; Wed, 27 Aug 2025 16:41:23 +0000
Received: by outflank-mailman (input) for mailman id 1096545;
 Wed, 27 Aug 2025 16:41:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mrvt=3H=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1urJD7-0004w3-VK
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 16:41:21 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a7aa3404-8364-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 18:41:18 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 787E32720;
 Wed, 27 Aug 2025 09:41:09 -0700 (PDT)
Received: from PWQ0QT7DJ1.arm.com (unknown [10.57.64.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8301A3F738;
 Wed, 27 Aug 2025 09:41:16 -0700 (PDT)
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
X-Inumbo-ID: a7aa3404-8364-11f0-ae26-e363de0e7a9e
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/5] arm/mpu: Implement ioremap_attr for MPU
Date: Wed, 27 Aug 2025 17:35:12 +0100
Message-ID: <d2287756e1cd2e7f1cf4ac1bc5de775840c0b0ce.1756312498.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1756312498.git.hari.limaye@arm.com>
References: <cover.1756312498.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

Introduce helpers (un)map_mm_range() in order to allow the transient
mapping of a range of memory, and use these to implement the function
`ioremap_attr` for MPU systems.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
---
Changes from v1:
- Use transient instead of temporary, and improve wording of comments
  regarding transient mapping
- Rename start, end -> base, limit
---
 xen/arch/arm/include/asm/mpu/mm.h |  22 +++++
 xen/arch/arm/mpu/mm.c             | 150 ++++++++++++++++++++++++++++--
 2 files changed, 163 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 566d338986..efb0680e39 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -101,6 +101,28 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
  */
 pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
 
+/*
+ * Maps transiently a range of memory with attributes `flags`; if the range is
+ * already mapped with the same attributes, including an inclusive match, the
+ * existing mapping is returned. This API is intended for mappings that exist
+ * transiently for a short period between calls to this function and
+ * `unmap_mm_range`.
+ *
+ * @param base      Base address of the range to map (inclusive).
+ * @param limit     Limit address of the range to map (exclusive).
+ * @param flags     Flags for the memory range to map.
+ * @return          Pointer to base of region on success, NULL on error.
+ */
+void *map_mm_range(paddr_t base, paddr_t limit, unsigned int flags);
+
+/*
+ * Unmaps a range of memory if it was previously mapped by map_mm_range,
+ * otherwise it does not remove the mapping.
+ *
+ * @param base     Base address of the range to map (inclusive).
+ */
+void unmap_mm_range(paddr_t base);
+
 /*
  * Checks whether a given memory range is present in the provided table of
  * MPU protection regions.
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 33333181d5..52c4c43827 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -332,31 +332,39 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
     return 0;
 }
 
-int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
-                      bool transient)
+static bool check_mpu_mapping(paddr_t base, paddr_t limit, unsigned int flags)
 {
-    int rc;
-
     if ( flags_has_rwx(flags) )
     {
         printk("Mappings should not be both Writeable and Executable\n");
-        return -EINVAL;
+        return false;
     }
 
     if ( base >= limit )
     {
         printk("Base address %#"PRIpaddr" must be smaller than limit address %#"PRIpaddr"\n",
                base, limit);
-        return -EINVAL;
+        return false;
     }
 
     if ( !IS_ALIGNED(base, PAGE_SIZE) || !IS_ALIGNED(limit, PAGE_SIZE) )
     {
         printk("base address %#"PRIpaddr", or limit address %#"PRIpaddr" is not page aligned\n",
                base, limit);
-        return -EINVAL;
+        return false;
     }
 
+    return true;
+}
+
+int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags,
+                      bool transient)
+{
+    int rc;
+
+    if ( !check_mpu_mapping(base, limit, flags) )
+        return -EINVAL;
+
     spin_lock(&xen_mpumap_lock);
 
     rc = xen_mpumap_update_entry(base, limit, flags, transient);
@@ -465,10 +473,134 @@ void free_init_memory(void)
     BUG_ON("unimplemented");
 }
 
+static uint8_t is_mm_range_mapped(paddr_t start, paddr_t end)
+{
+    int rc;
+    uint8_t idx;
+
+    ASSERT(spin_is_locked(&xen_mpumap_lock));
+
+    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, start, end, &idx);
+    if ( rc < 0 )
+         panic("Cannot handle overlapping MPU memory protection regions\n");
+
+    /*
+     * 'idx' will be INVALID_REGION_IDX for rc == MPUMAP_REGION_NOTFOUND and
+     * it will be a proper region index when rc >= MPUMAP_REGION_FOUND.
+     */
+    return idx;
+}
+
+static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
+{
+    bool ret = true;
+
+    if ( region->prbar.reg.ro != PAGE_RO_MASK(attributes) )
+    {
+        printk(XENLOG_WARNING
+               "Mismatched Access Permission attributes (%#x0 instead of %#x0)\n",
+               region->prbar.reg.ro, PAGE_RO_MASK(attributes));
+        ret = false;
+    }
+
+    if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
+    {
+        printk(XENLOG_WARNING
+               "Mismatched Execute Never attributes (%#x instead of %#x)\n",
+               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
+        ret = false;
+    }
+
+    if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
+    {
+        printk(XENLOG_WARNING
+               "Mismatched Memory Attribute Index (%#x instead of %#x)\n",
+               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
+        ret = false;
+    }
+
+    return ret;
+}
+
+void *map_mm_range(paddr_t base, paddr_t limit, unsigned int flags)
+{
+    paddr_t start_pg = round_pgdown(base);
+    paddr_t end_pg = round_pgup(limit);
+    void *ret = NULL;
+    uint8_t idx;
+
+    if ( !check_mpu_mapping(start_pg, end_pg, flags) )
+        return NULL;
+
+    spin_lock(&xen_mpumap_lock);
+
+    idx = is_mm_range_mapped(start_pg, end_pg);
+    if ( idx != INVALID_REGION_IDX )
+    {
+        /* Already mapped with different attributes */
+        if ( !is_mm_attr_match(&xen_mpumap[idx], flags) )
+        {
+            printk(XENLOG_WARNING
+                   "Range %#"PRIpaddr"-%#"PRIpaddr" already mapped with different flags\n",
+                   start_pg, end_pg);
+            goto out;
+        }
+
+        /* Already mapped with same attributes */
+        ret = maddr_to_virt(base);
+        goto out;
+    }
+
+    if ( !xen_mpumap_update_entry(start_pg, end_pg, flags, true) )
+    {
+        context_sync_mpu();
+        ret = maddr_to_virt(base);
+    }
+
+ out:
+    spin_unlock(&xen_mpumap_lock);
+
+    return ret;
+}
+
+void unmap_mm_range(paddr_t base)
+{
+    uint8_t idx;
+
+    spin_lock(&xen_mpumap_lock);
+
+    /*
+     * Mappings created via map_mm_range are at least PAGE_SIZE. Find the idx
+     * of the MPU memory region containing `start` mapped through map_mm_range.
+     */
+    idx = is_mm_range_mapped(base, base + PAGE_SIZE);
+    if ( idx == INVALID_REGION_IDX )
+    {
+        printk(XENLOG_ERR
+               "Failed to unmap_mm_range MPU memory region at %#"PRIpaddr"\n",
+               base);
+        goto out;
+    }
+
+    /* This API is only meant to unmap transient regions */
+    if ( !region_is_transient(&xen_mpumap[idx]) )
+        goto out;
+
+    /* Disable MPU memory region and clear the associated entry in xen_mpumap */
+    disable_mpu_region_from_index(idx);
+    context_sync_mpu();
+
+ out:
+    spin_unlock(&xen_mpumap_lock);
+}
+
 void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
 {
-    BUG_ON("unimplemented");
-    return NULL;
+    if ( !map_mm_range(start, start + len, flags) )
+        return NULL;
+
+    /* Mapped or already mapped */
+    return maddr_to_virt(start);
 }
 
 /*
-- 
2.34.1


