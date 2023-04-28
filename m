Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDF16F1DB8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 19:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527443.820042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSMb-00078A-KE; Fri, 28 Apr 2023 17:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527443.820042; Fri, 28 Apr 2023 17:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSMb-0006yf-FQ; Fri, 28 Apr 2023 17:58:33 +0000
Received: by outflank-mailman (input) for mailman id 527443;
 Fri, 28 Apr 2023 17:58:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSMZ-0006vK-08
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 17:58:31 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20626.outbound.protection.outlook.com
 [2a01:111:f400:7eab::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47697246-e5ee-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 19:58:29 +0200 (CEST)
Received: from DM6PR03CA0065.namprd03.prod.outlook.com (2603:10b6:5:100::42)
 by SJ0PR12MB7067.namprd12.prod.outlook.com (2603:10b6:a03:4ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 17:58:25 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::9) by DM6PR03CA0065.outlook.office365.com
 (2603:10b6:5:100::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 17:58:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.25 via Frontend Transport; Fri, 28 Apr 2023 17:58:25 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:58:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 10:58:24 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 12:58:23 -0500
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
X-Inumbo-ID: 47697246-e5ee-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4NJnTEFRQM/ycoPF4I/NZ3VSkwWdlJtp1EqV7fs+ySEzy2q0mHSaJ0L7x/BaBsHbpbe2SKthK6bXYXRPXX4thITUHmwKVk67Lo9bahmR0Fei3xFwcy1DUEJwXvu9NuhEX0DjRXRtgCPeE6ljRt+w7bBbm0Rvv7xNxNhRCHMHVGBU0XDLns2wg0vgKMyjIe3LbqXYVOvir7uVgJDNtKOg/dGmjlKSBv3loP5egjdTTSZjnASCeqGKHmgx2eQDHuWWx/Y/zVC2EMWIyn5nyjMQRPfX2QmSF31grPHjeYvBb1Ut2I9iZCLP8DgiUPVyH66tT7WLUhcs94xDGWFvB9czw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pvC9+1/ct+brxho4Wv1tf2FWo3FFS+xRuL5fSwoFRM=;
 b=dmdNrLCOYfoxO/gGNE3jAh13t6M8OatT8pEkL+TDqRtQCZ3mHZiju81KLWCaH2+yflD+tK5Wf7/+FHQtDDQYSwCwpQbYAR9sn8WFWGVRYehg1MK4uNn7iLB1wbSk8EjCXoWGWhjuaCljqRLzS6lRkdaxDz7MmF/4orCoj5tIW0Rzk2q1855KPCFwwEBiN+tz67+nHqdb90ApU+/NoXrFm8z1J5pz4JQ8YNpkjao5I1JY2LZrSQ3MXn6FJwyahwN7mttZRwKOcAQjUPIOlCrfvOUiQkTFL2n7SO0Ad/QD8+8A1euOhkQa4WChsANDau64s4aJnfW759gmszVdt4W7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pvC9+1/ct+brxho4Wv1tf2FWo3FFS+xRuL5fSwoFRM=;
 b=cSO5G7qX86EVqaodc2XVPGLpfG2uI+5t4DDw3Qi63WNS32ghhn7WRpx0xlboE8wKRilnYHbw7QetJoZXBVotNEz5ffR6QGFbUDQXJwjrXsIeqSGhSu+OnqY7OdeXYGJMskNkK303lN1FP3Nl3vxQil/n9smKpDnHS1xPU69Yh0I=
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
Subject: [XEN v6 04/12] xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to SMMU_CBn_TTBR0
Date: Fri, 28 Apr 2023 18:55:35 +0100
Message-ID: <20230428175543.11902-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT064:EE_|SJ0PR12MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: ec4cd5b0-aef2-4b62-08a1-08db481229e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	85PhVJqEBD0yYhcj62ZbpQE/UajUENU952KqaiVi5XX+G8rAi/xnY+913XuAZ/nmq0b/wlVniaY4l+geLcMKO16xC5MncS7XfR4kD2Q6KDrt2OGfT9XuIFDVV+K32ZQ+9AgjMVqZ8QqyECTQ9egUA47whKh6sNSARSz+Wmp72D/0SS8rcxiWmLl9qmd3JeQwmazGliG+VJM2GGGJigQK5xEjzrp9iY/vsP9fNuBmv9v1+LSkfBSqHtU1yNHRN9oqtJxGKT+SNkfJir6yWgysi/2GN8dsN2lccPyXfgN+7mWZmQgG5NiCkTJWD9OfkkE89XIMbgDBSpKtp50edAwDw/k2rIs2P3BJHbRDbIDCXvurtwV3CIiyKCN160xVcEAYUYlX5yI0MuZ5c4iSizIQ5jGWMK4PyiDForUHxxNOhH3dATL96gB0UctNMNcT3oMHCaTTwsyAlqh2KwfN0P+1/XmiPtGOy0IQ7/Ks5aOs3u8gNYrvjGZK7i8TcS1bRzHkb43rCnT4Ziyc7VghpAfvqRH70zVbFHx9FdfocxUqxei93xRJtRfqPnwwc+bw5vefyR+cjXCXegygpTGVvXzxyANv1gCo0tW2W74uyG7dvHXWNBusw/R1rLXtzbB+TOC/biOyZcKfRmS16hbnQrkcPfVz19qfbhFQGvX/1dhg98f4K3/N0nNxJdP9PEfNOcF59vyuyMcvLtPkwIIm3mvE8RgPdahBkR4KNlfeo9bPqbQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(7416002)(5660300002)(2906002)(8936002)(8676002)(36756003)(82310400005)(103116003)(86362001)(1076003)(40480700001)(6666004)(26005)(54906003)(36860700001)(478600001)(2616005)(83380400001)(47076005)(426003)(336012)(186003)(70586007)(70206006)(356005)(316002)(81166007)(6916009)(4326008)(82740400003)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 17:58:25.1894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4cd5b0-aef2-4b62-08a1-08db481229e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7067

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

v5 - Used 'uint64_t' instead of u64. As the change looked trivial to me, I
retained the R-b.

 xen/drivers/passthrough/arm/smmu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 79281075ba..fb8bef5f69 100644
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
+		         << 32);
+
+	writeq_relaxed_non_atomic(reg64, cb_base + ARM_SMMU_CB_TTBR0);
 
 	/*
 	 * TTBCR
-- 
2.17.1


