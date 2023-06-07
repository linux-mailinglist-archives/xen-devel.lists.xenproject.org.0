Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203AC72524F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 05:07:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544313.850013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jWK-0004pl-Do; Wed, 07 Jun 2023 03:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544313.850013; Wed, 07 Jun 2023 03:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6jWK-0004n6-An; Wed, 07 Jun 2023 03:07:36 +0000
Received: by outflank-mailman (input) for mailman id 544313;
 Wed, 07 Jun 2023 03:07:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rfoE=B3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q6jWI-0004mr-V1
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 03:07:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71f46c71-04e0-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 05:07:33 +0200 (CEST)
Received: from BYAPR07CA0022.namprd07.prod.outlook.com (2603:10b6:a02:bc::35)
 by SJ0PR12MB5421.namprd12.prod.outlook.com (2603:10b6:a03:3bb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 03:07:30 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:a02:bc:cafe::89) by BYAPR07CA0022.outlook.office365.com
 (2603:10b6:a02:bc::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 03:07:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Wed, 7 Jun 2023 03:07:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 22:07:20 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 22:07:19 -0500
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
X-Inumbo-ID: 71f46c71-04e0-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fdf+zUekkZmRelrKbPqGS3pksN9fYa+PebeE8IB2GxW0UofxcWx8bNFyPod3wvwd04fI3JKjsHb8fEUTY0+A14qfT15NbfevHrYFWg03MXQjUFaO4zllPfppiSAurCeYI3ddel2lWC6pVAvT4XT10YG+xXjFqNNerywqeVNen8MAXPdhDQypSuH6cTQog0gbqyfKhkneSZCDWQIdwltlgB6IvT56IgHx+hsktDAMN2VCNTB3u4mRi+kxSQlCO5Yj9W4c24l+IscUFEz7xruELJ6EBsaDAsmlmDZUpRzULie3IxM3srR+0f8ew2RBQOeVZ1KX7bAwMdxeUBxj92FJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDZk7iF4AhnQAMe+ofo4jPmpjRfddhm3KfqYwi15ldw=;
 b=akKi5u0L1ZBcJh/ECRWclCyrZmYAx21f6ircuReLgd9fNt03Rjz/F0j533rpACp8N/k9PfRcXXXZzx00z/WGEyCp1JWfKWQYoUwwTD8qJ5PEJhhL4BLWGHADiDwthl+p3gX0qr8qusK5lw8qrsWMPKEz0m6PJAifCm6L2i8CQy7+vJ2ErKzpveA4fadR3E303bdptAHTSJN3anjXRRuUxy7mvHLDzYsG6R4McV5NWNu8/MuR0b41rPYnwPD8gCuj2hZbARd/a4jR+77Gpl0irHnW596yQyudPmYY9L/+JALqhsxduESHXcAQwO4YOPGFOj0PLAIrEkafOacbR1/XXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDZk7iF4AhnQAMe+ofo4jPmpjRfddhm3KfqYwi15ldw=;
 b=cUBmYc05PXU/vL32juDZiTWvhlIzEoDVz3wVMPyQ6XtK7vt3wN/MqBlbzpqeSd8+7nNahzNVW94+P93SNdZrPNWKtODoLavysQ8AAAax00QesFIPUDkF8baJvOzpLl6VhL5/6qonCHIa/d3iL3PC81LnXFlDW/rQwDtj0P1LJVs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>, "Jan
 Beulich" <jbeulich@suse.com>
Subject: [PATCH v4 5/7] iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling
Date: Tue, 6 Jun 2023 23:02:18 -0400
Message-ID: <20230607030220.22698-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607030220.22698-1-stewart.hildebrand@amd.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|SJ0PR12MB5421:EE_
X-MS-Office365-Filtering-Correlation-Id: ed1fadd7-69b4-44ef-2c03-08db6704540b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mc0mavjz+MTVAOWtsyJ+3KcXmZ/R5RF2rrtkjjHjftJcFP8BLxEYaj6VPVMp0ijrRAXHGaO7WccgwmdVCJjUsW8hPquZKRvOb0TRwZOUF/7LBOUEvrGvTFmExCHzpz4e+KQNdmZTV4xH3mDBMAmd8ZmxkHdUor4kkM7dmdEf33I0JnQpEHutfcofJeYcV3lHXbGA0yRUtPKJ3CUdS1mprNgU6/64pbKMLFzdmwQfxA5cNoHyDmpN+vqEKWolcs8NF9GR768G26kXcnwVwcALWlDhkS/WHGWvzwimERHC+wdEb8nUvI2NPNIuD4iTfdcPJ9jL1AZ4qY4YNV0AvKSv+XRMc1fCL7BO3FARmL72egQ4Nu1aLAPWmBy43dHQ3FZDbeoAdvim1C0yz5XtQqjUhMeO3KCPGcnXv1tkJ5fGAGwMuuC2Z2nbqOtqrKU9RJ7r4l2n/fywGGAiVqOmcx9gP5LT6KDT7JqxyG3ymf0hVi51Xx8h5x8ImcwNKs95BmphRyk7GUgFqr/g8deox02aNDbnS1PGaCKFouEcApNaN/47wB40arjCAlr5dbH4jPqGHSr8xkM65WgyKRSjL07NO/Oq6jo60hNxTtIs1VH1GZ2HZug5PFbPhxyPH4Lx9kdsT38y1F4GVfvNIZbnTFib/XRQPjB7hHOvwsgNt19zHxHOGOpVx3LgMg1MWYSsuHkCpRDih3KWWRb4WtcFuKVZc0sMEczi5JYO2FU8V1B5hXJoVCBROgJWu4b/yHbL7mI/ZzlTwg7w8pC/JcRLIHCaQA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199021)(36840700001)(46966006)(40470700004)(54906003)(40460700003)(478600001)(40480700001)(8936002)(5660300002)(44832011)(8676002)(36756003)(86362001)(2906002)(70206006)(6916009)(81166007)(82740400003)(70586007)(316002)(82310400005)(356005)(4326008)(41300700001)(2616005)(1076003)(36860700001)(47076005)(26005)(966005)(83380400001)(186003)(336012)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 03:07:28.9043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1fadd7-69b4-44ef-2c03-08db6704540b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5421

Handle phantom functions in iommu_add_dt_pci_sideband_ids(). Each phantom
function will have a unique requestor ID (RID)/BDF. On ARM, we need to
map/translate the RID/BDF to an AXI stream ID for each phantom function
according to the pci-iommu device tree mapping [1]. The RID/BDF -> AXI stream ID
mapping in DT could allow phantom devices (i.e. devices with phantom functions)
to use different AXI stream IDs based on the (phantom) function.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* s/iommu_dt_pci_map_id/dt_map_id/

v2->v3:
* new patch title (was: iommu/arm: iommu_add_dt_pci_device phantom handling)
* rework loop to reduce duplication
* s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/

v1->v2:
* new patch
---
 xen/drivers/passthrough/device_tree.c | 33 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index bd0aed5df651..b7de0175ec7e 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -251,6 +251,7 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
     struct device *dev = pci_to_dev(pdev);
     const struct dt_device_node *np;
     int rc = NO_IOMMU;
+    unsigned int devfn = pdev->devfn;
 
     if ( !iommu_enabled )
         return NO_IOMMU;
@@ -268,21 +269,27 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
     if ( !np )
         return -ENODEV;
 
-    /*
-     * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
-     * from Linux.
-     */
-    rc = dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
-                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
-    if ( rc )
-        return (rc == -ENODEV) ? NO_IOMMU : rc;
+    do {
+        /*
+         * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
+         * from Linux.
+         */
+        rc = dt_map_id(np, PCI_BDF(pdev->bus, devfn), "iommu-map",
+                       "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+        if ( rc )
+            return (rc == -ENODEV) ? NO_IOMMU : rc;
 
-    rc = iommu_dt_xlate(dev, &iommu_spec);
-    if ( rc < 0 )
-    {
-        iommu_fwspec_free(dev);
-        return -EINVAL;
+        rc = iommu_dt_xlate(dev, &iommu_spec);
+        if ( rc < 0 )
+        {
+            iommu_fwspec_free(dev);
+            return -EINVAL;
+        }
+
+        devfn += pdev->phantom_stride;
     }
+    while ( (devfn != pdev->devfn) &&
+            (PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn)) );
 
     return rc;
 }
-- 
2.40.1


