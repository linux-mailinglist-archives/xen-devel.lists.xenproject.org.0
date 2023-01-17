Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1D366E528
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 18:45:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479668.743712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1U-0002e0-Nc; Tue, 17 Jan 2023 17:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479668.743712; Tue, 17 Jan 2023 17:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1U-0002bf-Iu; Tue, 17 Jan 2023 17:45:24 +0000
Received: by outflank-mailman (input) for mailman id 479668;
 Tue, 17 Jan 2023 17:45:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8eG=5O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pHq1S-0000oY-KZ
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 17:45:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b53c60a4-968e-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 18:45:20 +0100 (CET)
Received: from BN9PR03CA0414.namprd03.prod.outlook.com (2603:10b6:408:111::29)
 by CH3PR12MB8235.namprd12.prod.outlook.com (2603:10b6:610:120::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 17:45:16 +0000
Received: from BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::92) by BN9PR03CA0414.outlook.office365.com
 (2603:10b6:408:111::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 17:45:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT041.mail.protection.outlook.com (10.13.177.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 17:45:15 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:15 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 09:45:15 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 11:45:14 -0600
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
X-Inumbo-ID: b53c60a4-968e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBgHzgbQXGPwf6DKE9/WcIqYDTmZhVIwCckFXEyahEkYrMnYNGhSZsxznNLCvJyKMcQ/RVoCE6YzWTqzZIZrDw7aWBWKLCGEqU3IliW2Q9+2e+NJ1eMrNKf/JAOcc3BMdNvt5tfzojx415m86XIsbueHKFWtvRmn+73hrmpAUNP2jW74PTnzgJRDfhoXyi3KbuGIxqxMDkczcdxHN7iEjzfo+vZj9pvy3nIrmMoq60zcA81sBzkKY2nPDKC+oiK2tpUNFi9CZfzrXJUJ+R8NU/u54cbwpo2bk1811ibvD35pmwbCxURS7CCRtXu9EY7qbVmftnzXLHu1LRw+z/Zvlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIKU3XYytNQAfZ0EaTu36MGFEtvhVTZymsJIStWcfzE=;
 b=RuffE0LVPuUpBnHawSiZwLEdt4uHy3q2rxdj0lLFaHEfmefMNvOxQgqB2TYcOHerJPySngZp9kR4PQLxwx8spNxSZZ6UyoTJVgT/nUcT+MoNpH+rypmdg4UwllmTx/vRX/GLpyztoICt4ooUpMmYwfHb0XIMe6+LtiOnyyTcTZmTBIaC52cFcFjirRUFt/hEtbwqT0CBqcCsrdRnP09t2yQkp7x+AyKTXK/9hwVUqE6uB3rlxS7ceNfg+Tb9YVpixTfP662EebrA9OCPKKeLQxUT6eR41b/9IEK4FUYOWpNWRlDXN5f2us9wg04lTxgcQ+lMiVOQ3k2rQMecbje9MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIKU3XYytNQAfZ0EaTu36MGFEtvhVTZymsJIStWcfzE=;
 b=CxWquEZrUDu6JbgCrwU/MiHRLUr7OfUzCzquIyAH8/emcM1ckzPugQH8g7esr05ejpXHfQXnQGVecdrrT2X/r4fObjQ2VZKYL8Gusr4+kXoUAdlPFSiiN72LZZnA3/8aIEpDHA0kjGuC4RpsOFSh5nb6nlgiBP4//1aBNeh/c4Q=
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
Subject: [XEN v2 07/11] xen/arm: smmu: Use writeq_relaxed_non_atomic() for writing to SMMU_CBn_TTBR0
Date: Tue, 17 Jan 2023 17:43:54 +0000
Message-ID: <20230117174358.15344-8-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT041:EE_|CH3PR12MB8235:EE_
X-MS-Office365-Filtering-Correlation-Id: 628ddd1f-16b1-4dac-a72c-08daf8b297b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HGChrRYxvKrxib8KCUVvR8Ynjli+YfbldbI/mAGeq0DnVrcMloryHfOHV74Vealsg6UfypAuLJhz++xhcPunSGIZ7fFb5qspIaBg7DA0CqjAIpywXUoEuPB8LReZUp60eIjByYIvvKCDcWvsFCdzGy5WnZNX3xP5nO7wIt9P1/nQ5/TG2x7KyTWIsQR1J0k0ONVKUAorn/2QW2+HtnRCRn/WOfs/8rXq2g+GiiJRwb9cT2LeLTtWpxJjDtecWei20g3fNjymiZgHfYJJSU1VSjKGCfVdDEg41A4FKpcdq3kCXSkb5NFRfaFgumLQPK26II29kp28kHTCLP3CZjCSySKoQEr1w2aWltUqwjGcLrJHAJi9fpxHfhODfEbmyVe7bFCorQHToTsYptL0KE6uEcxFOARx+zYHF4ixQRzX6dqKtouR+Zn5b7Q95e2/fwQb0zK8oRzjXc8Xu3a9hPYOrJROrOlVlFnb+K6MFlypbwZ0jdmXn7YTz8ZMSUQYN42qfGzTqeCdJGgBb483bqNX+uaofqrD2y6e5FhaSjoD3ezp7CrbRfWWeiuXxGV6ndj4dXoJNDEpZnat0DPtXYCHtl111GTYVl9Qrv/dx8atosLiJaMxBaXDjfNRYaCM8XfaJ+FO7Yyn8Dg2PoLoz2YRI/rlpZ0lCFH2ecNZWsoGbeE35Mm6Xthp/DWBiOh/LL31TkHsG7FU0sEzcNmpxTy1O3uc+HZd8Rn07x41LIu547M=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199015)(40470700004)(46966006)(36840700001)(86362001)(8676002)(82310400005)(103116003)(36756003)(4326008)(26005)(6916009)(70586007)(47076005)(426003)(2616005)(41300700001)(70206006)(186003)(1076003)(6666004)(54906003)(478600001)(81166007)(40460700003)(356005)(2906002)(82740400003)(5660300002)(83380400001)(336012)(36860700001)(316002)(8936002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:45:15.9074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 628ddd1f-16b1-4dac-a72c-08daf8b297b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT041.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8235

Refer ARM IHI 0062D.c ID070116 (SMMU 2.0 spec), 17-360, 17.3.9,
SMMU_CBn_TTBR0 is a 64 bit register. Thus, one can use
writeq_relaxed_non_atomic() to write to it instead of invoking
writel_relaxed() twice for lower half and upper half of the register.

This also helps us as p2maddr is 'paddr_t' (which may be u32 in future).
Thus, one can assign p2maddr to a 64 bit register and do the bit
manipulations on it, to generate the value for SMMU_CBn_TTBR0.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - 1. Extracted the patch from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
Use writeq_relaxed_non_atomic() to write u64 register in a non-atomic
fashion.

 xen/drivers/passthrough/arm/smmu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 0c89cb644e..84b6803b4e 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -500,8 +500,7 @@ enum arm_smmu_s2cr_privcfg {
 #define ARM_SMMU_CB_SCTLR		0x0
 #define ARM_SMMU_CB_RESUME		0x8
 #define ARM_SMMU_CB_TTBCR2		0x10
-#define ARM_SMMU_CB_TTBR0_LO		0x20
-#define ARM_SMMU_CB_TTBR0_HI		0x24
+#define ARM_SMMU_CB_TTBR0		0x20
 #define ARM_SMMU_CB_TTBCR		0x30
 #define ARM_SMMU_CB_S1_MAIR0		0x38
 #define ARM_SMMU_CB_FSR			0x58
@@ -1084,6 +1083,7 @@ static void arm_smmu_flush_pgtable(struct arm_smmu_device *smmu, void *addr,
 static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
 {
 	u32 reg;
+	u64 reg64;
 	bool stage1;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
@@ -1178,12 +1178,13 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
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


