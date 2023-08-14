Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36FB77B062
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 06:26:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583073.913150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVP9y-0005Jv-FW; Mon, 14 Aug 2023 04:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583073.913150; Mon, 14 Aug 2023 04:26:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVP9y-0005FL-A0; Mon, 14 Aug 2023 04:26:30 +0000
Received: by outflank-mailman (input) for mailman id 583073;
 Mon, 14 Aug 2023 04:26:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M3t=D7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qVP9w-0002FE-Oh
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 04:26:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bc838aec-3a5a-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 06:26:28 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A7B41063;
 Sun, 13 Aug 2023 21:27:10 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D5F703F64C;
 Sun, 13 Aug 2023 21:26:24 -0700 (PDT)
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
X-Inumbo-ID: bc838aec-3a5a-11ee-b288-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v5 08/13] xen/arm: Fold pmap and fixmap into MMU system
Date: Mon, 14 Aug 2023 12:25:31 +0800
Message-Id: <20230814042536.878720-9-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814042536.878720-1-Henry.Wang@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
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
v5:
- Rebase on top of xen/arm: Introduce CONFIG_MMU Kconfig option
v4:
- Rework "[v3,11/52] xen/arm: mmu: fold FIXMAP into MMU system",
  change the order of this patch and avoid introducing stubs.
---
 xen/arch/arm/Kconfig              | 2 +-
 xen/arch/arm/include/asm/fixmap.h | 7 +------
 xen/arch/arm/mmu/mm.c             | 7 +++++++
 3 files changed, 9 insertions(+), 7 deletions(-)

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


