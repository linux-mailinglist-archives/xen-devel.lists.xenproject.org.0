Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78241668B86
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476616.739024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjg-0004yd-T7; Fri, 13 Jan 2023 05:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476616.739024; Fri, 13 Jan 2023 05:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjg-0004pb-Js; Fri, 13 Jan 2023 05:36:16 +0000
Received: by outflank-mailman (input) for mailman id 476616;
 Fri, 13 Jan 2023 05:36:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCer-0005sP-Th
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7fe06f02-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:31:16 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7A0CFEC;
 Thu, 12 Jan 2023 21:31:57 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F18763F587;
 Thu, 12 Jan 2023 21:31:11 -0800 (PST)
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
X-Inumbo-ID: 7fe06f02-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 31/40] xen/mpu: disable FIXMAP in MPU system
Date: Fri, 13 Jan 2023 13:29:04 +0800
Message-Id: <20230113052914.3845596-32-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FIXMAP in MMU system is used to do special-purpose 4K mapping, like
mapping early UART, temporarily mapping source codes for copy and paste
(copy_from_paddr), ect. As there is no VMSA in MPU system, we do not
support FIXMAP in MPU system.

We deine !CONFIG_HAS_FIXMAP to provide empty stubbers for MPU system

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Kconfig              |  3 ++-
 xen/arch/arm/include/asm/fixmap.h | 28 +++++++++++++++++++++++++---
 xen/common/Kconfig                |  3 +++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 9230c8b885..91491341c4 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -13,9 +13,10 @@ config ARM
 	def_bool y
 	select HAS_ALTERNATIVE if !ARM_V8R
 	select HAS_DEVICE_TREE
+	select HAS_FIXMAP if !ARM_V8R
 	select HAS_PASSTHROUGH
 	select HAS_PDX
-	select HAS_PMAP
+	select HAS_PMAP if !ARM_V8R
 	select IOMMU_FORCE_PT_SHARE
 	select HAS_VMAP if !ARM_V8R
 
diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index d0c9a52c8c..f0f4eb57ac 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -4,9 +4,6 @@
 #ifndef __ASM_FIXMAP_H
 #define __ASM_FIXMAP_H
 
-#include <xen/acpi.h>
-#include <xen/pmap.h>
-
 /* Fixmap slots */
 #define FIXMAP_CONSOLE  0  /* The primary UART */
 #define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
@@ -22,6 +19,11 @@
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_HAS_FIXMAP
+
+#include <xen/acpi.h>
+#include <xen/pmap.h>
+
 /*
  * Direct access to xen_fixmap[] should only happen when {set,
  * clear}_fixmap() is unusable (e.g. where we would end up to
@@ -43,6 +45,26 @@ static inline unsigned int virt_to_fix(vaddr_t vaddr)
     return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
 }
 
+#else /* !CONFIG_HAS_FIXMAP */
+
+static inline void set_fixmap(unsigned int map, mfn_t mfn,
+                              unsigned int attributes)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void clear_fixmap(unsigned int map)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline unsigned int virt_to_fix(vaddr_t vaddr)
+{
+    ASSERT_UNREACHABLE();
+    return -EINVAL;
+}
+#endif /* !CONFIG_HAS_FIXMAP */
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_FIXMAP_H */
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index ba16366a4b..680dc6f59c 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -43,6 +43,9 @@ config HAS_EX_TABLE
 config HAS_FAST_MULTIPLY
 	bool
 
+config HAS_FIXMAP
+	bool
+
 config HAS_IOPORTS
 	bool
 
-- 
2.25.1


