Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F1464296F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 14:30:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453628.711226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BYF-0006nX-6H; Mon, 05 Dec 2022 13:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453628.711226; Mon, 05 Dec 2022 13:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2BYF-0006l1-2c; Mon, 05 Dec 2022 13:30:31 +0000
Received: by outflank-mailman (input) for mailman id 453628;
 Mon, 05 Dec 2022 13:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p2BYD-0006k4-3F
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 13:30:29 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20612.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faa3389a-74a0-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 14:30:27 +0100 (CET)
Received: from BN9PR03CA0173.namprd03.prod.outlook.com (2603:10b6:408:f4::28)
 by SA0PR12MB4477.namprd12.prod.outlook.com (2603:10b6:806:92::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 13:30:24 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::12) by BN9PR03CA0173.outlook.office365.com
 (2603:10b6:408:f4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 13:30:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Mon, 5 Dec 2022 13:30:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:29:24 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 07:29:23 -0600
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
X-Inumbo-ID: faa3389a-74a0-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSe+x81C9rSBtuhuVQyIOh+NV6kLlPnQam2vy95kD9hSkUsfP59k5QKdP+pGi3Ybnn8wBbRV532T9KnhogugqsTllFY7i76BvGicBgnzqEzHvYAaqEgOBMutcO22s32MpJBYK7qKcCusUC29qvqqb5r8WiZkPeYCmfK5c+08mNowROQAy3hPUE+XeGhMzwZ4ZCR3BBJxM4REt3Sbrmen51HnjPhqp4GimPPMTNTDFaU/UnHZXpPoImXBSa4LfyOroyRg82LJZYH1iSLr3NpANCXw+6H4gK9YUe3oQlQim24g4vha8sWSgfLLRI9HSIn3zWHMTaLNlL/liZ+T4YIqmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEjzoMMb5D+I2LUETb4z5YcCm8RBHeC1gTFrxO6duws=;
 b=a4+F1XnJCd6UVTMo9xJ1G1QGVkF1+3uditldi4fgF+BvRg7eidMWtsoirKJSPIzw45zYJKnUEExHTeKPO6MPxj9aV5rHKpDx+msTVy0evZPrBMolZviQdWOOIOMRmlLv2b3tIwn5LbCvc/2ca/q/UcsHJ2XWQoaKjidghGu8YwoD4JMTYGPGIBjwwAHv3N4Znr1WnVlbRXfzM0gI3Uwwk9ZCI5s/WMinPZiH9EQgVLqz/QMWfibHgL95XMNGmLXQfudR9jVaWddWwca3eK6B3nNWtPuaahadL1AojUDk7sZ8wVpbCOukBmbFswbJpI6vBgylN9+rNvIZLwVY8g67wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UEjzoMMb5D+I2LUETb4z5YcCm8RBHeC1gTFrxO6duws=;
 b=fX0imxLanu2XAUY33N6LzykPGu8QBmNadiFy79hytLFuy7ZDE2VzNqbVWQ/eQJFIWSdqUvlBl0y4GAopzw9CL9OWbnEcBPOHYAyQtVrRilcu9fSDMa3j1cGMoHP5FvujLTxmA/QZVWVp+8s4evYq9C0OmssWIEbWe06VB+3YQnI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v5 08/11] xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n> for AArch32
Date: Mon, 5 Dec 2022 13:26:34 +0000
Message-ID: <20221205132637.26775-9-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT026:EE_|SA0PR12MB4477:EE_
X-MS-Office365-Filtering-Correlation-Id: f9dd7ec8-8dd9-4bdd-55c7-08dad6c4dcfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k4sNX5rjF3eK9txYeh9OpI2S4c5kVnXyapSrr+isKWolIDOH/pfDvpp0bKHRQhM0eNvlVxa6gFoiWRj4oJ+WqF/30jjgfPxkKOaA8sCshiYBeerNJdXZ3el/EKC1Ox7XiP+uR5qMX13On2DnishrdcFMMOXoOHSOvkxjpwQSheW4GzfiruCWIT7IaCClUvyVh4S2vN/S/5JAZG/ANYXW33rb6NIL9KSP059mXvIEl/7J/wZbmWvfwB3zLh2XrXcjk/079C8TtP4FryxW2SN6OeUC2LCyx/d++0Ji5i6sVvLKIqfXIp918veWMPf5mjR8h5Cuea7d4t/BrIGF4v1YFSTYa8EfqHog2ZyhMB899extA8BheWdxovDE76YYrJapaY0y7pQ89jhxFheM6PTBYcBEaUyHIsI/IUubCgsKxIEMRhRp8AWcKECYpaHut2U7pMcZ/GmSCb89J1aDgrQg4aQfktO+05bkVvN4Khr+uKNq7CHvtg4JnnHIaHWpVh3ScpwKRYZha5DxArB01YoXMwjgvqb3ll8BZb5NHEXPkkvWQFCeJtdmj+DP7PBKkUrjiVWHfPaznFmbIjY+/bgbG1ns0JStWINXV1s+ZCWwqCm3Ehzz4StX2UMG6Y4yI70z52kxKeaBEKMdqyyMlXGhJJBGqIXQhme1z6yPc5d+lj022GEUqIdE45ewP82o6Yn8LVsN8QeiZ9B4AAkm1JcAqBiLQZ5Fim6LZNTwin43uyA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(2906002)(82310400005)(83380400001)(2616005)(47076005)(316002)(8676002)(4326008)(103116003)(40480700001)(70206006)(8936002)(70586007)(36756003)(86362001)(40460700003)(426003)(5660300002)(41300700001)(54906003)(186003)(1076003)(336012)(6916009)(478600001)(36860700001)(82740400003)(6666004)(26005)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 13:30:23.5205
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9dd7ec8-8dd9-4bdd-55c7-08dad6c4dcfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4477

Adapt save_aprn_regs()/restore_aprn_regs() for AArch32.

For which we have defined the following registers:-
1. Interrupt Controller Hyp Active Priorities Group0 Registers 0-3
2. Interrupt Controller Hyp Active Priorities Group1 Registers 0-3

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-
v1 - 1. Moved coproc register definition to asm/cpregs.h.

v2 - 1. Defined register alias.
2. Style issues.
3. Dropped R-b and Ack.

v3 - 1. Style issues.

v4 - 1. Replaced ___CP32(foo) with foo.

 xen/arch/arm/include/asm/cpregs.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index 7550fb25f5..4476c9f11b 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -259,6 +259,26 @@
 #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
 #define HVBAR           p15,4,c12,c0,0  /* Hyp. Vector Base Address Register */
 
+/*
+ * CP15 CR12: Interrupt Controller Hyp Active Priorities Group 0 Registers,
+ * n = 0 - 3
+ */
+#define __AP0Rx(x)      p15, 4, c12, c8, x
+#define ICH_AP0R0       __AP0Rx(0)
+#define ICH_AP0R1       __AP0Rx(1)
+#define ICH_AP0R2       __AP0Rx(2)
+#define ICH_AP0R3       __AP0Rx(3)
+
+/*
+ * CP15 CR12: Interrupt Controller Hyp Active Priorities Group 1 Registers,
+ * n = 0 - 3
+ */
+#define __AP1Rx(x)      p15, 4, c12, c9, x
+#define ICH_AP1R0       __AP1Rx(0)
+#define ICH_AP1R1       __AP1Rx(1)
+#define ICH_AP1R2       __AP1Rx(2)
+#define ICH_AP1R3       __AP1Rx(3)
+
 /* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
 #define __LR0(x)        p15, 4, c12, c12, x
 #define __LR8(x)        p15, 4, c12, c13, x
@@ -359,6 +379,14 @@
 #define HCR_EL2                 HCR
 #define HPFAR_EL2               HPFAR
 #define HSTR_EL2                HSTR
+#define ICH_AP0R0_EL2           ICH_AP0R0
+#define ICH_AP0R1_EL2           ICH_AP0R1
+#define ICH_AP0R2_EL2           ICH_AP0R2
+#define ICH_AP0R3_EL2           ICH_AP0R3
+#define ICH_AP1R0_EL2           ICH_AP1R0
+#define ICH_AP1R1_EL2           ICH_AP1R1
+#define ICH_AP1R2_EL2           ICH_AP1R2
+#define ICH_AP1R3_EL2           ICH_AP1R3
 #define ICH_LR0_EL2             ICH_LR0
 #define ICH_LR1_EL2             ICH_LR1
 #define ICH_LR2_EL2             ICH_LR2
-- 
2.17.1


