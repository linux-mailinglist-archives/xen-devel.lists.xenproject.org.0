Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D3576A797
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 05:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573558.898405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgJc-00009f-1t; Tue, 01 Aug 2023 03:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573558.898405; Tue, 01 Aug 2023 03:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgJb-00005X-Tk; Tue, 01 Aug 2023 03:44:55 +0000
Received: by outflank-mailman (input) for mailman id 573558;
 Tue, 01 Aug 2023 03:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUf/=DS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qQgJa-00076X-P6
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 03:44:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c5c24317-301d-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 05:44:52 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E9D6D75;
 Mon, 31 Jul 2023 20:45:35 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 208AC3F59C;
 Mon, 31 Jul 2023 20:44:48 -0700 (PDT)
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
X-Inumbo-ID: c5c24317-301d-11ee-8613-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v4 05/13] xen/arm: Move MMU related definitions from config.h to mmu/layout.h
Date: Tue,  1 Aug 2023 11:44:11 +0800
Message-Id: <20230801034419.2047541-6-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230801034419.2047541-1-Henry.Wang@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Xen defines some global configuration macros for Arm in config.h.
However there are some address layout related definitions that are
defined for MMU systems only, and these definitions could not be
used by MPU systems. Adding ifdefs with CONFIG_HAS_MPU to gate these
definitions will result in a messy and hard-to-read/maintain code.

So move MMU related definitions to a new file, i.e. mmu/layout.h to
avoid spreading "#ifdef" everywhere.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v4:
- Rebase on top of latest staging to pick the recent UBSAN change
  to the layout.
- Use #ifdef CONFIG_HAS_MMU instead of #ifndef CONFIG_HAS_MPU, add
  a #else case.
- Rework commit message.
v3:
- name the new header layout.h
v2:
- Remove duplicated FIXMAP definitions from config_mmu.h
---
 xen/arch/arm/include/asm/config.h     | 132 +----------------------
 xen/arch/arm/include/asm/mmu/layout.h | 146 ++++++++++++++++++++++++++
 2 files changed, 149 insertions(+), 129 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mmu/layout.h

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 83cbf6b0cb..a3cde7f2d7 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -71,136 +71,10 @@
 #include <xen/const.h>
 #include <xen/page-size.h>
 
-/*
- * ARM32 layout:
- *   0  -   2M   Unmapped
- *   2M -  10M   Xen text, data, bss
- *  10M -  12M   Fixmap: special-purpose 4K mapping slots
- *  12M -  16M   Early boot mapping of FDT
- *  16M -  18M   Livepatch vmap (if compiled in)
- *
- *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
- * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
- *                    space
- *
- *   1G -   2G   Xenheap: always-mapped memory
- *   2G -   4G   Domheap: on-demand-mapped
- *
- * ARM64 layout:
- * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
- *
- *  Reserved to identity map Xen
- *
- * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
- *  (Relative offsets)
- *   0  -   2M   Unmapped
- *   2M -  10M   Xen text, data, bss
- *  10M -  12M   Fixmap: special-purpose 4K mapping slots
- *  12M -  16M   Early boot mapping of FDT
- *  16M -  18M   Livepatch vmap (if compiled in)
- *
- *   1G -   2G   VMAP: ioremap and early_ioremap
- *
- *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
- *
- * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
- *  Unused
- *
- * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
- *  1:1 mapping of RAM
- *
- * 0x0000850000000000 - 0x0000ffffffffffff (123TB, L0 slots [266..511])
- *  Unused
- */
-
-#ifdef CONFIG_ARM_32
-#define XEN_VIRT_START          _AT(vaddr_t, MB(2))
+#ifdef CONFIG_HAS_MMU
+#include <asm/mmu/layout.h>
 #else
-
-#define SLOT0_ENTRY_BITS  39
-#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
-#define SLOT0_ENTRY_SIZE  SLOT0(1)
-
-#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
-#endif
-
-/*
- * Reserve enough space so both UBSAN and GCOV can be enabled together
- * plus some slack for future growth.
- */
-#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(8))
-#define XEN_NR_ENTRIES(lvl)     (XEN_VIRT_SIZE / XEN_PT_LEVEL_SIZE(lvl))
-
-#define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
-#define FIXMAP_VIRT_SIZE        _AT(vaddr_t, MB(2))
-
-#define FIXMAP_ADDR(n)          (FIXMAP_VIRT_START + (n) * PAGE_SIZE)
-
-#define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
-#define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
-
-#ifdef CONFIG_LIVEPATCH
-#define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
-#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
-#endif
-
-#define HYPERVISOR_VIRT_START  XEN_VIRT_START
-
-#ifdef CONFIG_ARM_32
-
-#define CONFIG_SEPARATE_XENHEAP 1
-
-#define FRAMETABLE_VIRT_START  _AT(vaddr_t, MB(32))
-#define FRAMETABLE_SIZE        MB(128-32)
-#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
-
-#define VMAP_VIRT_START        _AT(vaddr_t, MB(256))
-#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
-
-#define XENHEAP_VIRT_START     _AT(vaddr_t, GB(1))
-#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
-
-#define DOMHEAP_VIRT_START     _AT(vaddr_t, GB(2))
-#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
-
-#define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
-
-/* Number of domheap pagetable pages required at the second level (2MB mappings) */
-#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
-
-/*
- * The temporary area is overlapping with the domheap area. This may
- * be used to create an alias of the first slot containing Xen mappings
- * when turning on/off the MMU.
- */
-#define TEMPORARY_AREA_FIRST_SLOT    (first_table_offset(DOMHEAP_VIRT_START))
-
-/* Calculate the address in the temporary area */
-#define TEMPORARY_AREA_ADDR(addr)                           \
-     (((addr) & ~XEN_PT_LEVEL_MASK(1)) |                    \
-      (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
-
-#define TEMPORARY_XEN_VIRT_START    TEMPORARY_AREA_ADDR(XEN_VIRT_START)
-
-#else /* ARM_64 */
-
-#define IDENTITY_MAPPING_AREA_NR_L0  4
-
-#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
-#define VMAP_VIRT_SIZE   GB(1)
-
-#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
-#define FRAMETABLE_SIZE        GB(32)
-#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
-
-#define DIRECTMAP_VIRT_START   SLOT0(256)
-#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))
-#define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
-
-#define XENHEAP_VIRT_START     directmap_virt_start
-
-#define HYPERVISOR_VIRT_END    DIRECTMAP_VIRT_END
-
+# error "Unknown memory management layout"
 #endif
 
 #define NR_hypercalls 64
diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
new file mode 100644
index 0000000000..da6be276ac
--- /dev/null
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -0,0 +1,146 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_MMU_LAYOUT_H__
+#define __ARM_MMU_LAYOUT_H__
+
+/*
+ * ARM32 layout:
+ *   0  -   2M   Unmapped
+ *   2M -  10M   Xen text, data, bss
+ *  10M -  12M   Fixmap: special-purpose 4K mapping slots
+ *  12M -  16M   Early boot mapping of FDT
+ *  16M -  18M   Livepatch vmap (if compiled in)
+ *
+ *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
+ * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
+ *                    space
+ *
+ *   1G -   2G   Xenheap: always-mapped memory
+ *   2G -   4G   Domheap: on-demand-mapped
+ *
+ * ARM64 layout:
+ * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
+ *
+ *  Reserved to identity map Xen
+ *
+ * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
+ *  (Relative offsets)
+ *   0  -   2M   Unmapped
+ *   2M -  10M   Xen text, data, bss
+ *  10M -  12M   Fixmap: special-purpose 4K mapping slots
+ *  12M -  16M   Early boot mapping of FDT
+ *  16M -  18M   Livepatch vmap (if compiled in)
+ *
+ *   1G -   2G   VMAP: ioremap and early_ioremap
+ *
+ *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
+ *
+ * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
+ *  Unused
+ *
+ * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
+ *  1:1 mapping of RAM
+ *
+ * 0x0000850000000000 - 0x0000ffffffffffff (123TB, L0 slots [266..511])
+ *  Unused
+ */
+
+#ifdef CONFIG_ARM_32
+#define XEN_VIRT_START          _AT(vaddr_t, MB(2))
+#else
+
+#define SLOT0_ENTRY_BITS  39
+#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
+#define SLOT0_ENTRY_SIZE  SLOT0(1)
+
+#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
+#endif
+
+/*
+ * Reserve enough space so both UBSAN and GCOV can be enabled together
+ * plus some slack for future growth.
+ */
+#define XEN_VIRT_SIZE           _AT(vaddr_t, MB(8))
+#define XEN_NR_ENTRIES(lvl)     (XEN_VIRT_SIZE / XEN_PT_LEVEL_SIZE(lvl))
+
+#define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
+#define FIXMAP_VIRT_SIZE        _AT(vaddr_t, MB(2))
+
+#define FIXMAP_ADDR(n)          (FIXMAP_VIRT_START + (n) * PAGE_SIZE)
+
+#define BOOT_FDT_VIRT_START     (FIXMAP_VIRT_START + FIXMAP_VIRT_SIZE)
+#define BOOT_FDT_VIRT_SIZE      _AT(vaddr_t, MB(4))
+
+#ifdef CONFIG_LIVEPATCH
+#define LIVEPATCH_VMAP_START    (BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE)
+#define LIVEPATCH_VMAP_SIZE    _AT(vaddr_t, MB(2))
+#endif
+
+#define HYPERVISOR_VIRT_START  XEN_VIRT_START
+
+#ifdef CONFIG_ARM_32
+
+#define CONFIG_SEPARATE_XENHEAP 1
+
+#define FRAMETABLE_VIRT_START  _AT(vaddr_t, MB(32))
+#define FRAMETABLE_SIZE        MB(128-32)
+#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
+
+#define VMAP_VIRT_START        _AT(vaddr_t, MB(256))
+#define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
+
+#define XENHEAP_VIRT_START     _AT(vaddr_t, GB(1))
+#define XENHEAP_VIRT_SIZE      _AT(vaddr_t, GB(1))
+
+#define DOMHEAP_VIRT_START     _AT(vaddr_t, GB(2))
+#define DOMHEAP_VIRT_SIZE      _AT(vaddr_t, GB(2))
+
+#define DOMHEAP_ENTRIES        1024  /* 1024 2MB mapping slots */
+
+/* Number of domheap pagetable pages required at the second level (2MB mappings) */
+#define DOMHEAP_SECOND_PAGES (DOMHEAP_VIRT_SIZE >> FIRST_SHIFT)
+
+/*
+ * The temporary area is overlapping with the domheap area. This may
+ * be used to create an alias of the first slot containing Xen mappings
+ * when turning on/off the MMU.
+ */
+#define TEMPORARY_AREA_FIRST_SLOT    (first_table_offset(DOMHEAP_VIRT_START))
+
+/* Calculate the address in the temporary area */
+#define TEMPORARY_AREA_ADDR(addr)                           \
+     (((addr) & ~XEN_PT_LEVEL_MASK(1)) |                    \
+      (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
+
+#define TEMPORARY_XEN_VIRT_START    TEMPORARY_AREA_ADDR(XEN_VIRT_START)
+
+#else /* ARM_64 */
+
+#define IDENTITY_MAPPING_AREA_NR_L0  4
+
+#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
+#define VMAP_VIRT_SIZE   GB(1)
+
+#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
+#define FRAMETABLE_SIZE        GB(32)
+#define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
+
+#define DIRECTMAP_VIRT_START   SLOT0(256)
+#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))
+#define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
+
+#define XENHEAP_VIRT_START     directmap_virt_start
+
+#define HYPERVISOR_VIRT_END    DIRECTMAP_VIRT_END
+
+#endif
+
+#endif /* __ARM_MMU_LAYOUT_H__ */
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


