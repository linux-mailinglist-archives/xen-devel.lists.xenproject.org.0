Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848BF73D693
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555110.866926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd60-0007Oa-TW; Mon, 26 Jun 2023 03:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555110.866926; Mon, 26 Jun 2023 03:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5z-00074p-V6; Mon, 26 Jun 2023 03:40:55 +0000
Received: by outflank-mailman (input) for mailman id 555110;
 Mon, 26 Jun 2023 03:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd21-0007ej-Q9
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ae818a65-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:36:48 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A7131FB;
 Sun, 25 Jun 2023 20:37:32 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D0CD03F64C;
 Sun, 25 Jun 2023 20:36:45 -0700 (PDT)
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
X-Inumbo-ID: ae818a65-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 32/52] xen/mpu: implement MPU version of setup_mm in mpu/setup.c
Date: Mon, 26 Jun 2023 11:34:23 +0800
Message-Id: <20230626033443.2943270-33-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In MPU system, resource, like Xenheap, must be statically configured to
meet the requirement of static system with expected behavior.
Then, in MPU version of setup_mm, we introduce setup_staticheap_mappings to
map fixed MPU memory region for static Xenheap.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- move the changes to mpu/setup.c
---
 xen/arch/arm/Makefile             |  1 +
 xen/arch/arm/include/asm/mpu/mm.h |  1 +
 xen/arch/arm/mpu/mm.c             | 27 ++++++++++++
 xen/arch/arm/mpu/setup.c          | 70 +++++++++++++++++++++++++++++++
 4 files changed, 99 insertions(+)
 create mode 100644 xen/arch/arm/mpu/setup.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 3bd193ee32..5f6ee817ad 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -42,6 +42,7 @@ obj-y += mmu/setup.o
 obj-y += mmu/p2m.o
 else
 obj-y += mpu/mm.o
+obj-y += mpu/setup.o
 endif
 obj-y += mm.o
 obj-y += monitor.o
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index eec572ecfc..e26bd4f975 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -3,6 +3,7 @@
 #define __ARCH_ARM_MM_MPU__
 
 extern int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
+extern void setup_staticheap_mappings(void);
 
 #endif /* __ARCH_ARM_MM_MPU__ */
 
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index f4ce19d36a..7bd5609102 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -22,8 +22,10 @@
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/page-size.h>
+#include <xen/pfn.h>
 #include <asm/arm64/mpu.h>
 #include <asm/page.h>
+#include <asm/setup.h>
 
 #ifdef NDEBUG
 static inline void __attribute__ ((__format__ (__printf__, 1, 2)))
@@ -486,6 +488,31 @@ int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
     return rc;
 }
 
+/*
+ * Heap must be statically configured in Device Tree through
+ * "xen,static-heap" in MPU system.
+ */
+void __init setup_staticheap_mappings(void)
+{
+    unsigned int bank = 0;
+
+    for ( ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
+    {
+        if ( bootinfo.reserved_mem.bank[bank].type == MEMBANK_STATIC_HEAP )
+        {
+            paddr_t bank_start = round_pgup(
+                                 bootinfo.reserved_mem.bank[bank].start);
+            paddr_t bank_size = round_pgdown(
+                                bootinfo.reserved_mem.bank[bank].size);
+            paddr_t bank_end = bank_start + bank_size;
+
+            /* Map static heap with fixed MPU memory region */
+            if ( xen_mpumap_update(bank_start, bank_end, PAGE_HYPERVISOR) )
+                panic("mpu: failed to map static heap\n");
+        }
+    }
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
new file mode 100644
index 0000000000..31f412957c
--- /dev/null
+++ b/xen/arch/arm/mpu/setup.c
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/arch/arm/mpu/setup.c
+ *
+ * Early bringup code for an Armv8-R with virt extensions.
+ *
+ * Copyright (C) 2023 Arm Ltd.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <xen/init.h>
+#include <xen/mm.h>
+#include <xen/pfn.h>
+#include <asm/mpu/mm.h>
+#include <asm/page.h>
+#include <asm/setup.h>
+
+void __init setup_mm(void)
+{
+    paddr_t ram_start = ~0, ram_end = 0, ram_size = 0;
+    unsigned int bank;
+
+    if ( !bootinfo.mem.nr_banks )
+        panic("No memory bank\n");
+
+    init_pdx();
+
+    populate_boot_allocator();
+
+    total_pages = 0;
+    for ( bank = 0 ; bank < bootinfo.mem.nr_banks; bank++ )
+    {
+        paddr_t bank_start = round_pgup(bootinfo.mem.bank[bank].start);
+        paddr_t bank_size = bootinfo.mem.bank[bank].size;
+        paddr_t bank_end = round_pgdown(bank_start + bank_size);
+
+        ram_size = ram_size + bank_size;
+        ram_start = min(ram_start, bank_start);
+        ram_end = max(ram_end, bank_end);
+    }
+
+    setup_staticheap_mappings();
+
+    total_pages += ram_size >> PAGE_SHIFT;
+    max_page = PFN_DOWN(ram_end);
+
+    setup_frametable_mappings(ram_start, ram_end);
+
+    init_staticmem_pages();
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
2.25.1


