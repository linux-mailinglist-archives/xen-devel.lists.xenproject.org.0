Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D7073D66C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:39:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555004.866564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4q-0005tY-HJ; Mon, 26 Jun 2023 03:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555004.866564; Mon, 26 Jun 2023 03:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4q-0005jc-4l; Mon, 26 Jun 2023 03:39:44 +0000
Received: by outflank-mailman (input) for mailman id 555004;
 Mon, 26 Jun 2023 03:39:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd32-0007ej-8a
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:37:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d3e01bd9-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:37:51 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 301021FB;
 Sun, 25 Jun 2023 20:38:35 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E9333F64C;
 Sun, 25 Jun 2023 20:37:48 -0700 (PDT)
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
X-Inumbo-ID: d3e01bd9-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 52/52] xen/arm: add Kconfig option CONFIG_HAS_MPU to enable MPU system support
Date: Mon, 26 Jun 2023 11:34:43 +0800
Message-Id: <20230626033443.2943270-53-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a Kconfig option CONFIG_HAS_MPU to enable MPU architecture
support. STATIC_MEMORY, ARCH_MAP_DOMAIN_PAGE and ARM_SECURE_STATE will
be selected by MPU system by default. Also, features like, ARM_EFI, are
not supported right now.

Current MPU system design is only for ARM 64-bit platform.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- select ARCH_MAP_DOMAIN_PAGE and ARM_SECURE_STATE
- remove platform-specific config: CONFIG_ARM_V8R
---
 xen/arch/arm/Kconfig | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 3f67aacbbf..2acdf39ec8 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -62,6 +62,7 @@ source "arch/Kconfig"
 config HAS_MMU
 	bool "Memory Management Unit support in a VMSA system"
 	default y
+	depends on !HAS_MPU
 	select HAS_PAGING_MEMPOOL
 	select HAS_PMAP
 	select HAS_VMAP
@@ -70,6 +71,17 @@ config HAS_MMU
 	  a memory system through a set of virtual to physical address mappings and associated memory
 	  properties held in memory-mapped tables known as translation tables.
 
+config HAS_MPU
+	bool "Memory Protection Unit support in a PMSA system"
+	default n
+	depends on ARM_64
+	select ARCH_MAP_DOMAIN_PAGE
+	select ARM_SECURE_STATE
+	select STATIC_MEMORY
+	help
+	  The PMSA is based on a Memory Protection Unit (MPU), which provides a much simpler
+	  memory protection scheme than the MMU based VMSA.
+
 config HAS_FIXMAP
 	bool "Provide special-purpose 4K mapping slots in a VMSA"
 	depends on HAS_MMU
@@ -85,7 +97,7 @@ config ACPI
 
 config ARM_EFI
 	bool "UEFI boot service support"
-	depends on ARM_64
+	depends on ARM_64 && !HAS_MPU
 	default y
 	help
 	  This option provides support for boot services through
-- 
2.25.1


