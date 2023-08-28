Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF60678A3FC
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 03:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591284.923695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaREn-0007kl-OP; Mon, 28 Aug 2023 01:40:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591284.923695; Mon, 28 Aug 2023 01:40:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaREn-0007iI-KS; Mon, 28 Aug 2023 01:40:17 +0000
Received: by outflank-mailman (input) for mailman id 591284;
 Mon, 28 Aug 2023 01:40:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwb3=EN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qaR8A-0000xW-Ub
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 01:33:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id e17605c1-4542-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 03:33:25 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEDAA2F4;
 Sun, 27 Aug 2023 18:34:04 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A631C3F740;
 Sun, 27 Aug 2023 18:33:21 -0700 (PDT)
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
X-Inumbo-ID: e17605c1-4542-11ee-9b0c-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v6 11/13] xen/arm: Fold pmap and fixmap into MMU system
Date: Mon, 28 Aug 2023 09:32:22 +0800
Message-Id: <20230828013224.669433-12-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828013224.669433-1-Henry.Wang@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fixmap and pmap are MMU-specific features, so fold them to the
MMU system. Do the folding for pmap by moving the HAS_PMAP Kconfig
selection under MMU. Since none of the definitions in asm/fixmap.h
actually makes sense for the MPU, so do the folding for fixmap by
limiting the inclusion of asm/fixmap.h for MPU code when necessary.
To guarantee that, moving the implementation of copy_from_paddr()
from kernel.c to mmu/setup.c, so that inclusion of asm/fixmap.h in
the kernel.c can be dropped.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v6:
- Rework original patch:
  [v5,08/13] xen/arm: Fold pmap and fixmap into MMU system
  and fold in the original patch:
  [v5,12/13] xen/arm: mmu: relocate copy_from_paddr() to setup.c
---
 xen/arch/arm/Kconfig     |  2 +-
 xen/arch/arm/kernel.c    | 28 ----------------------------
 xen/arch/arm/mmu/setup.c | 27 +++++++++++++++++++++++++++
 3 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index eb0413336b..8a7b79b4b5 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,7 +15,6 @@ config ARM
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_PDX
-	select HAS_PMAP
 	select HAS_UBSAN
 	select IOMMU_FORCE_PT_SHARE
 
@@ -61,6 +60,7 @@ config PADDR_BITS
 
 config MMU
 	def_bool y
+	select HAS_PMAP
 
 source "arch/Kconfig"
 
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 508c54824d..bc3e5bd6f9 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -16,7 +16,6 @@
 #include <xen/vmap.h>
 
 #include <asm/byteorder.h>
-#include <asm/fixmap.h>
 #include <asm/kernel.h>
 #include <asm/setup.h>
 
@@ -41,33 +40,6 @@ struct minimal_dtb_header {
 
 #define DTB_MAGIC 0xd00dfeedU
 
-/**
- * copy_from_paddr - copy data from a physical address
- * @dst: destination virtual address
- * @paddr: source physical address
- * @len: length to copy
- */
-void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
-{
-    void *src = (void *)FIXMAP_ADDR(FIXMAP_MISC);
-
-    while (len) {
-        unsigned long l, s;
-
-        s = paddr & (PAGE_SIZE-1);
-        l = min(PAGE_SIZE - s, len);
-
-        set_fixmap(FIXMAP_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_WC);
-        memcpy(dst, src + s, l);
-        clean_dcache_va_range(dst, l);
-        clear_fixmap(FIXMAP_MISC);
-
-        paddr += l;
-        dst += l;
-        len -= l;
-    }
-}
-
 static void __init place_modules(struct kernel_info *info,
                                  paddr_t kernbase, paddr_t kernend)
 {
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index eb0dda00dc..c9a4e8f700 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -335,6 +335,33 @@ void free_init_memory(void)
     printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
 }
 
+/**
+ * copy_from_paddr - copy data from a physical address
+ * @dst: destination virtual address
+ * @paddr: source physical address
+ * @len: length to copy
+ */
+void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
+{
+    void *src = (void *)FIXMAP_ADDR(FIXMAP_MISC);
+
+    while (len) {
+        unsigned long l, s;
+
+        s = paddr & (PAGE_SIZE-1);
+        l = min(PAGE_SIZE - s, len);
+
+        set_fixmap(FIXMAP_MISC, maddr_to_mfn(paddr), PAGE_HYPERVISOR_WC);
+        memcpy(dst, src + s, l);
+        clean_dcache_va_range(dst, l);
+        clear_fixmap(FIXMAP_MISC);
+
+        paddr += l;
+        dst += l;
+        len -= l;
+    }
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


