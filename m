Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE4668B74
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:35:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476542.738872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCip-0006C5-HF; Fri, 13 Jan 2023 05:35:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476542.738872; Fri, 13 Jan 2023 05:35:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCip-00068S-Ak; Fri, 13 Jan 2023 05:35:23 +0000
Received: by outflank-mailman (input) for mailman id 476542;
 Fri, 13 Jan 2023 05:35:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCfJ-0005sJ-L5
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 91180261-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:31:44 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8100DFEC;
 Thu, 12 Jan 2023 21:32:26 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 04C333F587;
 Thu, 12 Jan 2023 21:31:41 -0800 (PST)
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
X-Inumbo-ID: 91180261-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 40/40] xen/mpu: add Kconfig option to enable Armv8-R AArch64 support
Date: Fri, 13 Jan 2023 13:29:13 +0800
Message-Id: <20230113052914.3845596-41-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a Kconfig option to enable Armv8-R64 architecture
support. STATIC_MEMORY and HAS_MPU will be selected by
ARM_V8R by default, because Armv8-R64 only has PMSAv8-64 on secure-EL2
and only supports statically configured system.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Kconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ee942a33bc..dc93b805a6 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -9,6 +9,15 @@ config ARM_64
 	select 64BIT
 	select HAS_FAST_MULTIPLY
 
+config ARM_V8R
+       bool "ARMv8-R AArch64 architecture support (UNSUPPORTED)" if UNSUPPORTED
+       default n
+       select STATIC_MEMORY
+       depends on ARM_64
+       help
+         This option enables Armv8-R profile for Arm64. Enabling this option
+         results in selecting MPU.
+
 config ARM
 	def_bool y
 	select HAS_ALTERNATIVE if !ARM_V8R
@@ -68,6 +77,10 @@ config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
         depends on GICV3 && !NEW_VGIC && !ARM_32
 
+config HAS_MPU
+	bool "Protected Memory System Architecture"
+	depends on ARM_V8R
+
 config HVM
         def_bool y
 
-- 
2.25.1


