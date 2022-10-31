Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 227006139C7
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433034.685929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUX-0002rE-UL; Mon, 31 Oct 2022 15:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433034.685929; Mon, 31 Oct 2022 15:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUX-0002lQ-P7; Mon, 31 Oct 2022 15:14:21 +0000
Received: by outflank-mailman (input) for mailman id 433034;
 Mon, 31 Oct 2022 15:14:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWUV-0008Dn-Sd
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:14:19 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afa5b701-592e-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 16:14:18 +0100 (CET)
Received: from BN9PR03CA0865.namprd03.prod.outlook.com (2603:10b6:408:13d::30)
 by SA0PR12MB4445.namprd12.prod.outlook.com (2603:10b6:806:95::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 15:14:14 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::e3) by BN9PR03CA0865.outlook.office365.com
 (2603:10b6:408:13d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Mon, 31 Oct 2022 15:14:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:14:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:14:14 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:14:12 -0500
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
X-Inumbo-ID: afa5b701-592e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkOKEKyXVKYXDOzx/YhjjaD/xQ2ZqNNtuWIZ+6K9xNnfsiMAJfN2ElTcyhrTvsMbnCJxKWWWbBP3W1eweQEvpx5ZJOgSBf9AgTrWaTXwBj+iuzEoIMz8JJYM7K/FPeM/cnBJToCmQCCu93GuOcBbsjWOW4gYUoBmwynBtZ9bUW1aD8T57VXNLIvx76zpWnQeiUb2k06e0CTjVMO4IH5DXATL812Ee7dBjn0Unz0rADWW/pQ3UKJvIYEK7Hs6qaeo7/Mh2ARUv5hwHWoO+TPEgefTzJzD7PNdGRsbt5jT3HXDNVd50YLf6aHzcuBKf+6uyEDsBbWxTx/9iuMljN5E5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao6qIVyVbVJ+PXnUTss4wnvdQgwpAL4Cyg3ESb6Dh/4=;
 b=SadsscYPwyteA5kvGJioADb8Roo7LZXHWKRzOoYx5ksqJUg1HP/nEhUx9wNtpvqLDQQij+99+RMxyzNJEMNaAcuVUKP45cU4zBUrgs7lj4osTHAIr8+2M0J2WLWGoQLv+KFZAlcXvOfaxvKXpv6/5L6PQaWmLIm4Gv2sQy2qzja6OY59jo2U1lCcCO5K4D1PRBVlkZaAYqWjeAqm5TgEnt/SvE8vIPcmgqKt652urw//PhTCAs3Tif7ICgTPbhRdsk5q6zweX2B+M5VLa+DwPynrlEFAosEiNKRoFPFdSNkO7EGjpK+HFs+xWrKFRmuffGtkodgFlQKJ84MiFV5ofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao6qIVyVbVJ+PXnUTss4wnvdQgwpAL4Cyg3ESb6Dh/4=;
 b=ewThn8O7nX+nFQdCdPkAfTDLG39AqxwpDvczZu5PAwlF5Omb+RASdx5w1GD/srM1BsWw5yH+iUlJKZReD5O7zZ6YcbDs5jPryYWELxsji640MHvUhuU/kc5PLYR5lKPNX5T9Daa3DQeLlvRfKlilCc2ihTXUFewKv1chiPxTc98=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v2 09/12] xen/Arm: GICv3: Define GIC registers for AArch32
Date: Mon, 31 Oct 2022 15:13:23 +0000
Message-ID: <20221031151326.22634-10-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221031151326.22634-1-ayankuma@amd.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|SA0PR12MB4445:EE_
X-MS-Office365-Filtering-Correlation-Id: 15361d85-abd4-4b4a-d8c0-08dabb529286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rtzy1kiD28sIrq5SEZteyYBkdydYraRp38SewTdraALTgVkpVHygHuQOyBWDFbYkpxDU/YOEUO56bHZp0qKO7JEDQS5eL0No7MIabba1uXDcsLXpzIev+juHqODKHzwc9CgOZ/5FxuSEnhRv4hDDNyZECBs2G6bmVJsPFQhkWLtdS9NlG46XevHYdEx/kvhlxS3yVOhKSm96GSYYYcyi0rO9xCVHz+JtaD8waNH6XGnzaxRp4p6YCm3WF05wuEElxwbpO2SB68tE5s7umekUgNIivOvHZhczT6Hpr0HKMzlQ1nGaxQBZTUkFGjDGxCRzXEW6avr7SSsd32GBBSYBQpuni4SO03fZ+AWTeFq+067EC8x0CLT6EbPtL/SX8r0QtHg9nqSFFTG7gsqtyNsYtchiCbootIGZsmQ5IKbnqY5YRdzDLpQI56znvxp7sTFa1VsIqF2sClycndosuHEJvd8xzftOODZhWAiWGeqegdTl2tNxqRynQbRp8AtoQHU8pQx5tO7i2d7mkM3SO2jeJj7O1tzNQuSDEeZtCQzu+5eSYE2IPyPqojivHyEo9wxqLS15+Ui+bhZxVlAf/3sCLWiWvL4Y5mSnWCwoN8kYvuvAhFYoRuH6d7Ar1mukL09OPeh4Ep1uC6KGnfxykV7qi13I2KB6FTgDzPXT0Pj0yflNCFGQH1vmj1aA5Kxjapyr83nGXVLS9suzuy3R4eO8oYIGYEoUaJlCxbMxIETR0iSc5/etP2x9L4ulJFWoKxcPnrluBU9C2VxkOmoitk2+uG7TgJgeaUoGM1PoVutIuSKeikqSb00OzJTsd7bah/eB
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(82740400003)(478600001)(426003)(47076005)(2906002)(336012)(36860700001)(356005)(70206006)(70586007)(8676002)(40480700001)(81166007)(4326008)(82310400005)(2616005)(1076003)(186003)(36756003)(41300700001)(26005)(54906003)(40460700003)(6916009)(316002)(5660300002)(8936002)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:14:14.5901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15361d85-abd4-4b4a-d8c0-08dabb529286
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4445

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

Changes from :-
v1 - 1. Moved coproc regs definition to asm/cpregs.h

 xen/arch/arm/include/asm/cpregs.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index bfabee0bc3..62b63f4cef 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -415,6 +415,22 @@
 #define ICH_AP1R1_EL2             __AP1Rx_EL2(1)
 #define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
 #define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
+
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
 #endif
 
 #endif
-- 
2.17.1


