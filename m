Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7F2A55944
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904062.1311966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJJt-0000VJ-MR; Thu, 06 Mar 2025 22:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904062.1311966; Thu, 06 Mar 2025 22:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJJt-0000T9-J1; Thu, 06 Mar 2025 22:03:57 +0000
Received: by outflank-mailman (input) for mailman id 904062;
 Thu, 06 Mar 2025 22:03:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJJr-0000Ss-L4
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:03:55 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20612.outbound.protection.outlook.com
 [2a01:111:f403:2408::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e486e580-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:03:54 +0100 (CET)
Received: from CH5P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::21)
 by DM6PR12MB4482.namprd12.prod.outlook.com (2603:10b6:5:2a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 22:03:50 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::7b) by CH5P222CA0017.outlook.office365.com
 (2603:10b6:610:1ee::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:03:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 22:03:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:49 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:03:49 -0600
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
X-Inumbo-ID: e486e580-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3kh9HXqs3aLbsJPWEW2+pEOknZmI+NliByurJllSUbmXZpvz5khSM9+q/RVyh/ifju9Xwj4FksJzygBX4sgK+17b7WtPNYhsDFFrVHVp0N8Bs3sxCAdqa2+ZSN/6tzXbpEYwW2ca4f2tvLmdRqpuppclCQQ6xRNSWq6bANbfCORymJBNTZNWF20nIlrrCnMWWcNhQf9JQ7CWS1QRPlmlzUe9LkLuBBOYmaM8ESWkR6OB3fGRAe3NeDzwQZVuVjjMETuKXIunV3em/25w7efPrMZkhh/EmYt69lmh4+hiwPoS2Yb3/djNi5yKNbolpllaHPYgQGL5xyFAjvyMfuYQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7tJj+JfWBdt+nWeZjIonJo3rxvFv7v9MKH7jCHgkek=;
 b=U4mANfbnBSXMZ7SqWmjgps3gwAvdhhsLteTmFUv0FyJ1JrdS3K8O5YKKy3CUB5Hxpa4cEmdORaxf3ywYcgWPhMqpESnWTzqwVZP/C7M71/Y90lebgtu4EFQfLY4z78Gox1Z4WdaeM1ocdWNDVGPobutbcnp1s7YM9x4XEzrwN5+FvDyBooyfB9dGbtWWQOPhiQjGqdGeP95LhmjzH513v15uLfNzx894W1vz7Ova1c+x1bh3ZhsBjuZZeuydVtyrD6iCPv8XoqzGwAlC6FUJ5FLFiNTEk6LftTkxIb2I5/ifeQ/azN0zSu7Zgw2dBXqhxKU9zPj1+XJd0VQo46nU6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7tJj+JfWBdt+nWeZjIonJo3rxvFv7v9MKH7jCHgkek=;
 b=bSIxgYb+YWqIQX6a+yFPKFqkQPTfs2bAnE9tKgkdqWV3MPWPHzck5MFS5FFWwEhyTH74yj+S1HpLLRqcRZdIJa68Nj3W9yWNE2pD5oVZ+5qS4/5Frm5s/AwRtNs62zrkDYU0fEbEKcti5dpix1Ml6LXg4gPJa2jkaZo/P85kaak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 02/23] xen/arm: Factor out construct_hwdom()
Date: Thu, 6 Mar 2025 17:03:22 -0500
Message-ID: <20250306220343.203047-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|DM6PR12MB4482:EE_
X-MS-Office365-Filtering-Correlation-Id: 46f7c239-a419-4e8c-5389-08dd5cfac6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q1fg9cg7XKdyMssr959HzGbfx3RaN/hjlEE2nlvace4tPqm7cXMXeuYfoX6f?=
 =?us-ascii?Q?LKqvqiPIPTBwKbPnKS3HGIUBXFul57cxXXWJJer72FR0WP/b6XbIX8Lhqwzm?=
 =?us-ascii?Q?/zFO9R8grspwS0+UdzztYGO9jdF4RWzX96R9Ft1rbc4+te5qe1m8sYepruBq?=
 =?us-ascii?Q?gB/pgWEw8K1ZgEBB9NIlfYePaFde6jD8+nrUVshYjYkEvSt2EgkRiQYBTCCg?=
 =?us-ascii?Q?Csoidt11mKzTUzXxidvVM5skomXt2fi/piegZTFQeGLMp97Di/ho1haRYvQW?=
 =?us-ascii?Q?e/ap95IZt+sAxPkyfWcmBuwnl1vjl0yufGzN9e8KZUEDZ/I8WtNjEoiErvj+?=
 =?us-ascii?Q?4kMZ0QAA8i4b1qWyZAvZVWzSCz+LITTpj89iLaVmXLz9ory92oJQdfYWPqZJ?=
 =?us-ascii?Q?+1++tzrUQ44WztWpn7ZohxqDYYeCO3oWI1Vo8GiFUeHfeEjCaOOQuPnrWiW2?=
 =?us-ascii?Q?isUkSlm8eOhpk4mCN+z2jzyCch2RJTIee6A/i+XVnjd9hH8R9N+0VjXdgAz3?=
 =?us-ascii?Q?YRnjWRWp1IpVZDLMWCzBtJlw/GTLqyZ5octLRY/fHR/GUIZ3dlOb4LpBWI9G?=
 =?us-ascii?Q?52H5z0aR8gDueOdvxZojwgy2avlgiWoo0tEnXCC6Qzdn8awG0Sxu7FSqgenY?=
 =?us-ascii?Q?66LMKghQQ/n1kBbZ0GManfhG4nNI2PN0pToYpOElxDMyeGFwHMm0Aod9Gmp5?=
 =?us-ascii?Q?A/dS0n46rgViPFecSW9lm+Thgc2OOdgw2dd7oAiGDrsql+LNnKAo6uKhhAqt?=
 =?us-ascii?Q?o+L8aCRzMx9ugj701KT0FEIvLL0K2twPwZd1Pl06iRv6uwz9FMDHueKq2cHS?=
 =?us-ascii?Q?MkX46mz4qib5ZpkgN0zwGGnNPJeDMEwReF3Q0Wr/HLyS0auLN3Tf0rrel4Kf?=
 =?us-ascii?Q?G8sV9TkqwH/FJcDtL0iysgTItAxcxNpjFO7GQOYMf5w5LFJ3ny/39FJOg//V?=
 =?us-ascii?Q?r2HKEORUfrAxJ8iOBdRqxKz8AhtkuFVto+2vqeHmoe+W9iDsbKOdPJ07hs+V?=
 =?us-ascii?Q?MC3+xljHs/ohs4MQIJZBQf+pFxeAn+I11fex7F8yGv1qltGNWLYIFjkhGRqr?=
 =?us-ascii?Q?vFdgX9qlmTDBTUNaZI4xYSvbg+mXPytNTFNSz6HydCF3FXc2RcSKasxouV4O?=
 =?us-ascii?Q?IwWujuTf9GEfOIWCgfDJ4lcLAZD6KfA4DqOthtwqh0gj0i/cFM7AmbSjVMWi?=
 =?us-ascii?Q?xRL/yEZZNlNETfFS8OOWK/Ymu/G/iC3KQnQQUnUsaNM7UGlS3lksnZUGWRdo?=
 =?us-ascii?Q?IfEFI6viBq/IAamQcWibbekeCTvHN7t8PTIEn9+VPXykiDJYmojtpDcbCw/R?=
 =?us-ascii?Q?zwm8nNM84Z0vuI+fRzE58FA9GhtAZkwNK4Nq4nustZCtn9tYA8cQ3gxKcXsg?=
 =?us-ascii?Q?6HTq/WKq71EjYiMPIIcIlARyYzDFCWLFI394OG4KvDbWNvEt/KxswCpWcFBS?=
 =?us-ascii?Q?LPdYO6i8ZBXNMyX8BCdqXA0dIFJnvPeeviBX65+1dzF6gXt/d4QHjQVDi2b/?=
 =?us-ascii?Q?3/OiJUO74yjRrv8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:03:50.2883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f7c239-a419-4e8c-5389-08dd5cfac6d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4482

Factor out construct_hwdom() from construct_dom0().  This will be
re-used by the dom0less code when building a domain with the hardware
capability.

iommu_hwdom_init(d) is moved into construct_hwdom() which moves it after
kernel_probe().  kernel_probe() doesn't seem to depend on its setting.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/arm/domain_build.c             | 28 ++++++++++++++++---------
 xen/arch/arm/include/asm/domain_build.h |  1 +
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6784ee6f6d..d676422496 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2296,8 +2296,6 @@ static int __init construct_dom0(struct domain *d)
         dom0_mem = MB(512);
     }
 
-    iommu_hwdom_init(d);
-
     d->max_pages = dom0_mem >> PAGE_SHIFT;
 
     kinfo.unassigned_mem = dom0_mem;
@@ -2307,17 +2305,27 @@ static int __init construct_dom0(struct domain *d)
     if ( rc < 0 )
         return rc;
 
+    return construct_hwdom(&kinfo);
+}
+
+int __init construct_hwdom(struct kernel_info *kinfo)
+{
+    struct domain *d = kinfo->d;
+    int rc;
+
+    iommu_hwdom_init(d);
+
 #ifdef CONFIG_ARM_64
     /* type must be set before allocate_memory */
-    d->arch.type = kinfo.type;
+    d->arch.type = kinfo->type;
 #endif
-    find_gnttab_region(d, &kinfo);
+    find_gnttab_region(d, kinfo);
     if ( is_domain_direct_mapped(d) )
-        allocate_memory_11(d, &kinfo);
+        allocate_memory_11(d, kinfo);
     else
-        allocate_memory(d, &kinfo);
+        allocate_memory(d, kinfo);
 
-    rc = process_shm_chosen(d, &kinfo);
+    rc = process_shm_chosen(d, kinfo);
     if ( rc < 0 )
         return rc;
 
@@ -2332,7 +2340,7 @@ static int __init construct_dom0(struct domain *d)
 
     if ( acpi_disabled )
     {
-        rc = prepare_dtb_hwdom(d, &kinfo);
+        rc = prepare_dtb_hwdom(d, kinfo);
         if ( rc < 0 )
             return rc;
 #ifdef CONFIG_HAS_PCI
@@ -2340,12 +2348,12 @@ static int __init construct_dom0(struct domain *d)
 #endif
     }
     else
-        rc = prepare_acpi(d, &kinfo);
+        rc = prepare_acpi(d, kinfo);
 
     if ( rc < 0 )
         return rc;
 
-    return construct_domain(d, &kinfo);
+    return construct_domain(d, kinfo);
 }
 
 void __init create_dom0(void)
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 5d77af2e8b..134290853c 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -13,6 +13,7 @@ bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
                           paddr_t tot_size);
 void allocate_memory(struct domain *d, struct kernel_info *kinfo);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
+int construct_hwdom(struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
 int make_chosen_node(const struct kernel_info *kinfo);
 int make_cpus_node(const struct domain *d, void *fdt);
-- 
2.48.1


