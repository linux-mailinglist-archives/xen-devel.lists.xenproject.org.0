Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E55277B06C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 06:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583102.913192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVPAv-0007rx-6C; Mon, 14 Aug 2023 04:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583102.913192; Mon, 14 Aug 2023 04:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVPAu-0007gD-Us; Mon, 14 Aug 2023 04:27:28 +0000
Received: by outflank-mailman (input) for mailman id 583102;
 Mon, 14 Aug 2023 04:27:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M3t=D7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qVPAD-0002UD-Fl
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 04:26:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c5ce37fc-3a5a-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 06:26:43 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D93F2F4;
 Sun, 13 Aug 2023 21:27:25 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 10D223F64C;
 Sun, 13 Aug 2023 21:26:39 -0700 (PDT)
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
X-Inumbo-ID: c5ce37fc-3a5a-11ee-8613-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v5 12/13] xen/arm: mmu: relocate copy_from_paddr() to setup.c
Date: Mon, 14 Aug 2023 12:25:35 +0800
Message-Id: <20230814042536.878720-13-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814042536.878720-1-Henry.Wang@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

Function copy_from_paddr() is defined in asm/setup.h, so it is better
to be implemented in setup.c.

Current copy_from_paddr() implementation is mmu-specific, so this
commit moves copy_from_paddr() into mmu/setup.c, and it is also
benefical for us to implement MPU version of copy_from_paddr() in
later commit.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v5:
- No change
v4:
- No change
v3:
- new commit
---
 xen/arch/arm/kernel.c    | 27 ---------------------------
 xen/arch/arm/mmu/setup.c | 27 +++++++++++++++++++++++++++
 2 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 508c54824d..0d433a32e7 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -41,33 +41,6 @@ struct minimal_dtb_header {
 
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
index e05cca3f86..889ada6b87 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -329,6 +329,33 @@ void __init setup_mm(void)
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


