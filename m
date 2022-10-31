Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4AF6139C5
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433031.685918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUW-0002Qt-C7; Mon, 31 Oct 2022 15:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433031.685918; Mon, 31 Oct 2022 15:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUW-0002Hl-1Z; Mon, 31 Oct 2022 15:14:20 +0000
Received: by outflank-mailman (input) for mailman id 433031;
 Mon, 31 Oct 2022 15:14:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWUT-0008Dn-Pr
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:14:18 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae4a3503-592e-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 16:14:15 +0100 (CET)
Received: from MW4PR04CA0241.namprd04.prod.outlook.com (2603:10b6:303:88::6)
 by BY5PR12MB4321.namprd12.prod.outlook.com (2603:10b6:a03:204::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 15:14:11 +0000
Received: from CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::39) by MW4PR04CA0241.outlook.office365.com
 (2603:10b6:303:88::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Mon, 31 Oct 2022 15:14:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT098.mail.protection.outlook.com (10.13.174.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:14:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:14:09 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:14:08 -0500
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
X-Inumbo-ID: ae4a3503-592e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dto0V7H3b4IL1DVKz4Wqzp0kNxQBw0r4SaEIxl6iGEZYavWnHt1KzVD+8XLfbgAvJw6kAX88AnnDlPa4j8f/5rZ6qrbnCnZhBIKUUcAUHBdL+x9dcuWLR1rkcsAMi28W0N4a/OS9hvXjM+b9msupHuCKjhxTR/1KgiUyaEXHhtmkOptIUEdVJjL2x4yaZjMsZ+1lMECySx3e8JRg6RagjcggkU0Jsy4hd0FjNpxxIfkENauWcpWv5cxm1TdoO7s5KJJkI0LUbYqEPCFKBK4keN+v6ft7f3byVokx7t25o1bpDX5GkhSnKTilJmuUCARUeTJ8lrE2nEXeExnRTCJLJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BI24R+ivZImTUK+YWSPNKctw7x9+YZOXWotaP6tXxI4=;
 b=MZ0MRk88iI2bR5Z+qbLraS204tcqmrsIVpTTWcHDer9pi0iPfxSuGvX2+Yn5UgsrXiCV426PRakfJakc1wtsS+iU5bNt489TIsfa5HEEnmjw6CDVakjoa2wiRJr7C9EtL2Qz/3R+IWonmBr40aNFxdi/GYj12JanuIBsaefzAPhsh3TJZEB9MZuMekaka1N33Hsbby7UCA+pFNri3hfIH0lzCMSl33XgO3e1QGvDjwRt6bYwDQWq2Hn2YRZnLhASnAmLRMs4CMIUf1Og0mSbXHiQO48xgTqPNwb8Npxl20Ut84G0Kn9LoFJ8FNs9+a51h8mx/h+0KSfHLuUAkPvPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BI24R+ivZImTUK+YWSPNKctw7x9+YZOXWotaP6tXxI4=;
 b=qSAYQKPoPDoSPuZGfW1Oqwq2qqwKvNlAKZ5anGv7rkocDc4xpcsGooUzWOLe/fHF5AH28ghhqHiCqZI9bnf+qZSK+Ne2KRWe60pB0B86gBzgZhotnSSQlHHG6P51pOPCjGKHhB+MvPPfrEyLDX4kM1CFCY3Q6sSGCplRLTt/BjM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v2 07/12] xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
Date: Mon, 31 Oct 2022 15:13:21 +0000
Message-ID: <20221031151326.22634-8-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221031151326.22634-1-ayankuma@amd.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT098:EE_|BY5PR12MB4321:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e574610-819b-45c6-c575-08dabb529060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X2rRBsFs3DekPivs7MEQrJS4bNOIeyBGUC2GN5S+OLB3JY3TP/miFnsXWeQQBZesnOF3tuPhuTv4VYUJcwMiXLvjIiH2nS6y4an4E/tux4HAeef2gvDFUr7EXs1As/Gnxryr6xZAmJG4XOtk1fLBvTwlUUsuOEFNi8RKOtuFBz7F0D8g2NZD47+wtdJWYiouIsyF+hTONv7lNmtFvZ1OcLAA15KYCoEs4StMBAss87PR+xEl8iwa7LSy+cBsQhi+/sE69QI3PmrhU2qdEopF0TrtYJb4NfiNEKONnsROlzKAv6gMVq+37KNh2l6NQDW+2XLCFdWGXIQ0CmuKdHHvJpseCTlpWznNsu+rCz8iVDxd05/Twyz4abYIPocQjJrJbdT6QO3HP/dBJEkzH2oe4M0mZi8n360djfOnBrfxU4dS560pu8k1sDa4iW2UFgFmNLPx4y1qNdS+3bnMjDPx1Ca1iCX5Wo8hMY7ETDxFgjZyRit1/prJfclf3FhYTkfc6Pn74rTIcXAwYKmeCj9AyQju42rpXjU/L2SSx7h7P3ZSFjNqekT6A/lDGvx9EaiyDQOQa7quEeW5vpGI3zi2OIcbbimGDbnmVC6zGYvMNzw4XlkfNNHxVKvBwgCZ9PhxtPRvhbQLyhJDa0MjsKgpLnavGDqdxcPaGc8N/dnVbldy8dfiUyXE3QdiYrri/vCjAIBsi0g5DC5rLcM7aNG64qEoDSdVSxVvQue3bkfWrv+/oV1PW5gCg05ls5ukPTEEwsZGpDNr/9ejE3kGRovSVSGiBgpNUN6GrLQXbyV6suU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(81166007)(356005)(82740400003)(36756003)(40460700003)(40480700001)(2906002)(30864003)(6666004)(70586007)(4326008)(316002)(8676002)(478600001)(8936002)(5660300002)(70206006)(6916009)(54906003)(41300700001)(82310400005)(36860700001)(1076003)(186003)(2616005)(26005)(336012)(47076005)(426003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:14:10.8757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e574610-819b-45c6-c575-08dabb529060
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT098.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4321

Refer "Arm IHI 0069H ID020922", 12.4.6, Interrupt Controller List Registers

AArch64 System register ICH_LR<n>_EL2 bits [31:0] are architecturally
mapped to AArch32 System register ICH_LR<n>[31:0].
AArch64 System register ICH_LR<n>_EL2 bits [63:32] are architecturally
mapped to AArch32 System register ICH_LRC<n>[31:0].

Defined ICH_LR<0...15>_EL2 and ICH_LRC<0...15>_EL2 for Aarch32.
For AArch32, the link register is stored as :-
(((uint64_t) ICH_LRC<0...15>_EL2) << 32) | ICH_LR<0...15>_EL2

Also, ICR_LR macros need to be modified as ULL is 64 bits for AArch32 and
AArch64.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Changes from :-
v1 - 1. Moved the coproc register definitions to asm/cpregs.h.
2. Use GENMASK(31, 0) to represent 0xFFFFFFFF
3. Use READ_CP32()/WRITE_CP32() instead of READ_SYSREG()/WRITE_SYSREG().
4. Multi-line macro definitions should be enclosed within ({ }).

 xen/arch/arm/gic-v3.c                    | 132 +++++++++++------------
 xen/arch/arm/include/asm/arm32/sysregs.h |  17 +++
 xen/arch/arm/include/asm/arm64/sysregs.h |   3 +
 xen/arch/arm/include/asm/cpregs.h        |  42 ++++++++
 xen/arch/arm/include/asm/gic_v3_defs.h   |   6 +-
 5 files changed, 131 insertions(+), 69 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 018fa0dfa0..8b4b168e78 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -73,37 +73,37 @@ static inline void gicv3_save_lrs(struct vcpu *v)
     switch ( gicv3_info.nr_lrs )
     {
     case 16:
-        v->arch.gic.v3.lr[15] = READ_SYSREG(ICH_LR15_EL2);
+        v->arch.gic.v3.lr[15] = READ_SYSREG_LR(15);
     case 15:
-        v->arch.gic.v3.lr[14] = READ_SYSREG(ICH_LR14_EL2);
+        v->arch.gic.v3.lr[14] = READ_SYSREG_LR(14);
     case 14:
-        v->arch.gic.v3.lr[13] = READ_SYSREG(ICH_LR13_EL2);
+        v->arch.gic.v3.lr[13] = READ_SYSREG_LR(13);
     case 13:
-        v->arch.gic.v3.lr[12] = READ_SYSREG(ICH_LR12_EL2);
+        v->arch.gic.v3.lr[12] = READ_SYSREG_LR(12);
     case 12:
-        v->arch.gic.v3.lr[11] = READ_SYSREG(ICH_LR11_EL2);
+        v->arch.gic.v3.lr[11] = READ_SYSREG_LR(11);
     case 11:
-        v->arch.gic.v3.lr[10] = READ_SYSREG(ICH_LR10_EL2);
+        v->arch.gic.v3.lr[10] = READ_SYSREG_LR(10);
     case 10:
-        v->arch.gic.v3.lr[9] = READ_SYSREG(ICH_LR9_EL2);
+        v->arch.gic.v3.lr[9] = READ_SYSREG_LR(9);
     case 9:
-        v->arch.gic.v3.lr[8] = READ_SYSREG(ICH_LR8_EL2);
+        v->arch.gic.v3.lr[8] = READ_SYSREG_LR(8);
     case 8:
-        v->arch.gic.v3.lr[7] = READ_SYSREG(ICH_LR7_EL2);
+        v->arch.gic.v3.lr[7] = READ_SYSREG_LR(7);
     case 7:
-        v->arch.gic.v3.lr[6] = READ_SYSREG(ICH_LR6_EL2);
+        v->arch.gic.v3.lr[6] = READ_SYSREG_LR(6);
     case 6:
-        v->arch.gic.v3.lr[5] = READ_SYSREG(ICH_LR5_EL2);
+        v->arch.gic.v3.lr[5] = READ_SYSREG_LR(5);
     case 5:
-        v->arch.gic.v3.lr[4] = READ_SYSREG(ICH_LR4_EL2);
+        v->arch.gic.v3.lr[4] = READ_SYSREG_LR(4);
     case 4:
-        v->arch.gic.v3.lr[3] = READ_SYSREG(ICH_LR3_EL2);
+        v->arch.gic.v3.lr[3] = READ_SYSREG_LR(3);
     case 3:
-        v->arch.gic.v3.lr[2] = READ_SYSREG(ICH_LR2_EL2);
+        v->arch.gic.v3.lr[2] = READ_SYSREG_LR(2);
     case 2:
-        v->arch.gic.v3.lr[1] = READ_SYSREG(ICH_LR1_EL2);
+        v->arch.gic.v3.lr[1] = READ_SYSREG_LR(1);
     case 1:
-         v->arch.gic.v3.lr[0] = READ_SYSREG(ICH_LR0_EL2);
+         v->arch.gic.v3.lr[0] = READ_SYSREG_LR(0);
          break;
     default:
          BUG();
@@ -120,37 +120,37 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
     switch ( gicv3_info.nr_lrs )
     {
     case 16:
-        WRITE_SYSREG(v->arch.gic.v3.lr[15], ICH_LR15_EL2);
+        WRITE_SYSREG_LR(15, v->arch.gic.v3.lr[15]);
     case 15:
-        WRITE_SYSREG(v->arch.gic.v3.lr[14], ICH_LR14_EL2);
+        WRITE_SYSREG_LR(14, v->arch.gic.v3.lr[14]);
     case 14:
-        WRITE_SYSREG(v->arch.gic.v3.lr[13], ICH_LR13_EL2);
+        WRITE_SYSREG_LR(13, v->arch.gic.v3.lr[13]);
     case 13:
-        WRITE_SYSREG(v->arch.gic.v3.lr[12], ICH_LR12_EL2);
+        WRITE_SYSREG_LR(12, v->arch.gic.v3.lr[12]);
     case 12:
-        WRITE_SYSREG(v->arch.gic.v3.lr[11], ICH_LR11_EL2);
+        WRITE_SYSREG_LR(11, v->arch.gic.v3.lr[11]);
     case 11:
-        WRITE_SYSREG(v->arch.gic.v3.lr[10], ICH_LR10_EL2);
+        WRITE_SYSREG_LR(10, v->arch.gic.v3.lr[10]);
     case 10:
-        WRITE_SYSREG(v->arch.gic.v3.lr[9], ICH_LR9_EL2);
+        WRITE_SYSREG_LR(9, v->arch.gic.v3.lr[9]);
     case 9:
-        WRITE_SYSREG(v->arch.gic.v3.lr[8], ICH_LR8_EL2);
+        WRITE_SYSREG_LR(8, v->arch.gic.v3.lr[8]);
     case 8:
-        WRITE_SYSREG(v->arch.gic.v3.lr[7], ICH_LR7_EL2);
+        WRITE_SYSREG_LR(7, v->arch.gic.v3.lr[7]);
     case 7:
-        WRITE_SYSREG(v->arch.gic.v3.lr[6], ICH_LR6_EL2);
+        WRITE_SYSREG_LR(6, v->arch.gic.v3.lr[6]);
     case 6:
-        WRITE_SYSREG(v->arch.gic.v3.lr[5], ICH_LR5_EL2);
+        WRITE_SYSREG_LR(5, v->arch.gic.v3.lr[5]);
     case 5:
-        WRITE_SYSREG(v->arch.gic.v3.lr[4], ICH_LR4_EL2);
+        WRITE_SYSREG_LR(4, v->arch.gic.v3.lr[4]);
     case 4:
-        WRITE_SYSREG(v->arch.gic.v3.lr[3], ICH_LR3_EL2);
+        WRITE_SYSREG_LR(3, v->arch.gic.v3.lr[3]);
     case 3:
-        WRITE_SYSREG(v->arch.gic.v3.lr[2], ICH_LR2_EL2);
+        WRITE_SYSREG_LR(2, v->arch.gic.v3.lr[2]);
     case 2:
-        WRITE_SYSREG(v->arch.gic.v3.lr[1], ICH_LR1_EL2);
+        WRITE_SYSREG_LR(1, v->arch.gic.v3.lr[1]);
     case 1:
-        WRITE_SYSREG(v->arch.gic.v3.lr[0], ICH_LR0_EL2);
+        WRITE_SYSREG_LR(0, v->arch.gic.v3.lr[0]);
         break;
     default:
          BUG();
@@ -161,22 +161,22 @@ static uint64_t gicv3_ich_read_lr(int lr)
 {
     switch ( lr )
     {
-    case 0: return READ_SYSREG(ICH_LR0_EL2);
-    case 1: return READ_SYSREG(ICH_LR1_EL2);
-    case 2: return READ_SYSREG(ICH_LR2_EL2);
-    case 3: return READ_SYSREG(ICH_LR3_EL2);
-    case 4: return READ_SYSREG(ICH_LR4_EL2);
-    case 5: return READ_SYSREG(ICH_LR5_EL2);
-    case 6: return READ_SYSREG(ICH_LR6_EL2);
-    case 7: return READ_SYSREG(ICH_LR7_EL2);
-    case 8: return READ_SYSREG(ICH_LR8_EL2);
-    case 9: return READ_SYSREG(ICH_LR9_EL2);
-    case 10: return READ_SYSREG(ICH_LR10_EL2);
-    case 11: return READ_SYSREG(ICH_LR11_EL2);
-    case 12: return READ_SYSREG(ICH_LR12_EL2);
-    case 13: return READ_SYSREG(ICH_LR13_EL2);
-    case 14: return READ_SYSREG(ICH_LR14_EL2);
-    case 15: return READ_SYSREG(ICH_LR15_EL2);
+    case 0: return READ_SYSREG_LR(0);
+    case 1: return READ_SYSREG_LR(1);
+    case 2: return READ_SYSREG_LR(2);
+    case 3: return READ_SYSREG_LR(3);
+    case 4: return READ_SYSREG_LR(4);
+    case 5: return READ_SYSREG_LR(5);
+    case 6: return READ_SYSREG_LR(6);
+    case 7: return READ_SYSREG_LR(7);
+    case 8: return READ_SYSREG_LR(8);
+    case 9: return READ_SYSREG_LR(9);
+    case 10: return READ_SYSREG_LR(10);
+    case 11: return READ_SYSREG_LR(11);
+    case 12: return READ_SYSREG_LR(12);
+    case 13: return READ_SYSREG_LR(13);
+    case 14: return READ_SYSREG_LR(14);
+    case 15: return READ_SYSREG_LR(15);
     default:
         BUG();
     }
@@ -187,52 +187,52 @@ static void gicv3_ich_write_lr(int lr, uint64_t val)
     switch ( lr )
     {
     case 0:
-        WRITE_SYSREG(val, ICH_LR0_EL2);
+        WRITE_SYSREG_LR(0, val);
         break;
     case 1:
-        WRITE_SYSREG(val, ICH_LR1_EL2);
+        WRITE_SYSREG_LR(1, val);
         break;
     case 2:
-        WRITE_SYSREG(val, ICH_LR2_EL2);
+        WRITE_SYSREG_LR(2, val);
         break;
     case 3:
-        WRITE_SYSREG(val, ICH_LR3_EL2);
+        WRITE_SYSREG_LR(3, val);
         break;
     case 4:
-        WRITE_SYSREG(val, ICH_LR4_EL2);
+        WRITE_SYSREG_LR(4, val);
         break;
     case 5:
-        WRITE_SYSREG(val, ICH_LR5_EL2);
+        WRITE_SYSREG_LR(5, val);
         break;
     case 6:
-        WRITE_SYSREG(val, ICH_LR6_EL2);
+        WRITE_SYSREG_LR(6, val);
         break;
     case 7:
-        WRITE_SYSREG(val, ICH_LR7_EL2);
+        WRITE_SYSREG_LR(7, val);
         break;
     case 8:
-        WRITE_SYSREG(val, ICH_LR8_EL2);
+        WRITE_SYSREG_LR(8, val);
         break;
     case 9:
-        WRITE_SYSREG(val, ICH_LR9_EL2);
+        WRITE_SYSREG_LR(9, val);
         break;
     case 10:
-        WRITE_SYSREG(val, ICH_LR10_EL2);
+        WRITE_SYSREG_LR(10, val);
         break;
     case 11:
-        WRITE_SYSREG(val, ICH_LR11_EL2);
+        WRITE_SYSREG_LR(11, val);
         break;
     case 12:
-        WRITE_SYSREG(val, ICH_LR12_EL2);
+        WRITE_SYSREG_LR(12, val);
         break;
     case 13:
-        WRITE_SYSREG(val, ICH_LR13_EL2);
+        WRITE_SYSREG_LR(13, val);
         break;
     case 14:
-        WRITE_SYSREG(val, ICH_LR14_EL2);
+        WRITE_SYSREG_LR(14, val);
         break;
     case 15:
-        WRITE_SYSREG(val, ICH_LR15_EL2);
+        WRITE_SYSREG_LR(15, val);
         break;
     default:
         return;
@@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu *v)
     if ( v == current )
     {
         for ( i = 0; i < gicv3_info.nr_lrs; i++ )
-            printk("   HW_LR[%d]=%lx\n", i, gicv3_ich_read_lr(i));
+            printk("   HW_LR[%d]=%llx\n", i, gicv3_ich_read_lr(i));
     }
     else
     {
         for ( i = 0; i < gicv3_info.nr_lrs; i++ )
-            printk("   VCPU_LR[%d]=%lx\n", i, v->arch.gic.v3.lr[i]);
+            printk("   VCPU_LR[%d]=%llx\n", i, v->arch.gic.v3.lr[i]);
     }
 }
 
diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
index 6841d5de43..8a9a014bef 100644
--- a/xen/arch/arm/include/asm/arm32/sysregs.h
+++ b/xen/arch/arm/include/asm/arm32/sysregs.h
@@ -62,6 +62,23 @@
 #define READ_SYSREG(R...)       READ_SYSREG32(R)
 #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
 
+#define ICH_LR_REG(INDEX)        ICH_LR ## INDEX ## _EL2
+#define ICH_LRC_REG(INDEX)       ICH_LRC ## INDEX ## _EL2
+
+#define READ_SYSREG_LR(INDEX)    ({                         \
+    uint64_t _val;                                          \
+    uint32_t _lrc = READ_CP32(ICH_LRC_REG(INDEX));          \
+    uint32_t _lr = READ_CP32(ICH_LR_REG(INDEX));            \
+                                                            \
+    _val = ((uint64_t) _lrc << 32) | _lr;                   \
+    _val; })
+
+#define WRITE_SYSREG_LR(INDEX, V) ({                        \
+    uint64_t _val = (V);                                    \
+    WRITE_CP32(_val & GENMASK(31, 0), ICH_LR_REG(INDEX)); \
+    WRITE_CP32(_val >> 32, ICH_LRC_REG(INDEX));           \
+});
+
 /* MVFR2 is not defined on ARMv7 */
 #define MVFR2_MAYBE_UNDEFINED
 
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 54670084c3..353f0eea29 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -471,6 +471,9 @@
 
 #define READ_SYSREG(name)     READ_SYSREG64(name)
 #define WRITE_SYSREG(v, name) WRITE_SYSREG64(v, name)
+#define ICH_LR_REG(index)          ICH_LR ## index ## _EL2
+#define WRITE_SYSREG_LR(index, v)  WRITE_SYSREG(v, ICH_LR_REG(index))
+#define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
 
 #endif /* _ASM_ARM_ARM64_SYSREGS_H */
 
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index 6daf2b1a30..4421dd49ac 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -362,6 +362,48 @@
 #define MVFR0_EL1               MVFR0
 #define MVFR1_EL1               MVFR1
 #define MVFR2_EL1               MVFR2
+
+#define ___CP32(a,b,c,d,e)        a,b,c,d,e
+#define __LR0_EL2(x)              ___CP32(p15,4,c12,c12,x)
+#define __LR8_EL2(x)              ___CP32(p15,4,c12,c13,x)
+
+#define __LRC0_EL2(x)             ___CP32(p15,4,c12,c14,x)
+#define __LRC8_EL2(x)             ___CP32(p15,4,c12,c15,x)
+
+#define ICH_LR0_EL2               __LR0_EL2(0)
+#define ICH_LR1_EL2               __LR0_EL2(1)
+#define ICH_LR2_EL2               __LR0_EL2(2)
+#define ICH_LR3_EL2               __LR0_EL2(3)
+#define ICH_LR4_EL2               __LR0_EL2(4)
+#define ICH_LR5_EL2               __LR0_EL2(5)
+#define ICH_LR6_EL2               __LR0_EL2(6)
+#define ICH_LR7_EL2               __LR0_EL2(7)
+#define ICH_LR8_EL2               __LR8_EL2(0)
+#define ICH_LR9_EL2               __LR8_EL2(1)
+#define ICH_LR10_EL2              __LR8_EL2(2)
+#define ICH_LR11_EL2              __LR8_EL2(3)
+#define ICH_LR12_EL2              __LR8_EL2(4)
+#define ICH_LR13_EL2              __LR8_EL2(5)
+#define ICH_LR14_EL2              __LR8_EL2(6)
+#define ICH_LR15_EL2              __LR8_EL2(7)
+
+#define ICH_LRC0_EL2               __LRC0_EL2(0)
+#define ICH_LRC1_EL2               __LRC0_EL2(1)
+#define ICH_LRC2_EL2               __LRC0_EL2(2)
+#define ICH_LRC3_EL2               __LRC0_EL2(3)
+#define ICH_LRC4_EL2               __LRC0_EL2(4)
+#define ICH_LRC5_EL2               __LRC0_EL2(5)
+#define ICH_LRC6_EL2               __LRC0_EL2(6)
+#define ICH_LRC7_EL2               __LRC0_EL2(7)
+#define ICH_LRC8_EL2               __LRC8_EL2(0)
+#define ICH_LRC9_EL2               __LRC8_EL2(1)
+#define ICH_LRC10_EL2              __LRC8_EL2(2)
+#define ICH_LRC11_EL2              __LRC8_EL2(3)
+#define ICH_LRC12_EL2              __LRC8_EL2(4)
+#define ICH_LRC13_EL2              __LRC8_EL2(5)
+#define ICH_LRC14_EL2              __LRC8_EL2(6)
+#define ICH_LRC15_EL2              __LRC8_EL2(7)
+
 #endif
 
 #endif
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 48a1bc401e..87115f8b25 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -185,9 +185,9 @@
 #define ICH_LR_HW_SHIFT              61
 #define ICH_LR_GRP_MASK              0x1
 #define ICH_LR_GRP_SHIFT             60
-#define ICH_LR_MAINTENANCE_IRQ       (1UL<<41)
-#define ICH_LR_GRP1                  (1UL<<60)
-#define ICH_LR_HW                    (1UL<<61)
+#define ICH_LR_MAINTENANCE_IRQ       (1ULL<<41)
+#define ICH_LR_GRP1                  (1ULL<<60)
+#define ICH_LR_HW                    (1ULL<<61)
 
 #define ICH_VTR_NRLRGS               0x3f
 #define ICH_VTR_PRIBITS_MASK         0x7
-- 
2.17.1


