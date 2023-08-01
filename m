Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA4576A7A4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 05:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573583.898444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgMj-0003dO-Pd; Tue, 01 Aug 2023 03:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573583.898444; Tue, 01 Aug 2023 03:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgMj-0003b6-LY; Tue, 01 Aug 2023 03:48:09 +0000
Received: by outflank-mailman (input) for mailman id 573583;
 Tue, 01 Aug 2023 03:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUf/=DS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qQgJo-00076X-By
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 03:45:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id cd9379c6-301d-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 05:45:05 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 916E911FB;
 Mon, 31 Jul 2023 20:45:48 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 431153F59C;
 Mon, 31 Jul 2023 20:45:01 -0700 (PDT)
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
X-Inumbo-ID: cd9379c6-301d-11ee-8613-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v4 08/13] xen/arm: Fold pmap and fixmap into MMU system
Date: Tue,  1 Aug 2023 11:44:14 +0800
Message-Id: <20230801034419.2047541-9-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230801034419.2047541-1-Henry.Wang@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <penny.zheng@arm.com>

fixmap and pmap are MMU-specific features, so fold them to MMU system.
Do the folding for pmap by moving the HAS_PMAP Kconfig selection under
HAS_MMU. Do the folding for fixmap by moving the implementation of
virt_to_fix() to mmu/mm.c, so that unnecessary stubs can be avoided.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v4:
- Rework "[v3,11/52] xen/arm: mmu: fold FIXMAP into MMU system",
  change the order of this patch and avoid introducing stubs.
---
 xen/arch/arm/Kconfig              | 2 +-
 xen/arch/arm/include/asm/fixmap.h | 7 +------
 xen/arch/arm/mmu/mm.c             | 7 +++++++
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 0e38e9ba17..1b60a938c2 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,7 +15,6 @@ config ARM
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_PDX
-	select HAS_PMAP
 	select HAS_UBSAN
 	select IOMMU_FORCE_PT_SHARE
 
@@ -71,6 +70,7 @@ choice
 
 config HAS_MMU
 	bool "MMU for a VMSA system"
+	select HAS_PMAP
 endchoice
 
 source "arch/Kconfig"
diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index 734eb9b1d4..5d5de6995a 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -36,12 +36,7 @@ extern void clear_fixmap(unsigned int map);
 
 #define fix_to_virt(slot) ((void *)FIXMAP_ADDR(slot))
 
-static inline unsigned int virt_to_fix(vaddr_t vaddr)
-{
-    BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
-
-    return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
-}
+extern unsigned int virt_to_fix(vaddr_t vaddr);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
index b70982e9d6..1d6267e6c5 100644
--- a/xen/arch/arm/mmu/mm.c
+++ b/xen/arch/arm/mmu/mm.c
@@ -1136,6 +1136,13 @@ int __init populate_pt_range(unsigned long virt, unsigned long nr_mfns)
     return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
 }
 
+unsigned int virt_to_fix(vaddr_t vaddr)
+{
+    BUG_ON(vaddr >= FIXADDR_TOP || vaddr < FIXADDR_START);
+
+    return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


