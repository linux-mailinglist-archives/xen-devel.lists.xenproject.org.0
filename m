Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BC9625CCE
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442579.696928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrW-0001RH-42; Fri, 11 Nov 2022 14:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442579.696928; Fri, 11 Nov 2022 14:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrV-0001OG-Vs; Fri, 11 Nov 2022 14:18:29 +0000
Received: by outflank-mailman (input) for mailman id 442579;
 Fri, 11 Nov 2022 14:18:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otUrU-0006iO-Jp
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:18:28 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2047.outbound.protection.outlook.com [40.107.212.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4df67b2-61cb-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 15:18:26 +0100 (CET)
Received: from DM6PR03CA0050.namprd03.prod.outlook.com (2603:10b6:5:100::27)
 by PH8PR12MB6721.namprd12.prod.outlook.com (2603:10b6:510:1cc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Fri, 11 Nov
 2022 14:18:23 +0000
Received: from DM6NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::20) by DM6PR03CA0050.outlook.office365.com
 (2603:10b6:5:100::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Fri, 11 Nov 2022 14:18:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT086.mail.protection.outlook.com (10.13.173.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:18:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:18:22 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 11 Nov 2022 08:18:21 -0600
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
X-Inumbo-ID: b4df67b2-61cb-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cX2R6X9nTOHOkmcoEEzQaY0OSPVqAV6tVs/574NINwL04VSDnhjZk6y8C18PQ3zcVe2qLHxenzyCSoVAfog6t8f6e4yb7ig7eHkRGJ4SBM4YuT0n55jDVY/j8bWn9zpiLNtCEKZcPKbUSQqe9lS2Kjd4P41SqiVjOdIhbjkAZCkzAIo8tzNQJn2BvFN5+/AQwhlaOorIFcgRiS1TQpIcoiexJGkDZUdSvMi/wsn7Ddv8s+snItHzfFqj6b4XGl4817f+aiK7huVvFH+6/C4Zr3RWp8KjC6yrfJnNW15fqPG7mrjYj9FQZIt/cKbZi9StnVa+6DzPF5M0Uu9hf/TSXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsAJVVAUjSFPGt2LeVQyetBWveT0jt2DV1V4P7YMw1Q=;
 b=iTcte/8PSbjvxsdL1Kzkyr+zTUtzoNn8LWCiHAVumLsbm01SvWfgECrFA9X9EjJrPblrTjzHDpIe3TZOqsHDPxOeljyusz2OkQzxkDeRVoAj/AHJEnLmOGCisQfq181IJWWxycO5WW7Oca8Ao84QhhHCQcWOmk1AzvX1b/qGErs4+7B5rd17BnVHJ0OjR3iInPANYEa+8TL03n4EzMl/XrmQcMMNlTE2SmYdidER1VgULRXNp6i0s/njU7h4fv8A8YigeFmQCHVrdOBBQE6w/CaZb5li3aad7oT6m7J/Wu/BVySjzij5Y5jqy4TNgxOIdVncfiUOm1ZE8AsZ1FYtOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsAJVVAUjSFPGt2LeVQyetBWveT0jt2DV1V4P7YMw1Q=;
 b=Sh6B8zrXHRbLgL8Er/Jy8Mr5yx0pzc6/TTR2GYDupKfYmGt6By9m0fk3hYdE5igY74YC/hztjmR3n7KAn84Mo3dtEIWRhURHr3X/SH31CgXqLI32bkDZxKcPiBTMATVFtH+38Ntcw/XZJ8jlHZ9d1mvvvLNCBtIVgC9VnLJKTVY=
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
Subject: [XEN v3 08/12] xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n> for AArch32
Date: Fri, 11 Nov 2022 14:17:35 +0000
Message-ID: <20221111141739.2872-9-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT086:EE_|PH8PR12MB6721:EE_
X-MS-Office365-Filtering-Correlation-Id: a0998ee4-dffc-4346-cb76-08dac3ef9775
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P0g2ZPs/8oV63KPXWCK6Dh5H9lTdyQZF7S/ctpMowZn9w6KaUVOt7sWwAWeWxPzvUt50LyY3M+vopmT1X9X06A/207HKRICC81rjBpaUdifv5FjVpbK2vwZctsEwKgI2K1IytEPwm1ZdpXLEDHZN5jHKlgJvABx9Np5Q4LP0f9dssCHHz2dWsoPesvgP83sDpgOrWRHRm5IxdW7xV3A0VQtKd3Gx2DJTrXdiW+mDzZZiMcymMPbhcUG0kIDTbGvnDKa9eHHJ1WtpZgM2gF9NvnjVlNiaWMpd/ayRXsejycVJlRcY8lynfvm9gS6oYJK+EPoph38nq7ld/AmqSBdoylCjF8EtWbDqYHEt723mYhrzo6MWODA7k/ym9kAMWiItglP11XwZjvKnvy21Y161u1QAojOQu4q6/T4AHQe/rwAN921BNUYtahAjKw/cmIPN7qk9wlrVbk30Ctk/+GQffAJC9DMXZUJFV+29VIdmbhyqV187ZHr+idQmWAXw9SYab5FVK0tD5vf7Zx5I1VHGKJpuPKL0O2Kr7BhILC+1Z6YukvfgkCA65JD3dCVtC0Xw1iFm0nP2c8UjUfLQCsdhC5cmB8tkr7yOAE8omDNojgWP4JWi9yq8B3Gktrv0k4VV6gpnd76u9g2/At1UUvx+1AjbvIVdRbC82Qpfp7uT0Ro/0/3NKaBa1vXlPY/br6O8supeAujcEF4QJaweRtval5MLfGxl1ot7JE+YVYh+dNxIvL+iHXmF7q1DNNFxJYPowx8upFGG9gciMn1J4T49IZShqXoWKdPzeCL1yPBApfU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(40460700003)(47076005)(426003)(83380400001)(186003)(54906003)(336012)(6916009)(36756003)(2616005)(41300700001)(1076003)(8676002)(70586007)(82740400003)(4326008)(356005)(8936002)(81166007)(70206006)(82310400005)(40480700001)(26005)(5660300002)(2906002)(103116003)(316002)(86362001)(6666004)(36860700001)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:18:23.1244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0998ee4-dffc-4346-cb76-08dac3ef9775
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6721

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

 xen/arch/arm/include/asm/cpregs.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index 242dabaea8..5331ec3448 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -259,6 +259,26 @@
 #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
 #define HVBAR           p15,4,c12,c0,0  /* Hyp. Vector Base Address Register */
 
+/*
+ * CP15 CR12: Interrupt Controller Hyp Active Priorities Group 0 Registers,
+ * n = 0 - 3
+ */
+#define __AP0Rx(x)      ___CP32(p15, 4, c12, c8, x)
+#define ICH_AP0R0       __AP0Rx(0)
+#define ICH_AP0R1       __AP0Rx(1)
+#define ICH_AP0R2       __AP0Rx(2)
+#define ICH_AP0R3       __AP0Rx(3)
+
+/*
+ * CP15 CR12: Interrupt Controller Hyp Active Priorities Group 1 Registers,
+ * n = 0 - 3
+ */
+#define __AP1Rx(x)      ___CP32(p15, 4, c12, c9, x)
+#define ICH_AP1R0       __AP1Rx(0)
+#define ICH_AP1R1       __AP1Rx(1)
+#define ICH_AP1R2       __AP1Rx(2)
+#define ICH_AP1R3       __AP1Rx(3)
+
 /* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
 #define ___CP32(coproc, opc1, crn, crm, opc2) coproc, opc1, crn, crm, opc2
 #define __LR0(x)                  ___CP32(p15, 4, c12, c12, x)
@@ -360,6 +380,14 @@
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


