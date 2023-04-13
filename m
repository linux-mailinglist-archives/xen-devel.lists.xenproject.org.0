Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A0A6E13A2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 19:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520858.808958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0tm-0002KE-4Z; Thu, 13 Apr 2023 17:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520858.808958; Thu, 13 Apr 2023 17:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0tm-0002Go-0H; Thu, 13 Apr 2023 17:38:18 +0000
Received: by outflank-mailman (input) for mailman id 520858;
 Thu, 13 Apr 2023 17:38:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GAK=AE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pn0tk-0000a4-Qi
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 17:38:16 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8380ab3-da21-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 19:38:15 +0200 (CEST)
Received: from BN8PR03CA0034.namprd03.prod.outlook.com (2603:10b6:408:94::47)
 by MN0PR12MB5931.namprd12.prod.outlook.com (2603:10b6:208:37e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 17:38:13 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:94:cafe::ef) by BN8PR03CA0034.outlook.office365.com
 (2603:10b6:408:94::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 17:38:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 17:38:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:38:12 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 13 Apr 2023 12:38:10 -0500
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
X-Inumbo-ID: f8380ab3-da21-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/W/qQZ/U0+/znam5EFu1zzL1byXAU25t3wksNhuQg0gB+oRRGivzRQQl25QNBuzq7iN71tRHcsAK2djH3WpOaPbJj3Yjj+iGotVEyHPWPDnZs1Bjsa53RlkNEmRWfSjDMDmAk0sxZoQMlD6mHb+HEVSG0U6QE8Jzsc/vVXyA4+83GkmfY+HzWcvpgeZcar2sD3+YiisCZSqVwDw7o2O53ccZwzjUPfZnget8yHox1UnVoTGe2FRl5QE9ejNimXfbvvSLCA8pBBhp9NxV/F6iKG/XsCrhfjftOoZaYsud1QZwiIX9Ufvi93W381qc0BerYkeQND3zh4HCWriVpNENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rTjpNh+BHfToII30u7IVf5AGDUbfYB8YKJohyCLK1pQ=;
 b=oFSfRGim8riEmY+EBg1Tp3kn3Etl8U0qo/ClbnYhrHzORJ7Mx8CLvv3qxRy1Em6fY8oJI78zRX+yj8Pt237B+Ssib/7Wj1beW+xf4Q3ImIRmaRowZ260wtUTZQyr6585qthxULDUO8y8k1CYzpRr3M3t3drPc+An6I6bdUsPAZVtkPdLIgLhQCA7jXgG8bUdnwLspFJlgq58xVkt/WoIykbIf4zrr4AlqaITtI7GKRNsvzkAJQOEQXbb+ZlcMZcNhpldtRC7GuQn0QuOUPtCHdxUgdHXvExzOfOCFyKBExw8fD3anvAys05p7l3uCSEv5pMDvBBk72BndOqPLESLvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rTjpNh+BHfToII30u7IVf5AGDUbfYB8YKJohyCLK1pQ=;
 b=tEhm6AW4eQRfV6ho0FbQogVzJddsBYsVAdmf7jk04n65gm1+Dv9KoEUfmRPVHLBc5w2GCibGKHR1RPLtukblXNq6vQ2vSNg13Qq0EAu1j/fOGYuLINUdVaWbFLUZvZhHJNgkQYIdauvVEWWyue2c+4ecCqu4k6QFoTEqlT8QPDU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v5 05/10] xen/arm: Introduce choice to enable 64/32 bit physical addressing
Date: Thu, 13 Apr 2023 18:37:30 +0100
Message-ID: <20230413173735.48387-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|MN0PR12MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: cbdf1f5b-395a-4866-7162-08db3c45dafd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PerdVabi5ZzwYIBT1Jnn0FQ5u42GWVrc8Sxcf2ZQZg9nZQbMOjaTtfKnMxgMK1afKkXvK/JvTcNloFclamJYxy7R9H2NSgjdEJp87EqLvttz/wzPyLnI48cjaYdKPDYgs1XsWVhhpcVLOuezbP38elN5L8sewsO+1MKjrGrK4idAXNNzUWjKPjMEjCfbzwfiI2/uhPHSdqVVxJT0MJoZgCNsSxgU1ED1FyPvhj9vucxKIDUd39gLyVR0BKFRkBiq0KC1jvj8sWyurLPO2xSS/dzZmZRPYRXnGCJIwdyXntDkA/KEbBKSMSff+SlZC+FdJ9ug1+vMzmPw9r4gjMAkYdlI2NSSjc4qdEYWRXWkODKpBMj8jOc6MKXR9kMWK4lNifSs04rGLm3B6QblM6T5OeMwnKiNsMXrMCiZK5buF7rYIomJ463Rs1dEQgemIZ//YsxIUQklFhIuGzR4UZP4mVPtoSNp0bkW5AY3n9g5hVFYdvYBTZAD86qML0xaxXea2TtNYyqFm7UGzTFB3MA8fOXuXcMFOYP5pnIdWbFIUCSvcG8ZncRAh7fjx3k7wDd/XsM4fpy5yHN6mjgMGqDe9/11WwMKvTdzvWlZpI6GJK5UVKUwjWubmuFHweA+UCO5jRVkZMqOA6N3fNrH6Q8fEo4EAIZ7ZZSCMZTEMKlKdkYw9oPXwhV2zVAgAO0TLTRK4CIqKQxBBxxPSjrTVfodGRiUY6as5bWp+U16BgtNcVQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(2906002)(7416002)(8676002)(70586007)(70206006)(8936002)(5660300002)(103116003)(478600001)(41300700001)(40460700003)(316002)(40480700001)(83380400001)(82740400003)(426003)(336012)(36756003)(54906003)(6916009)(4326008)(186003)(86362001)(6666004)(26005)(81166007)(1076003)(2616005)(36860700001)(82310400005)(356005)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 17:38:12.7041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbdf1f5b-395a-4866-7162-08db3c45dafd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5931

Some Arm based hardware platforms which does not support LPAE
(eg Cortex-R52), uses 32 bit physical addresses.
Also, users may choose to use 32 bits to represent physical addresses
for optimization.

To support the above use cases, we have introduced arch independent
configs to choose if the physical address can be represented using
32 bits (PHYS_ADDR_T_32) or 64 bits (!PHYS_ADDR_T_32).
For now only ARM_32 provides support to enable 32 bit physical
addressing.

When PHYS_ADDR_T_32 is defined, PADDR_BITS is set to 32.
When PHYS_ADDR_T_32 is not defined for ARM_32, PADDR_BITS is set to 40.
When PHYS_ADDR_T_32 is not defined for ARM_64, PADDR_BITS is set to 48.
The last two are same as the current configuration used today on Xen.

PADDR_BITS is also set to 48 when ARM_64 is defined. The reason being
the choice to select ARM_PA_BITS_32/ARM_PA_BITS_40/ARM_PA_BITS_48 is
currently allowed when ARM_32 is defined.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -
v1 - 1. Extracted from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".

v2 - 1. Introduced Kconfig choice. ARM_64 can select PHYS_ADDR_64 only whereas
ARM_32 can select PHYS_ADDR_32 or PHYS_ADDR_64.
2. For CONFIG_ARM_PA_32, paddr_t is defined as 'unsigned long'. 

v3 - 1. Allow user to define PADDR_BITS by selecting different config options
ARM_PA_BITS_32, ARM_PA_BITS_40 and ARM_PA_BITS_48.
2. Add the choice under "Architecture Features".

v4 - 1. Removed PHYS_ADDR_T_64 as !PHYS_ADDR_T_32 means PHYS_ADDR_T_32.

 xen/arch/Kconfig                     |  3 +++
 xen/arch/arm/Kconfig                 | 37 ++++++++++++++++++++++++++--
 xen/arch/arm/include/asm/page-bits.h |  6 +----
 xen/arch/arm/include/asm/types.h     |  6 +++++
 xen/arch/arm/mm.c                    |  5 ++++
 5 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 7028f7b74f..67ba38f32f 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -1,6 +1,9 @@
 config 64BIT
 	bool
 
+config PHYS_ADDR_T_32
+	bool
+
 config NR_CPUS
 	int "Maximum number of CPUs"
 	range 1 4095
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..3f6e13e475 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -19,13 +19,46 @@ config ARM
 	select HAS_PMAP
 	select IOMMU_FORCE_PT_SHARE
 
+menu "Architecture Features"
+
+choice
+	prompt "Physical address space size" if ARM_32
+	default ARM_PA_BITS_48 if ARM_64
+	default ARM_PA_BITS_40 if ARM_32
+	help
+	  User can choose to represent the width of physical address. This can
+	  sometimes help in optimizing the size of image when user chooses a
+	  smaller size to represent physical address.
+
+config ARM_PA_BITS_32
+	bool "32-bit"
+	help
+	  On platforms where any physical address can be represented within 32 bits,
+	  user should choose this option. This will help is reduced size of the
+	  binary.
+	select PHYS_ADDR_T_32
+	depends on ARM_32
+
+config ARM_PA_BITS_40
+	bool "40-bit"
+	depends on ARM_32
+
+config ARM_PA_BITS_48
+	bool "40-bit"
+	depends on ARM_48
+endchoice
+
+config PADDR_BITS
+	int
+	default 32 if ARM_PA_BITS_32
+	default 40 if ARM_PA_BITS_40
+	default 48 if ARM_PA_BITS_48 || ARM_64
+
 config ARCH_DEFCONFIG
 	string
 	default "arch/arm/configs/arm32_defconfig" if ARM_32
 	default "arch/arm/configs/arm64_defconfig" if ARM_64
 
-menu "Architecture Features"
-
 source "arch/Kconfig"
 
 config ACPI
diff --git a/xen/arch/arm/include/asm/page-bits.h b/xen/arch/arm/include/asm/page-bits.h
index 5d6477e599..deb381ceeb 100644
--- a/xen/arch/arm/include/asm/page-bits.h
+++ b/xen/arch/arm/include/asm/page-bits.h
@@ -3,10 +3,6 @@
 
 #define PAGE_SHIFT              12
 
-#ifdef CONFIG_ARM_64
-#define PADDR_BITS              48
-#else
-#define PADDR_BITS              40
-#endif
+#define PADDR_BITS              CONFIG_PADDR_BITS
 
 #endif /* __ARM_PAGE_SHIFT_H__ */
diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
index e218ed77bd..e3cfbbb060 100644
--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -34,9 +34,15 @@ typedef signed long long s64;
 typedef unsigned long long u64;
 typedef u32 vaddr_t;
 #define PRIvaddr PRIx32
+#if defined(CONFIG_PHYS_ADDR_T_32)
+typedef unsigned long paddr_t;
+#define INVALID_PADDR (~0UL)
+#define PRIpaddr "08lx"
+#else
 typedef u64 paddr_t;
 #define INVALID_PADDR (~0ULL)
 #define PRIpaddr "016llx"
+#endif
 typedef u32 register_t;
 #define PRIregister "08x"
 #elif defined (CONFIG_ARM_64)
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b99806af99..6dc37be97e 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -690,6 +690,11 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
     const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
     int rc;
 
+    /*
+     * The size of paddr_t should be sufficient for the complete range of
+     * physical address.
+     */
+    BUILD_BUG_ON((sizeof(paddr_t) * 8) < PADDR_BITS);
     BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
 
     if ( frametable_size > FRAMETABLE_SIZE )
-- 
2.17.1


