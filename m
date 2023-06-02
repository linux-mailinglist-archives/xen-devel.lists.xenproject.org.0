Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 160C5720128
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 14:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543113.847775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53aj-00053A-V1; Fri, 02 Jun 2023 12:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543113.847775; Fri, 02 Jun 2023 12:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53aj-00051C-Qx; Fri, 02 Jun 2023 12:09:13 +0000
Received: by outflank-mailman (input) for mailman id 543113;
 Fri, 02 Jun 2023 12:09:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jAO=BW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1q53ai-00050i-5G
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 12:09:12 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 478c0c6e-013e-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 14:09:11 +0200 (CEST)
Received: from BN9PR03CA0397.namprd03.prod.outlook.com (2603:10b6:408:111::12)
 by MN0PR12MB6343.namprd12.prod.outlook.com (2603:10b6:208:3c0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Fri, 2 Jun
 2023 12:09:06 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::ac) by BN9PR03CA0397.outlook.office365.com
 (2603:10b6:408:111::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.27 via Frontend
 Transport; Fri, 2 Jun 2023 12:09:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.26 via Frontend Transport; Fri, 2 Jun 2023 12:09:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 07:09:05 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 07:09:04 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 2 Jun 2023 07:09:03 -0500
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
X-Inumbo-ID: 478c0c6e-013e-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWl9MsWQOEptry0CgWicNoOykTMCgS93GPcFBzq9sYA46kSG699ueTN98jesJhI3SxN5IeFL71Q1OnBjqWJUZLfTIFaZTncfHBS8xwPLS+ju7Ogw6Ealysiqn4ABIuxpzDUkp2oYeGsRLY+ucYpnmX+dLWV42cEOcJQOKOsp7gBnP0xn6gzllrrkTO+ICqToAdgbMvp0cMRquzFjh9/7sYqhD9OczM1TuRvm2tmD2KVpHw1i7rraC2pnChzm80V+JlZD0ij3h1TtPGp25hS9puofg6qx6wzrgVdje0k6GRKhrDzxnZCl4wiutoYIV9V8M3NFwEvpcwDkXWKQnJyoZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWP1sjTCJ1CHkECWL9AfJ/baJ6+ufKsVZ9CEBrQnu9w=;
 b=hFZ3ds6onvufH275g2v94ROIsYJ+WoKXeS3qPKSVPE8o96102BbZJG+4aaCpzXj/ksX7dOmkwCAsxtQneziaVMLuYFzHMlYcsMwV2pJj8+DSQXbvA1wfmBY4uZyUJqwTyjieKWoOIP0cl0vmuPjcHDeWUEbaMrgbFoawOizilfAGaRDetZDQDMT9sq/1YD6+bfEbiLfEiRdGHSR2TPo2ETJPVFtqICI13M4XtM0OIN3zIG+t+lYA8s6Y6qomga/Uwr4UIfdMamwxZgBu4diKr3LPAAABmtWIStKvdD/Ub+jv1fR+b8l5ISeAhK/2Ilu0qM1FLqIQUywKl0Jdn1nmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWP1sjTCJ1CHkECWL9AfJ/baJ6+ufKsVZ9CEBrQnu9w=;
 b=kTB8EC6TYQJR+WrnUdkwDkT9KunoR9dlxl62gXuUMRs/XKNXKuyZGcGDwzsR7R69unhtooVAqGpJz9KbApRP10AVMAi95oLO0Q64VYPv7K0T/5y4ZnWNwjxy1Sa9TTQORsGlUYMRSMoLyJGp5oJTuofMPs//dwqltkuy2cVVbYI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v8 2/5] xen/arm: Introduce choice to enable 64/32 bit physical addressing
Date: Fri, 2 Jun 2023 13:07:51 +0100
Message-ID: <20230602120754.23817-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|MN0PR12MB6343:EE_
X-MS-Office365-Filtering-Correlation-Id: b3fdaa7b-8f92-4ca2-0f37-08db636229fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k3Zd/kZrh+TkXUdEnz5Qmnr7VCHslPe0Eh5Fu5IiR1Z26Ti3cTVBgVJRnnAcinGvioOqCL7VmhvSHsTBRxwPu64291csktTCD1aHF6C/d9w3hFm64vpSbmjr8NzipuESik0sWWlYtCzucbDI+AZcT2Sz7fHuRYmp1Lh2smOnVqhdhD73m1qVhJb7YJ/TdA+fXt/zQtiLRc0YT3bqdB6wjYLkbWrTu8ISjZfjLiD3LVMa9nmcaM3o+Y9EzmWA8eagrJ3anKj+Y6/ChbvHPf+EstCV4TFoLwnuKhawt8O8xZi8PkY/GCB7Ae/r+xK/dnqf3+flqcSK1eo1aFfBwzu1+Uls6orxf7Lf3inb6/zNUuEgDmpU4pjsrhPKTI98V+jPcGwpzBL1oTYSmb1UfnAZ4lH0kQZX6g3oSdvt+2i6aWfs9EJKowjTBja+QeP9nGR8fjtb0oesp7RsO1KKLe1LZskV2d97kM0SKLdLPMD3bEnO2wR5fnVGO096Xb/4HN3Hm1kruUWPeE1zBGJZ0QZ1ESwN1Bc0FlElHIJXYys2+pHXv9eYZntFaZBdzZoAPEPf8ZGO4OI6dxPQK5vkU8mRwp/Xxc58n4QU0WWm/P7epaW9giriH8/1KI+RpXTUYYMHxmEEtNbbe3QNpmAiRXNsQvw1BT8v8L9SM6UXsu4SzLnQqdx2COlTtQ+ber8yv7U4XpSLI18g+PAbgOVXI4CyEYX4r+qMqZ2VAq+oqTw6TuA/VZkAKG9wnCkWOIQ22Dz+Y2tlkz+TG/g4Dn/MrVDzSA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(4326008)(81166007)(356005)(47076005)(103116003)(26005)(1076003)(40460700003)(7416002)(2906002)(86362001)(5660300002)(8936002)(8676002)(186003)(6666004)(36756003)(54906003)(426003)(2616005)(336012)(316002)(82740400003)(83380400001)(41300700001)(40480700001)(36860700001)(478600001)(70586007)(70206006)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 12:09:06.4852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fdaa7b-8f92-4ca2-0f37-08db636229fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6343

Some Arm based hardware platforms which does not support LPAE
(eg Cortex-R52), uses 32 bit physical addresses.
Also, users may choose to use 32 bits to represent physical addresses
for optimization.

To support the above use cases, we have introduced arch independent
config to choose if the physical address can be represented using
32 bits (PHYS_ADDR_T_32) or 64 bits (!PHYS_ADDR_T_32).
For now only ARM_32 provides support to enable 32 bit physical
addressing.

When PHYS_ADDR_T_32 is defined, PADDR_BITS is set to 32. Note that we
use "unsigned long" (not "uint32_t") to denote the datatype of physical
address. This is done to avoid using a cast each time PAGE_* macros are
used on paddr_t. For eg PAGE_SIZE is defined as unsigned long. Thus,
each time PAGE_SIZE is used with paddr_t, the result will be
"unsigned long".
On 32-bit architecture, "unsigned long" is 32-bit wide. Thus, it can be
used to denote physical address.

When PHYS_ADDR_T_32 is not defined for ARM_32, PADDR_BITS is set to 40.
For ARM_64, PADDR_BITS is set to 48.
The last two are same as the current configuration used today on Xen.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
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

v5 - 1. Removed ARM_PA_BITS_48 as there is no choice for ARM_64.
2. In ARM_PA_BITS_32, "help" is moved to last, and "depends on" before "select".

v6 - 1. Explained why we use "unsigned long" to represent physical address
for ARM_32.

v7 - 1. Updated the reasoning for using "unsigned long" for paddr_t.
2. Added R-b by Michal.

 xen/arch/Kconfig                     |  3 +++
 xen/arch/arm/Kconfig                 | 33 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/page-bits.h |  6 +----
 xen/arch/arm/include/asm/types.h     | 14 ++++++++++++
 xen/arch/arm/mm.c                    |  5 +++++
 5 files changed, 56 insertions(+), 5 deletions(-)

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
index 239d3aed3c..1e87fe0247 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -26,6 +26,39 @@ config ARCH_DEFCONFIG
 
 menu "Architecture Features"
 
+choice
+	prompt "Physical address space size" if ARM_32
+	default ARM_PA_BITS_40 if ARM_32
+	help
+	  User can choose to represent the width of physical address. This can
+	  sometimes help in optimizing the size of image when user chooses a
+	  smaller size to represent physical address.
+
+config ARM_PA_BITS_32
+	bool "32-bit"
+	depends on ARM_32
+	select PHYS_ADDR_T_32
+	help
+	  On platforms where any physical address can be represented within 32 bits,
+	  user should choose this option. This will help in reduced size of the
+	  binary.
+	  Xen uses "unsigned long" and not "uint32_t" to denote the datatype of
+	  physical address. This is done to avoid using a cast each time PAGE_*
+	  macros are used on paddr_t. For eg PAGE_SIZE is defined as unsigned long.
+	  On 32-bit architecture, "unsigned long" is 32-bit wide. Thus, it can be
+	  used to denote physical address.
+
+config ARM_PA_BITS_40
+	bool "40-bit"
+	depends on ARM_32
+endchoice
+
+config PADDR_BITS
+	int
+	default 32 if ARM_PA_BITS_32
+	default 40 if ARM_PA_BITS_40
+	default 48 if ARM_64
+
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
index e218ed77bd..fb6618ef24 100644
--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -34,9 +34,23 @@ typedef signed long long s64;
 typedef unsigned long long u64;
 typedef u32 vaddr_t;
 #define PRIvaddr PRIx32
+#if defined(CONFIG_PHYS_ADDR_T_32)
+
+/*
+ * We use "unsigned long" and not "uint32_t" to denote the type. This is done
+ * to avoid having a cast each time PAGE_* macros are used on paddr_t. For eg
+ * PAGE_SIZE is defined as unsigned long.
+ * On 32-bit architecture, "unsigned long" is 32-bit wide. Thus, we can use it
+ * to denote physical address.
+ */
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
index 74f6ff2c6f..5ef5fd8c49 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -703,6 +703,11 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
     const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
     int rc;
 
+    /*
+     * The size of paddr_t should be sufficient for the complete range of
+     * physical address.
+     */
+    BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
     BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
 
     if ( frametable_size > FRAMETABLE_SIZE )
-- 
2.17.1


