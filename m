Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFCF8CDF6D
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 04:18:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728984.1134084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW2-00040q-K6; Fri, 24 May 2024 02:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728984.1134084; Fri, 24 May 2024 02:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW2-0003vW-Fz; Fri, 24 May 2024 02:18:42 +0000
Received: by outflank-mailman (input) for mailman id 728984;
 Fri, 24 May 2024 02:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAKW0-0003tc-Nt
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 02:18:40 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee563b6e-1973-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 04:18:39 +0200 (CEST)
Received: from MW4PR04CA0088.namprd04.prod.outlook.com (2603:10b6:303:6b::33)
 by DS0PR12MB6629.namprd12.prod.outlook.com (2603:10b6:8:d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 02:18:35 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::57) by MW4PR04CA0088.outlook.office365.com
 (2603:10b6:303:6b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Fri, 24 May 2024 02:18:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 02:18:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 21:18:30 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 21:18:29 -0500
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
X-Inumbo-ID: ee563b6e-1973-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3WIzEpIHCPlXtoXUXhyn/HedDkRCrCvBT/QC58XOqfNHcZ03lmY6cm+XorMsd9+SVcQ6Ar4IBTc5D1nUIETuu88KwH7rqpxbspJXNqqHEBn9n7hrOLu170rfMy5dgsbZrUXPYF3VuSofJsgPKpjhsFr6API/kr8E3uXxyX8ai2BYhZinzGYFMETz4jHYkbbr07EbqBi1+mFfDZ/8akekNhCN2tOYE5nuS3plGJ1cg22t5XZbnO5agCHeBRKKa/VtAyH08jAQ2Fuy0Qm9GUkKGqPBax3wM33K3ReECjYTBV8rlizs5RWEdVxsvFGvZw+fD63WfDf4xshF0XUgHVO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRJXSt/i9q6c1C8Y7abmDgKw7TBf2B9wiQ/rWE+b2Go=;
 b=CG63nlEYG1l25gWL8g6nobKFBpKDm4Sd8VuOGcj/t2NKQvTRrkcAy5E4Whj+1FxnfblkZWhoyStb/3Xvx8HQKTihkwJLdvhttNr53VbANBZoY5c81bFdXCXdGEiMaktQ7Zbesyk8wg8RvJOe8cNApdCLqNIn/xpcQBVzyGsBsinF+qDPuyszjMH2x17i1whbtV44F7/FYC70Gb4rbKObBWBH2NNSZVovEneBGbDCyAHbG8nlIONaVAVK4m49nP31cyJXiqr5XE2IY4TiKeabIy+zYaMSvGySaCTX91udGXpa6PzUkRTJBSteUMgf3e+hNpxyIrIu1PXymPb2odJukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRJXSt/i9q6c1C8Y7abmDgKw7TBf2B9wiQ/rWE+b2Go=;
 b=zjhRv5QNzmd6ikViC6Ww2u9xJ9EPI9RXq1n8ziDkhHxZLw5bz99FBgkkRJ4kXPTz+33n3Z+4hlBxl1fifi9E7rptnZUqtuvUpvi0J6EL4PE5i8ougj+X0PdIOu/QOJ6wMY3ND4SzM6uRU5bBzDo4fW/7ihfaF1v0Pt2QKQb1MkA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, Julien Grall
	<jgrall@amazon.com>
Subject: [PATCH v5 2/7] xen/arm, doc: Add a DT property to specify IOMMU for Dom0less domUs
Date: Thu, 23 May 2024 19:18:09 -0700
Message-ID: <20240524021814.2666257-2-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|DS0PR12MB6629:EE_
X-MS-Office365-Filtering-Correlation-Id: d30934c1-8e23-4436-4e62-08dc7b97cfbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZhWZs+o9k/4kk5rtRKSY62PMffnLmD5TNjCHCUppI8IrLmLkm0MQSao8twv3?=
 =?us-ascii?Q?v/M8mREIxzJKLtxT+fd/R9xS/vDnzL5rxyPlYTpbEten4/YspKOHqhUPoNiZ?=
 =?us-ascii?Q?ZYwB+AJIjgA02ixesTg+HSlgSX/XdrHqYfJf+3pImFS5j6FRu8QYPWJFdIHp?=
 =?us-ascii?Q?PDwQn2iXrD+FaU0bGVzkomDuXhPdgEHjtuwY2EPDhC03MY74frnXwAY/J6pz?=
 =?us-ascii?Q?WlrjgRqG16NDJWMDn2F0x3T4m3cOTVABJ/go4/Spdbi2gxD6bx0TY+R926oR?=
 =?us-ascii?Q?2IrwbsV6JDO56Ggg2xRG3GJZ3joFAbcVx4YJNeYU76or6tLQiL5CbndFCKFL?=
 =?us-ascii?Q?tqdDwtd/P+Gdxvb91SvNzuMb5Aqy82ccai38e8BwBzNW5x80UtvmLDWq+s3Q?=
 =?us-ascii?Q?+8+7b7wNr3unv3tBxDXWzYLqhp+XPk+5mtIM3fh/fy1bn92UeN6d0VZEvPM/?=
 =?us-ascii?Q?Y2GE3ZTzqAVyptCBe7OdPLOVbKp5EzPR1GcQ4ErOK5vHoAMl1SmKmor7A2KQ?=
 =?us-ascii?Q?ZLQfqr/nva9Q3Y8fQCtyrbvQ9UlZUPFjfN6hV3FDPuFwd2B3RNxgrbIZajJa?=
 =?us-ascii?Q?O5tZaJVIq1f3ZcbpBCc28olOOCY4+LSxGiBuuOi1RckddiVk961rR4lCLn1i?=
 =?us-ascii?Q?xOtLTeQnrYuXVrpE3Ebu/isr0QQibxK0+Pdq3FRJHIe0tW9UufUEY/6Q2FEI?=
 =?us-ascii?Q?X1Qvp9aRinAJUBm+CLO516Fv5jhJvgfAxIF9KtFOadu6z4XUfYJyiuhehQxf?=
 =?us-ascii?Q?ZRsnLmTSmjZStQYRbU44H9SIoNzrY8wt31RohdG/hm4kA+bp649lPo3Je6Ul?=
 =?us-ascii?Q?/IUOGeIaCdboCdT6UHtv96EtDdY3WZiOZ6VrsprnAkYvrkhBcdOapZdnl8U+?=
 =?us-ascii?Q?otR0KGob++MrgNOn8XDmwI3etKXNeVDJVy73b8GpjVwig3NbPXLY3hlgRgOU?=
 =?us-ascii?Q?iXZC+eevJ4AbsKKA22xq9kM4P8KHC1rlaHng4QZcfMR03a0dIsYiMQQfJIK8?=
 =?us-ascii?Q?cjBVWEmXU7Y3McZ7iLKtmnHcZg1YpZs3P6ckme0/F39+MvCUfL5PMF7lWH6z?=
 =?us-ascii?Q?wVTof09EeBCRnw7oqFvY5GZyyLv1QE8ZiPFxhMQ1ftkoBS7IBdFbxwsFr1fv?=
 =?us-ascii?Q?/wUkdNNsupJv2moe40FCWG+7XHob7LI3JdWxdj2solkxk2th/rdaQCxufZw4?=
 =?us-ascii?Q?qPhVMSWYjnxkEQcFVfQ1nX2I+iMXt4wlOBAo8mgqPEvtYdblPOd2WxQntlL/?=
 =?us-ascii?Q?a/2NvEoEl49qZGiZnR1a21SZnk5Snc0fFE0e99rhf9vsRT0rETwjKex0Mox0?=
 =?us-ascii?Q?AvzgcU0eYtdYtjqC+RiLo3QI0IzErkIoGwAWa220Q3ZJDSg1IoHMQWIEiZRW?=
 =?us-ascii?Q?u5Q7CZC78OW5yojAaPlJPNBnWPqH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 02:18:33.4060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d30934c1-8e23-4436-4e62-08dc7b97cfbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6629

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


