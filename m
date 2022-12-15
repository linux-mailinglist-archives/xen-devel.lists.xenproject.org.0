Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDD564E1D8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 20:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463766.722091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tys-0000pS-8w; Thu, 15 Dec 2022 19:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463766.722091; Thu, 15 Dec 2022 19:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5tyr-0000jy-Us; Thu, 15 Dec 2022 19:33:21 +0000
Received: by outflank-mailman (input) for mailman id 463766;
 Thu, 15 Dec 2022 19:33:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BWk7=4N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p5typ-0006KU-Ts
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 19:33:20 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52d228ff-7caf-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 20:33:18 +0100 (CET)
Received: from DM6PR13CA0057.namprd13.prod.outlook.com (2603:10b6:5:134::34)
 by MW4PR12MB6973.namprd12.prod.outlook.com (2603:10b6:303:20a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 19:33:14 +0000
Received: from DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::4b) by DM6PR13CA0057.outlook.office365.com
 (2603:10b6:5:134::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 19:33:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT085.mail.protection.outlook.com (10.13.172.236) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 19:33:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:33:13 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 13:33:12 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 13:33:11 -0600
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
X-Inumbo-ID: 52d228ff-7caf-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hP+x/fYpbSTGDzsUcpUpZlflZK+0iY5GOFu5hE37TGRwF8c2H/RgJrl9Th+selTDn6M9B6vi37bBeQXUAl9jC/fqsKjhS8p6XRZ4N5QSWB+OHjLrJiRL76bxMjmP3KrVY4dIi8WkcuR2xbIPbMsTTBAPXAprHR8tuDjBh7WG/ckk2gMHfbq5tZ3NK8L8veT4vCxXhPkqMxD2d+3+Mu6lZbH1yEsVS2g0OFTSgCkahu+wUXBkzqIzMXjZTWm3xvGTT0t87LL2WSleg1abZ7LbBbkJJ698NUmH5LH/tew+HrlM3QDRuPonA7ZpH6MrLEutLYFy/L5Z95fX03o3XLpuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQPLuzeCeyz59DG1ehsn+YnT+/R316b2RCY1GeYq6m8=;
 b=KMsZL5WAxrpIPNivju+arLv7IxKAPtrW7WFPN9dlB3AbpGbZLJdiQGI4avGLwvd1BXaqh5gU0chYwBQtHs9m+6n+3insLq8b/L/11kQ/zfz/ZY3lKyCEdjSAEElGEGP/sKcKtftY4dk+q2Xe5nsZLd18ftTJgXxU4PbdLMQgQh8FM5EEsU/h7SOjNyf1hqoUUXXnf2E3NPIBC/a3vaGBjc6RjjnQkgaq4KiKac1LPyQ01NBNGY3ldmVac8DJD/f0oWQfMK8j8UQQdl4O12gC+z3Y2mZkr2v3BA7Gfn1LFwfP7J5zv1wdkBUL5splbaN8hf30R2mDkskt9cLyLEn1oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQPLuzeCeyz59DG1ehsn+YnT+/R316b2RCY1GeYq6m8=;
 b=sjb1r1t0l0Cpvx6v8KqNAFIeRXWMb+O8eugDyKWlC11upBL28ma+y3WOhifcB6k9j1w7IehnEbhPz6MMCnictaQA2jWMnGk3RL5tmpUMHZSXVWxjjeAVH8Zm8d1mLhDBa5K8Yq+MaWzo8Fz+nUIX/Eiw7ytGi247z7KFgNMEM2M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr
Date: Thu, 15 Dec 2022 19:32:44 +0000
Message-ID: <20221215193245.48314-9-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT085:EE_|MW4PR12MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: a056e9f1-c7dc-48d5-0034-08daded33581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S0mUW6MG+5wZbROgtqtvMYcKi+zTiyjkojlyJ0rky6Ua4nxIR33VzC/uktuWMYPCrX+O0nLOaRxdLzAwrzTkpQwPedLkGfUMW9Wd+W7w19IdE+DwPGPsI+ndQzrArU+A2yzLyReTveDba6pwSpDg3piNEsNNeoPwFwbdWAtqvNkP9KnCl+QR+bDr3x54Bi0GwbX75K2fU19icj8+1hCx6sqoi0TyGhbTjaliUSbt2yiS1Yf7qn04MLcjl1AQxg0/qhP7UTL3IH0r/gHGsNfRuvOqbme8ZpCwm+TYVBH08gMM+O9TccXKh8mVgDWETONuh8f4PIoXXR8VKoKAINbaQUI6d6gtnCcWLR3UH6jHzXvBiG535Z41WwLgRrJcfDUs4APONOLN4R29IfWJsiS5sKR62fIn1CR401UqplT1hM61nWBVrOYo2XEPorMl8r1tKzt3dAVSNJ/I5rQ1PpqOWt28YvEHnndStkoyybAAEvjA0Fyjggg3Ql5z067nuLSSUQqCx7LxyAhsuzoJwr2LPX544XrZE3AmXqtj5L//WutNPZnnDv53wkPjATXNBV8kTtTtqNdAtYRM3FxfpzZNNIkQke/2r4GgCprNvX6icmZS8TucPEoelfndb4vSgO6JTaWRD0mnPg1IkHlIIqpPqJyR2NURyBWJUY224s0rmj0sxl+HEMAcxUcRWyug7Qs+Jt7IsXKFOsp0IKxH7PKEhiZTFW9z2k8ucdzihOLQDT4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(40460700003)(81166007)(356005)(36756003)(82740400003)(40480700001)(86362001)(103116003)(82310400005)(6666004)(316002)(70586007)(478600001)(186003)(26005)(2616005)(6916009)(54906003)(36860700001)(2906002)(47076005)(41300700001)(336012)(70206006)(4326008)(8676002)(8936002)(1076003)(5660300002)(426003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 19:33:14.2677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a056e9f1-c7dc-48d5-0034-08daded33581
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6973

1. Supersections are supported only for paddr greater than 32 bits.
2. Use 0 wherever physical addresses are right shifted for 32 bits.
3. Use PRIx64 to print u64

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/guest_walk.c          | 2 ++
 xen/arch/arm/mm.c                  | 2 +-
 xen/drivers/passthrough/arm/smmu.c | 5 +++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
index 43d3215304..4384068285 100644
--- a/xen/arch/arm/guest_walk.c
+++ b/xen/arch/arm/guest_walk.c
@@ -149,6 +149,7 @@ static bool guest_walk_sd(const struct vcpu *v,
             mask = (1ULL << L1DESC_SECTION_SHIFT) - 1;
             *ipa = ((paddr_t)pte.sec.base << L1DESC_SECTION_SHIFT) | (gva & mask);
         }
+#ifndef CONFIG_ARM_PA_32
         else /* Supersection */
         {
             mask = (1ULL << L1DESC_SUPERSECTION_SHIFT) - 1;
@@ -157,6 +158,7 @@ static bool guest_walk_sd(const struct vcpu *v,
             *ipa |= (paddr_t)(pte.supersec.extbase1) << L1DESC_SUPERSECTION_EXT_BASE1_SHIFT;
             *ipa |= (paddr_t)(pte.supersec.extbase2) << L1DESC_SUPERSECTION_EXT_BASE2_SHIFT;
         }
+#endif
 
         /* Set permissions so that the caller can check the flags by herself. */
         if ( !pte.sec.ro )
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index be939fb106..3bc9894008 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -229,7 +229,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
 
         pte = mapping[offsets[level]];
 
-        printk("%s[0x%03x] = 0x%"PRIpaddr"\n",
+        printk("%s[0x%03x] = 0x%"PRIx64"\n",
                level_strs[level], offsets[level], pte.bits);
 
         if ( level == 3 || !pte.walk.valid || !pte.walk.table )
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 5ae180a4cc..522a478ccf 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1184,7 +1184,12 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
 
 	reg = (p2maddr & ((1ULL << 32) - 1));
 	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_LO);
+
+#ifndef CONFIG_ARM_PA_32
 	reg = (p2maddr >> 32);
+#else
+	reg = 0;
+#endif
 	if (stage1)
 		reg |= ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_ASID_SHIFT;
 	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_HI);
-- 
2.17.1


