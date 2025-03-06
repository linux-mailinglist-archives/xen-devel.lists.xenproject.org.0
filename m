Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34325A55945
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904064.1311982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJJu-0000jL-DH; Thu, 06 Mar 2025 22:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904064.1311982; Thu, 06 Mar 2025 22:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJJu-0000Zy-5Q; Thu, 06 Mar 2025 22:03:58 +0000
Received: by outflank-mailman (input) for mailman id 904064;
 Thu, 06 Mar 2025 22:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJJs-0000Ss-AB
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:03:56 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [2a01:111:f403:200a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e42e59e4-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:03:54 +0100 (CET)
Received: from BN9PR03CA0543.namprd03.prod.outlook.com (2603:10b6:408:138::8)
 by BL4PR12MB9535.namprd12.prod.outlook.com (2603:10b6:208:591::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 22:03:48 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:138:cafe::be) by BN9PR03CA0543.outlook.office365.com
 (2603:10b6:408:138::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:03:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8549.1 via Frontend Transport; Thu, 6 Mar 2025 22:03:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:03:47 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:03:46 -0600
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
X-Inumbo-ID: e42e59e4-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2gsierDPhEKm1IQG1yL6KmjONIvqIfpbQQJL6hdPE0RoPmFU5FxEoDGoPsEjq9MDnHVwbNWlgQBuwQQANyWsubRJkXO2uc0i4hXVDVob4xMktVvijIb+i0GhdtmaM0ExNjBRkPa7Zv9hyjOCte5lVAf1gvHDX48FWxsdq9jU12f17NcIjzg04zkqbNaHPgIYlrWFFylb0uQkrwvNxwLKoGXFlhFvunRhHuw4QHr3USG/cdhl/+0HjzDxDA7ECdnY+8uA/7/lH7/U5S2cqYAu3PRvyxqmwOHW0Dy1hB7MKXyHiveme5qHEy0Lt2ZVnsdxwpq4sJcpMroYZdGK8s65Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3v6UlYBcmi3ov7lYi2wo5cPY1aCBB8qLirYSeYSjb0=;
 b=msQC1FXgdPvjqSPW9oK2LjGhHGJN9cc+XY0Km1BGrKbDQob23pmOD83IxaiRfWND07M/+BU9w8i6IzhkmOPUlYCzXgdHLwz8XowRy/J4fLXV4kKmD4qM0vIrfkv9WizW8dR7Hmi03Wz7YGUZe/AedQqexjYvxlXv/nqu+ku+QMeGQSmoXcgIQg01R27E/NCadFRWjrymdhLcNKxBVfpPWEFY6qhQUSd4PZNoWGp5V7e/mUPsPDucbTvnwg5w32iofMR5EqDc3r8anmOxjBv4hF0dgWu5PrPcnU7Y75x/RY+2Imnwxogi9JY8gaHfo0HHVihgktBuKT8H0K/04Zzkhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3v6UlYBcmi3ov7lYi2wo5cPY1aCBB8qLirYSeYSjb0=;
 b=dTzhmbBanKg4WPxSTlWqG2dtriVlLj6ZEwbCl9FuRKkG3FLTxrQNQl2tZbxsic5QJojnb0j2qQjurrC0Xsj9HB7zj83q4hEpz4g04KfjbqMLYi4zTguwBQDuCfIVwKmXucuEf8YhhaCyziNv75rC6tWqwV5jU0gnGhGl9JH94g0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 01/23] xen: introduce hardware domain create flag
Date: Thu, 6 Mar 2025 17:03:21 -0500
Message-ID: <20250306220343.203047-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|BL4PR12MB9535:EE_
X-MS-Office365-Filtering-Correlation-Id: a74b46e0-bbff-4016-bf3d-08dd5cfac575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JeeWTzqXaLc1pTTrmyWiQSndCv0qDFEX0FQonST+XiiseHX5Kv1O63VF3Ps/?=
 =?us-ascii?Q?1h2AOuhCldJjfLybaHkoA/E+Qq+A2BHNOKd0LBabFlTgDKH15XzuSDsigCQy?=
 =?us-ascii?Q?2B7eS+0KG7OwIQ4xeaJBevWYCtyghBKwTAD+W0uE2XVs8XaiLQr/4k+rTs8i?=
 =?us-ascii?Q?4EtsWUSTlXpX/RuTp/AP6eIiXLIHxzO/Rhqhuvcvs2bx2iLiUv0UtXlxC58L?=
 =?us-ascii?Q?o1nlyFs2E3J4hbE+xfUTvgdvT/5YitTGYH+dsHB6R2UmXxbFYPtZoZhtquOA?=
 =?us-ascii?Q?SQJTjbCs5Md1C172a1G/EoIv7Uq4LSqE//4w2RNeXz/x/rbRjZo0imZVp+F3?=
 =?us-ascii?Q?QNOTURxzhTw+7RbgeGXMc2oAlcYLqMpWkgu0L7dImqxdkuVsStbtTEbwVkkA?=
 =?us-ascii?Q?eFkPFjrLDQxwLcNmZYzwcVvzqvYUqUagPGYkjO2UHMSn2pOzvRhh4PSl0HEt?=
 =?us-ascii?Q?SuqdNN6XEUomvS1AoTvWny74/F4N8rn+8xvV1o9Mwk3TBUus1NmA2AZCZqbn?=
 =?us-ascii?Q?7p0rpWxSGyHSZdnV1OGi/sStUHSr8vI1UjR6CqtduuPoMFy8c2kB0CTOUlcM?=
 =?us-ascii?Q?V9B080H90LCSt92PhegGyksHGuiD1SeLCKQz8m4kSQ1R19f28ZF8A3JwwTcV?=
 =?us-ascii?Q?y5kc5oDb3TURtKs7a+Ozl4JBgbwCnvc4bMzyAV5Xc5b3tnFlz630l894xNb7?=
 =?us-ascii?Q?35+be8s30+X6uYUyL/jHr2FdOfSi2uPShg7UvRNEhrxw5rEtpP97Rwy6JqgO?=
 =?us-ascii?Q?/XHwkZBCHiygGK0VbgAZttTb/QqSF+lFbhg2cxp4GlKW/PFCNsb91Q7QxsFO?=
 =?us-ascii?Q?QOzq6TUoFtLofz8vXXcU81LDv4AbT5zjhSY9PLIUPEpVLLYDC/u2TDxeFUgx?=
 =?us-ascii?Q?gffuizFi0ccEFibPpwbS1CaNMGPVeXUCG0wg6oSIM71CGCncz4mpAgyhsJ0c?=
 =?us-ascii?Q?JqfZBkBgkUu3vGNMO4W0Vid6P7rUhcjez/TK13X/D+SLStakrtWyIIz/UKtX?=
 =?us-ascii?Q?puiV/cSrTWOlQ4NN6e7c8FLmYpeKKxhPRNmCetV20VfVPp+zoYJl7IRdlDE1?=
 =?us-ascii?Q?pMYG9UIFizeLUL05g12jRsHXOUY9KSBWAp4OHlKv46YKMJskYmLCcWMOeeRd?=
 =?us-ascii?Q?l1fUjBPUFGa6yEViaFB89e0/wm8hj/XPpaN2yGQS29XNpI4Z8xQiZi3h4Czo?=
 =?us-ascii?Q?s7ANZER+79dloniKcvRVlsB8iNcDnGfGx30ghzlXveS3Q5wSvVuGfMCr0cjF?=
 =?us-ascii?Q?omzRyw3gm+3gF/azUM6dVpxZ4YHbA0lm94WEoW3Ws+RkLXcwyvqOCJyW0Ekh?=
 =?us-ascii?Q?8FZH2/Id9Nx3m/GqT/blpNMO6oSFt9+LR87MN/KJGaM1uCXB1ybAh+TUSIPf?=
 =?us-ascii?Q?KwzMUaDmMDBWvSow02pJEXZBxgVMXhMnqXvZQ2v4y7uZUqg2jvtv/ESGepeH?=
 =?us-ascii?Q?UKCe3Aw/03zbXq5La6Q36cDP3ZaPwnT9owgR6MasBEQgPqzPmvFV+Xi8D+H7?=
 =?us-ascii?Q?WXh3Bw25Ix1O7SY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:03:48.0417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a74b46e0-bbff-4016-bf3d-08dd5cfac575
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9535

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add and use a new internal create domain flag to specify the hardware
domain.  This removes the hardcoding of domid 0 as the hardware domain.

This allows more flexibility with domain creation.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/arm/domain_build.c | 2 +-
 xen/arch/x86/setup.c        | 3 ++-
 xen/common/domain.c         | 2 +-
 xen/include/xen/domain.h    | 2 ++
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d4570bc0b4..6784ee6f6d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2358,7 +2358,7 @@ void __init create_dom0(void)
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
-    unsigned int flags = CDF_privileged;
+    unsigned int flags = CDF_privileged | CDF_hardware;
     int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 143749e5da..fa18b9caf2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1017,7 +1017,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     /* Create initial domain.  Not d0 for pvshim. */
     domid = get_initial_domain_id();
-    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    d = domain_create(domid, &dom0_cfg,
+                      pv_shim ? 0 : CDF_privileged | CDF_hardware);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 0c4cc77111..c170597410 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -699,7 +699,7 @@ struct domain *domain_create(domid_t domid,
     d->is_privileged = flags & CDF_privileged;
 
     /* Sort out our idea of is_hardware_domain(). */
-    if ( domid == 0 || domid == hardware_domid )
+    if ( flags & CDF_hardware || domid == hardware_domid )
     {
         if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
             panic("The value of hardware_dom must be a valid domain ID\n");
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 3de5635291..b5e82578c3 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -50,6 +50,8 @@ void arch_get_domain_info(const struct domain *d,
 #else
 #define CDF_staticmem            0
 #endif
+/* Is this the hardware? */
+#define CDF_hardware             (1U << 3)
 
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
-- 
2.48.1


