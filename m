Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA9AB4327E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 08:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109499.1459062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3ZY-0002zH-BP; Thu, 04 Sep 2025 06:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109499.1459062; Thu, 04 Sep 2025 06:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3ZY-0002wq-7e; Thu, 04 Sep 2025 06:35:52 +0000
Received: by outflank-mailman (input) for mailman id 1109499;
 Thu, 04 Sep 2025 06:35:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UG7t=3P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uu3ZW-0002id-Qo
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 06:35:50 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060f.outbound.protection.outlook.com
 [2a01:111:f403:240a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63c3be77-8959-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 08:35:48 +0200 (CEST)
Received: from MN2PR13CA0027.namprd13.prod.outlook.com (2603:10b6:208:160::40)
 by CY8PR12MB8313.namprd12.prod.outlook.com (2603:10b6:930:7d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 06:35:43 +0000
Received: from MN1PEPF0000F0E4.namprd04.prod.outlook.com
 (2603:10b6:208:160:cafe::13) by MN2PR13CA0027.outlook.office365.com
 (2603:10b6:208:160::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.7 via Frontend Transport; Thu, 4
 Sep 2025 06:35:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E4.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 06:35:42 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 01:35:42 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Wed, 3 Sep 2025 23:35:40 -0700
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
X-Inumbo-ID: 63c3be77-8959-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFClEdc6GDfz21vLXIu3qgjpcPlIl6rAcTqmg6W2EhJlHJDNqSBIW9byb3scBqK0lNHwNdCnsFO+6UGA/78HAst8wwbIQpxc0bF4KiPRpdxM6AzNPo32jbDAwOiBe//UYay8zLrp+IeZnQOPxwH42HqWCnK5MSyuHKaTgv/w20Z+fhgUSQ3hMe9BsZoJ2PhsMbSCkq5d9fik6Q7qDDK8l6dY/oBFkn0LnRcOhujykmW7AyXuGj//PYvIfKg4njbWqcIWZ+XjhJLwIG0msoamYsTu4KicAWAXookllO6fCcm9q7u/dsMIybClApJKC7nYgT9k2zgmD7G/TLmH3GED3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bDJFqa/0jwB62IgSYFWp412EHWmA50CeyfzZTWwYV/M=;
 b=Ik418D83nLVG40zTXnOqwmJWDEqmljFhbJc2CxNeDDDvwXvQyVE+zQSsKUrXKtfNef3zNOc9XAR2jFbU74PF+/czq6msJ9CCThHSbpgRtaTahgYPKbDVy8e5gXtE+k99rP4/Is4/d+DtKltS2HVEo2NnQaW2P031PkU9dsCd7itJvCrrEpq8MfMH+nEC0+jb3gJEkQ5VjQMEyayhuRiKbCPtgCK0cdcXJR0jQCiiLua4CK5dcBlEOggysCHP2LOmKFHSSOMSFfwc8aQFCh/xEUjxSn5tlEbiGdNrnxsaRseoZ0Jy/bRYv7RAy6ok3NW5rIEXVuDEoqmYoI+8KqTdBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bDJFqa/0jwB62IgSYFWp412EHWmA50CeyfzZTWwYV/M=;
 b=V1srcP3wiA9bQTCWJFyBx7N2aqZYZPeKjPB1Fp8TAKcb+hYM5G4jap6VDoI+Mz2cizWthG9m9nOEiFx/7I3/fUTMuD+8lAR3s0xBUZc0RObKq4wJGK5ttHdeFUYxnIRme91Lge0VQ2ohdUd8YJkMwoJ5UXf0V+h9ZBvzr5QDMus=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v9 1/8] xen/cpufreq: embed hwp into struct cpufreq_policy{}
Date: Thu, 4 Sep 2025 14:35:11 +0800
Message-ID: <20250904063518.2097629-2-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E4:EE_|CY8PR12MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: 0299f5e2-94bf-4c82-ae11-08ddeb7d45c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?npbfyEXTbCwjWYRBDwtBllnfzgLWntcvnYt26NJQRozP1ZxG4pQjryk1+Ghf?=
 =?us-ascii?Q?4DjTm1X1hL4yDkHxwRsdGsgyrUo1xZXe1dJFSz64P9kpzROHgXIM1daauAhg?=
 =?us-ascii?Q?sMFY+1KYU5l1BubtTcJcRi00l3zl70UNPOeGDKJfoDtgXYVe8UvpdKTN/xG6?=
 =?us-ascii?Q?qPOXEXNcq0JMUs3sn7JZNefjsJpFyPJfVSZZFO7Buf2dWlR1ech+ox7lOXHn?=
 =?us-ascii?Q?bVZ+PZQzAepi1aD8fI/KP3dV2wVKiTCb5pCGbM7MAIKp7EYDI7cQBpqs4U7I?=
 =?us-ascii?Q?3DGHPNNElMPQevJCkJHV6DvFGGejduLaMtX8ltcwXrFzNPY87HLqbTmo5v/m?=
 =?us-ascii?Q?KOg+y+ZRDJZA6FvdN+b+3gE9OQUYRs48Qowms4w2LJxXFc3dV9b0Ot6j05hf?=
 =?us-ascii?Q?NgxVsDvI7fztw1rPQixn+cCF6dupknAPXPovOVra6MXF9pgERS5kyWCwgkm+?=
 =?us-ascii?Q?aSaLsSKK/ghiqEOuglz1Hy7sJeBHlQsQvT9ehtkhj7zpLkH4SSLubnDHAxRL?=
 =?us-ascii?Q?nU+ZA1cjUhW4oO53WCIXLO4Q7+fAQIsgr6rQ27eELef2NCI+Iu0vf4aJ800r?=
 =?us-ascii?Q?hFJAgAjyABHRN912Ycc+PH3Aj74U7kxxqbvdc4/Dot8cIFYVlubbMLPlibgn?=
 =?us-ascii?Q?YRL2gXh3MQH6ITOiCvnxg77XE0B9w7jO9rNgs0lWDZCrxK0nlZtakmjzxgWk?=
 =?us-ascii?Q?P5kfVVqs3X4jhYBtS1GPCuKy6e9skShiGAnBdv0+AP0urfTj0y9gJI8AImRt?=
 =?us-ascii?Q?7qzvuGrJVyGbl4XYbmBsfNvi5NjU/3K8KwzJGzeQz2HfKUtg9tXbVhsCr1N6?=
 =?us-ascii?Q?EiF5oCGFmG1tqvk3BS2pmtPT8sJxys21W83oxFNVD9Jq22m6rTAn+icegdyz?=
 =?us-ascii?Q?h9pD2UL1RRg+W08i5DIGbVAA3zFAKMQw7qd0+8Rtg1jOyn9221VT+V+x2W2O?=
 =?us-ascii?Q?h5ewTjUSmLkKFSTRGlYd1G8vDQKtGEhIN8wvXKS6KtffSLgtm0CNjRMyPvLf?=
 =?us-ascii?Q?YR7LkNPmVzLW4dykPg3770CvHYDhzrVuP959isIdIKsDMD/jCWtcNTLurkGN?=
 =?us-ascii?Q?RUrzgqFF2hjEQ1JpPYP/Neqt2Oj+1e392E2E46/xSU64gQbFe+x4kh4Urje6?=
 =?us-ascii?Q?xTsI6RxxBn26IC9yJ2DJPv4+nOnnveHrmMz2FPkafimh6hZ4BjQA0PbAgYQT?=
 =?us-ascii?Q?ESv19vzQYgEvLi4V4W/JZwycWEjIs4MPp+YUNW5gM2CZKUQUKJLad3B7pzvD?=
 =?us-ascii?Q?3nuE71yIDmrnRX09Zst7+8W+i7Gcnppc1wZhUKiLHgVDM3AVZ+PF+SbdMn0R?=
 =?us-ascii?Q?8MAbKeSBuFAEVhcVuKgWC/hMtjfCIxcarBqVUqoJmYBsuQ+vL6pbsPw5awF3?=
 =?us-ascii?Q?5TPwm54PMBx3JxFT07fFs+fkrqFpv9RDD3jczfcrwtmhb3dJTqcCMFzm3eXj?=
 =?us-ascii?Q?O/HuA5LWtGWk81RWMfCsfVwKC6i9BPCc938TLb6XRF05qna+jFbE1cfQZtYY?=
 =?us-ascii?Q?uCd4OoU0q3Alm5/hAQJNL+D6/UB64+Ygt14e?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 06:35:42.9919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0299f5e2-94bf-4c82-ae11-08ddeb7d45c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8313

For cpus sharing one cpufreq domain, cpufreq_driver.init() is
only invoked on the firstcpu, so current per-CPU hwp driver data
struct hwp_drv_data{} actually fails to be allocated for cpus other than the
first one. There is no need to make it per-CPU.
We embed struct hwp_drv_data{} into struct cpufreq_policy{}, then cpus could
share the hwp driver data allocated for the firstcpu, like the way they share
struct cpufreq_policy{}. We also make it a union, with "hwp", and later
"amd-cppc" as a sub-struct.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v8 -> v9:
- new commit
---
 xen/arch/x86/acpi/cpufreq/hwp.c    | 32 +++++++++++++-----------------
 xen/include/acpi/cpufreq/cpufreq.h |  6 ++++++
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 240491c96a..5c98f3eb3e 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -67,7 +67,6 @@ struct hwp_drv_data
     uint8_t desired;
     uint8_t energy_perf;
 };
-static DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);
 
 #define hwp_err(cpu, fmt, args...) \
     printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, ## args)
@@ -224,7 +223,7 @@ static bool __init hwp_available(void)
 
 static int cf_check hwp_cpufreq_verify(struct cpufreq_policy *policy)
 {
-    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
+    struct hwp_drv_data *data = policy->u.hwp;
 
     if ( !feature_hwp_activity_window && data->activity_window )
     {
@@ -239,7 +238,7 @@ static int cf_check hwp_cpufreq_verify(struct cpufreq_policy *policy)
 static void cf_check hwp_write_request(void *info)
 {
     const struct cpufreq_policy *policy = info;
-    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
+    struct hwp_drv_data *data = policy->u.hwp;
     union hwp_request hwp_req = data->curr_req;
 
     data->ret = 0;
@@ -259,7 +258,7 @@ static int cf_check hwp_cpufreq_target(struct cpufreq_policy *policy,
                                        unsigned int relation)
 {
     unsigned int cpu = policy->cpu;
-    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+    struct hwp_drv_data *data = policy->u.hwp;
     /* Zero everything to ensure reserved bits are zero... */
     union hwp_request hwp_req = { .raw = 0 };
 
@@ -350,7 +349,7 @@ static void hwp_get_cpu_speeds(struct cpufreq_policy *policy)
 static void cf_check hwp_init_msrs(void *info)
 {
     struct cpufreq_policy *policy = info;
-    struct hwp_drv_data *data = this_cpu(hwp_drv_data);
+    struct hwp_drv_data *data = policy->u.hwp;
     uint64_t val;
 
     /*
@@ -426,15 +425,14 @@ static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
     policy->governor = &cpufreq_gov_hwp;
 
-    per_cpu(hwp_drv_data, cpu) = data;
+    policy->u.hwp = data;
 
     on_selected_cpus(cpumask_of(cpu), hwp_init_msrs, policy, 1);
 
     if ( data->curr_req.raw == -1 )
     {
         hwp_err(cpu, "Could not initialize HWP properly\n");
-        per_cpu(hwp_drv_data, cpu) = NULL;
-        xfree(data);
+        XFREE(policy->u.hwp);
         return -ENODEV;
     }
 
@@ -462,10 +460,8 @@ static int cf_check hwp_cpufreq_cpu_init(struct cpufreq_policy *policy)
 
 static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 {
-    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
-
-    per_cpu(hwp_drv_data, policy->cpu) = NULL;
-    xfree(data);
+    if ( policy->u.hwp )
+        XFREE(policy->u.hwp);
 
     return 0;
 }
@@ -480,7 +476,7 @@ static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
 static void cf_check hwp_set_misc_turbo(void *info)
 {
     const struct cpufreq_policy *policy = info;
-    struct hwp_drv_data *data = per_cpu(hwp_drv_data, policy->cpu);
+    struct hwp_drv_data *data = policy->u.hwp;
     uint64_t msr;
 
     data->ret = 0;
@@ -511,7 +507,7 @@ static int cf_check hwp_cpufreq_update(unsigned int cpu, struct cpufreq_policy *
 {
     on_selected_cpus(cpumask_of(cpu), hwp_set_misc_turbo, policy, 1);
 
-    return per_cpu(hwp_drv_data, cpu)->ret;
+    return policy->u.hwp->ret;
 }
 #endif /* CONFIG_PM_OP */
 
@@ -531,9 +527,10 @@ hwp_cpufreq_driver = {
 int get_hwp_para(unsigned int cpu,
                  struct xen_get_cppc_para *cppc_para)
 {
-    const struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+    const struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_policy, cpu);
+    const struct hwp_drv_data *data;
 
-    if ( data == NULL )
+    if ( !policy || !(data = policy->u.hwp) )
         return -ENODATA;
 
     cppc_para->features         =
@@ -554,8 +551,7 @@ int get_hwp_para(unsigned int cpu,
 int set_hwp_para(struct cpufreq_policy *policy,
                  struct xen_set_cppc_para *set_cppc)
 {
-    unsigned int cpu = policy->cpu;
-    struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
+    struct hwp_drv_data *data = policy->u.hwp;
     bool cleared_act_window = false;
 
     if ( data == NULL )
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 5d4881eea8..c0ecd690c5 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -62,6 +62,7 @@ struct perf_limits {
     uint32_t min_policy_pct;
 };
 
+struct hwp_drv_data;
 struct cpufreq_policy {
     cpumask_var_t       cpus;          /* affected CPUs */
     unsigned int        shared_type;   /* ANY or ALL affected CPUs
@@ -81,6 +82,11 @@ struct cpufreq_policy {
     int8_t              turbo;  /* tristate flag: 0 for unsupported
                                  * -1 for disable, 1 for enabled
                                  * See CPUFREQ_TURBO_* below for defines */
+    union {
+#ifdef CONFIG_INTEL
+        struct hwp_drv_data *hwp; /* Driver data for Intel HWP */
+#endif
+    } u;
 };
 DECLARE_PER_CPU(struct cpufreq_policy *, cpufreq_cpu_policy);
 
-- 
2.34.1


