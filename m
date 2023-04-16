Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C966E394A
	for <lists+xen-devel@lfdr.de>; Sun, 16 Apr 2023 16:33:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521563.810327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po3Qf-0004t8-Pu; Sun, 16 Apr 2023 14:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521563.810327; Sun, 16 Apr 2023 14:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1po3Qf-0004qC-Mz; Sun, 16 Apr 2023 14:32:33 +0000
Received: by outflank-mailman (input) for mailman id 521563;
 Sun, 16 Apr 2023 14:32:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1po3Qd-0004kg-QI
 for xen-devel@lists.xenproject.org; Sun, 16 Apr 2023 14:32:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po3Qd-0004yt-EG; Sun, 16 Apr 2023 14:32:31 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1po3Qd-0008OW-5c; Sun, 16 Apr 2023 14:32:31 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=PrRA+a+hArk7xUtxnyazbLpJIuTfGr9tkFt/D2rBWsA=; b=pI6H98/Eb5rWMeWAc7MEAK1S2+
	yOC08oZ3byjikv3015NjSxPj3tSTwhTZBVS9Ayh2iDREcWeEzXdTifJnBrx9U4y1xT5jlW5LQYBt5
	5Fm3aWUtF7NnBJOMi9EMr7M2RM4Y/gS1xjo8coNnPHRFCXCvOQ2PY6RJpxFgooMwc1Yk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 2/5] xen/arm64: Rework the memory layout
Date: Sun, 16 Apr 2023 15:32:08 +0100
Message-Id: <20230416143211.72227-3-julien@xen.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230416143211.72227-1-julien@xen.org>
References: <20230416143211.72227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Xen is currently not fully compliant with the Arm Arm because it will
switch the TTBR with the MMU on.

In order to be compliant, we need to disable the MMU before
switching the TTBR. The implication is the page-tables should
contain an identity mapping of the code switching the TTBR.

In most of the case we expect Xen to be loaded in low memory. I am aware
of one platform (i.e AMD Seattle) where the memory start above 512GB.
To give us some slack, consider that Xen may be loaded in the first 2TB
of the physical address space.

The memory layout is reshuffled to keep the first four slots of the zeroeth
level free. All the regions currently in L0 slot 0 will not be part of
slot 4 (2TB). This requires a slight tweak of the boot code because
XEN_VIRT_START (2TB + 2MB) cannot be used as an immediate.

This reshuffle will make trivial to create a 1:1 mapping when Xen is
loaded below 2TB.

Lastly, take the opportunity to check a compile time if any of the
regions may overlap with the reserved area for identity mapping.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----
    Changes in v7:
        - Remove all tags
        - Add BUILD_BUG_ON()s
        - Don't forget to update FRAMETABLE_VIRT_START and
          VMAP_VIRT_START

    Changes in v6:
        - Correct the BUILD_BUG_ON(), Xen virtual address should be
          above 2TB (i.e. slot0 > 4).
        - Add Bertrand's reviewed-by

    Changes in v5:
        - We are reserving 4 slots rather than 2.
        - Fix the addresses in the layout comment.
        - Fix the size of the region in the layout comment
        - Add Luca's tested-by (the reviewed-by was not added
          because of the changes requested by Michal)
        - Add Michal's reviewed-by

    Changes in v4:
        - Correct the documentation
        - The start address is 2TB, so slot0 is 4 not 2.

    Changes in v2:
        - Reword the commit message
        - Load Xen at 2TB + 2MB
        - Update the documentation to reflect the new layout
---
 xen/arch/arm/arm64/head.S         |  3 ++-
 xen/arch/arm/include/asm/config.h | 38 +++++++++++++++++++++----------
 xen/arch/arm/mm.c                 | 23 +++++++++++++++----
 3 files changed, 46 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 4a3f87117c83..663f5813b12e 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -607,7 +607,8 @@ create_page_tables:
          * need an additional 1:1 mapping, the virtual mapping will
          * suffice.
          */
-        cmp   x19, #XEN_VIRT_START
+        ldr   x0, =XEN_VIRT_START
+        cmp   x19, x0
         bne   1f
         ret
 1:
diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 5df0e4c4959b..2cfe5e480256 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -72,16 +72,13 @@
 #include <xen/page-size.h>
 
 /*
- * Common ARM32 and ARM64 layout:
+ * ARM32 layout:
  *   0  -   2M   Unmapped
  *   2M -   4M   Xen text, data, bss
  *   4M -   6M   Fixmap: special-purpose 4K mapping slots
  *   6M -  10M   Early boot mapping of FDT
  *   10M - 12M   Livepatch vmap (if compiled in)
  *
- * ARM32 layout:
- *   0  -  12M   <COMMON>
- *
  *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
  * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
  *                    space
@@ -90,14 +87,23 @@
  *   2G -   4G   Domheap: on-demand-mapped
  *
  * ARM64 layout:
- * 0x0000000000000000 - 0x0000007fffffffff (512GB, L0 slot [0])
- *   0  -  12M   <COMMON>
+ * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
+ *
+ *  Reserved to identity map Xen
+ *
+ * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4]
+ *  (Relative offsets)
+ *   0  -   2M   Unmapped
+ *   2M -   4M   Xen text, data, bss
+ *   4M -   6M   Fixmap: special-purpose 4K mapping slots
+ *   6M -  10M   Early boot mapping of FDT
+ *  10M -  12M   Livepatch vmap (if compiled in)
  *
  *   1G -   2G   VMAP: ioremap and early_ioremap
  *
  *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
  *
- * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
+ * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
  *  Unused
  *
  * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
@@ -107,7 +113,17 @@
  *  Unused
  */
 
+#ifdef CONFIG_ARM_32
 #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
+#else
+
+#define SLOT0_ENTRY_BITS  39
+#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
+#define SLOT0_ENTRY_SIZE  SLOT0(1)
+
+#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
+#endif
+
 #define XEN_VIRT_SIZE           _AT(vaddr_t, MB(2))
 
 #define FIXMAP_VIRT_START       (XEN_VIRT_START + XEN_VIRT_SIZE)
@@ -163,14 +179,12 @@
 
 #else /* ARM_64 */
 
-#define SLOT0_ENTRY_BITS  39
-#define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
-#define SLOT0_ENTRY_SIZE  SLOT0(1)
+#define IDENTITY_MAPPING_AREA_NR_L0  4
 
-#define VMAP_VIRT_START  GB(1)
+#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
 #define VMAP_VIRT_SIZE   GB(1)
 
-#define FRAMETABLE_VIRT_START  GB(32)
+#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
 #define FRAMETABLE_SIZE        GB(32)
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
 
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b99806af996c..1d09d61dd922 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -153,7 +153,19 @@ static void __init __maybe_unused build_assertions(void)
 #endif
     /* Page table structure constraints */
 #ifdef CONFIG_ARM_64
-    BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
+    /*
+     * The first few slots of the L0 table is reserved for the identity
+     * mapping. Check that none of the other regions are overlapping
+     * with it.
+     */
+#define CHECK_OVERLAP_WITH_IDMAP(virt) \
+    BUILD_BUG_ON(zeroeth_table_offset(virt) < IDENTITY_MAPPING_AREA_NR_L0)
+
+    CHECK_OVERLAP_WITH_IDMAP(XEN_VIRT_START);
+    CHECK_OVERLAP_WITH_IDMAP(VMAP_VIRT_START);
+    CHECK_OVERLAP_WITH_IDMAP(FRAMETABLE_VIRT_START);
+    CHECK_OVERLAP_WITH_IDMAP(DIRECTMAP_VIRT_START);
+#undef CHECK_OVERLAP_WITH_IDMAP
 #endif
     BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
 #ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
@@ -496,10 +508,11 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     phys_offset = boot_phys_offset;
 
 #ifdef CONFIG_ARM_64
-    p = (void *) xen_pgtable;
-    p[0] = pte_of_xenaddr((uintptr_t)xen_first);
-    p[0].pt.table = 1;
-    p[0].pt.xn = 0;
+    pte = pte_of_xenaddr((uintptr_t)xen_first);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+    xen_pgtable[zeroeth_table_offset(XEN_VIRT_START)] = pte;
+
     p = (void *) xen_first;
 #else
     p = (void *) cpu0_pgtable;
-- 
2.39.2


