Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CC27B8351
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 17:14:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612683.952737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3aE-00040q-Hc; Wed, 04 Oct 2023 15:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612683.952737; Wed, 04 Oct 2023 15:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo3aE-0003yh-DF; Wed, 04 Oct 2023 15:14:42 +0000
Received: by outflank-mailman (input) for mailman id 612683;
 Wed, 04 Oct 2023 15:14:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HSqs=FS=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qo3KJ-0003AF-Q2
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 14:58:15 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe59::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70be4bb9-62c6-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 16:58:14 +0200 (CEST)
Received: from MN2PR13CA0023.namprd13.prod.outlook.com (2603:10b6:208:160::36)
 by SJ2PR12MB8926.namprd12.prod.outlook.com (2603:10b6:a03:53b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 14:58:11 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:160:cafe::8b) by MN2PR13CA0023.outlook.office365.com
 (2603:10b6:208:160::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.26 via Frontend
 Transport; Wed, 4 Oct 2023 14:58:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 14:58:10 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 09:58:07 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 4 Oct 2023 09:58:06 -0500
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
X-Inumbo-ID: 70be4bb9-62c6-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9LL0UI3P5Igl9bcVddkiLsZgCENXhTbqrfsRSdRpsjOsKzap4p2oNQpeEbMLEIhtchAePIMVp7CmUphwuDxomW54elCN8lBHIOBdN2lL7F8Ph8YpZK2qjz0VdglOI/ldUgXKGh4lIWuM73IdX/VYo0g5JXQGEFCbQlRXlUM7GkWSldtb0+B3JKNOPKdBiiuhHrap8MZK4oISvFHuYCJeE1CtpZY1PYma0zFaoCH8DB4yStgxvcsvjmIWKUbWaisvsemgmocZ5pxJRQAv+aIuTLDzY7WJ0NraBIw+ODnIv/I/1IVF20e/EMjsixLCOWvKIMlcgoNydTsxEbF3sMJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYvhbIghzbK4otPkykio9apH9+Sqf28bZwTM507TJT4=;
 b=UgS3vktYejor4/gbPeDCPZbq4/YCzeafhYqrvSXfHQ4exppLw+Xh/GDYxd/QoW3YK3itzAFGl8dYhJq08Y/snEQQ0uvdK/Il8ngtxYO9iwSYdO3QLoiN9mx55fLpMs5XxN51AQ6puFl9rq3Wq+L7oVdgrlvYCqDa755FVkzuxnloBjZnxhWhvLeujhw0ebSz3/k+QBvLpBtkGwUxUb4fwPxwh8mubf6onEQoqj2/h0m5j+uGDhgTMdsv/1n9wkI7kApbyrF27VmzzQABRAp2zmRUV5OPu4l7DosMroshbk0htcQTPwi9qFVZ50GAXYv/J3pldFmIvbYIR2ZCLFbn6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYvhbIghzbK4otPkykio9apH9+Sqf28bZwTM507TJT4=;
 b=nQ9yT96fDZ4D4SG+0dRnhcCR6Y8Ssao+tz41LI/DHRd+FaNisrY/uIQq2lNNMtnFSfro/83R2sB8T4CmcqJ5XkjVwjjpleQMm5YsxGxTeb2Xud7Pg/LqZScrSvvdfV/f+7HVJ4gmHSxQSP8yXnlgJFxi5yUPtcGU2Zo5rNQb8vw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v5 7/9] xen/arm: Fix mapping for PCI bridge mmio region
Date: Wed, 4 Oct 2023 10:55:51 -0400
Message-ID: <20231004145604.1085358-8-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|SJ2PR12MB8926:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f45f25d-3c94-4543-0676-08dbc4ea5367
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jnOvq/+wSpgLWgV47DaFWUtDDbaeNrNy59iWhHI+98Wj/J1y6fyG0m+IG7uTc0i+EBsFs17xVtEvP8UM7dRa0cuake8DlBTUTfCdzmzpKqwdnImdong/lKNCWoVG9QkdlKxvfw2QVhh37+uIs+w5vuzjh4w03Hia+14zB0TgykMz8ROCeb2paRQesVlDGHmqOBeWuhVCAxXpBJlOEeMBlhQJH4O6JT5axKZLGgSeg5xhupzf8oDgAZciz1lbNjzMro1q7f/5RS39uxvkyU7uvvMI7KrtgnNOxvEOuVWPu/jNC1V80mKaIRMhwC/hFRxJ3N4+50HsPSJ8XQq+SO9QYCTcxHFlX/+WibEhoS1XotWa+QzxUsEIgj9i33iVM/ZI6T2TuHG9lpXNzkDsdfQZJtlCRDjjZRMugsSvNIj5lv2kUALwb3mhcksKgAzGOBFLJ7n5kTEa3ApFDwbdhhFoBPr6LPWL+z2+4Ldb6/VWHKemW1AfUe9MsfRUB+gANQFXnkvYupwhphfZcvcCzJXNrirC23TaJ+Oo41A7AcJ30yfktUo2vw+AKnPb6N6oE82nCrBhGVhvAWivHz0kyVYXCz5Rc74QyxhcQHbst02zySXd0SZJRwhnpmzw5D1olbbhC8sm7I1vmOdxPON9BTehKuUNiPDAURg0wUFJTfdoilBTUMtgPix5GzrRONAj8ylyy+pJlXOxXHJh+a+dpEuhtGVaheD421SvlfoogRwZywrjdnG1lvB3VVDuXpzEbFNKSlQfSzolGKUK0QcvKQuhBQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(39860400002)(136003)(230922051799003)(82310400011)(1800799009)(451199024)(64100799003)(186009)(36840700001)(46966006)(40470700004)(478600001)(6666004)(26005)(47076005)(83380400001)(336012)(426003)(1076003)(2616005)(2906002)(8936002)(6916009)(54906003)(316002)(8676002)(70206006)(44832011)(41300700001)(5660300002)(70586007)(36756003)(4326008)(82740400003)(36860700001)(356005)(86362001)(81166007)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:58:10.3240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f45f25d-3c94-4543-0676-08dbc4ea5367
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8926

From: Rahul Singh <rahul.singh@arm.com>

Current code skip the mapping for PCI bridge MMIO region to dom0 when
pci_passthrough_enabled flag is set. Mapping should be skip when
has_vpci(d) is enabled for the domain, as we need to skip the mapping
only when VPCI handler are registered for ECAM.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v4->v5:
* new patch
* rebase on top of "dynamic node programming using overlay dtbo" series
* replace !is_pci_passthrough_enabled() check with !IS_ENABLED(CONFIG_HAS_PCI)
  instead of removing
---
 xen/arch/arm/device.c       | 2 +-
 xen/arch/arm/domain_build.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 1f631d327441..4d69c298858d 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -330,7 +330,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
         .d = d,
         .p2mt = p2mt,
         .skip_mapping = !own_device ||
-                        (is_pci_passthrough_enabled() &&
+                        (has_vpci(d) &&
                         (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
         .iomem_ranges = iomem_ranges,
         .irq_ranges = irq_ranges
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7da254709d17..2c55528a62d4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1064,7 +1064,7 @@ static void __init assign_static_memory_11(struct domain *d,
 #endif
 
 /*
- * When PCI passthrough is available we want to keep the
+ * When HAS_PCI is enabled we want to keep the
  * "linux,pci-domain" in sync for every host bridge.
  *
  * Xen may not have a driver for all the host bridges. So we have
@@ -1080,7 +1080,7 @@ static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
     uint16_t segment;
     int res;
 
-    if ( !is_pci_passthrough_enabled() )
+    if ( !IS_ENABLED(CONFIG_HAS_PCI) )
         return 0;
 
     if ( !dt_device_type_is_equal(node, "pci") )
-- 
2.42.0


