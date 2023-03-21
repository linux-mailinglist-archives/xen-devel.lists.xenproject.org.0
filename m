Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CCA6C33A6
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:05:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512682.792801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peccD-0007j8-TA; Tue, 21 Mar 2023 14:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512682.792801; Tue, 21 Mar 2023 14:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peccD-0007fc-PV; Tue, 21 Mar 2023 14:05:29 +0000
Received: by outflank-mailman (input) for mailman id 512682;
 Tue, 21 Mar 2023 14:05:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1peccC-0006ai-4t
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:05:28 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d6146bd-c7f1-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 15:05:25 +0100 (CET)
Received: from DS7PR03CA0073.namprd03.prod.outlook.com (2603:10b6:5:3bb::18)
 by DS0PR12MB6415.namprd12.prod.outlook.com (2603:10b6:8:cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:05:22 +0000
Received: from DS1PEPF0000B079.namprd05.prod.outlook.com
 (2603:10b6:5:3bb:cafe::a8) by DS7PR03CA0073.outlook.office365.com
 (2603:10b6:5:3bb::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 14:05:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000B079.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Tue, 21 Mar 2023 14:05:22 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:05:21 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 07:05:20 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 09:05:18 -0500
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
X-Inumbo-ID: 6d6146bd-c7f1-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVuiIhp9xTP1TzDB7R0lPnM/Q94Sodd1w6h6itlfUL2BoeIbZGQ3Mrllbl8cdxFCsPHV6er9xvOqZnD6KAXbOGdcJoqVOVUjxCO4HZHK/4ztu/SxShz+YqSMI/Tn7l/qRxgnqCgaewjoI854kFgyKMibvmcAZPhHA6ONsoWeVk6Xvi/uDW4Nh+q1YJavBriI1yP0Lc5KPp6Zc3oh8wCBZGtlNa+9M6Dm0UaDiMKHgvnv8CyAuzSO8jgmiMCwm4H1cGRyjhQO2b6koofe+m7czNUEVv1njRdVanxXs4lmoNRFDEpbv8hEecXC/aSS9MkOXSTRBeWDi8mqaA0tdgtpww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MyaKuKEF+X/1Kr4Tl9QPLAvUvFva7QxbH99CVqus0xY=;
 b=ZlL5afim+rGFkX4/PtYQ7xqPVuvpLYXzAdbCw49UfwqnF7Zv6GTf9NMri6XL5GeBj3cWMpWFtJEAF8VxDpGiKjIHvwYdU2owC7WKUK+TEcLLu3Rh4Z3S5MR5fjOqERe2nbBB0WF2hRWwyeu37YnaPs53T8fbltiABkRoOqRiBpKmS1n9HPM6rnWAuCsCxFsVimHb5lNcIfmHBSrc9wNUH39n5iQw7DbKvOOuoQoZWiwyiWlDW6RPITsJabNIsaJ1Z/DeO+Igb+bPXfL9u5MIebffGDI8EhIMRPczFV59564mxGbhMFf8vekfzLWaERUey8iWLviwnCmwxvixe7/Wpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MyaKuKEF+X/1Kr4Tl9QPLAvUvFva7QxbH99CVqus0xY=;
 b=ReoJnGhJpRrTwTUGAOIN2plpdNSMUgqBLHz/wclSUQ7nybq9povoBYQOTWk7Y5QWOa6X0eamfVlkHrfpJZQD1S6Gr+ukc6PayDsyKf/xjLYhH3bScywAEF/fz74NE/uHEQu8WC/IbQmQFyOSH0lf6cKoBkR7cp1BhRa7wzIUVgw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 06/11] xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to SMMU_CBn_TTBR0
Date: Tue, 21 Mar 2023 14:03:52 +0000
Message-ID: <20230321140357.24094-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000B079:EE_|DS0PR12MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f74f5e1-0f78-44d8-bd2f-08db2a154fc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DkQet4KD9tM/vlmph+nkGnsmiH9mWPc4NxUcqsJbMNmkEd4ZT3jjs932in0GNf4f//xGdlqGYgoZmWC11y06m7EIL5agmypUJ7bn8k6GYE8oMVOj622nmH86jKZmM+B4Brod+Pu8ArS5+b9b+V4GA5eua+x1XwGB/7fNKCKHWMUYNkXkqUvdYA1cntAOsUTlIVO87E+VFZDK3a5D0y+ErAr6/g52gwwKpX0DNthaGYkeTDcYCT7d+IVY2sZPbFs0ll1CWXRL8crFMDVuDkVqTXZzCBNncChESLom+06w4zVuTe+/HEn/nT1bC8yNBZCUPgYsMhexPW8miDDMglMaeoI0YWPk5sFva4/kvtF8EmfErRysKl83d8O7TGDE8TxQtPND7++WXMsn5DMDRC+Opo091LpPaQ2CJsKVoHnmhTxAPL7MbzRbyiYCbiXOxTRwL/IHNp6UPs+QS+9ujzxo9YCLaf8woPuI2nkGu08cLMLzAd3KSxd5mdkA7kofYMK6JxfSb1XOLcuEPKeGSeaqB23HkI/3CLAaxH/QqKQZCVvwfQyg4MXNhYu9L2WJpCyAvw0JAKza7ZZdhApeN8PAIzyAiG1StWhxQsK74UWvD4ogSOr5259LQ5iWT0ACssSJFFavoZj5q8I9nUEd1UjiKNN26BU85MC15V796o8LQN7ad6Hw3E+sojFnPuv1UiMg8Gopd4Nz1gihg1ctqqgylnZ3mX14srpfJYr8nwUsbpo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199018)(46966006)(36840700001)(40470700004)(41300700001)(7416002)(8936002)(5660300002)(4326008)(36860700001)(40480700001)(82310400005)(356005)(103116003)(86362001)(36756003)(40460700003)(81166007)(82740400003)(2906002)(6666004)(336012)(83380400001)(426003)(47076005)(478600001)(2616005)(26005)(186003)(1076003)(54906003)(316002)(70586007)(6916009)(70206006)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:05:22.3289
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f74f5e1-0f78-44d8-bd2f-08db2a154fc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000B079.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6415

Refer ARM IHI 0062D.c ID070116 (SMMU 2.0 spec), 17-360, 17.3.9,
SMMU_CBn_TTBR0 is a 64 bit register. Thus, one can use
writeq_relaxed_non_atomic() to write to it instead of invoking
writel_relaxed() twice for lower half and upper half of the register.

This also helps us as p2maddr is 'paddr_t' (which may be u32 in future).
Thus, one can assign p2maddr to a 64 bit register and do the bit
manipulations on it, to generate the value for SMMU_CBn_TTBR0.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - 1. Extracted the patch from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
Use writeq_relaxed_non_atomic() to write u64 register in a non-atomic
fashion.

v2 - 1. Added R-b.

v3 - 1. No changes.

 xen/drivers/passthrough/arm/smmu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 79281075ba..c8ef2a925f 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -499,8 +499,7 @@ enum arm_smmu_s2cr_privcfg {
 #define ARM_SMMU_CB_SCTLR		0x0
 #define ARM_SMMU_CB_RESUME		0x8
 #define ARM_SMMU_CB_TTBCR2		0x10
-#define ARM_SMMU_CB_TTBR0_LO		0x20
-#define ARM_SMMU_CB_TTBR0_HI		0x24
+#define ARM_SMMU_CB_TTBR0		0x20
 #define ARM_SMMU_CB_TTBCR		0x30
 #define ARM_SMMU_CB_S1_MAIR0		0x38
 #define ARM_SMMU_CB_FSR			0x58
@@ -1083,6 +1082,7 @@ static void arm_smmu_flush_pgtable(struct arm_smmu_device *smmu, void *addr,
 static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
 {
 	u32 reg;
+	u64 reg64;
 	bool stage1;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
@@ -1177,12 +1177,13 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
 	dev_notice(smmu->dev, "d%u: p2maddr 0x%"PRIpaddr"\n",
 		   smmu_domain->cfg.domain->domain_id, p2maddr);
 
-	reg = (p2maddr & ((1ULL << 32) - 1));
-	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_LO);
-	reg = (p2maddr >> 32);
+	reg64 = p2maddr;
+
 	if (stage1)
-		reg |= ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_ASID_SHIFT;
-	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_HI);
+		reg64 |= (((uint64_t) (ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_ASID_SHIFT))
+		         << 32);
+
+	writeq_relaxed_non_atomic(reg64, cb_base + ARM_SMMU_CB_TTBR0);
 
 	/*
 	 * TTBCR
-- 
2.17.1


