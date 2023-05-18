Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587EB708A2B
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 23:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536559.835000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzks7-0005yD-2g; Thu, 18 May 2023 21:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536559.835000; Thu, 18 May 2023 21:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzks6-0005vJ-WD; Thu, 18 May 2023 21:09:15 +0000
Received: by outflank-mailman (input) for mailman id 536559;
 Thu, 18 May 2023 21:09:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yK0N=BH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pzks5-0003gZ-8d
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 21:09:13 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b716a8e-f5c0-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 23:09:11 +0200 (CEST)
Received: from DS7PR03CA0097.namprd03.prod.outlook.com (2603:10b6:5:3b7::12)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Thu, 18 May
 2023 21:09:03 +0000
Received: from DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::4e) by DS7PR03CA0097.outlook.office365.com
 (2603:10b6:5:3b7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 21:09:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT055.mail.protection.outlook.com (10.13.173.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.21 via Frontend Transport; Thu, 18 May 2023 21:09:03 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 16:09:02 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 May 2023 16:09:01 -0500
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
X-Inumbo-ID: 3b716a8e-f5c0-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUqtsNWKjzke+85coSzJ7VAQldY8bQL5RXLADsy0VRONFXm2cME3ji5kBBpdJPwQVJR5XSz8gkB15vsL5hzJkBEK+Qk0zyJRhYNJH1yIsjqohmWRPmBgxtShin2YQoXYjhgHwkzrskVMoFQ2L28NNnllWeikDOzZyYxLhaBncV3XsN/QwXIy5E7xiq/MIB23Jo29A6BZq541NItZVdFAgsAU1eKncvflEaRDYAO2mX2xVt49S32I9wVbw3Axsvc3gGfxgh8QkPa7fbW+QwFQkvZ1NgdN+cjF6nsZxk2zXvVaFouo8BkrBNcrNP4pY3kz4LbYeSFZb3CaJzJsRsAX/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxTD/B2LQB1Jv047UjgOqA+QiFcS4OIKP4Cx/fTEEkk=;
 b=SPbyHzZ81QzXgSSXTN7atwxTEtmDckKn9QOLSx1zAOTy4yzTwG2ZBBlaze7PuwQe3UVX2SK7r7PP1PxiK+8itUY66XADRoY0X5IRr4DpvTlj9Xi4vzvif8Bi520T5hRPJe+bsw0OgWm59CjOyK9WgcYV3B0scQUw9b2wivGD1AWq5eGqr+FMJJcL4V2XV42f4XjbSFicjWHZ6bEcZtnTy6xZdDg7XwpGf9vlAUWdPk6Zl/tcwd/zwlCL852fyhyZrfaVwG9Y3hMfmp3zwZeSZ03Kqj+yaJAaLoVL1C4rPiFjRFm5st7ph0V2bIEhiYWeQCgqO8W/1UVJNcI16txUsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxTD/B2LQB1Jv047UjgOqA+QiFcS4OIKP4Cx/fTEEkk=;
 b=kFOVTD5IAn72oyfE6DV51rj2DRsq5Hp3w8p3ytZqEGHCk4ICOSqlJB1H3OBCvd8QOiRR2FcMTjTOc1LCw0JR33llJnHPkXWqrcqIUtvoWe72ZU5QfTak6g8VUrBnkmtUB60QxHHzeixrUA4qJlqcEszwMkZTNxBls0DNXYv1SKA=
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
Subject: [PATCH v3 4/6] iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling
Date: Thu, 18 May 2023 17:06:56 -0400
Message-ID: <20230518210658.66156-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230518210658.66156-1-stewart.hildebrand@amd.com>
References: <20230518210658.66156-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT055:EE_|SJ0PR12MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: f698b08a-9328-4df4-aa27-08db57e41bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dd6XR/njwJuEOsighaKQGU0olMfUNbREGRa0WoDP0rVTPmXdRG4yhBPW8q+07gIVLTF5HkcYVsevVgHQO1zikP13N7QoWShXR+HUDzGOyPeziKqjOMFoxMCB64RzMHtNRhxIpJAUzVtDHfC9E/Q/AbGRXh9DeoaG86o1fGI2jxv9dQJ+7ZEknu8gxBpU19WiASBa2mcwLn2RDtIhJBYQj4UqHSy3YOaE7qgq9eBb/GziJ/03jMx3Gh41JctGuSGP0TxXjk70B8+vGQzu8mSrO6bFDEXMOn0O0EIi19YF5JhvCopNbObsnhm/bLUJleS/Sg7Q6g+uOCc9Alzmzli/m1Whobf8zf6M4p9F8aXIKxr9f6tfvhRChcZBi6L+COnHkYzxIKxt8qz+CGPdV505Ng6kE+Tdh96PN1piZ9U+F75y7fgdURr3QeH9i3AsK5hrYkymbSanyCaBq4KaLxoWX3ywSwFFzdWF4GkAldppsnPPq3d7wCUoUQ9VKhI9mwMxUaCvLSYkCA4cEFo+EsxLhlbksM3ZAMd0vEKzvyO9g6NP0bys2jZY9Kr6wc16Q4RDvWhIm7D9cmgIiEHMOaZ4Zwa57AqDZeFn8u78sI7VQ5OSy3Thoh+GLL2Go51ar9K15kJalL4I0GPXtOKOfnR9Nlk3tWxdFHskPwu1PTVqOo+dwtTTggI28Xv67BCarXosuSZyK05QJb+rn5dxqk1LZBeCqAuJ+D4/mWPpXzf7wAJpGWPkzYMiGEhs0zCVfDTAMRe6VqPKNKdu2HeUKsRPbg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(70586007)(4326008)(86362001)(6916009)(478600001)(70206006)(966005)(54906003)(316002)(36756003)(83380400001)(36860700001)(26005)(1076003)(336012)(186003)(47076005)(426003)(2616005)(2906002)(44832011)(8676002)(8936002)(40480700001)(41300700001)(356005)(82310400005)(5660300002)(82740400003)(81166007)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 21:09:03.2112
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f698b08a-9328-4df4-aa27-08db57e41bc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT055.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613

Handle phantom functions in iommu_add_dt_pci_sideband_ids(). Each phantom
function will have a unique requestor ID (RID)/BDF. On ARM, we need to
map/translate the RID/BDF to an AXI stream ID for each phantom function
according to the pci-iommu device tree mapping [1]. The RID/BDF -> AXI stream ID
mapping in DT could allow phantom devices (i.e. devices with phantom functions)
to use different AXI stream IDs based on the (phantom) function.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
index d568166e19ec..c18ddae3e993 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -247,6 +247,7 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
     struct device *dev = pci_to_dev(pdev);
     const struct dt_device_node *np;
     int rc = NO_IOMMU;
+    unsigned int devfn = pdev->devfn;
 
     if ( !iommu_enabled )
         return NO_IOMMU;
@@ -271,21 +272,27 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
     if ( !ops->dt_xlate )
         return -EINVAL;
 
-    /*
-     * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
-     * from Linux.
-     */
-    rc = iommu_dt_pci_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
-                             "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
-    if ( rc )
-        return rc == -ENODEV ? NO_IOMMU : rc;
+    do {
+        /*
+         * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
+         * from Linux.
+         */
+        rc = iommu_dt_pci_map_id(np, PCI_BDF(pdev->bus, devfn), "iommu-map",
+                                 "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+        if ( rc )
+            return rc == -ENODEV ? NO_IOMMU : rc;
 
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
+    while ( devfn != pdev->devfn &&
+            PCI_SLOT(devfn) == PCI_SLOT(pdev->devfn));
 
     return rc;
 }
-- 
2.40.1


