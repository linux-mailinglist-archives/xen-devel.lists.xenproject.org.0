Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A747D7E7183
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 19:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629770.982215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19lj-0000qv-OV; Thu, 09 Nov 2023 18:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629770.982215; Thu, 09 Nov 2023 18:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19lj-0000o0-LF; Thu, 09 Nov 2023 18:28:43 +0000
Received: by outflank-mailman (input) for mailman id 629770;
 Thu, 09 Nov 2023 18:28:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS/w=GW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r19li-00005n-OQ
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 18:28:42 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cde467b6-7f2d-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 19:28:41 +0100 (CET)
Received: from DM6PR18CA0008.namprd18.prod.outlook.com (2603:10b6:5:15b::21)
 by DM6PR12MB4973.namprd12.prod.outlook.com (2603:10b6:5:1b7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 18:28:37 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:5:15b:cafe::60) by DM6PR18CA0008.outlook.office365.com
 (2603:10b6:5:15b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 18:28:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.19 via Frontend Transport; Thu, 9 Nov 2023 18:28:37 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:28:36 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 10:28:36 -0800
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 9 Nov 2023 12:28:34 -0600
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
X-Inumbo-ID: cde467b6-7f2d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZzS2rI+gItQIwINJ3yZWwO5FJqI3eJSTh4CJFafHagOwfpnORcitGOqNNNFsv4IOqHAQlKEJgzxMxgOqxmdI2HWgUQewnUgdSrvEACDYFLy/B7/yWTKKtDwUpx+Jklk9B73CaEXLWpDKvNl4JAYGIMJgihleovkYonMV/6pIbBvNmdfWNXD/hhZDf+B3I9PLpVNjmjk1ecORfRg2p132JylWFgQ33IOSLmG6Dx6ZK2lttLHeIOGoszc1oeSEmgKq6iGqbuivf/BqIcMdombJ0X6uzRyzfnTEq5q29nndm/ZiDZe8Hg+NJjk6Mme3sxcbx/bmp86mgR19u8ZEHCpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGFeXcHbrWzpuDqVVKAfYj+Js/ujm1j5RABPQpLzM5Y=;
 b=kmeUW/HwtVDW+s8J99VEWvqos6PsBXpfSfOb2XDPqjHj51TTq918fQx/JimBBHFR3EGD5CNNQsgBZi8SuFXSA/c895VXbQYbWXUp41xX+Wff+773RXqRnAvDCXDKxik40goBx/DiI+M6vjZZXeHQbmVYbtAhqNTY94qneWE9zGE27x6GNX/82eJ7FdeapUn3UaHDhFDnOnvH/gqR25PamNWoznYBNejTaA+ph5OMDk/in758ZhSjThJHuTadslFZgL45d6yuX3vIPVxBdPXxefWIYqrQtg/V9zZQYmlxxgvpA6Q6XjPG3nkgltUhKrjU1lctnXJ3ixsneCatE/aYyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGFeXcHbrWzpuDqVVKAfYj+Js/ujm1j5RABPQpLzM5Y=;
 b=jiscK+e2Db8LbnR6/MbL6rY8ghED+66g1JKbj9EgE1GEY4/I0g2lXjV5sfl77jI3rubzLM/mPegyMOF0MQWYmKr1hShocIvfLlo3zNLo3k0qtLWjdTDcpM8mGDs1xaKGdVRCq6GNfYBR/rRwdC3pbvZ5PjHlliUJKkub+w4/1u0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>, "Jan
 Beulich" <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 2/9] iommu/arm: Add iommu_dt_xlate()
Date: Thu, 9 Nov 2023 13:27:05 -0500
Message-ID: <20231109182716.367119-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109182716.367119-1-stewart.hildebrand@amd.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|DM6PR12MB4973:EE_
X-MS-Office365-Filtering-Correlation-Id: 000bb191-197c-435c-9433-08dbe151b07d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3huW63G+YA7VWASpN4sk5mRXTzlAzVBhyLOfg7FU4zj8nqPgtDfMEmpKIrs+Iiuw+KOhF93OqfuG0RnRpiOBq3seOWYHWfEUMRK5P0p1SqEN2fGtcf59pTVBudzoAlMEYwWnlua2lzFfNrOZ/FODGqKOw3bxaZNQkCAIqh1TnqS2hHmeDi6igF3O791nMbtTHmyR+br0DKKRWdvYkbXmXsp6CfA5IrAyEcvR46tgmGHPayq4myo+5W12fpKeMuaKgXBi6qGaf9OQ0/QRFyweazoCpW8zBtzC4lY7mwTWMA790S4L3CUo6JGPRKBpGh/+30D81ub+WuT5abm1S2mpMspCWoFLWYNBtQ1ORRFoCtN3galcYYNpCWWt8qx0vVovB5oS7Qie3+CchQEPhXdLcqTRhyVHD3OeDW/pKgC0ZWdZyN7gtiWme/kujVJz5+SRwaKhaZZMdbHqwffgNe0jik5ipv4Fodq7rPonSoPFAEdB9uiqxH+uwpQf7585iONQGJp16mGNmlmCXbVBRIH5yVSWSBlwV3tL4Zb8/pLcTZoXeW0jZqddnmHUA5zCsiMhrH0q7Ni54E9MXZPGoqz+m7mt8oxueFyDMvIUOyTxuIRaS5zZgw+Lgyg1MyXdZ9gI+rYcqBnD4TBYLt3DfpLxBgwl2Dl1MSXiQj4rCpWmE4/skqECW6EC6BzwwGJBZIT+W2FM95EaAe0CANTipfje+LFSR8Bj/Q1bvJXPJlNsyiDTtS8LwGVnGsGd0gRtCRkZ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(82310400011)(186009)(40470700004)(36840700001)(46966006)(26005)(2906002)(356005)(4326008)(8676002)(40480700001)(36860700001)(5660300002)(7416002)(81166007)(86362001)(47076005)(8936002)(41300700001)(40460700003)(336012)(82740400003)(70206006)(6916009)(1076003)(44832011)(83380400001)(2616005)(426003)(316002)(54906003)(70586007)(6666004)(966005)(478600001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:28:37.1740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 000bb191-197c-435c-9433-08dbe151b07d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4973

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Move code for processing DT IOMMU specifier to a separate helper.
This helper will be re-used for adding PCI devices by the subsequent
patches as we will need exact the same actions for processing
DT PCI-IOMMU specifier.

While at it introduce NO_IOMMU to avoid magic "1".

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v5->v6:
* pass ops parameter to iommu_dt_xlate()
* add Julien's R-b

v4->v5:
* rebase on top of "dynamic node programming using overlay dtbo" series
* move #define NO_IOMMU 1 to header
* s/these/this/ inside comment

v3->v4:
* make dt_phandle_args *iommu_spec const
* move !ops->add_device check to helper

v2->v3:
* no change

v1->v2:
* no change

downstream->v1:
* trivial rebase
* s/dt_iommu_xlate/iommu_dt_xlate/

(cherry picked from commit c26bab0415ca303df86aba1d06ef8edc713734d3 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/device_tree.c | 48 +++++++++++++++++----------
 xen/include/xen/iommu.h               |  2 ++
 2 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 075fb25a3706..4c35281d98ad 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -137,6 +137,30 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+static int iommu_dt_xlate(struct device *dev,
+                          const struct dt_phandle_args *iommu_spec,
+                          const struct iommu_ops *ops)
+{
+    int rc;
+
+    if ( !ops->dt_xlate )
+        return -EINVAL;
+
+    if ( !dt_device_is_available(iommu_spec->np) )
+        return NO_IOMMU;
+
+    rc = iommu_fwspec_init(dev, &iommu_spec->np->dev);
+    if ( rc )
+        return rc;
+
+    /*
+     * Provide DT IOMMU specifier which describes the IOMMU master
+     * interfaces of that device (device IDs, etc) to the driver.
+     * The driver is responsible to decide how to interpret them.
+     */
+    return ops->dt_xlate(dev, iommu_spec);
+}
+
 int iommu_remove_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
@@ -146,7 +170,7 @@ int iommu_remove_dt_device(struct dt_device_node *np)
     ASSERT(rw_is_locked(&dt_host_lock));
 
     if ( !iommu_enabled )
-        return 1;
+        return NO_IOMMU;
 
     if ( !ops )
         return -EOPNOTSUPP;
@@ -187,12 +211,12 @@ int iommu_add_dt_device(struct dt_device_node *np)
     const struct iommu_ops *ops = iommu_get_ops();
     struct dt_phandle_args iommu_spec;
     struct device *dev = dt_to_dev(np);
-    int rc = 1, index = 0;
+    int rc = NO_IOMMU, index = 0;
 
     ASSERT(system_state < SYS_STATE_active || rw_is_locked(&dt_host_lock));
 
     if ( !iommu_enabled )
-        return 1;
+        return NO_IOMMU;
 
     if ( !ops )
         return -EINVAL;
@@ -215,27 +239,15 @@ int iommu_add_dt_device(struct dt_device_node *np)
     {
         /*
          * The driver which supports generic IOMMU DT bindings must have
-         * these callback implemented.
+         * this callback implemented.
          */
-        if ( !ops->add_device || !ops->dt_xlate )
+        if ( !ops->add_device )
         {
             rc = -EINVAL;
             goto fail;
         }
 
-        if ( !dt_device_is_available(iommu_spec.np) )
-            break;
-
-        rc = iommu_fwspec_init(dev, &iommu_spec.np->dev);
-        if ( rc )
-            break;
-
-        /*
-         * Provide DT IOMMU specifier which describes the IOMMU master
-         * interfaces of that device (device IDs, etc) to the driver.
-         * The driver is responsible to decide how to interpret them.
-         */
-        rc = ops->dt_xlate(dev, &iommu_spec);
+        rc = iommu_dt_xlate(dev, &iommu_spec, ops);
         if ( rc )
             break;
 
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 0e747b0bbc1c..8cd4b9a6bfb2 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -245,6 +245,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
  */
 int iommu_remove_dt_device(struct dt_device_node *np);
 
+#define NO_IOMMU    1
+
 #endif /* HAS_DEVICE_TREE */
 
 struct page_info;
-- 
2.42.0


