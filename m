Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6248C918E0
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 11:01:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174649.1499625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOvHw-00014Y-8D; Fri, 28 Nov 2025 10:01:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174649.1499625; Fri, 28 Nov 2025 10:01:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOvHw-00010t-33; Fri, 28 Nov 2025 10:01:16 +0000
Received: by outflank-mailman (input) for mailman id 1174649;
 Fri, 28 Nov 2025 10:01:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kA0B=6E=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vOvHu-0000F3-AW
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 10:01:14 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id edf10654-cc40-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 11:00:46 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32D6F1AC1;
 Fri, 28 Nov 2025 01:59:21 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE76F3F73B;
 Fri, 28 Nov 2025 01:59:26 -0800 (PST)
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
X-Inumbo-ID: edf10654-cc40-11f0-980a-7dc792cee155
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH 6/6] arm/mpu: Map domain page in AArch64 MPU systems
Date: Fri, 28 Nov 2025 09:58:59 +0000
Message-ID: <20251128095859.11264-7-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128095859.11264-1-harry.ramsey@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

In MPU systems, we implement map_domain_page()/unmap_domain_page()
through mapping the domain page with a MPU region on demand.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
 xen/arch/arm/Kconfig           |  1 +
 xen/arch/arm/mpu/Makefile      |  1 +
 xen/arch/arm/mpu/domain-page.c | 53 ++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 xen/arch/arm/mpu/domain-page.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a5c111e08e..dac9a16c28 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -91,6 +91,7 @@ config MMU
 
 config MPU
 	bool "MPU" if UNSUPPORTED
+	select ARCH_MAP_DOMAIN_PAGE if ARM_64
 	select ARM_SECURE_STATE if ARM_64
 	select STATIC_MEMORY
 	help
diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index 4963c8b550..940297af3f 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
+obj-$(CONFIG_ARM_64) += domain-page.o
 obj-y += mm.o
 obj-y += p2m.o
 obj-y += setup.init.o
diff --git a/xen/arch/arm/mpu/domain-page.c b/xen/arch/arm/mpu/domain-page.c
new file mode 100644
index 0000000000..9248053ff5
--- /dev/null
+++ b/xen/arch/arm/mpu/domain-page.c
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/domain_page.h>
+#include <xen/mm.h>
+#include <xen/mm-frame.h>
+#include <xen/types.h>
+
+void *map_domain_page_global(mfn_t mfn)
+{
+    BUG_ON("unimplemented");
+    return NULL;
+}
+
+/* Map a page of domheap memory */
+void *map_domain_page(mfn_t mfn)
+{
+    paddr_t pa = mfn_to_maddr(mfn);
+
+    if ( map_pages_to_xen((unsigned long)pa, mfn, 1, PAGE_HYPERVISOR_RW) )
+        return NULL;
+
+    return maddr_to_virt(pa);
+}
+
+/* Release a mapping taken with map_domain_page() */
+void unmap_domain_page(const void *ptr)
+{
+    paddr_t base = virt_to_maddr(ptr);
+
+    if ( destroy_entire_xen_mapping(base) )
+        panic("Failed to unmap domain page\n");
+}
+
+mfn_t domain_page_map_to_mfn(const void *ptr)
+{
+    BUG_ON("unimplemented");
+    return INVALID_MFN;
+}
+
+void unmap_domain_page_global(const void *va)
+{
+    BUG_ON("unimplemented");
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
-- 
2.43.0


