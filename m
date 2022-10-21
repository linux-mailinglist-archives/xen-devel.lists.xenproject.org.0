Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5141E607ABE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 17:32:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427736.677095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0F-0000Yw-6H; Fri, 21 Oct 2022 15:32:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427736.677095; Fri, 21 Oct 2022 15:32:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olu0F-0000WJ-3J; Fri, 21 Oct 2022 15:32:07 +0000
Received: by outflank-mailman (input) for mailman id 427736;
 Fri, 21 Oct 2022 15:32:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sJ2K=2W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1olu0E-0000AU-6a
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 15:32:06 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 837e7f1a-5155-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 17:32:05 +0200 (CEST)
Received: from BN9PR03CA0428.namprd03.prod.outlook.com (2603:10b6:408:113::13)
 by MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 15:32:01 +0000
Received: from BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::a) by BN9PR03CA0428.outlook.office365.com
 (2603:10b6:408:113::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Fri, 21 Oct 2022 15:32:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT018.mail.protection.outlook.com (10.13.176.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 15:32:00 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:31:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 08:31:57 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 21 Oct 2022 10:31:56 -0500
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
X-Inumbo-ID: 837e7f1a-5155-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvKMrSFQZIOHJ7gnjFo3DdY1BYe4UPKoPSiML4Yak3GkmL2v4nkvK95CS+Zh90KioQzb320IOqgmstXr9au1ExlUBziJo16ypJoU+oWWUio6GyBElab6WRcck26bFHjFFxnDQoVN+8/Dk5NS6DK9uKf66JmVaI52sIXHjrWHtT1dlNt1vuCzQcCUK/4FDYPZXfzJlbrcQacLniJ82VpfsOS1p6L7Sq9AzN1HpE70ebo04XQ1a4jYkUUd9IZba3STRAat/kloSKG6Ad/csdwxWhFIvVl2A1grX6TIjALwiBIXuEuJ1aOYqIeSiqXTvqCgBlFSYC/OfvjmXg1oWFG2Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeM/jQyVI4e8F7utEeCiyfeBbYsSPRRaablKg4pztz8=;
 b=bdozwgnoU+6QNEp92sWervpQNY5MKpk5AsKKpgs4Bibf+kpt0Bs6r3FCM9r5M1IZIl8/hUkIXaTRGE3Dr5bk02EHVBRYStfhZ3qhghloQpeKS+SjbFZ+mPPYV7NjVuJSsiQq1MuPx4cBHLlQBubnJ6vDB/ZdN3FSMdf3O1pYH7jD/QMoQ91ed2MwMQx6WC37PZFUahvFR+/EYY2EpX6T61Y42yY1TKIatVFA6yxaRcfWt0cLGp/RkrMs/7zCEofQwGqISJKQRKXkV3BTG8fOkRFZzU/ZxVFF86MobChxbFJLGIUqhY/d/5StrJ2IApgFomP9MPhj1fiNjOMnVTLtpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeM/jQyVI4e8F7utEeCiyfeBbYsSPRRaablKg4pztz8=;
 b=u5SR6+eSKTujNXMLvsodjnMzGcIu3+DWGhsviQfMpib8JEN1A4uUr0RFvjidQWaeMpCB99ikxnZvc4js4/bhrjEYV8tE2/SaYua0CUoLfEj1ypY/wb6OtjFMymryj7o46FinPU1I/JwxmZhKtYSjJgsc6tAE1ZzFhphCPdj1igY=
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
Subject: [RFC PATCH v1 01/12] Arm: GICv3: Sysreg emulation is applicable for Aarch64 only
Date: Fri, 21 Oct 2022 16:31:17 +0100
Message-ID: <20221021153128.44226-2-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021153128.44226-1-ayankuma@amd.com>
References: <20221021153128.44226-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT018:EE_|MN0PR12MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: ef95849f-fcec-4e2a-42cf-08dab37965f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xbE6eyyPJmD9Tb/YTpKB+sPbR8jeBrzmY4TukGJNKkkDHivDPYM3LPKG9J/QU5cYmpQGOyANQjROI+aev2++RaTZg6LzwTBuk1JFX8newkIiBRXw7Rq7JogoHzvm6nTh3OZx+RxI+Wpz6yyJnaqKT8TlnK1Kh9Dc7p34g6vJi4lNaqzoEZTjDgzb9TxqTak8IpRd5gHFEy/wywxLGxn2OWgNhZvkswfwPPhypKpnRC5QVotfGaGKRdqETOMJVjQfesZfXpm0ckrhbDebNAmNi3R4+J5BwbcngPSyJIhuM5hdDgTX8VFztQ8zbiWv+sHVf487URmlHiw0iVjNkl7j98CFAB2u1uuLJxNRnI7lUun1VPkflOniDeRoYkNiQjXqm/OtpKO9QU7y9JHiJEJJuinE4+wrWiXAMjKB7lJCh9v9JFf+Er9nyjP+l1asFQenQqVrXBPcd6pkbbGY+zUR/tHbHJkOfLrzVbCngqzZWjsADwhCccS4v4hJxNKX/ywkaR3sI1+VAcMd6+O1U/s3gA/vvfD/yKpFOc7zsw2iTnhUR/eEs4pGxjTAAcxYcB/38IGp5z76g76I5Y47uV/2q6aLln8Kfpu5jPmpqjI/lB9PTx2vdHMrZ3F+AE7qGv1JgeUB7F8nfX8PeqiFHXvLu1P9gE3HMvFJ/UTY4rDQEOLKBQt+bTV6CNO8u47pa3uEE9JzbwnFr22QXPA7RCv6LmL+zLU8szzG6YF8U/VX7w+fWybA/6YxbfDPlrpFSAX0Yib9moqpad9tzVYPd/9IckMYUGBfU6w76SH9KcWS9YQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(70586007)(82740400003)(6666004)(5660300002)(186003)(8936002)(1076003)(36860700001)(40460700003)(336012)(36756003)(40480700001)(2616005)(41300700001)(70206006)(4326008)(8676002)(426003)(47076005)(26005)(2906002)(478600001)(82310400005)(356005)(81166007)(316002)(54906003)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:32:00.8537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef95849f-fcec-4e2a-42cf-08dab37965f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319

Refer ARM DDI 0487G.b ID072021, EC==0b011000 is supported for Aarch64 state
only. This is when MSR, MRS, System instruction execution in AArch64 state
is trapped, that is not reported using EC 0b000000, 0b000001 or 0b000111.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---
 xen/arch/arm/vgic-v3.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 0c23f6df9d..c31140eb20 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1520,6 +1520,7 @@ static bool vgic_v3_emulate_sgi1r(struct cpu_user_regs *regs, uint64_t *r,
     }
 }
 
+#ifdef CONFIG_ARM_64
 static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
 {
     struct hsr_sysreg sysreg = hsr.sysreg;
@@ -1540,6 +1541,7 @@ static bool vgic_v3_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr)
         return false;
     }
 }
+#endif
 
 static bool vgic_v3_emulate_cp64(struct cpu_user_regs *regs, union hsr hsr)
 {
@@ -1563,8 +1565,10 @@ static bool vgic_v3_emulate_reg(struct cpu_user_regs *regs, union hsr hsr)
 {
     switch (hsr.ec)
     {
+#ifdef CONFIG_ARM_64
     case HSR_EC_SYSREG:
         return vgic_v3_emulate_sysreg(regs, hsr);
+#endif
     case HSR_EC_CP15_64:
         return vgic_v3_emulate_cp64(regs, hsr);
     default:
-- 
2.17.1


