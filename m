Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B425173D661
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554957.866453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd0Z-0008T8-HZ; Mon, 26 Jun 2023 03:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554957.866453; Mon, 26 Jun 2023 03:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd0Z-0008QS-Ea; Mon, 26 Jun 2023 03:35:19 +0000
Received: by outflank-mailman (input) for mailman id 554957;
 Mon, 26 Jun 2023 03:35:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd0X-0007ej-N1
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 779d4bbd-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:35:16 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B93B1FB;
 Sun, 25 Jun 2023 20:36:00 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DFA903F64C;
 Sun, 25 Jun 2023 20:35:13 -0700 (PDT)
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
X-Inumbo-ID: 779d4bbd-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 03/52] xen/arm: add an option to define Xen start address for Armv8-R
Date: Mon, 26 Jun 2023 11:33:54 +0800
Message-Id: <20230626033443.2943270-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

On Armv8-A, Xen has a fixed virtual start address (link address
too) for all Armv8-A platforms. In an MMU based system, Xen can
map its loaded address to this virtual start address. So, on
Armv8-A platforms, the Xen start address does not need to be
configurable. But on Armv8-R platforms, there is no MMU to map
loaded address to a fixed virtual address and different platforms
will have very different address space layout. So Xen cannot use
a fixed physical address on MPU based system and need to have it
configurable.

In this patch we introduce one Kconfig option for users to define
the default Xen start address for Armv8-R. Users can enter the
address in config time, or select the tailored platform config
file from arch/arm/configs.

And as we introduced Armv8-R to Xen, that means the existed Arm64
MMU based platforms should not be listed in Armv8-R platform
list, so we add !HAS_MPU dependency for these platforms.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v1 -> v2:
1. Remove the platform header fvp_baser.h.
2. Remove the default start address for fvp_baser64.
3. Remove the description of default address from commit log.
4. Change HAS_MPU to ARM_V8R for Xen start address dependency.
   No matter Arm-v8r board has MPU or not, it always need to
   specify the start address.
---
v3:
1. Remove unrelated change of "CONFIG_FVP_BASER"
2. Change ARM_V8R to HAS_MPU for Xen start address dependency
---
 xen/arch/arm/Kconfig           | 8 ++++++++
 xen/arch/arm/platforms/Kconfig | 8 +++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 70fdc2ba63..ff17345cdb 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -181,6 +181,14 @@ config TEE
 	  This option enables generic TEE mediators support. It allows guests
 	  to access real TEE via one of TEE mediators implemented in XEN.
 
+config XEN_START_ADDRESS
+	hex "Xen start address: keep default to use platform defined address"
+	default 0
+	depends on HAS_MPU
+	help
+	  This option allows to set the customized address at which Xen will be
+	  linked on MPU systems. This address must be aligned to a page size.
+
 source "arch/arm/tee/Kconfig"
 
 config STATIC_SHM
diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index c93a6b2756..75af48b5f9 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -1,6 +1,7 @@
 choice
 	prompt "Platform Support"
 	default ALL_PLAT
+	default NO_PLAT if HAS_MPU
 	---help---
 	Choose which hardware platform to enable in Xen.
 
@@ -8,13 +9,14 @@ choice
 
 config ALL_PLAT
 	bool "All Platforms"
+	depends on !HAS_MPU
 	---help---
 	Enable support for all available hardware platforms. It doesn't
 	automatically select any of the related drivers.
 
 config QEMU
 	bool "QEMU aarch virt machine support"
-	depends on ARM_64
+	depends on ARM_64 && !HAS_MPU
 	select GICV3
 	select HAS_PL011
 	---help---
@@ -23,7 +25,7 @@ config QEMU
 
 config RCAR3
 	bool "Renesas RCar3 support"
-	depends on ARM_64
+	depends on ARM_64 && !HAS_MPU
 	select HAS_SCIF
 	select IPMMU_VMSA
 	---help---
@@ -31,7 +33,7 @@ config RCAR3
 
 config MPSOC
 	bool "Xilinx Ultrascale+ MPSoC support"
-	depends on ARM_64
+	depends on ARM_64 && !HAS_MPU
 	select HAS_CADENCE_UART
 	select ARM_SMMU
 	---help---
-- 
2.25.1


