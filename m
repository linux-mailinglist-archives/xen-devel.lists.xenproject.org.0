Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CAC73D692
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555106.866905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5w-00061I-3B; Mon, 26 Jun 2023 03:40:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555106.866905; Mon, 26 Jun 2023 03:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5u-0005es-RO; Mon, 26 Jun 2023 03:40:50 +0000
Received: by outflank-mailman (input) for mailman id 555106;
 Mon, 26 Jun 2023 03:40:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd2L-0000HH-IC
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b9a4e930-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:37:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BF951FB;
 Sun, 25 Jun 2023 20:37:51 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 745663F64C;
 Sun, 25 Jun 2023 20:37:04 -0700 (PDT)
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
X-Inumbo-ID: b9a4e930-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 38/52] xen/mpu: map domain page in MPU system
Date: Mon, 26 Jun 2023 11:34:29 +0800
Message-Id: <20230626033443.2943270-39-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In MPU system, we implement map_domain_page()/unmap_domain_page()
through mapping the domain page with a transient MPU region on demand.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new patch
---
 xen/arch/arm/Makefile             |  4 ++
 xen/arch/arm/include/asm/mpu/mm.h |  1 +
 xen/arch/arm/mpu/domain_page.c    | 68 +++++++++++++++++++++++++++++++
 xen/arch/arm/mpu/mm.c             | 17 ++++++++
 4 files changed, 90 insertions(+)
 create mode 100644 xen/arch/arm/mpu/domain_page.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 5f6ee817ad..feb49640a0 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -17,7 +17,11 @@ obj-y += device.o
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
 obj-y += domain_build.init.o
+ifneq ($(CONFIG_HAS_MPU),y)
 obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
+else
+obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += mpu/domain_page.o
+endif
 obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 452fe20c5f..a83519ad13 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -10,6 +10,7 @@ extern void setup_staticheap_mappings(void);
 extern uint8_t is_mm_range_mapped(paddr_t pa, paddr_t len);
 extern void *map_mm_range(paddr_t pa, size_t len, unsigned int attributes);
 extern void unmap_mm_range(paddr_t pa);
+extern bool is_mm_range_mapped_transient(paddr_t pa, paddr_t len);
 
 #endif /* __ARCH_ARM_MM_MPU__ */
 
diff --git a/xen/arch/arm/mpu/domain_page.c b/xen/arch/arm/mpu/domain_page.c
new file mode 100644
index 0000000000..da408bb9e0
--- /dev/null
+++ b/xen/arch/arm/mpu/domain_page.c
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/mm.h>
+#include <asm/arm64/mpu.h>
+
+/* Override macros from asm/mm.h to make them work with mfn_t */
+#undef mfn_to_virt
+#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
+
+void *map_domain_page_global(mfn_t mfn)
+{
+    /* TODO: map shared domain page globally */
+    printk(XENLOG_ERR
+           "mpu: mapping shared domain page not SUPPORTED right now!\n");
+    return NULL;
+}
+
+void unmap_domain_page_global(const void *va)
+{
+    /* TODO: map shared domain page globally */
+    printk(XENLOG_ERR
+           "mpu: mapping shared domain page not SUPPORTED right now!\n");
+    return;
+}
+
+/* Map a page of domain memory */
+void *map_domain_page(mfn_t mfn)
+{
+    uint8_t idx;
+    paddr_t pa = mfn_to_maddr(mfn);
+
+    idx = is_mm_range_mapped(pa, PAGE_SIZE);
+    if ( idx != INVALID_REGION_IDX )
+        /* Already mapped */
+        return mfn_to_virt(mfn);
+    else
+        /*
+         * Map it temporarily with a transient MPU region.
+         * And it is caller's responsibity to unmap it
+         * through unmap_domain_page.
+         */
+        return map_mm_range(pa, PAGE_SIZE, PAGE_HYPERVISOR_RW);
+}
+
+/* Release a mapping taken with map_domain_page() */
+void unmap_domain_page(const void *va)
+{
+    paddr_t pa = (paddr_t)(unsigned long)(va);
+
+    /* Only unmap transient page */
+    if ( is_mm_range_mapped_transient(pa, PAGE_SIZE) )
+        unmap_mm_range(pa);
+}
+
+mfn_t domain_page_map_to_mfn(const void *ptr)
+{
+    printk(XENLOG_ERR
+           "mpu: domain_page_map_to_mfn() not SUPPORTED right now!\n");
+    return INVALID_MFN;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 21276d6de9..b2419f0603 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -809,6 +809,23 @@ void iounmap(void __iomem *va)
     unmap_mm_range(virt_to_maddr(va));
 }
 
+bool is_mm_range_mapped_transient(paddr_t pa, paddr_t len)
+{
+    uint8_t idx;
+
+    idx = is_mm_range_mapped(pa, len);
+    if ( idx != INVALID_REGION_IDX )
+    {
+        pr_t *region;
+
+        region = &xen_mpumap[idx];
+        if ( region_is_transient(region) )
+            return true;
+    }
+
+    return false;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


