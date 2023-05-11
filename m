Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3565C6FFA08
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 21:22:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533567.830364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBrd-0008Sl-LE; Thu, 11 May 2023 19:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533567.830364; Thu, 11 May 2023 19:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBrd-0008QY-HE; Thu, 11 May 2023 19:22:09 +0000
Received: by outflank-mailman (input) for mailman id 533567;
 Thu, 11 May 2023 19:22:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWxp=BA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pxBrb-0008QA-G5
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 19:22:07 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e89::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bda4b36-f031-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 21:22:04 +0200 (CEST)
Received: from BY3PR03CA0009.namprd03.prod.outlook.com (2603:10b6:a03:39a::14)
 by MN0PR12MB6368.namprd12.prod.outlook.com (2603:10b6:208:3d2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 19:22:00 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:39a:cafe::67) by BY3PR03CA0009.outlook.office365.com
 (2603:10b6:a03:39a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20 via Frontend
 Transport; Thu, 11 May 2023 19:21:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.22 via Frontend Transport; Thu, 11 May 2023 19:21:59 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 14:21:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 12:21:58 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 11 May 2023 14:21:56 -0500
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
X-Inumbo-ID: 1bda4b36-f031-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JvMfM6sm2eQUSXF6J+K09dyMMFcKESUeF9HoASPMtNVKB4xPxheK4xAxOmofVP2/lFZCNfzvGhCYEXj7ZhpPclm8jNiCyT4j+MPsy3ekvPWAtpQCP5BiH0lGwwjPnieBIrpd/C4yfY6SK3zhXx0/9xHktUzIynCQFf8OOyWzrWkaagOB40efi3x5lRJkxsIj7CGI91VzKQjCndaWTCaQi2VumYvfYs/CWkg0aBTabOSlSmENmPw3f7ELwdW2jNzhDGv/13MLxegcHI5jjsneckxVVFDfXnV1lCzRm+LeuVF3jvDIHvcFMCACbJxwFuDRjUskYpQjosiVg6QSeD7iBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJZqJ3OSmTgBvHf2UzJUuvXPD1qwSpScJxGorP0Ak6c=;
 b=dDTRKnBZh0Z84C5TflKobnntbh3kf6+WnpeZiKLs4wD6qCxzbE7SeLfBNA7N//upLmcSYbrK+Hzp/cYX4EdIL/isLdDxCv37f+998LAKICi5KDyN+R5LwWE1o5vvQVZxwvVy3PqOWtAimvRsHYvav7Q+0Jmqor7XZcrDNplE8a9oQaFWZGniD6rdne9colf1NdCVbexC8tiiBNEq88nefWrkXAHG3F1UGmJlWEpJP9cnhFVLhNNsPljs2eR0fifVKecfi4+4Se6IZBctBb9TZPcbDDLi+5D0Tq6KNKQe0vDR5OoxfFAzI3GjsYc8dGYHMnYQEH3rqucgmBVNl3NRkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJZqJ3OSmTgBvHf2UzJUuvXPD1qwSpScJxGorP0Ak6c=;
 b=HJA+rY3eLG5bcfwDIqAz8BFSnwIU6mIqtaGBtgBIvLyrRGQ7eKJ9Bg9sDO5DpZ9rUuLfCHFxLRTKxh3wQ35QJzJQa9Q9Dplrj3Dl9Ew9SW/VZ8nYUzUpxAbAHj+dQXDshJuWHuX1Sd6DeMd8LVsLElYlbIFsxg6B6VLXpsKxhh8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Julien Grall
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v2 7/8] xen/arm: smmuv2: Add PCI devices support for SMMUv2
Date: Thu, 11 May 2023 15:16:53 -0400
Message-ID: <20230511191654.400720-8-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511191654.400720-1-stewart.hildebrand@amd.com>
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT029:EE_|MN0PR12MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a366ff-48a8-4867-74cc-08db5254fe05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	er6pSDsuUmE9S6VPddE5L9MyS3uJI8AcwGZYrQs2XFjOWiQYghEDUCNzlOxQJU6mek7kihlxFjgYdrdBAH8v9RO5otqafUb3FtznBLJq7CSBAb3W24CYgAEd/2ngkxhlUa6WvMPtbiIDuLtabneQ4YgHQpXNQ5A+FcWAmB3DoVgCMGsP5av7VMXASSs2yfTbVQHrj4ng4eQCh1lxF7FsVpzUHYt/5JL4IKcdwfvZUS+MDFiAT+M5+MyIzJ4uQ0E0mjG14frhvdijSMVgKJfcJsRcK5WOml/6A6m3JNqVJeaI4i6d7YHNCyiJ/QgF2xuwpRJOp3QousGLGLd3PwIUaUxcd6aAYito8JulTvWRx92RYpt6jUcKnRSSx/+6WIBoHSMTdB19K2/70SzTBKSBy1vAAtF+p1LqYwFSncL2ahXpWY1QfwPB0ZyIgwdvoPOinH0qwIbHqQHcrAnHH4GnrFBMPfLJKPQJSfFuOyc+DRa4vmJPfdyO6PUtTlkb32Fpb598mCrUNanbbyYFwVRidR0v37+xyV/Jk6m3QGY/sJNdlSqbYQlQEc7NIbYfcPqTj0OpQobv1FtioBSHyoiPgyp4iPrl2qEsrOqjnBjRPyy7gGDaRPrlZ4H9U82K8J2x+uaQagBYUOPvAbppBfO7XbQ6Omo41qumfd5MBpWQ/0k0hiIAknbSTxavF2OQzyWdJ+QdKnBzZr63sqQAMrmtaesPpYgq/BvpWdZE4med/LD+sYh96PPatSsFsrG7JHwDfZfbscRyauAY4t9okfZnZFOf3iMWMgeWXqRneZz16tI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199021)(40470700004)(36840700001)(46966006)(5660300002)(44832011)(54906003)(478600001)(6666004)(41300700001)(966005)(8936002)(8676002)(316002)(1076003)(26005)(4326008)(70206006)(6916009)(70586007)(2906002)(83380400001)(336012)(47076005)(40460700003)(426003)(2616005)(186003)(356005)(36860700001)(82740400003)(81166007)(40480700001)(86362001)(82310400005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 19:21:59.4620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a366ff-48a8-4867-74cc-08db5254fe05
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6368

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* ignore add_device/assign_device/reassign_device calls for phantom functions
  (i.e. devfn != pdev->devfn)

downstream->v1:
* wrap unused function in #ifdef 0
* remove the remove_device() stub since it was submitted separately to the list
  [XEN][PATCH v5 07/17] xen/smmu: Add remove_device callback for smmu_iommu ops
  https://lists.xenproject.org/archives/html/xen-devel/2023-04/msg00432.html
* arm_smmu_(de)assign_dev: return error instead of crashing system
* update condition in arm_smmu_reassign_dev
* style fixup
* add && !is_hardware_domain(d) into condition in arm_smmu_assign_dev()

(cherry picked from commit 0c11a7f65f044c26d87d1e27ac6283ef1f9cfb7a from
 the downstream branch spider-master from
 https://github.com/xen-troops/xen.git)
---

This is a file imported from Linux with modifications for Xen. What should be
the coding style for Xen modifications?
---
 xen/drivers/passthrough/arm/smmu.c | 108 +++++++++++++++++++++++------
 1 file changed, 87 insertions(+), 21 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 5b6024d579a8..a8476a22b096 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -134,8 +134,20 @@ typedef enum irqreturn irqreturn_t;
 /* Device logger functions
  * TODO: Handle PCI
  */
-#define dev_print(dev, lvl, fmt, ...)						\
-	 printk(lvl "smmu: %s: " fmt, dt_node_full_name(dev_to_dt(dev)), ## __VA_ARGS__)
+#ifndef CONFIG_HAS_PCI
+#define dev_print(dev, lvl, fmt, ...)    \
+    printk(lvl "smmu: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
+#else
+#define dev_print(dev, lvl, fmt, ...) ({                                \
+    if ( !dev_is_pci((dev)) )                                           \
+        printk(lvl "smmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
+    else                                                                \
+    {                                                                   \
+        struct pci_dev *pdev = dev_to_pci((dev));                       \
+        printk(lvl "smmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
+    }                                                                   \
+})
+#endif
 
 #define dev_dbg(dev, fmt, ...) dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
 #define dev_notice(dev, fmt, ...) dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
@@ -187,6 +199,7 @@ static void __iomem *devm_ioremap_resource(struct device *dev,
  * Xen: PCI functions
  * TODO: It should be implemented when PCI will be supported
  */
+#if 0 /* unused */
 #define to_pci_dev(dev)	(NULL)
 static inline int pci_for_each_dma_alias(struct pci_dev *pdev,
 					 int (*fn) (struct pci_dev *pdev,
@@ -196,6 +209,7 @@ static inline int pci_for_each_dma_alias(struct pci_dev *pdev,
 	BUG();
 	return 0;
 }
+#endif
 
 /* Xen: misc */
 #define PHYS_MASK_SHIFT		PADDR_BITS
@@ -632,7 +646,7 @@ struct arm_smmu_master_cfg {
 	for (i = 0; idx = cfg->smendx[i], i < num; ++i)
 
 struct arm_smmu_master {
-	struct device_node		*of_node;
+	struct device			*dev;
 	struct rb_node			node;
 	struct arm_smmu_master_cfg	cfg;
 };
@@ -724,7 +738,7 @@ arm_smmu_get_fwspec(struct arm_smmu_master_cfg *cfg)
 {
 	struct arm_smmu_master *master = container_of(cfg,
 			                                      struct arm_smmu_master, cfg);
-	return dev_iommu_fwspec_get(&master->of_node->dev);
+	return dev_iommu_fwspec_get(master->dev);
 }
 
 static void parse_driver_options(struct arm_smmu_device *smmu)
@@ -757,7 +771,7 @@ static struct device_node *dev_get_dev_node(struct device *dev)
 }
 
 static struct arm_smmu_master *find_smmu_master(struct arm_smmu_device *smmu,
-						struct device_node *dev_node)
+						struct device *dev)
 {
 	struct rb_node *node = smmu->masters.rb_node;
 
@@ -766,9 +780,9 @@ static struct arm_smmu_master *find_smmu_master(struct arm_smmu_device *smmu,
 
 		master = container_of(node, struct arm_smmu_master, node);
 
-		if (dev_node < master->of_node)
+		if (dev < master->dev)
 			node = node->rb_left;
-		else if (dev_node > master->of_node)
+		else if (dev > master->dev)
 			node = node->rb_right;
 		else
 			return master;
@@ -803,9 +817,9 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
 			= container_of(*new, struct arm_smmu_master, node);
 
 		parent = *new;
-		if (master->of_node < this->of_node)
+		if (master->dev < this->dev)
 			new = &((*new)->rb_left);
-		else if (master->of_node > this->of_node)
+		else if (master->dev > this->dev)
 			new = &((*new)->rb_right);
 		else
 			return -EEXIST;
@@ -824,18 +838,18 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 	struct arm_smmu_master *master;
 	struct device_node *dev_node = dev_get_dev_node(dev);
 
-	master = find_smmu_master(smmu, dev_node);
+	master = find_smmu_master(smmu, dev);
 	if (master) {
 		dev_err(dev,
 			"rejecting multiple registrations for master device %s\n",
-			dev_node->name);
+			dev_node ? dev_node->name : "");
 		return -EBUSY;
 	}
 
 	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
 		return -ENOMEM;
-	master->of_node = dev_node;
+	master->dev = dev;
 
 	/* Xen: Let Xen know that the device is protected by an SMMU */
 	device_set_protected(dev);
@@ -845,7 +859,7 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 		     (fwspec->ids[i] >= smmu->num_mapping_groups)) {
 			dev_err(dev,
 				"stream ID for master device %s greater than maximum allowed (%d)\n",
-				dev_node->name, smmu->num_mapping_groups);
+				dev_node ? dev_node->name : "", smmu->num_mapping_groups);
 			return -ERANGE;
 		}
 		master->cfg.smendx[i] = INVALID_SMENDX;
@@ -889,6 +903,15 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
 	if (smmu == NULL)
 		return -ENXIO;
 
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev = dev_to_pci(dev);
+		if ( devfn != pdev->devfn )
+			return 0;
+	}
+#endif
+
 	return arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
 }
 
@@ -912,11 +935,10 @@ static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
 {
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master = NULL;
-	struct device_node *dev_node = dev_get_dev_node(dev);
 
 	spin_lock(&arm_smmu_devices_lock);
 	list_for_each_entry(smmu, &arm_smmu_devices, list) {
-		master = find_smmu_master(smmu, dev_node);
+		master = find_smmu_master(smmu, dev);
 		if (master)
 			break;
 	}
@@ -2006,6 +2028,7 @@ static bool arm_smmu_capable(enum iommu_cap cap)
 }
 #endif
 
+#if 0 /* Not used */
 static int __arm_smmu_get_pci_sid(struct pci_dev *pdev, u16 alias, void *data)
 {
 	*((u16 *)data) = alias;
@@ -2016,6 +2039,7 @@ static void __arm_smmu_release_pci_iommudata(void *data)
 {
 	kfree(data);
 }
+#endif
 
 static int arm_smmu_add_device(struct device *dev)
 {
@@ -2023,12 +2047,13 @@ static int arm_smmu_add_device(struct device *dev)
 	struct arm_smmu_master_cfg *cfg;
 	struct iommu_group *group;
 	void (*releasefn)(void *) = NULL;
-	int ret;
 
 	smmu = find_smmu_for_device(dev);
 	if (!smmu)
 		return -ENODEV;
 
+	/* There is no need to distinguish here, thanks to PCI-IOMMU DT bindings */
+#if 0
 	if (dev_is_pci(dev)) {
 		struct pci_dev *pdev = to_pci_dev(dev);
 		struct iommu_fwspec *fwspec;
@@ -2053,10 +2078,12 @@ static int arm_smmu_add_device(struct device *dev)
 				       &fwspec->ids[0]);
 		releasefn = __arm_smmu_release_pci_iommudata;
 		cfg->smmu = smmu;
-	} else {
+	} else
+#endif
+	{
 		struct arm_smmu_master *master;
 
-		master = find_smmu_master(smmu, dev->of_node);
+		master = find_smmu_master(smmu, dev);
 		if (!master) {
 			return -ENODEV;
 		}
@@ -2724,6 +2751,27 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
 			return -ENOMEM;
 	}
 
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) && !is_hardware_domain(d) )
+	{
+		struct pci_dev *pdev = dev_to_pci(dev);
+
+		printk(XENLOG_INFO "Assigning device %04x:%02x:%02x.%u to dom%d\n",
+		       pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
+		       d->domain_id);
+
+		if ( devfn != pdev->devfn || pdev->domain == d )
+			return 0;
+
+		list_move(&pdev->domain_list, &d->pdev_list);
+		pdev->domain = d;
+
+		/* dom_io is used as a sentinel for quarantined devices */
+		if ( d == dom_io )
+			return 0;
+	}
+#endif
+
 	if (!dev_iommu_group(dev)) {
 		ret = arm_smmu_add_device(dev);
 		if (ret)
@@ -2773,11 +2821,29 @@ out:
 	return ret;
 }
 
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, u8 devfn, struct device *dev)
 {
 	struct iommu_domain *domain = dev_iommu_domain(dev);
 	struct arm_smmu_xen_domain *xen_domain;
 
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev = dev_to_pci(dev);
+
+		printk(XENLOG_INFO "Deassigning device %04x:%02x:%02x.%u from dom%d\n",
+		       pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
+		       d->domain_id);
+
+		if ( devfn != pdev->devfn )
+			return 0;
+
+		/* dom_io is used as a sentinel for quarantined devices */
+		if ( d == dom_io )
+			return 0;
+	}
+#endif
+
 	xen_domain = dom_iommu(d)->arch.priv;
 
 	if (!domain || domain->priv->cfg.domain != d) {
@@ -2805,13 +2871,13 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
 	int ret = 0;
 
 	/* Don't allow remapping on other domain than hwdom */
-	if ( t && !is_hardware_domain(t) )
+	if ( t && !is_hardware_domain(t) && t != dom_io )
 		return -EPERM;
 
 	if (t == s)
 		return 0;
 
-	ret = arm_smmu_deassign_dev(s, dev);
+	ret = arm_smmu_deassign_dev(s, devfn, dev);
 	if (ret)
 		return ret;
 
-- 
2.40.1


