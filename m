Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CD8D1A346
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 17:23:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202066.1517686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhAz-0003Gu-0s; Tue, 13 Jan 2026 16:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202066.1517686; Tue, 13 Jan 2026 16:23:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhAy-0003FQ-TJ; Tue, 13 Jan 2026 16:23:24 +0000
Received: by outflank-mailman (input) for mailman id 1202066;
 Tue, 13 Jan 2026 16:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b0e4=7S=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vfhAy-0003EQ-2Y
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 16:23:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2d6a33af-f09c-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 17:23:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 797951595;
 Tue, 13 Jan 2026 08:23:14 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 302063F59E;
 Tue, 13 Jan 2026 08:23:20 -0800 (PST)
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
X-Inumbo-ID: 2d6a33af-f09c-11f0-b15e-2bf370ae4941
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Luca Fancellu <luca.fancellu@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/6] arm/mpu: Implement vmap functions for MPU
Date: Tue, 13 Jan 2026 16:23:05 +0000
Message-ID: <20260113162309.6766-3-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113162309.6766-1-harry.ramsey@arm.com>
References: <20260113162309.6766-1-harry.ramsey@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

HAS_VMAP is not enabled on MPU systems, but the vmap functions are used
in places across common code. In order to keep the existing code and
maintain correct functionality, implement the `vmap_contig` and `vunmap`
functions for MPU systems.

Introduce a helper function `destroy_xen_mapping_containing` to aid with
unmapping an entire region when only the start address is known.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
v3:
- Add additional comments for clarity regarding MPUMAP_REGION checks
- Ensure `context_sync_mpu` occurs after `destroy_entire_xen_mapping`
- Fix deadlock if `destroy_entire_xen_mapping` is called with an address
  that does not belong to a region
v2:
- Rename `destroy_entire_xen_mapping` to `destroy_xen_mapping_containing`
- Improve code documentation
- Refactor nested code
- Fix ignored rc error code in `destroy_xen_mapping_containing`
---
 xen/arch/arm/include/asm/mpu/mm.h | 10 ++++
 xen/arch/arm/mpu/mm.c             | 82 ++++++++++++++++++++++++++-----
 xen/arch/arm/mpu/vmap.c           | 14 ++++--
 3 files changed, 91 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index e1ded6521d..1b5ffa5b64 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -111,6 +111,16 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags);
 int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
                            paddr_t limit, uint8_t *index);
 
+
+/*
+ * Destroys and frees (if reference count is 0) an entire xen mapping on MPU
+ * systems where only the start address is known.
+ *
+ * @param s     Start address of memory region to be destroyed.
+ * @return:     0 on success, negative on error.
+ */
+int destroy_xen_mapping_containing(paddr_t s);
+
 #endif /* __ARM_MPU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 687dec3bc6..14a988ea0c 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -290,6 +290,43 @@ static void disable_mpu_region_from_index(uint8_t index)
         write_protection_region(&xen_mpumap[index], index);
 }
 
+/*
+ * Free a xen_mpumap entry given the index. A mpu region is actually disabled
+ * when the refcount is 0 and the region type is MPUMAP_REGION_FOUND.
+ *
+ * @param idx                   Index of the mpumap entry.
+ * @param region_found_type     MPUMAP_REGION_* value.
+ * @return                      0 on success, otherwise negative on error.
+ */
+static int xen_mpumap_free_entry(uint8_t idx, int region_found_type)
+{
+    ASSERT(spin_is_locked(&xen_mpumap_lock));
+    ASSERT(idx != INVALID_REGION_IDX);
+    ASSERT(MPUMAP_REGION_OVERLAP != region_found_type);
+
+    if ( MPUMAP_REGION_NOTFOUND == region_found_type )
+    {
+        printk(XENLOG_ERR "Cannot remove entry that does not exist\n");
+        return -EINVAL;
+    }
+
+    if ( xen_mpumap[idx].refcount )
+    {
+        xen_mpumap[idx].refcount -= 1;
+        return 0;
+    }
+
+    if ( MPUMAP_REGION_FOUND == region_found_type )
+        disable_mpu_region_from_index(idx);
+    else
+    {
+        printk(XENLOG_ERR "Cannot remove a partial region\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 /*
  * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
  * given memory range and flags, creating one if none exists.
@@ -357,18 +394,7 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
             return -EINVAL;
         }
 
-        if ( xen_mpumap[idx].refcount == 0 )
-        {
-            if ( MPUMAP_REGION_FOUND == rc )
-                disable_mpu_region_from_index(idx);
-            else
-            {
-                printk("Cannot remove a partial region\n");
-                return -EINVAL;
-            }
-        }
-        else
-            xen_mpumap[idx].refcount -= 1;
+        return xen_mpumap_free_entry(idx, rc);
     }
 
     return 0;
@@ -418,6 +444,38 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
     return xen_mpumap_update(s, e, 0);
 }
 
+int destroy_xen_mapping_containing(paddr_t s)
+{
+    int rc;
+    uint8_t idx;
+
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+
+    spin_lock(&xen_mpumap_lock);
+
+    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions, s, s + PAGE_SIZE,
+                                &idx);
+
+    /*
+     * Since only entire regions can be freed using `xen_mpumap_free_entry` we
+     * must first check the region exists.
+     */
+    if ( MPUMAP_REGION_NOTFOUND == rc ) {
+        printk(XENLOG_ERR "Cannot remove entry that does not exist");
+        rc = -EINVAL;
+        goto out;
+    }
+
+    /* As we are unmapping entire region use MPUMAP_REGION_FOUND instead */
+    rc = xen_mpumap_free_entry(idx, MPUMAP_REGION_FOUND);
+    if ( !rc )
+        context_sync_mpu();
+ out:
+    spin_unlock(&xen_mpumap_lock);
+
+    return rc;
+}
+
 int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
                      unsigned int flags)
 {
diff --git a/xen/arch/arm/mpu/vmap.c b/xen/arch/arm/mpu/vmap.c
index f977b79cd4..54d949e7ce 100644
--- a/xen/arch/arm/mpu/vmap.c
+++ b/xen/arch/arm/mpu/vmap.c
@@ -1,19 +1,27 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include <xen/bug.h>
+#include <xen/mm.h>
 #include <xen/mm-frame.h>
 #include <xen/types.h>
 #include <xen/vmap.h>
 
 void *vmap_contig(mfn_t mfn, unsigned int nr)
 {
-    BUG_ON("unimplemented");
-    return NULL;
+    paddr_t base = mfn_to_maddr(mfn);
+
+    if ( map_pages_to_xen(base, mfn, nr, PAGE_HYPERVISOR ) )
+        return NULL;
+
+    return maddr_to_virt(base);
 }
 
 void vunmap(const void *va)
 {
-    BUG_ON("unimplemented");
+    paddr_t base = virt_to_maddr(va);
+
+    if ( destroy_xen_mapping_containing(base) )
+        panic("Failed to vunmap region\n");
 }
 
 /*
-- 
2.43.0


