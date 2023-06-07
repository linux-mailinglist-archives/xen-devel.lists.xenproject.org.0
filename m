Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F45B72524A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 05:06:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544292.849983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jUl-0002vh-EB; Wed, 07 Jun 2023 03:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544292.849983; Wed, 07 Jun 2023 03:05:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jUl-0002tp-9d; Wed, 07 Jun 2023 03:05:59 +0000
Received: by outflank-mailman (input) for mailman id 544292;
 Wed, 07 Jun 2023 03:05:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfoE=B3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6jUj-0002sk-Jw
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 03:05:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36ad68e3-04e0-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 05:05:53 +0200 (CEST)
Received: from MW4PR04CA0115.namprd04.prod.outlook.com (2603:10b6:303:83::30)
 by MW4PR12MB7287.namprd12.prod.outlook.com (2603:10b6:303:22c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 03:05:48 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::7a) by MW4PR04CA0115.outlook.office365.com
 (2603:10b6:303:83::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 03:05:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Wed, 7 Jun 2023 03:05:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 22:05:46 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 22:05:44 -0500
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
X-Inumbo-ID: 36ad68e3-04e0-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7G5pFcTCYze0cZ0bsUJjfSoUvROVE74ZSeu1ld7Mk7P7IVpeV4eGV90eQFF+BXc23Gh9ITPTI3rVpTLjWpSRzOiz3nEYUqVEwL2LAheTTmIlDUsOynwidH19d6cNen9cqWEZ9C9XbVixjQMWgt55VdVFRpysOgqTlvD8KcL1VRRhehIRNAVzIwpLzzbm+wOc7qKSmfSwArgnxxemb7QWV2S4Q2vXheRC5cHpN24iSXTfU33vd4Q7GfQy8DcSnuph71j3edHNRWrww7p6jEJz6sX/5cTZiQj2co2OrSh5qpZvbi0KzE7OnXol93kDLug++QBmHSdvR8IRPlU+67KDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vhE+gJtWzDt5s54scLJj3hXZ6GdKzqeUWBduIkmLOg=;
 b=Fwi2v4W7YmbM+IdQS/NQwX6aXOrdj6aIYt9JG7w+8eVxDkmd7uhpBOItF9Ka5a6UbNsVMoyJGGi9smECU9GMxpQi6BrUgXY3TpFTLw3hfxuCOFOk46+NA/SrK6DulUu3128AAV/Qrr5w3AivxNs6FpZTe6EIhsQjeNdVMqnSeMyxVyV6btN5SE6tiDNJOkKa0VTzv6c0kOiKuENoUgfU4yj+zCLMi46eAdoewhOayzb628XuYt+qCkDJQpC8SOgnYklDkDeucmKoaM2wdWjNDETOE4El9Cy/e4Ce5jePYcjkT2uRBjIF9R1HPJIMDPQ92ZSSwo+cU48bNX2cfLM7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vhE+gJtWzDt5s54scLJj3hXZ6GdKzqeUWBduIkmLOg=;
 b=E5k6akw0JUKf1h5KD5YvuEGF3CMw+fepVmVLmU7NgLFulBrs4GQQCQZ1JIhgsmmoFSREFDqACoZLQlO3NNIml5q0hhUY/1U6dFcIF6lVgGqldcbLVjRrycN3QLGdpWEYrV8pcFRI9MSn8oKm1AHqWvEm3z8BwK/5lGTMRp0wQEk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v4 2/7] xen/arm: Move is_protected flag to struct device
Date: Tue, 6 Jun 2023 23:02:15 -0400
Message-ID: <20230607030220.22698-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607030220.22698-1-stewart.hildebrand@amd.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT048:EE_|MW4PR12MB7287:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d727e3-66da-4cff-3e5c-08db67041763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O6o+jMgG5hX5uAfbG0L3M3Osa2Qg7zKxevIeyF5p0+Gl5YFXCIfHYZksAJXfb7wR041l9+glNNj/8ATN8W4P64/jESdSoJnrvKFeaxwzXpOqWtMV3zTbM7sP/RY4nD2qqqiuDFJGJBDGH0SfwZDgkgGmg+6QyikLIwOUIGHHRWA0D0qb+FOG84347SgZNF9LvO2dmjnhFdOgzfqD74dZ9cZSDDDbkHBQzi7PZ79cvHfa9OumT0FFNFT+VLWH1EI7WYvfnMtxsl/CztHzHGsc/jkLEULCrSf/lytmzQRb5nBTovQa6Kt/XiLe8kW8U6Ary6sxD2HFJB7jifYdK/XiEPJaPWVExCJ5du/5pMAswaoK0naIOufHm52AhtHjC9tPYUX1DKP422Tg9mM/sk9Rtshdrg/jWTOqGupLS7lEwH/EAUK7m+9553d0mxLdT5n6TTsPxqNofCJYwzCVK+0eTJ76oovtqdIPIcYAnRSDC0Hd5lKcnFerdxz4uwpSxv00L8q7aWVytwxfnXi0dnnQvNQNWORgn4Dk0xnTjLsi41JP//y3+R9GpQwD1W1rZh2cRIrBhSenWVLPVW4vsKUMSE+9lj7WXI7qsA4MgelFZjuxvnsPxxdmNsufwrcYDjhw+DUsFSW8sB3IhxeSKxcIqlLwsPfa7evXVPcLbVhlpw0mLJi/mzIomwtLxtAYoFcncLum+RQP9N7FLohaQNSix/uf9QeVVHA7BYxQsszu2ydrnSNPpes1MCR5Nsq1HbSWEtVqONdIwrvq4oojUNQfCg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(40470700004)(46966006)(36840700001)(81166007)(54906003)(478600001)(5660300002)(44832011)(8936002)(36756003)(2906002)(86362001)(8676002)(82310400005)(6916009)(70586007)(4326008)(70206006)(316002)(82740400003)(356005)(40480700001)(40460700003)(83380400001)(47076005)(41300700001)(1076003)(26005)(2616005)(186003)(426003)(966005)(336012)(36860700001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 03:05:47.1561
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d727e3-66da-4cff-3e5c-08db67041763
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7287

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This flag will be re-used for PCI devices by the subsequent
patches.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* move is_protected flag within struct device to reduce padding
* re-add device_is_protected checks in add_device hooks in smmu-v3.c/ipmmu-vmsa.c
* split mmu-masters check into separate patch

v2->v3:
* no change

v1->v2:
* no change

downstream->v1:
* rebase
* s/dev_node->is_protected/dev_node->dev.is_protected/ in smmu.c
* s/dt_device_set_protected(dev_to_dt(dev))/device_set_protected(dev)/ in smmu-v3.c
* remove redundant device_is_protected checks in smmu-v3.c/ipmmu-vmsa.c

(cherry picked from commit 59753aac77528a584d3950936b853ebf264b68e7 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/arch/arm/domain_build.c              |  4 ++--
 xen/arch/arm/include/asm/device.h        | 14 ++++++++++++++
 xen/common/device_tree.c                 |  2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  4 ++--
 xen/drivers/passthrough/arm/smmu-v3.c    |  5 +++--
 xen/drivers/passthrough/arm/smmu.c       |  2 +-
 xen/drivers/passthrough/device_tree.c    |  8 ++++----
 xen/include/xen/device_tree.h            | 13 -------------
 8 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3f4558ade67f..b229bfaae712 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2524,7 +2524,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
             return res;
         }
 
-        if ( dt_device_is_protected(dev) )
+        if ( device_is_protected(dt_to_dev(dev)) )
         {
             dt_dprintk("%s setup iommu\n", dt_node_full_name(dev));
             res = iommu_assign_dt_device(d, dev);
@@ -3024,7 +3024,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         return res;
 
     /* If xen_force, we allow assignment of devices without IOMMU protection. */
-    if ( xen_force && !dt_device_is_protected(node) )
+    if ( xen_force && !device_is_protected(dt_to_dev(node)) )
         return 0;
 
     return iommu_assign_dt_device(kinfo->d, node);
diff --git a/xen/arch/arm/include/asm/device.h b/xen/arch/arm/include/asm/device.h
index b5d451e08776..8ac807482737 100644
--- a/xen/arch/arm/include/asm/device.h
+++ b/xen/arch/arm/include/asm/device.h
@@ -1,6 +1,8 @@
 #ifndef __ASM_ARM_DEVICE_H
 #define __ASM_ARM_DEVICE_H
 
+#include <xen/types.h>
+
 enum device_type
 {
     DEV_DT,
@@ -15,6 +17,8 @@ struct dev_archdata {
 struct device
 {
     enum device_type type;
+    bool is_protected; /* Shows that device is protected by IOMMU */
+    uint8_t _pad[3];
 #ifdef CONFIG_HAS_DEVICE_TREE
     struct dt_device_node *of_node; /* Used by drivers imported from Linux */
 #endif
@@ -94,6 +98,16 @@ int device_init(struct dt_device_node *dev, enum device_class class,
  */
 enum device_class device_get_class(const struct dt_device_node *dev);
 
+static inline void device_set_protected(struct device *device)
+{
+    device->is_protected = true;
+}
+
+static inline bool device_is_protected(const struct device *device)
+{
+    return device->is_protected;
+}
+
 #define DT_DEVICE_START(_name, _namestr, _class)                    \
 static const struct device_desc __dev_desc_##_name __used           \
 __section(".dev.info") = {                                          \
diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 8da105291184..7444da3e0aa5 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -1910,7 +1910,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
         /* By default dom0 owns the device */
         np->used_by = 0;
         /* By default the device is not protected */
-        np->is_protected = false;
+        np->dev.is_protected = false;
         INIT_LIST_HEAD(&np->domain_list);
 
         if ( new_format )
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 611d9eeba5c3..a71fd76d89a3 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1288,14 +1288,14 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
     if ( !to_ipmmu(dev) )
         return -ENODEV;
 
-    if ( dt_device_is_protected(dev_to_dt(dev)) )
+    if ( device_is_protected(dev) )
     {
         dev_err(dev, "Already added to IPMMU\n");
         return -EEXIST;
     }
 
     /* Let Xen know that the master device is protected by an IOMMU. */
-    dt_device_set_protected(dev_to_dt(dev));
+    device_set_protected(dev);
 
     dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
              dev_name(fwspec->iommu_dev), fwspec->num_ids);
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 720aa69ff23e..8842db1ec07e 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1521,13 +1521,14 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
 	 */
 	arm_smmu_enable_pasid(master);
 
-	if (dt_device_is_protected(dev_to_dt(dev))) {
+	if ( device_is_protected(dev) )
+	{
 		dev_err(dev, "Already added to SMMUv3\n");
 		return -EEXIST;
 	}
 
 	/* Let Xen know that the master device is protected by an IOMMU. */
-	dt_device_set_protected(dev_to_dt(dev));
+	device_set_protected(dev);
 
 	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
 			dev_name(fwspec->iommu_dev), fwspec->num_ids);
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index c37fa9af1366..d874417958b5 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -837,7 +837,7 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 	master->of_node = dev_node;
 
 	/* Xen: Let Xen know that the device is protected by an SMMU */
-	dt_device_set_protected(dev_node);
+	device_set_protected(dev);
 
 	for (i = 0; i < fwspec->num_ids; ++i) {
 		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index d9b63da7260a..c60e78eaf556 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -34,7 +34,7 @@ int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev)
     if ( !is_iommu_enabled(d) )
         return -EINVAL;
 
-    if ( !dt_device_is_protected(dev) )
+    if ( !device_is_protected(dt_to_dev(dev)) )
         return -EINVAL;
 
     spin_lock(&dtdevs_lock);
@@ -65,7 +65,7 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
     if ( !is_iommu_enabled(d) )
         return -EINVAL;
 
-    if ( !dt_device_is_protected(dev) )
+    if ( !device_is_protected(dt_to_dev(dev)) )
         return -EINVAL;
 
     spin_lock(&dtdevs_lock);
@@ -87,7 +87,7 @@ static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
 {
     bool_t assigned = 0;
 
-    if ( !dt_device_is_protected(dev) )
+    if ( !device_is_protected(dt_to_dev(dev)) )
         return 0;
 
     spin_lock(&dtdevs_lock);
@@ -146,7 +146,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
      * and iommus property, there is no need to register it again. In this case
      * simply return success early.
      */
-    if ( dt_device_is_protected(np) )
+    if ( device_is_protected(dev) )
         return 0;
 
     if ( dev_iommu_fwspec_get(dev) )
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index c2eada748915..c2f315140560 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -90,9 +90,6 @@ struct dt_device_node {
     struct dt_device_node *next; /* TODO: Remove it. Only use to know the last children */
     struct dt_device_node *allnext;
 
-    /* IOMMU specific fields */
-    bool is_protected;
-
     /* HACK: Remove this if there is a need of space */
     bool_t static_evtchn_created;
 
@@ -329,16 +326,6 @@ static inline domid_t dt_device_used_by(const struct dt_device_node *device)
     return device->used_by;
 }
 
-static inline void dt_device_set_protected(struct dt_device_node *device)
-{
-    device->is_protected = true;
-}
-
-static inline bool dt_device_is_protected(const struct dt_device_node *device)
-{
-    return device->is_protected;
-}
-
 static inline bool_t dt_property_name_is_equal(const struct dt_property *pp,
                                                const char *name)
 {
-- 
2.40.1


