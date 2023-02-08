Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C00368EE7B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 13:06:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491725.761024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDK-00070C-Ml; Wed, 08 Feb 2023 12:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491725.761024; Wed, 08 Feb 2023 12:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPjDK-0006x8-H7; Wed, 08 Feb 2023 12:06:14 +0000
Received: by outflank-mailman (input) for mailman id 491725;
 Wed, 08 Feb 2023 12:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3BG=6E=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pPjDI-0005Yt-SG
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 12:06:12 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8f6829f-a7a8-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 13:06:10 +0100 (CET)
Received: from BN9PR03CA0230.namprd03.prod.outlook.com (2603:10b6:408:f8::25)
 by SJ1PR12MB6220.namprd12.prod.outlook.com (2603:10b6:a03:455::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 12:06:07 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f8:cafe::b6) by BN9PR03CA0230.outlook.office365.com
 (2603:10b6:408:f8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Wed, 8 Feb 2023 12:06:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.17 via Frontend Transport; Wed, 8 Feb 2023 12:06:06 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 06:06:05 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 8 Feb
 2023 04:06:05 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 8 Feb 2023 06:06:04 -0600
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
X-Inumbo-ID: f8f6829f-a7a8-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHOe6KSeFKyBKPf2J8i+A8CsgJiUa5OO0cDZP03Bxv4h25kbUG41qcYlRC6S75ykUtVMdtLHxwQ/dwzcu8fiTE9rbQ70tu51Tl4W1WyjoB07lM/IcMP7K5EGzwZmGASoQFfZFPjJhOBHhSNReVQf5bysnF7XoD1DzKXxdB4xLI5PkgYT/2s6wTCnMtEMBYSLVfxhBNhMF2l6NelrPza0gfRuWOvVHxDrWLMPRg48BR1oYQSWjuIY7RlB9wx8zlTI0cxHqciMqCYxRYks6xSjqpJQag+o/LY7FJnEvruxs5I9LF6S9wxvlGzX/+XSIfK5rIJHrSz3xvPRe6V/mLRlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNZiAudurUH10oR6SRddjZkqMj7xmnDFdnkT/K607Xk=;
 b=TGtJHMjIlj7IPGeypMlCLWhzYpE1G0WG1yR96zGaM/AOmjS0ujbumwsl6oaRy7WRphSkwB65WocXOm7jjxNifiaOnFZmrW8BXyCFnANHLFFBfxk8YNjgO+K3WmPT/IGthyHw3qGkQ9ifaVHq3z8h3l9NIo0k+PXhQMqQMwKs7Abi8x0WHBDSyv3cjlPiuHAjqVDxKE6gqbEHMTv2Up3AQItKC+x5AYICO1IFfq40mDLb0DahR7hB8DPHWWbtD02EXzoWdtA+ZnrotouTDPN9/FJ2q3GGEXc0t/ewrw5q0fdhsQ43ZEXM4BwQyGhSCJDhrKdAujth9P5fwm665k0egg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNZiAudurUH10oR6SRddjZkqMj7xmnDFdnkT/K607Xk=;
 b=dI2JpUNyWf5zpLherLQpQXl7UM7flk+nGB3cAuswJJcGCdaRwPluoR9G2C6clArGRDGumfDR6UYljcXEXNq3aFpc0cKzkBMii7y4PoQNfd5N9mcQvsATCpEi0wK/2ZBJPdaAQl8+0WSj0icZYjyn2USYWLIKPFGBXunRiU8AlCg=
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
Subject: [XEN v3 5/9] xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to SMMU_CBn_TTBR0
Date: Wed, 8 Feb 2023 12:05:25 +0000
Message-ID: <20230208120529.22313-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT068:EE_|SJ1PR12MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: eaf8e6d7-befb-4405-9b73-08db09ccdb67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zSfFdIJa0eWdbPTD+99ILui8bDnYvpqqY2IUK4OMN4UGkWqcyubtJomDr681hLGkOZ7ts+0rIThZU7XdRolW2m2JxELeyM2gY05HTPqj60m2AYTScUUXCgnDnSscvqMfCdGsYbZA9LBgvlm8TnIA7sKAwPlxNmlqsC49NSVIe7nq+QroTDuR9rG/strBHdET3cw0eMulzyznX0QQuwbSUzEeaIQqtq/2t9Cv2A6UdDs0pty18Ozel8Oo4KItd0aaEbulX/JoDqq5rMlQLdNyLMZ2TO0t/b5G2sVZF/KRd84+y1t8SDVbuR2WVxDvpgXYAyQXPD5SiqFIcrarFNFusCrpOpvKZTBKjNjjkRtBmc0GG2+rf5XObOyphY7bDdbXdJg2IFpvkVcjhWv2w5Chs5ICkyCVf5+RJ61g+RoU3Wn7a0HV/rPo6gZG8INd8ykphT/UHOyzE9RolrdHqHceStNiIFwgGz+hJhj2uoeiy3HUosPeGsMEHSN0Y5ti3rHtFfRZbAEfdKgU178j/8e9LwuGU+Eko2EbHy/AlflS34PEJN5kdKQfCySS7LjE0jvZexeNHNa4QpNlY+rbU4H7Epi1c7opqvrsXTZhuSu2mtvtg5F8Gk7kf8f59+KsrOdUt74f1iXzAIjgkVmItoToXMIezG4XNE8jdV4Lue2z8dtbotzPVqlJkewmkRSAWz3HeCdz/lzYSX6rAth40T6EH20mvaxov8iqT/9NIyHB5gQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199018)(36840700001)(46966006)(40470700004)(7416002)(36756003)(186003)(82740400003)(26005)(2616005)(81166007)(426003)(6666004)(47076005)(82310400005)(83380400001)(36860700001)(1076003)(336012)(70206006)(70586007)(103116003)(4326008)(6916009)(40460700003)(40480700001)(8936002)(5660300002)(41300700001)(8676002)(356005)(86362001)(54906003)(478600001)(316002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:06:06.1567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaf8e6d7-befb-4405-9b73-08db09ccdb67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6220

Refer ARM IHI 0062D.c ID070116 (SMMU 2.0 spec), 17-360, 17.3.9,
SMMU_CBn_TTBR0 is a 64 bit register. Thus, one can use
writeq_relaxed_non_atomic() to write to it instead of invoking
writel_relaxed() twice for lower half and upper half of the register.

This also helps us as p2maddr is 'paddr_t' (which may be u32 in future).
Thus, one can assign p2maddr to a 64 bit register and do the bit
manipulations on it, to generate the value for SMMU_CBn_TTBR0.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes from -

v1 - 1. Extracted the patch from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
Use writeq_relaxed_non_atomic() to write u64 register in a non-atomic
fashion.

v2 - 1. Added R-b.

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


