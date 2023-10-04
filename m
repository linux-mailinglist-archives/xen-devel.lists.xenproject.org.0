Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14A7B8306
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 16:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612652.952687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3Jp-0005cZ-OR; Wed, 04 Oct 2023 14:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612652.952687; Wed, 04 Oct 2023 14:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3Jp-0005ZP-Ks; Wed, 04 Oct 2023 14:57:45 +0000
Received: by outflank-mailman (input) for mailman id 612652;
 Wed, 04 Oct 2023 14:57:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSqs=FS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qo3Jo-0004W4-8Z
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 14:57:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e326ffc-62c6-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 16:57:42 +0200 (CEST)
Received: from BL0PR1501CA0018.namprd15.prod.outlook.com
 (2603:10b6:207:17::31) by SN7PR12MB7855.namprd12.prod.outlook.com
 (2603:10b6:806:343::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Wed, 4 Oct
 2023 14:57:39 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:207:17:cafe::3a) by BL0PR1501CA0018.outlook.office365.com
 (2603:10b6:207:17::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.36 via Frontend
 Transport; Wed, 4 Oct 2023 14:57:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 14:57:38 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:57:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 07:57:38 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 4 Oct 2023 09:57:36 -0500
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
X-Inumbo-ID: 5e326ffc-62c6-11ee-98d3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BCEqx/d7tjYCW2+HQe7eLfMAnCSgxi2R/Gb4jAF23hqQ/qfU+2TMntAhpsxzuU3FuP/f7scnxWYFG9ypsnsqC0+HIfL7WgZFTJTouBqgVZCGoFl34RSggAv1jHavMD3hHtomv65FUYDM0SkTB5NZwb3yMXbS1fEq+smuwBZ4WxF0WRDHQX2w8+pW0ZI+XqGP6Y5YDZsA7+ecJL/+RgpieMp+zBfCKTiwH6UksJZmKUds15oYB8IlR7TZjrbKvR9lV/FuY+5b/zvmAs1NALTyWnjTL6KRFOroTgMVqIWRNr/Qeuy3GXipVVdnP5qO9o/JlIJCL23w7jaSeXecM7GYng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4AYv33/X/13s7Ze2qypFs4BrnEYDd/Kdz0LDlK/3rM=;
 b=QY5+PcIuMgPPK9GuCT+5Kg09cSCDY1lHFSQm3e+gY7k97AgE/w6t49tZY+iJzawXLAN2lX/5L1peII5jkq8ADm0wFx4XfCmcoQtQeMsKCZPhc3Fh6MJ1avUkE+3MHL3JfSQgxBAoJ6fwDBQXIEdzxpE26pomu40IOEpsHQbJQwp6ZkKEio9VoikM2nojg4TOScvoj9iaGS+R5T2rPqe/4YAD7zBZTSi2o4CrHw36zHdPzsQzIt+o2w676lvXJ77G+9nZg1Yg8B0DsBo9Z8grxockqO14c8NgAutNy7CrmK7E/LLOj+4EetFC8XpoxJvE73hQe6mWLU0ZWl4zCK4EYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4AYv33/X/13s7Ze2qypFs4BrnEYDd/Kdz0LDlK/3rM=;
 b=erG9MWzMx0K9PAOtLWz8NlIfsTxeUAJRUK2wVQmrbho6HIMNTQNSg6lUu4LPUO4NeG84/Mjx6HZEww6RKsOdHJ5kAZdxavr6cYhxATWCFEEQssnw6NJDMP0kXEl24RnwT6KSu2Umx5BIDOsZ3vuFirtzsVZVZAXU8tcojfxGjh0=
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
Subject: [PATCH v5 5/9] xen/arm: smmuv2: Add PCI devices support for SMMUv2
Date: Wed, 4 Oct 2023 10:55:49 -0400
Message-ID: <20231004145604.1085358-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|SN7PR12MB7855:EE_
X-MS-Office365-Filtering-Correlation-Id: d3156fc9-2905-4bcc-ffbe-08dbc4ea40aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wEjf5tgQvu+9oacGnuHBJpefFTGUpyeV4QRqKBoLIjBphq8iRUdpsmqYkCDjHqbH3z6Qau/hiQVfPAGRTLT7Mwfq0dqjGmgAuKQs0BzKVb+XoeH65xWl2H5KThOHjQaP6saGJq5WfFgC3q25byq055xzcNWuiuWJU5aXHWs/JuGyI6yw6Q2/FRQNCkwE65cMeU2bqx+5ngY4McEaYo8LKfe+WDi6U39s4+2dPeDuoPLYrk/CNewkKzXKIdIp4x8yWZtJftxXhj1W6uVbMfgcXxgLPsHfe+ZJagsz2tYABoIVADK9TZvk+50nBJ4ROv3+2ucY1sLZbYUOvcLgoEHEd1yry4kbz7oMQsvvZs15Z1+ynGqlBvfASb/vgLfnmLetX+QrVJ7ADadoIdihluhls8R5o0LfBTkZ3L+55fy/3TA6M1LCEdKD2fvOaiP+0BYClArsiInT8ehZ/bGsOMVnnPAOgF7s1COHVf4rEmQKVEehuu3j+vZGStsXXvcOThU37Lf3KnEtkaztb8+WQOjCRr6Bdr8fV6deeNK8+Gb/GYrrcOg/35wo4UvKhJM5IW2ZYZWvd2OfnJ6yBGeioU1//ICqcWgbVG2sQM1glRMBxpItMj6+leDUMp1CsOu5RhNXL7a3FoJuBQLuDxa+KCFx6cOhq3e95+4oqagOLLfPq6VrEGpwSRZTs3DbPJwnDIXwpcqkPHMalQZvP3K0KwdcV8EX4QLnDnLR51nqzY3/Lb3fRdlSfm+KenDBuBeF4XeP
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(1800799009)(82310400011)(186009)(451199024)(36840700001)(40470700004)(46966006)(478600001)(6666004)(966005)(26005)(1076003)(2616005)(316002)(2906002)(30864003)(83380400001)(4326008)(44832011)(8676002)(6916009)(41300700001)(70586007)(54906003)(70206006)(5660300002)(36756003)(8936002)(86362001)(47076005)(36860700001)(82740400003)(81166007)(356005)(426003)(336012)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:57:38.9084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3156fc9-2905-4bcc-ffbe-08dbc4ea40aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7855

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v4->v5:
* assign device to pdev->domain (usually dom0) by default in add_device() hook
* deassign from hwdom
* rebase on top of ("dynamic node programming using overlay dtbo") series
* remove TODO in comment about device prints
* add TODO regarding locking
* fixup after dropping ("xen/arm: Move is_protected flag to struct device")

v3->v4:
* add new device_is_protected check in add_device hook to match SMMUv3 and
  IPMMU-VMSA drivers

v2->v3:
* invoke iommu_add_pci_sideband_ids() from add_device hook

v1->v2:
* ignore add_device/assign_device/reassign_device calls for phantom functions
  (i.e. devfn != pdev->devfn)

downstream->v1:
* wrap unused function in #ifdef 0
* remove the remove_device() stub since it was submitted separately to the list
  [XEN][PATCH v6 12/19] xen/smmu: Add remove_device callback for smmu_iommu ops
  https://lists.xenproject.org/archives/html/xen-devel/2023-05/msg00204.html
* arm_smmu_(de)assign_dev: return error instead of crashing system
* update condition in arm_smmu_reassign_dev
* style fixup
* add && !is_hardware_domain(d) into condition in arm_smmu_assign_dev()

(cherry picked from commit 0c11a7f65f044c26d87d1e27ac6283ef1f9cfb7a from
 the downstream branch spider-master from
 https://github.com/xen-troops/xen.git)
---
 xen/drivers/passthrough/arm/smmu.c | 194 ++++++++++++++++++++++++-----
 1 file changed, 164 insertions(+), 30 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 71799064f80b..aae54aeea4ad 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -131,11 +131,21 @@ enum irqreturn {
 
 typedef enum irqreturn irqreturn_t;
 
-/* Device logger functions
- * TODO: Handle PCI
- */
-#define dev_print(dev, lvl, fmt, ...)						\
-	 printk(lvl "smmu: %s: " fmt, dt_node_full_name(dev_to_dt(dev)), ## __VA_ARGS__)
+/* Device logger functions */
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
@@ -187,6 +197,7 @@ static void __iomem *devm_ioremap_resource(struct device *dev,
  * Xen: PCI functions
  * TODO: It should be implemented when PCI will be supported
  */
+#if 0 /* unused */
 #define to_pci_dev(dev)	(NULL)
 static inline int pci_for_each_dma_alias(struct pci_dev *pdev,
 					 int (*fn) (struct pci_dev *pdev,
@@ -196,6 +207,7 @@ static inline int pci_for_each_dma_alias(struct pci_dev *pdev,
 	BUG();
 	return 0;
 }
+#endif
 
 /* Xen: misc */
 #define PHYS_MASK_SHIFT		PADDR_BITS
@@ -631,7 +643,7 @@ struct arm_smmu_master_cfg {
 	for (i = 0; idx = cfg->smendx[i], i < num; ++i)
 
 struct arm_smmu_master {
-	struct device_node		*of_node;
+	struct device			*dev;
 	struct rb_node			node;
 	struct arm_smmu_master_cfg	cfg;
 };
@@ -723,7 +735,7 @@ arm_smmu_get_fwspec(struct arm_smmu_master_cfg *cfg)
 {
 	struct arm_smmu_master *master = container_of(cfg,
 			                                      struct arm_smmu_master, cfg);
-	return dev_iommu_fwspec_get(&master->of_node->dev);
+	return dev_iommu_fwspec_get(master->dev);
 }
 
 static void parse_driver_options(struct arm_smmu_device *smmu)
@@ -756,7 +768,7 @@ static struct device_node *dev_get_dev_node(struct device *dev)
 }
 
 static struct arm_smmu_master *find_smmu_master(struct arm_smmu_device *smmu,
-						struct device_node *dev_node)
+						struct device *dev)
 {
 	struct rb_node *node = smmu->masters.rb_node;
 
@@ -765,9 +777,9 @@ static struct arm_smmu_master *find_smmu_master(struct arm_smmu_device *smmu,
 
 		master = container_of(node, struct arm_smmu_master, node);
 
-		if (dev_node < master->of_node)
+		if (dev < master->dev)
 			node = node->rb_left;
-		else if (dev_node > master->of_node)
+		else if (dev > master->dev)
 			node = node->rb_right;
 		else
 			return master;
@@ -802,9 +814,9 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
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
@@ -836,28 +848,37 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
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
+
+	if ( !dev_is_pci(dev) )
+	{
+		if ( dt_device_is_protected(dev_node) )
+		{
+			dev_err(dev, "Already added to SMMU\n");
+			return -EEXIST;
+		}
 
-	/* Xen: Let Xen know that the device is protected by an SMMU */
-	dt_device_set_protected(dev_node);
+		/* Xen: Let Xen know that the device is protected by an SMMU */
+		dt_device_set_protected(dev_node);
+	}
 
 	for (i = 0; i < fwspec->num_ids; ++i) {
 		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
 		     (fwspec->ids[i] >= smmu->num_mapping_groups)) {
 			dev_err(dev,
 				"stream ID for master device %s greater than maximum allowed (%d)\n",
-				dev_node->name, smmu->num_mapping_groups);
+				dev_node ? dev_node->name : "", smmu->num_mapping_groups);
 			return -ERANGE;
 		}
 		master->cfg.smendx[i] = INVALID_SMENDX;
@@ -872,7 +893,7 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_smmu_device *smmu,
 	struct device_node *dev_node = dev_get_dev_node(dev);
 	int ret;
 
-	master = find_smmu_master(smmu, dev_node);
+	master = find_smmu_master(smmu, dev);
 	if (master == NULL) {
 		dev_err(dev,
 			"No registrations found for master device %s\n",
@@ -884,8 +905,9 @@ static int arm_smmu_dt_remove_device_legacy(struct arm_smmu_device *smmu,
 	if (ret)
 		return ret;
 
-	/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks. */
-	dev_node->is_protected = false;
+	if ( !dev_is_pci(dev) )
+		/* Protected by dt_host_lock and dtdevs_lock as caller holds these locks. */
+		dev_node->is_protected = false;
 
 	kfree(master);
 	return 0;
@@ -914,6 +936,12 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 					     fwspec);
 }
 
+/* Forward declaration */
+static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
+			       struct device *dev, u32 flag);
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
+				 struct device *dev);
+
 /*
  * The driver which supports generic IOMMU DT bindings must have this
  * callback implemented.
@@ -938,6 +966,22 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
 {
 	struct arm_smmu_device *smmu;
 	struct iommu_fwspec *fwspec;
+	int ret;
+
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev = dev_to_pci(dev);
+		int ret;
+
+		if ( devfn != pdev->devfn )
+			return 0;
+
+		ret = iommu_add_pci_sideband_ids(pdev);
+		if ( ret < 0 )
+			iommu_fwspec_free(dev);
+	}
+#endif
 
 	fwspec = dev_iommu_fwspec_get(dev);
 	if (fwspec == NULL)
@@ -947,7 +991,24 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
 	if (smmu == NULL)
 		return -ENXIO;
 
-	return arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
+	ret = arm_smmu_dt_add_device_legacy(smmu, dev, fwspec);
+	if ( ret )
+		return ret;
+
+#ifdef CONFIG_HAS_PCI
+	if ( dev_is_pci(dev) )
+	{
+		struct pci_dev *pdev = dev_to_pci(dev);
+
+		/*
+		 * During PHYSDEVOP_pci_device_add, Xen does not assign the
+		 * device, so we must do it here.
+		 */
+		ret = arm_smmu_assign_dev(pdev->domain, devfn, dev, 0);
+	}
+#endif
+
+	return ret;
 }
 
 static int arm_smmu_dt_xlate_generic(struct device *dev,
@@ -970,11 +1031,10 @@ static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
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
@@ -2066,6 +2126,7 @@ static bool arm_smmu_capable(enum iommu_cap cap)
 }
 #endif
 
+#if 0 /* Not used */
 static int __arm_smmu_get_pci_sid(struct pci_dev *pdev, u16 alias, void *data)
 {
 	*((u16 *)data) = alias;
@@ -2076,6 +2137,7 @@ static void __arm_smmu_release_pci_iommudata(void *data)
 {
 	kfree(data);
 }
+#endif
 
 static int arm_smmu_add_device(struct device *dev)
 {
@@ -2083,12 +2145,13 @@ static int arm_smmu_add_device(struct device *dev)
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
@@ -2113,10 +2176,12 @@ static int arm_smmu_add_device(struct device *dev)
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
@@ -2784,6 +2849,56 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
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
+		ASSERT(pcidevs_locked());
+
+		/* TODO: acquire pci_lock */
+#if 0
+		write_lock(&pdev->domain->pci_lock);
+#endif
+		list_del(&pdev->domain_list);
+#if 0
+		write_unlock(&pdev->domain->pci_lock);
+
+		write_lock(&d->pci_lock);
+#endif
+		list_add(&pdev->domain_list, &d->pdev_list);
+#if 0
+		write_unlock(&d->pci_lock);
+#endif
+
+		pdev->domain = d;
+
+		domain = dev_iommu_domain(dev);
+
+		/*
+		 * Xen may not deassign the device from hwdom before assigning
+		 * it elsewhere.
+		 */
+		if ( domain && is_hardware_domain(domain->priv->cfg.domain) )
+		{
+			ret = arm_smmu_deassign_dev(hardware_domain, devfn, dev);
+			if ( ret )
+				return ret;
+		}
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
@@ -2833,11 +2948,30 @@ out:
 	return ret;
 }
 
-static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
+static int arm_smmu_deassign_dev(struct domain *d, uint8_t devfn,
+				 struct device *dev)
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
@@ -2865,13 +2999,13 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
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
2.42.0


