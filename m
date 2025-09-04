Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC70B432AF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 08:41:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109583.1459132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3eZ-00087m-C0; Thu, 04 Sep 2025 06:41:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109583.1459132; Thu, 04 Sep 2025 06:41:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3eZ-00085I-8Z; Thu, 04 Sep 2025 06:41:03 +0000
Received: by outflank-mailman (input) for mailman id 1109583;
 Thu, 04 Sep 2025 06:41:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UG7t=3P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uu3Zl-0002iS-QT
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 06:36:05 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20617.outbound.protection.outlook.com
 [2a01:111:f403:200a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dd60877-8959-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 08:36:04 +0200 (CEST)
Received: from BL1PR13CA0114.namprd13.prod.outlook.com (2603:10b6:208:2b9::29)
 by MW5PR12MB5681.namprd12.prod.outlook.com (2603:10b6:303:19e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 06:35:57 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::ed) by BL1PR13CA0114.outlook.office365.com
 (2603:10b6:208:2b9::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.7 via Frontend Transport; Thu, 4
 Sep 2025 06:35:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 06:35:55 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 01:35:55 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Wed, 3 Sep 2025 23:35:53 -0700
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
X-Inumbo-ID: 6dd60877-8959-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8ERicDMXk7esAREKpeSJ/clyod6mKBH6Sbeu1VSRskNSBjvui1IM1Ik9xQYOxrSMiGpR6rakQdljn8/U7DBWiJBhn6hAJCkiYcH0bH7imDQSvMhY0OaNAi4rhyF6CaHytbsxESqWjt9nC2c5E0yfuOE/lbzVHvZ+9A5iojT9xef+Olnz1nUiy9WPrZOdSvKQr+PBTv+T00gOUK2oVtEaAPxj/xhvaYZ9NWklbpUzgybIfLhE0j3JAanMZFMn+KEIlfAdL9ubvfY9/9deAGbQ9jtJrHXXxLu0bMBhu3keCw8M0yepgqNQHDdg4qjaaVNKMdIHMbL/tUQxk+K3LYiWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdIK13lLqQxTnVxJzwlBzN2oYXCoef6BWaKaomLNwtc=;
 b=ZT4Uao6HPilvedWUd9MhDz5P3PUVifwDlTJorhEMHsvD5qE61tz0KKIEgESTDqEk6GUac92Mxjv/aQoRTt7b9TaPVo7KXcyDSCKvx+PT4lR4y01Sn+wLRy6+ID7q3J3SF4saIAAj7CroOuTmC0JPtETVgEd9gpn/eJ0yY2r2wq+91uJRkZJE2P22R7P6Z5nub+40hcCuE8Bjfot+9QSrQexYWAI6YGAxYMWcrMnhZL3Mk3CF6+6LyBlC055Lj5oSzOLJlWmbSgHKLwljMWIKNUfx0mHm/gmK9YPedUv+SfFNaeeMFKfNwHcn0HwuCEvBx3ewBB6BnPyxYxSZFM9Tsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdIK13lLqQxTnVxJzwlBzN2oYXCoef6BWaKaomLNwtc=;
 b=lWC4B05T5fUHMN2WPOtI8yec8CXWu0fdymvFrhxiW6jl1nl5ZGDGqrEGfDeeQLgNiE9akzMnobhR9DY+5H4uj66sWdSK0fEhHU6O5Ch5WJECDnyPg/vPNK/wzXZtMcWju5mxX32V0ruCHRdSbbc7nPOW1GDkW6suQ7F9ny/Mp7E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v9 7/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc driver
Date: Thu, 4 Sep 2025 14:35:17 +0800
Message-ID: <20250904063518.2097629-8-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|MW5PR12MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: ab27a334-b81c-4b68-45a5-08ddeb7d4d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lBAoQOjeYcvM42KZPPejzSIkFss8ZfUrELfMsMP7wYPkwslEM6DAalBedaLN?=
 =?us-ascii?Q?pS9+tq5Zspm97lhQA8on1pdR0jCxGdEsSYVA+nznFu8jlS9G2beQj2RPOvGs?=
 =?us-ascii?Q?fwx2KFSyVm2rP+8liYhvWcH37wtzv+QmgUYd3EwK4+MynQCGJEbmi3lB87Pn?=
 =?us-ascii?Q?WpIS1/18Pryysh740bGwjHgP4gI97tcGBtCb2O1JuKRDqJRcFTIgAy2o1NM2?=
 =?us-ascii?Q?l59L0q+bxOjjLQ1+/sMEsXnGmxzZV1+OpjfRJsaNmLWuzd82iTjL7Tm6ThSh?=
 =?us-ascii?Q?tzLTdzaThesrK+57U54PDa2DKKVXiuZ519SXuxGAT4lhNiwBJg26/6Eicj3D?=
 =?us-ascii?Q?ZTP4gXlHSkcZYlrNUz9Vl1bCMDo+e+/QZLXMdWLPIJcBAdkuO3gkjIJHequ8?=
 =?us-ascii?Q?HSf1jmF17soJ+6TGSHZQP5oee14zrfGZ4FmXllN3KVOxHeKsepG8QloNfIGJ?=
 =?us-ascii?Q?nvCKpLNdY/ZQnk8FYGlZEcUSoFiAqDUicu/I0cNNKlxKesbfzEsGCssGjt+U?=
 =?us-ascii?Q?r1YJUKoCNYotVq3f02K4FjcBpE26waI8v2FTSV6hjeJu5s/SW3pBw2yYuLgQ?=
 =?us-ascii?Q?PgsjiGgcF1J7QtDGPaT1RbjDWp5qx2hgmEHoqJuDP5azUhy58/ikcH7D14ya?=
 =?us-ascii?Q?gN1DYzofJscDekWpWKWHd4o7LXbHvE8XXqQPZFtYZx85QB4LCmsIoIl1gMlj?=
 =?us-ascii?Q?uK2fKsrvb9JyMBseY788nmaBOlhVuJjwXDFuBvYcKECgQ6FSYYmQ4d+kivmn?=
 =?us-ascii?Q?KxmkJM+wLkBPGJjlVwu+9UTdacvC0yH6vOPuxIpz4bwTSCFm59tDIp+KvCqI?=
 =?us-ascii?Q?e8Qao1N+ARnMRjPnEVxktsFMcP5/ozCcuFXtlcgifhqWw78piw8AYK0X/tFP?=
 =?us-ascii?Q?7YcWaB0iMuiEJrUdqRF7uxY52/rp+B15ko0X7gCGS5xhjpYCvAC8S1EN7zQK?=
 =?us-ascii?Q?lZJocLiWnAPz/BicgvzNzNVrsLDmALTzSskomZYJ+BJz+1lZLn45deO/V9HS?=
 =?us-ascii?Q?PmUGUyWbuA6FimV9SCGZaxPCJu2gOdPKcVrHCsKUuJtZPRJdv3aL0ia3NLzZ?=
 =?us-ascii?Q?POsl5masN2rAfc0BqQiQ4Khv7PxUb+sFeoyNrhIeH7Hn+MXzI0+ZRK//6jXm?=
 =?us-ascii?Q?Jsq4drvGw5SUbSjU3JgE12yq/XyZIxdKx3WhE/ZX1aOpEsHTOQMSg/xm2Tsy?=
 =?us-ascii?Q?TMxwyBJvHZex3RCBu5KnGvgtRtEFRA5i2K9blUr5cxTHzkFNa1rM10iElpeW?=
 =?us-ascii?Q?Bqo6TIK24w6wjNLKVmiG4YwquSxQYZ5IQrcMilaDG+TpqpNi2s31I8ywDmpy?=
 =?us-ascii?Q?u2XJWTjllQ9YXiS43UyCRmJFmdR1aZwtDL4Zw7TcDFog2xbYcU38bX7UN3uw?=
 =?us-ascii?Q?imL4as+lyRT4FqEXRV/S5GyuOxhqj9gK2CnRioOvmTctBVhfTXYuLlzReQ+0?=
 =?us-ascii?Q?ylR5iH/t70cfjLPOYC6jHceIo812RFbHmN8ujYKRVKrvzJsx/IKt2b4xQohO?=
 =?us-ascii?Q?7SRS5WQakVJ/7Ui8Zk6+/Th5OeJMym1v2TLY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 06:35:55.9998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab27a334-b81c-4b68-45a5-08ddeb7d4d84
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5681

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
 tools/misc/xenpm.c                   |  13 ++-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 163 +++++++++++++++++++++++++++
 xen/drivers/acpi/pm-op.c             |  28 +++--
 xen/include/acpi/cpufreq/cpufreq.h   |   4 +
 4 files changed, 195 insertions(+), 13 deletions(-)

diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 893a0afe11..bda9c62aa0 100644
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
                p_cpufreq->u.s.scaling_cur_freq);
     }
 
+    /* Translate governor info to policy info in CPPC active mode */
+    if ( is_cppc_active )
+        printf("policy               : %s\n", p_cpufreq->u.s.scaling_governor);
+
     printf("turbo mode           : %s\n",
            p_cpufreq->turbo_enabled ? "enabled" : "disabled or n/a");
     printf("\n");
diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 80b829b84e..01203c65b1 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -561,6 +561,169 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
     return 0;
 }
 
+#ifdef CONFIG_PM_OP
+int amd_cppc_get_para(const struct cpufreq_policy *policy,
+                      struct xen_get_cppc_para *cppc_para)
+{
+    const struct amd_cppc_drv_data *data = policy->u.amd_cppc;
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
+    struct amd_cppc_drv_data *data = policy->u.amd_cppc;
+    uint8_t max_perf, min_perf, des_perf, epp;
+    bool active_mode = cpufreq_is_governorless(policy->cpu);
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
+    amd_cppc_write_request(policy->cpu, data,
+                           min_perf, des_perf, max_perf, epp);
+
+    return 0;
+}
+#endif /* CONFIG_PM_OP */
+
 static const struct cpufreq_driver __initconst_cf_clobber
 amd_cppc_cpufreq_driver =
 {
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 371deaf678..bcb3b9b2a7 100644
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
+        strlcpy(op->u.get_para.u.s.scaling_governor,
+                policy->governor->name, CPUFREQ_NAME_LEN);
+    else
+        strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
+                CPUFREQ_NAME_LEN);
+
     if ( !cpufreq_is_governorless(op->cpuid) )
     {
         if ( !(scaling_available_governors =
@@ -178,13 +191,6 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
         op->u.get_para.u.s.scaling_max_freq = policy->max;
         op->u.get_para.u.s.scaling_min_freq = policy->min;
 
-        if ( policy->governor->name[0] )
-            strlcpy(op->u.get_para.u.s.scaling_governor,
-                    policy->governor->name, CPUFREQ_NAME_LEN);
-        else
-            strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
-                    CPUFREQ_NAME_LEN);
-
         /* governor specific para */
         if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
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
index 85fbf772a0..adecf57e18 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -303,6 +303,10 @@ int acpi_cpufreq_register(void);
 
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


