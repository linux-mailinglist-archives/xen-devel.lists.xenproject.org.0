Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD91E7B8305
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 16:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612647.952677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3Jb-00054P-BC; Wed, 04 Oct 2023 14:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612647.952677; Wed, 04 Oct 2023 14:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3Jb-000521-7G; Wed, 04 Oct 2023 14:57:31 +0000
Received: by outflank-mailman (input) for mailman id 612647;
 Wed, 04 Oct 2023 14:57:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSqs=FS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qo3JZ-0003AF-M7
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 14:57:29 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5562efc1-62c6-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 16:57:28 +0200 (CEST)
Received: from BL1PR13CA0272.namprd13.prod.outlook.com (2603:10b6:208:2bc::7)
 by SN7PR12MB7177.namprd12.prod.outlook.com (2603:10b6:806:2a5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Wed, 4 Oct
 2023 14:57:24 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:2bc:cafe::be) by BL1PR13CA0272.outlook.office365.com
 (2603:10b6:208:2bc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Wed, 4 Oct 2023 14:57:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 14:57:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:57:23 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 4 Oct 2023 09:57:22 -0500
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
X-Inumbo-ID: 5562efc1-62c6-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUZJpkHYICEtbMls9WotbUD8YSigRXKZ9s23ouNo2v9T3O2QzCxoP1zgv4yyODrql3m0ZrL3LEYyC1syeJVj8f5U5+BkE1U1V0Wx9wqVb2yUSPybMzVDZd0IAiqU8lmrVF+qtAs9xuLkOlvMbRw9mLd6v4OPb7AoJ9BpClSu1rp+zbj5F9eOjFOjJ7tE0C7zdaLxV3+78bhRAI5pdMbvROIKVVGpvJq5hlkNaxF3Eeb1avAxo+nmdhF96sgEX8Aeeyz4K9qEmIWZi07WN81h4D+QNAJWO8q9/zymgIJgDhywKCcGfzQVuoeT/XxdEoZhYLcNwkYFQPX8VF1LIkBmcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMGfhRMidI5Q9rWJbOR3jMgwaiE5T2UVGPqzLNoQdxs=;
 b=iaOB8Kl4pWa1TYeCtT4CAPV9xsF3mP9U+cRb0eeTXrW7gPhOAovKujK2PQwbTN7+bSAH0uHNC3DIZYhwfQDXncbAeURdUarA7zdqNgFcNUFq3q3GUzavrrlqrFRycDWt15gdX3maIzmSHEmzh5o4wEGx6Ra5wx9DGuDHt9lSPgyUJTMgRJqwcRYFjp6DRuc/oMjRuf7g4wmwPlQ8yM/FDWnsXGP5N2kqzUGXRVO+InE+MJ1jUSMdDYs7GsmxNqtuFV0284nCPCIAy43yx0r9XqOosO5nZU0UHYIXLcjRDDJhMzFvcyXZWBLukeW0pjVaLlPgKBVt3dIxstH0/V5GAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMGfhRMidI5Q9rWJbOR3jMgwaiE5T2UVGPqzLNoQdxs=;
 b=ZQ6ooXfdWHu7quKuj10jlNfSrd+zENJ7HBzITssNC1Fy4UKBC00/ozyih1LQV8hWDcHo/E8YCkIGBpTc8XBy57EvILxnJow6XXXBxXXppz8NRvw8wXjh5WsKaUvVR8oHTQK6rQDTvQRMB46cQzSxWJzU9Z/fBV7dUv5jrj5QrD0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Rahul Singh
	<rahul.singh@arm.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH v5 4/9] iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling
Date: Wed, 4 Oct 2023 10:55:48 -0400
Message-ID: <20231004145604.1085358-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SN7PR12MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c3f554-bd33-4391-fa32-08dbc4ea37c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C/isnkQFCaDQCT/VizsNjbMlPgYV1NL2X8PEPdkGog6WU4iWs0YZGDJIXJqRxNI/VxxcJB/jo1AqlOFMH7xkvGTcpVszRlEavHcBFlv39aTGMuwatAWiniY9gJos474+oPBU5JA98oKpHrI8f31GwzBUPtIlAHlx7J099+mou6fpewSB3ACdzh/iIGSC1V6tYNJHoLenPRk4vAA2WvOloBvN0R7U1tJlkG4fThHM58yEcuvLoZZ6eSWa1mPi4QAnuWbU/2arhUzBh4wnTwL9qMpEygfRhP0RnntVIYcWza3W3je7nvFDo723dRtHESPNs9F2L4ESxQP7Z9z+MdyId8dhaeRRWZvv6oDXBxtj4l900s6PqKuV7kYu1RfqaPc2wtMCE/VsEI1wEZzBxzehhfohkEXYiLueqne4UA8LAs/JnC78aSx3aKO8SAnwqMLgqOrKnWDc8kUy/3tG9oRFLR3aX6KrZYiZM26lyQE5fzAxfs0V5i560XqfWzQeiE8OOwz7Z83SySOQ8Y9ThUXRK4iygRq8PIjHuH1svW2RYROc676OKeU/inMNIHBaXtdDWYf05q8iWp75jh3mxKT304N1dVX28/F1oukJRqdMYaRhRN4JsT3uKo1ceC1FJ0PRiSiNthIpHQGz0RExxhBtyPS2CXUydhTN17j6gYm7Lh0fv0eRinslxxOHKMGiTIuM2WBts7+sMaC71EkyfIg9W8SscmwdcIaO5UdzcteRDCkC1rbStrBWgX7P1F4myZEWODLSZngSA3UW6WJtZ1t6vA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(64100799003)(186009)(451199024)(82310400011)(1800799009)(46966006)(36840700001)(40470700004)(83380400001)(478600001)(6666004)(26005)(1076003)(356005)(2616005)(82740400003)(81166007)(966005)(36860700001)(426003)(336012)(47076005)(70586007)(70206006)(316002)(54906003)(8936002)(8676002)(4326008)(41300700001)(86362001)(40480700001)(5660300002)(2906002)(36756003)(6916009)(40460700003)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:57:23.9807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c3f554-bd33-4391-fa32-08dbc4ea37c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7177

Handle phantom functions in iommu_add_dt_pci_sideband_ids(). Each phantom
function will have a unique requestor ID (RID)/BDF. On ARM, we need to
map/translate the RID/BDF to an AXI stream ID for each phantom function
according to the pci-iommu device tree mapping [1]. The RID/BDF -> AXI stream ID
mapping in DT could allow phantom devices (i.e. devices with phantom functions)
to use different AXI stream IDs based on the (phantom) function.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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
index 5ee81132cb4d..6159777aa26f 100644
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
2.42.0


