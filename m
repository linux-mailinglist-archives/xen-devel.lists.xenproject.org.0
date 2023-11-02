Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020CF7DFB29
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 21:01:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626983.977799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydsI-0001Pk-Rr; Thu, 02 Nov 2023 20:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626983.977799; Thu, 02 Nov 2023 20:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydsI-0001N1-NX; Thu, 02 Nov 2023 20:01:06 +0000
Received: by outflank-mailman (input) for mailman id 626983;
 Thu, 02 Nov 2023 20:01:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mhp2=GP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qydsH-0008L9-9s
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 20:01:05 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e89::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d12e61e-79ba-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 21:01:04 +0100 (CET)
Received: from BL1PR13CA0332.namprd13.prod.outlook.com (2603:10b6:208:2c6::7)
 by DS0PR12MB8365.namprd12.prod.outlook.com (2603:10b6:8:f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 20:01:00 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::5b) by BL1PR13CA0332.outlook.office365.com
 (2603:10b6:208:2c6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.10 via Frontend
 Transport; Thu, 2 Nov 2023 20:01:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 20:00:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 15:00:41 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Thu, 2 Nov 2023 15:00:40 -0500
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
X-Inumbo-ID: 8d12e61e-79ba-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgYGmF5/6R3GWvdk05Z48eK6waBl/dvLOqKrmzpzBJG8vJS8ETXMPVjKYFGQ+wbxWOweCRgFL3S+jOlYXkJCpy6fv+gLuWjUp+P0UmTXRpFuMso7jGufhI9Q9zEIi7vHFMmM5qkBrAGZlEnuSmXLqoaGbT0dkTIVdnNRWOn9jAQTiDhfWE2/zWFH/pWzmKKIa9iMDXqIJ5u2UqfluBNUtXnkw6KljY+glxnAiXjldRG7udxa0DxTjgnzq1bHgfgYC/cob7u+oITeAn9/ooRYQJwIWopwhUIlHEXnrM7Kw+oteAsoxKXI2Hwh9tKhUFkxOa02NuXunU/mVVa3XrLppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=foc/8FzmXuit5/zyCxOQj1X7zaT4pCrJhL/sb10f1wA=;
 b=eFxWKvahDoyNDlZaZ74l5hXSOloZp8yFXNyjMuGcEp/lyVMhb3tNhfdDxwcmezH02odGSU6fZj1989NS473GpDXxAY4jDXuSPDzXmShDLJRXliIAu2dIZEJewt7SSx3B6iukEweWxyAjooc8KYqQqgm+2EfQJQwNctaKBplbyQ/mzyttYcoQ970f+CuRlGJxuOvyM1HVNcqSddMYFY/Y/vmBB3ezeujtPgRQnaFdHBI6dplTPwVp0UnR5f2d/WY1QpCyB4EWorBHqwFx2/FRRQ68A00aF4Rrjx52XJIFyLuD0uddMvTMm57lwD2u2/uI4y9rvjzajW0dn4cCWo8xqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=foc/8FzmXuit5/zyCxOQj1X7zaT4pCrJhL/sb10f1wA=;
 b=TjwSqwAK+JAARlJ/ajiXMzQMKIbAXk7tK1Bfoom9t0Om3f3ZD5HXTbTZcQ7j5RXjckNdqypBzySud7OnNYp+Vj7f7VbKW+2hZ5g5cylNfCwRlfTLgUEV1hQMO1uZwQyfIWLUk81U3YNtA6tgDW5FOF58gvVQcdIMSkeJKdAxP6E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 3/5] [FUTURE] xen/arm: enable vPCI for dom0
Date: Thu, 2 Nov 2023 15:59:31 -0400
Message-ID: <20231102195938.1254489-4-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
References: <20231102195938.1254489-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|DS0PR12MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 53fc6118-3ab6-4aae-5c23-08dbdbde6f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s/z+ll5Zdw/O/vqbnqQLPRg55HjsCziILRbiI30BSvtQ/LzexvZFWGb9mJ0hwrk9vqTg5NYC3m56XE/xcC/ZbAxQqg9UShI2YXwr8SF4AQL/VyY0JSBkBYiwW2806TuqDb0EjCihefV0ry+JrDSjXCjrpmQXgBgU+/8xAEC3KM188vfKyDmovccS2fAZah5TIL4KVVcCJdeyyBQMDUjXV867oB/2DlGt018uaF0yL/2orDp7bjxXaqYJ79EzvmXjy9kjK9IhCTf/SPSN1wjfkYZZJ8FAgGS3gCTw6V1rdHWH29LYtcajCdFb5yV39TENbId61IcRvtegJ4OjAyLySvWNXSbRbPKj6Y1GhIyyp0ifxuLWqNDImu7Jiz6FnbOwDgbHTdr0c/lZP5jKF+xKdZmjcPQhHSu9Qhi2DbDUpShuJWqb7jje4EUnwh98fxM9+SqVvE4NYTEfM1Am6uRcznvcjpG5W5yGxH8J0JYzyf0nqBDh2K5/8wduHz+EXp+vYs9/I6HY4WL69busKVVT775AQ5gw/uLUm5++mGoebgwhw3mafQNFxbP9RfoKWZNKKzdVDmzD1DLeOSOIeP9cI5ooyWSpy1DPcZ0ajBl8Tpyu6g7wz6Q2Tk/N2SlqwfzMepjFSeT5DXfCPH2HIoS/OgtAFo0WN2dfhfwzI8c20nfkcpEmGf1NWdHnGdj4nskaYbmJt3eOXOGTbH/6lyQjT/jOK7czrc4CdFVmO4SmGKYziJ8/sb5ffVvAwvhibwr9R4/7FNr41svC4rMxMytsJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(82310400011)(186009)(46966006)(40470700004)(36840700001)(478600001)(40480700001)(966005)(426003)(356005)(40460700003)(336012)(81166007)(82740400003)(36756003)(70586007)(70206006)(5660300002)(2616005)(47076005)(6666004)(86362001)(6916009)(36860700001)(54906003)(1076003)(41300700001)(44832011)(8936002)(4326008)(2906002)(83380400001)(26005)(8676002)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 20:00:59.9177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fc6118-3ab6-4aae-5c23-08dbdbde6f6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8365

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
index 49792dd590ee..4750f5c6ad31 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3915,6 +3915,12 @@ void __init create_dom0(void)
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
index 8cb46f6b7185..4ae4d8cff8bf 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -154,5 +154,14 @@ static inline int pci_get_new_domain_nr(void)
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


