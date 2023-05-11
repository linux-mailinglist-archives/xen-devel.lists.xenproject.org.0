Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B9C6FFA02
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 21:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533560.830344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBos-0006RC-UN; Thu, 11 May 2023 19:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533560.830344; Thu, 11 May 2023 19:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBos-0006Ot-RS; Thu, 11 May 2023 19:19:18 +0000
Received: by outflank-mailman (input) for mailman id 533560;
 Thu, 11 May 2023 19:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWxp=BA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pxBor-0005hc-Er
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 19:19:17 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e88::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b83c3e05-f030-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 21:19:16 +0200 (CEST)
Received: from DS7PR05CA0036.namprd05.prod.outlook.com (2603:10b6:8:2f::25) by
 DS0PR12MB7876.namprd12.prod.outlook.com (2603:10b6:8:148::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.18; Thu, 11 May 2023 19:19:14 +0000
Received: from DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::a1) by DS7PR05CA0036.outlook.office365.com
 (2603:10b6:8:2f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20 via Frontend
 Transport; Thu, 11 May 2023 19:19:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT101.mail.protection.outlook.com (10.13.172.208) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.22 via Frontend Transport; Thu, 11 May 2023 19:19:13 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 14:19:13 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 12:19:12 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 11 May 2023 14:19:11 -0500
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
X-Inumbo-ID: b83c3e05-f030-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHlBC3twaD0QcwAZzctAdvpgiJLTsz63RaOEVJ9msGHr8Y7j2zoLjVFuny0/5ogQz5rxJ1Q+NRSoufixqQCeNkpimpZkIgSnXM+DW6asFCLMt3NTAnSrj/zIIZzDF4SDUnnpnIQmdZhreh6fBzsq5UUaNJH+marOXj3Rh4VIPCOoaM4Er1HxwAQ4WA/mAd8e7gqWCy7igpxVN7DmiECKvErtNXC4AvuXQzOWZPDVHy31qAFbEQwbX9cg/ngqYz+6vZ9GyVd2pzE+w5CjK7moXejaEDWF6dvPNgbTDPDm47so+ox2K8d5JN3+5TDP5X6SFKK5Y5Jv9H9QAsua1ccshg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Inv85I3n2ejvqoWpRiGzQrvDhgSa+TdZRQ6ClAmebH8=;
 b=lvpyvywFyUV9sB/e1wCiHUb2rF9rs/1Dbcm/RSG+CROWgjBzD6OqdMKTbdGfwQzu63HecwTAokLVKuaNNm0+BlYsO8tniNiFiRXh5QkBWwxKY3UK0bBX5z9B2b9bzA+g3KXbsQpnOBdakYjMZF7bOVk8u/BhsgsgYYY19FVhP1j5FChuvVOKg7SwvWUFETOJC7L2xAmkLuALR10y5L/REupwNYyG/wK1rbjx/BjU8+Z+IwjCwRTN3SaSy7/NQwY+9x/cbnV6sZMZfKH4sagXUy8j5MV15h0kDnbe9Elpxrd3GVLaSIdynjDb7kq58V2YZYPNLc43WmGBh8zGYCcwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Inv85I3n2ejvqoWpRiGzQrvDhgSa+TdZRQ6ClAmebH8=;
 b=rXphUoHFH8OuKLb8YQ9JRF1clLyR1HiDbY5zUpbeYDDfkyyYPrDRtIzyUGU0APGXstcKp+GcMylqIr2q2mWjU3+o3pNH/xdOlNfC6fom4WnN4Ufuy8TrtNfKacvrCwvHeDzxPsRpwAdGvRBy2/A6AN6RXZsTVlqpD9rRD1AAKeA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v2 4/8] iommu/arm: iommu_add_dt_pci_device phantom handling
Date: Thu, 11 May 2023 15:16:50 -0400
Message-ID: <20230511191654.400720-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511191654.400720-1-stewart.hildebrand@amd.com>
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT101:EE_|DS0PR12MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e53b38-bdff-4ffc-663e-08db52549b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hN4ihwctcp6vilATTmpnC9zylTk3X/7PDQiM6B0SHx5O93vqoFB0yPa2+soU8K5kbOhorNaF6ZOPvY46X55yrlZHP8fsxlC+PidT0sUWS0pV/cuaW9doAjAP8vGo/NMOcfKKg7cA1kLEeRz9Y7mq42IJo5tEwmIKRcRljiuAq5j7og4sZ22aP83FBhUZRTOFx6Wt4TnTe5G5TCWLYaM+7FOcEQYSS2bGGHRgKF0VPcoo3ARLbOIjTJJcddeOHmLwncCcuGMOPdDdNYXZnf3fdRZDKjdJSGe6RxzDHk+NCsBgjNCE3JGFxJsO7P+XKfyIfnwSugAi2bjeXr15SynAUvCLcIb+7vEd0NJ6FBBxalmKGGuk8WAcMCAocjYAaaVWAGcCTPxD8uWxvcwkiAd0ebPYDT8gexXVhAPuyR67IVJl5DBCBwUhAvF/TeVVWdOt5krNM6PFqjZtQSdDjo6NgNj2t7PZeIpA4vwR2NoyuWLdAFDgEvu/eCF/cac4Rh5qn9GCdlBTvaKvEfDjTmzL2E9OY3xkf6BIB912ls8Ciw3Xmakb6+V8rGN+Z6h78IU6uNhmGXyPwis13LtvFTMQU8e8/Tzw6PoorUBu98Qz85u/QCOc4+ZA/5s/ReaqtkA926s/o7fLOoRmxGRhJWsFbCmdgbOtdgGW6llTcKBZHmzt1F508Ov8ZCuLjPaoMFbmOPjl92oY/yFCXLRu4AgSQulznURIpD06wrd9ZaaAHKbfOrZh0X37AODzPQeG7TAl
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199021)(36840700001)(46966006)(40470700004)(47076005)(81166007)(54906003)(40480700001)(41300700001)(316002)(83380400001)(356005)(82740400003)(1076003)(26005)(82310400005)(8936002)(336012)(426003)(70586007)(6916009)(4326008)(70206006)(36860700001)(5660300002)(8676002)(86362001)(44832011)(186003)(966005)(478600001)(36756003)(6666004)(40460700003)(2616005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 19:19:13.5900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e53b38-bdff-4ffc-663e-08db52549b27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7876

Handle phantom functions in iommu_add_dt_pci_device(). Each phantom function
will have a unique requestor ID (RID)/BDF. On ARM, we need to map/translate the
RID/BDF to an AXI stream ID for each phantom function according to the pci-iommu
device tree mapping [1]. The RID/BDF -> AXI stream ID mapping in DT could allow
phantom devices (i.e. devices with phantom functions) to use different AXI
stream IDs based on the (phantom) function.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* new patch

---
 xen/drivers/passthrough/device_tree.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 5e462e5c2ca8..ced911f4fb31 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -247,6 +247,7 @@ int iommu_add_dt_pci_device(struct pci_dev *pdev)
     struct device *dev = pci_to_dev(pdev);
     const struct dt_device_node *np;
     int rc = NO_IOMMU;
+    unsigned int devfn = pdev->devfn;
 
     if ( !iommu_enabled )
         return NO_IOMMU;
@@ -275,7 +276,7 @@ int iommu_add_dt_pci_device(struct pci_dev *pdev)
      * According to the Documentation/devicetree/bindings/pci/pci-iommu.txt
      * from Linux.
      */
-    rc = iommu_dt_pci_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
+    rc = iommu_dt_pci_map_id(np, PCI_BDF(pdev->bus, devfn), "iommu-map",
                              "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
     if ( rc )
         return rc == -ENODEV ? NO_IOMMU : rc;
@@ -286,6 +287,26 @@ int iommu_add_dt_pci_device(struct pci_dev *pdev)
         iommu_fwspec_free(pci_to_dev(pdev));
         return -EINVAL;
     }
+    for ( ; pdev->phantom_stride ; )
+    {
+        devfn += pdev->phantom_stride;
+        if ( PCI_SLOT(devfn) != PCI_SLOT(pdev->devfn) )
+            break;
+        rc = iommu_dt_pci_map_id(np, PCI_BDF(pdev->bus, devfn), "iommu-map",
+                                 "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+        if ( rc )
+        {
+            printk(XENLOG_WARNING "IOMMU: add %pp failed (%d)\n",
+                   &PCI_SBDF(pdev->seg, pdev->bus, devfn), rc);
+            return rc == -ENODEV ? NO_IOMMU : rc;
+        }
+        rc = iommu_dt_xlate(dev, &iommu_spec);
+        if ( rc < 0 )
+        {
+            iommu_fwspec_free(pci_to_dev(pdev));
+            return -EINVAL;
+        }
+    }
 
     return rc;
 }
-- 
2.40.1


