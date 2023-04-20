Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425006E929D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524078.814700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSTL-0004U3-1h; Thu, 20 Apr 2023 11:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524078.814700; Thu, 20 Apr 2023 11:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSTK-0004Rs-Te; Thu, 20 Apr 2023 11:29:06 +0000
Received: by outflank-mailman (input) for mailman id 524078;
 Thu, 20 Apr 2023 11:29:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PE5v=AL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ppSQu-0006Vv-V6
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:26:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 35dbd8a5-df6e-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 13:26:36 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9C751480;
 Thu, 20 Apr 2023 04:27:19 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6F9433F587;
 Thu, 20 Apr 2023 04:26:33 -0700 (PDT)
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
X-Inumbo-ID: 35dbd8a5-df6e-11ed-b21f-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v3 16/17] xen/arm: Provide Kconfig options for Arm to enable NUMA
Date: Thu, 20 Apr 2023 19:25:20 +0800
Message-Id: <20230420112521.3272732-17-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230420112521.3272732-1-Henry.Wang@arm.com>
References: <20230420112521.3272732-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Arm platforms support both ACPI and device tree. We don't
want users to select device tree NUMA or ACPI NUMA manually.
We hope users can just enable NUMA for Arm, and device tree
NUMA and ACPI NUMA can be selected depends on device tree
feature and ACPI feature status automatically. In this case,
these two kinds of NUMA support code can be co-exist in one
Xen binary. Xen can check feature flags to decide using
device tree or ACPI as NUMA based firmware.

So in this patch, we introduce a generic option:
CONFIG_ARM_NUMA for users to enable NUMA for Arm.
And one CONFIG_DEVICE_TREE_NUMA option for ARM_NUMA
to select when HAS_DEVICE_TREE option is enabled.
Once when ACPI NUMA for Arm is supported, ACPI_NUMA
can be selected here too.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v2 -> v3:
1. No change.
v1 -> v2:
1. Remove the condition of selecting DEVICE_TREE_NUMA.
---
 xen/arch/arm/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..e751ad50d1 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -39,6 +39,17 @@ config ACPI
 config ARM_EFI
 	bool
 
+config ARM_NUMA
+	bool "Arm NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)" if UNSUPPORTED
+	depends on HAS_DEVICE_TREE
+	select DEVICE_TREE_NUMA
+	help
+	  Enable Non-Uniform Memory Access (NUMA) for Arm architecutres
+
+config DEVICE_TREE_NUMA
+	bool
+	select NUMA
+
 config GICV3
 	bool "GICv3 driver"
 	depends on !NEW_VGIC
-- 
2.25.1


