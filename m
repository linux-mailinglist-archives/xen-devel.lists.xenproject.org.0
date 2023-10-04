Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 464497B82E5
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 16:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612636.952657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3J7-0003un-JQ; Wed, 04 Oct 2023 14:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612636.952657; Wed, 04 Oct 2023 14:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3J7-0003rr-EW; Wed, 04 Oct 2023 14:57:01 +0000
Received: by outflank-mailman (input) for mailman id 612636;
 Wed, 04 Oct 2023 14:56:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSqs=FS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qo3J5-0003AF-Rh
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 14:56:59 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e83::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4394965a-62c6-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 16:56:58 +0200 (CEST)
Received: from MN2PR06CA0002.namprd06.prod.outlook.com (2603:10b6:208:23d::7)
 by DS0PR12MB8294.namprd12.prod.outlook.com (2603:10b6:8:f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 14:56:54 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::b0) by MN2PR06CA0002.outlook.office365.com
 (2603:10b6:208:23d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33 via Frontend
 Transport; Wed, 4 Oct 2023 14:56:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 14:56:54 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:56:53 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 07:56:53 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 4 Oct 2023 09:56:51 -0500
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
X-Inumbo-ID: 4394965a-62c6-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naSRlI8kcw+3aF7Y/yyjLuRIW9bOwT1GsFzAeKAAFEIoqS9337dlv7ZM8NbSHIwgX/YagHwLgXDqb9WWQi200Bb/GcjXB9a2Gb2V4WOHHSG/WFVfpDoVzsKvmDrZCUJswWmtkGpj6rsGLAtxKCX9oU55IDynAAlmUofwcuJzS50Z3mJFmpj5VzRHdoIzadCc5j2TnKVIh78hjut/DOOf3sSv+E7XpjyaH/IhgiDZ63RVO403+Jrpf9o5M48GGZD1uFulF00RAOEQl0C92vQrJMIhOI4zQRurT/o0S3P2mGkxDxhDpGa+Jf1g6zUd+1DLlpfHam6hieViRxT7lqoNzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iix2FgbkT3KfjbRn4i5V3Rtok8/gDyxhpUXUJyi77I=;
 b=B3E0cqNDFrW26wxfcUebivozRFQlH9ZmHrYkLWg6kqykstTv9FSN0k90jQE7EApGBFUhYMmYil8HYjnH+3th7iy/Z/6Pi9069a9sykJoTXMC1tfgwxdh/slog3HZeHl9WVzdtjuzNTlzgNzotKzJtdW069L3rzgwxhC9VSYoAhwXXDNUzeeV/raJvTZGqgkY8/0CglfX2CI1HfXdRg2V23yN0/ovLLjtXCYAQLY+p2vpWEdHgf4+fZccKDa9oTiseVUZSEsSXfZa70ToeY8B2B8FZOmu7IZMVPcbjiHojeCChwT83JrTdKxEIn9k+VvYVm5dp6r7F00awyXo54CkIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iix2FgbkT3KfjbRn4i5V3Rtok8/gDyxhpUXUJyi77I=;
 b=dNCDLCow6+zNB8LiqyR7atxFJ63m4NsVAXPwI7l+lxWc5vBHA2NuyOcD0As4TEPXU0DCGAmjjEVbQga0hEI/4UAJa3kPMVR6l4LcQYnRI91Amd2veS1si08eHNNId/CGwkSsEfB9lvTq5d3KLBuHUtze5cqDYnPO4Z3giMDtHtc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>, "Jan
 Beulich" <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>
Subject: [PATCH v5 2/9] iommu/arm: Add iommu_dt_xlate()
Date: Wed, 4 Oct 2023 10:55:46 -0400
Message-ID: <20231004145604.1085358-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|DS0PR12MB8294:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e3e7ed-a3e6-4523-e548-08dbc4ea262e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pv22Mwz8hDC1+jYYKgrEVTDLp47OtNssTt76fqNfBuIJij5ckb59EbvNY1okfDnkLNMl+8lvhDOO1O29fUuIGOcotuYZEAU/AwVmXTMc2p3M49c62LFSo/UHG6LiPouMcdbe0GAtGHetDb8cKnh3gp7iiKmNBllIVFt+m2+4r19rRz8fhLaYdUJbMAahARc2f0cs08m7ZzgjGBNo/+oyqhJamDqflEgzMFMo3e+QFyZuqnjXb10o1IofGfxyPCln1hquihXgjbi5uIDyOoruitgW6cFTehoOg5gRzuxiLQHCM3fhXD4JZrBMNg+1ceABGn2WxBerT9lyQR9J7Rb8C4/ZEb/mO9CLH1bpnqMpI2GZO++SvRAxXFaGfjUocaQbvzB4FfmUm8jGj2kQycmXnrUM4DhBq7AAFjt4sgMcAJo6Z2ehHRluHEo+vC3Puv247axRiksCwCusStZsFbJJYs9WmKUWkbFEjXvmtn7URYUWy3ebm6zTz/bW/aaWR48IMWSHWSFz2wiyFQw97hGdQmctGYegTKZgshtG10UeWJi3GtBaGchBn28+3ALV0GZ7uM3YTVFWcqax2zQ+AGbDbGFxxPQH8tMDvVvtnIWJs5+A6D7bN8jdQHkgjju7mMMseICFQ7y5swCN055pWLJdewzt7MrphD3Vu/pPShjoibXtL5z+GDcKPNB84Kup3tJem7xLbLII7ROHq1R/H3KGtVaJriFWL6qTPFPbRp3AotYbxpfibygZiFALv70YrF9d
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(1800799009)(186009)(82310400011)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(83380400001)(336012)(426003)(36860700001)(40480700001)(70586007)(5660300002)(86362001)(47076005)(82740400003)(81166007)(26005)(2616005)(356005)(70206006)(2906002)(1076003)(6666004)(966005)(478600001)(40460700003)(36756003)(44832011)(8936002)(4326008)(54906003)(316002)(6916009)(41300700001)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:56:54.4587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e3e7ed-a3e6-4523-e548-08dbc4ea262e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8294

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Move code for processing DT IOMMU specifier to a separate helper.
This helper will be re-used for adding PCI devices by the subsequent
patches as we will need exact the same actions for processing
DT PCI-IOMMU specifier.

While at it introduce NO_IOMMU to avoid magic "1".

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
index 075fb25a3706..159ace9856c9 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -137,6 +137,30 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+static int iommu_dt_xlate(struct device *dev,
+                          const struct dt_phandle_args *iommu_spec)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
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
+        rc = iommu_dt_xlate(dev, &iommu_spec);
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


