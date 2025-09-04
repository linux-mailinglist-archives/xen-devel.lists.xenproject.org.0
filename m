Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E01AB43284
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 08:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109504.1459097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3Zg-0003tP-T7; Thu, 04 Sep 2025 06:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109504.1459097; Thu, 04 Sep 2025 06:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3Zg-0003nE-Mq; Thu, 04 Sep 2025 06:36:00 +0000
Received: by outflank-mailman (input) for mailman id 1109504;
 Thu, 04 Sep 2025 06:35:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UG7t=3P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uu3Ze-0002iS-Hm
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 06:35:58 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061e.outbound.protection.outlook.com
 [2a01:111:f403:240a::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a4920a2-8959-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 08:35:57 +0200 (CEST)
Received: from BN0PR07CA0027.namprd07.prod.outlook.com (2603:10b6:408:141::29)
 by DM4PR12MB6183.namprd12.prod.outlook.com (2603:10b6:8:a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.25; Thu, 4 Sep
 2025 06:35:54 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:141:cafe::32) by BN0PR07CA0027.outlook.office365.com
 (2603:10b6:408:141::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 06:35:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.0 via Frontend Transport; Thu, 4 Sep 2025 06:35:53 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 01:35:53 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Wed, 3 Sep 2025 23:35:51 -0700
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
X-Inumbo-ID: 6a4920a2-8959-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hj4RWKAWvtO4/kWIrDa3eHDmvHOpCI8WvOL/Y4NwUFa2zlJcSLrrPuIu3MrLTR38xMAkO7sJQZpWtJBwOT6LAD785oblxSVjxnW77PSbwYP2ncxfvMOS55gzRKh2yevpA6R2FukUK+bJd8sdjZXAAmKcLsPBfgFFiGR3gAFGDEKCn/TWXnBo/SZM03OCqWq0G3naK9I92umQk8BdTSNaEIzhpO5BQtW4fALjwOFqcdps8g6aPSqCYUQMYsqlT3tA1TEZsL7eRJv+0TNOzh4QbZGRBLsmwo5uzDhxXe0Cxd3+ZNcKaT+jz27+5jyMfMRSWj+T756wqm+bPATbk1nOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vTgoPQGZ52lYoy0+t7eUH+ZhoylKKzVdc6YoX7igME0=;
 b=BJLbm2UqMvjA4+JH4xMyAXwwVgvbFSQJuhZ/92cXFGrY9TCno69EKxDD3WiPgaxqJJ7lU1kBesoUnZBoCaKJl+unuXMYa0V81PlPpa3zafMkcW7eqKIlJpEvYXXBF9Zu2Ul/8UrAOt1jFPofR2LxVFAlgUlHt/gfJBpKQDG+yVDqKKgjpfxZb6IoZ5NU+2Kh6ja/vz4vVx4QpU1k5yyBYCbpjobg6z6mculbXuKtz/o4mjnRNQvyHypeVRl36imK6KavHCJcrW+/7cxz+clWEGP7ps234kEA/9nx/QdOPHGOpTMkhs5bQ4LEEU1/IG/XoaAEB1A1zzK8SD4Ko6G0gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vTgoPQGZ52lYoy0+t7eUH+ZhoylKKzVdc6YoX7igME0=;
 b=NuKy0jpENyGLRvTgOuSZsoLFM60NnPLjsEievwPDE57MNPTJLg+n3GX0MeU8WcOvwv6PGI6nh4LlhRKXZfyurKzdOTWqx/DQd0ou9VadpVP6RMIYIs2HajbRbqXvNdlzPaiut+4AYSoWTOsm8Pet2K5fyAO8a/x/z7gvdrJXIy0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v9 6/8] xen/cpufreq: bypass governor-related para for amd-cppc-epp
Date: Thu, 4 Sep 2025 14:35:16 +0800
Message-ID: <20250904063518.2097629-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904063518.2097629-1-Penny.Zheng@amd.com>
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|DM4PR12MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: bba50187-47f0-4154-8665-08ddeb7d4c4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Z2wdmxPUzd2E0xrLfhX1ygA+TW4/nOPwSba+03AWSd1X5SqU7eAJLLmDkRx?=
 =?us-ascii?Q?0mM7gvSy3h4gkeKq4f8qUSI8UWsn25wg1QyKP/F+8xr62T+fUAUrkpDPO/Ow?=
 =?us-ascii?Q?V1expMhOAjVhFHIyeSLEnMyvz6Bdoj8g4gxpy8XwmrZXMBCEyGV5gzN6Wq68?=
 =?us-ascii?Q?R5wpKpBy8bTJN6FepFFInsJGIDfpDEEqMnSU6dpKe6h27Su8FYalwKS5ngjW?=
 =?us-ascii?Q?cYQLY7mjAl5K/qZpvKmwdXTXUIW0yTuft/3YfD11mJAQ5ILmzTdeUixLgd+7?=
 =?us-ascii?Q?S4/1sgqQS/pGPNiybQHGykHtY3i3WfFnNWjPNAO7Vk0A+YkKRqJ2j1YGthXf?=
 =?us-ascii?Q?VIrlSh9Lj5QRp3D/8s7qFvBfR7w6syGDwwY2PidtlET1I0ERSgGvTNN7a+7s?=
 =?us-ascii?Q?RXZ9OtEtJjuKcw2p1g3KWdT4I4cAmtjSXPl4TASCD18bCzN3oqMdGhEfoBbJ?=
 =?us-ascii?Q?5rmIVBXpzOG+e93T84sIPF0eFTt5Rc7mfLzisBL5yS76HeS3lW6z5ItudrOI?=
 =?us-ascii?Q?CZXoPo4374oUhOQ9Q59W4Dzu4XT8LZkoLaYUa0PBtSN0ZmcIRqwv23RowDwT?=
 =?us-ascii?Q?oDRpSFaAcqoHjgKQ4FPc/t5YfY7v1rr/PJQhf55021U8CTgbMNKaCZ0MpyHe?=
 =?us-ascii?Q?ShgXvQC2cwETSfJCMr/3tnNNsXOcdYPU4qTqpDtJF2wD5Q7YTazsFC9mezbh?=
 =?us-ascii?Q?9a9/FY30BqA7LiKPWOeYD5UueL302vImjsiMLYuz+nNlGkpiK4xsn3R+sesG?=
 =?us-ascii?Q?Nd+qnZSkri/tl2pnaGwQ1KVLfovGI+KtblTcv1VAWXYusSb3AhfgqrdTQ7bm?=
 =?us-ascii?Q?a2Y705sFd3YY2DMphbL1PPrvBEYgNR7BtMrIME/KAboeiQ8Q77PdWGcaKAFH?=
 =?us-ascii?Q?P8yPdAbodze4fVWwg87ZigN8S2yD8V6yzs492vV4/5q+wXjxt4CN9fBeJ+l0?=
 =?us-ascii?Q?KGQHzxIicvxt78W76mt0PSu/LECRZhdVdLOeAqNLvYFJh8cRLfvQ6bGHXD7h?=
 =?us-ascii?Q?cxTxv/HdNhTNa7WVaID6hhFOfucdvI/OfhfkAmnvQRYH6lvrxam+LIN+pQsx?=
 =?us-ascii?Q?wCradQEvAoDWPIAiSon3tA1kFTIw5vHpcKSHjnFqb4OURNv8YfX7qoZpvrLF?=
 =?us-ascii?Q?3QuYN/PDVa1UObZjZW1BzbuD7JXvpIewhJyRpqbN8XK3RjGOLGmz/yqxPZ3/?=
 =?us-ascii?Q?QyjgfHv8pGjulB4vsKl8ylGz7bCTQQmWbqookzaDUhCeseAZnYtMCq9FWOeG?=
 =?us-ascii?Q?BQJF2bV5zUiYh75dicuEU1tOwMSKKWdg5L4iU+CqLQdYRp9IpCWd5wVFCG6M?=
 =?us-ascii?Q?3oF+mVfJs/DW8kVU+7x2xN58olk1yC9yIGYyAslf8UsueMa8S+f4igHbUCec?=
 =?us-ascii?Q?E6PUm3NVY6EQjKnNdz7O3C64tUu8jerqxuQgelcydmnwWbdOC+699ECWmGlw?=
 =?us-ascii?Q?A9i06g/VGA0+stUgjZH4WJbrDyYsrxYxtQRwYt1l7A1LmCOMWmHAg+qDHlJN?=
 =?us-ascii?Q?k0fZaaAc2mcky5TGCVNLt5YpqonCPkqxom00?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 06:35:53.9512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bba50187-47f0-4154-8665-08ddeb7d4c4b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6183

HWP and amd-cppc-epp are both governor-less driver, so we introduce
"is_governor_less" flag and cpufreq_is_governorless() to help bypass
governor-related info on dealing with cpufreq para.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
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
index 274b7ea06e..85fbf772a0 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -304,4 +304,16 @@ int acpi_cpufreq_register(void);
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


