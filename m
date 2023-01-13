Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEBD668B7D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476589.738962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjM-0001sA-QZ; Fri, 13 Jan 2023 05:35:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476589.738962; Fri, 13 Jan 2023 05:35:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjM-0001nk-Lc; Fri, 13 Jan 2023 05:35:56 +0000
Received: by outflank-mailman (input) for mailman id 476589;
 Fri, 13 Jan 2023 05:35:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCf2-0005sP-AO
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 85e3d938-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:31:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE16FFEC;
 Thu, 12 Jan 2023 21:32:07 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1BACD3F587;
 Thu, 12 Jan 2023 21:31:22 -0800 (PST)
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
X-Inumbo-ID: 85e3d938-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 34/40] xen/mpu: free init memory in MPU system
Date: Fri, 13 Jan 2023 13:29:07 +0800
Message-Id: <20230113052914.3845596-35-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit implements free_init_memory in MPU system, trying to keep
the same strategy with MMU system.

In order to inserting BRK instruction into init code section, which
aims to provok a fault on purpose, we should change init code section
permission to RW at first.
Function modify_xen_mappings is introduced to modify permission of the
existing valid MPU memory region.

Then we nuke the instruction cache to remove entries related to init
text.
At last, we destroy these two MPU memory regions referring init text and
init data using destroy_xen_mappings.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/mm_mpu.c | 85 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index 0b720004ee..de0c7d919a 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -20,6 +20,7 @@
  */
 
 #include <xen/init.h>
+#include <xen/kernel.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
 #include <xen/page-size.h>
@@ -77,6 +78,8 @@ static const unsigned int mpu_section_mattr[MSINFO_MAX] = {
     REGION_HYPERVISOR_BOOT,
 };
 
+extern char __init_data_begin[], __init_end[];
+
 /* Write a MPU protection region */
 #define WRITE_PROTECTION_REGION(sel, pr, prbar_el2, prlar_el2) ({       \
     uint64_t _sel = sel;                                                \
@@ -443,8 +446,41 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
     if ( rc == MPUMAP_REGION_OVERLAP )
         return -EINVAL;
 
+    /* We are updating the permission. */
+    if ( (flags & _REGION_PRESENT) && (rc == MPUMAP_REGION_FOUND ||
+                                       rc == MPUMAP_REGION_INCLUSIVE) )
+    {
+
+        /*
+         * Currently, we only support modifying a *WHOLE* MPU memory region,
+         * part-region modification is not supported, as in worst case, it will
+         * lead to three fragments in result after modification.
+         * part-region modification will be introduced only when actual usage
+         * come
+         */
+        if ( rc == MPUMAP_REGION_INCLUSIVE )
+        {
+            region_printk("mpu: part-region modification is not supported\n");
+            return -EINVAL;
+        }
+
+        /* We don't allow changing memory attributes. */
+        if (xen_mpumap[idx].prlar.reg.ai != REGION_AI_MASK(flags) )
+        {
+            region_printk("Modifying memory attributes is not allowed (0x%x -> 0x%x).\n",
+                          xen_mpumap[idx].prlar.reg.ai, REGION_AI_MASK(flags));
+            return -EINVAL;
+        }
+
+        /* Set new permission */
+        xen_mpumap[idx].prbar.reg.ap = REGION_AP_MASK(flags);
+        xen_mpumap[idx].prbar.reg.xn = REGION_XN_MASK(flags);
+
+        access_protection_region(false, NULL, (const pr_t*)(&xen_mpumap[idx]),
+                                 idx);
+    }
     /* We are inserting a mapping => Create new region. */
-    if ( flags & _REGION_PRESENT )
+    else if ( flags & _REGION_PRESENT )
     {
         if ( rc != MPUMAP_REGION_FAILED )
             return -EINVAL;
@@ -831,11 +867,56 @@ void mmu_init_secondary_cpu(void)
 
 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
 {
-    return -ENOSYS;
+    ASSERT(IS_ALIGNED(s, PAGE_SIZE));
+    ASSERT(IS_ALIGNED(e, PAGE_SIZE));
+    ASSERT(s <= e);
+    return xen_mpumap_update(s, e, flags);
 }
 
 void free_init_memory(void)
 {
+    /* Kernel init text section. */
+    paddr_t init_text = virt_to_maddr(_sinittext);
+    paddr_t init_text_end = round_pgup(virt_to_maddr(_einittext));
+    /* Kernel init data. */
+    paddr_t init_data = virt_to_maddr(__init_data_begin);
+    paddr_t init_data_end = round_pgup(virt_to_maddr(__init_end));
+    unsigned long init_section[4] = {(unsigned long)init_text,
+                                     (unsigned long)init_text_end,
+                                     (unsigned long)init_data,
+                                     (unsigned long)init_data_end};
+    unsigned int nr_init = 2;
+    uint32_t insn = AARCH64_BREAK_FAULT;
+    unsigned int i = 0, j = 0;
+
+    /* Change kernel init text section to RW. */
+    modify_xen_mappings((unsigned long)init_text,
+                        (unsigned long)init_text_end, REGION_HYPERVISOR_RW);
+
+    /*
+     * From now on, init will not be used for execution anymore,
+     * so nuke the instruction cache to remove entries related to init.
+     */
+    invalidate_icache_local();
+
+    /* Destroy two MPU memory regions referring init text and init data. */
+    for ( ; i < nr_init; i++ )
+    {
+        uint32_t *p;
+        unsigned int nr;
+        int rc;
+
+        i = 2 * i;
+        p = (uint32_t *)init_section[i];
+        nr = (init_section[i + 1] - init_section[i]) / sizeof(uint32_t);
+
+        for ( ; j < nr ; j++ )
+            *(p + j) = insn;
+
+        rc = destroy_xen_mappings(init_section[i], init_section[i + 1]);
+        if ( rc < 0 )
+            panic("Unable to remove the init section (rc = %d)\n", rc);
+    }
 }
 
 int xenmem_add_to_physmap_one(
-- 
2.25.1


