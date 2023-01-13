Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5A3668B7C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476583.738939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjJ-00014V-5d; Fri, 13 Jan 2023 05:35:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476583.738939; Fri, 13 Jan 2023 05:35:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjI-00011m-UN; Fri, 13 Jan 2023 05:35:52 +0000
Received: by outflank-mailman (input) for mailman id 476583;
 Fri, 13 Jan 2023 05:35:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCdo-0005sP-8g
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5795f1c1-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:30:08 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F580FEC;
 Thu, 12 Jan 2023 21:30:50 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DF3163F587;
 Thu, 12 Jan 2023 21:30:05 -0800 (PST)
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
X-Inumbo-ID: 5795f1c1-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 10/40] xen/arm: split MMU and MPU config files from config.h
Date: Fri, 13 Jan 2023 13:28:43 +0800
Message-Id: <20230113052914.3845596-11-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Xen defines some global configuration macros for Arm in
config.h. We still want to use it for Armv8-R systems, but
there are some address related macros that are defined for
MMU systems. These macros will not be used by MPU systems,
Adding ifdefery with CONFIG_HAS_MPU to gate these macros
will result in a messy and hard-to-read/maintain code.

So we keep some common definitions still in config.h, but
move virtual address related definitions to a new file -
config_mmu.h. And use a new file config_mpu.h to store
definitions for MPU systems. To avoid spreading #ifdef
everywhere, we keep the same definition names for MPU
systems, like XEN_VIRT_START and HYPERVISOR_VIRT_START,
but the definition contents are MPU specific.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Remove duplicated FIXMAP definitions from config_mmu.h
---
 xen/arch/arm/include/asm/config.h     | 103 +++--------------------
 xen/arch/arm/include/asm/config_mmu.h | 112 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/config_mpu.h |  25 ++++++
 3 files changed, 147 insertions(+), 93 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/config_mmu.h
 create mode 100644 xen/arch/arm/include/asm/config_mpu.h

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 25a625ff08..86d8142959 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -48,6 +48,12 @@
 
 #define INVALID_VCPU_ID MAX_VIRT_CPUS
 
+/* Used for calculating PDX */
+#ifdef CONFIG_ARM_64
+#define FRAMETABLE_SIZE        GB(32)
+#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
+#endif
+
 #define __LINUX_ARM_ARCH__ 7
 #define CONFIG_AEABI
 
@@ -71,99 +77,10 @@
 #include <xen/const.h>
 #include <xen/page-size.h>
 
-/*
- * Common ARM32 and ARM64 layout:
- *   0  -   2M   Unmapped
- *   2M -   4M   Xen text, data, bss
- *   4M -   6M   Fixmap: special-purpose 4K mapping slots
- *   6M -  10M   Early boot mapping of FDT
- *   10M - 12M   Livepatch vmap (if compiled in)
- *
- * ARM32 layout:
- *   0  -  12M   <COMMON>
- *
- *  32M - 128M   Frametable: 24 bytes per page for 16GB of RAM
- * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
- *                    space
- *
- *   1G -   2G   Xenheap: always-mapped memory
- *   2G -   4G   Domheap: on-demand-mapped
- *
- * ARM64 layout:
- * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
- *   0  -  12M   <COMMON>
- *
- *   1G -   2G   VMAP: ioremap and early_ioremap
- *
- *  32G -  64G   Frametable: 24 bytes per page for 5.3TB of RAM
- *
- * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
- *  Unused
- *
- * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
- *  1:1 mapping of RAM
- *
- * 0x0000850000000000 - 0x0000ffffffffffff (123TB, L0 slots [266..511])
- *  Unused
- */
-
-#define XEN_VIRT_START         _AT(vaddr_t,0x00200000)
-#define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
-
-#define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
-#define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
-
-#ifdef CONFIG_LIVEPATCH
-#define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
-#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
-#endif
-
-#define HYPERVISOR_VIRT_START  XEN_VIRT_START
-
-#ifdef CONFIG_ARM_32
-
-#define CONFIG_SEPARATE_XENHEAP 1
-
-#define FRAMETABLE_VIRT_START  _AT(vaddr_t,0x02000000)
-#define FRAMETABLE_SIZE        MB(128-32)
-#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
-#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
-
-#define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
-#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
-
-#define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
-#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
-
-#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
-#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
-
-#define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
-
-/* Number of domheap pagetable pages required at the second level (2MB mappings) */
-#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
-
-#else /* ARM_64 */
-
-#define SLOT0_ENTRY_BITS  39
-#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
-#define SLOT0_ENTRY_SIZE  SLOT0(1)
-
-#define VMAP_VIRT_START  GB(1)
-#define VMAP_VIRT_SIZE   GB(1)
-
-#define FRAMETABLE_VIRT_START  GB(32)
-#define FRAMETABLE_SIZE        GB(32)
-#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
-
-#define DIRECTMAP_VIRT_START   SLOT0(256)
-#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
-#define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
-
-#define XENHEAP_VIRT_START     directmap_virt_start
-
-#define HYPERVISOR_VIRT_END    DIRECTMAP_VIRT_END
-
+#ifdef CONFIG_HAS_MPU
+#include <asm/config_mpu.h>
+#else
+#include <asm/config_mmu.h>
 #endif
 
 #define NR_hypercalls 64
diff --git a/xen/arch/arm/include/asm/config_mmu.h b/xen/arch/arm/include/asm/config_mmu.h
new file mode 100644
index 0000000000..c12ff25cf4
--- /dev/null
+++ b/xen/arch/arm/include/asm/config_mmu.h
@@ -0,0 +1,112 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/******************************************************************************
+ * config_mmu.h
+ *
+ * A Linux-style configuration list, only can be included by config.h
+ */
+
+#ifndef __ARM_CONFIG_MMU_H__
+#define __ARM_CONFIG_MMU_H__
+
+/*
+ * Common ARM32 and ARM64 layout:
+ *   0  -   2M   Unmapped
+ *   2M -   4M   Xen text, data, bss
+ *   4M -   6M   Fixmap: special-purpose 4K mapping slots
+ *   6M -  10M   Early boot mapping of FDT
+ *   10M - 12M   Livepatch vmap (if compiled in)
+ *
+ * ARM32 layout:
+ *   0  -  12M   <COMMON>
+ *
+ *  32M - 128M   Frametable: 24 bytes per page for 16GB of RAM
+ * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
+ *                    space
+ *
+ *   1G -   2G   Xenheap: always-mapped memory
+ *   2G -   4G   Domheap: on-demand-mapped
+ *
+ * ARM64 layout:
+ * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
+ *   0  -  12M   <COMMON>
+ *
+ *   1G -   2G   VMAP: ioremap and early_ioremap
+ *
+ *  32G -  64G   Frametable: 24 bytes per page for 5.3TB of RAM
+ *
+ * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
+ *  Unused
+ *
+ * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
+ *  1:1 mapping of RAM
+ *
+ * 0x0000850000000000 - 0x0000ffffffffffff (123TB, L0 slots [266..511])
+ *  Unused
+ */
+
+#define XEN_VIRT_START         _AT(vaddr_t,0x00200000)
+#define FIXMAP_ADDR(n)        (_AT(vaddr_t,0x00400000) + (n) * PAGE_SIZE)
+
+#define BOOT_FDT_VIRT_START    _AT(vaddr_t,0x00600000)
+#define BOOT_FDT_VIRT_SIZE     _AT(vaddr_t, MB(4))
+
+#ifdef CONFIG_LIVEPATCH
+#define LIVEPATCH_VMAP_START   _AT(vaddr_t,0x00a00000)
+#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
+#endif
+
+#define HYPERVISOR_VIRT_START  XEN_VIRT_START
+
+#ifdef CONFIG_ARM_32
+
+#define CONFIG_SEPARATE_XENHEAP 1
+
+#define FRAMETABLE_VIRT_START  _AT(vaddr_t,0x02000000)
+#define FRAMETABLE_SIZE        MB(128-32)
+#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
+#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
+
+#define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
+#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
+
+#define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
+#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
+
+#define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
+#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
+
+#define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
+
+/* Number of domheap pagetable pages required at the second level (2MB mappings) */
+#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
+
+#else /* ARM_64 */
+
+#define SLOT0_ENTRY_BITS  39
+#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
+#define SLOT0_ENTRY_SIZE  SLOT0(1)
+
+#define VMAP_VIRT_START  GB(1)
+#define VMAP_VIRT_SIZE   GB(1)
+
+#define FRAMETABLE_VIRT_START  GB(32)
+
+#define DIRECTMAP_VIRT_START   SLOT0(256)
+#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
+#define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
+
+#define XENHEAP_VIRT_START     directmap_virt_start
+
+#define HYPERVISOR_VIRT_END    DIRECTMAP_VIRT_END
+
+#endif
+
+#endif /* __ARM_CONFIG_MMU_H__ */
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/config_mpu.h b/xen/arch/arm/include/asm/config_mpu.h
new file mode 100644
index 0000000000..6b52b11ef7
--- /dev/null
+++ b/xen/arch/arm/include/asm/config_mpu.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * config_mpu.h: A Linux-style configuration list for Arm MPU systems,
+ *               only can be included by config.h
+ */
+
+#ifndef __ARM_CONFIG_MPU_H__
+#define __ARM_CONFIG_MPU_H__
+
+#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
+
+/*
+ * All MPU platforms need to provide a XEN_START_ADDRESS for linker. This
+ * address indicates where Xen image will be loaded and run from. This
+ * address must be aligned to a PAGE_SIZE.
+ */
+#if (XEN_START_ADDRESS % PAGE_SIZE) != 0
+#error "XEN_START_ADDRESS must be aligned to PAGE_SIZE"
+#endif
+
+#define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)
+
+#define HYPERVISOR_VIRT_START  XEN_VIRT_START
+
+#endif /* __ARM_CONFIG_MPU_H__ */
-- 
2.25.1


