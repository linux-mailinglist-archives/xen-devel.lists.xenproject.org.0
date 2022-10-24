Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2C960B555
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 20:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429319.680269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on24h-0002In-OE; Mon, 24 Oct 2022 18:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429319.680269; Mon, 24 Oct 2022 18:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on24h-0002GB-L8; Mon, 24 Oct 2022 18:21:23 +0000
Received: by outflank-mailman (input) for mailman id 429319;
 Mon, 24 Oct 2022 18:21:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZViS=2Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1on24g-0002G5-8N
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 18:21:22 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a86d2892-53c8-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 20:21:21 +0200 (CEST)
Received: from MW4PR04CA0068.namprd04.prod.outlook.com (2603:10b6:303:6b::13)
 by BN9PR12MB5291.namprd12.prod.outlook.com (2603:10b6:408:104::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Mon, 24 Oct
 2022 18:21:17 +0000
Received: from CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::c0) by MW4PR04CA0068.outlook.office365.com
 (2603:10b6:303:6b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26 via Frontend
 Transport; Mon, 24 Oct 2022 18:21:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT090.mail.protection.outlook.com (10.13.175.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Mon, 24 Oct 2022 18:21:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 13:21:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 11:21:15 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 24 Oct 2022 13:21:14 -0500
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
X-Inumbo-ID: a86d2892-53c8-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itXPX+BDmO/hZxgNGd6itSu6N7YEwRDM3no2MNj6vE2TQBsH3p1nE0k/HBPbl46QGq3US0CdDi7byJICG4/sE6Cf0QG0e3+x43XBW3Z0AxVAGfBaUE18CkzPI6o00RBVB5pLMppyY7z6nxCdvoCuhcLbMS3ASHn7J3kJtSNvbRBmleb3FSZ0SPJTZ4kAhbtJWNLwdl9Fv4niPuNSAZDYgxKQmvqS7YebU4c8oYlNgtJW20ZoSCagFgeE2bdlbuMYdzh31xtEdYTQmeqZevkzjDQsI9X56sHTnmC3B1oewA2SROdJ0e9emctBlVf2ndHTTcCOQ+HZahLpEeI5yy0kUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yeM/jQyVI4e8F7utEeCiyfeBbYsSPRRaablKg4pztz8=;
 b=HdmKkWR8qOc8sz7BVkkH7enI3wmE/cf2EtoM8s9H+NBVaVvMANu327JcggFW1+m5DFoXEOOdwszpvFUqcE8mDemW2XfiQzN4tK1/cuyCxEpGpv+n+2cmY5oa99CNofgotT/WgHi6yHEYx33FEiV0vKbyg9w5lGvH1mQ7dZNXwG9eO/zpN1cIpSjqIfiqGwlJvbmMou63XR7NJYg4KLjPRHBCsldBlVWDLG2gi8+r3TanhcCSa6oVCAXOhoRE0+UC1wuSwxs+qvxuPMw7eQbrlD8qzJsS1S8sH7VoOTM/h64pAKMvM1TcRadlkgvvl+cz1lfiKQQ8453lj9GcM+oMVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yeM/jQyVI4e8F7utEeCiyfeBbYsSPRRaablKg4pztz8=;
 b=K/glthB24nksoCoK03hquKEtnGx+F8DO2EeFCyRu/t328k2HAGXaUnxN+0U9dyicS0Lr0wiOJM58ZgKE73mPKrCswdBR28w7ZlNXr3yb6Hpb9jXFN4pKSiwfYbt35tczeNB8OitqVs//1ughaFsk/dc1vFo5esd09/vOKRUN42A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, <michalo@amd.com>,
	Ayan Kumar Halder <ayankuma@amd.com>
Subject: [RFC PATCH v1 01/12] Arm: GICv3: Sysreg emulation is applicable for Aarch64 only
Date: Mon, 24 Oct 2022 19:19:05 +0100
Message-ID: <20221024181917.60416-2-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221024181917.60416-1-ayankuma@amd.com>
References: <20221024181917.60416-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT090:EE_|BN9PR12MB5291:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d79043-67fc-49f3-c1bd-08dab5ec8a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OQFXLdbH/CX3VKAIydvPBx+sFFuQleKtm7bCpYjGYlyzJP0kUw4/aV9UIsOl0OhnkgXK6uiCTZQzK0EDIMA+MO09HjaC3ep5NBK6NNqfkGvSz0peO4///0PHvmVx93DU25c6aJ6dhKDEXPfQnNMomYyDKLFmCq0c7x1azpmm9SWGdPjp0ZJbfw/aSeVhSA4HuPg+rVo1IUBFruulVFXVRrF2xb9IhExvwV1HG924rJjwSmWxoPh9x4B3HIJprD/unvrOt3viHIdwatgmDREGrtdy4eB2ZhkkK6+jK3yXyaW5TtTyinTkmT6ohzXxQUl6iIKoSwG/9qAJZjNorNPORd668EINgsPB2kYfhRLPE6W/HIGqdbq9qLcDobMmkeSNwtCDU+J8Qk9z5jAcoFF9Y5PUFL5p4fUJe2GhrbASQThLtgWU4xLQFCevBiLk+yw+Jy7Z/23TcsbrNQdcFz/6FxDpWLQ55+AFBfkRCUJPwphhSpvH9GASo5zgIyIN96mqhGnaN4jy0BpqoH3GuzCji9DPOWs3NIwF4Uf4qlWYb6GRB7Tmn9l+3qIKfAZMUYT221wyhxWPLUDUMuOpOJ4X793p5VhZElqAwoE6X62ZSdw6GazUv7U03ZbkqyqQK0U/P7jsWPj5MF5UuaN5L5eCQVcsKhcVIAGn4255m4dX/X2QUXBOdCxiUz3sHyHxXbonjCOmZQovLL1RdFvpr0XhqiWIe4jpE6vJ4axuT/N0bRhtFMmf034CJDjjSW6gK1L+t7lWHNeAiFv1Kv/379f7ztorlZDSLRjQYIdYIBzm3EA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(41300700001)(40460700003)(82310400005)(478600001)(356005)(81166007)(54906003)(316002)(6916009)(6666004)(36860700001)(5660300002)(36756003)(2906002)(186003)(47076005)(336012)(82740400003)(70586007)(4326008)(8676002)(1076003)(70206006)(40480700001)(26005)(2616005)(426003)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 18:21:16.6254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d79043-67fc-49f3-c1bd-08dab5ec8a92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5291

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


