Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 991B36F3901
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 22:04:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528269.821220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZkm-0007GB-0C; Mon, 01 May 2023 20:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528269.821220; Mon, 01 May 2023 20:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZkl-0007EB-TI; Mon, 01 May 2023 20:04:07 +0000
Received: by outflank-mailman (input) for mailman id 528269;
 Mon, 01 May 2023 20:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ptZkl-000525-2K
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 20:04:07 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52e8df08-e85b-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 22:04:06 +0200 (CEST)
Received: from MW4PR04CA0113.namprd04.prod.outlook.com (2603:10b6:303:83::28)
 by MW4PR12MB8611.namprd12.prod.outlook.com (2603:10b6:303:1ed::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Mon, 1 May
 2023 20:04:02 +0000
Received: from CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::eb) by MW4PR04CA0113.outlook.office365.com
 (2603:10b6:303:83::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30 via Frontend
 Transport; Mon, 1 May 2023 20:04:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT094.mail.protection.outlook.com (10.13.174.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.20 via Frontend Transport; Mon, 1 May 2023 20:04:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 15:04:01 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 1 May 2023 15:04:00 -0500
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
X-Inumbo-ID: 52e8df08-e85b-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOVMIRE2X7DPxKGPPVVzf7wJDjSP53mki8qz8xlrnp5JOFFthx4rcshJAdot3F2v8sraPYe6ZTyzYNF+DXw7GyeEth/skLrL3MSTQhLi4P1ByfBifMQdyMEM0orS0DCijZcriPoSooiyp7c8dAYxiAfvF+KobmA22oVi3PY7dhmzjoibJip1ITuFpRWGqd2a0UiOfG7+89fQa86ZUctZX8DX/kvfc1a7dlnnq7mJjssbnnzzPiOUsSeoPKpwr8lqOk1QvX5N3iHuaRBPgeBDx7u6W8lo5G9dH2yR5jRxNEJ/DR3Ya5CQjiPfsBJ+y6CwEIuWu33EjsvQVQarYxRCGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw1Pv3wUj5s9KFrgoBEyVCO4rA7mTJkBr2g4lQl2H8w=;
 b=EYGB6wIAiZ9jLGggDl6UEyNcXjvDUmK119KnWwRtAeFoYhlRd3kdoxJGliaklqmMabLqrk3Ks4MQKN+WYzcBpXdf0PToK7Q50kA/4/lV7kc302Z/2nnYJfA0RG+yThRWtlkL3ZPwR2wnUXn/RbrQjdEVjR6MTtO9s0Ym6/8O+ziANJtf+fhQJQOABAKANcWApT6wLsnXotcjVKwvCH/aIW7h3f1wk7fW+N+6az8pAuIbGX6w4qDjck04HGrP6dDeXnjws5Oo1Yg+drdvfhDVnUiOMuBapkvWYHYrmOARp0nyRJblCqK2yPzs1j5L+F6DseDCTFIsoIJLhJhGnQKG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw1Pv3wUj5s9KFrgoBEyVCO4rA7mTJkBr2g4lQl2H8w=;
 b=I38jmhxkLb05puhi8QlR6wZNDFyOaw+N1ZD7/elqOyzmNG/cWCNJEXk27AM45lHr7boYHJ14PwP2IJUDgio1r6e2YRUqbZLhIqEDmFcU+KcUf6Ly4nA7g/yAAfWpnwcUW1e1cD1tNGnZ1szY7Vvlemau4UPx3gYZmjFvW3SAEXg=
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
Subject: [PATCH v1 5/6] xen/arm: smmuv2: Add PCI devices support for SMMUv2
Date: Mon, 1 May 2023 16:03:04 -0400
Message-ID: <20230501200305.168058-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501200305.168058-1-stewart.hildebrand@amd.com>
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT094:EE_|MW4PR12MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: ed2ed5ad-8a9a-413d-094a-08db4a7f35af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+ZUzcqKSKb3/OI8rYGlrEmYKUZY8tcNjGtQFCxHTOLyAGpS6qYwFdkOuL5xEmiDaIC2/OBSuQq8Eo+olxWxjMg5Z/qETCyJi9SoCY/ggxZuCty/Eq8/JziUP97iIPffxLASYoGSachstTALfjB3ZLEoAqgFk11dgWIxLjWayvKpn3u3vmhulbijKxOdeWN2jYaDDJ9PT8KDHc0pfNf9kshGQL3jy+fru5srpfrhlUxKEukpkJfneyl9XUcMr8gEsXVgptqDkn712vFmhdTUJecfLc7HAd/HzX/dnQu8W9pGm7IMq6mSph5gCMbxealJ3jit53ZrAGzbTDtGTgS4y+A/c9om+OG34XGg4K/wPP9foXxE9//4mPvVTe2xf1ShDgFQWAjXlXhuURUvXftraPkYvWJlM0/kAyB9M3t2MMyBUxRLCJj6BZzURVmAMDr8gX+w01V5+HwWX8clRlfoljYBQDMnYWYOz37TkRTLci6O+aMDjnoyx7uetEY1hlTcVc+xRi8lauClr2wXpqf5oE87CM1tyUQm+vqACIoGyPTljpu+1GMgyGF9vHtvKc1OHdLa9U9luW3X3jSLqErARM8l0F0iDdS40QupU7YIZPML3n5XYCKJVq7fwYr5Lx+7zyhPEUr53pthe1RqkGY/cyt/odC2ihj2K5JjZySs/pNMv74yshT5czVNSram4dcDnAXXJMJvQVrW+k3oQiZeqeLwH3toGERurUYlXDbQVwqIMttN/jTwPfdASIQvYfHe3acku1MMWSH/VxEvbS0VCs34pyJtTYcO85n6BdgXWv/E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(4326008)(6916009)(82740400003)(186003)(5660300002)(36756003)(316002)(70586007)(70206006)(2906002)(41300700001)(356005)(81166007)(966005)(86362001)(83380400001)(47076005)(478600001)(426003)(336012)(54906003)(2616005)(1076003)(26005)(8936002)(82310400005)(36860700001)(40460700003)(8676002)(40480700001)(44832011)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 20:04:02.3460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2ed5ad-8a9a-413d-094a-08db4a7f35af
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8611

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
 xen/drivers/passthrough/arm/smmu.c | 107 +++++++++++++++++++++++------
 1 file changed, 86 insertions(+), 21 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 5b6024d579a8..c33f583f424a 100644
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
@@ -912,11 +926,10 @@ static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
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
@@ -2006,6 +2019,7 @@ static bool arm_smmu_capable(enum iommu_cap cap)
 }
 #endif
 
+#if 0 /* Not used */
 static int __arm_smmu_get_pci_sid(struct pci_dev *pdev, u16 alias, void *data)
 {
 	*((u16 *)data) = alias;
@@ -2016,6 +2030,7 @@ static void __arm_smmu_release_pci_iommudata(void *data)
 {
 	kfree(data);
 }
+#endif
 
 static int arm_smmu_add_device(struct device *dev)
 {
@@ -2023,12 +2038,13 @@ static int arm_smmu_add_device(struct device *dev)
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
@@ -2053,10 +2069,12 @@ static int arm_smmu_add_device(struct device *dev)
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
@@ -2724,6 +2742,31 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
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
+		/*
+		 * XXX What would be the proper behavior? This could happen if
+		 * pdev->phantom_stride > 0
+		 */
+		if ( devfn != pdev->devfn )
+			return -EOPNOTSUPP;
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
@@ -2773,11 +2816,33 @@ out:
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
+		/*
+		 * XXX What would be the proper behavior? This could happen if
+		 * pdev->phantom_stride > 0
+		 */
+		if ( devfn != pdev->devfn )
+			return -EOPNOTSUPP;
+
+		/* dom_io is used as a sentinel for quarantined devices */
+		if ( d == dom_io )
+			return 0;
+	}
+#endif
+
 	xen_domain = dom_iommu(d)->arch.priv;
 
 	if (!domain || domain->priv->cfg.domain != d) {
@@ -2805,13 +2870,13 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
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


