Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CD2A7703B
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 23:43:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932997.1335059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMux-00051M-0b; Mon, 31 Mar 2025 21:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932997.1335059; Mon, 31 Mar 2025 21:43:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMuw-0004z3-T6; Mon, 31 Mar 2025 21:43:38 +0000
Received: by outflank-mailman (input) for mailman id 932997;
 Mon, 31 Mar 2025 21:43:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLSd=WS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzMuv-0004Vr-CD
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 21:43:37 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20616.outbound.protection.outlook.com
 [2a01:111:f403:2009::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3255c74c-0e79-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 23:43:35 +0200 (CEST)
Received: from SJ0PR13CA0045.namprd13.prod.outlook.com (2603:10b6:a03:2c2::20)
 by CH3PR12MB7618.namprd12.prod.outlook.com (2603:10b6:610:14c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Mon, 31 Mar
 2025 21:43:30 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::b9) by SJ0PR13CA0045.outlook.office365.com
 (2603:10b6:a03:2c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.20 via Frontend Transport; Mon,
 31 Mar 2025 21:43:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 31 Mar 2025 21:43:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 16:43:29 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 31 Mar 2025 16:43:28 -0500
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
X-Inumbo-ID: 3255c74c-0e79-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQk1v3sz2qJeiZigHQudTSnn6T6p3Edp2cYSHA+hO9jnlzuOQKrsRNS3pkWUCFNZsVxV+8DKJJ8PD5NXQlBWMMnO8DoUa4YsOnNMGXE85MXGHAgF4XGvgXPCYMk096nTiDizZHuYwEf4ibbQE7uMIGTQOniAcMJ24CmKoiHhdekhXnguFDmixh03CGaTe9E22+SwskSbQJULRK9bLR2X8tjWF8wPLdbEiJ1BTxTYcTwP1Waysd7MDJgUfXPQJzVerf431K0HAaSfES0fFcK/K1oOxCfE6AeDGctYUBDH0+dwa2cuLjQ4qbVH/wlGR9AMmXqRf0pDh4nTMESWkogWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vl8Wpz8L2rcI/9x1YYhQCkm3Y97kmSSKSN0YHgP/Xg=;
 b=qyXHnB7Es85tEHpUKRahEpa7RM7Y/WCtX/7nVwKoILTmQ1/bQTVyzo+z1P7FIIStAdBa3mBhIzRAQi4QVwbI14cNvzDl2uCwbgj1TDZXKwvRvJ8zElusV5YXuyORppRJBlJvd5PeFUgH/t3Wdw3wpFI7bNMIFQ67I12PelXywj+0Xb2u3ZzlZCp8Dth9cGRqDS5Z+IIOSnO3HdpcHjWiBtFiQwcA7JyRio23nmZcCUZTClajZz9ZQhTPIYWbVPJDcvOx1KMrdwjbvO4JsoRhjymu028thxaRYmcqARaYPzVB4evcrFFUGlhhu2Np7E0ThtFJTCybk2/7WqlujdGYvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vl8Wpz8L2rcI/9x1YYhQCkm3Y97kmSSKSN0YHgP/Xg=;
 b=3/9h10hMms6wBPtd+Tq4N0ihvbygJe6PikXmCTT35HpkoFAT9YaJtKy3Nm1kOLEVnCIoRl6YDVQzzQ1U+7/2PzmMWkTuL2zehLZHiVYa6ORGTOgapW1R1GrZXtxlVaxXtr5YLpIt19AqaU+nDWP0su7jS3EBbWGDm99mssYTaZ0=
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
Subject: [PATCH v2 2/6] xen/arm: dom0less hwdom construction
Date: Mon, 31 Mar 2025 17:43:17 -0400
Message-ID: <20250331214321.205331-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331214321.205331-1-jason.andryuk@amd.com>
References: <20250331214321.205331-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|CH3PR12MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: e227e2b6-b178-452f-8ae4-08dd709d13e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|34020700016|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IXbUr6XG58lRFs1ssTvJ9gu3U6jGdNCnbryQKQORAVJ1A5y3fx9cefcnz0vc?=
 =?us-ascii?Q?/nk2Szdmu3AWORSxNSUxnxN44/cNNMPKTbJeodlIkGCUzG4FkCcM8bCvKHxK?=
 =?us-ascii?Q?36maOm8ozG0SMFkIQFZVALQq4f8zBHVwRSGSVUlMeUbTVrWke/S/NSnntiTL?=
 =?us-ascii?Q?TCy4IdKUtuB+NJCXLttzWooQs+CPHXJ+TYDyCqCS7nNSNeD4s9IkczcWPPQ/?=
 =?us-ascii?Q?SpVRCeaO5C5HwkrCft5SJ7/CDh15DIZIleiSf+cPCG3xkJTOyEEQPla2ltVK?=
 =?us-ascii?Q?/4r7THubSpmaFXmVru8XDbHKyfUEEPfq8syID0yeZPqo4FSqQ0S1Yxx0eMEp?=
 =?us-ascii?Q?vGGr05juqApYa24rDvWu/SsyZtpBrcq3M8RS2C6qUXyd2Tzjrio9DJy0iJpk?=
 =?us-ascii?Q?hyNMa2tb+ufIW3UR4enWaI+ySae03FiuBOI58zfl0cvjUK2+AkCpKbRCgSgq?=
 =?us-ascii?Q?ZpTs0aR9IZDeo0ZFrXsPXrsLFn3q9D+1lOfPaoLSgAfRX/6vVVXQAIW6X9JA?=
 =?us-ascii?Q?Rr7zasXVnbHoAyfXaS2PyInVn3RLuHvQlfyxMx2Zk4x3e0BYytkezEQpEmMr?=
 =?us-ascii?Q?2kIvOpNKN1rCbWleaUQneuC5uirsYT81LG8ebYFgsHKFcrFVToSKF0PZsA6S?=
 =?us-ascii?Q?fdzCw6+3inTuW8VGJ+ZZijK5rdLQY4jPLmpEEFkz5mXQZ8MrrMbFJDZgKG6H?=
 =?us-ascii?Q?yimocVIxTFCUTL+9JWSeK9qbvkBjXAgm6fUVG1gy3CdaCPsfikb+vvxp3ejJ?=
 =?us-ascii?Q?MO2FO/KK7DlIDemn/pvWgAcgQPesRJybr+ntGrV4e0pMLGZOzmBWHRD6Q1ew?=
 =?us-ascii?Q?u2R7rEjMg0CzHfjcnwHfFaesLbNYOppi6d51OV+MM79ES7MePN0lD/w9Ccpd?=
 =?us-ascii?Q?cGDKQJqjkudZbicbh+SsEteGSshhiGp2DFYSy5yz1ywUtBWsZ7yPrL6N2L9j?=
 =?us-ascii?Q?sgsH6+Sg7ozPZ1xFSRhqPtu3+eBsgbGB/csttN0ogQBW8ti9AR2zp8Kzd3IT?=
 =?us-ascii?Q?x5nhneeZ1m53PSWrnw9k8NEpfsZPJhbxyaWrsxPzmlF4BzMnucdziSSmyI3/?=
 =?us-ascii?Q?fLkAlfvyDWMwzzl2ZYs5XPvheuRmZXEz3gfCdMWJhX6Bk6SI0CuPPBTOWDkd?=
 =?us-ascii?Q?Gcj3XUaBCSklNcIBLyJa9OyCAMGZmrMO2tV6Q4zRIiBSN0rzC+/Y0iWBAudc?=
 =?us-ascii?Q?z476iGUhOYvCo5rZ4uqI5Jw7GQhsskL3H3pzcWVFV41PiYwhGvvwdE6dW47c?=
 =?us-ascii?Q?y1nXlzPeqEzQR1vNoBlmykZuURdxpNP24bsk5pHKkWA6CKuW0pFU17H1PDq/?=
 =?us-ascii?Q?pxIabmuUOnrEKB704VL1gkgAwdCXWv2ckKdczsZg4VhYXO+iM4KPgzgX8GPE?=
 =?us-ascii?Q?LC7UsxKbvvHaxya2lctLF465oHjTns+mze8hGCcPDSFWObXIy1fyG+9mOuuk?=
 =?us-ascii?Q?6bEGRm4S6XXN5dEmlutzRkk4rvYoW2++n3Vbu2bqVbrho2sV6Ub2PSedG3EN?=
 =?us-ascii?Q?RnPhKixQ50kC59c11wjoip5EuJPLju7FQPXM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(34020700016)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:43:30.1099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e227e2b6-b178-452f-8ae4-08dd709d13e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7618

When creating a hardware domain, have the dom0less code call
construct_hwdom() which is shared with the dom0 code.  The hardware
domain requires building that best matches the dom0 build path.  Re-use
it to keep them in sync.

The device tree node of the dom0less config is now passed into
construct_hwdom().  dom0 uses /chosen for process_shm while a hwdom will
use the value from its dom0less device tree node.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/arm/dom0less-build.c           | 57 ++++++++++++++-----------
 xen/arch/arm/domain_build.c             | 10 +++--
 xen/arch/arm/include/asm/domain_build.h |  3 +-
 3 files changed, 42 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 573b0d25ae..e25d7bd468 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -911,36 +911,45 @@ static int __init construct_domU(struct domain *d,
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
index 051c48329a..b3a396c2fc 100644
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
@@ -2325,7 +2326,10 @@ int __init construct_hwdom(struct kernel_info *kinfo)
     else
         allocate_memory(d, kinfo);
 
-    rc = process_shm_chosen(d, kinfo);
+    if ( node )
+        rc = process_shm(d, kinfo, node);
+    else
+        rc = process_shm_chosen(d, kinfo);
     if ( rc < 0 )
         return rc;
 
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


