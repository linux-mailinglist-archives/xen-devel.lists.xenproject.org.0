Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5813607AD1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427769.677194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu39-00060X-75; Fri, 21 Oct 2022 15:35:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427769.677194; Fri, 21 Oct 2022 15:35:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu39-0005x7-4F; Fri, 21 Oct 2022 15:35:07 +0000
Received: by outflank-mailman (input) for mailman id 427769;
 Fri, 21 Oct 2022 15:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olu0h-0000AU-BN
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:32:35 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94cc1aef-5155-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 17:32:34 +0200 (CEST)
Received: from CY5PR19CA0096.namprd19.prod.outlook.com (2603:10b6:930:83::24)
 by SA3PR12MB7951.namprd12.prod.outlook.com (2603:10b6:806:318::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 15:32:31 +0000
Received: from CY4PEPF0000B8E8.namprd05.prod.outlook.com
 (2603:10b6:930:83:cafe::24) by CY5PR19CA0096.outlook.office365.com
 (2603:10b6:930:83::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 15:32:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000B8E8.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Fri, 21 Oct 2022 15:32:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:32:24 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:32:23 -0500
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
X-Inumbo-ID: 94cc1aef-5155-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klCJXEHjosTAKu7Dj7CGmuOFBwGJ8X5MSzpGwJwuAzMjPuYEIgdnHonT35WY0u6CUevfktSdEFDYd7s4xqkSUn2FDqQtCNBp8ShItH3YYjBrVXUVnNKIXFgmMCSk6BWVd246AcbIIixWjdKukAUlShg2QA06r43L9mcSTFTVSMcXdblMmcCx1phxR3HPybNh+Oi885RVP3oslU8Nx4XyoCS3T55w7AMr+fDciGSqnZYJWQSkY7xw7VZ14zzgvN+Fx/uy6aXPRs8mLEn9Q22/nS32upzgUgMB8t7L+rhNaQnljnZNt5QfIrB4eD4SF4reV3nrh8JG73+IwnXI67XylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYaQtT0b/pESxMwe1f+rFfaaV2COA/hSqXIyQ3/U1lc=;
 b=FtKFr4e+9EDjN/IKfXrIfcrjMzcXw1SeP/qz7EYy0Im4piLWyU70dTH/VIUVd0/Br8NK916jsnm9Vf/hgDjtVkeiFeIa9x2GTdPfbhx25cy38Oiz4aQ1NodSIOVXycvi0CgsiJ/1pddAtwitlgxurLDvqugzOU9Hv/DgM3a/gTQkD/vtwZBQjoFVbbbCA7k9dFhswjuZGpDU4VMRUearZ9gkB+peIFpzuQ0V/hsbTxBuIbw16aW2TOJHEFTXOsPsbOiFXqD9MHWiKph5e/4QaIKu7eCy4eN5KYO/7rdVJrTwyuPsEiO5rez6Y5nboSmAw35wmAXHL9ibg1mfXdvDfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYaQtT0b/pESxMwe1f+rFfaaV2COA/hSqXIyQ3/U1lc=;
 b=cIXP9mrrPWPtjLSk3bbweMhUdrvzBisQp5zLVgJsxObmRw2jFolfWU5167boCBRCcSyuWQRNuYqvgzgeTViXHDfuhRxpLB0rEIH3vGxiLJA60T/xAGTEkXf8bx7K0bew1WyHl3HZVoMJCoGVJIeFYxr24uftjoaVG+uV3qMU5R4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [RFC PATCH v1 08/12] Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n> for AArch32
Date: Fri, 21 Oct 2022 16:31:24 +0100
Message-ID: <20221021153128.44226-9-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021153128.44226-1-ayankuma@amd.com>
References: <20221021153128.44226-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000B8E8:EE_|SA3PR12MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e145c3d-9219-480a-45fa-08dab379773b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7FJqjnSe0FzfMuExIrH0jTmtfI6ezT4GfiHPDzOw43WDaVDM+n95anoMVTObwx+71lD67NYYhCfnVnSaFOJ1LHtVAufuAJOZaBFfZiwUZhqsJHF3GjrIl4CdCtYssHVRfvHjBRcnf/DkaPU3DMODiou61fHXxTPE+GA9WYk37ZaIKpQBYCD0U+z2/mUjzOn23U16eeY5q4F/wyzfKwQi8SRl6jvfT0wHBYtwAuLh8f/jKWPxPhaXxXmmhTiRjJF/knD9K/0f4Vg4J+JGZyTQ+T5c9YtoL3DeBH5ztE6E4UHmDfYG2dMtx+V+iM4KGummnUwnipzMxyn5Kke4V20aQBtQwo4ewfgJIAIUgglmtX9KCGQ1NjzIAj7rf71FJ7a/TixF6xrQhhuYVpSHSTavMQOWwSLFoOqGAPa4xyxYOMd97cR7Yl4yLz0/TzIzb72Dsf5TSqodMWaOlAxeKz/0nLo39O/qjBj50vhU73UOCfYzpa5SZnl14MPLgpQDhiAezxVHEjzL3ONF1GYmZLkQpyNW1NsV0FbJQliDUhPPY5h1RynsNsIOA+1aSJ5D8R/sCYzWrtfaPF6muohdtzwu5x4vv1pP7tyQxhpyD+s/gI9L0mYV3nSYCWXPnN/mf3IMSJ6NZ0d7eOw0xtCaS9KSAghBzEwtlJ8J6aOkFgo6B5NBNRLAJN4FGeN4WO2m6jnFWuevckHDU+9S39+IZF+OKAUBPG3XhZrzGHi+jAv5N60yJ3SRzr9m3QhF01igefCVT/ej2jcQO2Dj7W+diNylGRdSVS3LFuDNd9X6lvXQGPLOCvmSX6rRNhxXyG1AD8B5
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(2906002)(478600001)(81166007)(1076003)(186003)(82740400003)(40460700003)(356005)(6916009)(316002)(36756003)(8676002)(41300700001)(54906003)(4326008)(82310400005)(70586007)(70206006)(5660300002)(8936002)(2616005)(36860700001)(336012)(47076005)(426003)(40480700001)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:32:29.6165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e145c3d-9219-480a-45fa-08dab379773b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000B8E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7951

Refer "Arm IHI 0069H ID020922",
12.7.1 - Interrupt Controller Hyp Active Priorities Group0 Registers 0-3
12.7.2 - Interrupt Controller Hyp Active Priorities Group1 Registers 0-3

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/include/asm/arm32/sysregs.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
index f3b4dfbca8..693da22324 100644
--- a/xen/arch/arm/include/asm/arm32/sysregs.h
+++ b/xen/arch/arm/include/asm/arm32/sysregs.h
@@ -117,6 +117,18 @@
 #define ICH_LRC14_EL2              __LRC8_EL2(6)
 #define ICH_LRC15_EL2              __LRC8_EL2(7)
 
+#define __AP0Rx_EL2(x)            ___CP32(p15,4,c12,c8,x)
+#define ICH_AP0R0_EL2             __AP0Rx_EL2(0)
+#define ICH_AP0R1_EL2             __AP0Rx_EL2(1)
+#define ICH_AP0R2_EL2             __AP0Rx_EL2(2)
+#define ICH_AP0R3_EL2             __AP0Rx_EL2(3)
+
+#define __AP1Rx_EL2(x)            ___CP32(p15,4,c12,c9,x)
+#define ICH_AP1R0_EL2             __AP1Rx_EL2(0)
+#define ICH_AP1R1_EL2             __AP1Rx_EL2(1)
+#define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
+#define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_ARM_ARM32_SYSREGS_H */
-- 
2.17.1


