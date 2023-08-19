Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16AE78160E
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586699.918015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qE-0003tU-TD; Sat, 19 Aug 2023 00:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586699.918015; Sat, 19 Aug 2023 00:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qE-0003mH-J7; Sat, 19 Aug 2023 00:29:22 +0000
Received: by outflank-mailman (input) for mailman id 586699;
 Sat, 19 Aug 2023 00:29:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9qB-0001Sg-IS
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:19 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e8d4ae6-3e27-11ee-877e-cb3800f73035;
 Sat, 19 Aug 2023 02:29:18 +0200 (CEST)
Received: from CY5PR18CA0057.namprd18.prod.outlook.com (2603:10b6:930:13::6)
 by SN7PR12MB7201.namprd12.prod.outlook.com (2603:10b6:806:2a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Sat, 19 Aug
 2023 00:29:15 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:930:13:cafe::a1) by CY5PR18CA0057.outlook.office365.com
 (2603:10b6:930:13::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.205) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:14 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 17:29:13 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:13 -0500
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
X-Inumbo-ID: 6e8d4ae6-3e27-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCHql4WcT+NTj2H5TM+h2OGcvXaFs5TjaPEsfoVfghL8DDw1s78kITfr2z32WygZadM1JVP7XtxHa8ifNkG1TgUccekskonxpgXEK5cVSwEdI9zRCduzVWvpcjR1wAuxfk3ukgHWde3u/cFYsirbczC5Jmv6UA1xoZUoxv/tmFzR9dFljGFzesIrjP+wRi1Jblzn3oxdfAX0jf9N711rR1iT1+S74Lsg0H61jQYTICpqwUDN4fCj7WJfp97guNub2LpgbYGzGp0ZGG2Mr6HtKtjVhKHCRWmotogwBw9dqnG4oynsG+VZfiie2pXlyHaT27wQ5LhkhsWqv19zquyNtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0z4VnR/rjV3DabEuQM1jMT4AHTgihliMWcytUKhZcwU=;
 b=hfNCPmAQQkSpICHgUNxnxYN43AJdhFPA/IydMhExP6gg/36/lD/+JosZU61+8Kwa8xB355YlsmDhZDyuhu0fKPJCFzQTzT1z1gUcEojCKixyPysh1XA8g7Sbqv3cTCbBBBQWIF+86cnMTZ00EwBxeycFnibi78+Gf2SFL9aCB1lK/EfyKaapsKlIDPEGkzx1lb/pP6up6wmSXgf4Z9lwYUHkl3HZMArWJvpI/tlDAaAtgV5pY9Gzjy+yLSwLg6WQ1nRsiyFDOIE8HAHBXU60yYAdftmhzeQwG3Ko3N32z2IqhoKQpUMc0ajF2lKZAb9JCncvfJ6KWHi+Uwk2zRkfyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0z4VnR/rjV3DabEuQM1jMT4AHTgihliMWcytUKhZcwU=;
 b=rl0ISqEsTen99LHFG60HmN1QXwn3IfPu/LYjKb8luTNZQpVYjHiUlVFFecinbpSxjO/9DLh/sOaO//s9f+ZhEdZsgDFEzdHvuE9yQuIorxvR6C8xQLOwu80FfUAUkgduDaeY5tvOQU/TZ506kTSijQ98Tchu+49XciUlOlyl3ps=
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
Subject: [XEN][PATCH v9 12/19] xen/smmu: Add remove_device callback for smmu_iommu ops
Date: Fri, 18 Aug 2023 17:28:43 -0700
Message-ID: <20230819002850.32349-13-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|SN7PR12MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: 76e60ff5-c166-44e9-8f2f-08dba04b5111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9WuJ/L3vJmIx4AY5ZE424qmYFGRJrGSm2dhu4tGIjc5mWEjzqezxruvN1DPN7rWvWpGOYClkv4d4tU9j9V+uDvkgBwPp7GO0NH67zJ2frK2Ndu3b/iYLQPVdTsgwYtF/AvrVP+IYfdy21r467BwtUrX9vHqbWXsY7A75ISFOo2b8M+w8aTTP6w30EE8/vRbhBcRIUEXuYIn/raRnoMhP93KiZP5BicOfQQg5BZ7QJD+4GPTH9uYQ1Qd1wla0XToaGRaA8nLB8ye4sJNEsO/xeOujQMrU0fEzo/hdKrksh2LPJ3uakxMRXo11oT9+gjEE9npN/pwN3GjctQLJeFmRVIdi8YhTKxKbrpni5WDoe3MRTAPLLKotUZDmgnUFfMUW2zSJc9PboHsckQA+wAlrhqYP99IAskkgTyWyuXGt8PoFxTEwDl3aXmUeS2kSxRYaVoqIGnmMxJvP0K6SjZlJ9uYjpK0mYKMyvD7qDT2Q1swfE75pJ9knRJE70IWTxpJug8rj+8KU35rK2etYyVsaUYV8Cf4/GcskVypzjzDTJrSJa2MqQmMrQBuytU0lOu7llhu089ppLwDUHHkG9D3ejWoDEfQxiLy0FTtJKviuTkI2wB3bvAfwASErcejxVcEPwoHT3urFzxMHJ1qfXfz8EI7A36MKnkPJQvDMP/qvRcy3BduCI6RFJ8fcLWhZPc7qkWUKPpZ2zuvNC1KNUl/Jsl3q9UeUdUABhjSlDhL6K1VYoKAPsieXryZJPmL/2OZSQ/j0AysygYGDmQgot0FUXw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199024)(186009)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(86362001)(36756003)(40460700003)(40480700001)(83380400001)(8936002)(4326008)(5660300002)(36860700001)(1076003)(2906002)(8676002)(41300700001)(26005)(44832011)(426003)(47076005)(6666004)(336012)(2616005)(356005)(478600001)(82740400003)(81166007)(316002)(70206006)(70586007)(6916009)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:14.5059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e60ff5-c166-44e9-8f2f-08dba04b5111
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7201

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


