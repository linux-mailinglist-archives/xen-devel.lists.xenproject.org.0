Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267868CA771
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 06:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726501.1130821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEW-0007b9-8f; Tue, 21 May 2024 04:36:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726501.1130821; Tue, 21 May 2024 04:36:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEV-0007Tw-Vo; Tue, 21 May 2024 04:36:15 +0000
Received: by outflank-mailman (input) for mailman id 726501;
 Tue, 21 May 2024 04:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H+om=MY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9HET-0006eS-Ms
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 04:36:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5d4fe5f-172b-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 06:36:11 +0200 (CEST)
Received: from SA9PR13CA0045.namprd13.prod.outlook.com (2603:10b6:806:22::20)
 by SA1PR12MB6775.namprd12.prod.outlook.com (2603:10b6:806:25a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 04:36:07 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::23) by SA9PR13CA0045.outlook.office365.com
 (2603:10b6:806:22::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17 via Frontend
 Transport; Tue, 21 May 2024 04:36:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 04:36:07 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 23:36:05 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 23:36:04 -0500
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
X-Inumbo-ID: a5d4fe5f-172b-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C17Pi7tJGLw4DxXwSM9ESWg+rU7/DL+BNHCHdzx108xL3y0u1SAhsITSJG/V+hZ6e2Mw83HLbVmKSf19vVmx5Dfwd2qmvf6PJE+z52vOzDBDCxdXDijE6a8F6rOzeaAcPXlDNKUA69J27tHRj+k1vQn8hng/rJiykmgbs4dRHvvFeS3mj06/6T2uuxSLVEQxlHWyuilGtbngxRogVBKH+17igtCWP6/pbhN+JgPCDFOK5q5yBttJiTmkTXvn0QZ64+dcLoIJDoJLO1hCtUDMpTJ4cPPah0bWKjgRoHuQB21f+LBpfS6xqD1X19o7mgdMHGbobn1uIm3KU59HOWe2ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuT4kemK+kjHrj50JMbp96wCovrhPDOGjTghim1ZSdM=;
 b=bjAXEwE2weqPzRyAftaegUnj/bQU5S9W+wpTYVqmqVnEGNrt3dC3BvezD/7WbBfg7Ya8Dy+Bt21s0NC0jUGbc+hJiL61lzIt5j40ODG5U3Kz2sW99tzqmbZRZhE/+Oq8aVgAm4Tg3b9Pcabh6M8Y5R1gU8qOtJDLee5z5ShoanKPr2Aqp4qgu7lpk8Nox6MVkk1iVCLUM+zjyKaoftFmHaxYwy234Xgbe+srYG94RwPL/eqX8k8CCLooFtOYfbFXdnrWrlGzUN5CRGWi1nUv58SkLCEyyY38JWNNzcl8COGHcOxtB4HPWZfKUkSPmNA6+A5U5UODmg8JCOxwQU741Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuT4kemK+kjHrj50JMbp96wCovrhPDOGjTghim1ZSdM=;
 b=OyewpQFMLsLzwHRRGnuZZR+b9WXn9PLZ7dv9WAkvDvye5aTGKcelpFrl24Uiub4fZPFuJiA828qlNfOL4N3+Gn2BAZ2g67P2StzAmJ7jGcZoj9Rit+Pgn1Ogo0WVegm8eCaoiGZxdxGoBED/sXBjl9LgqJgH7e3nvCdViME6z+k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Henry Wang" <xin.wang2@amd.com>
Subject: [PATCH v3 3/8] xen/arm, doc: Add a DT property to specify IOMMU for Dom0less domUs
Date: Tue, 21 May 2024 12:35:52 +0800
Message-ID: <20240521043557.1580753-4-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521043557.1580753-1-xin.wang2@amd.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|SA1PR12MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: e98ba37c-bd5c-4a95-9f03-08dc794f881e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OjUZlyRjaxo9UymNdsxuU/VMmz908IooKJ5Hq41wYYPUxw0jvP/J1SH0Dgzg?=
 =?us-ascii?Q?9Qw6vUhe77juLSOdALoUTJ7MPOQ2NGQX6Oaj/zLaT+nY+J3cFE2LZCd7N50b?=
 =?us-ascii?Q?oG8Ftl0iVGrIYTH/jYcWQf20eWXBh6wj2yFECT+obqpij9ApHlPJ4piJxhmP?=
 =?us-ascii?Q?zIU9AlVjcq/3E0QacQqHvjewJWMI1BcHeZEBjBUuB1aB9ayCQFlW62SGH4ug?=
 =?us-ascii?Q?a3qCMyvT+3ejtZOvRdVdJF/laNLdJ7hYtvyVPnc7oHyjChDvXivAUKrQASIM?=
 =?us-ascii?Q?mShsFZEDZeWEHcqSs6qRebPdjkzCIRrpRfh4BeZkoRI8JC7CoxF3hxCrl9gi?=
 =?us-ascii?Q?5GYKZrqrM7W0Uq2/4c+rOeE2VKZYKTioXmNUOu9QRaZSG2DnwVB1UqqLaKhB?=
 =?us-ascii?Q?rGPeswld3orys+i+IffK34ObGxA06R+WODQvVmQyTmy55HaxVA2hvVIE/Cy8?=
 =?us-ascii?Q?X6cqfR2aIcmlPvboh0C4zW4HN1f8SPtJ/EFGgHQrtcB76E4aYFPiemGGiktF?=
 =?us-ascii?Q?jpSLye93VpyMgo6UFUl257Mt9jeF5TC4D87vv7JZZXpmzfN5CS+3QorHRaJ4?=
 =?us-ascii?Q?hqn181uz+HALBFmeLw8N8faFLmV7pBlySY09CGOMxAriS3BiU6ubzPgzVQAT?=
 =?us-ascii?Q?n9tfVefES7qLSyAcVUZJTDlUEgTbF1NgpvOhe+Baxui5rCA3WcttrhGJmC9i?=
 =?us-ascii?Q?G4cZgpdK6ec3dIzi2QwaLymNxwbpJVCiTPbE4nNncham2PJOWBJrVU3m9RdZ?=
 =?us-ascii?Q?UEzXzzV/XSlWwM49E0TedO8VAzJzB1ZcYH8J3Fm72wfXdURKiykfqw64Scaq?=
 =?us-ascii?Q?67tFYvtE6L2l6iMRdgP6WlmZ/FTR6dUsNwewZkOeLi3324QGNga9hQUWT+2U?=
 =?us-ascii?Q?pavGXQxrk0hvlwped46TBMVAYpnyIxKKz04Y2A00serVA/tjlu0NCZHi6k33?=
 =?us-ascii?Q?AY7EHYA1YmwHZSWyQ0VaKU1GYFzR+p7DsOMwS4rcih1ncND5r7ymh4gks3QY?=
 =?us-ascii?Q?cUOJPlYE66v/pMU8W5fyHST/IQoHhEdLd1+eAonoNgrZEpnOlIqsKxPYJSXq?=
 =?us-ascii?Q?68N5DdBoJrT0SdS6oBpPVEnRCCvciINCgmzhGv3ejDNPTn2AMk1gjyU303g9?=
 =?us-ascii?Q?Kzo37LiGvRNKPoyC7DiD8H3+3srzKGIrArFbR5bPLsJvnN77/DObSTNzSN6b?=
 =?us-ascii?Q?axwYVR1dfbwbPZDkt/2uDRKsvjPw5jSGgaattr1ThGyioCP1498OyTnNmFue?=
 =?us-ascii?Q?pnqRvxQSHUeCzvagMwNOqrdYetjMLT9A3PYyYk4VZC4dYXepr92uVHatVjuE?=
 =?us-ascii?Q?36Dm8MlP5dUf+gukoZCvTw/PjcWYli7ApBV5AaOFrXOgag4xKvD9tngxtwBh?=
 =?us-ascii?Q?G3jUZOFQp2O/kuR4lgAwSCZa+pXo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 04:36:07.2384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e98ba37c-bd5c-4a95-9f03-08dc794f881e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6775

There are some use cases in which the dom0less domUs need to have
the XEN_DOMCTL_CDF_iommu set at the domain construction time. For
example, the dynamic dtbo feature allows the domain to be assigned
a device that is behind the IOMMU at runtime. For these use cases,
we need to have a way to specify the domain will need the IOMMU
mapping at domain construction time.

Introduce a "passthrough" DT property for Dom0less DomUs following
the same entry as the xl.cfg. Currently only provide two options,
i.e. "enable" and "disable". Set the XEN_DOMCTL_CDF_iommu at domain
construction time based on the property.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v3:
- Use a separate variable to cache the condition from the "passthrough"
  flag separately to improve readability.
- Update the doc to explain the default condition more clearly.
v2:
- New patch to replace the original patch in v1:
  "[PATCH 03/15] xen/arm: Always enable IOMMU"
---
 docs/misc/arm/device-tree/booting.txt | 16 ++++++++++++++++
 xen/arch/arm/dom0less-build.c         | 11 +++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index bbd955e9c2..f1fd069c87 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -260,6 +260,22 @@ with the following properties:
     value specified by Xen command line parameter gnttab_max_maptrack_frames
     (or its default value if unspecified, i.e. 1024) is used.
 
+- passthrough
+
+    A string property specifying whether IOMMU mappings are enabled for the
+    domain and hence whether it will be enabled for passthrough hardware.
+    Possible property values are:
+
+    - "enabled"
+    IOMMU mappings are enabled for the domain. Note that this option is the
+    default if the user provides the device partial passthrough device tree
+    for the domain.
+
+    - "disabled"
+    IOMMU mappings are disabled for the domain and so hardware may not be
+    passed through. This option is the default if this property is missing
+    and the user does not provide the device partial device tree for the domain.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 74f053c242..5830a7051d 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -848,6 +848,8 @@ static int __init construct_domU(struct domain *d,
 void __init create_domUs(void)
 {
     struct dt_device_node *node;
+    const char *dom0less_iommu;
+    bool iommu = false;
     const struct dt_device_node *cpupool_node,
                                 *chosen = dt_find_node_by_path("/chosen");
 
@@ -895,8 +897,13 @@ void __init create_domUs(void)
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
 
-        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
-             iommu_enabled )
+        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) &&
+             !strcmp(dom0less_iommu, "enabled") )
+            iommu = true;
+
+        if ( iommu_enabled &&
+             (iommu || dt_find_compatible_node(node, NULL,
+                                               "multiboot,device-tree")) )
             d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
-- 
2.34.1


