Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DA6725250
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 05:08:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544319.850023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jWb-0005L8-Sk; Wed, 07 Jun 2023 03:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544319.850023; Wed, 07 Jun 2023 03:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jWb-0005II-Ou; Wed, 07 Jun 2023 03:07:53 +0000
Received: by outflank-mailman (input) for mailman id 544319;
 Wed, 07 Jun 2023 03:07:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfoE=B3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6jWa-0004mr-7R
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 03:07:52 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20608.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c7edec4-04e0-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 05:07:51 +0200 (CEST)
Received: from MW4P223CA0029.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::34)
 by DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 03:07:48 +0000
Received: from CO1NAM11FT069.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::4f) by MW4P223CA0029.outlook.office365.com
 (2603:10b6:303:80::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 03:07:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT069.mail.protection.outlook.com (10.13.174.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.37 via Frontend Transport; Wed, 7 Jun 2023 03:07:47 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 22:07:46 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 20:07:46 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 22:07:44 -0500
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
X-Inumbo-ID: 7c7edec4-04e0-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VX2I7YGOqbtsbXzDXz/xl4yLpE3DLW5h5EVLkIggwXtSmHIWfNGNqOWWZjAR0mLD+BzuaZSFXJFNUkCqVrfsrKCwgC90452oeiV8FCkrEfDA0bX9HnNZ+cXXjJ9c8qPLMxpK4UCFL5Ixpv4j1h2aCKk73BUVWJilKqBJjSVvTHd3uF5Ak65GIBdaSniH8o4ZqGcKRmT4hstYiQYCXNhSdrGVYelkO+3IkFqeIou6Q0aCEQ1EgOghAgIyQVJnAL33tnrTr1ncKwZbwSWjvCvjXtNi/4QLExNOyNBC28ODdthoKtgHgz1LIUoWalnGGYquQh1twlbHzNKGoCoW0LrDkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NwxgsRLXVRgyixeYcAGGIjd7v3ZGkKgyTYitjgcDg4=;
 b=hZ2k0Vw9X1hXM1wrhePy4GCOPvggWXv6/w57PEP4KjZxPjdheGd4mwEx9jk2+Q6dDqK2WEdAPxrNbNoOkgee3jcmZiy71StTP1xabjpLsptQkKkOIyqVLe0+Fw9FW1Hgs+XuEjrT+5W1et03X29Iv3qVrLvjZc6/bJvg5FOOCZJKOb+OAvk8ISAdmdLZOcPtKd6WTR46GLRm7dQgfWLf4C1eisYS9mg7T74HTgv/9xLW7xBW+M/6FkIfvW7Dj7VkukaCCAx7eoPxsSiEYaFtBsCZzyCrQPvPLQzzk6kOceRAtWiQaWMy4slLe4M+ty/Vgyg5ypMgoSudlZybOE292w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NwxgsRLXVRgyixeYcAGGIjd7v3ZGkKgyTYitjgcDg4=;
 b=jyrc7rRWOpJJdQFK+pchTu6H/vPzc9auD7tRPK2AIIKGtleUiPa+2UhAT9hXWe+SD+aP+nTMcf4tstn+JXJTCzzAHx3AfY9U/I7q1j0Vqohs2erdDwCqX5mRT5OPAzyOzg1vEclqGnfgcRVW9AAPyIAcaFgHlIaChYrsAOd0/oM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Julien Grall
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v4 6/7] xen/arm: smmuv2: Add PCI devices support for SMMUv2
Date: Tue, 6 Jun 2023 23:02:19 -0400
Message-ID: <20230607030220.22698-7-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607030220.22698-1-stewart.hildebrand@amd.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT069:EE_|DM6PR12MB4188:EE_
X-MS-Office365-Filtering-Correlation-Id: 8697a878-05b0-470a-18c8-08db67045f30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8izQtLXcoNj0GTZSOUcmBnwjpZWTCArrv1Vz4My8n5vtJCCgxnih5scLWyNzLOmwVBVGDH/4B1O/COK+DPAOSKNvxr2/zt9JiGJ1dm8RreC8eTtLxq5Y6ou1zWVqlkZVu4KZ8LYSnWiDy5eITt+hFJjAneNJsbCtsjcaKbX/pEmYtiN7fUazqDSr+dWZjyPHStxk/PoMv/fvvapLhF/iTrOia7sguE4rFfEHC1LIdwuEsuuMFW1Jzx0kBUb/2LHM1jM16Z6hfOStVDinEASaNP7kzhObLxIHY2XtMlswS+aQg6JWUxDLhg/EDI9fMO2Db35qSV0yLXdoe1+DNpIzftwC9zdFA6eRz57YhI1BEPAkiJ236+vGKdzCFj5rC8kWv1P+O2ZQLyr5GHo2XDCYD3oJPriVhHyZJuJpcKzLCk02ijYWRoj/nqc+Gw1p732IvYyVjAUjnboqCz5IDxvZkz3nXvEnbmn84o/NYDstDMkGpff915Jwx3wDRLwT2XBPC3f7mnmEUfltPczkJH93ZNCehT+Oj0RSvx07ZSKjHCKESq6MJsBejufg9l+lyKXMhbgJA8w9krAUZGaiW41IQ51hqGDGOmyOk9Lbc9f2inUtAQCuW0+zkcNdos0IYodKEy0pW3qPFTjQz3D1TPsMDctpNWHQsfVseIdA5ds1DUWjEc+0A0+H0OHmKXw7eBCOgja6XevEGWrpZ+zp5QxPoBx2b1AbuH1BWp8M5n2zyB71u8Q8hbq2BfXOBiw34PHssyW3to/1DWT3bdVhyfdswuNmXWnV7OlFKlWbzFzCBwY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(966005)(6666004)(83380400001)(36860700001)(186003)(336012)(36756003)(426003)(2616005)(86362001)(82310400005)(81166007)(356005)(47076005)(82740400003)(1076003)(26005)(40480700001)(316002)(54906003)(70586007)(70206006)(8676002)(8936002)(6916009)(4326008)(5660300002)(44832011)(41300700001)(2906002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 03:07:47.6168
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8697a878-05b0-470a-18c8-08db67045f30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT069.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4188

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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

This is a file imported from Linux with modifications for Xen. What should be
the coding style for Xen modifications?
---
 xen/drivers/passthrough/arm/smmu.c | 120 ++++++++++++++++++++++++-----
 1 file changed, 99 insertions(+), 21 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index d874417958b5..edb5345fb1cd 100644
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
@@ -631,7 +645,7 @@ struct arm_smmu_master_cfg {
 	for (i = 0; idx = cfg->smendx[i], i < num; ++i)
 
 struct arm_smmu_master {
-	struct device_node		*of_node;
+	struct device			*dev;
 	struct rb_node			node;
 	struct arm_smmu_master_cfg	cfg;
 };
@@ -723,7 +737,7 @@ arm_smmu_get_fwspec(struct arm_smmu_master_cfg *cfg)
 {
 	struct arm_smmu_master *master = container_of(cfg,
 			                                      struct arm_smmu_master, cfg);
-	return dev_iommu_fwspec_get(&master->of_node->dev);
+	return dev_iommu_fwspec_get(master->dev);
 }
 
 static void parse_driver_options(struct arm_smmu_device *smmu)
@@ -756,7 +770,7 @@ static struct device_node *dev_get_dev_node(struct device *dev)
 }
 
 static struct arm_smmu_master *find_smmu_master(struct arm_smmu_device *smmu,
-						struct device_node *dev_node)
+						struct device *dev)
 {
 	struct rb_node *node = smmu->masters.rb_node;
 
@@ -765,9 +779,9 @@ static struct arm_smmu_master *find_smmu_master(struct arm_smmu_device *smmu,
 
 		master = container_of(node, struct arm_smmu_master, node);
 
-		if (dev_node < master->of_node)
+		if (dev < master->dev)
 			node = node->rb_left;
-		else if (dev_node > master->of_node)
+		else if (dev > master->dev)
 			node = node->rb_right;
 		else
 			return master;
@@ -802,9 +816,9 @@ static int insert_smmu_master(struct arm_smmu_device *smmu,
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
@@ -823,18 +837,24 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
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
+	if ( device_is_protected(dev) )
+	{
+		dev_err(dev, "Already added to SMMU\n");
+		return -EEXIST;
+	}
 
 	/* Xen: Let Xen know that the device is protected by an SMMU */
 	device_set_protected(dev);
@@ -844,7 +864,7 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 		     (fwspec->ids[i] >= smmu->num_mapping_groups)) {
 			dev_err(dev,
 				"stream ID for master device %s greater than maximum allowed (%d)\n",
-				dev_node->name, smmu->num_mapping_groups);
+				dev_node ? dev_node->name : "", smmu->num_mapping_groups);
 			return -ERANGE;
 		}
 		master->cfg.smendx[i] = INVALID_SMENDX;
@@ -880,6 +900,21 @@ static int arm_smmu_dt_add_device_generic(u8 devfn, struct device *dev)
 	struct arm_smmu_device *smmu;
 	struct iommu_fwspec *fwspec;
 
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
+
 	fwspec = dev_iommu_fwspec_get(dev);
 	if (fwspec == NULL)
 		return -ENXIO;
@@ -911,11 +946,10 @@ static struct arm_smmu_device *find_smmu_for_device(struct device *dev)
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
@@ -2007,6 +2041,7 @@ static bool arm_smmu_capable(enum iommu_cap cap)
 }
 #endif
 
+#if 0 /* Not used */
 static int __arm_smmu_get_pci_sid(struct pci_dev *pdev, u16 alias, void *data)
 {
 	*((u16 *)data) = alias;
@@ -2017,6 +2052,7 @@ static void __arm_smmu_release_pci_iommudata(void *data)
 {
 	kfree(data);
 }
+#endif
 
 static int arm_smmu_add_device(struct device *dev)
 {
@@ -2024,12 +2060,13 @@ static int arm_smmu_add_device(struct device *dev)
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
@@ -2054,10 +2091,12 @@ static int arm_smmu_add_device(struct device *dev)
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
@@ -2725,6 +2764,27 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
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
@@ -2774,11 +2834,29 @@ out:
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
@@ -2806,13 +2884,13 @@ static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
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


