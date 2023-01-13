Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E0C668B87
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476619.739034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCji-0005Hn-Ed; Fri, 13 Jan 2023 05:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476619.739034; Fri, 13 Jan 2023 05:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCji-0005Dn-3c; Fri, 13 Jan 2023 05:36:18 +0000
Received: by outflank-mailman (input) for mailman id 476619;
 Fri, 13 Jan 2023 05:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCez-0005sP-21
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8417391e-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:31:23 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3E5C13D5;
 Thu, 12 Jan 2023 21:32:04 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 40C9B3F587;
 Thu, 12 Jan 2023 21:31:20 -0800 (PST)
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
X-Inumbo-ID: 8417391e-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 33/40] xen/arm: check mapping status and attributes for MPU copy_from_paddr
Date: Fri, 13 Jan 2023 13:29:06 +0800
Message-Id: <20230113052914.3845596-34-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

We introduce map_page_to_xen_misc/unmap_page_to_xen_misc to temporarily
map a page in Xen misc field to gain access, however, in MPU system,
all resource is statically configured in Device Tree and already mapped
at very early boot stage.

When enabling map_page_to_xen_misc for copy_from_paddr in MPU system,
we need to check whether a given paddr is properly mapped.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/kernel.c |  2 +-
 xen/arch/arm/mm_mpu.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index ee7144ec13..ce2b3347d7 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -57,7 +57,7 @@ void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
         s = paddr & (PAGE_SIZE - 1);
         l = min(PAGE_SIZE - s, len);
 
-        src = map_page_to_xen_misc(maddr_to_mfn(paddr), PAGE_HYPERVISOR_WC);
+        src = map_page_to_xen_misc(maddr_to_mfn(paddr), DEFINE_ATTRIBUTE(HYPERVISOR_WC));
         ASSERT(src != NULL);
         memcpy(dst, src + s, l);
         clean_dcache_va_range(dst, l);
diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index 7b54c87acf..0b720004ee 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -790,6 +790,27 @@ void *ioremap(paddr_t pa, size_t len)
     return ioremap_attr(pa, len, REGION_HYPERVISOR_NOCACHE);
 }
 
+/*
+ * In MPU system, due to limited MPU memory regions, all resource is statically
+ * configured in Device Tree and mapped at very early stage, dynamic temporary
+ * page mapping is not allowed.
+ * So in map_page_to_xen_misc, we need to check if page is already properly
+ * mapped with #attributes.
+ */
+void *map_page_to_xen_misc(mfn_t mfn, unsigned int attributes)
+{
+    paddr_t pa = mfn_to_maddr(mfn);
+
+    if ( !check_region_and_attributes(pa, PAGE_SIZE, attributes, "map_to_misc") )
+        return NULL;
+
+    return maddr_to_virt(pa);
+}
+
+void unmap_page_from_xen_misc(void)
+{
+}
+
 /* TODO: Implementation on the first usage */
 void dump_hyp_walk(vaddr_t addr)
 {
-- 
2.25.1


