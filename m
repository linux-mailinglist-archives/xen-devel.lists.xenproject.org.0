Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927F37F0AC7
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 04:06:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636411.991898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4ubb-0001JX-N2; Mon, 20 Nov 2023 03:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636411.991898; Mon, 20 Nov 2023 03:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4ubb-0001Gb-Jg; Mon, 20 Nov 2023 03:05:47 +0000
Received: by outflank-mailman (input) for mailman id 636411;
 Mon, 20 Nov 2023 03:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0Aw=HB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r4uRx-0007WE-5g
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 02:55:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4e1f4068-8750-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 03:55:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02B0B1042;
 Sun, 19 Nov 2023 18:56:33 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5DB443F6C4;
 Sun, 19 Nov 2023 18:55:44 -0800 (PST)
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
X-Inumbo-ID: 4e1f4068-8750-11ee-9b0e-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v6 16/17] xen/arm: Provide Kconfig options for Arm to enable NUMA
Date: Mon, 20 Nov 2023 10:54:30 +0800
Message-Id: <20231120025431.14845-17-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120025431.14845-1-Henry.Wang@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
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
v5 -> v6:
- Rebase on top of staging without code changes.
v1 -> v5:
- Remove the condition of selecting DEVICE_TREE_NUMA.
---
 xen/arch/arm/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2939db429b..5ce6b20cf2 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -80,6 +80,17 @@ config ARM_EFI
 	  UEFI firmware. A UEFI stub is provided to allow Xen to
 	  be booted as an EFI application.
 
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


