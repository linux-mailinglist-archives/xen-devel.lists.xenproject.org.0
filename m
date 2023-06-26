Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AE273D684
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555075.866793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5X-00085f-7W; Mon, 26 Jun 2023 03:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555075.866793; Mon, 26 Jun 2023 03:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5V-0007oh-Qu; Mon, 26 Jun 2023 03:40:25 +0000
Received: by outflank-mailman (input) for mailman id 555075;
 Mon, 26 Jun 2023 03:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd1D-0000HH-Em
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9006f57d-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:35:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CA722F4;
 Sun, 25 Jun 2023 20:36:41 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8C04B3F64C;
 Sun, 25 Jun 2023 20:35:54 -0700 (PDT)
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
X-Inumbo-ID: 9006f57d-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 16/52] xen/mmu: relocate copy_from_paddr into setup.c
Date: Mon, 26 Jun 2023 11:34:07 +0800
Message-Id: <20230626033443.2943270-17-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function copy_from_paddr() is defined in asm/setup.h, so it is better to
be implemented in setup.c.
Current copy_from_paddr() implementation is mmu-specific, so this commit moves
copy_from_paddr() into mmu/setup.c, and it is also benefical for us to
implement MPU version of copy_from_paddr() in later commit.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- new commit
---
 xen/arch/arm/kernel.c    | 27 ---------------------------
 xen/arch/arm/mmu/setup.c | 27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index ca5318515e..2e64612ab3 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -41,33 +41,6 @@ struct minimal_dtb_header {
 
 #define DTB_MAGIC 0xd00dfeed
 
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
index f4de0cb29d..a7590a2443 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -342,6 +342,33 @@ void __init setup_mm(void)
 }
 #endif
 
+/*
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


