Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BA270840F
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:41:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536401.834700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeoI-0001Ej-78; Thu, 18 May 2023 14:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536401.834700; Thu, 18 May 2023 14:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeoI-0001Ba-3x; Thu, 18 May 2023 14:40:54 +0000
Received: by outflank-mailman (input) for mailman id 536401;
 Thu, 18 May 2023 14:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7bG=BH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pzeoG-00074K-Ox
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 14:40:52 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [2a01:111:f400:7eab::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb41bd51-f589-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 16:40:50 +0200 (CEST)
Received: from MW4PR04CA0318.namprd04.prod.outlook.com (2603:10b6:303:82::23)
 by SJ2PR12MB9209.namprd12.prod.outlook.com (2603:10b6:a03:558::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 14:40:46 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::1) by MW4PR04CA0318.outlook.office365.com
 (2603:10b6:303:82::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 14:40:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 14:40:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:40:42 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:40:42 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 18 May 2023 09:40:41 -0500
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
X-Inumbo-ID: fb41bd51-f589-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlmwmNq3D7cLBLdPDzjc9NkISAWvS8oY2BzZMBbutii01/nT/hxFjIzRlo8WpBvobHoPTc2uudmxFK67rpxnansMHlzx7LcFLi42Qrc0SHSkoWWrN+dzHjg6tPQHSlO09lMJDHqjzzM9pDKvFfxIrU4Zi5BhKUhd56/M1Lk4PsxjWQBiqIOuRNFxaOas1dLHiaUOdFUsx5EAg8ZHYWRKNKZ4DUx3lPSRd+LHWWYaNiATLYACTs2t8WWTx6or7O+GcxMAnZo46Xh2Gi6FJNs5U+UCcxkVWlejkQ6PYK/1M6iEyGI+5sWVV/7PECB+SX11MLYtmEBnS78piLNxNZ/o/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAgb1ysrPbUg0InpEjefR449H1nWxGwdPTeZHCYsBak=;
 b=KKA6e+1ubKQyK1olEGEKD6P6BJTL2SoS0UztOxQFygdkvfZ2ZThlQe/tCgBVvRpeTNu5LeH+7peaqUnC93wCIbWtg4AgULpafuQBq2jw/GiHXpDu08v2/6I5/TI3RZFQ4sfZ66+eQZ2QKlvV/gn/DDkeGsv7PsaPsI90m7HC1AuWLqXHIDkQyUfZPDcVBEPk9u9JVi1jF9ktck5z+uOE77bvp4Ue5Os/qQzMSYpstKws4w0cPk2PmrSI1Ow4gIghiSABxmK84KUT/vPocO9UakMuzcZaEDA6DwMMRV2KheqivHvDZ7sYtpYyqJ/X/xpy5O+bjO2wnuQYxYd7LrGB7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAgb1ysrPbUg0InpEjefR449H1nWxGwdPTeZHCYsBak=;
 b=2sHMdsD53eCq5+6Y8pcMcBY2s2rZG9VliEa7xNTLE7wKFVtB3mDau/nJZQ8J9QWI1HELxgeM345X1aggLSVS71NK/T3LPDwZGlTCtrhZ9HErWsXzFQkwK2iJaeyc9ky37Js8UcrxHYKxAXB9sSOY2+gXId9gEhADmFb71vse8XE=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v7 04/11] xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to SMMU_CBn_TTBR0
Date: Thu, 18 May 2023 15:39:13 +0100
Message-ID: <20230518143920.43186-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT026:EE_|SJ2PR12MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: bd4570f7-76c0-488d-9dc1-08db57addd82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	327SBPcJ42XIc8xHyjXzwvanvvWZ22qoP2EY7wt80BgGAf/iOzdXrXtZDeRJbDB3zjgOCGvRwraaBVrWsWp8/lKc0noJsByNxQWsCmWiuguS9DenoTBQSvhfmGszbYlnZtfPRovaX8bOGkKl9SrwARixAdzznlNGdKKZ2HFR/HtNNRviRgFL5/IDZrwLi1B2KtA3h2z7gHC+IEgIY9yWouUmkOSbc8MH3XbtbEVSbpycrRrDYMVNueWl5bHrKG2HcCokb/loVEP1ANNHpklQhDJwVd5ovNd22lJdY2DPKPeAVhizaB8/to5FAKqwvP0kkT2Q5oFOM2PnuC4L4J7Ji6WYwdZ8/KWMKg/FLPFWgIzVfyjdEPRwUmV0jombx5rltIGEmY5MXcIaQMkcGAuw1b3T4wG+UBxBTDZKP0WkV4nFNW0vz8/3Ts2BRjtHa7mmeqvEb+rOyVsMKfnTpRwNpc/vNZPSmo9ZFP2QUDbSFuUpnFkPDKcsNAGBO87nVPLEjkDY/zmhmEBlxHXNZUiKI8nndUdx/ql2XlmcaerkW3BPfElpT6SNgkSoBZov3mth34pTI0r2WTVMPr1qWI0FqXwFEvuQsKinI5bLF9kMTLwizqJWksKxwVRa6mM37DY/OnsL8EWG3EUnd0yZ6pC76VX4QlBdRKYpGRpgOUylUVr9hUsCcvWx2/yVqs5Y+erjXyOmcVsT7WY4jYmZP0kcccd+AGVdzZTUr8+G6vcK0kLejEMU2KFJ4CYQT2/+es6YiDKjrx8ZeDkudz0OEXyJuA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(40460700003)(316002)(70206006)(70586007)(478600001)(4326008)(54906003)(6916009)(36756003)(103116003)(63350400001)(83380400001)(63370400001)(47076005)(1076003)(426003)(36860700001)(186003)(26005)(2616005)(86362001)(2906002)(5660300002)(8936002)(8676002)(82310400005)(336012)(6666004)(40480700001)(7416002)(356005)(81166007)(41300700001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 14:40:45.8778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4570f7-76c0-488d-9dc1-08db57addd82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9209

Refer ARM IHI 0062D.c ID070116 (SMMU 2.0 spec), 17-360, 17.3.9,
SMMU_CBn_TTBR0 is a 64 bit register. Thus, one can use
writeq_relaxed_non_atomic() to write to it instead of invoking
writel_relaxed() twice for lower half and upper half of the register.

This also helps us as p2maddr is 'paddr_t' (which may be u32 in future).
Thus, one can assign p2maddr to a 64 bit register and do the bit
manipulations on it, to generate the value for SMMU_CBn_TTBR0.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
---
Changes from -

v1 - 1. Extracted the patch from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
Use writeq_relaxed_non_atomic() to write u64 register in a non-atomic
fashion.

v2 - 1. Added R-b.

v3 - 1. No changes.

v4 - 1. Reordered the R-b. No further changes.
(This patch can be committed independent of the series).

v5 - Used 'uint64_t' instead of u64. As the change looked trivial to me, I
retained the R-b.

v6 - Added R-b.

 xen/drivers/passthrough/arm/smmu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 79281075ba..c37fa9af13 100644
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
+	uint64_t reg64;
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
+		          << 32);
+
+	writeq_relaxed_non_atomic(reg64, cb_base + ARM_SMMU_CB_TTBR0);
 
 	/*
 	 * TTBCR
-- 
2.17.1


