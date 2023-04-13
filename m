Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E926E13A5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 19:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520856.808946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0tj-0001nY-S7; Thu, 13 Apr 2023 17:38:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520856.808946; Thu, 13 Apr 2023 17:38:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0tj-0001hd-Mm; Thu, 13 Apr 2023 17:38:15 +0000
Received: by outflank-mailman (input) for mailman id 520856;
 Thu, 13 Apr 2023 17:38:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GAK=AE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pn0ti-0000rf-Pk
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 17:38:14 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f63001a6-da21-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 19:38:13 +0200 (CEST)
Received: from BN8PR15CA0010.namprd15.prod.outlook.com (2603:10b6:408:c0::23)
 by IA0PR12MB7723.namprd12.prod.outlook.com (2603:10b6:208:431::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 17:38:09 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::f9) by BN8PR15CA0010.outlook.office365.com
 (2603:10b6:408:c0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 17:38:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 17:38:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:38:08 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 13 Apr 2023 12:38:07 -0500
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
X-Inumbo-ID: f63001a6-da21-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xs+R+dY11cRv/AkZmz3QR253FUC5U1/Vup5WaDUnPv7yK2JMj1zW3pYEY5UIeJdXT/Og5OX/HgIOp5yUa/SOQd7GvqUrj+39WmYUL6dQ4Fb7a9nYTf0birpKUUrzNeWTmRtFPEz3E9d2I9KIZwwg8UtlvH7jMSs5i33/Au+iwbhkozJGncPZcGhI8UcmigqtHsW+vLVs22kPpR11YOGEI8ZYeG2TZZhRpMw3QdIOy58XKrBaTdXJwihW/G7nC8RuwhJdjFlPWDsMSjf4D9qBWRtNfPhotBua3dK8uc4m8jVVsKoWJz5Ilp3XUg5GVZwo1soIM8+KlfPloTRmmEjufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84Q/bSxo/zI/eadAn9/P6keU8t8kk/hED39X4Kpg+4k=;
 b=cHCO+BxWFaXQH2iY/Z4wvhNEyADR4mO1DkHFLK51X+KQcYRhB860SFEbJijHnyDDEPSo2P4p59JM15Z85PRqTyc/9n00NvJxzdvVfU+vfihMamJ3xXhVIuKPD5kZd9w6c5nDDHbJh3cOAVIjeS011fTrn7cDYOFexnoH3/P4CCk8tLfaXuEBmLc0oFMq2rysuvVYq4w24cH0mZBhw/QJNqtvxFNAREg1aPXmaYZSYjHqFv+92jt76tCYTI3LpdVM24+gHi/o+5bBNNDEY+Xm/sC3AkW5DheJmhg1mVJwptSmKnOwKOumAcU6b/TPrngeeoLzqPyhM3JsiTxKy0Ryig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84Q/bSxo/zI/eadAn9/P6keU8t8kk/hED39X4Kpg+4k=;
 b=0SSkUOsUlrD+tnVrzTBjvZbL4V9Ykah6RYry47qHRraw1axt8/gouRabnTNdCtX8bLp7x/q+N7+jgTwA0ogcVcyrmmFV3GGX9pZbO+V8Dl8NtPLLAXGHrtfJh8P5mrl64nR6g2q0C4D/cs1uyuBWn6sikrxSdLMDVGIicMwiahs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v5 04/10] xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to SMMU_CBn_TTBR0
Date: Thu, 13 Apr 2023 18:37:29 +0100
Message-ID: <20230413173735.48387-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT056:EE_|IA0PR12MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: d4fd22d6-3c30-4f17-a19e-08db3c45d902
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TsSmC5OHrPe9eiU8xz5clgHDvdA+woZQuuXp9lju1jwW89oj4yjHE+zSG5mTvUlipPMy93VyVBjoEcERR6cRwhezJMT6i7jwH3oGIQN+pxg3yd7DXsZp2BgeIB4Un5e1+D1LZ8PHaOVLzuuKd/pIEJ61ZXXinR4jZlknGeKXPCKrvKh0a01FUz9tztxtRK2uCQTUJDvL9f7/Ja5gqgevDtrYpWPZjMoxeb1zwzqEIeyTRRxyDMonnprADCXN9KOCi2M3Nmt8F4bxX4373KSjm6mEQpLwAPWw8hGTVh0nqKZ/M4ylkfjyhSk8v01MpxOvjkyXsfZ+TC6DHs8E3+vP14+R323E+YIdiqH6wB00/MbDfvwmomBfle1vT18XKFW8SSZPuvwkagUexBvwE3y8UGKEDqSXELdV8jCx8eKj7wl4c6lxNM6S0dEi2AdyHn9N2g2+mLPeWXde63RKfhb3YsE1H2cDp73sNGJ0S9YEps+zK2uI1rzSVWwRLaYkDYscFW2tqr+Xf+jzVd0P1eBBMyVb45hmYNvRlWTIJwJZbYMe37tXdCcK133FE+jWxkuGa7+Wq8LkQj/YSn4HFIj/xtXyJIw/PeKcjDttbsYLMi1fNQwZymw5zoARXCfi0WPk2m0ZU3PZK95OQkxO+DU7rT7yNSsCE+mrstgONmExfj+1UkoIkWcN2GTYfk7FnIcF5Mde5UG/Abq4Q9bft+lTlDOUuaQWtwRa/2f75f6ngS8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(6666004)(40460700003)(6916009)(70206006)(70586007)(4326008)(36756003)(2906002)(7416002)(86362001)(81166007)(82740400003)(356005)(41300700001)(103116003)(5660300002)(82310400005)(8676002)(8936002)(316002)(478600001)(40480700001)(54906003)(1076003)(26005)(336012)(426003)(36860700001)(2616005)(186003)(47076005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 17:38:09.3826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4fd22d6-3c30-4f17-a19e-08db3c45d902
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7723

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

v3 - 1. No changes.

v4 - 1. Reordered the R-b. No further changes.
(This patch can be committed independent of the series).

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


