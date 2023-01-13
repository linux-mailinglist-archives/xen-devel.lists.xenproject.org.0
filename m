Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E86668B52
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:30:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476499.738741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdZ-00073l-AY; Fri, 13 Jan 2023 05:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476499.738741; Fri, 13 Jan 2023 05:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdZ-0006zP-6T; Fri, 13 Jan 2023 05:29:57 +0000
Received: by outflank-mailman (input) for mailman id 476499;
 Fri, 13 Jan 2023 05:29:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCdW-0005sP-M0
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:29:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4e16b03c-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:29:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07767FEC;
 Thu, 12 Jan 2023 21:30:34 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 884413F587;
 Thu, 12 Jan 2023 21:29:49 -0800 (PST)
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
X-Inumbo-ID: 4e16b03c-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Jiamei . Xie" <jiamei.xie@arm.com>
Subject: [PATCH v2 04/40] xen/arm: add an option to define Xen start address for Armv8-R
Date: Fri, 13 Jan 2023 13:28:37 +0800
Message-Id: <20230113052914.3845596-5-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
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

And as we introduced Armv8-R platforms to Xen, that means the
existed Arm64 platforms should not be listed in Armv8-R platform
list, so we add !ARM_V8R dependency for these platforms.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
---
v1 -> v2:
1. Remove the platform header fvp_baser.h.
2. Remove the default start address for fvp_baser64.
3. Remove the description of default address from commit log.
4. Change HAS_MPU to ARM_V8R for Xen start address dependency.
   No matter Arm-v8r board has MPU or not, it always need to
   specify the start address.
---
 xen/arch/arm/Kconfig           |  8 ++++++++
 xen/arch/arm/platforms/Kconfig | 16 +++++++++++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ace7178c9a..c6b6b612d1 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -145,6 +145,14 @@ config TEE
 	  This option enables generic TEE mediators support. It allows guests
 	  to access real TEE via one of TEE mediators implemented in XEN.
 
+config XEN_START_ADDRESS
+	hex "Xen start address: keep default to use platform defined address"
+	default 0
+	depends on ARM_V8R
+	help
+	  This option allows to set the customized address at which Xen will be
+	  linked on MPU systems. This address must be aligned to a page size.
+
 source "arch/arm/tee/Kconfig"
 
 config STATIC_SHM
diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index c93a6b2756..0904793a0b 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -1,6 +1,7 @@
 choice
 	prompt "Platform Support"
 	default ALL_PLAT
+	default FVP_BASER if ARM_V8R
 	---help---
 	Choose which hardware platform to enable in Xen.
 
@@ -8,13 +9,14 @@ choice
 
 config ALL_PLAT
 	bool "All Platforms"
+	depends on !ARM_V8R
 	---help---
 	Enable support for all available hardware platforms. It doesn't
 	automatically select any of the related drivers.
 
 config QEMU
 	bool "QEMU aarch virt machine support"
-	depends on ARM_64
+	depends on ARM_64 && !ARM_V8R
 	select GICV3
 	select HAS_PL011
 	---help---
@@ -23,7 +25,7 @@ config QEMU
 
 config RCAR3
 	bool "Renesas RCar3 support"
-	depends on ARM_64
+	depends on ARM_64 && !ARM_V8R
 	select HAS_SCIF
 	select IPMMU_VMSA
 	---help---
@@ -31,14 +33,22 @@ config RCAR3
 
 config MPSOC
 	bool "Xilinx Ultrascale+ MPSoC support"
-	depends on ARM_64
+	depends on ARM_64 && !ARM_V8R
 	select HAS_CADENCE_UART
 	select ARM_SMMU
 	---help---
 	Enable all the required drivers for Xilinx Ultrascale+ MPSoC
 
+config FVP_BASER
+	bool "Fixed Virtual Platform BaseR support"
+	depends on ARM_V8R
+	help
+	  Enable platform specific configurations for Fixed Virtual
+	  Platform BaseR
+
 config NO_PLAT
 	bool "No Platforms"
+	depends on !ARM_V8R
 	---help---
 	Do not enable specific support for any platform.
 
-- 
2.25.1


