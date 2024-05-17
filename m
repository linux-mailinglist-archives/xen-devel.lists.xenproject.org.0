Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F868C8025
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 05:23:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723785.1128867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7oBv-0006tE-TB; Fri, 17 May 2024 03:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723785.1128867; Fri, 17 May 2024 03:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7oBv-0006qe-Pu; Fri, 17 May 2024 03:23:31 +0000
Received: by outflank-mailman (input) for mailman id 723785;
 Fri, 17 May 2024 03:23:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6mIz=MU=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7oBt-0006l6-I6
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 03:23:29 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d34aecf3-13fc-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 05:23:28 +0200 (CEST)
Received: from PH7PR03CA0003.namprd03.prod.outlook.com (2603:10b6:510:339::8)
 by CH3PR12MB9283.namprd12.prod.outlook.com (2603:10b6:610:1cd::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 03:23:23 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:339:cafe::4f) by PH7PR03CA0003.outlook.office365.com
 (2603:10b6:510:339::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.29 via Frontend
 Transport; Fri, 17 May 2024 03:23:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 03:23:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 22:22:45 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 22:22:06 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 22:22:04 -0500
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
X-Inumbo-ID: d34aecf3-13fc-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n9e5/ovVTWjkuuRvPCpt/+SZKX1pA6iH5NwxqjN7Eqt9Nt9yOk7jUI6wYZgSB/loO8hslJCdDKWh7LTpBeG2aKtKYJaHJ0ItlkdbD76iKza/dlmY28J0bRomijpsvkrmK2TiIZw0VgIpZCnCFqjeNp2n3W7bT/dv+jd0X+xfRG1ohhLkOMPXiv/NVbQK3oUPsGZQZIhv4n7CE3w5YeYrB9DRNn8UT1I9MQwl7xRG0lS+UwBurs/szKjHH06zvuc2p19uiEWb6RMLJ35ZCRlW45GfQCAsuxOTNeh6p6qdNiGf1ZXGPxf61UPjeX1oXCNV/Xc/Bi9pk61YpVM7fDHCkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d07nHhnz+E2r01WFGPEt/6CKVIk3TuRy1RIwAxzVZg8=;
 b=NZvFQIvZKZIPVK7wUXoqVgCJf3IxmM2cLNB8VZDkPZQByKcyfuKcNW6XJMIRSc5L/MJlS3Iu6q0Q9I/DG0Qn+vR+S4ErIZlMCfoGUsmuK8T5yNTGpiUtKxj3/oWzaeno9hfTrDGxacR93qGMs2mkZf4Q5Na6RQCFQblh9aJb/h1U6YKmArS+U+gmhuOwi8lpXgqvbfgFTbIrxFxlsr//Z2MQfspV24ZDFIa3FbWKlgs9gO/tFkLA1YUUCJCJ9op8HWTsI+RNuiEUIvXF12bQ/tK3SGiufPRYeGFHkRcQLHhQkga2QP9ixKjvGoBJ5YAitsA+UU58G1paTqvplPNjSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d07nHhnz+E2r01WFGPEt/6CKVIk3TuRy1RIwAxzVZg8=;
 b=0agY+9cxmafoZu2T+FJeoPF8TsVf7XQ0Ruu8n39kIikZjOkbIWcfELta3NPO4Ok3nqSfXw9bnmcEGyG1xKWPIhL8PMaEVoAj0z/lnfISGvE6g9ZEMLwf7M1TUKTI6cWYX7FvO/a0iAqA5uCIytmYksR4WVgwWXYeYfa7WHTRcOo=
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
Subject: [PATCH v3 1/4] xen/arm/static-shmem: Static-shmem should be direct-mapped for direct-mapped domains
Date: Fri, 17 May 2024 11:21:53 +0800
Message-ID: <20240517032156.1490515-2-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240517032156.1490515-1-xin.wang2@amd.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|CH3PR12MB9283:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc80ec2-fb9c-48ee-4b07-08dc7620b527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0DvRM6rtOlsUc+yQyPL4++Ekav5HIZAl2PAdG83t4QVeqdODU3IDqyYVQVRf?=
 =?us-ascii?Q?GdGRrkXADLwEVljkA7fDmVoM5W2BqdAbpa1VhbqRh0mxoJuRdHaleFAM+4yC?=
 =?us-ascii?Q?H66jOMTehHN+eThX0zJ8FJ39ZCL2cfa/tleae6iwK7qvscIZtZ3jKblPqlRG?=
 =?us-ascii?Q?HYZF3Do1vYD8Mta0XM5KFpU5D4yp6ohjOYbjP/fmmlwIWFtXIbs4N6YnE5G9?=
 =?us-ascii?Q?5PIk9hfGP73Y/zfNc7wDN1VVhYEN3fWtk/R18BdrdsPGEm0z0zWCvuoifSSm?=
 =?us-ascii?Q?kZnzVE97tgV8rfRDLy1ld5ojXgARLCqzZGcIXUvUag6k1q6AWlO+H5vGH7jS?=
 =?us-ascii?Q?MSmnuWx/2BvUWkkGE4cDOtxT8Uwsgz8+yyTXi/We6nI4MomLpHiQ8LdBZfuw?=
 =?us-ascii?Q?OZyOrKV2sDWYlcivbk2zgWxKC+4Ha9rdozepOGR5L9hXoSw2FQ3QshD6RNxT?=
 =?us-ascii?Q?vNNG4uuEdQr5TngAmkzdcQnS94IhDhx8OaqT6ru4v75GC0q+75qwOXXPRa0C?=
 =?us-ascii?Q?z32ehEjopzgisILgkaBg5JLPxCJOd//COJ3Fj+twPt+7esB5VqSx/yRp8M1L?=
 =?us-ascii?Q?AdErgP1Oj2v6PHDCqNvvmyJ4Hu3JkU0tCkRDgG7Vkj2/jIuD0xT3JKiYxyiP?=
 =?us-ascii?Q?cuGrvn+tNVLzAYCYm3sB9b+PgYPwITRnqJnGkn0ESxxMp0A+6g3z3TrcuYDq?=
 =?us-ascii?Q?HTppdo334EZKES0qeyivc54bgT9Ld2z4spZSdT2zhAnUHb4gSejdyuLmAdOY?=
 =?us-ascii?Q?FKHhgv0ifBy8peOs7W4nUTzvWTT0BdhHBjKJV3FQsa/qVu2OixGzRnvKUrnY?=
 =?us-ascii?Q?1WIvWBPeLWk+7A9xLjVb2hOHRklI0wucgwSXTZJaW1pC64HOSzHXTGOlYEba?=
 =?us-ascii?Q?Qx2Xk9w1+0NQeWZ+hY0yBTsMm3rykKhs2AqrhW8LLzAi4VTsMwSdzHUaJ1ya?=
 =?us-ascii?Q?gKDIDKOD44oY41v6Dzt0a7zkJTkx/W6M45VbOe8JfCMaV++4qYnqZjmlmDuO?=
 =?us-ascii?Q?ldousSKri38eqFOnie5awiZNkirshQNvVT2z8rXPlTeq2EZR18zFeMYqbOwu?=
 =?us-ascii?Q?iU0BS6YuwTWtmBCq+nln6fWr4F+OJeHHNhuGuUGHm+58G0/n+MbEsE8egRTN?=
 =?us-ascii?Q?vdYN/ZgEA/FJ2XN24Zzzc0z7f0y7MGhKdH2Vn5OsS/8pcb3UwOUtZzZLkCh0?=
 =?us-ascii?Q?dIKZEMLQv00RjjcT8DImvCUDfMQXbx8EENxbdNJKaKblsi7hMOANtSdQ9KGG?=
 =?us-ascii?Q?MXayQmDfnBzf9CvRRsndu0myXPt/Gnxc2kYEaKOjAZDlPOS7bSNzw46etBxl?=
 =?us-ascii?Q?KAe9G6od+U+/7/MbyOO9NRbQ5b3oUlnsZP9A1l6l77LVSJNtVp0YoSot8Cyo?=
 =?us-ascii?Q?5p9fR1gtOGfewaMOoiJy4PiW3wC8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 03:23:22.9425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc80ec2-fb9c-48ee-4b07-08dc7620b527
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9283

Currently, users are allowed to map static shared memory in a
non-direct-mapped way for direct-mapped domains. This can lead to
clashing of guest memory spaces. Also, the current extended region
finding logic only removes the host physical addresses of the
static shared memory areas for direct-mapped domains, which may be
inconsistent with the guest memory map if users map the static
shared memory in a non-direct-mapped way. This will lead to incorrect
extended region calculation results.

To make things easier, add restriction that static shared memory
should also be direct-mapped for direct-mapped domains. Check the
host physical address to be matched with guest physical address when
parsing the device tree. Document this restriction in the doc.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v3:
- New patch.
---
 docs/misc/arm/device-tree/booting.txt | 3 +++
 xen/arch/arm/static-shmem.c           | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index bbd955e9c2..c994e48391 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -591,6 +591,9 @@ communication.
     shared memory region in host physical address space, a size, and a guest
     physical address, as the target address of the mapping.
     e.g. xen,shared-mem = < [host physical address] [guest address] [size] >
+    Note that if a domain is direct-mapped, i.e. the Dom0 and the Dom0less
+    DomUs with `direct-map` device tree property, the static shared memory
+    should also be direct-mapped (host physical address == guest address).
 
     It shall also meet the following criteria:
     1) If the SHM ID matches with an existing region, the address range of the
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 78881dd1d3..b26fb69874 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -235,6 +235,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
                    d, psize);
             return -EINVAL;
         }
+        if ( is_domain_direct_mapped(d) && (pbase != gbase) )
+        {
+            printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not 1:1 direct-mapped.\n",
+                   d, pbase, gbase);
+            return -EINVAL;
+        }
 
         for ( i = 0; i < PFN_DOWN(psize); i++ )
             if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
-- 
2.34.1


