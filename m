Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918CB6FF9FE
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 21:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533547.830324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBnm-00055g-6z; Thu, 11 May 2023 19:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533547.830324; Thu, 11 May 2023 19:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxBnm-00053e-3A; Thu, 11 May 2023 19:18:10 +0000
Received: by outflank-mailman (input) for mailman id 533547;
 Thu, 11 May 2023 19:18:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qWxp=BA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pxBnk-00042a-8s
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 19:18:08 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e1778b3-f030-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 21:18:06 +0200 (CEST)
Received: from DS7PR03CA0107.namprd03.prod.outlook.com (2603:10b6:5:3b7::22)
 by PH7PR12MB7115.namprd12.prod.outlook.com (2603:10b6:510:1ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 11 May
 2023 19:18:03 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::72) by DS7PR03CA0107.outlook.office365.com
 (2603:10b6:5:3b7::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20 via Frontend
 Transport; Thu, 11 May 2023 19:18:02 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6387.22 via Frontend Transport; Thu, 11 May 2023 19:18:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 11 May
 2023 14:18:01 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 11 May 2023 14:18:00 -0500
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
X-Inumbo-ID: 8e1778b3-f030-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elqkgSRE/3k6CmmWliTBXBsU6XVz/7uZYbFq3LjTYIIad101OpT8y4Fjzss7/+ie1UW//fXrYHlj5gjN5O6AXDf2T2GuXYuQCs46rvMSm3NStsW4N3eUe9PAfd9bbKpH9I8Dp/UcoKFttFKArIg1gZiMDc/zwxZ5JicofWlDsIwhDWHVpt1MnadgFu7LYAZyCVJmQOtdc65Bu5T0ryYBV7XeE+LoG03T7Q9Liv/r+i4yJD0xaDfyva7gLeRiqwpXgc8K0MP18Vrx8HRNwrQKIYD3DzBIn1PRwQX4lzOJPj7BnOPOZBQzQG7L2qBBR8k7IDyzhB2N8NclqkGMjUkIxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7y7/iwGlnJBfhykkW+cVx9ujgWVYtHTxAqrWt9z87M=;
 b=c4f5M1B2230ElonxrsdaRz8CKbXBqAcXsKfoet9KEjlb+Z+TcUuU92j6WbPaOPIX33EhiG6HonPvI6fkMSRINLXLYXJoH5hkSJ13hN06BBxdcAr2NLXS4CnXbOrRfDKrXC5nUdNQx70XYzsDWVYQIkpjR2xH7RTrTMORhTqRcMB174vDafePd7v71ujszBWFmxsKsi8NXVZE3yybBzxu0CrMyupSIcbD61UHwlN2WE71ViWmNMFduH4jC/WDqSYIdPzTEZfCSxYLuQgdjcbMz4ZpNL5xPhEmyjN0GU6zupEBbcMtcQCeCELCBe7Zm6MVzPW+zztGBsQBy+YCf3BC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7y7/iwGlnJBfhykkW+cVx9ujgWVYtHTxAqrWt9z87M=;
 b=apdorjHW8giUT/PLJNxI6xPQZyuLMipk3UNfuu2epSJBZQazA6eiLq5ziLAOFXWpjULNYvl+Fp+CxAnUnboJR4ign4Jh2XrtZiSZ4uOfNrR6EaCoGPsgi0u4vIUfd0sBVJn2jAu3GS33LHiOWcnaXLxSYFpuPVMugt1vE4Yw54w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v2 2/8] iommu/arm: Add iommu_dt_xlate()
Date: Thu, 11 May 2023 15:16:48 -0400
Message-ID: <20230511191654.400720-3-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230511191654.400720-1-stewart.hildebrand@amd.com>
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT059:EE_|PH7PR12MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d98ad87-1de2-499b-be23-08db525470b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lYQCq3Fzr77Vspqg8KBdd+4/068rVH7qPe5cdSfX2VzLSRExEf1u2W2CjhkLtO8FZLkBzboerUPLaloglKIDBLKl7m2RqeIK9FJvcaoko6zytAH/IMgjCe/s+eEq6XemitUOAW1cap0NZQo+sI/1UDLtPrQzrk3g+Aa7APck1SFnTxKqSBEPgSrLO+Ucbf/vELnQpXx+VlOiXFR1zv6cP4B2Y3tW5FStaiqa+ftMd4uJ8K++j7HI2y9Oua4nR9yNrx9dBS0PNB7QvmKf9kvNgqgCxtWW3rsungXJs2Dm7ea4yD8oDbBiJ0AviIQuwiaKiezeS6jtwydkLnmwbrswotY5oFUNabSKOGTqc+HtzifH/Pci04BMqq+Cdw6rOdZBOI40jhYqqTDe+Ls2hQMcE+C+apfx7nuKqzIAYaACiiq77LJsZdltamcI3Cab1KJBlEcBDq71YdcaCom5e7nJweZzNoVMDIbybnXP6Cyxts+HRmRVFbc409FFZ0esXEZ1P4MIHQIcyzYYbR/EPcGAXS+pBaFxBAdpBu3dkLRh14m89EVNOUpGsyrwPxCWrreji/pbDrw3G2J+z9vWk1b1GalBQF0OIPOUa12mbSfEJXptBeWi9dG2ebBwbCOid1em//oNqRqrskV+Jhz55KNMyd0HO1DDqmAiJCLxKWownEUyoz3LnkNQI/top1QseWuLL/2RFC1XkSHhnPChi8DP0Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(356005)(316002)(47076005)(82740400003)(478600001)(81166007)(8676002)(2906002)(426003)(41300700001)(336012)(6666004)(82310400005)(86362001)(5660300002)(70586007)(83380400001)(36860700001)(70206006)(8936002)(4326008)(966005)(6916009)(44832011)(54906003)(26005)(36756003)(1076003)(2616005)(40460700003)(40480700001)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 19:18:02.4005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d98ad87-1de2-499b-be23-08db525470b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7115

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Move code for processing DT IOMMU specifier to a separate helper.
This helper will be re-used for adding PCI devices by the subsequent
patches as we will need exact the same actions for processing
DT PCI-IOMMU specifier.

While at it introduce NO_IOMMU to avoid magic "1".

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com> # rename
---
v1->v2:
* no change

downstream->v1:
* trivial rebase
* s/dt_iommu_xlate/iommu_dt_xlate/

(cherry picked from commit c26bab0415ca303df86aba1d06ef8edc713734d3 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/device_tree.c | 42 +++++++++++++++++----------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index b5bd13393b56..1b50f4670944 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -127,15 +127,39 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
 
+/* This correlation must not be altered */
+#define NO_IOMMU    1
+
+static int iommu_dt_xlate(struct device *dev,
+                          struct dt_phandle_args *iommu_spec)
+{
+    const struct iommu_ops *ops = iommu_get_ops();
+    int rc;
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
 int iommu_add_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops = iommu_get_ops();
     struct dt_phandle_args iommu_spec;
     struct device *dev = dt_to_dev(np);
-    int rc = 1, index = 0;
+    int rc = NO_IOMMU, index = 0;
 
     if ( !iommu_enabled )
-        return 1;
+        return NO_IOMMU;
 
     if ( !ops )
         return -EINVAL;
@@ -164,19 +188,7 @@ int iommu_add_dt_device(struct dt_device_node *np)
         if ( !ops->add_device || !ops->dt_xlate )
             return -EINVAL;
 
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
 
-- 
2.40.1


