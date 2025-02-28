Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05315A49E8C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 17:18:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898964.1307485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34R-0005WD-7Y; Fri, 28 Feb 2025 16:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898964.1307485; Fri, 28 Feb 2025 16:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to34R-0005QO-23; Fri, 28 Feb 2025 16:18:39 +0000
Received: by outflank-mailman (input) for mailman id 898964;
 Fri, 28 Feb 2025 16:18:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5/q7=VT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1to34P-0003Ub-Qg
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 16:18:37 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a9d59500-f5ef-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 17:18:36 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F35B176A;
 Fri, 28 Feb 2025 08:18:51 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CFC93F5A1;
 Fri, 28 Feb 2025 08:18:35 -0800 (PST)
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
X-Inumbo-ID: a9d59500-f5ef-11ef-9aaf-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 8/9] arm/mpu: Implement early_fdt_map support in MPU systems
Date: Fri, 28 Feb 2025 16:18:16 +0000
Message-Id: <20250228161817.3342443-9-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250228161817.3342443-1-luca.fancellu@arm.com>
References: <20250228161817.3342443-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement early_fdt_map() function, that is responsible to map the
device tree blob in the early stages of the boot process, since at
this stage the MPU C data structure are not yet initialised, it is
using low level APIs to write into the MPU registers at a fixed
MPU region number.

The MPU memory management is designed to work on pages of PAGE_SIZE
in order to reuse helpers and macros already available on the Xen
memory management system.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/mpu/Makefile |  1 +
 xen/arch/arm/mpu/setup.c  | 72 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 xen/arch/arm/mpu/setup.c

diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index b18cec483671..04df0b2ee760 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1 +1,2 @@
 obj-y += mm.o
+obj-y += setup.init.o
diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
new file mode 100644
index 000000000000..290baaca9fd7
--- /dev/null
+++ b/xen/arch/arm/mpu/setup.c
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/arch/arm/mpu/setup.c
+ *
+ * MPU system boot code for Armv8-R AArch64.
+ *
+ */
+
+#include <xen/bootfdt.h>
+#include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/mm.h>
+
+/* Needs to be kept in sync with the regions programmed in arm64/mpu/head.S */
+#define EARLY_FDT_MAP_REGION_NUMBER 6
+
+void * __init early_fdt_map(paddr_t fdt_paddr)
+{
+    /* Map at least a page containing the DTB address, exclusive range */
+    paddr_t base_paddr = round_pgdown(fdt_paddr);
+    paddr_t end_paddr = round_pgup(fdt_paddr + sizeof(struct fdt_header));
+    unsigned int flags = PAGE_HYPERVISOR_RO;
+    void *fdt_virt = (void *)fdt_paddr; /* virt == paddr for MPU */
+    pr_t fdt_region;
+
+    /*
+     * Check whether the physical FDT address is set and meets the minimum
+     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
+     * least 8 bytes so that we always access the magic and size fields
+     * of the FDT header after mapping the first chunk, double check if
+     * that is indeed the case.
+     */
+    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
+    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
+        return NULL;
+
+    /* Map the device tree blob header  */
+    fdt_region = pr_of_xenaddr(base_paddr, end_paddr, PAGE_AI_MASK(flags));
+    fdt_region.prbar.reg.ap = PAGE_AP_MASK(flags);
+    fdt_region.prbar.reg.xn = PAGE_XN_MASK(flags);
+
+    write_protection_region(&fdt_region, EARLY_FDT_MAP_REGION_NUMBER);
+    context_sync_mpu();
+
+    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
+        return NULL;
+
+    end_paddr = round_pgup(fdt_paddr + fdt_totalsize(fdt_virt));
+
+    /*
+     * If the mapped range is not enough, map the rest of the DTB, pr_get_limit
+     * returns an inclusive address of the range, hence the increment.
+     */
+    if ( end_paddr > (pr_get_limit(&fdt_region) + 1) )
+    {
+        pr_set_limit(&fdt_region, end_paddr);
+
+        write_protection_region(&fdt_region, EARLY_FDT_MAP_REGION_NUMBER);
+        context_sync_mpu();
+    }
+
+    return fdt_virt;
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
2.34.1


