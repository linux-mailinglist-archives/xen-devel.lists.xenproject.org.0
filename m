Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453966E526
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 18:45:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479670.743734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1X-0003DX-1E; Tue, 17 Jan 2023 17:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479670.743734; Tue, 17 Jan 2023 17:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1W-00037n-Qg; Tue, 17 Jan 2023 17:45:26 +0000
Received: by outflank-mailman (input) for mailman id 479670;
 Tue, 17 Jan 2023 17:45:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8eG=5O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pHq1U-0000oY-PC
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 17:45:24 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6b0624f-968e-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 18:45:22 +0100 (CET)
Received: from BL1P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::21)
 by IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 17:45:19 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:208:2c4:cafe::11) by BL1P223CA0016.outlook.office365.com
 (2603:10b6:208:2c4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 17:45:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Tue, 17 Jan 2023 17:45:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:19 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:18 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 11:45:17 -0600
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
X-Inumbo-ID: b6b0624f-968e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyKg/SiuLnNtr++MQj90BxMCE6x/hgp7vK5l4EdSPCwZxEvQ+sU93aJq3SdSYZ+OK4u9lHdkUrgtQogzD48IwtHu/ELjpg04fM85kxQe22JGtdu+y/WqCmTMOimWNd7n/y/T82aPcET0Leu4uhnfcn6I5ifBeKoNWdbYHxtmqhMz67x+ZP9U3PPNnnLsAnYokiqiELC6PTPycYTKEp7R1Bo270rlG5MA2ChOhv6LMnjaN37z7XZfexjWQXGE76szgJTI+L0+t8j/FOP8etVOuIOsRlqLXUruggvCppWQACh+ORFmQGia8NGlFUm9Jb64VqRHuP0gki6hJkDlAMZTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALYkcOUMY24lQgvkESpS4YUl/I55d3ApiAMvpoBf2ic=;
 b=X6iMR4or+kTbuc13hnjlxl0EzqeL9jZP5R8p6LXbDdNYvjvxS1w37jNheSBr5dMsMpzmFli1+xEw6etNE2V86XGBWGV/Oqt/cA/DMNrmXml9MjQX6QLwMVsxIHZsQyYKeToH+lfdkt/Bw7akIU8UNliLNCdMuHWPMZmdGs0rsxnBhPGQ51YOrtVcnlsh1pMPmakh8AHQX6JMC94P8NQkkho/MPoOoht3pVo9Gmbhu/HjqTGpeTMaojj8/T+5wjtuh2GEwPNtIVdJoSC629sFIeZWskAIRBHF7JFjNvSJ20XySFuucU3jxFdmguBhPyLDAyOw3fPoXEg+HGkf1Dsjbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALYkcOUMY24lQgvkESpS4YUl/I55d3ApiAMvpoBf2ic=;
 b=x9Nf9HJ3X6O8CwHCK6nMnjMJEVJ+WY86syFIbkpFC5NqXJFya1VE9xPO27DOOrmdr1OEDQff7BN7wCXLONZL1yIO6Za2I/NS5+7fFU2n0+y5bEqK1fOVLdvjnCMnSbcgSgfiODtI85LFvvDhMg6yMZ+fI3IknB5gAjfoEB92qWc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v2 09/11] xen/arm: Introduce ARM_PA_32 to support 32 bit physical address
Date: Tue, 17 Jan 2023 17:43:56 +0000
Message-ID: <20230117174358.15344-10-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|IA0PR12MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c57a63-798f-47d6-f560-08daf8b29a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hHwQelgOJAmI+Q9nrZ5cvFFyiWSVIosX72GL1UAKyx+kgrvGRZcOGtMKUR2qipWDfaD8H0A+TR7erEpa2996HW+6h6fvLKBJSRMOm7llOePrkZeIqd2yelllWGIF7++/JnuCHm3Eh8aHuhfwz3pL+Nm00gsuZ12RAWdUl051PU8ysGbw1qrAMijb+1Sw5FxUKJlTNFY3XdVtDLoTD/iCYIay6HwCIn/3bm/e/hkMnV9vAwlwBovCeApr1Kbx6GlQh2C5ASHZLfXIsBl8QEhlJVR54XG+YJSmIShGvNnz9CJMu8rcKOyzc9iiruRsVrZx1Ke3nqsVDN1g8M34jWr8I/aKwyfQAVsWJkEdqv5Kuxt4F6klvAPjh10FnNSCZIdpiO1yLA6OZu7Z9leIE8vmATXnMvcb+ddHvIGGezgkcj4TiOwZgLI7EsIlkfLyOSaLEevcD2BCXwxN6kaBvZBZjVnH+aP2/JLvYrjBNjjBVAdLDNC/G7PBV/YwecF/EKF8M9ZfdGNzIRAeBwHW3a7HO91JrI+JqLgnnMSMgkwzJ8hlQDJcnl5EpQTVhmxybWBlHJgXmY9SIRrnXe2FI6imHQtlsYlyNj5KAslkyT+zuYbYDz5L5G8jCpO2/GuMJNNscK+6puo/J8EgfVchUQYyzeXiztZ29zRo00rqYhaOABY8E2fwwiPvSLH3Ig2jHmdMxTJ/JyC+qpEEYAOpNJQcZNVf2nIInG7ihdp3HV0b730=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(83380400001)(82310400005)(40460700003)(54906003)(36756003)(103116003)(478600001)(40480700001)(186003)(356005)(36860700001)(2616005)(81166007)(1076003)(47076005)(82740400003)(86362001)(336012)(426003)(41300700001)(2906002)(26005)(6666004)(70206006)(8936002)(70586007)(6916009)(8676002)(4326008)(316002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:45:19.7498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c57a63-798f-47d6-f560-08daf8b29a00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8374

We have introduced a new config option to support 32 bit physical address.
By default, it is disabled.
ARM_PA_32 cannot be enabled on ARM_64 as the memory management unit works
on 48bit physical addresses.
On ARM_32, it can be used on systems where large page address extension is
not supported.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - 1. No changes.

 xen/arch/arm/Kconfig                 | 9 +++++++++
 xen/arch/arm/include/asm/page-bits.h | 2 ++
 xen/arch/arm/include/asm/types.h     | 7 +++++++
 3 files changed, 18 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 239d3aed3c..aeb0f7252e 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -39,6 +39,15 @@ config ACPI
 config ARM_EFI
 	bool
 
+config ARM_PA_32
+	bool "32 bit Physical Address"
+	depends on ARM_32
+	default n
+	---help---
+
+	  Support 32 bit physical addresses.
+	  If unsure, say N
+
 config GICV3
 	bool "GICv3 driver"
 	depends on !NEW_VGIC
diff --git a/xen/arch/arm/include/asm/page-bits.h b/xen/arch/arm/include/asm/page-bits.h
index 5d6477e599..8f4dcebcfd 100644
--- a/xen/arch/arm/include/asm/page-bits.h
+++ b/xen/arch/arm/include/asm/page-bits.h
@@ -5,6 +5,8 @@
 
 #ifdef CONFIG_ARM_64
 #define PADDR_BITS              48
+#elif CONFIG_ARM_PA_32
+#define PADDR_BITS              32
 #else
 #define PADDR_BITS              40
 #endif
diff --git a/xen/arch/arm/include/asm/types.h b/xen/arch/arm/include/asm/types.h
index 083acbd151..f9595b9098 100644
--- a/xen/arch/arm/include/asm/types.h
+++ b/xen/arch/arm/include/asm/types.h
@@ -37,9 +37,16 @@ typedef signed long long s64;
 typedef unsigned long long u64;
 typedef u32 vaddr_t;
 #define PRIvaddr PRIx32
+#if defined(CONFIG_ARM_PA_32)
+typedef u32 paddr_t;
+#define INVALID_PADDR (~0UL)
+#define PADDR_SHIFT BITS_PER_LONG
+#define PRIpaddr PRIx32
+#else
 typedef u64 paddr_t;
 #define INVALID_PADDR (~0ULL)
 #define PRIpaddr "016llx"
+#endif
 typedef u32 register_t;
 #define PRIregister "08x"
 #elif defined (CONFIG_ARM_64)
-- 
2.17.1


