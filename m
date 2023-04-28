Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2767C6F1DBB
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 19:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527449.820055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSN4-0008BI-28; Fri, 28 Apr 2023 17:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527449.820055; Fri, 28 Apr 2023 17:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSN3-00088w-Uw; Fri, 28 Apr 2023 17:59:01 +0000
Received: by outflank-mailman (input) for mailman id 527449;
 Fri, 28 Apr 2023 17:59:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSN2-0006fW-38
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 17:59:00 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58a74395-e5ee-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 19:58:58 +0200 (CEST)
Received: from DS7PR03CA0101.namprd03.prod.outlook.com (2603:10b6:5:3b7::16)
 by SJ1PR12MB6028.namprd12.prod.outlook.com (2603:10b6:a03:489::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 17:58:54 +0000
Received: from DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::11) by DS7PR03CA0101.outlook.office365.com
 (2603:10b6:5:3b7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 17:58:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT066.mail.protection.outlook.com (10.13.173.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.25 via Frontend Transport; Fri, 28 Apr 2023 17:58:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:58:53 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 12:58:52 -0500
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
X-Inumbo-ID: 58a74395-e5ee-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6gEIyoy6fBgKKsDA2Vc5FH8mEawzDjZTNwdqYQZRKqFnV1x5xud/YhEjLUPza987QQAScN/HQubqoQuoHJqJCTO1Vn3v4eSKyBm23PF3zXcFRq0+27XCCofwfXyfFKKi1u9T44vX6VKuP8EzmP1pIt9rpzukXZFbo6u1BvRAuqAoLduogQXDTkxEUNosGQDSM1a1SnE/OvgYXnF4R9txCHuPNkUEqKObnuDoJBiqjOzIVtxvqeZtkMmp+f/CFjzbp8d/8lflF9MuRxlsoveDDClq+WtJDPjYYKWT0UWmdIqzpWLrzlO+Ia3Jv3twVf2PuKPU3+9G5VGAH9NMQds0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=or840FRCn8ypSDsEb4hyxwxB+cIKiY1L3JPA3/w2J3M=;
 b=PfCnDAqXR3hJOHyC2BUCaN8xP0Sz3b2ayUrTfXCOwgQdG1MYyuO8+XQzz2EM67kV+WxQMX4UegMqoqH+axxOEbh63+aDXTZoQXizcNk4wHZbzvr+iCy6+YHBsA3IWKY3l9oIsts9AyVKagemmFaaffbLPuAry7vu1Euv0axDkwwLiPxNMcpsJO1KxhDIy4CZ8ZcEGA1sgh5EossMva/Q0Up/jYemAHfn600yTTwwzzjFRoEU8XLj9AC2xSTiMJckVGVuf+fl8PRxoEFALSbOqqg+qV98fnwriU7/P8PBi8e8r8yql9GqUsqrIfU9pYumX44HkgzWj/BX2K4pZTnYBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=or840FRCn8ypSDsEb4hyxwxB+cIKiY1L3JPA3/w2J3M=;
 b=MAWkdwAk6hBvlXnCjY21brvnnAVFlkcu9gXVUMDnV8TNTt1cfHtpT9LiXTf3jc7l1+57a3KqpdLVOVYtq8rYXwZo+en9cTNLiIugzUffzrqKK6Od2tscdFb5zQ2JdcDlgeCr8jNd5cUt26tzX3Yke8dyUarywYytIOMRhzv7x2Q=
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
Subject: [XEN v6 05/12] xen/arm: Introduce choice to enable 64/32 bit physical addressing
Date: Fri, 28 Apr 2023 18:55:36 +0100
Message-ID: <20230428175543.11902-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT066:EE_|SJ1PR12MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 6197a4b4-40b1-41d1-38bb-08db48123b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	74Q5XoRJHEgustXl6j5yOuhWmwwJV6Xckfp9z9TTYKSaSBs0LNteWH32UBF1O9WCV3pIbNLIkXqG76eTWIluOy7JqxHnd88+qTlCTE7Bg3lJz3X0uz9JFqFYdgUzDcQU1dkkhrzKpZTEyQ96bS/Z12ERdL5tlCMRY2JuXPjbLNDXHb4GsoNfPvOiIjaop4xB/V9bmH7VtZy153czcbhx/h6IU1Gy4wUiQLfaxb/VWf/7eacJUooOU0z5zw1Uqhvpirl8m5bdCrrIKebsmw5+BSxvq/X1l0BsivuqWJJ6asQC6tjJJiv8yiBfQBpTODXNCiauXWfrmMtePBsDQhImDBJlDUZuOY1dJTDyVdNZ1MKrRqv29ALtjwJCsjDlQUW1iZbvZNHtqmSKorVt3pVglJFwT9Vfmj7CSKKOhiVKdVq7Zu7JsLAvyd8Q9sXHZTsCmaBYmUkp5HuX4Nc9kwLC1x2BMNtUTAQ827OaLC/zql6nslwRKEhZUV/WhC5gMuk0b72grPPevRHOhDDzzGWU4TMEUZdHRlfxxB8ZjV9NeoLx6S5XjFhdttfQwDtusGK7PWrsedOo2l/+x1GgdfIGbgYJZAFcFX+yuagTCw6qN88J3tMScuEAt537QKG/d2PVo0/YyAb45Da413GavavYKz9j3vizR3kaI243NKrnmmcXvkWbHwspvZMb6sebVRxUVmrMwVM4VlFd8w0/UMYphYngOwYVyPT4AZl8VZKo6As=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(40470700004)(36840700001)(46966006)(86362001)(103116003)(2906002)(36756003)(82310400005)(40460700003)(40480700001)(36860700001)(6666004)(2616005)(336012)(186003)(47076005)(83380400001)(426003)(1076003)(4326008)(6916009)(70586007)(70206006)(478600001)(26005)(316002)(82740400003)(41300700001)(5660300002)(356005)(8676002)(54906003)(81166007)(8936002)(7416002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 17:58:54.2689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6197a4b4-40b1-41d1-38bb-08db48123b3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6028

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
For ARM_64, PADDR_BITS is set to 48.
The last two are same as the current configuration used today on Xen.

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

v5 - 1. Removed ARM_PA_BITS_48 as there is no choice for ARM_64.
2. In ARM_PA_BITS_32, "help" is moved to last, and "depends on" before "select".

 xen/arch/Kconfig                     |  3 +++
 xen/arch/arm/Kconfig                 | 32 ++++++++++++++++++++++++++--
 xen/arch/arm/include/asm/page-bits.h |  6 +-----
 xen/arch/arm/include/asm/types.h     |  6 ++++++
 xen/arch/arm/mm.c                    |  5 +++++
 5 files changed, 45 insertions(+), 7 deletions(-)

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
index 239d3aed3c..192582b61d 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -19,13 +19,41 @@ config ARM
 	select HAS_PMAP
 	select IOMMU_FORCE_PT_SHARE
 
+menu "Architecture Features"
+
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
+	  user should choose this option. This will help is reduced size of the
+	  binary.
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


