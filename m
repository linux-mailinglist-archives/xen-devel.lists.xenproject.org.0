Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 412BC3FE97F
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176926.322134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYu-0005tb-JB; Thu, 02 Sep 2021 06:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176926.322134; Thu, 02 Sep 2021 06:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYt-0005kp-Rg; Thu, 02 Sep 2021 06:50:59 +0000
Received: by outflank-mailman (input) for mailman id 176926;
 Thu, 02 Sep 2021 06:07:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLfsv-0004hX-Ty
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:07:37 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.243.58]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d71d7a5a-f0b0-458d-8457-d905d920e6b9;
 Thu, 02 Sep 2021 06:07:36 +0000 (UTC)
Received: from SA0PR11CA0187.namprd11.prod.outlook.com (2603:10b6:806:1bc::12)
 by MWHPR02MB2606.namprd02.prod.outlook.com (2603:10b6:300:44::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 06:07:35 +0000
Received: from SN1NAM02FT0051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bc:cafe::47) by SA0PR11CA0187.outlook.office365.com
 (2603:10b6:806:1bc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Thu, 2 Sep 2021 06:07:35 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0051.mail.protection.outlook.com (10.97.5.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:07:34 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:07:13 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:07:13 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfsX-000F6q-F6; Wed, 01 Sep 2021 23:07:13 -0700
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
X-Inumbo-ID: d71d7a5a-f0b0-458d-8457-d905d920e6b9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwWMyGPlBKtFHj1zM/gtcQiLwDgH+yShnsoTOJSsSbOnxUVjkYii203fAKF2tfN3J0iRBuAX9wx2as5wSlKlDt7V+FZrd5iC0gVGQmYWWG6l1u2+ald2Ldc28FAhqxaxOqHB95/lLOX0PQ6w9Uf+eziftZfbnhPOZPC4nlsOK8vd6eHFz2IGUuP2CYDoC7lqInZ7kIp9FnGC+b2SqJCkMEoYcQjlpokiCL4h7ppC7IrStudyGvXuVfRJ1OuYls8OmMwPwoS/unmsvEVPgF+rhyFN00spTN9ZDa1lN8WsIyt7iDsLSrm/KNbWnGNkaRbrpvr2JtRAxwcQcOOwNzZZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=EVas2kXYqY8J1i69hD1pnLTQnzKqbS4jKsdjLz6x97c=;
 b=baGfgKv6wfpslNLcyv4rKCbR3vhTEl/V+OdFy+IgivH9xZIn3/bMExf23cMh7y5/jpnd9xauUSY+AQopw3w2txn1uXKketaIOsJ9OE96cbKG8aOyLa+/RvbFZ33Uoa7wfbcWnx3buXcylsfn7L8sElihGqZIUKiUn+imUsnMxQcuvuTBjh1wWN6YaOXhpaCkf2vvWBC0PXRpMOd5b1OwiUMgmRyVdYf2DpvDx325qbPUsd2ZieSnwbQp6m/NYoDF90spKygJvB4ITpEYVyGH8hwE4+3SlbWGxcCjRbVdCNbrnCuFGFQk50cJvNXa6LFZxpPRXK7uYgoB2G1ntl4guA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EVas2kXYqY8J1i69hD1pnLTQnzKqbS4jKsdjLz6x97c=;
 b=OhDJ97JWnZlQmoCvp1jgfKBkXfc7CTrXRjx9a1itEgWqm+nvR8rkYqPd8FEVw2kYPd3cEUQhMrGgpdT85MROte2W9HmBJLrRE6QRIrg35hC2a3+dMECG4dqdsnbXG30TvYW1g4f8/V9tmF/jQQc2SBdGJdPfTKe99GV9/AcniQ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Subject: [XEN][RFC PATCH 08/13] xen/iommu: Introduce iommu_remove_dt_devices function
Date: Wed, 1 Sep 2021 23:05:58 -0700
Message-ID: <1630562763-390068-9-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9508a7b-7601-4ec8-4fbb-08d96dd7f529
X-MS-TrafficTypeDiagnostic: MWHPR02MB2606:
X-Microsoft-Antispam-PRVS:
	<MWHPR02MB2606479ED549E6A3A76D6865BCCE9@MWHPR02MB2606.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TMQQTZIpkWWv10Ikt+KPGzuRQXvsobuI7WlcFc7zHglAU7EPq34TwwLc8REM6x9UCzfA+OIWUlUkYBJPchPItU4BduToxXXwNtLikwy+i7xfVo7EBHiKkws/1TqNsdPhOjOeeIU4/db7oS1GreqCl1UXP0bSnlLzYoKVeaQJcWRxIWK3OO8dN0xWFGzZDiNNDOZavcS6X4K6iaKtE7loInF61Q2w+ETeuV2N5+GfUytah1iE3bB5GlQE+0G5k4eYfJpVHh1lj/GMfiKHvfJOEgpPSVRIslaa6SaVTOlidGQGcRd/E59DAmBJYDB+dOvMh0IMoxSIYMMge3QPEq9XwmUFiQMcB0gowseVr41IVhhO74seru+ixoSQZAiF4vQmR83rQ2Z66odrEQPai81dJBE9LMr6stnG5nya1WpvLFLMUVjzXWAgcl2p73NIeUjaz6xVHoDqgkJvayixjJz9K6oKBsvaimIBnHgBmo9EZuMf/fKiZMhLfCdAxzKp856xouT9IuQDMHBRiAp9LC8+wLaFFt0QgvW4seVVdPaTqKshfyFW0HghGsv2ChgU0zWonNdP/KXYv14FP+4LKIwm+HnpUKyxycO2gGqCnKjeqyMVTRrxRUKuv5DRkb+wDyVapCTNoWkgaIo5OGoUchKQhTvO2tKEC8thALJM8DI8adV44qAHjuUdRh4SwMc9JbRWtA4N4i9tD9nUU1S3CwiHfSUsqE3SfXHG7yvIsw6KMJU=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966006)(36840700001)(36860700001)(186003)(336012)(36906005)(2906002)(9786002)(26005)(82740400003)(316002)(4326008)(426003)(54906003)(70206006)(70586007)(7636003)(47076005)(5660300002)(7696005)(8936002)(356005)(36756003)(82310400003)(6916009)(2616005)(478600001)(8676002)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:07:34.7337
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9508a7b-7601-4ec8-4fbb-08d96dd7f529
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2606

iommu_remove_dt_device function is introduced for supporting dynamic programming
i.e. adding and removing a node during runtime. When user removes the device
node, iommu_remove_dt_device() removes the device entry from smmu-masters too
using following steps:
    1. Find if SMMU master exists for the device node.
    2. Remove the SMMU master.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 xen/drivers/passthrough/arm/smmu.c    | 53 +++++++++++++++++++++++++++++++++++
 xen/drivers/passthrough/device_tree.c | 30 ++++++++++++++++++++
 xen/include/xen/iommu.h               |  2 ++
 3 files changed, 85 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index c9dfc4c..7b615bc 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -816,6 +816,17 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
 	return 0;
 }
 
+static int remove_smmu_master(struct arm_smmu_device *smmu,
+			      struct arm_smmu_master *master)
+{
+	if (!(smmu->masters.rb_node))
+		return -ENOENT;
+
+	rb_erase(&master->node, &smmu->masters);
+
+	return 0;
+}
+
 static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 					 struct device *dev,
 					 struct iommu_fwspec *fwspec)
@@ -853,6 +864,31 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
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
+	ret = remove_smmu_master(smmu, master);
+
+	if (ret)
+		return ret;
+
+	master->of_node = NULL;
+	kfree(master);
+	return 0;
+}
+
 static int register_smmu_master(struct arm_smmu_device *smmu,
 				struct device *dev,
 				struct of_phandle_args *masterspec)
@@ -876,6 +912,22 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
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
@@ -2876,6 +2928,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
     .init = arm_smmu_iommu_domain_init,
     .hwdom_init = arm_smmu_iommu_hwdom_init,
     .add_device = arm_smmu_dt_add_device_generic,
+    .remove_device = arm_smmu_dt_remove_device_generic,
     .teardown = arm_smmu_iommu_domain_teardown,
     .iotlb_flush = arm_smmu_iotlb_flush,
     .iotlb_flush_all = arm_smmu_iotlb_flush_all,
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 98f2aa0..37f4945 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -127,6 +127,36 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+int iommu_remove_dt_device(struct dt_device_node *np)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    struct device *dev = dt_to_dev(np);
+    int rc = 1;
+
+    if ( !ops )
+        return -EINVAL;
+
+    if ( iommu_dt_device_is_assigned(np) )
+        return -EPERM;
+
+    /*
+     * The driver which supports generic IOMMU DT bindings must have
+     * these callback implemented.
+     */
+    if ( !ops->remove_device )
+        return -EINVAL;
+
+    /*
+     * Remove master device from the IOMMU if latter is present and available.
+     */
+    rc = ops->remove_device(0, dev);
+
+    if ( rc == 0 )
+        iommu_fwspec_free(dev);
+
+    return rc;
+}
+
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 6b2cdff..c4d5d12 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -215,6 +215,8 @@ int iommu_release_dt_devices(struct domain *d);
  */
 int iommu_add_dt_device(struct dt_device_node *np);
 
+int iommu_remove_dt_device(struct dt_device_node *np);
+
 int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
 
-- 
2.7.4


