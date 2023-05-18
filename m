Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22948708433
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:47:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536426.834751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeuk-0004nJ-0p; Thu, 18 May 2023 14:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536426.834751; Thu, 18 May 2023 14:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeuj-0004lO-Tm; Thu, 18 May 2023 14:47:33 +0000
Received: by outflank-mailman (input) for mailman id 536426;
 Thu, 18 May 2023 14:47:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7bG=BH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pzepA-00074K-A9
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 14:41:48 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20617.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c61c6a2-f58a-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 16:41:46 +0200 (CEST)
Received: from MW4PR04CA0086.namprd04.prod.outlook.com (2603:10b6:303:6b::31)
 by SJ1PR12MB6361.namprd12.prod.outlook.com (2603:10b6:a03:455::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 14:41:42 +0000
Received: from CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::cc) by MW4PR04CA0086.outlook.office365.com
 (2603:10b6:303:6b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 14:41:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT094.mail.protection.outlook.com (10.13.174.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 14:41:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:41:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:41:39 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 18 May 2023 09:41:37 -0500
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
X-Inumbo-ID: 1c61c6a2-f58a-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrjx0LnzcAsYrkxe9sr49t7CfQz8YRveGilrmREb3T55OTvXIfk5vftZcaklyT2Q2ClKmXRbDhLNLuMzmeTyjSN4q/uw5inXX/EahlDOP9nbF4NGBOBs0UERmmIdeVOrPub4wsYn680+hWnpT3hgGv1Nl2JBDNJCQgDFvc8Gj3Nk6sZYSjOR8UrJcjiibq2x3cGK6ff9pSqUpoLQcPlOGzwCHBvQLf5mygFqOYBlRsO9hjtCewBCLDk3sXUfGyNnvrZB7/9pTaW/weordR8uVXEsR7looC1B30BjfpiPiveSLf2LLD1eizJFGvE5ApTjO8JAVjr7O+LNzk9i3dKQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/cEYIxV/h5yAer+sUbKU2ootiXZ/Hl1Xk3NfMqs0ok=;
 b=cekbC89ycqQaL2NJBYBi4LxcMT1Qy3csY7+umXBul7zEJK5x3IEjB2IZrlTvhhYntwOJy+DRXtQKQphEFViGzJ9jh477uHWncmG0Fd2hEDFlH0SJPjuA/7QCJF71eIuuazUbveGCjL/pchw5RU9GJg/DijeXdNe1hwMkwE3nK7Cq+Y3ivviBlkVpDdvkNUZqxtMO8GMes405fE+iMijOwPsuhltuKsLp9k1xbXZZjfi31iIS+s8A97rI5VFwfjRZg07gIdaZxZUOq5ho6+K1Nwmv8I9Y7sMO+7wVf50TBomJYUSdhuCSXCUDbRdw57ln9BKIVEbuW4/ouvo5vt5fXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/cEYIxV/h5yAer+sUbKU2ootiXZ/Hl1Xk3NfMqs0ok=;
 b=Day8QmvpJRuveSsSIqt6QF20wWiSSMrhNXhkAv9+bBZ7wwhcLUmhjbr6ur5pXpcy9vaIJwnVBvBRmLP1AlW2ynVmYi95KhbiswJpb0ysK8d9uxU4YLgaRQsJslqGcFOppURWCJX2ZklpDL/ZEN682h22+rGzkibNmEoxlJ4iKN4=
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
	<wl@xen.org>, <rahul.singh@arm.com>, <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v7 08/11] xen/arm: Introduce choice to enable 64/32 bit physical addressing
Date: Thu, 18 May 2023 15:39:17 +0100
Message-ID: <20230518143920.43186-9-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT094:EE_|SJ1PR12MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: d53ad848-18ad-4aed-c475-08db57adff1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2tPYg221YJj44gHiKTuNUNfbzlpM6cHHXVOHpWr1ssKv+gTnx5khAUCA7NvbWU3z/uK9TNLYNWH+C5EQP5FjYmN6ZWNIq1V0LaMhiuy6ec3es13eML0LPJ4egBmJ1QSZHOuHW4rpJt4Eeg9L4RjKy40MRJ5tMjQMwdSxD6y0AR2DV6olYZUgl58Luvn5T3XyqdBEiOPsC8cz3exlzgLy2EfDm2CmftG5ol8lPyVq+a3fWv/w6PN0QUaofWYXZah5RJANqAbytfLXOzbdBCcrpccX9IEN9M0LrJ/5LJo4ThFKaYya8jDOaeUnn71mO6xSTvPi9rnXcR7Ec5GYpH6aN78Mc+Zjwd310kN5YjMImjUBQMNW/GlkiV5AlthNqgiJPbgeyySM5Nr1BJmIFh/xSogj2GsOmaKm+7cEqHSEmvRVocJDfFcNCGfqoh6Gk0b13aZaZuI1XQfZZOfm/kEOwLw40ZsRHtKn/v/zJFK6mRxkRC3tspcFCbpBEKcnywKdBIE1OPbBO5wA/4JVrCvyq0kga2dZ6kuIMc9pEndUhb79f8I45TNvvU7gpAJMrK1glKMdQ144hiLNFaStCwa4jOuEIVsG4bS2nn/a8xiP5nNeL+inPtrGorSdlmw1D82nPakTnGM92Etl2PAJTK0I7V/smKWWmdIwtUa5gx7sIDhoce09X0mHZPC7diqbsR4y9t/k5XhEgNuxVrkhL5Yo0m5wnFSgqwwQ7AvayWMMaZd2hqKtnQASlEB4ZT8C7J3k80LOusOvgDsFJwovjk3yaQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(5660300002)(70206006)(70586007)(2906002)(8936002)(478600001)(316002)(8676002)(54906003)(6916009)(7416002)(4326008)(41300700001)(6666004)(40460700003)(26005)(1076003)(82740400003)(356005)(186003)(40480700001)(426003)(336012)(83380400001)(36756003)(36860700001)(47076005)(86362001)(82310400005)(2616005)(81166007)(103116003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 14:41:42.1788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d53ad848-18ad-4aed-c475-08db57adff1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6361

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
used on paddr_t. On 32-bit architecture, "unsigned long" is 32-bit
wide. Thus, it can be used to denote physical address.

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

v6 - 1. Explained why we use "unsigned long" to represent physical address
for ARM_32.

 xen/arch/Kconfig                     |  3 +++
 xen/arch/arm/Kconfig                 | 32 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/page-bits.h |  6 +-----
 xen/arch/arm/include/asm/types.h     | 13 +++++++++++
 xen/arch/arm/mm.c                    |  5 +++++
 5 files changed, 54 insertions(+), 5 deletions(-)

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
index 239d3aed3c..63f4d35dab 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -26,6 +26,38 @@ config ARCH_DEFCONFIG
 
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
+	  macros are used on paddr_t. On 32-bit architecture, "unsigned long" is
+	  32-bit wide. Thus, it can be used to denote physical address.
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
index e218ed77bd..01d9d39e4b 100644
--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -34,9 +34,22 @@ typedef signed long long s64;
 typedef unsigned long long u64;
 typedef u32 vaddr_t;
 #define PRIvaddr PRIx32
+#if defined(CONFIG_PHYS_ADDR_T_32)
+
+/*
+ * We use "unsigned long" and not "uint32_t" to denote the type. This is done
+ * to avoid having a cast each time PAGE_* macros are used on paddr_t.
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


