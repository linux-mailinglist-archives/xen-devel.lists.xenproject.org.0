Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D013700A6F
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 16:36:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533846.830820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxTsB-0000WE-05; Fri, 12 May 2023 14:35:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533846.830820; Fri, 12 May 2023 14:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxTsA-0000UM-Sk; Fri, 12 May 2023 14:35:54 +0000
Received: by outflank-mailman (input) for mailman id 533846;
 Fri, 12 May 2023 14:35:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iM5+=BB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pxTs9-0008Qm-5H
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 14:35:53 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49a3dc77-f0d2-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 16:35:49 +0200 (CEST)
Received: from MW4PR03CA0212.namprd03.prod.outlook.com (2603:10b6:303:b9::7)
 by MN0PR12MB6367.namprd12.prod.outlook.com (2603:10b6:208:3d3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.21; Fri, 12 May
 2023 14:35:47 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b9:cafe::3e) by MW4PR03CA0212.outlook.office365.com
 (2603:10b6:303:b9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.24 via Frontend
 Transport; Fri, 12 May 2023 14:35:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.23 via Frontend Transport; Fri, 12 May 2023 14:35:46 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 May
 2023 09:35:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 12 May
 2023 07:35:45 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 12 May 2023 09:35:44 -0500
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
X-Inumbo-ID: 49a3dc77-f0d2-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0Tzh6k/Bu/yPrZNXWIm+QmDZqqEZwDPd5G+bQpJthVEBJzewbFwpcW7S4i0Yvc/Rc9uyLOfiyZOZQnz3RGHC9D8qx/aQKcROXlMl2d5VtHriM/yvlk3IV4Fe6YtZjvxr9XH1cwisjwOR3jPq3l575/7jzdsGsGGG6jhSyfTJA0imK7fT7HU/OEEUrmZM8MB1RucFEb/uABqw8QvhAzuGOdhe6Y8+A12/ja4qaV7RxB3VWdaYklA3khtn589nPqUCCluxh/WsbphDxHAjXf4fAmkZSbBWMPYgfFxeuExjwiZnEw1H/ehhu5i5rYkFi7aEkLQ1Z6Nq2ALfYi22WtuxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccLxKQQiah6/PEdbn1fz+Wj01++EGami0z+kF1CwjS0=;
 b=YwzYZXatsoAoW44buJ0ksHkBT5Mvzu0fPDcApSswtKCg/mMREZlTcDG2icRIhZsDi/9dQXOPDLVh3ptlUsNnjmn+DQYs4yeCzIepimSqPR9KdnJI3vN2EUrrGJmQCh4iXxarG7icJ8rVkB29vL6adOXWsJWhS+Sf9XXS6Fx1eZvhM6p6KbZyE3fdpJpWydnVF1rdc55KcdiBIg/fN2imestPqjvStSaBp8KoF+cx/SF7dKd81ev/FPHe04xDk/8ZBVzOvKbJDuvnk3l6wTRhJyRPStHSsyTXCvz1OPPlLu87h3lNnC4k6cS+CysSfHObWSKC/LL4ZJugkYJhXh+Tpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccLxKQQiah6/PEdbn1fz+Wj01++EGami0z+kF1CwjS0=;
 b=LdJV2ofAhTabjhQZc5daUtxocD8YA4LOfsSZSETw1jWBlfodY+IAZcQYO7JTWC0XiTX2Gu3QIqDmeN5q5Kd3VdSinrji+KQ3/BkNSDFBQefkADfb7QBjsE20Kx+TRus8NrTvQ662eyPXo4LwEsh95fMYcuBn4os+I6VHm+iQGRw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm: smmuv3: Advertise coherent table walk if supported
Date: Fri, 12 May 2023 16:35:35 +0200
Message-ID: <20230512143535.29679-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512143535.29679-1-michal.orzel@amd.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|MN0PR12MB6367:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f307bf-0df1-4b57-5f94-08db52f62ccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E7FsncrfND1k6Ehp+lISo5GtQyyMH6ME2ymQMEQI10//pmQji4defAEowZ3mLXfSzIWja/ilA45mksxxMyu2zq4PmlMizXLwQrGL8uMNYPnH7K9E1VxMmBmAVyxkLAWUIoy9c6Fzo6RGqys2hrL1WGzx2/qNNTUgqsAICbVndaOmVTxJS/UAiHHxB5qg57ORgRgmWAg1FQvNMe3Y0iys7s5ESqlpZYBnAKBEswjLrQNeqxZgCK+2TA1hmI/w5V9Z7HUJi+8q8myGG7QUQbUsiuu6yLgNUBs5OYtopQT35Tt64KE1gN1IhO4grlPmhyTt7TccJAc5O1HTtYaGWzXDztdjzZqHAfql0oHD+KbzkcHcEHoBdQ+fjX5R1Y1JNl+7xrSXV8hJzCdxuArlC2i1bXqNRqN0qQZbUU//E8JPOe82I10blMw0jnrP373d1/cdBjujwW8GPVA9y46ri8e3byDvwNfbozwL4OhyUPGs0MW/15JfGvvvViZRmGApD+u7zu0P51ls/q/pIT5P0/bW18whBCZjL8FWodeGikg7yxpRNL4roJAVcBGXdb/Q9WEbkTzz8h1rJHJ4vK7Lx4gT4V00ZlPpHaJ+FVbhYnGKE9B7ztYm8bG9QfIOD48E8XLScE3+Egnz5G3P1mCAzA54CsYUn0krkRD8OpYXhkY/qDUlJbF2Fwdub1dZq8kCp0uZT3sWlO6C+kfgg0+Mm181qwSSDiU424IytDqqRnyIrjjQQKEdBN4j8ARkUalY0K6rzB/QFOe08SGCHu7V5e7t/w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199021)(46966006)(36840700001)(40470700004)(5660300002)(36756003)(44832011)(40460700003)(8936002)(8676002)(47076005)(83380400001)(336012)(36860700001)(186003)(2906002)(2616005)(426003)(81166007)(356005)(82740400003)(82310400005)(86362001)(4326008)(26005)(1076003)(316002)(40480700001)(70206006)(70586007)(54906003)(6916009)(478600001)(6666004)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 14:35:46.8452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f307bf-0df1-4b57-5f94-08db52f62ccb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6367

At the moment, even in case of a SMMU being I/O coherent, we clean the
updated PT as a result of not advertising the coherency feature. SMMUv3
coherency feature means that page table walks, accesses to memory
structures and queues are I/O coherent (refer ARM IHI 0070 E.A, 3.15).

Follow the same steps that were done for SMMU v1,v2 driver by the commit:
080dcb781e1bc3bb22f55a9dfdecb830ccbabe88

The same restrictions apply, meaning that in order to advertise coherent
table walk platform feature, all the SMMU devices need to report coherency
feature. This is because the page tables (we are sharing them with CPU)
are populated before any device assignment and in case of a device being
behind non-coherent SMMU, we would have to scan the tables and clean
the cache.

It is to be noted that the SBSA/BSA (refer ARM DEN0094C 1.0C, section D)
requires that all SMMUv3 devices support I/O coherency.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
There are very few platforms out there with SMMUv3 but I have never seen
a SMMUv3 that is not I/O coherent.
---
 xen/drivers/passthrough/arm/smmu-v3.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bf053cdb6d5c..2adaad0fa038 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2526,6 +2526,15 @@ static const struct dt_device_match arm_smmu_of_match[] = {
 };
 
 /* Start of Xen specific code. */
+
+/*
+ * Platform features. It indicates the list of features supported by all
+ * SMMUs. Actually we only care about coherent table walk, which in case of
+ * SMMUv3 is implied by the overall coherency feature (refer ARM IHI 0070 E.A,
+ * section 3.15 and SMMU_IDR0.COHACC bit description).
+ */
+static uint32_t platform_features = ARM_SMMU_FEAT_COHERENCY;
+
 static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
 {
 	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
@@ -2708,8 +2717,12 @@ static int arm_smmu_iommu_xen_domain_init(struct domain *d)
 	INIT_LIST_HEAD(&xen_domain->contexts);
 
 	dom_iommu(d)->arch.priv = xen_domain;
-	return 0;
 
+	/* Coherent walk can be enabled only when all SMMUs support it. */
+	if (platform_features & ARM_SMMU_FEAT_COHERENCY)
+		iommu_set_feature(d, IOMMU_FEAT_COHERENT_WALK);
+
+	return 0;
 }
 
 static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
@@ -2738,6 +2751,7 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
 				const void *data)
 {
 	int rc;
+	const struct arm_smmu_device *smmu;
 
 	/*
 	 * Even if the device can't be initialized, we don't want to
@@ -2751,6 +2765,14 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
 
 	iommu_set_ops(&arm_smmu_iommu_ops);
 
+	/* Find the just added SMMU and retrieve its features. */
+	smmu = arm_smmu_get_by_dev(dt_to_dev(dev));
+
+	/* It would be a bug not to find the SMMU we just added. */
+	BUG_ON(!smmu);
+
+	platform_features &= smmu->features;
+
 	return 0;
 }
 
-- 
2.25.1


