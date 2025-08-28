Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DADB39938
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:11:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098229.1452344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZbN-0002y8-Ir; Thu, 28 Aug 2025 10:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098229.1452344; Thu, 28 Aug 2025 10:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZbN-0002vL-EF; Thu, 28 Aug 2025 10:11:29 +0000
Received: by outflank-mailman (input) for mailman id 1098229;
 Thu, 28 Aug 2025 10:11:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urZWV-0008DS-Pm
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:06:27 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2412::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a82384a0-83f6-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 12:06:27 +0200 (CEST)
Received: from CH0PR04CA0013.namprd04.prod.outlook.com (2603:10b6:610:76::18)
 by BL3PR12MB6474.namprd12.prod.outlook.com (2603:10b6:208:3ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Thu, 28 Aug
 2025 10:06:18 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::c) by CH0PR04CA0013.outlook.office365.com
 (2603:10b6:610:76::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Thu,
 28 Aug 2025 10:06:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 10:06:18 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:06:18 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 28 Aug 2025 03:06:16 -0700
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
X-Inumbo-ID: a82384a0-83f6-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6MDdO3lNzgXpfvdqZ1dpv2k/nIQpdXINaKryd+WiRTvhb6fT2RKR1lK0ILK8sc+whaUwd7xEHslyTP4uTuTxdgoJdhBV1sVVGnGR71d8dUiMopMykevtY5U5GXmhLFmfihKaV8VYhu7zaPBqSR8KAah1/K6e9P+w3KcGbwESf0z30RupgfGzuS0Qkg4Dt8iG3HIP6DH/X4a42r/lF5sSNcRnnn30OBNsUKZwEV76iwvAeHYQ9DUgJqIg6/fSi9aUnjl8CR4GFCXE2NOeEjmKv6v7h4Gb7V0BXsfHXx6ENQAxwu8XIj+MPRAx2MuxLzCOHeFYZ7mBhUDcLHNxwYd3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwmF82IQ0gCZiWGuQ44M3PhUcguFvpm2RtKCzU1jWB4=;
 b=B1/hxdFMLJHeKzIp73Gceh/vLD5gqHtTj3VUTT9MrXPZKmxs5AnAw/9ah3HzPT5PxdzpEc236h0ZzJiw3JjufNW/R6C952081KM+G4ePvi2wPphlepl3pH9ZSAqrjLc69VjCrowSFfIcKkB0zRZwcjFM0oQS2N7J3Za5cXqRedpQatnfjh+t8YrWqiP9hgnmpgp66RO5VzP3wCG4GjRxOzIfWHD6g2ekCwS5YohGQdxT9nPMx5KgluQCoD9pJVWTlUC6uA/jRebcm91KxS2v/BPCCjzIrBjX+2jpCaCqJUbFTfND+NcFuj+feNh37p+tJt+yecPgFhcUKVal+WpxMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwmF82IQ0gCZiWGuQ44M3PhUcguFvpm2RtKCzU1jWB4=;
 b=F2JDwxwQryYhSYGFyOmRgFRFMCuPNU8Y+Rj3gY8ZE509r5s1cq4Q8Vj32DySPWcIEftQUd5iqxQViPSIO7+7XRxbSUVuK3+4Fg5CG4c2DVaZuZoC++LCFEKZty29Vi1k6kS8Gnuwxlq3VK46KkJcAXHbQx90v+/bJsOGolmVChQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v8 8/8] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc driver
Date: Thu, 28 Aug 2025 18:06:01 +0800
Message-ID: <20250828100601.1777197-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|BL3PR12MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: b7b54236-2d3a-4e87-c0fb-08dde61a8843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?169UKZUHuKBqAMowogzOiK5bKVvM1ycbQIhsS8CQabj13R18RjnX+SMjdk9y?=
 =?us-ascii?Q?7cj1AL8tYI83o/SsXA6a0OoEBz/JW4fwtKeR4D2NcQgwNyai+RUS8JMCNnYB?=
 =?us-ascii?Q?Zcuhyhr1vQMe66Qj+2CV9h2C3RYUlDN/GoW02gqq+UqkV50ja51Vwwjh0tbV?=
 =?us-ascii?Q?NP365mqkUXisUXZylZTa0gz+tZP0NO6g4XOSaQfepxi8vQh/dtXwax4yDgdI?=
 =?us-ascii?Q?ORwORyZ3XTnlvp2BVtFwgoyXZ++AQumiwkrr8XIvaN5MJS/oLv9hvCcBa4YD?=
 =?us-ascii?Q?UHkypcr354iaCef/U/EJQ95pv0dSICtlBDYoF6Fkb2KHSeFqCjTpWk+0YPa2?=
 =?us-ascii?Q?82Bo4GGHxcucycNWIuA9RtmcV2U5ep38k9HnA8RmekFoYP00wHhB3o+Pi7TO?=
 =?us-ascii?Q?Y1NqlAEoi6FwwzoQzIBfGTv6yG9mln8F76v4H6NdwxghUr1Krhm/lpG2lJRr?=
 =?us-ascii?Q?41sxkGQzZoWJpJ0jCBM3EIh242Hy8beFOZ5jHWr1tG2ZwY3vqlZWCOO4lHG+?=
 =?us-ascii?Q?CBE1QnZ0Dg6QCrt8S2xRnU6tR4T5oVke47WKv26sTlGyc5NngjNzQMox06oR?=
 =?us-ascii?Q?mw3ItepmskfeHlDvuP3vwZftxMlRnO7n1KJpgKN4vVdEC6Nsqmv8xPoDoIOM?=
 =?us-ascii?Q?pOQGuPd/QTVRr/3D04HJeUHeGLPbukmYTJ78FYOX/0dJhGT+au2LqYeOQwA5?=
 =?us-ascii?Q?ZWD4klMhrGTsNyEjFoOXh1HX8eqLXgiejFdmOJTmwaaqYRbcqXeCzhm8aEAS?=
 =?us-ascii?Q?skGHdnwg3AhxHBh93fMyJcOfeSwy7r+rOXyec+6xLsurWk0Zx7NQMpoWus0r?=
 =?us-ascii?Q?ma5zObkANLL9jq7dWd+97SLPAnTYtPZ15Q5AKSNse52oxMy8iT0Dr2XFI6k1?=
 =?us-ascii?Q?+MWOECD64fxlNtn2z1T2gjRSOHs3A4jCePVtMVQy6Ql0buOO48M2p4jT6fX0?=
 =?us-ascii?Q?4A6AyXVNapzF84iGrTPFDWZiwiHW87ZXAOSRTlXlojrp4Iqx+jQt0hJPA/F4?=
 =?us-ascii?Q?HWFlnbohVIk5lFwjhW1k+wOgoKCkLnG0uZYYYEzDLjEhOExuXqdU7LyxPvrx?=
 =?us-ascii?Q?cJPPgdxpIb/f5T6ZUtJQfLsl6h4y+8XysN805U4qRRT80J7RXUmx3THcvOnY?=
 =?us-ascii?Q?cvNSWKW/5Gjp7e/VIUP5kSfbnbxxx6txnRVbKqPRP1jBlSmcaNby8RfLOmSh?=
 =?us-ascii?Q?fK+BaA2OtuSfFNwQ0i9TPkbmpYYq2nQ/gpKJOL24m99O3sWh1N+0q18ek59l?=
 =?us-ascii?Q?RLMiV/FhJhjJgc1fb4p0sEGNwgceJsO6Chl0097DhoSGojnaVFsWFajE32I3?=
 =?us-ascii?Q?UCknYdwWzZrw/fFQ3puP8xX/RkPP7r9jdX/lt4rpPVz5o8JsIFwDyeQ7GUwr?=
 =?us-ascii?Q?VwwVG1ouZOSQhyNkyFrON3M2LpWHYAWJfobt1WIr6OvubKDws8p+JN9pziqp?=
 =?us-ascii?Q?BU90LrxAknA8TAsqfK9KJNhiQeu0WP+TXf7+cyWNwdDlzBmnZbeTtt+Rg52+?=
 =?us-ascii?Q?jkH62u3agWrmk6LzysMFs/ZU7c7rfVTCLB8B?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:06:18.5594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b54236-2d3a-4e87-c0fb-08dde61a8843
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6474

Introduce helper set_amd_cppc_para() and get_amd_cppc_para() to
SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.

In get_cpufreq_cppc()/set_cpufreq_cppc(), we include
"processor_pminfo[cpuid]->init & XEN_CPPC_INIT" condition check to deal with
cpufreq driver in amd-cppc.
We also borrow governor field to indicate policy info for CPPC active mode.

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
 tools/misc/xenpm.c                   |  13 ++-
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 164 +++++++++++++++++++++++++++
 xen/drivers/acpi/pm-op.c             |  28 +++--
 xen/include/acpi/cpufreq/cpufreq.h   |   4 +
 4 files changed, 196 insertions(+), 13 deletions(-)

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


