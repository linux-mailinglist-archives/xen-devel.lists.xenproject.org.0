Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF363AD35
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 17:04:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449063.705721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgbl-0003Vh-0b; Mon, 28 Nov 2022 16:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449063.705721; Mon, 28 Nov 2022 16:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgbk-0003Sf-Tv; Mon, 28 Nov 2022 16:03:48 +0000
Received: by outflank-mailman (input) for mailman id 449063;
 Mon, 28 Nov 2022 16:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozgW3-00040T-0R
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:57:55 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a1ff2a1-6f35-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 16:57:53 +0100 (CET)
Received: from BN9PR03CA0365.namprd03.prod.outlook.com (2603:10b6:408:f7::10)
 by MN0PR12MB5858.namprd12.prod.outlook.com (2603:10b6:208:379::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:57:50 +0000
Received: from BN8NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::5c) by BN9PR03CA0365.outlook.office365.com
 (2603:10b6:408:f7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Mon, 28 Nov 2022 15:57:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT110.mail.protection.outlook.com (10.13.176.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Mon, 28 Nov 2022 15:57:49 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:57:49 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 07:57:49 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 28 Nov 2022 09:57:47 -0600
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
X-Inumbo-ID: 6a1ff2a1-6f35-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8cuTIvVdO6kD+1sPci9K92JgYlRCb5sAU6STs1IJLzDMlaqkh3yTRcCF4REi2DQiAl4WBK6mBl9JQ5kXgOCPL961nc7g0GhyXyq3ThJXPwvTWhV3iqewNVp0rMCuVuPm6nZo1JxXdHrElyxWNKq8r9DO8AsSX+kaS772CCtcCKMy85x4T8jQcWwNyosMIX3pDQWmubh5jzJA80LbY9PF8Q14EVDnskaKDJMAFQgXuDJybhyxUl7xUIDm+SajYj6F/XJ3beo/Y7AYJyzyeelJLCcgiQIZ9+av7DxBUR77oN4DS8uyyDnHtuFhNQwe7ICZgoaPx3sJCZJC68xOfwJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4h0x9XQCxvEzC4QjfAxNWTYP+bl6E7uks7mQZY4p/RQ=;
 b=e0Yu+SGFYNH81peLAUVCmCN1yUDOmobxXV5S+J7cFHBm7DKey70OVDjOSTK8jJLmcZW03qQyVsydCI48kW+LdG3RnQ7u1L4ZKFRcUkjri5weMbPrCEnbPAAcnHJPgMDF1La/+0/1GTsuNA3aS6xbgyLKPVLPRdLxZ8jlbl8fpjp4yxvU4mskMcRbQ/Sqi1qTe+KpCUAfHDxTjdfCRNmGiUoyVzpF3O5Rirnq29bIST/uGtBghq0tPzYyI3BXRlaxFR+XTEzASXTtxF5QKPMIxpfiE1awE9Bq0ytYY/z29PoS5/slAsY7H4/EhVW1nN3X95VAwcv+040nCdlTK4fdSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4h0x9XQCxvEzC4QjfAxNWTYP+bl6E7uks7mQZY4p/RQ=;
 b=CtXa6RFB741zi+Pmp1Bm8fp9VyhslSvEDHcf8gIVdh/QyWPysYOt4ehljyQQlUXif+rU5F8oUKUOBYE1A+FsSKzCEcAa306zmPkc9VpUh6e8k3QhmDnbht6mZx1mKqk6gdFsqImM4RTF8WkpANuZ9nngCOAIslS/jt6+4M3NkaY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v4 09/11] xen/Arm: GICv3: Define remaining GIC registers for AArch32
Date: Mon, 28 Nov 2022 15:56:47 +0000
Message-ID: <20221128155649.31386-10-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT110:EE_|MN0PR12MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 36fa434f-7d6d-4c2b-4fa4-08dad1594cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	koI1ctxnp56Q6q2gVXnYDZ221J7xzH3mmIqel3xmhITZZkBKJSwJJ3iPNrl3jROvvEUPg2Q9CB0/js6wrZowDF4UvRfl9FZ7bbabYMPtAWvglxzztulAuo+2z6tlN2kqQWe0V0+U3SWewRGKwawF47h3BBkiIFBqKOCVN1jq+rNg2zjXZUaNqY5BBNyMFwqIC9NUS5xTLvduZ/2hPKJmkKyGY7d5rklDgMFWwm+zGI76r0+xCPhgroujESQG/+ZWkEPDZu4JKGwSKUy1DPtc49/O7aHDBfg9qNF4BDfsmEgFpTVLQ3xahjje3ciE/GKd9ZCInbv7MLsckJO+no1twRFT2NfcP80Ua6epwz4Jfz/em++hPav/hGm8yH1gGWc1WN2gHW9InouDx/56cF64PexMTdROsg1C+wyiewzmXTFPr5LUz/ZjYLdBy4VdurevTUZCOvQb9AkdUZYfWYouwiGWdeFE4+L2japKaiaD6tv1j9NAHc0z7Y0X88vv7Zut7H1e5NiORZpPGc77UfquiFeiM9ywTfBMMZ00gxwXMTdd0kvEAu3VBANkD0YZ7lrxCDKYJCbuS7E224y/aQ6xiXb5aBQbTwiiTf6Ph2G0S0yl3y3Kl39XjBZHVDPrmKICOEcDtTgMgq2OOQKRz94aUf3GU53hE8tJSweuVLiYKgR3H/Z1X2StfFm3cyBFwiE8QkqtjttZx+ON2JteITygWycFJcSRDIlrxg1CdwJN3f8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(40470700004)(46966006)(36840700001)(54906003)(6916009)(316002)(356005)(2906002)(36860700001)(8936002)(41300700001)(5660300002)(83380400001)(70206006)(4326008)(70586007)(8676002)(86362001)(26005)(426003)(2616005)(186003)(1076003)(47076005)(82310400005)(81166007)(336012)(478600001)(40460700003)(103116003)(40480700001)(36756003)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:57:49.7351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fa434f-7d6d-4c2b-4fa4-08dad1594cd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5858

Define missing assembly aliases for GIC registers on arm32, taking the ones
defined already for arm64 as a base. Aliases are defined according to the
GIC Architecture Specification ARM IHI 0069H.

Defined the following registers:-
1. Interrupt Controller Interrupt Priority Mask Register
2. Interrupt Controller System Register Enable register
3. Interrupt Controller Deactivate Interrupt Register
4. Interrupt Controller End Of Interrupt Register 1
5. Interrupt Controller Interrupt Acknowledge Register 1
6. Interrupt Controller Binary Point Register 1
7. Interrupt Controller Control Register
8. Interrupt Controller Interrupt Group 1 Enable register
9. Interrupt Controller Maintenance Interrupt State Register
10. Interrupt Controller End of Interrupt Status Register
11. Interrupt Controller Empty List Register Status Register
12. Interrupt Controller Virtual Machine Control Register

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from :-
v1 - 1. Moved coproc regs definition to asm/cpregs.h

v2 - 1. Defined register alias.
2. Style issues.
3. Defined ELSR, MISR, EISR to make it consistent with AArch64.

v3 - 1. Rectified some of the register names.
 
 xen/arch/arm/include/asm/cpregs.h | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index 53142fc2b2..8f4d097a15 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -163,6 +163,7 @@
 #define DACR            p15,0,c3,c0,0   /* Domain Access Control Register */
 
 /* CP15 CR4: */
+#define ICC_PMR         p15,0,c4,c6,0   /* Interrupt Priority Mask Register */
 
 /* CP15 CR5: Fault Status Registers */
 #define DFSR            p15,0,c5,c0,0   /* Data Fault Status Register */
@@ -256,6 +257,7 @@
 
 /* CP15 CR12:  */
 #define ICC_SGI1R       p15,0,c12       /* Interrupt Controller SGI Group 1 */
+#define ICC_DIR         p15,0,c12,c11,1 /* Interrupt Controller Deactivate Interrupt Register */
 #define ICC_ASGI1R      p15,1,c12       /* Interrupt Controller Alias SGI Group 1 Register */
 #define ICC_SGI0R       p15,2,c12       /* Interrupt Controller SGI Group 0 */
 #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
@@ -281,6 +283,20 @@
 #define ICH_AP1R2       __AP1Rx(2)
 #define ICH_AP1R3       __AP1Rx(3)
 
+#define ICC_IAR1        p15,0,c12,c12,0  /* Interrupt Controller Interrupt Acknowledge Register 1 */
+#define ICC_EOIR1       p15,0,c12,c12,1  /* Interrupt Controller End Of Interrupt Register 1 */
+#define ICC_BPR1        p15,0,c12,c12,3  /* Interrupt Controller Binary Point Register 1 */
+#define ICC_CTLR        p15,0,c12,c12,4  /* Interrupt Controller Control Register */
+#define ICC_SRE         p15,0,c12,c12,5  /* Interrupt Controller System Register Enable register */
+#define ICC_IGRPEN1     p15,0,c12,c12,7  /* Interrupt Controller Interrupt Group 1 Enable register */
+#define ICC_HSRE        p15,4,c12,c9,5   /* Interrupt Controller Hyp System Register Enable register */
+#define ICH_HCR         p15,4,c12,c11,0  /* Interrupt Controller Hyp Control Register */
+#define ICH_VTR         p15,4,c12,c11,1  /* Interrupt Controller VGIC Type Register */
+#define ICH_MISR        p15,4,c12,c11,2  /* Interrupt Controller Maintenance Interrupt State Register */
+#define ICH_EISR        p15,4,c12,c11,3  /* Interrupt Controller End of Interrupt Status Register */
+#define ICH_ELRSR       p15,4,c12,c11,5  /* Interrupt Controller Empty List Register Status Register */
+#define ICH_VMCR        p15,4,c12,c11,7  /* Interrupt Controller Virtual Machine Control Register */
+
 /* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
 #define __LR0(x)        ___CP32(p15, 4, c12, c12, x)
 #define __LR8(x)        ___CP32(p15, 4, c12, c13, x)
@@ -381,6 +397,15 @@
 #define HCR_EL2                 HCR
 #define HPFAR_EL2               HPFAR
 #define HSTR_EL2                HSTR
+#define ICC_BPR1_EL1            ICC_BPR1
+#define ICC_CTLR_EL1            ICC_CTLR
+#define ICC_DIR_EL1             ICC_DIR
+#define ICC_EOIR1_EL1           ICC_EOIR1
+#define ICC_IGRPEN1_EL1         ICC_IGRPEN1
+#define ICC_PMR_EL1             ICC_PMR
+#define ICC_SGI1R_EL1           ICC_SGI1R
+#define ICC_SRE_EL1             ICC_SRE
+#define ICC_SRE_EL2             ICC_HSRE
 #define ICH_AP0R0_EL2           ICH_AP0R0
 #define ICH_AP0R1_EL2           ICH_AP0R1
 #define ICH_AP0R2_EL2           ICH_AP0R2
@@ -389,6 +414,10 @@
 #define ICH_AP1R1_EL2           ICH_AP1R1
 #define ICH_AP1R2_EL2           ICH_AP1R2
 #define ICH_AP1R3_EL2           ICH_AP1R3
+#define ICH_EISR_EL2            ICH_EISR
+#define ICH_ELRSR_EL2           ICH_ELRSR
+#define ICH_HCR_EL2             ICH_HCR
+#define ICC_IAR1_EL1            ICC_IAR1
 #define ICH_LR0_EL2             ICH_LR0
 #define ICH_LR1_EL2             ICH_LR1
 #define ICH_LR2_EL2             ICH_LR2
@@ -421,6 +450,9 @@
 #define ICH_LRC13_EL2           ICH_LRC13
 #define ICH_LRC14_EL2           ICH_LRC14
 #define ICH_LRC15_EL2           ICH_LRC15
+#define ICH_MISR_EL2            ICH_MISR
+#define ICH_VMCR_EL2            ICH_VMCR
+#define ICH_VTR_EL2             ICH_VTR
 #define ID_AFR0_EL1             ID_AFR0
 #define ID_DFR0_EL1             ID_DFR0
 #define ID_DFR1_EL1             ID_DFR1
-- 
2.17.1


