Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83AA73D66F
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:39:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555016.866604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4u-0006tX-JQ; Mon, 26 Jun 2023 03:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555016.866604; Mon, 26 Jun 2023 03:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4u-0006jm-6W; Mon, 26 Jun 2023 03:39:48 +0000
Received: by outflank-mailman (input) for mailman id 555016;
 Mon, 26 Jun 2023 03:39:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2O-0000HH-Mx
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id bb901191-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:37:10 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 417381FB;
 Sun, 25 Jun 2023 20:37:54 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8CDF73F64C;
 Sun, 25 Jun 2023 20:37:07 -0700 (PDT)
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
X-Inumbo-ID: bb901191-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 39/52] xen/mpu: support free_init_memory in MPU system
Date: Mon, 26 Jun 2023 11:34:30 +0800
Message-Id: <20230626033443.2943270-40-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit refines free_init_memory() to make it support in MPU system.

We are supporting modify_xen_mappings() in MPU system too, and it is
responsible for modifying memory permission of a existing MPU memory region.
Currently, we only support modifying a *WHOLE* MPU memory region,
part-region modification is not supported, as in worst case, it will
leave three fragments behind.

In MPU system, we map init text and init data section, each with a MPU memory
region. So we shall destroy it seperately in free_init_memory().

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- As MMU and MPU could share a lot of codes, we made the changes in
original function free_init_memory() in mm.c
---
 xen/arch/arm/mm.c     | 14 +++++++++++++-
 xen/arch/arm/mpu/mm.c | 33 ++++++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 247d17cfa1..ba4ae74e18 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -177,7 +177,12 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int flags)
     ASSERT(IS_ALIGNED(s, PAGE_SIZE));
     ASSERT(IS_ALIGNED(e, PAGE_SIZE));
     ASSERT(s <= e);
+#ifndef CONFIG_HAS_MPU
     return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, flags);
+#else
+    return xen_mpumap_update(virt_to_maddr((void *)s),
+                             virt_to_maddr((void *)e), flags);
+#endif
 }
 
 /* Release all __init and __initdata ranges to be reused */
@@ -212,10 +217,17 @@ void free_init_memory(void)
     for ( i = 0; i < nr; i++ )
         *(p + i) = insn;
 
+    /* Remove init text section */
     rc = destroy_xen_mappings((unsigned long)__init_begin,
+                              (unsigned long)inittext_end);
+    if ( rc )
+        panic("Unable to remove the init text section (rc = %d)\n", rc);
+
+    /* Remove init data section */
+    rc = destroy_xen_mappings((unsigned long)inittext_end,
                               (unsigned long)__init_end);
     if ( rc )
-        panic("Unable to remove the init section (rc = %d)\n", rc);
+        panic("Unable to remove the init data section (rc = %d)\n", rc);
 
     if ( !xen_is_using_staticheap() )
     {
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index b2419f0603..79d1c10d05 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -496,8 +496,39 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
     if ( (rc < 0) || (rc == MPUMAP_REGION_OVERLAP) )
         return -EINVAL;
 
+    /* We are updating the permission. */
+    if ( (flags & _PAGE_PRESENT) && (rc == MPUMAP_REGION_FOUND ||
+                                     rc == MPUMAP_REGION_INCLUSIVE) )
+    {
+        /*
+         * Currently, we only support modifying a *WHOLE* MPU memory region,
+         * part-region modification is not supported, as in worst case, it will
+         * leave three fragments behind.
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
+        if (xen_mpumap[idx].prlar.reg.ai != PAGE_AI_MASK(flags) )
+        {
+            region_printk("Modifying memory attributes is not allowed (0x%x -> 0x%x).\n",
+                          xen_mpumap[idx].prlar.reg.ai, PAGE_AI_MASK(flags));
+            return -EINVAL;
+        }
+
+        /* Set new permission */
+        xen_mpumap[idx].prbar.reg.ap = PAGE_AP_MASK(flags);
+        xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
+
+        write_protection_region((const pr_t*)(&xen_mpumap[idx]), idx);
+    }
     /* We are inserting a mapping => Create new region. */
-    if ( flags & _PAGE_PRESENT )
+    else if ( flags & _PAGE_PRESENT )
     {
         if ( rc != MPUMAP_REGION_FAILED )
             return -EINVAL;
-- 
2.25.1


