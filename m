Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2271971F74F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542797.847157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syX-0003CP-Gh; Fri, 02 Jun 2023 00:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542797.847157; Fri, 02 Jun 2023 00:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syX-0002zU-0U; Fri, 02 Jun 2023 00:49:05 +0000
Received: by outflank-mailman (input) for mailman id 542797;
 Fri, 02 Jun 2023 00:49:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syS-0000if-Vw
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:00 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4316075a-00df-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 02:48:59 +0200 (CEST)
Received: from DM6PR03CA0074.namprd03.prod.outlook.com (2603:10b6:5:333::7) by
 BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Fri, 2 Jun
 2023 00:48:56 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::95) by DM6PR03CA0074.outlook.office365.com
 (2603:10b6:5:333::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:56 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:55 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:54 -0500
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
X-Inumbo-ID: 4316075a-00df-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L26MiYxe1R9ZduPra0t4svbywQKYqhNTWmixJ5taaF5zewdJjHqDAmfKKl6aNoU71q70S4kEoRx5yKFaYKobDBkELfOQzPBePb9dIGNIF3klLyCPcJO6oCyWrTMGmiUSj0B1LBuOUYuRuXFvc0HC/+TNGBek4HamH4uDB/qdy/GAo/EbkxcRy66txfU3BX92X4qIzLqxAZfZAaBTZYMek9gq+UnRRJ4d+nVXVjmedtvNt3+v0mVFnsdoe7QAEQ6YzGA6uCH4K+AOlJ9w6HQ4BqqUisM7LLTR4vOKNP6yDEgymtYuQiKcIHrAS3a+yt1Aokx7bTixiq7UmSTY2+MtrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8f6Wjw45ONksBxgsuuhCKdaU9dyqrhh4lFwNBN7Yrs=;
 b=I4Q7k9x+ahBWBVj3K0eqhewn44sxhfRHxqvLBiaQsn7/4u9Sp0Zd87He1Zh+lTIVWaccV6zbPVA9TookyuWKgWyx3UDOBN5rPyP4e9dkPiwM293R8whvDNdHFlqZdH0UlOjSZG3hck45Qao1HV0MzaZ47xdBz9dKJ25z6kIeejmm9MllWFn5rjGqpyzBbye9wIutvKwkjg9MqaHx3/Pw3D9vtEMbFv3uj5DmU58yt8LEd94KqaCF2BLUKZ1wKkyU6Gvvqov8xh0x4hsPPzPA9jbiHP/29o0v76mEbxgfwkwIsi0w4ua0fBGJHRLZSEcpVMUJ9h9okfa+r29UKFfxCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8f6Wjw45ONksBxgsuuhCKdaU9dyqrhh4lFwNBN7Yrs=;
 b=I1HKJHIsQVNgT4GI25U2DhS0jmwfhJmgHWR4o9Db05sRqcz+fmfzAwM9ykDv0geCRtfAW/UM7F8nFQ5mWTZ8GyWa7XM/p/elv7q8KfYwdC++gLrET43/jgWkExh82zjb+LerGc3TTtvsii3p18C/AaigZ28Mb2jcETEL19ZyAeA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v7 12/19] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Thu, 1 Jun 2023 17:48:17 -0700
Message-ID: <20230602004824.20731-13-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT053:EE_|BL1PR12MB5753:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb94667-5c61-4736-1876-08db63032518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VnnBptogcLG1GiuYNmXTDIatpv8PWVsbLqJ8+bSGaCJ4QllWDPJSmP1N7QIhBShCDg2EBJ27+3gSU58y1pPesmXd4WU34uR/OBhT4TFLpYCUlDRjqQUyoeLZvgB8Qfp0lVXtU1fPbEIL+Qk5cO1cmQuKHrSldQbYo35JwrsFS74mvssy5ObM7f6JKHFcJAkm5uq4JoXnn5bJhGrO+fDoxUY5J6NC3+z77vNDojapMoerNB7En7rcPHVNmF84DH21JP56kBtqDdd7Z62oFRQnJyE0q3n060aJDwW6sETUvO1ZsL2hIz5f3DpNufLgzBWhwzUXILi9ZtuO9EKdK4sAHtZlILBWoS0qefligC04y0fqTd8qU6ifQbxqqsMnHuhcpPiddDMQMtYQd2Nt12ABM68ifjno++7QNDaT9Hpxaqed94Qbr7MUWVYHHzG4rd5Tjq8WYEXH0V4u02+9u1B2wO8MrLdsY0hMn2OaEYVpASftTig8yLrxVojyDtYUkW6GwLmUyua1uktPz3Y7thLtWp4OcrtPdS15n/qw39zs1lzju+vtn1x0gofV2YTBzeKwMGyIbjIb4C8FGoNdz3eRgwoTrpF0nq+987vzrmBGFbokWG25NoZwY9Xg82/XZFMUUmsPe/JHKX+iX3CDsQALsvs50gy991YwqtQ/BQzZou9hE7/GtR+zNNiYSDJkp8RzKC31fsuRFY95l42O1FZ824l5WlaV10pv/G3pM7BWYNIMkpFS6DXeRVxZrFFLAMpYi/uDXsJvqYP7Fr3GM7boyQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(1076003)(186003)(2906002)(36860700001)(36756003)(2616005)(336012)(83380400001)(40480700001)(40460700003)(426003)(4326008)(47076005)(316002)(6916009)(6666004)(70586007)(70206006)(41300700001)(54906003)(82740400003)(81166007)(356005)(478600001)(44832011)(8936002)(26005)(82310400005)(86362001)(5660300002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:56.0663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb94667-5c61-4736-1876-08db63032518
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5753

Add remove_device callback for removing the device entry from smmu-master using
following steps:
1. Find if SMMU master exists for the device node.
2. Check if device is currently in use.
3. Remove the SMMU master.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/passthrough/arm/smmu.c | 59 ++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index c37fa9af13..fdef6e7a7d 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -44,6 +44,7 @@
 #include <xen/irq.h>
 #include <xen/lib.h>
 #include <xen/list.h>
+#include <xen/iommu-private.h>
 #include <xen/mm.h>
 #include <xen/vmap.h>
 #include <xen/rbtree.h>
@@ -815,6 +816,19 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
 	return 0;
 }
 
+static int remove_smmu_master(struct arm_smmu_device *smmu,
+			      struct arm_smmu_master *master)
+{
+	if (!smmu->masters.rb_node) {
+		ASSERT_UNREACHABLE();
+		return -ENOENT;
+	}
+
+	rb_erase(&master->node, &smmu->masters);
+
+	return 0;
+}
+
 static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 					 struct device *dev,
 					 struct iommu_fwspec *fwspec)
@@ -852,6 +866,34 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 	return insert_smmu_master(smmu, master);
 }
 
+static int arm_smmu_dt_remove_device_legacy(struct arm_smmu_device *smmu,
+					 struct device *dev)
+{
+	struct arm_smmu_master *master;
+	struct device_node *dev_node = dev_get_dev_node(dev);
+	int ret;
+
+	master = find_smmu_master(smmu, dev_node);
+	if (master == NULL) {
+		dev_err(dev,
+			"No registrations found for master device %s\n",
+			dev_node->name);
+		return -EINVAL;
+	}
+
+	if (iommu_dt_device_is_assigned_locked(dev_to_dt(dev)))
+		return -EBUSY;
+
+	ret = remove_smmu_master(smmu, master);
+	if (ret)
+		return ret;
+
+	dev_node->is_protected = false;
+
+	kfree(master);
+	return 0;
+}
+
 static int register_smmu_master(struct arm_smmu_device *smmu,
 				struct device *dev,
 				struct of_phandle_args *masterspec)
@@ -875,6 +917,22 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 					     fwspec);
 }
 
+static int arm_smmu_dt_remove_device_generic(u8 devfn, struct device *dev)
+{
+	struct arm_smmu_device *smmu;
+	struct iommu_fwspec *fwspec;
+
+	fwspec = dev_iommu_fwspec_get(dev);
+	if (fwspec == NULL)
+		return -ENXIO;
+
+	smmu = find_smmu(fwspec->iommu_dev);
+	if (smmu == NULL)
+		return -ENXIO;
+
+	return arm_smmu_dt_remove_device_legacy(smmu, dev);
+}
+
 static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
 {
 	struct arm_smmu_device *smmu;
@@ -2859,6 +2917,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arch_iommu_hwdom_init,
     .add_device = arm_smmu_dt_add_device_generic,
+    .remove_device = arm_smmu_dt_remove_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .assign_device = arm_smmu_assign_dev,
-- 
2.17.1


