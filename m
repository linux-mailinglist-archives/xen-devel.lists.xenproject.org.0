Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0C7668B77
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:35:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476566.738884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCj5-0007RY-05; Fri, 13 Jan 2023 05:35:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476566.738884; Fri, 13 Jan 2023 05:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCj4-0007NN-QI; Fri, 13 Jan 2023 05:35:38 +0000
Received: by outflank-mailman (input) for mailman id 476566;
 Fri, 13 Jan 2023 05:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCeO-0005sP-7n
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:48 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6dd4dc0f-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:30:45 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7405113D5;
 Thu, 12 Jan 2023 21:31:27 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A74C73F587;
 Thu, 12 Jan 2023 21:30:42 -0800 (PST)
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
X-Inumbo-ID: 6dd4dc0f-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 22/40] xen/mpu: implement MPU version of setup_mm in setup_mpu.c
Date: Fri, 13 Jan 2023 13:28:55 +0800
Message-Id: <20230113052914.3845596-23-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In MPU system, system RAM shall be statically partitioned into
different functionality section in Device Tree at the very beginning,
including static xenheap, guest memory section, boot-module section, etc.
So using a virtual contigious memory region to do direct-mapping for the
whole system RAM is not applicable in MPU system.

Function setup_static_mappings is introduced to set up MPU memory
region mapping section by section based on static configuration in
Device Tree.
And this commit is only responsible for static xenheap mapping, which is
implemented in setup_staticheap_mappings. All the other static
memory section mapping will be introduced later.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Makefile             |  2 +
 xen/arch/arm/include/asm/mm_mpu.h |  5 +++
 xen/arch/arm/mm_mpu.c             | 41 ++++++++++++++++++
 xen/arch/arm/setup_mpu.c          | 70 +++++++++++++++++++++++++++++++
 4 files changed, 118 insertions(+)
 create mode 100644 xen/arch/arm/setup_mpu.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index adeb17b7ab..23dfbc3333 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -53,6 +53,8 @@ obj-y += psci.o
 obj-y += setup.o
 ifneq ($(CONFIG_HAS_MPU), y)
 obj-y += setup_mmu.o
+else
+obj-y += setup_mpu.o
 endif
 obj-y += shutdown.o
 obj-y += smp.o
diff --git a/xen/arch/arm/include/asm/mm_mpu.h b/xen/arch/arm/include/asm/mm_mpu.h
index 3a4b07f187..fe6a828a50 100644
--- a/xen/arch/arm/include/asm/mm_mpu.h
+++ b/xen/arch/arm/include/asm/mm_mpu.h
@@ -3,6 +3,11 @@
 #define __ARCH_ARM_MM_MPU__
 
 #define setup_mm_mappings(boot_phys_offset) ((void)(boot_phys_offset))
+/*
+ * Function setup_static_mappings() sets up MPU memory region mapping
+ * section by section based on static configuration in Device Tree.
+ */
+extern void setup_static_mappings(void);
 
 static inline paddr_t __virt_to_maddr(vaddr_t va)
 {
diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index b34dbf4515..f057ee26df 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -523,6 +523,47 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     return fdt_virt;
 }
 
+/*
+ * Heap must be statically configured in Device Tree through
+ * "xen,static-heap" in MPU system.
+ */
+static void __init setup_staticheap_mappings(void)
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
+
+            /* Map static heap with fixed MPU memory region */
+
+            if ( map_pages_to_xen(bank_start, maddr_to_mfn(bank_start),
+                                  bank_size >> PAGE_SHIFT,
+                                  REGION_HYPERVISOR) )
+                panic("mpu: failed to map static heap\n");
+        }
+    }
+}
+
+/*
+ * System RAM is statically partitioned into different functionality
+ * section in Device Tree, including static xenheap, guest memory
+ * section, boot-module section, etc.
+ * Function setup_static_mappings sets up MPU memory region mapping
+ * section by section.
+ */
+void __init setup_static_mappings(void)
+{
+    setup_staticheap_mappings();
+
+    /* TODO: guest memory section, device memory section, boot-module section, etc */
+}
+
 /* TODO: Implementation on the first usage */
 void dump_hyp_walk(vaddr_t addr)
 {
diff --git a/xen/arch/arm/setup_mpu.c b/xen/arch/arm/setup_mpu.c
new file mode 100644
index 0000000000..ca0d8237d5
--- /dev/null
+++ b/xen/arch/arm/setup_mpu.c
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * xen/arch/arm/setup_mpu.c
+ *
+ * Early bringup code for an Armv8-R with virt extensions.
+ *
+ * Copyright (C) 2022 Arm Ltd.
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
+#include <asm/mm_mpu.h>
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
+    setup_static_mappings();
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


