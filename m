Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCDB7D285E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 04:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620930.966830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qukSW-0003Di-QN; Mon, 23 Oct 2023 02:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620930.966830; Mon, 23 Oct 2023 02:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qukSW-00038U-M7; Mon, 23 Oct 2023 02:14:24 +0000
Received: by outflank-mailman (input) for mailman id 620930;
 Mon, 23 Oct 2023 02:14:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JdWI=GF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qukSU-0001F1-Vu
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 02:14:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e1289e33-7149-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 04:14:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4188C2F4;
 Sun, 22 Oct 2023 19:15:02 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 64C103F738;
 Sun, 22 Oct 2023 19:14:18 -0700 (PDT)
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
X-Inumbo-ID: e1289e33-7149-11ee-98d5-6d05b1d4d9a1
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 6/8] xen/arm: Fold pmap and fixmap into MMU system
Date: Mon, 23 Oct 2023 10:13:43 +0800
Message-Id: <20231023021345.1731436-7-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231023021345.1731436-1-Henry.Wang@arm.com>
References: <20231023021345.1731436-1-Henry.Wang@arm.com>
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

Take the opportunity to add a missing space before and after '-' in
"s = paddr & (PAGE_SIZE-1);" of copy_from_paddr().

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v8:
- Add a missing space before/after '-' in "s = paddr & (PAGE_SIZE-1);"
  of copy_from_paddr(), mention this change in commit message.
- Add Julien's Reviewed-by tag.
v7:
- No change.
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
index 2939db429b..7b5b0c0c05 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -14,7 +14,6 @@ config ARM
 	select HAS_ALTERNATIVE
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
-	select HAS_PMAP
 	select HAS_UBSAN
 	select IOMMU_FORCE_PT_SHARE
 
@@ -60,6 +59,7 @@ config PADDR_BITS
 
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
index c2df976ab2..a5a9b538ff 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -339,6 +339,33 @@ void free_init_memory(void)
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
+        s = paddr & (PAGE_SIZE - 1);
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


