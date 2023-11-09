Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5237E7184
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 19:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629776.982236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19mE-0001wZ-Gz; Thu, 09 Nov 2023 18:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629776.982236; Thu, 09 Nov 2023 18:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19mE-0001sU-Cx; Thu, 09 Nov 2023 18:29:14 +0000
Received: by outflank-mailman (input) for mailman id 629776;
 Thu, 09 Nov 2023 18:29:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS/w=GW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r19mD-00005n-9x
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 18:29:13 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e03c7693-7f2d-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 19:29:11 +0100 (CET)
Received: from SN7PR04CA0038.namprd04.prod.outlook.com (2603:10b6:806:120::13)
 by SA1PR12MB7104.namprd12.prod.outlook.com (2603:10b6:806:29e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 18:29:08 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:120:cafe::eb) by SN7PR04CA0038.outlook.office365.com
 (2603:10b6:806:120::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 18:29:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Thu, 9 Nov 2023 18:29:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:29:07 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 9 Nov 2023 12:29:04 -0600
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
X-Inumbo-ID: e03c7693-7f2d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtzA/zb4coYdiJ0Yrq//nICUzwvnuw1VCAfqHrAfP/9lwApjgI1xra0KsbJVceCZ+N9P3S4ryO4VpnDRvwVcLUSQha21rVH/tWdeRTcIlLc45S3y2gawzjYbk94/fx35+DqL8eaxwcY/cTrUdsM3UGmKJLnACE/1Ueafm/77S9CZluRwcmSbDIrKJnRXwNng0IH9ihhpTrUjEmKVswGpvVyxZo6uxs0GnA24+SfrRQka5PEthU292KdKVCh5jbyDzW4Vaw0ZIpT70YFBVA+XDHB/Kvprs0dlg6LJwfNMhwkt/VxlbJMP3BG9q/pER/FP8M2MkTelSXa1plgq/31QpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCI3zKVr7iyG4SU198T4G2hXPsqaVClUex95SCcTuQs=;
 b=C83kW4MRE0sYtFO/lQAuUEa6z4czn5AhDINOlvVowkYoThzCRcZrcc8nnJesJf+kMRjbCDAxRC53woSV19rkOcQMhH3GGwUczNycHja9Yuqo8KDZRHvHws47HV/OTgcrb+SFtKB+o4JHmZbUUcNYi/08Rc+jkcHQWPSPZAY4f+hnjjYcBEC01Cobd4BNjvnTVTsHMjUp/M2xTiH6H6tf24tKlYdcAkMsj7mcR8TE3u+nft1BeJRVlz8lBJrgYbEW38cDslImWEKLSJZuYRUSzJEB6qvy0I139a8Bx+xPqNu7QAA63QmMqJV6d2NrmXvNNkEAJd25cQuIowXK04tnMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCI3zKVr7iyG4SU198T4G2hXPsqaVClUex95SCcTuQs=;
 b=T0GUNhdXO4bkXBSMjZv7klseogBagYVQ09Iwz0fV4vE3EU/i4e8zVItJ1dI80ByVK6sUvaBY91BppqQsGftwzXPHZhKOIAS5BYqOYqrPMTSFeBfWR2r0XfBEQVeZvnrwz5OKDbYdQn/bmzl8eQYCAytzKMFnH3GfRtD/rWw7DsI=
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
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v6 4/9] iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling
Date: Thu, 9 Nov 2023 13:27:07 -0500
Message-ID: <20231109182716.367119-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109182716.367119-1-stewart.hildebrand@amd.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|SA1PR12MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: cf97dd45-08d0-4d91-0e62-08dbe151c2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PCXEJo7IE89J/BshUdmZd1hL5ykGapnpFl/nD9OWIu4OGKpeMKcgXMBI4WGHdUAROFqSMiOfR2gdxBkcwftumXGJ/6cIfmayhTL7iPhSySWKLg5rZCmY5cNyQ2in46mGQKu1RSXfqcPB0DvopoLwLRJ8iFFeDY+6MydFxD6yrTbIMq8/3kqQ/lDstg9CJkDVSWMpAN9oYg28c9eGq+YSMUcbqSK4zEBq/nsrMncTVqasWPkSum6cx6Gh+l4BgvNmfnUsL1pfTkJltFJ80n0wDvpxAM109uk2tlyjftIpdpWNnzCzJ1A3re2haLDlmJYprjoiWObRMQM+YzJIBMR9gKEqYCcopLhVeR6jdTsBLKmo3+pcXZ8v3XHTzliogD8Hqc5aB7MCAF5TAbfQBD0b9vPv+SvslteIVvpkU9w5UuoPP0tMUfPfIsWwPAgdI9c1YXl9TUdnemMiB7w/6OKBJdvmyi58HR/42C7PJp6zjYTiseLwTen90n5hufGrfJai2Xj8El1qKKcM9pTHZsvPsT964ytsG7cx4d/qzg2znEo7ScXmkZyR15GIeYf02gLm/HsUaDlX3Lpno5sYPK2d4OwQVmfVVBCft95bdJebwHh4YTktR3Ir79+io6pKnQWuW0edeguHza83A8k+z3ZsJRQMzw6QUg409lLtkU557bFg30DoNahP6DN4M3jRAGCSwNZFcDUR87i5F7gGb4SrXFHvv7UPbpjZCeSGdslT0T960iScWjrtGpaDp8jhw1jxMoKJ4GDYovpwGr0m/Tv6wg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(1800799009)(82310400011)(186009)(64100799003)(451199024)(40470700004)(46966006)(36840700001)(47076005)(44832011)(41300700001)(2616005)(478600001)(966005)(8676002)(26005)(336012)(4326008)(316002)(8936002)(5660300002)(83380400001)(36860700001)(70586007)(54906003)(70206006)(1076003)(6916009)(356005)(426003)(81166007)(2906002)(86362001)(82740400003)(40480700001)(36756003)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:29:08.0365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf97dd45-08d0-4d91-0e62-08dbe151c2de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7104

Handle phantom functions in iommu_add_dt_pci_sideband_ids(). Each phantom
function will have a unique requestor ID (RID)/BDF. On ARM, we need to
map/translate the RID/BDF to an AXI stream ID for each phantom function
according to the pci-iommu device tree mapping [1]. The RID/BDF -> AXI stream ID
mapping in DT could allow phantom devices (i.e. devices with phantom functions)
to use different AXI stream IDs based on the (phantom) function.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v5->v6:
* no change

v4->v5:
* no change

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
index edbd3f17adc5..eba1a5bac70a 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -169,6 +169,7 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
     struct device *dev = pci_to_dev(pdev);
     const struct dt_device_node *np;
     int rc;
+    unsigned int devfn = pdev->devfn;
 
     if ( !iommu_enabled )
         return NO_IOMMU;
@@ -183,21 +184,27 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
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
 
-    rc = iommu_dt_xlate(dev, &iommu_spec, ops);
-    if ( rc < 0 )
-    {
-        iommu_fwspec_free(dev);
-        return -EINVAL;
+        rc = iommu_dt_xlate(dev, &iommu_spec, ops);
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
2.42.0


