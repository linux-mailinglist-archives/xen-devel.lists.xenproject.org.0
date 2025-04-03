Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97017A7B19A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:46:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937340.1338352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOE-0000cU-Og; Thu, 03 Apr 2025 21:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937340.1338352; Thu, 03 Apr 2025 21:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOE-0000ZH-I4; Thu, 03 Apr 2025 21:46:22 +0000
Received: by outflank-mailman (input) for mailman id 937340;
 Thu, 03 Apr 2025 21:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOX3=WV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u0SOD-0000LK-Ba
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:46:21 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:2417::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12fde235-10d5-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 23:46:19 +0200 (CEST)
Received: from BN9PR03CA0965.namprd03.prod.outlook.com (2603:10b6:408:109::10)
 by MW4PR12MB6973.namprd12.prod.outlook.com (2603:10b6:303:20a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 21:46:14 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:109:cafe::1b) by BN9PR03CA0965.outlook.office365.com
 (2603:10b6:408:109::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Thu,
 3 Apr 2025 21:46:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 21:46:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 16:46:12 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 16:46:11 -0500
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
X-Inumbo-ID: 12fde235-10d5-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8ZOCFLhuKmVaOxB16h06jOVjyPqBlt/5NgG9yL6q8i4N995CAZWo3rOFB0hUbqriNn/rRHuCBdixVb4549JpU5lvl95uEgqvD92tR8HaIcCIgBNFQa3gztlLF9ajravJIK4jIQBPBY+BZRRfJpRVD0B7lX8UYXB98wWMHjdz1eiltN79Ne/a22Vw4luNvGssNdptOIGPk29QuiS92/bWmeCxNc83nN+tAdxmmM2qowXNUYKj0SCg7tZYNaGtWFhxPagIg7C1E7UOtPIHHd0LQK94LWO+sIQNKYhnsmz8qnVa9Z/6/7CL7nkb/fB+DaP52shT1PFz9HgJ514GIIMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qO9SiZnuBr9WdpBWU0DoSKy3ddphr2m8uxBGiGeFiI=;
 b=NTymbzKSqWIgbYWLTSCl7+2APxtfz+6madXzetxFojlXTBtrboGCC5fvNISpXdH9PRDe5xDZhBJn0hdHDmLRmff1XNoJnT1USdGHgdbrvYGW259ym2iqi4W6d9Z91yhSv0VvuVFEkY49x/d7hjzr34XBR5XtLTKxaNPKVvf9tO7TkagvPXFMCtiGt2kmzwyoVhYj+Q7pcWg2gtRvkeEpiCoSGXdoSGvyy0ru2gD/hfuvy/eD2YK9DSm+/YlKS7RAZKJ8B5lWGCiW43vHAEnaBZMObXTYmWH9iVdyl5aL0To7u26vFyPG/EVx+ZricD3RzHO3e95ZRrRR69Eyy9KqaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qO9SiZnuBr9WdpBWU0DoSKy3ddphr2m8uxBGiGeFiI=;
 b=u61FTkQTX9o9Fx1VFVBQDjK1qM/NjfFDOJ1WQw77qc7uqINzvJgoWTgBIJV9gpLqaqEU/HrnH2rBvWeW9YHE/dD6/rh5cAeUM2I1GK6pVcZxtXPv6NYbVCrI3+Mz641fRxPkM4ryK8IokqnZ+Tsr2eF10l4UskWdlUZCNE651WA=
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
Subject: [PATCH v3 2/7] xen/arm: dom0less hwdom construction
Date: Thu, 3 Apr 2025 17:46:03 -0400
Message-ID: <20250403214608.152954-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403214608.152954-1-jason.andryuk@amd.com>
References: <20250403214608.152954-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|MW4PR12MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: c20e8eec-c082-4e90-fdda-08dd72f8f412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BM6H8rdaJOKpirfc6hC/bkhW0EONp+w6sUlPhjOo4+2ujs1ZS/uU79IfhE9Q?=
 =?us-ascii?Q?jwpo8w+2iIRnndLgqzl+ia+dyCk6YaUCNCuE6td8nvxWAQPrL1zpNNgiE7zX?=
 =?us-ascii?Q?knHJpC+lNXw/EpNFtE0/Q0kYlQ3uvAxzCPZjNwCQyZMfNkWOPcX6HBK0xnb2?=
 =?us-ascii?Q?gFz4Boij6uPetIB84XRNTO42L0vov5k+b0rTxk8WX4Ifvwc7Lyt4nivWXaNk?=
 =?us-ascii?Q?uZ9xlEY73Fuikd85+CsTWhyYA+G8aHLCzBHZxNDGGNGnuBO0ALI1iYl8Ws/6?=
 =?us-ascii?Q?Gf3o2U4M02Z0G/cxzUBS7x6ZqEU5yt7jHMHbfJHEdaCdB199G7aifmJBmAyi?=
 =?us-ascii?Q?8/V3EvqiwAbZVw1yx4z2hB14f4O/DdQzXs+wMTF1tET8o71yHE86ga+kHqOb?=
 =?us-ascii?Q?EtJX2k4VnE3Spj0Tec9Rtnkokn+fh8Z+YA9dPkWNbXFP6GA4lpVIs/ZaaFtJ?=
 =?us-ascii?Q?CcRcUCiN26cuSQYoes6HbO43SRda8HEHDuyY0XBXXbsBaKLlK6NTfEV1XeU6?=
 =?us-ascii?Q?OpJjiEXSUcZ/WqaQg6D+0tlgZP8rHCTAKtCX3G12ev+gU4SM33jaz2M84JxM?=
 =?us-ascii?Q?gTUuKnmZR7bWYwa0DD3o3wDw5QcxRI8Rc6FVVvgNQKaqL6PUlZgWNVK4lZiS?=
 =?us-ascii?Q?9rYivHEG+B7UOyuu99oaTs9em8ADt3SBM5ijVtBVLpI2s5SCsL48ejQvAt61?=
 =?us-ascii?Q?14FePsgTpRfT+2CtrTiLC5y8vTRwKzlgY6jHc37Jrx8H06rfOp4HI7dqb7Ly?=
 =?us-ascii?Q?ZCI2dA1yZN4i1+covuYYR32Qq8jSHsrFfoaeb5/ebyDwkgIQHc8adOi1VwFE?=
 =?us-ascii?Q?N3lIVFwrsQk8jB5M4aXhgPm2YZWsGZGvwZlWI0Tzi7ZIdh3s4s8yqsp1R3r8?=
 =?us-ascii?Q?knZZUr+1mDCZnEMPXW/c3EKAIbss9v3us6Bki5kq3zFUEATS+BYgONKn/U6M?=
 =?us-ascii?Q?npWEaV7hWFaZ5aKBFrChEisb9s/4+D76K7z/aLXE4fnfJZQ8WsUvKC+9zbcR?=
 =?us-ascii?Q?+dC3O4y2C5PPTQavr+EZDGaYsqDNrJJ18WTeHzEZDJf3zOJ4ec3L3+11+TkH?=
 =?us-ascii?Q?K4kRmJJaWgNKmUey8zKV6n81Ud+OmegIVo1UF7VFKMnZ44KbBYOkkebFQ9FV?=
 =?us-ascii?Q?ScC3KCey118YS39pByXsGv6RvLWajWXwuU/Rh/YydJyTu6q59hZPsAjXUTe1?=
 =?us-ascii?Q?F4zBznQUjJJ5zHmdx89XTbcvkUqBmZv77S2MTm6C5pA/EGnZzZkkK70Ii9O/?=
 =?us-ascii?Q?Kf2tHgabaHv6j84yhfaZCZAgruasm1QGFeYSvjop92PfpVD7VIJoMWpBpTpi?=
 =?us-ascii?Q?+jL9Nqm9II5V0SvujRLS4S0l/kfFOsVKZZ8gNnD1jovQYg14sv33ew2u503+?=
 =?us-ascii?Q?DWkvoUuBeLJvVy5aC4kDA83LJ7RALfxR34iMQGEDRn4mxKJsmKF4yJcADIaw?=
 =?us-ascii?Q?mCOlvdwpm0bF535XB/1wzKaqbdN6vctNzha2O+vW1tZp1MzJ2hRMzJTnwQ98?=
 =?us-ascii?Q?84MFyycDjYxwiow=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:46:12.8390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c20e8eec-c082-4e90-fdda-08dd72f8f412
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6973

When creating a hardware domain, have the dom0less code call
construct_hwdom() which is shared with the dom0 code.  The hardware
domain requires building that best matches the dom0 build path.  Re-use
it to keep them in sync.

The device tree node of the dom0less config is now passed into
construct_hwdom().  dom0 uses /chosen for process_shm while a hwdom will
use the value from its dom0less device tree node.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
Rebase on process_shm_chosen() removal
---
 xen/arch/arm/dom0less-build.c           | 57 ++++++++++++++-----------
 xen/arch/arm/domain_build.c             |  7 +--
 xen/arch/arm/include/asm/domain_build.h |  3 +-
 3 files changed, 39 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index bd15563750..7bc6a6c4d7 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -929,36 +929,45 @@ static int __init construct_domU(struct domain *d,
     /* type must be set before allocate memory */
     d->arch.type = kinfo.type;
 #endif
-    if ( !dt_find_property(node, "xen,static-mem", NULL) )
-        allocate_memory(d, &kinfo);
-    else if ( !is_domain_direct_mapped(d) )
-        allocate_static_memory(d, &kinfo, node);
-    else
-        assign_static_memory_11(d, &kinfo, node);
-
-    rc = process_shm(d, &kinfo, node);
-    if ( rc < 0 )
-        return rc;
-
-    /*
-     * Base address and irq number are needed when creating vpl011 device
-     * tree node in prepare_dtb_domU, so initialization on related variables
-     * shall be done first.
-     */
-    if ( kinfo.vpl011 )
+    if ( is_hardware_domain(d) )
     {
-        rc = domain_vpl011_init(d, NULL);
+        rc = construct_hwdom(&kinfo, node);
         if ( rc < 0 )
             return rc;
     }
+    else
+    {
+        if ( !dt_find_property(node, "xen,static-mem", NULL) )
+            allocate_memory(d, &kinfo);
+        else if ( !is_domain_direct_mapped(d) )
+            allocate_static_memory(d, &kinfo, node);
+        else
+            assign_static_memory_11(d, &kinfo, node);
 
-    rc = prepare_dtb_domU(d, &kinfo);
-    if ( rc < 0 )
-        return rc;
+        rc = process_shm(d, &kinfo, node);
+        if ( rc < 0 )
+            return rc;
 
-    rc = construct_domain(d, &kinfo);
-    if ( rc < 0 )
-        return rc;
+        /*
+         * Base address and irq number are needed when creating vpl011 device
+         * tree node in prepare_dtb_domU, so initialization on related variables
+         * shall be done first.
+         */
+        if ( kinfo.vpl011 )
+        {
+            rc = domain_vpl011_init(d, NULL);
+            if ( rc < 0 )
+                return rc;
+        }
+
+        rc = prepare_dtb_domU(d, &kinfo);
+        if ( rc < 0 )
+            return rc;
+
+        rc = construct_domain(d, &kinfo);
+        if ( rc < 0 )
+            return rc;
+    }
 
     domain_vcpu_affinity(d, node);
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b8f282ff10..0a329f9f5e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2305,10 +2305,11 @@ static int __init construct_dom0(struct domain *d)
     if ( rc < 0 )
         return rc;
 
-    return construct_hwdom(&kinfo);
+    return construct_hwdom(&kinfo, NULL);
 }
 
-int __init construct_hwdom(struct kernel_info *kinfo)
+int __init construct_hwdom(struct kernel_info *kinfo,
+                           const struct dt_device_node *node)
 {
     struct domain *d = kinfo->d;
     int rc;
@@ -2327,7 +2328,7 @@ int __init construct_hwdom(struct kernel_info *kinfo)
 
     if ( acpi_disabled )
     {
-        rc = process_shm(d, kinfo, NULL);
+        rc = process_shm(d, kinfo, node);
         if ( rc < 0 )
             return rc;
     }
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 134290853c..17619c875d 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -13,7 +13,8 @@ bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
                           paddr_t tot_size);
 void allocate_memory(struct domain *d, struct kernel_info *kinfo);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
-int construct_hwdom(struct kernel_info *kinfo);
+int construct_hwdom(struct kernel_info *kinfo,
+                    const struct dt_device_node *node);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
 int make_chosen_node(const struct kernel_info *kinfo);
 int make_cpus_node(const struct domain *d, void *fdt);
-- 
2.49.0


