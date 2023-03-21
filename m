Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D56C33A9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:05:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512683.792810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peccF-00080H-6w; Tue, 21 Mar 2023 14:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512683.792810; Tue, 21 Mar 2023 14:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peccF-0007x3-32; Tue, 21 Mar 2023 14:05:31 +0000
Received: by outflank-mailman (input) for mailman id 512683;
 Tue, 21 Mar 2023 14:05:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1peccD-0005Xe-Tk
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:05:30 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe59::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6edae5c5-c7f1-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 15:05:29 +0100 (CET)
Received: from DM6PR10CA0006.namprd10.prod.outlook.com (2603:10b6:5:60::19) by
 BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:3b3::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Tue, 21 Mar 2023 14:05:25 +0000
Received: from DS1PEPF0000B07A.namprd05.prod.outlook.com
 (2603:10b6:5:60:cafe::77) by DM6PR10CA0006.outlook.office365.com
 (2603:10b6:5:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 14:05:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000B07A.mail.protection.outlook.com (10.167.17.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Tue, 21 Mar 2023 14:05:25 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:05:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 07:05:24 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 09:05:22 -0500
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
X-Inumbo-ID: 6edae5c5-c7f1-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=co2c2MdnaSN4B9I7b621o2t3zp1mDslw2Oe7GDwpXaH0BOCLFjDXdPaQSNZAyOF1q7d0gZfMBN5NgRQk58+n0swbwQTserFGcfmM16Utvg9JloqzoOLlGgPPwmsvrQMVVaNjlZz0gcEqZ4uNNEj+8BUa/Gn0Z9/DOr6NN3ZtJIYEId5N8Uq/Ox5mpTS+z4PkuzUCbEBkF7gb2tgEiQ8Oi/SSMGkTIL+jKBbJKcLfR9D6VoQnQPD/5IGF1vKbVzmAsDfsVUbGRBv4fGZ/n1DT7RIKvxLM2hqcPY980oQydfFDe1bSwnc+CPgqR6mCMLnAQ5jXwVDwqSRjT8nGaUJ/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVw45C8rVy7+9H7135cJVOJglF13yYQFx7MyOjqge1Y=;
 b=ANKGfAWOCZnnIvomCb4FmmmC1+k1JMU104BVqW5fP6xHjm1/ZjcUHCFP5gCqBjOQbVVnU98x6dPHIrl0B2ZfqdGhr7fr7ObU6t99TAs5XTjygsWDj/3Qvk3TNUEHhKrhCP2X8dSe4nw/6PR5znY1pe7vR14/CWtIGeHkFa1itPOe4OO/7SnS5C9vrxokRZR4N+ag/2ZXsEjZrgQzSgM1ueFijDupxQxznEEZK8EtrtmLaD4Wm15hdgUDwTg8gWr2sdnu34ee4GBVdBi0RuK4++KGwnYA1DzHxfeQKznT8yBPivbXmkZGk/sYE+kwInnyBtKraVHfUUVzJ8xZ/n3MPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVw45C8rVy7+9H7135cJVOJglF13yYQFx7MyOjqge1Y=;
 b=zslQaGiXD+CDP4M8Oi7oAE821Zttq5lhxLGn42H05pZb2hUT+GlNoEH25AcDT+OeisUR6I4W3Lf5u4JoZD7SXWJC0YPzsXWgfDASwl0kdcTwkRHGEI9IAZd5hg8p+6UxpX6pdQPDCrinMd1oIp8k88csfpfztGW1iJ2T+gJMHl8=
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
Subject: [XEN v4 07/11] xen/arm: Introduce choice to enable 64/32 bit physical addressing
Date: Tue, 21 Mar 2023 14:03:53 +0000
Message-ID: <20230321140357.24094-8-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B07A:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: cb5c4778-6cdd-495e-c86d-08db2a155175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KJ5BXV9+rUMDlzzgdxXTTPWX0fpUndJ4juSmMFoDEEQXQEeDr86rnmyzKnwl2zlYRQ/s9E4knsya8ZInEzF646RkY9+A3sx3wUsJPgj/nDE9SL/wMkrEE/qVhnbDS98QODAk3T35h5wy9uPzYdnQqc4bH2OqmdtGECajhnTEjzdywVE+wZvCdznELWj+EF+VACUehIMK8U5+C+D9HhU0hPNM7QGdw4NkKQBTgz75qgqUZDm/XxtLSEq6EtqIL0oG4J4woDmrHVJFqkA0d1LlCodhAFrvjeRm5LTXguwVkpaTMuCMVDdWSZ2x9pP3GiqJqEsgc0DLSiCNtccvBStyBpU0ecj+V1x6y+BsaE2X9sYlqwsxM3OMrZsiVVPMX3tS02BBGXFDFMmpR1mb1DGb80HXwfSEJhZcQkqDw8NlE+mzed2GvZQ9zlidOjolLd6g2ZqlUL2FRZAfxAhSx6MSc2q9l1E6FBAjuIV/s7dZAui/maPBQXzhT8bFbjwAUiY07krnk1LC2zl21dIhQHUQYk3XiqV+UkSSYvbPeEWCFblax2iMZB9o2vqPn0LcPjngWEgRtQwNQhB5dfTCey0kOoIzU8HuFigVsqL7FUICkvhmeKDuS+Q0MTFCC7yJo7uaBHAFupE2LxPqEhwvxNkLep4hcDSLAXFPfpQNb4gWo4EbDQSPT4tYjc+2YuVXA6cgwyPezaLvZ7zxQ+Uk00iJhIrR63YjstZOEj2E7YSxvVU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(26005)(2906002)(4326008)(8936002)(8676002)(70206006)(6916009)(70586007)(5660300002)(7416002)(36756003)(86362001)(356005)(81166007)(36860700001)(82740400003)(103116003)(316002)(40480700001)(54906003)(6666004)(1076003)(478600001)(41300700001)(82310400005)(426003)(47076005)(336012)(83380400001)(2616005)(186003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:05:25.1629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5c4778-6cdd-495e-c86d-08db2a155175
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B07A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380

Some Arm based hardware platforms which does not support LPAE
(eg Cortex-R52), uses 32 bit physical addresses.
Also, users may choose to use 32 bits to represent physical addresses
for optimization.

To support the above use cases, we have introduced arch independent
configs to choose if the physical address can be represented using
32 bits (PHYS_ADDR_T_32) or 64 bits (PHYS_ADDR_T_64).
For now only ARM_32 provides support to enable 32 bit physical
addressing.

When PHYS_ADDR_T_32 is defined, PADDR_BITS is set to 32.
When PHYS_ADDR_T_64 is defined with ARM_32, PADDR_BITS is set to 40.
When PHYS_ADDR_T_64 is defined with ARM_64, PADDR_BITS is set to 48.
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

 xen/arch/Kconfig                     |  6 +++++
 xen/arch/arm/Kconfig                 | 40 ++++++++++++++++++++++++++--
 xen/arch/arm/include/asm/page-bits.h |  6 +----
 xen/arch/arm/include/asm/types.h     |  6 +++++
 xen/arch/arm/mm.c                    |  1 +
 5 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 7028f7b74f..89096c77a4 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -1,6 +1,12 @@
 config 64BIT
 	bool
 
+config PHYS_ADDR_T_32
+	bool
+
+config PHYS_ADDR_T_64
+	bool
+
 config NR_CPUS
 	int "Maximum number of CPUs"
 	range 1 4095
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..13e3a23911 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -9,6 +9,7 @@ config ARM_64
 	select 64BIT
 	select ARM_EFI
 	select HAS_FAST_MULTIPLY
+	select PHYS_ADDR_T_64
 
 config ARM
 	def_bool y
@@ -19,13 +20,48 @@ config ARM
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
+	  On platforms where any physical address can be represented within 32 bits
+	  , user should choose this option. This will help is reduced size of the
+	  binary.
+	select PHYS_ADDR_T_32
+	depends on ARM_32
+
+config ARM_PA_BITS_40
+	bool "40-bit"
+	select PHYS_ADDR_T_64
+	depends on ARM_32
+
+config ARM_PA_BITS_48
+	bool "40-bit"
+	select PHYS_ADDR_T_64
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
index b99806af99..d8b43ef38c 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -690,6 +690,7 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
     const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
     int rc;
 
+    BUILD_BUG_ON((sizeof(paddr_t) * 8) < PADDR_BITS);
     BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
 
     if ( frametable_size > FRAMETABLE_SIZE )
-- 
2.17.1


