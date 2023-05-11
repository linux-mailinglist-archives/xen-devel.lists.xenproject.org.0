Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE666FF9FF
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 21:18:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533542.830314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBnQ-0004ZE-UL; Thu, 11 May 2023 19:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533542.830314; Thu, 11 May 2023 19:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBnQ-0004Vz-R2; Thu, 11 May 2023 19:17:48 +0000
Received: by outflank-mailman (input) for mailman id 533542;
 Thu, 11 May 2023 19:17:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWxp=BA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pxBnP-00042a-7d
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 19:17:47 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80e443ec-f030-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 21:17:45 +0200 (CEST)
Received: from DM6PR17CA0026.namprd17.prod.outlook.com (2603:10b6:5:1b3::39)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 19:17:40 +0000
Received: from DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::76) by DM6PR17CA0026.outlook.office365.com
 (2603:10b6:5:1b3::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22 via Frontend
 Transport; Thu, 11 May 2023 19:17:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT103.mail.protection.outlook.com (10.13.172.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.22 via Frontend Transport; Thu, 11 May 2023 19:17:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 14:17:39 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 11 May 2023 14:17:37 -0500
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
X-Inumbo-ID: 80e443ec-f030-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNrkR38SIlI+XXPwGihe6pUHsD1bNE9EaSEqIxbT/y+OtHrGB7jF/D8Mevww3YOcap6YKHhsGHQA2p2qrPFER5RFWwYqXRJNbhD27UoArf7cYPnH/ZtIezTPFGQxpkjw4WKidvxuvd2RSL9Bi9ZVbzE8sCdqPxi/HvcAp4r9BXIEXC64Ij74xEX01FKbyNESzb9dbcAwrQqd45H0W5OW769p5t4xFWJv7f3Mauo4TrDOvhBPcb1xiu+MX0OAiXAC+09SQL8Q1GMOI3T55585c8Gl0esbGSie+TwM/iX0TeCijxAtEq70Z1Rs0b4juTDUQ48aDzfi5lLnzxJU0ZvENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxhzk6CbTYHjfXnu2i9bDdgPDhMQRJVaJmh+gENOEuM=;
 b=a77Rca2x9UA+3CSDdu49JuSFKTi1vdeu101eYX9bIJsMI+QizQ6d6TfY8xUhGljlZQzTrfbPY5ohxsZnBsPriDVK6WsV1NMp4dyJ8zJ/jjJMyA92K4KKtMAd/ZlHWsfwueCpT+wz1ERv/K5PQ+/CTEENysvFtUkdUXwhh7X9sP2iM47hCrO+eatcW3LUKE/nH/u8zoNEIbUhADdtDfUcR+2vfsZE0p/vv1kAVdy+5WaPuXH93o2hgI/Tu6VutRFZqGGNlTmvDIwjidPyJA5bAAivmn5jnmFF2YuG6rGhLs2+KdPTwhEytHzGIvaMpomUPyZhcoSpkYEHeNo656byUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxhzk6CbTYHjfXnu2i9bDdgPDhMQRJVaJmh+gENOEuM=;
 b=nut1PzLZRW6qo16muzo+WvE7+Hy3zSU0rEByWvc2zzsTWracuU2+ar9FOYgKH0lu0BNul8GR7fHJdtk5mymstmFb6zsPwRUzu+4hNdWFfRFM1DQaYPTKpnCfnpsOVpLdnGtniLC3QUOahc4v8HeDJGdbT8izeraapExdQHf/CyY=
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
Subject: [PATCH v2 1/8] xen/arm: Move is_protected flag to struct device
Date: Thu, 11 May 2023 15:16:47 -0400
Message-ID: <20230511191654.400720-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511191654.400720-1-stewart.hildebrand@amd.com>
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT103:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a6e51ab-3b66-43a3-f43f-08db52546342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R+XxmJ41CVTP5/g0zZwmIoj1hVO9HgQCnfTLdA+5jzWAHOE0IQiCs17W14HVNLv40h6vJMWI/1+PmVpVHzemEWY5Ln0AUkOc9I/F2kqrQVguBGUYVQCklovLX5C1DAJkUNudnGCYNWPltPFhNa4b5oWFhKtO02llLVq9YLeDER0jMl3RoRSlok8geLdh3y2Dm+awDOxKIImmz8xpKOXarfgPGoiO8AI2RCLm7ZRKhKwqdsJ6EcgFebvvbkFPU379+ft4c1vTxwFjzht2hyczQHvA/PZSjDCnhhm9x9nP5uQ3rVox0d7a6ir8KWR+S0O/CxltWlGmQ3zwmm3KDOtnoRdzvoQ7d0dRNUF2UnG6zqqDIfAxN72J9cdr4iX9Pu6Zh16JCTzXj8xAiJ//1lch85ivcNEaSx0qtIoRT1hwo/AUsNQ3tIQa1ePF5ko+GWXB2pQeK994G3oVVuKSGYmvBITOsY65xdg/2bV6fDsRAkcpK0S+wB932Ej5klzl1V38IgbGVPvsH/tMaXKorz7zW627A7FqysqF7cOB1m8pu6ENJ9m9rvPGmArtRqbZZ+vua6VvII8mkTf5nj++5AHkeF7yf+b3civpDk8IC3rbtH/2sHBKAE0Gx/1o9p5OcY42aAuI6e/xIwI8bcSSlqQbuD7tMMDOY3A8WcI7luX2JErq/Pm8hPROuZ47nE3OvaO2UClBhmlaarxFFhtkrgCSj+y1CS/8Y2mrTKjd4857qBjvcQXxz4AniOU8JXEPWLQC
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(6666004)(8936002)(40460700003)(966005)(54906003)(70586007)(36756003)(70206006)(82740400003)(2906002)(4326008)(44832011)(6916009)(356005)(41300700001)(8676002)(5660300002)(316002)(81166007)(82310400005)(86362001)(40480700001)(478600001)(426003)(36860700001)(186003)(336012)(2616005)(47076005)(1076003)(26005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 19:17:39.8338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6e51ab-3b66-43a3-f43f-08db52546342
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT103.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This flag will be re-used for PCI devices by the subsequent
patches.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
 xen/arch/arm/include/asm/device.h        | 13 +++++++++++++
 xen/common/device_tree.c                 |  2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  8 +-------
 xen/drivers/passthrough/arm/smmu-v3.c    |  7 +------
 xen/drivers/passthrough/arm/smmu.c       |  2 +-
 xen/drivers/passthrough/device_tree.c    | 15 +++++++++------
 xen/include/xen/device_tree.h            | 13 -------------
 8 files changed, 28 insertions(+), 36 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index f80fdd1af206..106f92c65a61 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2507,7 +2507,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
             return res;
         }
 
-        if ( dt_device_is_protected(dev) )
+        if ( device_is_protected(dt_to_dev(dev)) )
         {
             dt_dprintk("%s setup iommu\n", dt_node_full_name(dev));
             res = iommu_assign_dt_device(d, dev);
@@ -3007,7 +3007,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         return res;
 
     /* If xen_force, we allow assignment of devices without IOMMU protection. */
-    if ( xen_force && !dt_device_is_protected(node) )
+    if ( xen_force && !device_is_protected(dt_to_dev(node)) )
         return 0;
 
     return iommu_assign_dt_device(kinfo->d, node);
diff --git a/xen/arch/arm/include/asm/device.h b/xen/arch/arm/include/asm/device.h
index b5d451e08776..086dde13eb6b 100644
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
@@ -20,6 +22,7 @@ struct device
 #endif
     struct dev_archdata archdata;
     struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
+    bool is_protected; /* Shows that device is protected by IOMMU */
 };
 
 typedef struct device device_t;
@@ -94,6 +97,16 @@ int device_init(struct dt_device_node *dev, enum device_class class,
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
index 6c9712ab7bda..1d5d7cb5f01b 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -1874,7 +1874,7 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
         /* By default dom0 owns the device */
         np->used_by = 0;
         /* By default the device is not protected */
-        np->is_protected = false;
+        np->dev.is_protected = false;
         INIT_LIST_HEAD(&np->domain_list);
 
         if ( new_format )
diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index 091f09b21752..039212a3a990 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -1288,14 +1288,8 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
     if ( !to_ipmmu(dev) )
         return -ENODEV;
 
-    if ( dt_device_is_protected(dev_to_dt(dev)) )
-    {
-        dev_err(dev, "Already added to IPMMU\n");
-        return -EEXIST;
-    }
-
     /* Let Xen know that the master device is protected by an IOMMU. */
-    dt_device_set_protected(dev_to_dt(dev));
+    device_set_protected(dev);
 
     dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
              dev_name(fwspec->iommu_dev), fwspec->num_ids);
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index bfdb62b395ad..4b452e6fdd00 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1521,13 +1521,8 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
 	 */
 	arm_smmu_enable_pasid(master);
 
-	if (dt_device_is_protected(dev_to_dt(dev))) {
-		dev_err(dev, "Already added to SMMUv3\n");
-		return -EEXIST;
-	}
-
 	/* Let Xen know that the master device is protected by an IOMMU. */
-	dt_device_set_protected(dev_to_dt(dev));
+	device_set_protected(dev);
 
 	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
 			dev_name(fwspec->iommu_dev), fwspec->num_ids);
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 0a514821b336..5b6024d579a8 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -838,7 +838,7 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
 	master->of_node = dev_node;
 
 	/* Xen: Let Xen know that the device is protected by an SMMU */
-	dt_device_set_protected(dev_node);
+	device_set_protected(dev);
 
 	for (i = 0; i < fwspec->num_ids; ++i) {
 		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 1c32d7b50cce..b5bd13393b56 100644
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
@@ -141,12 +141,15 @@ int iommu_add_dt_device(struct dt_device_node *np)
         return -EINVAL;
 
     /*
-     * The device may already have been registered. As there is no harm in
-     * it just return success early.
+     * This is needed in case a device has both the iommus property and
+     * also appears in the mmu-masters list.
      */
-    if ( dev_iommu_fwspec_get(dev) )
+    if ( device_is_protected(dev) )
         return 0;
 
+    if ( dev_iommu_fwspec_get(dev) )
+        return -EEXIST;
+
     /*
      * According to the Documentation/devicetree/bindings/iommu/iommu.txt
      * from Linux.
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 19a74909cece..c1e4751a581f 100644
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
 
@@ -302,16 +299,6 @@ static inline domid_t dt_device_used_by(const struct dt_device_node *device)
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


