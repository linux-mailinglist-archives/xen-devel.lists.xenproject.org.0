Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A55F37E71A0
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 19:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629807.982285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19uf-000877-Pu; Thu, 09 Nov 2023 18:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629807.982285; Thu, 09 Nov 2023 18:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r19uf-00085R-N8; Thu, 09 Nov 2023 18:37:57 +0000
Received: by outflank-mailman (input) for mailman id 629807;
 Thu, 09 Nov 2023 18:37:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZS/w=GW=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r19nB-00005n-0L
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 18:30:13 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03d23ac9-7f2e-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 19:30:11 +0100 (CET)
Received: from CY5P221CA0152.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:6a::16)
 by DM6PR12MB4090.namprd12.prod.outlook.com (2603:10b6:5:217::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 18:30:07 +0000
Received: from CY4PEPF0000E9D7.namprd05.prod.outlook.com
 (2603:10b6:930:6a:cafe::22) by CY5P221CA0152.outlook.office365.com
 (2603:10b6:930:6a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Thu, 9 Nov 2023 18:30:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D7.mail.protection.outlook.com (10.167.241.78) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.21 via Frontend Transport; Thu, 9 Nov 2023 18:30:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:30:06 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 9 Nov
 2023 12:30:06 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 9 Nov 2023 12:30:04 -0600
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
X-Inumbo-ID: 03d23ac9-7f2e-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jT9g96hjQdgJrxYt/7lrZMCXgKd9uzqipcYPM3uDFD4I0B/tG1DJn+0BEMBFzn7F5PmFPWKj05Uyu2Wij28XkaXERDLFghDLRJSEPFTMfXfKqKw2ugv7mQ3PWDJe3rUytqfgg1ceTbMrLR3S4ww8/OukePq5A/0Ctqfr/Uk8Wl9ve6CAAfzBjLikccI4nO6ibqy8BoZIQ4SG3XD2OX7AzNk5C2xJxVoJR/0q0lTrdALXKFjYQc/I5nK8WW7o+j91MipKT6SeV1/xyXOpjD1KgFlmxDbmI8ZG8cI8VYdIW4O1psMO1uxYDlIDDQi8Nludc7SF0zC+upoHYK2KANEyaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXLznLV9jxJDbZp4jEN64WVVU95OZkUBv8u9bN72k8w=;
 b=AzuLaZJ8eR1SjR7eU4tji27qp/szKegWPgSSeTdrfB3qoK86tVkKeouhq6t5r9cPGc7ZhrV7Fmdkv+rnwP375km+hm4YX1ChVDIyI2M50clVNYAVq1vdYnwNeYv5gwKGhjsAI4aFg6gYTSkg4u/UkT8e/fCKhWpOAg0pIJPNa1qPLGpRVLYctvMZVj8JZPQMDYCIUkQIHQ6aIZTA4EjD3zWg8Tj7XdKVxpxQZGFJuwAF9/gW/P9GjVrw7IpG/JwrEM2Pu851zQCjeusI5/nhsC9UPPKuuOteAiWn3NkludVQefF0bg1wstJTxoWUB0AYaC+Gf5tQ59bS2XYpMYSvZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DXLznLV9jxJDbZp4jEN64WVVU95OZkUBv8u9bN72k8w=;
 b=u1rQEs5pgq7i8PtAXWylJ4SR2r+9RwKvlBuUAMEoE+issb1TpDmi4KXuh/Lhzm8Cdq8eRV7lXLwLUXvQbLRr7SF8NzH9vpNpGYkE/ROQd3iNv/6YONuXFa1RSbueIWG9X9J1qgeMhorSBovhlI5Xq2CFkkyrzzMb4nZEMWbGl38=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v6 8/9] xen/arm: enable dom0 to use PCI devices with pci-passthrough=no
Date: Thu, 9 Nov 2023 13:27:11 -0500
Message-ID: <20231109182716.367119-9-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109182716.367119-1-stewart.hildebrand@amd.com>
References: <20231109182716.367119-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D7:EE_|DM6PR12MB4090:EE_
X-MS-Office365-Filtering-Correlation-Id: a74a21c8-0eb1-454d-52bd-08dbe151e645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lTUms9PgQf8/I2uJawmc3Fm1pI4KEEHvEfI585dAWm1C1fBsy1hvjhV0sjKo7xdIj1LksRGtf9nvbgnqVcCmvS4WwqFXJYwIYRRADAD5jfDr5UJ8G3epZ4Bav1PjikK/N1HnpTdMdmJpjE+Nw6N5wngz8dmRChw2SHOqePis1Ge+Ruyh8zbdANmj08k/JNg8bNSeqI7U0McW+pvhxZQS1u8cFi42s0LQLVhJV48y5Vtp5LkdFtAVtMZ2Ss7Tq10pQb0tUjlmKsiIUF8mz6XeglNJ726fdvj3dK3f+SKaFA042Pno7QBrmJ1ACgnxH3u/FTSrXLijqlyKkE+TwzHReFJXTXKiKorJqLXLygqCGzk7pTTDeS1aVXgf1bihKoxKWuPtlWDb3AIV2cXFWn8+IrSXJGHA9dGOVQ2YE8haXRAV872MB6mBsvjcOEhc5K9JppYk3FaWAK2UJB1sRHFX3y7ne4YuG/R/Wob0q0TKK1yNUXEiTKJQnCGS3AgfkfrlOnUfyGnmohAEosrufAfWHpUuNuLFgFt6hM2FLqh/j7OfBV/ZiSNr8VOozeyNMlWXsX/MkTodaS3v4bEgUYD5tKDMb6KqJC88zRFp/FQDlAUll+1haWBmQRIKEFwUG8N43BiNRLJubAW8vKF64OubEbv9i8fYHNWtSnKlCyOCm+dpngvz4XZjAO6k4iAra2mDHJdyla5ZIXBr+te2HQnC282F/JWEU+5zNtRqjpSuAM8dbqzJbu261BNlSXNnIuzwdGMpV4iYKMMBnxFKKcTKbA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(82310400011)(1800799009)(451199024)(64100799003)(186009)(46966006)(36840700001)(40470700004)(316002)(40480700001)(86362001)(40460700003)(81166007)(70206006)(54906003)(70586007)(26005)(478600001)(336012)(426003)(82740400003)(1076003)(36756003)(2616005)(356005)(6916009)(2906002)(8676002)(5660300002)(41300700001)(44832011)(4326008)(47076005)(83380400001)(8936002)(36860700001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 18:30:07.3866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a74a21c8-0eb1-454d-52bd-08dbe151e645
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4090

Enable the use of IOMMU + PCI in dom0 without having to specify
"pci-passthrough=yes". We rely on dom0 to initialize the PCI controller
and perform a PHYSDEVOP_pci_device_add call to add each device to SMMU.

Enable pci_init() for initializing Xen's internal PCI subsystem, and
allow PHYSDEVOP_pci_device_add when pci-passthrough is disabled.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v5->v6:
* new patch - this effectively replaces
  ("Revert "xen/arm: Add cmdline boot option "pci-passthrough = <boolean>""")
---
 xen/arch/arm/pci/pci.c    | 3 ++-
 xen/drivers/pci/physdev.c | 6 ------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 78b97beaef12..ba72fbaf1dfc 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -16,6 +16,7 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/iommu.h>
 #include <xen/param.h>
 #include <xen/pci.h>
 
@@ -85,7 +86,7 @@ static int __init pci_init(void)
      * Enable PCI passthrough when has been enabled explicitly
      * (pci-passthrough=on).
      */
-    if ( !pci_passthrough_enabled )
+    if ( !is_pci_passthrough_enabled() && !iommu_enabled )
         return 0;
 
     pci_segments_init();
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 42db3e6d133c..4f3e1a96c0fd 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -18,9 +18,6 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         struct pci_dev_info pdev_info;
         nodeid_t node = NUMA_NO_NODE;
 
-        if ( !is_pci_passthrough_enabled() )
-            return -EOPNOTSUPP;
-
         ret = -EFAULT;
         if ( copy_from_guest(&add, arg, 1) != 0 )
             break;
@@ -56,9 +53,6 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     case PHYSDEVOP_pci_device_remove: {
         struct physdev_pci_device dev;
 
-        if ( !is_pci_passthrough_enabled() )
-            return -EOPNOTSUPP;
-
         ret = -EFAULT;
         if ( copy_from_guest(&dev, arg, 1) != 0 )
             break;
-- 
2.42.0


