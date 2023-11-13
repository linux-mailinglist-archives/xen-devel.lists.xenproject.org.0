Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A0E7EA602
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 23:22:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632035.985935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fKB-0004Zu-Bo; Mon, 13 Nov 2023 22:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632035.985935; Mon, 13 Nov 2023 22:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2fKB-0004Xt-61; Mon, 13 Nov 2023 22:22:31 +0000
Received: by outflank-mailman (input) for mailman id 632035;
 Mon, 13 Nov 2023 22:22:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GGJv=G2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r2fK9-0003AY-MI
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 22:22:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20426975-8273-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 23:22:28 +0100 (CET)
Received: from BLAPR03CA0054.namprd03.prod.outlook.com (2603:10b6:208:32d::29)
 by IA1PR12MB7494.namprd12.prod.outlook.com (2603:10b6:208:41a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 22:22:24 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::de) by BLAPR03CA0054.outlook.office365.com
 (2603:10b6:208:32d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Mon, 13 Nov 2023 22:22:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.14 via Frontend Transport; Mon, 13 Nov 2023 22:22:24 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 16:22:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 13 Nov
 2023 14:22:23 -0800
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Mon, 13 Nov 2023 16:22:22 -0600
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
X-Inumbo-ID: 20426975-8273-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lzq7+w9eeVi0MDNWcd/TbsX0cDbhrqjyF84a3vaHANhNByj6Bmw7hdjkGDmCclZmtto9JT/BmzQud4XuVFCy/yGb1Lfng+sRYeDdS+HVaUomDBmFJlyPnFe10J9CSomI/TYSXRmH7T0G9iIP0azrbkl4091N9eNktMzPqAN3ONKZTrSx+si+K+I0CByWdjLPgmescn95E8YtFDPf5Sy18IdidDAkkfR3/wwfCUk7hqDJF9/BwekZdrdm6HlWk6NzX/1sHEMnuuG7ZxGlkvTLjJy7r+4qcCLzNLIJhjgl6NYTwYUgd5wRqCCUe/qbVlwYAhgH8jgeikwNB8odH/9f+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gX7WDh6u+fUULoRtawIbVh/xTm5OKI1iE4k56R1o0i4=;
 b=IInU/aJ8Bx0VG8XuTwEW/3Hk1rGx8rIfkOZ74han9tTlVJhND8W4tV2pAF+uk7UZ4JLsf5hFRsILmhZ4loAz0t0PNSHPJTWiXkpeL+meSd8SEdjgabotolc6dHEhtDvbmv7GV+OUeTngk0yfagVhugvvq20s6RPUR2zgKDTYkyVNW0WABEGdeC4PuNO6j6DEfVozh6hFMBp1u8s+BcPOBxJurjfuhZYz5/XdFVfkCsjN7cpNMdRcfGMwHYeLYDKCga+hx4TvfY6Q5+uDDi4KYtECNsUfv3xzJ49AcJh2c+dZ884cxhtfS5z/GtTMA9ZLhCW0UEkrEygkvKqxQh3NkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gX7WDh6u+fUULoRtawIbVh/xTm5OKI1iE4k56R1o0i4=;
 b=Kxg2vyjmylkNJyQwo0URGMR2qpoljCw9DJJ+/uYcudilAEda1bbUB/Gx8rPf92Gmq3yuERtVFPbSmqGsyvJxekE21HpgaHPK00zACii5woIva10o/ttbIQ5luzlu85oB1n2API+eL9XHlFBJjwh7J5BdR+MuwBdvsoG7S1z86uE=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 3/5] [FUTURE] xen/arm: enable vPCI for dom0
Date: Mon, 13 Nov 2023 17:21:12 -0500
Message-ID: <20231113222118.825758-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113222118.825758-1-stewart.hildebrand@amd.com>
References: <20231113222118.825758-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|IA1PR12MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: e1e1d82e-cff6-4561-b88f-08dbe4970301
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ArcVTITX0lOv9BuQP/9BFnA1HX7ts/MaOZu9ib4MxwSsxNDCdoXDnR4+mAGOHdjbd3H3p9NPgXB2A9qo17pWZIGqZRkuphHZSNLx69kMIxbB/IKCVUbNEVMelkZ6plmeYSF18Fhyr2ARinCYODGtlLlHwYNwDOXEAeQ55uQqd7ObEy+EhXGuxEdmRBfUt+Qe41/jPVX6eKDyClPdlbDzC7dPHBhijkvb3H+aF+30FsJ7FJVgfEE2Tnr9OqOKW8A/cD8nqk+tKPIfJuAbJKv4y37TqfQV1zpsFFDhenbSlrMhOnjo7wJH/h032lwJGd91zgXqEqn13fQqjXwwVi6F6/u1egzPZb0ha12vPiT5jWBaMROyY2rVZ7gRYEm4TccKUGSbdaGpxVnvhoddX1nGuIhPARsFZc5Id9bz7dMXufb941iW2G51W2M6T1yv1ukRoFGA7Ng2WfeR8OjK77taHtm7dmgFOflh6ybLkcnyZ8XlHrp8++uA/RwkkS6iiAW5V+wlp5NDiMETdIIAZ15AY+/RnxI8CF5zMjseSjVWAX3z8xAbWHe9qg7vOBSKNYnNslIKRMm68JC+9MG3hekHKiGrm6fu8nKzp//4PDSf9s94zmKJbc7kWuIbuQaT/CUJZSfkEArcdpb1mzRyBEpwW5QViATUz+rdiYvxlvbfA78LiayEVKbinlfDTtamxyqAcuRaRhNn1sByHBV/JFo1dkN84F2okZrZtvUBRICmhVgdLLh3N//xcHHxdy1DOK7oVgWlIKdtddGFbS6lgEXVLQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(82310400011)(186009)(1800799009)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(966005)(478600001)(81166007)(6666004)(36756003)(356005)(336012)(426003)(47076005)(6916009)(316002)(70586007)(70206006)(54906003)(41300700001)(40480700001)(83380400001)(44832011)(4326008)(8676002)(8936002)(40460700003)(5660300002)(2616005)(82740400003)(86362001)(2906002)(36860700001)(26005)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 22:22:24.4227
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e1d82e-cff6-4561-b88f-08dbe4970301
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7494

Set the vPCI flag in xen_domctl_createdomain to enable vPCI for dom0 if
iommu and PCI passthrough are enabled and there exists a PCI host bridge
in the system.

Adjust pci_host_iterate_bridges_and_count() to count the number of host
bridges if no callback is provided.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Allowing/enabling vPCI for dom0 on ARM should follow or be part of the
PCI passthrough SMMU series [1]. I'm including it here due to
prerequisites in this Kconfig series. Once the prerequisites are
committed I'll move this patch to the PCI passthrough SMMU series.

v5->v6:
* no change

v4->v5:
* add [FUTURE] tag
* move flags_optional change from the previous patch to here

v3->v4:
* depend on iommu_enabled, pci_passthrough_enabled, and whether there
  is a pci host bridge

v2->v3:
* new patch

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00210.html
---
 xen/arch/arm/domain.c              |  3 ++-
 xen/arch/arm/domain_build.c        |  6 ++++++
 xen/arch/arm/include/asm/pci.h     |  9 +++++++++
 xen/arch/arm/pci/pci-host-common.c | 11 ++++++++---
 4 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 28e3aaa5e482..1409a4235e13 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -607,7 +607,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
 {
     unsigned int max_vcpus;
     unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
-    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
+    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
+                                   XEN_DOMCTL_CDF_vpci);
     unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
 
     if ( (config->flags & ~flags_optional) != flags_required )
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2dd2926b4144..512b3c4c76e2 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3916,6 +3916,12 @@ void __init create_dom0(void)
             panic("SVE vector length error\n");
     }
 
+    if ( IS_ENABLED(CONFIG_HAS_VPCI) &&
+         iommu_enabled &&
+         is_pci_passthrough_enabled() &&
+         (pci_host_iterate_bridges_and_count(NULL, NULL) > 0) )
+        dom0_cfg.flags |= XEN_DOMCTL_CDF_vpci;
+
     dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
     if ( IS_ERR(dom0) )
         panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
index 7f77226c9bbf..74816a687bbb 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -147,5 +147,14 @@ static inline int pci_get_new_domain_nr(void)
     return -1;
 }
 
+struct pci_host_bridge;
+
+static inline int pci_host_iterate_bridges_and_count(
+    struct domain *d,
+    int (*cb)(struct domain *d, struct pci_host_bridge *bridge))
+{
+    return 0;
+}
+
 #endif  /*!CONFIG_HAS_PCI*/
 #endif /* __ARM_PCI_H__ */
diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
index c0faf0f43675..e6a03ae668f8 100644
--- a/xen/arch/arm/pci/pci-host-common.c
+++ b/xen/arch/arm/pci/pci-host-common.c
@@ -319,9 +319,14 @@ int pci_host_iterate_bridges_and_count(struct domain *d,
     {
         int ret;
 
-        ret = cb(d, bridge);
-        if ( ret < 0 )
-            return ret;
+        if ( cb )
+        {
+            ret = cb(d, bridge);
+            if ( ret < 0 )
+                return ret;
+        }
+        else
+            ret = 1;
         count += ret;
     }
     return count;
-- 
2.42.0


