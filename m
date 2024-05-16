Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDBC8C7454
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722992.1127481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxk-000614-Rb; Thu, 16 May 2024 10:03:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722992.1127481; Thu, 16 May 2024 10:03:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxk-0005xe-Ol; Thu, 16 May 2024 10:03:48 +0000
Received: by outflank-mailman (input) for mailman id 722992;
 Thu, 16 May 2024 10:03:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MS9v=MT=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7Xxj-0005ER-DS
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:03:47 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94896344-136b-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 12:03:45 +0200 (CEST)
Received: from BYAPR02CA0028.namprd02.prod.outlook.com (2603:10b6:a02:ee::41)
 by SJ1PR12MB6268.namprd12.prod.outlook.com (2603:10b6:a03:455::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Thu, 16 May
 2024 10:03:42 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::21) by BYAPR02CA0028.outlook.office365.com
 (2603:10b6:a02:ee::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Thu, 16 May 2024 10:03:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 10:03:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:39 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:38 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 05:03:37 -0500
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
X-Inumbo-ID: 94896344-136b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNrI7o2xjMNkq21QYDZzguE6Bz7SOkDDO4Fy5LXSna4r1/7+gARcEoHgXuJiCzaonF6lqw1opEybh7lZhGeigrlhYRbgW3pfnm9R7cZ78VzeDiXz7WWDveD7KA52AmA9y/1QIfmvAFwZzDIosAFIjLyshZYsJ/ClJx3ZOWALgpYJkUcYn7Pew9VAoEB5aSFvtJ26d7/fTzY8gdXem1+g3jD/z+HbC33fMYsF055ng0NuQ3cl1xe+Yn2QCdowDkUwVW/CTDeCdpAV4/u9wlBmSOIAS7xw5hxbbi01bqp2TZiMDDv22JFVfbAAZCmwatL4pyGSrv/O3HkVdZ+s1dHWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FOmUBM5q170h0MhyoHdpU1Ky6atwZpLP5xhhuCrh8w=;
 b=N1LFR8bfk3prN+aYNEQ9M7Q/a+nG+KH16btoCgBT8w4IgCv0fJnzbz4KsiQ6PDfeYUhXBOO46WbrA2EPn6ZjD90Bk/orXgTbsmsFaIk0RjrQeEh37KE3ME3eKT1nPEWtRV6Y/qYO4qvPF/MkixKV1ruORTT1lo55gYkF6Hinq/wMh9bkOhipyE8wY8BsN1ZY9bhwPoff+Jd1B4nuDqFDOIlECK/IwzUl6wXchCGCKpzJlOwbKctWzWE6SaFkS52+RlMP7V4vHgdlDT4dI38Ume5h1shfPLyqy4Jc4a8HOkgQUc11zFYmWDPLKBv8MiWZek+Ohh0KwHYL52ES7ZN2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FOmUBM5q170h0MhyoHdpU1Ky6atwZpLP5xhhuCrh8w=;
 b=JXJoBe4xTAOMCFxY81+f73Gq61Ikop2fzkTNhKKqgIn/SmcK2hnACZtYJlXKVsgI5WxJa9JOtmFX6oQ4FDWDZslhnTnLKAzQ81fee0wQ3hU7YoCFEklPDOJxOsWP6ONABC7RwTQ06/T8ajGyLkBgVULzWKPVTiBTBfo6IuCoLME=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/8] xen/arm, doc: Add a DT property to specify IOMMU for Dom0less domUs
Date: Thu, 16 May 2024 18:03:25 +0800
Message-ID: <20240516100330.1433265-4-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516100330.1433265-1-xin.wang2@amd.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SJ1PR12MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c8c6576-5a73-45d8-2bf5-08dc758f7767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p28vscojw1AxysNMGx8aJEqRwFe5dHP0+wm4yebhfDLEBSwOCT5alRUt/amg?=
 =?us-ascii?Q?hAu91/s145djjhuge+TqvSZJ4kBDEOdKSNl/DIeXI/p2OItssMaAa5JTBUYs?=
 =?us-ascii?Q?pAli7/7nxq51fWR0ZTE3nADl4RSPgdDZ3/8LlftjnPtZwVpX4XzljWWleQX6?=
 =?us-ascii?Q?scSLZOTYPic+PoZGwmMVzck9qhJ5cIhIWjD/WDsVNl+SdZ6NNw+XmwXQEMBY?=
 =?us-ascii?Q?5o5xzjX30/PvV2XE4ywM0dPoeS9Iwg3oCPhC1Td00IUiqTlBlEzVdPPyyKqc?=
 =?us-ascii?Q?rMtPEzD6utq+t9eo+zuE62N2Fy9Su5EeQMzq/r1t1v/m3wq+JWrJE9n//mqL?=
 =?us-ascii?Q?d8AeuTFSVGb/60Ex95qXrd0ioaRGvwwyHWKooobg5GAGq1gmLyJWnPKhrSii?=
 =?us-ascii?Q?jp0RVo7Qq0/r5e2vi2X48HW6/a40LvCby1DGrBqikUfI9M04Qdb5hOQ7zz9U?=
 =?us-ascii?Q?5LJZt5nnQ/TD9ugk+xv/i1xx3i9xVPDQ6/SmBw8MijA/qKlN/ViVRey0SSCV?=
 =?us-ascii?Q?A+6TuPiWbMK5u7TIcgesfg79Ct6zPFQxDWD7n4vtrsblRuqhwKwj5FOxh2q7?=
 =?us-ascii?Q?Qr6+VsK5r/+nvagholt2ibxfTtO4agqSPusVwTA0UTMEumthvQ7BOvk5QXq+?=
 =?us-ascii?Q?NYPD8WB3DhYDLrTr7clIibk5utgekSuJOwysbiuS7lPV11cxK11S28NU4khE?=
 =?us-ascii?Q?E/rXAzag9X64tCOoTSPS0U7wOn6nSZYw9APBuLW3SBRtaA2tj/I3cMbCGBQA?=
 =?us-ascii?Q?cfVwErQh0bDEjqljAr1wLx262L8P7IAGzTc5bFXCRdyN42TVmGqQIG65c4Zg?=
 =?us-ascii?Q?ZMXWa0sWyTkXYLD9gaMD9mo2neWtZVKcMSloVkwdP3nbXlYuv7nNM/qDe7Zb?=
 =?us-ascii?Q?9KqKAuOH5OhMnMLoPaCg+zn3Gu1o49CFYuYXShKNbtsv/VIDVgOTMdEAYfst?=
 =?us-ascii?Q?yqozVHxHP5m+kgtYVctZ6XzNH6QqvCkwtMO4U+pEmvo6fbNK3I/BVIxRyXTd?=
 =?us-ascii?Q?70aQe69m+1d889gvadwl0Lv1QavskBNMqR6XgLnjD8m9eO7PbTBofrA5wKqo?=
 =?us-ascii?Q?6rY6M2q+2KxzNhFdSky8KCFeoDN/cup3AGOiy1cr4e9cGYt5Lid2yD7JKrI8?=
 =?us-ascii?Q?wHtU4vfvXhQkpBfP6iMJbIMGSOXPFzLy2lbUlTJS8tWd4TbEMCq/pluiZzZt?=
 =?us-ascii?Q?IngpgNwInN6omMzHT7QK4+lisTuTkbtv2aQqepWyKoi+7825VIW3nchUIx6z?=
 =?us-ascii?Q?Ko3iL/PpMX92v91m0vIfWZmnaQOlc8x0YoL1HsLSFlwDo7lq6NlmchUxZ7Ny?=
 =?us-ascii?Q?+JzJBRRa6eIUL7AIoEPdUnYQV3QaZJHTHun2XtydAMWYOFkKGD4pTjXDbMLm?=
 =?us-ascii?Q?pZmq8WVnkkoUopqBRz00x987xTrC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:03:42.2384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c8c6576-5a73-45d8-2bf5-08dc758f7767
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6268

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
v2:
- New patch to replace the original patch in v1:
  "[PATCH 03/15] xen/arm: Always enable IOMMU"
---
 docs/misc/arm/device-tree/booting.txt | 13 +++++++++++++
 xen/arch/arm/dom0less-build.c         |  7 +++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index bbd955e9c2..61f9082553 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -260,6 +260,19 @@ with the following properties:
     value specified by Xen command line parameter gnttab_max_maptrack_frames
     (or its default value if unspecified, i.e. 1024) is used.
 
+- passthrough
+
+    A string property specifying whether IOMMU mappings are enabled for the
+    domain and hence whether it will be enabled for passthrough hardware.
+    Possible property values are:
+
+    - "enabled"
+    IOMMU mappings are enabled for the domain.
+
+    - "disabled"
+    IOMMU mappings are disabled for the domain and so hardware may not be
+    passed through. This option is the default if this property is missing.
+
 Under the "xen,domain" compatible node, one or more sub-nodes are present
 for the DomU kernel and ramdisk.
 
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 74f053c242..1396a102e1 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -848,6 +848,7 @@ static int __init construct_domU(struct domain *d,
 void __init create_domUs(void)
 {
     struct dt_device_node *node;
+    const char *dom0less_iommu;
     const struct dt_device_node *cpupool_node,
                                 *chosen = dt_find_node_by_path("/chosen");
 
@@ -895,8 +896,10 @@ void __init create_domUs(void)
             panic("Missing property 'cpus' for domain %s\n",
                   dt_node_name(node));
 
-        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
-             iommu_enabled )
+        if ( iommu_enabled &&
+             ((!dt_property_read_string(node, "passthrough", &dom0less_iommu) &&
+               !strcmp(dom0less_iommu, "enabled")) ||
+              dt_find_compatible_node(node, NULL, "multiboot,device-tree")) )
             d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
-- 
2.34.1


