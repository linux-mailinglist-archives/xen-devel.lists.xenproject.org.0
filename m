Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD87A90DCD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 23:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956558.1349943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AK1-0002BD-7L; Wed, 16 Apr 2025 21:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956558.1349943; Wed, 16 Apr 2025 21:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AK1-00029i-45; Wed, 16 Apr 2025 21:29:29 +0000
Received: by outflank-mailman (input) for mailman id 956558;
 Wed, 16 Apr 2025 21:29:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5uj=XC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5AJz-0001ht-Fl
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 21:29:27 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2405::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddf823b4-1b09-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 23:29:25 +0200 (CEST)
Received: from DM6PR07CA0128.namprd07.prod.outlook.com (2603:10b6:5:330::20)
 by SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Wed, 16 Apr
 2025 21:29:17 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:330:cafe::20) by DM6PR07CA0128.outlook.office365.com
 (2603:10b6:5:330::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Wed,
 16 Apr 2025 21:29:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 21:29:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 16:29:16 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Apr 2025 16:29:16 -0500
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
X-Inumbo-ID: ddf823b4-1b09-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gn/WLUDkyRQJA039L2wYcJEa7idoS7LvqJNLxl80j4OqwNV2PeMAHDdkuz/HwM1c5i6jkAjwjbyrSYyyJDqfIx/3vpI9gxvGpvOW6ZL7nDCKT5oRihm236ax6cquFYYaNc1x3d39EjpDgAhveKI2aHktQzJTbxJ0rfdiC25IcKzAg5BAKucO+ICVyQHqCwl+BuPUPegFGGBsVxczlTYmcOkVOXv4VUIC9gaYVEJvbcMp18GHr6R2W3AZoHQMIWcyycVa93ALYkhlnQ9bbs+HS0SGwZb3bFQnK0K+48VghSM/NR94l/y4hRxE6wwee83UyCjCP3yrIHdNWM4KbUzmpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4tBwta+WLneMlhwvxky2qylVlSbUKgM4iAMiHLVlC8=;
 b=r0537niEvUaNQYZ6eSM9EhCMc+CzBRKDolhrIjqaEmcY76vjdMTHdwh1o/vVQO8yrvpLU4epc4hRQQtudpZjFixu4OTn+pYwP8Nv3f/GyCG7Lp3MdFlSB9nTI8jFuDmm2v+ncoGaymE0v5BvsrqUVmyWRtjRjpLs79xZT/o2jIq+rzLH7is8axO2MandCKK2yFdlex65PHJnlVMFylart41fG7GkVTlu5kKBqX5myKOARX2choNkKcXJVh6+6iWnj34rgqngub971zDtjdRkpcV0uGh5vJsnjAFzNUmzImOwmUmTsfVwyGtlHQDfwaiZZGGS66LnPwMa/Ouo49v+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4tBwta+WLneMlhwvxky2qylVlSbUKgM4iAMiHLVlC8=;
 b=uHzd8tuGKP+99VCC6XbPyiEF8awa92xMG0uA1I4NBI/5IB9sKVvB9CBwY4zhafH+z5rKbq/tVTcvEsvwAwL1qzBF2bsTgcanVF0vFDN5d36TeU6GdDEWOvLLKihMjZh6X7J8FqTQ1ULJjt3T9iIWt2t9HR9YmxVxza8tPYsDD5Q=
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
Subject: [PATCH v5 2/7] xen/arm: dom0less hwdom construction
Date: Wed, 16 Apr 2025 17:29:06 -0400
Message-ID: <20250416212911.410946-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416212911.410946-1-jason.andryuk@amd.com>
References: <20250416212911.410946-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|SA1PR12MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: 53b69391-6ac7-4d1a-d18e-08dd7d2dbe7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DwPILhrJLPSx7N5Y6J+RyxaAO0KQz+1B40qvC1CQwcMioN6BICn4z1hd8rxH?=
 =?us-ascii?Q?i55GmePnsSUclGNyKGX9FY/utc0qyVdkMqCiAItVbrUbSkMD43tPF9FBHUdE?=
 =?us-ascii?Q?X3xRcovE9aVv/jOwd1C8dsghf0i0Ajorz0SRDhZDMPy8Yxu56OfPFcEv8gBr?=
 =?us-ascii?Q?DzU6lqp4YnhsfLAOaNOWrq3CdJO0gl811E4cuAQrgoDM35EsXdAkvAyc0q0e?=
 =?us-ascii?Q?D3vXrGdw4wnl2UKwBVhhcZEW9TBdgFvbCCn1tsTXWzDMZjNAG6nvGg9XySMm?=
 =?us-ascii?Q?yxXrqLzQIuGAUZMzdcCi590YD625aqVNxwR6yy66HC+PXmP/lUnmAZj0vAFO?=
 =?us-ascii?Q?4qCV0QxX8FkvDpkpXKG9JltG2ukyN8pCHMjEE+dOQxA/agRtcZfvPQH7xRVO?=
 =?us-ascii?Q?W8UFsI7MFuPoxaagrFgtPjAAkiUzLu3aSlcBIBev/mw/d+M6aIGGUa3EB5Wy?=
 =?us-ascii?Q?OpUkO4nPsb6Ho4J5b+GRkkaClIrd8dbdMCLWzJk5AqHDsQdwHZMbJ1ntcCtH?=
 =?us-ascii?Q?evGFsJBnkqjVUrfCa5eZz65bvINUF9RIOc+9Fp/rtx7UIKOAdqBO+utF/h1m?=
 =?us-ascii?Q?fircKlmVmHj/4eqfQelAbZ9DDjBJEWEEXo+RpYZV8hENAs/iaZVTKgtOhtL6?=
 =?us-ascii?Q?zfo/uVoIkKrkIC4BWqF6Uy49MIGRGFwRltu+/Jo0kFwMcwzkaT7jFOwIzvET?=
 =?us-ascii?Q?ovySC0ebmNI//LeqOsAHyjn6VyZ4gBECvCCkyzrk6WocGzPTfrvvM1udieew?=
 =?us-ascii?Q?atkU8Q6Zwuw3EowQKWZTku53Q1J+Lt2A6FJmaetmjK15u39l5q1gDaZfRxnU?=
 =?us-ascii?Q?3RY9MmRDPC3iyPlbHzCw3HDfviMM75mILZMjcg9JJs7/upEr2DJqFozUNhhi?=
 =?us-ascii?Q?uTiJ3OWmZfAoyKhU2NE9hMmU3N38A4kBJsjcQy68yaqox7TNW7/eEFymMRt4?=
 =?us-ascii?Q?O+8UluNuI8hoKlkcsjZ1g/VUMX2jCsI+MO8eP1M6L1UWtedOYZOfr66KNnbN?=
 =?us-ascii?Q?a1abgoRwtSBICNTcujy5APO+46MWeCMrTkDKZr/onW33P5bF7W95jaQucfSR?=
 =?us-ascii?Q?qaADIncJvXADdwM/+Oc4zvXqGHRT8n7vHWgB/Eqxtzh/bcV0M80GOahUBO1W?=
 =?us-ascii?Q?nUs3pTBmlB+3e6TQHtXAwD7F/XmbHEqjJbl7Fstd1VH5gRCdJshaNZxYRbEa?=
 =?us-ascii?Q?ORMy4KbmKx07Xr537ZgM/zraV7va+seJ9CzqTrmIT31Cv0QzKuG5ONH8c3om?=
 =?us-ascii?Q?1s3rfVD89El6DNeAPE1V39R5v8I/liA3rxogOHbAnfXA8qfc76R61M0+KO09?=
 =?us-ascii?Q?imQjRZfpxnE+HAVKzfv8RszyAqyQ/PKq4hNSzk5Bg1VtL1U9cey2u0yEVlaz?=
 =?us-ascii?Q?JhyGHEs+DFN5t6wQkbCaRUshRy5+Lbpl6ov5XNY1UpgK7+QBiuXiY4ybn0Wm?=
 =?us-ascii?Q?iphMfX5Wtle216vEipzblw4DaoEEXgm1r8ASHVLIXwiEKPVjMi29wCJiZ6HG?=
 =?us-ascii?Q?Jl4C0NvknzG0BJE+p4dPz4WuReDlIiFrcozk?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 21:29:17.8261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53b69391-6ac7-4d1a-d18e-08dd7d2dbe7a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597

When creating a hardware domain, have the dom0less code call
construct_hwdom() which is shared with the dom0 code.  The hardware
domain requires building that best matches the dom0 build path.  Re-use
it to keep them in sync.

The device tree node of the dom0less config is now passed into
construct_hwdom().  dom0 uses /chosen for process_shm while a hwdom will
use the value from its dom0less device tree node.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v5:
Add R-b: Stefano

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


