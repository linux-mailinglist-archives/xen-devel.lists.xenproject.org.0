Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D765B943DD
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 06:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128135.1468661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0uoF-0002hR-Hq; Tue, 23 Sep 2025 04:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128135.1468661; Tue, 23 Sep 2025 04:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0uoF-0002dG-AL; Tue, 23 Sep 2025 04:39:23 +0000
Received: by outflank-mailman (input) for mailman id 1128135;
 Tue, 23 Sep 2025 04:39:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rt6+=4C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1v0uoD-00015C-UH
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 04:39:22 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45275ce6-9837-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 06:39:20 +0200 (CEST)
Received: from SJ0PR03CA0374.namprd03.prod.outlook.com (2603:10b6:a03:3a1::19)
 by DS0PR12MB8246.namprd12.prod.outlook.com (2603:10b6:8:de::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 04:39:12 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::de) by SJ0PR03CA0374.outlook.office365.com
 (2603:10b6:a03:3a1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Tue,
 23 Sep 2025 04:39:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.0 via Frontend Transport; Tue, 23 Sep 2025 04:39:12 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 21:39:09 -0700
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
X-Inumbo-ID: 45275ce6-9837-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaoqWsz/5L5gZWwdXECJu7PEFTpDrQvFO9cXmLC+XFfRB1newC06nHGywQr6QCaH5bTioVD9aSW47Os0yjxcbZ3SY3dsAs1JHAmz0QK7aFE5ZWoG8Gy0m8//nqH4QkoLwfTERhNRJu7tUavzUO290nEgWC82aae+L8xqwz9rIL+fBHDaCIP/oKCo14nafTqj03qQoLY+FTAKCom7aG5SvSQ4ZnHllD9NmbNS/chFrHP1Iy8PJ+htBkzPKvWF9Kt1jK1yfr7KaSQOwAyaYZtAt1k+i/XXH+ghZvyAlzUep6mM7q+PW4lrNe2DseMzEOaza+ezQUVYM43FRvkF7UA57w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7srDNjX3Fozlujk+KvOJtuDAG4CLu0iQunF49gZwo4Y=;
 b=GO8jJVQf7c3MKgb9/QSRDhfgv+UiDjXTYFosFM8ou400onKjVfcpd346VXc+bcmwtWa1uPRFZRiMYBF7upA3Er3voSWUHipqX5jDzPdbFoBg5mE5auW0rwqmuTIGDFJwdrwOfQIWIhyibkLOn2eC6GLjU4LGeC0HikE1hLC4GajT6CeXnk9sfgNDefYUhZMO3Ynn5NJErpI3ZIHd/3lHGwqiLqvRVEpnyP0ot5xjMu9d3hq7EjzPxFJ1IBpfe8dPQHhTNjzSf1VFaLZpjDV/5JYUqevY1JVdhYRZ5KG+U+G7Fbay3vr9jrxP+XXyNRxOa0FL2ETYM1oLDPDPb3WeBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7srDNjX3Fozlujk+KvOJtuDAG4CLu0iQunF49gZwo4Y=;
 b=ft7cka4vx5CKM7zDkDmlz4nDKU3rDgRJYyNAmkLET89KdYPV+4xF70QCmeKT7YyoK30h7ut+4/mR4+6HoHhRIyUH5514uQ7L7J4l/JNW4wP8b95NHZ6vqKs4NQ8inNmxzFnOv48PDd8rzrE1CyfyZsVd0a+7mw0+aHJeCS4qI4E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v10 7/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc driver
Date: Tue, 23 Sep 2025 12:38:25 +0800
Message-ID: <20250923043826.3831957-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250923043826.3831957-1-Penny.Zheng@amd.com>
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|DS0PR12MB8246:EE_
X-MS-Office365-Filtering-Correlation-Id: 167bf80e-54d2-4add-b1dc-08ddfa5b24c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U+O331bLXyaieYjuG2JwYrnjyznqYmSdZMI0j7tU6eofd7u9BBtR2wH1+FnS?=
 =?us-ascii?Q?pK2hr57yDzjk4r3JFb+RbH4LYIANNInihLioMDPiJRz31pShr1iR71iaa1yZ?=
 =?us-ascii?Q?9RCkkfOq+jyrINPKABg+FhnRraGq63Z0R+Rnsm97R04Nh5lVcKl1tCWrbOmD?=
 =?us-ascii?Q?NpPn8Eq46nuxkqy6NkLS9tEXd67AuTviSi/aMrly2ZNBb0kU6LBnnWHxw6n6?=
 =?us-ascii?Q?0dULUlk3Scld7AdU7Xz4jQqiAP6Qzafs6tqq0XVJta3u2xZtNU6vGRYdHNo1?=
 =?us-ascii?Q?rEbF1fGwBCXlgXcSlMoBSs/KDJrxnX2sG5in6OIRT3nzVGkP1qnZpF6MVWRn?=
 =?us-ascii?Q?hArnLFCVKil7Z0XQyXjO18xOTes84QXNZQBbhq7dy4cYlmwViwUVX5xyoOm7?=
 =?us-ascii?Q?KukJd/48GCf55DCz3cNyc9ucZRx/JhzdYsuk8ajgc1yPXBZPmvkPJvvYB93F?=
 =?us-ascii?Q?uIQfJ4pIw3WEEgHTfvFzMNcxp+ZmUjUQT1uC39OKbuv5yYIwL1cieMQjQPYo?=
 =?us-ascii?Q?8ueEGBWVBVxxly3E+4D59zvBDB5EjLefBr3JnzwDtSn0A9aNvZ8aJ2dEkC67?=
 =?us-ascii?Q?z2lSWLftXykInatjt5fneYRwZGa+2c3rvZ47onoqfh4AlEIXeALkV/Oepx7S?=
 =?us-ascii?Q?kONwdWoOM4AYVmjot38MXm5Jehb9P8lN2zMeRICH71BNE0CfXycmOJMucLlB?=
 =?us-ascii?Q?897LQx6NB1R/KjUxdx64gNTHnDaiKEvbOxV2P+MzOgtk80GuvhnqG7hvIl0W?=
 =?us-ascii?Q?9OkyZS6ER5Xgqo8woRefRGf8uwZEqsw+dN166f0FK2K33r0ZJHBtBKgyA442?=
 =?us-ascii?Q?PhaChKDidOTbyWGR0+tSTbvsXtnXiDBSVuG1XYjyFUTZVZ7yydu47HVkSaFW?=
 =?us-ascii?Q?d0eHJgzlANLELubn7z1M+5STlYkkKOkU3+j0HOGfd5Nl6lHdH2RfjCa+lquO?=
 =?us-ascii?Q?wYJB8oh+vF5yVovI03BLyUIo7GqfDDGroVaX7glOZlU6Tiwu9th974d/LjLo?=
 =?us-ascii?Q?L7k/uVhvNaOK1NSUpIWQ+MmIMtsQVcycRxI2PRO75YezbamWPsq91Lhkh+3J?=
 =?us-ascii?Q?vvN8ipYppR3sKYwHdOzV1yW8cIxmHoXaHqP8WmhAwUdqQXrM2290CgDrQpEm?=
 =?us-ascii?Q?uqQkSOuKG/zdIzk7GjYZ1af7SMF1Fol5KXNWYXKuDwtwEM5Rz3yZfIqmWwDs?=
 =?us-ascii?Q?pryXBOCS2n7VHVndAm/CVqJpUXXhVvg77CM6LC/lHbgbwZPms2otIkSAjZbu?=
 =?us-ascii?Q?awcf/rF1uo9NuuXhfLO+TN25wlvcpgGwE9GcdNG8Nk7zI5M8eV5IwJtxttc7?=
 =?us-ascii?Q?0LUautLhwNpjxiZYfgLAa54ymlZnDXP3hOM9lR9kkmIFqvn4Cu1X4FndkgcB?=
 =?us-ascii?Q?YXeRDV+epClcH6eX5ZglhzP+A++FnUJ1CtBKB9XmKgESu8np/rlhUe9hPUrK?=
 =?us-ascii?Q?O++o4r8p2V+QKx9Q9ksNUnAac4zTuGcSwwo53OGQ2NV0s/Sb4idinw64sgoI?=
 =?us-ascii?Q?u3QMPXCCMFVMN/wBULRMVS403s8OIU4tZn/W?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 04:39:12.1302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 167bf80e-54d2-4add-b1dc-08ddfa5b24c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8246

Introduce helper set_amd_cppc_para() and get_amd_cppc_para() to
SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.

In get_cpufreq_cppc()/set_cpufreq_cppc(), we include
"processor_pminfo[cpuid]->init & XEN_CPPC_INIT" condition check to deal with
cpufreq driver in amd-cppc.
We borrow governor field to indicate policy info for CPPC active mode,
so we need to move the copying of the governor name out of the
!cpufreq_is_governorless() guard.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
v1 -> v2:
- Give the variable des_perf an initializer of 0
- Use the strncmp()s directly in the if()
---
v3 -> v4
- refactor comments
- remove double blank lines
- replace amd_cppc_in_use flag with XEN_PROCESSOR_PM_CPPC
---
v4 -> v5:
- add new field "policy" in "struct xen_cppc_para"
- add new performamce policy XEN_CPUFREQ_POLICY_BALANCE
- drop string comparisons with "processor_pminfo[cpuid]->init & XEN_CPPC_INIT"
and "cpufreq.setpolicy == NULL"
- Blank line ahead of the main "return" of a function
- refactor comments, commit message and title
---
v5 -> v6:
- remove duplicated manifest constants, and just move it to public header
- use "else if" to avoid confusion that it looks as if both paths could be taken
- add check for legitimate perf values
- use "unknown" instead of "none"
- introduce "CPUFREQ_POLICY_END" for array overrun check in user space tools
---
v6 -> v7:
- use ARRAY_SIZE() instead
- ->policy print is avoided in passive mode and print "unknown" in invalid
cases
- let cpufreq_is_governorless() being the variable's initializer
- refactor with the conditional operator to increase readability
- move duplicated defination ahead and use local variable
- avoid using "else-condition" to bring "dead code" in Misra's nomeclature
- move the comment out of public header and into the respective internal
struct field
- wrap set{,get}_amd_cppc_para() with CONFIG_PM_OP
- add symmetry scenario for maximum check
---
v7 -> v8:
- change function name to amd_cppc_get{,set}_para()
- fix too deep indentation, and indent according to pending open parentheses
- missing -EINVAL when no flag is set at all
- use new helper amd_cppc_prepare_policy() to reduce redundancy
- borrow governor field to indicate policy info
---
v8 -> v9
- add description of "moving the copying of the governor name"
- Adapt to changes of "Embed struct amd_cppc_drv_data{} into struct
cpufreq_policy{}"
---
v9 -> v10
- adapt to changes of "dropping outter union"
- rewind changes in v8
---
 tools/misc/xenpm.c                   |  13 ++-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 164 +++++++++++++++++++++++++++
 xen/drivers/acpi/pm-op.c             |  28 +++--
 xen/include/acpi/cpufreq/cpufreq.h   |   4 +
 4 files changed, 196 insertions(+), 13 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 682d092479..1f3c104cfc 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -832,11 +832,14 @@ static void print_cppc_para(unsigned int cpuid,
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
-    bool is_governor_less = false;
+    bool is_governor_less = false, is_cppc_active = false;
     int i;
 
-    if ( !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) ||
-         !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
+    if ( !strcmp(p_cpufreq->scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME) )
+        is_cppc_active = true;
+
+    if ( is_cppc_active ||
+         !strcmp(p_cpufreq->scaling_driver, XEN_HWP_DRIVER_NAME) )
         is_governor_less = true;
 
     printf("cpu id               : %d\n", cpuid);
@@ -899,6 +902,10 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
                p_cpufreq->s.scaling_cur_freq);
     }
 
+    /* Translate governor info to policy info in CPPC active mode */
+    if ( is_cppc_active )
+        printf("policy               : %s\n", p_cpufreq->s.scaling_governor);
+
     printf("turbo mode           : %s\n",
            p_cpufreq->turbo_enabled ? "enabled" : "disabled or n/a");
     printf("\n");
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index bb7f4e4a9e..eca455240f 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -566,6 +566,170 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
     return 0;
 }
 
+#ifdef CONFIG_PM_OP
+int amd_cppc_get_para(const struct cpufreq_policy *policy,
+                      struct xen_get_cppc_para *cppc_para)
+{
+    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data,
+                                                   policy->cpu);
+
+    if ( data == NULL )
+        return -ENODATA;
+
+    cppc_para->lowest           = data->caps.lowest_perf;
+    cppc_para->lowest_nonlinear = data->caps.lowest_nonlinear_perf;
+    cppc_para->nominal          = data->caps.nominal_perf;
+    cppc_para->highest          = data->caps.highest_perf;
+    cppc_para->minimum          = data->req.min_perf;
+    cppc_para->maximum          = data->req.max_perf;
+    cppc_para->desired          = data->req.des_perf;
+    cppc_para->energy_perf      = data->req.epp;
+
+    return 0;
+}
+
+int amd_cppc_set_para(struct cpufreq_policy *policy,
+                      const struct xen_set_cppc_para *set_cppc)
+{
+    unsigned int cpu = policy->cpu;
+    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+    uint8_t max_perf, min_perf, des_perf, epp;
+    bool active_mode = cpufreq_is_governorless(cpu);
+
+    if ( data == NULL )
+        return -ENOENT;
+
+    /* Only allow values if params bit is set. */
+    if ( (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED) &&
+          set_cppc->desired) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
+          set_cppc->minimum) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
+          set_cppc->maximum) ||
+         (!(set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF) &&
+          set_cppc->energy_perf) )
+        return -EINVAL;
+
+    /* Return if there is nothing to do. */
+    if ( set_cppc->set_params == 0 )
+        return 0;
+
+    /*
+     * Validate all parameters
+     * Maximum performance may be set to any performance value in the range
+     * [Nonlinear Lowest Performance, Highest Performance], inclusive but must
+     * be set to a value that is larger than or equal to minimum Performance.
+     */
+    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM) &&
+         (set_cppc->maximum > data->caps.highest_perf ||
+          (set_cppc->maximum <
+           (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM
+            ? set_cppc->minimum
+            : data->req.min_perf))) )
+        return -EINVAL;
+    /*
+     * Minimum performance may be set to any performance value in the range
+     * [Nonlinear Lowest Performance, Highest Performance], inclusive but must
+     * be set to a value that is less than or equal to Maximum Performance.
+     */
+    if ( (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM) &&
+         (set_cppc->minimum < data->caps.lowest_nonlinear_perf ||
+          (set_cppc->minimum >
+           (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM
+            ? set_cppc->maximum
+            : data->req.max_perf))) )
+        return -EINVAL;
+    /*
+     * Desired performance may be set to any performance value in the range
+     * [Minimum Performance, Maximum Performance], inclusive.
+     */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+    {
+        if ( active_mode )
+            return -EOPNOTSUPP;
+
+        if ( (set_cppc->desired >
+              (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM
+               ? set_cppc->maximum
+               : data->req.max_perf)) ||
+             (set_cppc->desired <
+              (set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM
+               ? set_cppc->minimum
+               : data->req.min_perf)) )
+            return -EINVAL;
+    }
+    /*
+     * Energy Performance Preference may be set with a range of values
+     * from 0 to 0xFF
+     */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF )
+    {
+        if ( !active_mode )
+            return -EOPNOTSUPP;
+
+        if ( set_cppc->energy_perf > UINT8_MAX )
+            return -EINVAL;
+    }
+
+    /* Activity window not supported in MSR */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
+        return -EOPNOTSUPP;
+
+    des_perf = data->req.des_perf;
+    /*
+     * Apply presets:
+     * XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE/PERFORMANCE/ONDEMAND are
+     * only available when CPPC in active mode
+     */
+    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
+    {
+    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
+        if ( !active_mode )
+            return -EINVAL;
+        policy->policy = CPUFREQ_POLICY_POWERSAVE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
+        if ( !active_mode )
+            return -EINVAL;
+        policy->policy = CPUFREQ_POLICY_PERFORMANCE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_ONDEMAND:
+        if ( !active_mode )
+            return -EINVAL;
+        policy->policy = CPUFREQ_POLICY_ONDEMAND;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
+        if ( active_mode )
+            policy->policy = CPUFREQ_POLICY_UNKNOWN;
+        break;
+
+    default:
+        return -EINVAL;
+    }
+    amd_cppc_prepare_policy(policy, &max_perf, &min_perf, &epp);
+
+    /* Further customize presets if needed */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MINIMUM )
+        min_perf = set_cppc->minimum;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_MAXIMUM )
+        max_perf = set_cppc->maximum;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ENERGY_PERF )
+        epp = set_cppc->energy_perf;
+
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+        des_perf = set_cppc->desired;
+
+    amd_cppc_write_request(cpu, min_perf, des_perf, max_perf, epp);
+
+    return 0;
+}
+#endif /* CONFIG_PM_OP */
+
 static const struct cpufreq_driver __initconst_cf_clobber
 amd_cppc_cpufreq_driver =
 {
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 4cca42c4fc..ed4e0d4335 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -84,6 +84,8 @@ static int get_cpufreq_cppc(unsigned int cpu,
 
     if ( hwp_active() )
         ret = get_hwp_para(cpu, cppc_para);
+    else if ( processor_pminfo[cpu]->init & XEN_CPPC_INIT )
+        ret = amd_cppc_get_para(per_cpu(cpufreq_cpu_policy, cpu), cppc_para);
 
     return ret;
 }
@@ -154,6 +156,17 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
+    /*
+     * In CPPC active mode, we are borrowing governor field to indicate
+     * policy info.
+     */
+    if ( policy->governor->name[0] )
+        strlcpy(op->u.get_para.s.scaling_governor,
+                policy->governor->name, CPUFREQ_NAME_LEN);
+    else
+        strlcpy(op->u.get_para.s.scaling_governor, "Unknown",
+                CPUFREQ_NAME_LEN);
+
     if ( !cpufreq_is_governorless(op->cpuid) )
     {
         if ( !(scaling_available_governors =
@@ -178,13 +191,6 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
         op->u.get_para.s.scaling_max_freq = policy->max;
         op->u.get_para.s.scaling_min_freq = policy->min;
 
-        if ( policy->governor->name[0] )
-            strlcpy(op->u.get_para.s.scaling_governor,
-                    policy->governor->name, CPUFREQ_NAME_LEN);
-        else
-            strlcpy(op->u.get_para.s.scaling_governor, "Unknown",
-                    CPUFREQ_NAME_LEN);
-
         /* governor specific para */
         if ( !strncasecmp(op->u.get_para.s.scaling_governor,
                           "userspace", CPUFREQ_NAME_LEN) )
@@ -321,10 +327,12 @@ static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -ENOENT;
 
-    if ( !hwp_active() )
-        return -EOPNOTSUPP;
+    if ( hwp_active() )
+        return set_hwp_para(policy, &op->u.set_cppc);
+    if ( processor_pminfo[op->cpuid]->init & XEN_CPPC_INIT )
+        return amd_cppc_set_para(policy, &op->u.set_cppc);
 
-    return set_hwp_para(policy, &op->u.set_cppc);
+    return -EOPNOTSUPP;
 }
 
 int do_pm_op(struct xen_sysctl_pm_op *op)
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 7caeae26cf..e8b4e955a2 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -293,6 +293,10 @@ int acpi_cpufreq_register(void);
 
 int amd_cppc_cmdline_parse(const char *s, const char *e);
 int amd_cppc_register_driver(void);
+int amd_cppc_get_para(const struct cpufreq_policy *policy,
+                      struct xen_get_cppc_para *cppc_para);
+int amd_cppc_set_para(struct cpufreq_policy *policy,
+                      const struct xen_set_cppc_para *set_cppc);
 
 /*
  * Governor-less cpufreq driver indicates the driver doesn't rely on Xen
-- 
2.34.1


