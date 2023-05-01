Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE76F38FD
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 22:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528260.821179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZkC-0005KE-I2; Mon, 01 May 2023 20:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528260.821179; Mon, 01 May 2023 20:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZkC-0005I8-Ej; Mon, 01 May 2023 20:03:32 +0000
Received: by outflank-mailman (input) for mailman id 528260;
 Mon, 01 May 2023 20:03:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwpa=AW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ptZkA-000525-Hn
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 20:03:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d35e810-e85b-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 22:03:29 +0200 (CEST)
Received: from MW4PR03CA0268.namprd03.prod.outlook.com (2603:10b6:303:b4::33)
 by PH0PR12MB5646.namprd12.prod.outlook.com (2603:10b6:510:143::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.26; Mon, 1 May
 2023 20:03:26 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b4:cafe::2) by MW4PR03CA0268.outlook.office365.com
 (2603:10b6:303:b4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Mon, 1 May 2023 20:03:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.20 via Frontend Transport; Mon, 1 May 2023 20:03:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 15:03:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 1 May
 2023 15:03:24 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 1 May 2023 15:03:23 -0500
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
X-Inumbo-ID: 3d35e810-e85b-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqZ/4rh6XbSxYd/ji14LZGcdeDQm7k1Zf5I2jMgWISTCJQ6bOv/XM8vfQah/68DnRhSTvLxCc7W3vokeXrigee51mGOsPEshKNjiwG+eAeoey/MPhBLz6ZBtqUgGBkBLvpIrnuAznADUZuIBvsZsLgCBzaetN7XN7aNi1jUzpFJ6ohzNCVegBqXs6jklO0ZtD4KiG66P03HDUGzpfsGkTW4oQ4P7xJLsEzewlmzmbLSkFLcif/QLNXW273pwYQcFC/ACw7Flxk5sQBioJ3JgfnbpZAfUulSnIsP5XQKICWp7Rm09vfmfAD20JePEEadsPUdpxNm/4Kfw4f7g6AlCUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAeerVBnHarRbBFzP8eA8mfPIPjOdFnbNXDV9Rw/NiY=;
 b=QKTFOr2+L6TT9LmB24VAx/aWHmqldaT3JSeJXYWsdZHO7R69uV27VtM2MUpQg+8eZr9yvGW2ZshF2E9SGG1VegUn/Bw4JV7FGHshBhWw71a11ts884Q1urNRq+ZMBHuXUpExRbAeLNzN6H+oJG+bK6oeNc16g+46Y0ab4Wc0WZnDLAweC2nrnLezZir7PxbAt5Coei5rwT7lqlGT3s74XN//E29UzWltuIsfw6YebLMPtknMXMkbik9lBB6P87scy9LdBYjtskVBLzjE2QtGQ/us7gb1IMsuZZ2RGioJY9kjZcNwLGpVClxAC5+3ituUgsHFZPBtTbPtKs2Zt81FBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAeerVBnHarRbBFzP8eA8mfPIPjOdFnbNXDV9Rw/NiY=;
 b=J+gcXbHaoFZ2ByEWu0VdephSDtAPkF9GFpgvRlAYX+/c1laSPCC0xs0skpQ25VZZgpZpI9BEm1AbB2XJrgfWVRQ55arblnYE/Qrqx/6JwaAP34aZDx7JtOfbqJ2QYUaeY4/wr1SQY+tGnX7Zcx1veKlHWy4GcBD/o5eiRMZLDWs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Rahul Singh <rahul.singh@arm.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v1 1/6] xen/arm: Move is_protected flag to struct device
Date: Mon, 1 May 2023 16:03:00 -0400
Message-ID: <20230501200305.168058-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501200305.168058-1-stewart.hildebrand@amd.com>
References: <20230501200305.168058-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT032:EE_|PH0PR12MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: 893b28b4-cda2-406b-784b-08db4a7f1f8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xdwpARfOl4Si5U24LX0KjYnqGjOBU6slMV5yPGtgU+00+WO8ucRcbsYJEzqWnOBWOzn2GtuwgKgqz82us3QSlrcrT7EQ68Ju2iYj427m2kVjTHekKlTDBsGb9zrRIggi3SSyCLaHYPX6O0Q4CB9xrnvIpEo4x9UI5TNyNa12bIPnknuqIiim94vREsajHTBP11NN8uHnp5YE2IZrXRajtGrrem7g9Fv6rVYKJn3aCi/Fx8tsvE29MvS/Ym07YWuWntsiuS5zkZCutGBBDzrsE4kDocgXXt2R1MR0K3dh0V3VpVDlsIV+I1fVMBtwu3B1NGDIY6GKSlk7FvynXEP+OwODXS8uaXfAlD3Rt0XQ3pFg3kma9oiNX00l1udfv0fUGgbyTlZo51Q2ZFXnEQ3Lu3eJ4Uy2LVtdTNMt87zIMuX0T+oMl+XAurCqySEJVmgH5BCld7/qB2efZiLXUEByPAXejZF9Z5cMWMeXa717K22QlFnDWY6BVVqJZsQ3aUhNtUZ4aEYw6i5sNiztEHYyS0hOl/6ZPWZN+GUbH6oePU9jxDiJVu8plJdE0DOFfl7hsQktn8wHy+LTGZeEFVqvoQkFc1B4laWI0ZOSpfe5rULMGetqeU2nblAiDBgkH6e+09/A6EJif3mxUUmOusE5NiX7y7WWCe6npL5FHO/EKrkApUNNfmGgC8f0lCzGHUqi2mQ7uReD/tHruIXmAbLDMz0Pm6SVGCBgzq4alRGjH7Y=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(70586007)(2906002)(70206006)(44832011)(2616005)(336012)(86362001)(5660300002)(82310400005)(4326008)(8936002)(40460700003)(36756003)(6666004)(41300700001)(6916009)(54906003)(478600001)(316002)(8676002)(40480700001)(356005)(26005)(81166007)(1076003)(966005)(82740400003)(47076005)(426003)(186003)(83380400001)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2023 20:03:25.2187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 893b28b4-cda2-406b-784b-08db4a7f1f8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5646

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This flag will be re-used for PCI devices by the subsequent
patches.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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


