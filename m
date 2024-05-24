Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C228CEC5D
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:17:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729890.1135233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDj-00008q-Rd; Fri, 24 May 2024 22:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729890.1135233; Fri, 24 May 2024 22:17:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDj-00006Q-K2; Fri, 24 May 2024 22:17:03 +0000
Received: by outflank-mailman (input) for mailman id 729890;
 Fri, 24 May 2024 22:17:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdDh-0007Iy-SJ
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:17:01 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5761ee32-1a1b-11ef-90a1-e314d9c70b13;
 Sat, 25 May 2024 00:17:00 +0200 (CEST)
Received: from DM5PR08CA0042.namprd08.prod.outlook.com (2603:10b6:4:60::31) by
 PH0PR12MB7888.namprd12.prod.outlook.com (2603:10b6:510:28b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 22:16:51 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::a8) by DM5PR08CA0042.outlook.office365.com
 (2603:10b6:4:60::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Fri, 24 May 2024 22:16:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:16:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:16:49 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 17:16:48 -0500
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
X-Inumbo-ID: 5761ee32-1a1b-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HglzBUSu0Q3uLWrJxDq4dyGWmR3pEAjys9pbN6rERGCSdO8hH/HEyQ1/N0Ni3LIeYLlkglg981luM1UuEDf+b6fIlgkRvFNTcD9MA47iYzppFucr2Qlx5kC/e819XcBXvW9rPmFkxwjKHAsurg21PEGevJfH+dGhFa0wfBL/Ew8A944cI5DRopBnbc13FIh4Na3Qsnhv2jXynWcKDezjNDR6U34EWAvfAf4Mvx9lbouLHuhxuOtY7M3XLi9EDjZsPE5rVLv1DV2Wf/7EQOnuuUGOsI4WqYoqvKb6sYjlu0bCCzUOYUferjo/z2KujU2Y5tS0bYaOFR83xoOs9uXktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRJXSt/i9q6c1C8Y7abmDgKw7TBf2B9wiQ/rWE+b2Go=;
 b=D/JdGi+CtOOBbF8Anrxl7pSdmvnLsoE+IhUc9SJ9OXzBF+hO3lw6Haf6oVnzRzLCa4nfnNngS7Hu43T0lxLQqHfSL0URPwLQ1OybuI+KVYc/ZPGEMHbuWMVUv46M4uaYMiULFyoNk3wctF9yv3bl8+rAorB1wlBzF0T0wUs3nJ2jx7dT+hD45+5Tm/3OZDPU/cNHOMHrBpgk6/dpj/KYR9YZ6DOqCSbuASM0uPDIy5Fm0BU7i6YrAjLfDG7hGqG+6k5YzbR/TeKkb1oi3nEIR4se4/Ua63Hb4OTQV++50eS/ExcjjBb3dBLe/bBf0z/86Gol1+8Ujfl1uyOsYEg2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRJXSt/i9q6c1C8Y7abmDgKw7TBf2B9wiQ/rWE+b2Go=;
 b=kyEbJu5MxFV3zc8+DDSkzY2Gt4n/wMqXF4TCPw+k6xPNtV9FdJAKdUFOjmNdC191AgLFovxVICh/8BWZtLVLXSkYy/F4qu2IjMBIwZhnED4PFn3C3QZmlrd+rrqRbjY5/yqErTrY0VMJKJAEsq5j4rgombQNFg6+rQ46Y6TG9nA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, Julien Grall
	<jgrall@amazon.com>
Subject: [PATCH v6 2/7] xen/arm, doc: Add a DT property to specify IOMMU for Dom0less domUs
Date: Fri, 24 May 2024 15:16:42 -0700
Message-ID: <20240524221647.2860711-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|PH0PR12MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: c2982c3e-5f43-45cf-85fd-08dc7c3f359e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VnEuSgH1Nm9hpjmMVJ2Ssfx+PXLQKIGbFygjMcZWfXmTX6CZwojlSidlxN8e?=
 =?us-ascii?Q?EKmu7MIaZFZd1EgPWGpaJItUmEz/oTpI+vCib6LJLfpVkhucRFFLdRM22cT2?=
 =?us-ascii?Q?lvFhaNWgMvKr/d0LinGaY2RmTOJB+XzlJDdBe1FJ99mo3/xbAbjLq6tFKJNh?=
 =?us-ascii?Q?54AkGtA0c1AgDZoToClT9VtYrl949DVZxt8YfZjKio8QDHtcPXGiKs2kXBDi?=
 =?us-ascii?Q?qbsM83ju+J522cZpG8kmJuz18/4XmSKeRulnlY4XIto4lsfTeKNuDF1NWU74?=
 =?us-ascii?Q?LgDq2FXA+j88/uXig5QGpZRuVRBM6q6KXoFf/BfXxj4KxdfAS6QwYF0mW1XX?=
 =?us-ascii?Q?fAi9vyf2pPs03ZyjMearB/kuRZeh1qo64Bc8qWyg6d/Wen7ohzO8AyAA1egE?=
 =?us-ascii?Q?EBoukhdxuvPztyLuVpb4urhPSTmkTmiSpzPd8JOVKXinojs3Bo8dwicFs61b?=
 =?us-ascii?Q?sWFpzsFmtPp6GjXrkBHiDiRDrrfTxBP3/MqVGa0i5CkIyN+vT9A3usprz96z?=
 =?us-ascii?Q?xKrPpS921mOyeWomn8VuegPyipqvGUZPp8VvyF+XDjhCd4cG1vPqUOfWU7Bz?=
 =?us-ascii?Q?2tUL97e8ubOSS/yss7syRmtrf5utsVO51Vp63RzZdS7taEcqg61QmH0G7/4c?=
 =?us-ascii?Q?ZR5u0dlZZmm6IkyeLsi/OayOY0kgxHbKPCgBL2dcAIinJlk56zctwgPcD6YT?=
 =?us-ascii?Q?T27bS82XfdiHk1AZ5+Po+f00bfpEfNbroqxjgKfdzJpNeZd4CT4E59KPHwzN?=
 =?us-ascii?Q?TialEmqMXu+ZUpP3pX1yaKtoGftqY8LP0rfZDWv5V/Nx6kwbMR3C/laqFaSc?=
 =?us-ascii?Q?ll0162PheXCZjSjOKkTXoWvlHnjD97HTcORnQZ0LtDPyk66g1J+UXC8/dE7b?=
 =?us-ascii?Q?Zj2U4xu+KdsaGViGw3pA7PuXW3V2M9hpOHP+0wORWfmvQ290oXJFkf/MvIrW?=
 =?us-ascii?Q?3dGQfbxlcAtD4iwgswkLMdsv04ZAHaArU1d6a7zCG7aO2gIX7oEiJIMmnsyj?=
 =?us-ascii?Q?hAJYdvjPyVEviZmVqxkolrKo4U8jkXar/oXXMq/DY4/GyE/U3LtaOLn8QQ+J?=
 =?us-ascii?Q?dq/OfG4Zx+5KoUBEC+/Ik/YKe11c8pwi2vgpmtwukpVTPw9Rbftu63Zxz0zq?=
 =?us-ascii?Q?DwTKIsmyIlpqvdOJ8np03B2bv+SzNPyCBU0q9mxkq/GbgDYhhrBXV+PEEmqy?=
 =?us-ascii?Q?UwS1pXk+FppK9hLLu+1MbMOP1QBaa6Eh/nbcforwtQbGwsEQxiLAEJ4xHDHy?=
 =?us-ascii?Q?wGsyKWSbTZf+gmN9WDMqavy7dcK3CEfqcvGHw0dwZ2UxlUrhloj+Yld9h2xh?=
 =?us-ascii?Q?wXhSOUjdMEH0hslYOF7fu3aJnM/49ZcCOhKf3TVtjvFeJVEHam5dzp0K62Dc?=
 =?us-ascii?Q?fE/pDOwDhJiFBIt08duxCU2T2NTZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:16:50.3039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2982c3e-5f43-45cf-85fd-08dc7c3f359e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7888

From: Henry Wang <xin.wang2@amd.com>

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
Reviewed-by: Julien Grall <jgrall@amazon.com>
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
2.25.1


