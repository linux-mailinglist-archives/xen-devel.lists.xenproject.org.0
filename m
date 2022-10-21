Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47919607ACB
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:32:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427751.677173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0j-0003Tc-JB; Fri, 21 Oct 2022 15:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427751.677173; Fri, 21 Oct 2022 15:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0j-0003QV-ER; Fri, 21 Oct 2022 15:32:37 +0000
Received: by outflank-mailman (input) for mailman id 427751;
 Fri, 21 Oct 2022 15:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olu0h-0000nK-VA
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:32:36 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2048.outbound.protection.outlook.com [40.107.95.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95743862-5155-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 17:32:35 +0200 (CEST)
Received: from BN0PR04CA0068.namprd04.prod.outlook.com (2603:10b6:408:ea::13)
 by MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 15:32:29 +0000
Received: from BN8NAM11FT116.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::9c) by BN0PR04CA0068.outlook.office365.com
 (2603:10b6:408:ea::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Fri, 21 Oct 2022 15:32:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT116.mail.protection.outlook.com (10.13.176.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 15:32:29 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:32:28 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 08:32:28 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:32:26 -0500
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
X-Inumbo-ID: 95743862-5155-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCflJa5RW1stIJ0XSN8idXlezFaQPTLTbOH7NT15NMDytCmKGs8DtLAdAs4S0PURoUqsukvr9Nx/HZD/6NP0EdlMRheV7o/DLLxOBhTZ0bgN9uFd3IxybBCDYYNFizqWZf6OQJmUocSXXOXVYAzFZqftGGz6vUrWdRY2HC0kYZwmndfQt4OKb4Zpscf22XX6BULfWW4iuLnJIhNWwrVHZOaG6YJ2m1CBFPEtZQ4B2leO0MdkBtIrR5tAmUsoDOGFZohG7GB3AN6PA3X4VgcdzucpmBJuwt+eSK+qN5CggxqUozamt9U2X9FTrZRNd7oGzYhM8/eRG5lv4yMPU9m2UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJFsGpb2ciX52+9uagvBqLQ7Orc8YQkpkj/yfzPJyKs=;
 b=f/qWUsSYDcJH96/mad++MnZpYnVwnhqJRs5wTvQyrkQSdJLQRg+ryTSQ36tcPgxcYHkTd/3j31dGLyRIpn1Ys7wbPlyM7zNpgXsiDmYdHTaL4pO6JpMg/otukL6H1x+NGiS0mcQrTI+wOeMOWCA7hbO+zqQ+orXZ/DVveH9h6m+FzZjS/5sgmzKwLX9pa540lZh8SBSTTjFZiJklbwusHyugtTsgs3JCR/OT8boopvug7Vfgsf5R0jB3iXWVmLzlFhQy5n4rFQyX1YfLM01Q3JMJMnkPYrYMo6KvHFnD4fXmwx3AFAa+RmCL3yu87baHn9+D4G7cQZPJxbkbZAW6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJFsGpb2ciX52+9uagvBqLQ7Orc8YQkpkj/yfzPJyKs=;
 b=KTgZX2N+k7IHrQYl1x29gzhOkfvMojwk8o60kPYgjbCIheWurgSpklDkErPhPmEGFBoo0iIipfCLD2kUn8VdESLgrKd0VmFACtgBFxqJHVFpb4N95YT11U1Phy0RTFTWIASStXK4S3kQ52SZlS1AAdTykjI/8Bxsu0F7leht8Ds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: [RFC PATCH v1 09/12] Arm: GICv3: Define GIC registers for AArch32
Date: Fri, 21 Oct 2022 16:31:25 +0100
Message-ID: <20221021153128.44226-10-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021153128.44226-1-ayankuma@amd.com>
References: <20221021153128.44226-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT116:EE_|MN0PR12MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: bae72055-30f9-40eb-2721-08dab37976d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SrPB+O+VX9a7l+kIZegZ2CrKSovbvs5vQk6h4soiDC95vnGM9OGLDpt4uGZcGT1V4qXNEBcsNWE++NaUq01sj3Ms9XYzs7Mr1VQDJhBCyLmrv+Ru6K4znVvH3sqpcyUWZODaxdEpBn2BJezDil+KpN2ZDG2xOqjWI5cMWK7HDaGdaTr9OPa7hyuM59qfAzMlzq7hVKWYK6nf2JB9yD1nMZeUuzJmvLe/xUkELYdMdvMVisHO3rfLkGrHKknUjHOd4u34DndP+UyyZJMbwSLKWRDYhV15PCXgMhMRK5Gq+ffau4feRsINCuJyeDeds6zGbS/U/sH679EPc8o1SCCcO/nwPnwetRFpaUQas489Yfppx9SZHI7jHMABpFzivyvJuiBVsyXp13tnpHFt3o8Br3yKcVa6xDrZvBbnq9vz6glljR8tqzRRU4sPLLXLtmVRZDZkja3iYQp1ErITMvNStfDKmf8h3xNoOKyG+rqoaFtTvBmrdTA5CKoqjHIYAH45tdhRuf33PVg8bcf/ZXQrZLA08K078kfVszjoO+/2V5ATfeFGdwvAGPrBea+vpMIblfcxQ6p/0uAf2nNNvTtBlvvHVJodtrPQRWPY1jnUdiod1Djngfq32GeOpQQ/Cm2qXNh1EyICe/NWeVo9aw01dZsL5NaO3eUOe5GMmAJg8RJuCg8axBPKFKyTewz/bcrRdRMIHbZI1jl6EVhtBS09HAQklwZ9rO0TN8CTvg1daohuWV/4zE0qolQxE1HTTo1MBtFQgwtSarv28L/87Hi1Uf+8RJpPfmExB8elIE4roK1TBwKxErsA3idRy47CTgHv
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(36840700001)(46966006)(40470700004)(478600001)(41300700001)(316002)(4326008)(54906003)(8936002)(6916009)(8676002)(70206006)(70586007)(36860700001)(47076005)(40480700001)(356005)(81166007)(186003)(82740400003)(1076003)(2616005)(40460700003)(426003)(26005)(82310400005)(83380400001)(336012)(36756003)(2906002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:32:29.1645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae72055-30f9-40eb-2721-08dab37976d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT116.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320

Refer "Arm IHI 0069H ID020922"
12.5.23 ICC_SGI1R, Interrupt Controller Software Generated Interrupt
Group 1 Register
12.5.12 ICC_HSRE, Interrupt Controller Hyp System Register Enable register
12.7.10 ICH_VTR, Interrupt Controller VGIC Type Register
12.7.5 ICH_HCR, Interrupt Controller Hyp Control Register
12.5.20 ICC_PMR, Interrupt Controller Interrupt Priority Mask Register
12.5.24 ICC_SRE, Interrupt Controller System Register Enable register
12.5.7 ICC_DIR, Interrupt Controller Deactivate Interrupt Register
12.5.9 ICC_EOIR1, Interrupt Controller End Of Interrupt Register 1
12.5.14 ICC_IAR1, Interrupt Controller Interrupt Acknowledge Register 1
12.5.5 ICC_BPR1, Interrupt Controller Binary Point Register 1
12.5.6 ICC_CTLR, Interrupt Controller Control Register
12.5.16 ICC_IGRPEN1, Interrupt Controller Interrupt Group 1 Enable register
12.7.9 ICH_VMCR, Interrupt Controller Virtual Machine Control Register

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/include/asm/arm32/sysregs.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
index 693da22324..d2c5a115f9 100644
--- a/xen/arch/arm/include/asm/arm32/sysregs.h
+++ b/xen/arch/arm/include/asm/arm32/sysregs.h
@@ -129,6 +129,22 @@
 #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
 #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
 
+#define ICC_SGI1R_EL1             p15,0,c12
+
+#define ICC_SRE_EL2               p15,4,c12,c9,5
+#define ICH_VTR_EL2               p15,4,c12,c11,1
+#define ICH_HCR_EL2               p15,4,c12,c11,0
+
+#define ICC_PMR_EL1               p15,0,c4,c6,0
+#define ICC_SRE_EL1               p15,0,c12,c12,5
+#define ICC_DIR_EL1               p15,0,c12,c11,1
+#define ICC_EOIR1_EL1             p15,0,c12,c12,1
+#define ICC_IAR1_EL1              p15,0,c12,c12,0
+#define ICC_BPR1_EL1              p15,0,c12,c12,3
+#define ICC_CTLR_EL1              p15,0,c12,c12,4
+#define ICC_IGRPEN1_EL1           p15,0,c12,c12,7
+#define ICH_VMCR_EL2              p15,4,c12,c11,7
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_ARM_ARM32_SYSREGS_H */
-- 
2.17.1


