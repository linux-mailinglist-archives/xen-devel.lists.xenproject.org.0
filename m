Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB4077EE76
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585029.916037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDM-0001bM-8v; Thu, 17 Aug 2023 00:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585029.916037; Thu, 17 Aug 2023 00:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDM-0001Xk-4W; Thu, 17 Aug 2023 00:50:16 +0000
Received: by outflank-mailman (input) for mailman id 585029;
 Thu, 17 Aug 2023 00:50:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4E-000280-Ve
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:40:50 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b46852f0-3c96-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 02:40:48 +0200 (CEST)
Received: from SN4PR0501CA0042.namprd05.prod.outlook.com
 (2603:10b6:803:41::19) by BL1PR12MB5349.namprd12.prod.outlook.com
 (2603:10b6:208:31f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Thu, 17 Aug
 2023 00:40:43 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:803:41:cafe::53) by SN4PR0501CA0042.outlook.office365.com
 (2603:10b6:803:41::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:42 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 17:40:40 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:40 -0500
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
X-Inumbo-ID: b46852f0-3c96-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TgTCA2de+NpS+wd3G61FK/f8pxKqqXSgBZ6CgAnI/hpNulyfwG5/aIYIO+KcqU9LPmXqKURJ/LP5d8fjlF1GXlLK07pizA6APGmevJqy5muqm8iSMmf+0Z6nOivcXM46PR8KLvunIc04ztflOAJ5MDdIhR/by6V5onoxvSH1Y8SBspXMnU0ZegLftwTvWqt2Df99z/TZZBfW6/kx6FdsF4KipWBIXjmm459nZpgmu0ePaLoUi0tKtHYCf+/1bOflaSPv0X86bh1bHUrDd8hsTjNZ7DZrnMxxXQmLg2pYpV1Qe2b88D+6Enzbd1WbUcyoVMKlJmUY+qjQwgt0S3G4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z4VnR/rjV3DabEuQM1jMT4AHTgihliMWcytUKhZcwU=;
 b=ThjSag0gEqt1ftICsa75BCvJahEAW/ChTH6U7punLvP7FUQoFg2gncclM23ubDd8VoITzeX7iJy06CfQqU7gzcg9HFNi+BIFiQTynj6PTv2N7gEgaUo5KKef267B4JdFjt8BOVOo6vdFoEFSjcp/JUQ0X9CDQYBaGvmA8EVjcRvEi/jTQpoPOHNUKStCvmmuZLKn9GZlk+NFElk7it8FC8W+7y1Vh1FBDbnae9ioqLXKFvmXl5Iwrd85Z8t+ZBnbPNsY1oa9nsgHmg9EiAIc0qbLNJHqrFFzY6DZzTcQ5NT7OPSUC/HjkJuj90T+cxC8KojRwwuitRcIkkfIeAO3XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z4VnR/rjV3DabEuQM1jMT4AHTgihliMWcytUKhZcwU=;
 b=0YSUyW366VbAXgOBqDATVjgrcnEACRqNzdqVv9+L4VfogMs6sBKCBD8SbZSOqUobg2xcRnvsZH4Fl/h/iWIJpgMdrhxBANXqcUQVaQay8gggncBJOlEKuvd+3S5qkC+2zKgwJcYXIbq5Hz4D4SBzBS7glNvKOgpBfLuD1L5vmuE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Julien Grall <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v8 12/19] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Wed, 16 Aug 2023 17:39:40 -0700
Message-ID: <20230817003947.3849-13-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|BL1PR12MB5349:EE_
X-MS-Office365-Filtering-Correlation-Id: 694f989c-78b3-417e-b675-08db9eba967a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ud7G8hdjYNzPMatuEF8jSmymlV8iWjiBEgWTwPzP5KIrTRAepwqloSFl1o8MINTuZKk2nANgfD+YG5xSEru9EaKWnssMHNQPRYJPgRRgiqEaK8fFwHFwu+zpEMo++We3IaVIB1YDpD03RaOU1uyPaN9Bi+wczHEaMazeFOlBOmWUy4WQ5fZ6BYHx20iOKfLeoijus2YkD89ors9zahxuTmvtSdHNc9LlXaQ8zKaNq5C7DYfL+HEYJwoTXX3ooSGU0o2FptSK0ZxH7kRHFr/KrKt2073lsfjQuu820/YmeO1HS7i+HfmR7NZBdh5YSlH91GVxzbpSujzGX2Dd6ZUR9A5oXm2V3OkdI6XpYllwn2NH6iI+b/74jERc4Iluehixe20ztXnMEDPLnAzcGYmHWDLdkol2GxA5IuwijgSIhu8kGVsot7u1yWodXmAtxaTfeRIlluTzxkXyxfvXjz/sowfgpURI+2xGNGCRJOSaZRt5gWywSyFPa88VEkYLRY7rN5gixop85FMXUHU4uBev5B+eGOFBQMntuxtScyZ9IkbVEnbmc/m0J1gRpmwzY6r/d0n3Ht0/Zf92K0Yvww9S2n0m3Pw3dpEdUjIk0R6YdARfEY6DmtItmzhIKBI9xn4wE7UytPILpMbaJlmr+Xv145o8sHvIy6MLxVLS7BShjSwrwxdvmPqCJni9QxrgbcMOV0048b2EV+e67V+FCPsiROFgMchs4b3DyJusj+4aN4ksH+1TAlCgJ0Tzrzx5ENAPKj7E25R3TYDQXor2DS25pQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(46966006)(40470700004)(316002)(54906003)(356005)(82740400003)(6916009)(81166007)(70586007)(70206006)(5660300002)(41300700001)(36860700001)(44832011)(47076005)(4326008)(8936002)(8676002)(26005)(2906002)(40460700003)(83380400001)(40480700001)(426003)(336012)(478600001)(86362001)(36756003)(1076003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:42.8162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 694f989c-78b3-417e-b675-08db9eba967a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5349

Add remove_device callback for removing the device entry from smmu-master using
following steps:
1. Find if SMMU master exists for the device node.
2. Check if device is currently in use.
3. Remove the SMMU master.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

---
 Changes from v7:
        Added comments on arm_smmu_dt_remove_device_generic().
---
---
 xen/drivers/passthrough/arm/smmu.c | 63 ++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index c37fa9af13..e1e8e4528d 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -42,6 +42,7 @@
 #include <xen/errno.h>
 #include <xen/err.h>
 #include <xen/irq.h>
+#include <xen/iommu-private.h>
 #include <xen/lib.h>
 #include <xen/list.h>
 #include <xen/mm.h>
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
@@ -875,6 +917,26 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 					     fwspec);
 }
 
+/*
+ * The driver which supports generic IOMMU DT bindings must have this
+ * callback implemented.
+ */
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
@@ -2859,6 +2921,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arch_iommu_hwdom_init,
     .add_device = arm_smmu_dt_add_device_generic,
+    .remove_device = arm_smmu_dt_remove_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .assign_device = arm_smmu_assign_dev,
-- 
2.17.1


