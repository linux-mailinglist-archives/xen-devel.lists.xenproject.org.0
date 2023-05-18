Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E20708A1E
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 23:08:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536546.834971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkqu-0004HY-26; Thu, 18 May 2023 21:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536546.834971; Thu, 18 May 2023 21:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzkqt-0004Fq-VJ; Thu, 18 May 2023 21:07:59 +0000
Received: by outflank-mailman (input) for mailman id 536546;
 Thu, 18 May 2023 21:07:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yK0N=BH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pzkqs-000492-N3
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 21:07:58 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f9b8c6b-f5c0-11ed-b22d-6b7b168915f2;
 Thu, 18 May 2023 23:07:57 +0200 (CEST)
Received: from BN9PR03CA0354.namprd03.prod.outlook.com (2603:10b6:408:f6::29)
 by SA1PR12MB8743.namprd12.prod.outlook.com (2603:10b6:806:37c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 21:07:54 +0000
Received: from BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::b1) by BN9PR03CA0354.outlook.office365.com
 (2603:10b6:408:f6::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 21:07:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT095.mail.protection.outlook.com (10.13.176.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Thu, 18 May 2023 21:07:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 16:07:52 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 May 2023 16:07:51 -0500
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
X-Inumbo-ID: 0f9b8c6b-f5c0-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZFTvqMGLiUa0SNDbBsOTvgT24ezFIHYn+7uMswT82PcUbZYQoa+so7RnvgF9QvGpt2A2Xq4jRmBOEOpWCDPv2vGaMcGQfRPVn1oG2yHTtkjRtUIo++lImM8kk3tLIl2ySOw/yCDBMrGJ2R2waQdDELaO0TWMyEC2zuGVuqIv4kTd2JzvvJxDOev1QfhXGqsLuhoOLsrw5GUTk8s2++OBMmeZFptXGR5tQqhdMFvGhnvr1VKF6pnh7P3XfhcqQT9KV8wQigprzyb958O2QpDLeePvPLZ91QP4mdKO6Yxv3EUO5wgJOgBtkQDiJY+OClcoECMjh/S/0eYwNmhuOvqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6nCWAuU2fluFwlRvvsBvDibEl+2/q0dSI5mIxYKxGc=;
 b=ofIuCBFP2QblcQgRv2d9MK0AzOK383AgNbzCu8lyltTrS6pauMKu4nuJIp00m4byNSyfRbyXcaIRpceDAu2kBthvpC5tAAs3MI971JEi1+YZlB/qU6f588EJ7BWtz01/IyIk4CrWzSYltYsBKmnuopKopaEnopPPbq9c2LUvzNNGdFCfqG1wXfmkmnjWZ1jgZwIpkdCQzRznj+WYpaCG06CYBtGP8HMqQ0apoJhkfGwwACCdMCFta+i5fPSNlfCHQeOK7KT6nfg8TyWIM4Rmnzda+2PPDKa62srniKH5QR9iL9UshziYCuFiSHBptn//EMc97OW2w+W7LveJMc1aGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6nCWAuU2fluFwlRvvsBvDibEl+2/q0dSI5mIxYKxGc=;
 b=vKxR2djAdcz0aPsRUZ9jETGOvhQ4zIRbxCRHuSSx8XLOqbBvJOueJPyZ/ysIu5oCGYxCvPdJCCT59ATkN9EMHtaVfrFq811r7/CXYxLXNSKcqK6sTUPQkRGMrHBUGjf0UpGHqnA/xD+GqFFlr+6g0sb4itMa3QO7CzYCMmSQ8+U=
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
Subject: [PATCH v3 1/6] xen/arm: Move is_protected flag to struct device
Date: Thu, 18 May 2023 17:06:53 -0400
Message-ID: <20230518210658.66156-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518210658.66156-1-stewart.hildebrand@amd.com>
References: <20230518210658.66156-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT095:EE_|SA1PR12MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 38bc38c3-3bf3-4b36-7e9c-08db57e3f248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EkDFRbWlqmjXIt/yl+oExgRHuLcT6hA7yHEprxyGyPJTxgRBQyQoD9w6jhMRKku4Fx+ePAWjlqmKe4QAq/2ZClUq6i1Za93jO7cuP66rVAWrI+YYTK6hXNsowpU6it6Ufhvuyys0b5EMBhnaZB9Ln9PZdtRyx4V5grY+fwe5xhu2lG/8mRo3M9i8gYz11b6kwlvGs+e+4/Nsxhvf6v7r0y23DtsbxDu6R4VLvO9mfwHaSM9Zapb9mG7ujJdkQQepM9aji9lJdSvNwLVt2J/OBv2/ds16Oh/cFsxrpNkdiGGD6HP59skBl5n9vJ59x2kC18bAlxwW7S5bcm3r3ItldFMHPvZEtvi8feas38AXnvhOxj6Jaj3gSFGlejW6/HyEcxSqzNXPvUKfrSM3fOEosX2hstauqAaZCoKcyx7xRGa8ilW+DNV+AJfttTKxearHATFz1HWbV53mNiXpja9Hrzfo7n+TlVHO8QYO2tAXtsR3aTNVGhDb1OKO43Zp8gO/vGzkvyQXcLG8NbRza0FC4qVM3PjheMo867PI9VFlt514VG7U3L98wwGT0bs3v9z5NMZdQUmF2EB1mkxse3cgHzv4vSRJiquyoVfPpmiUhkHRePTLgyv0bJb7eoKg6cVYMrVapGJl7co+cWJWtiYf4CAqMoPkZrLAhlCMQwauKgdvDbl/RA1/hO2yVYvt9JLgP+2ho8n4o0Fyx9mMcQ5PxAaZiWYWIlZ42sLxAwIWXUDiLuOGD34nVlJsM17VTHgM
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(46966006)(36840700001)(40470700004)(26005)(40460700003)(1076003)(966005)(36860700001)(36756003)(426003)(83380400001)(47076005)(40480700001)(336012)(86362001)(82310400005)(2616005)(356005)(81166007)(186003)(82740400003)(54906003)(44832011)(5660300002)(478600001)(2906002)(316002)(6916009)(4326008)(8676002)(8936002)(41300700001)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 21:07:53.6618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38bc38c3-3bf3-4b36-7e9c-08db57e3f248
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8743

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This flag will be re-used for PCI devices by the subsequent
patches.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
 xen/arch/arm/include/asm/device.h        | 13 +++++++++++++
 xen/common/device_tree.c                 |  2 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c |  8 +-------
 xen/drivers/passthrough/arm/smmu-v3.c    |  7 +------
 xen/drivers/passthrough/arm/smmu.c       |  2 +-
 xen/drivers/passthrough/device_tree.c    | 15 +++++++++------
 xen/include/xen/device_tree.h            | 13 -------------
 8 files changed, 28 insertions(+), 36 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 71f307a572e9..d228da641367 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2503,7 +2503,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
             return res;
         }
 
-        if ( dt_device_is_protected(dev) )
+        if ( device_is_protected(dt_to_dev(dev)) )
         {
             dt_dprintk("%s setup iommu\n", dt_node_full_name(dev));
             res = iommu_assign_dt_device(d, dev);
@@ -3003,7 +3003,7 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
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
index 4ca55d400a7b..f5910e79922f 100644
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


