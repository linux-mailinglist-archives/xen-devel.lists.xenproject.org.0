Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 031FD8CCD2C
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728095.1132882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34K-00023D-57; Thu, 23 May 2024 07:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728095.1132882; Thu, 23 May 2024 07:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34K-00020L-2S; Thu, 23 May 2024 07:40:56 +0000
Received: by outflank-mailman (input) for mailman id 728095;
 Thu, 23 May 2024 07:40:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Po+=M2=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1sA34J-0001WY-5o
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:40:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8a1b593-18d7-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 09:40:54 +0200 (CEST)
Received: from CH0PR03CA0317.namprd03.prod.outlook.com (2603:10b6:610:118::12)
 by DS7PR12MB5718.namprd12.prod.outlook.com (2603:10b6:8:71::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 07:40:49 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::9b) by CH0PR03CA0317.outlook.office365.com
 (2603:10b6:610:118::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20 via Frontend
 Transport; Thu, 23 May 2024 07:40:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 07:40:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:40:47 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:40:46 -0500
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
X-Inumbo-ID: c8a1b593-18d7-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BENyBqWYcm6Pq/xf854269+YaTfuU2GK/+p0Jnp2PKwUYsar2Nz83urLx3jCEj/L5ueXm1O5bTu0EAnIfASZBaRWjtE2RQowQqBMaV2rTC+MxlF38pTt5w9B4FEhhcSuovXgYdg+28i2a5rOLDeYWk3+FlBuQl3MTcGTxEROSFKSp8+ZXMPp42m75LnB4QLA6D1HthnMAWk9sU04CNsrAQgdOJgATTDE0n+D4ARNBfzzLSywBYE7HJp2N6f3jxGEN1+vwteRxZNjy1wxsKuH5k8YyRfIMUVvNXF5Qr6LUFE2ggRGlUQOXEj/6lfKoVBXDNdWFZyOa4GXjnzoTEio9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PvDoXhNpQSv0AS8DYv80AMDNw8eCiT+reRuwP+9FhI=;
 b=hbyVjSNL2HvF+bDJjnSDNSm4BtfimDM57P7OMhiL/VzPvDsYffq1kUjLm0+YOrCnTuEqelgJRq/3sdx8zxpyxxL9irtgAHRD1V6rdRYLNMKQGqwM9pb4dlwTjIlKlUixLKN7fjGa7KfGNKfzZzoR4XYq4Rq1nx/bWwDiLckRgtWmhVNAI1l68rm3ZaxbDVLrN+yTQFKVMByiRgIL0f9Lc8yHsDM7JXVooR71Kxgkf7nz/X03jNeiol6FjpEIOObsQjv9dOQIUbdklfawbNJ/qS/KCqpxx2o+KNOMtuk5GDx7CB6DZcWXpfUDmMJw4DhsDBQoCSnnne6kN8Lc/fqu2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PvDoXhNpQSv0AS8DYv80AMDNw8eCiT+reRuwP+9FhI=;
 b=qC4v2zWovjYwQYxqAG6rfZZkoNEEk79LhoDTTOaW1l/azRRqFDmG2QZ3ISdtF4lKmiQNG5Z6ZKnfq0U0oR/YQjOjCTeIskaCWLoOcabEhsCRE4qOSs2gL7C1YdrhVsdA8PccVZfbR5h+WYKsRq4xcxhKiEwr+/XHJ1fb+HEt4xY=
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
Subject: [PATCH v4 2/9] xen/arm, doc: Add a DT property to specify IOMMU for Dom0less domUs
Date: Thu, 23 May 2024 15:40:33 +0800
Message-ID: <20240523074040.1611264-3-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523074040.1611264-1-xin.wang2@amd.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|DS7PR12MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 857a9ee6-1009-4bda-0eb6-08dc7afbaa47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fFIyXY5nh2IaKIY5JtE4otIB+TL2D7QyIMTc6XQhKjU1adF76KFbQXL7Bd4o?=
 =?us-ascii?Q?jsFp1ThFKMlFIh6R2v0cnjhwFNXcfg3UDwgrZdCOwyzyQZszt7HrZpKZ/HKl?=
 =?us-ascii?Q?gTAKwcadTSjEjhRSOzUn7kWQXonrqLdONgNpBoA1SB42vU+uaERhIj41qdMl?=
 =?us-ascii?Q?wc7JCnaXe+Dl65CNAHQQ4EvQAcQxFsaCXenh+AAY3xjDiAgP422tD9te0kdS?=
 =?us-ascii?Q?oCnmhuI5E+vgJlqu3Pqx9ri4waOpeUZW5yi8ymU01Tk8FWTmfv8TrTYOvE9L?=
 =?us-ascii?Q?vmPj2IBZe9y0K+jQfl1e7GNzjt2Pb+iEOFMgIc10hnq1cdHWk/MQoNojL4vf?=
 =?us-ascii?Q?iQlqn7xUwUZ3Gw7964X55sAkGxZvrK+auGL7rjY4F7RJ0AssayHr4v6yH1Fy?=
 =?us-ascii?Q?sqvNrPSLN2kFm9VB4rVIeSHA4cVlhNBHC8gysgkDAmzkncjEzUzOd+NkOrO3?=
 =?us-ascii?Q?YIVowO/vDEx0qk9ToCA6HRMm5BJOFze/1N63TU8C9qeXwwgdq4sFzhmBFkXN?=
 =?us-ascii?Q?kQIKyu2w/y0nuU/XmiYKXpWi9eLSpCVtFSWr9pphQDfuNRWQbPIZQjexSWYT?=
 =?us-ascii?Q?mYHKOfRPsPKwiRBXxUoYtIeF8QvyOACNuOk9SZ2YLQ5+Fcr1A7Pl9W1FYHeA?=
 =?us-ascii?Q?yP1AfIXKu7fcssmdQQ64QejV7+dicu3iSsgDYwDCaER4oGSNJqBalqix2U7I?=
 =?us-ascii?Q?Sn2Wbiqs4KB7xe4X6N1PhyiLNGlZfPGiz6SfPVw85BgHbpb3A88yLoIMAGXN?=
 =?us-ascii?Q?IVY66NYfrh4wUyspjBLCF6cwPVRYPFLwAxGuBc7xIseDZv8yWd2LJTqp0lZK?=
 =?us-ascii?Q?4b8or9EmSQSTAXOAb5EGsZO6bqe1LJ1DT1B/TA0N66jZkXn1i5AMe7+ptH+i?=
 =?us-ascii?Q?wkymHX9jnsp75uKbx9+XAkbLmif3VfjOPeeo70ssCZqgwHGyxtAqEA1BDS66?=
 =?us-ascii?Q?5zr0dYiKqhxkiCfmTBsMZTu/CZqVvAVq/nxz0PWNrel1SA61cMvfB+vCtH9Z?=
 =?us-ascii?Q?UgishP6mhlzVUY4qVRIeH9fLag3ZGLld8Ct+gsyHOy4eIOnN6ltKkpmtEiSn?=
 =?us-ascii?Q?m4fs6pxbApFin2gZRF/IJxbFF0dnN5dmd6lQXl2u3dDjU+zk478H36pdXO04?=
 =?us-ascii?Q?b6jBiJJ1GjBClWuJsuUdIbSFOscGXk4NPJHj90xniQ45r1hi2ucuIt7kBYrW?=
 =?us-ascii?Q?M7sBNZ7Je3oFFNGsQuvqOS43+nCe5mKInfdyZ7xLO1o9dZzFPIxC27dZEKZs?=
 =?us-ascii?Q?9OJFydYElttwLsO/MOtwT0RI426znyPFwFWlXlpNHJNTlIw9xSsxeTchdXdL?=
 =?us-ascii?Q?7bsQPQQyeb4Q7q50WHI0s3SZb501MLa3qCmTeTz+Pr0HK2pNXUKPm0JwJzVg?=
 =?us-ascii?Q?r7yISToomKmTX2UNRiuX47stH1FS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 07:40:49.1150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 857a9ee6-1009-4bda-0eb6-08dc7afbaa47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5718

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
v4:
- No change.
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


