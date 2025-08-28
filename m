Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ADDB3990B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098194.1452324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZW9-0000Q9-KV; Thu, 28 Aug 2025 10:06:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098194.1452324; Thu, 28 Aug 2025 10:06:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZW9-0000Nf-Hr; Thu, 28 Aug 2025 10:06:05 +0000
Received: by outflank-mailman (input) for mailman id 1098194;
 Thu, 28 Aug 2025 10:06:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urZW8-0008DS-Gh
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:06:04 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2415::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b32648c-83f6-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 12:06:03 +0200 (CEST)
Received: from CH5P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::22)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Thu, 28 Aug
 2025 10:05:55 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::b6) by CH5P223CA0021.outlook.office365.com
 (2603:10b6:610:1f3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.18 via Frontend Transport; Thu,
 28 Aug 2025 10:05:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 10:05:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:05:53 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 28 Aug 2025 03:05:51 -0700
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
X-Inumbo-ID: 9b32648c-83f6-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsQT0rmiaABOmcohSWKiBAi2i2eEUuKJmizoFTALGjKue0+y/bex2PjTKxUhmoMyaLhqh7NKiXfAqibuniY5SLgozyCNE75zWr5aBYzFGt13lLznQlThlYzDvlscVjPggy0QUpyvgdMr+alRcKayR8EIlwk4APFQ3Kp4QEidQVD3NDQ3whBe689krAEHMyAawkcAmiLwhpo+98sPvk129ZUeaYP0wFLqieOYoAw2M7Y45JLzvlUueM/tWcyy3QJRZCrUskTkeQLum1TRvH/p/pzfcejIiEccn8Pbo6SuOkbNvzvFUEPfiaa+tX0d0/iDIHxgmoLldTNdp1Yxe8C0Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sr/8ELtfeheb63woL4g3CYLQa/Js9kgQh/H0SwSl4PE=;
 b=uW+i6VXn4tqL/alVBLclQ2Ajk8mExcqzl9BZTkEk1xR6g7ngf7ZuA85yVhk7zGtI7utR1nqXwWkd3Q4pMTZaXQsK7KxLskxHUMTcHiiENdR3K6KE8PPtYR0frwNk0KBgJUUXRzQlx6wYUGD5ljQBf93HKHhcAvqmPFyx27wtCYJHE1BNyAy9g7XGDkno7rBJ3GCu68jmr6r+mwZ4FBSa1ILdqlb9qyULA+OIhMzgDMQu61VeHrJAp2hk2pu/nmEKrambDtfXSsYpJtQpJ29MDB3BQDmwohcRkzWcAUtV1xowFDf8pG6S9rpIelUyX+XhceSd4VT4/401LR7JTW5sPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sr/8ELtfeheb63woL4g3CYLQa/Js9kgQh/H0SwSl4PE=;
 b=npKnH2wl8sPO/NP2dSmKqoCDL9ls/0DheOPXxm0NSYDXbGEN3g7UWncLDRP5q2+2OccEYZC5b6RRTQFgOoQggN8jqm0N8HQINOR5SewSCMrcDNdNZakgNK7qEZiOXb33PXJh43ZJ2PPEIZMr9KgAcHID5JDN1L7K/bRVG1E2Xfs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v8 7/8] xen/cpufreq: bypass governor-related para for amd-cppc-epp
Date: Thu, 28 Aug 2025 18:05:34 +0800
Message-ID: <20250828100534.1777023-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|MN2PR12MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 66262697-d78f-4f78-8138-08dde61a7a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RA7G4lmnZUk9FmEwgEwTvG4xou62pI7Y1Vrx5LUjnpQHRhZqG5E9X/T5jhnW?=
 =?us-ascii?Q?XK/T/VeW5tWj2xwKsI1Du0UAmNVeSfAV9iabEh9zkTj150sndSFyPerSfSei?=
 =?us-ascii?Q?Z0vYNNaf9xcSL4Zl9Bs2fxQr/vWZPCxPmugy8Fb+kKHnytAUgzlkY0ZHo2CA?=
 =?us-ascii?Q?h9ackvL3YG7rMZEEZiWHEj0olrO0FtO7GuUeDbrAOk+qdn2bLLZdDxkS8TQX?=
 =?us-ascii?Q?Z5vmc0ZH03tijBoBJ4Boj4XqcwWBLQJNhs1aMTM2gRQPFgAivxvXPlMo7qAZ?=
 =?us-ascii?Q?Vm9MZ0dM/FszJPDugw5dvmxuOzr23BFctwudLAcxyA6PRFNTZ6FbU7eY7sn2?=
 =?us-ascii?Q?KfTDw74fFHQ8TEUNlz0xoTwWPlrJTXapU6EWUaBKr6JVGkcHJKSOBKY8Zopj?=
 =?us-ascii?Q?4+2UGOwNPi6m2WkNHk8nGBP6H7i0ut4mzv5CjnLrghhrmR+FWW6fQnAsqyY8?=
 =?us-ascii?Q?5qln1xt088qCIvbeD8Tnv8R0XCg/vpRagml5iOJ/T9MWcStZlifvUELrLSMM?=
 =?us-ascii?Q?S2RIFnp005qUL4OEMTleWBLkp2J/VzyDAqfyQRF9ml9TAWLtCAfE3Jhd2sQJ?=
 =?us-ascii?Q?GzODsStjufNpEffSrIkiJYqnwV+wGADKyofMNdyRHkQFIwp9Lj0N0ETTF7ro?=
 =?us-ascii?Q?pnblib85AASoS3BsfS14ACr6DwjtzoGmdlZhHp6T/0neKdhEgBmgthhNr08d?=
 =?us-ascii?Q?HDukdu+M3178KrKF4HYXVrDAOBspEcCSWJDeKqAJrm4OEl+YqPwihO3y8K9t?=
 =?us-ascii?Q?nwxR4SI2E8J7aMANlImq7ajlI/cjmtAV1q1KXPS44062rEBDydl9J+UJYlk5?=
 =?us-ascii?Q?j9g5IC/qGLbj2ZNwfwAs1sQ7gkjOwhMV1yETsC5B2KSs+Nmn7OL7QJuBqvWC?=
 =?us-ascii?Q?Qr9AJI+L9LhhVFCVHFiEWEyOFjjWYUnUFQUrgYkcPDb+niysznf/5cDQvlaf?=
 =?us-ascii?Q?Q2nHp3+vuFYOjYwcENiuYfdHXUBXq8Rk5WQ2Kkbh9FdvczAr+sLfR4zt8YRh?=
 =?us-ascii?Q?/5DCV8YL9mkpiMjtbEZN2/50IjzJxpVKkqv+7oA2MV0ImZYyAzDxQVcG+ilZ?=
 =?us-ascii?Q?IqkO9c/xM8+s5kKXtG6LhJVps/HwR730AvVc4crXWGKWd6wxrNjtZ7hsT0xN?=
 =?us-ascii?Q?tgONe0hZ9qGH205vXxWBF+PuhTVkDA004YWHsKVeIlqqxwWtRuEDTR8ywqqv?=
 =?us-ascii?Q?HUbR+5ylD1E5L56QM+hYmgjZf8h8y6Bv6SYIRJLrpXK1dA5TNmHF861rFQpd?=
 =?us-ascii?Q?5KNaUaVZVzUXToEtuV9rMyknyBS/g03BBuHBHQO9uR20O1Vkoi5i75X2f6JQ?=
 =?us-ascii?Q?unbZ5Etwz2VMX0j0qtS6KhK1vJpJZyDc354X0DlCYhR3r4bN33Dy/xcCxh+T?=
 =?us-ascii?Q?UIqSyIMcgbNRsmdPvJPD/tMDIZ8VC2ALsZmQWJb4E64tRbS+0eK3m1OdHxii?=
 =?us-ascii?Q?k9zjsyrWWZ1+losA8EEAeSgF9JYtpqytZ1t1ZPV93HtPpMCpAh2IgkhjB5SE?=
 =?us-ascii?Q?rP1k53bB5GhNBA0x1hfdl/nshR8OnEPgPzlD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:05:55.0530
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66262697-d78f-4f78-8138-08dde61a7a40
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470

HWP and amd-cppc-epp are both governor-less driver, so we introduce
"is_governor_less" flag and cpufreq_is_governorless() to help bypass
governor-related info on dealing with cpufreq para.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v3 -> v4:
- Include validation check fix here
---
v4 -> v5:
- validation check has beem moved to where XEN_PROCESSOR_PM_CPPC and
XEN_CPPC_INIT have been firstly introduced
- adding "cpufreq_driver.setpolicy == NULL" check to exclude governor-related
para for amd-cppc-epp driver in get/set_cpufreq_para()
---
v5 -> v6:
- add helper cpufreq_is_governorless() to tell whether cpufreq driver is
governor-less
---
v6 -> v7:
- change "hw_auto" to "is_goverless"
- complement comment
- wrap around with PM_OP to avoid violating Misra rule 2.1
---
v7 -> v8:
- change "is_goverless" to "is_governor_less"
- make cpufreq_is_governorless() inline function
---
 tools/misc/xenpm.c                 | 10 +++++++---
 xen/drivers/acpi/pm-op.c           |  4 ++--
 xen/include/acpi/cpufreq/cpufreq.h | 12 ++++++++++++
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index e83dd0d80c..893a0afe11 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -832,9 +832,13 @@ static void print_cppc_para(unsigned int cpuid,
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
-    bool hwp = strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) == 0;
+    bool is_governor_less = false;
     int i;
 
+    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
+        is_governor_less = true;
+
     printf("cpu id               : %d\n", cpuid);
 
     printf("affected_cpus        :");
@@ -842,7 +846,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
         printf(" %d", p_cpufreq->affected_cpus[i]);
     printf("\n");
 
-    if ( hwp )
+    if ( is_governor_less )
         printf("cpuinfo frequency    : base [%"PRIu32"] max [%"PRIu32"]\n",
                p_cpufreq->cpuinfo_min_freq,
                p_cpufreq->cpuinfo_max_freq);
@@ -854,7 +858,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    if ( !hwp )
+    if ( !is_governor_less )
     {
         if ( p_cpufreq->gov_num )
             printf("scaling_avail_gov    : %s\n",
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 19aedf6b0b..371deaf678 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -154,7 +154,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    if ( !hwp_active() )
+    if ( !cpufreq_is_governorless(op->cpuid) )
     {
         if ( !(scaling_available_governors =
                xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
@@ -240,7 +240,7 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -EINVAL;
 
-    if ( hwp_active() )
+    if ( cpufreq_is_governorless(op->cpuid) )
         return -EOPNOTSUPP;
 
     switch( op->u.set_para.ctrl_type )
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 9ef7c4683a..7caeae26cf 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -294,4 +294,16 @@ int acpi_cpufreq_register(void);
 int amd_cppc_cmdline_parse(const char *s, const char *e);
 int amd_cppc_register_driver(void);
 
+/*
+ * Governor-less cpufreq driver indicates the driver doesn't rely on Xen
+ * governor to do performance tuning, mostly it has hardware built-in
+ * algorithm to calculate runtime workload and adjust cores frequency
+ * automatically, like Intel HWP, or CPPC in AMD.
+ */
+static inline bool cpufreq_is_governorless(unsigned int cpuid)
+{
+    return processor_pminfo[cpuid]->init && (hwp_active() ||
+                                             cpufreq_driver.setpolicy);
+}
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
-- 
2.34.1


