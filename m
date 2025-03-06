Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96DEA5458C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903187.1311148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq72L-0003RZ-72; Thu, 06 Mar 2025 08:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903187.1311148; Thu, 06 Mar 2025 08:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq72L-0003PP-47; Thu, 06 Mar 2025 08:57:01 +0000
Received: by outflank-mailman (input) for mailman id 903187;
 Thu, 06 Mar 2025 08:57:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6ms-00031D-4r
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:41:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2413::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b85287fa-fa66-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 09:40:56 +0100 (CET)
Received: from CH0PR04CA0030.namprd04.prod.outlook.com (2603:10b6:610:76::35)
 by DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 08:40:52 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::c1) by CH0PR04CA0030.outlook.office365.com
 (2603:10b6:610:76::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.18 via Frontend Transport; Thu,
 6 Mar 2025 08:40:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:52 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:50 -0600
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
X-Inumbo-ID: b85287fa-fa66-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WaknFizTIlxA1falMxFxE0vnnb2yI0PDqPXWxju3+KlzudbdvD3S3dWZ9oa5maHS4rJA7OHX6NCWkpNaoFc+/j0iyxhpRibFv/mPe//bwWHmpgVvASunLTHe3h36psXpHOnIcL4/VBaomHHGxVRlhqHdqV4LWiVG3w2t1mr+ChNBVrWoslFAUlq/fEdSh88nzSrwmHco4VaVjDu/0tW+8LaaSiXDzTmsD2wK3Xk1N0jyrZ8ndVgfXpZfBEuxqqZPuFwty6G3/TujbEwtHJiAsDGSVtzR+wmydOYKujiIpX4+TX0mOg1YMdd88rnFa0NjHS7QRRComVvz9cO6mKW5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaDk1mKjKq7sTeofjEQ+HRThZokE0MCXixRYCuKGZtY=;
 b=hvIKPX5ALX968+vGzgr1zNtp8XuEcTO9RgDRrMTb3Tkdm/U+zXIO/lN1Mr1mxo4QkBmurAJO6qIJ9JLGxTwp+/OtxooHWr1M2s86nesisMvvvlUVD2LKzQpr68ru159RLCEBEoB33pF7o6S6sGYQ8mBrUd9wzFuBnNNest6Qlm+sTMYOWNx8GuCO4+I3e9PP9kdJ4mGtftiRooP+iWV9iJ3f4VAS+2zaBUpB7ShxBhnFdBoVjMEW/Eo36/9aktBY0PxxJstKC93QtFgWpx8qq38PByvHKxhZ0gVhizS6wxNEXWjlPwKaKdxW2pD6aSF/H5otcMcxNWc5Ecm83dADVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaDk1mKjKq7sTeofjEQ+HRThZokE0MCXixRYCuKGZtY=;
 b=IQScQzdyzyvyobh7E5ofSlD3sYQnnKGrOoTJCfmvdGpH7ZmdV/snmK84YjfET6uCDNzBkV2l+1krNn07nvQv8Adajxy0nu3AukuTtyY7YFq3ROb8gnCJPp0S9cyZgsaW0cCryPBeq3FIk4/yhiaC0xwMWLXqPxeqfupnDcZcq3M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 15/15] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-cppc driver
Date: Thu, 6 Mar 2025 16:39:49 +0800
Message-ID: <20250306083949.1503385-16-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306083949.1503385-1-Penny.Zheng@amd.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 78e25b0d-23e3-4a7e-c508-08dd5c8a9a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pXUhhrm6/BU/Bm1VD3IWq6hbtKDCzMcro5MMwNLiL1HZ8qF9vODmBCkuuVd5?=
 =?us-ascii?Q?GFB3856S9KBX7QB2AwLyBiEOqcqetdlmg2+wxItnrVwfpun+j4sc6QQOczkL?=
 =?us-ascii?Q?O3B8iqu6scBvHPTeoVUgp96YabhVZCF+OOQ0QU3LcogDqszRnk/oZ7NWN/wt?=
 =?us-ascii?Q?x0PZk4sRM6r79EHw2tAXWzUkob3uV9GJNI2g43XwqfaRH9t9Tn4iZLPLkXwq?=
 =?us-ascii?Q?69+YXLMVSa+1iAHjyiV4I78MEKAOEOjOBT5ZPCUMLCeNgCrzjLbTaZFZtg4t?=
 =?us-ascii?Q?l+ASTZ76B/C4LOZK7BfhzlNShMCUQ9DOl2IM4YuPIf0MB0a59JS2FDnBjXui?=
 =?us-ascii?Q?TmgRGxIBpNhFRLZPfcd/6BWdH/uZsjuPr3DLils+wQorEXw2Lc160v3sCJvs?=
 =?us-ascii?Q?/DUygyv6BeAdukFDCVVBJ2zQosh33ZMi1HG99zdDBzowhv9bt47oHwW1Zseh?=
 =?us-ascii?Q?z7HOQNfNLCbRUnsu4aexN+IHdDwMUYYjbMxsLTG8IDrbF5ybKxPauNbyOqm2?=
 =?us-ascii?Q?PXOpfBIqcQWs+rbMwkSVdJvxYKFZnM/4XiQtbsRJYoZC3QTIgxhmyfCsWSSU?=
 =?us-ascii?Q?LqAWw3aXLf4DCRkjxtbPZE6t30xtGfz7y9/9RHofIKx5pqQmoOfMcsLi59q5?=
 =?us-ascii?Q?8oeMf/nQe4e/aY2Jkym2TrPfh800s4B3X+ZWdCQA2fxBzaKCCQF7WRH/3ZYJ?=
 =?us-ascii?Q?ILI9zI1WUZtJiFsmiwlgR4TmwLfEsEb82lJNwlLTRpI/GCbP6dnyukzIEXqH?=
 =?us-ascii?Q?WEj5vF7/9pQkfDLOX3RYdL7/VhGdKY5UqEZ+qTjjaO9DhjtleIFrSYTYmV1F?=
 =?us-ascii?Q?ovylM+gFRTVYLh9ck8O2r0U2fpYm0kS5ONGaremQvw9TF9LH4TWwK8lFkMH5?=
 =?us-ascii?Q?2U/YtkyjPUFIw82oXBSl6uabbaAdG9Qy5t9vDucDFPaCekKAz4Fbk7jmiX/5?=
 =?us-ascii?Q?LpxtkuAlml0XfA/VWufM4mnqPqm9WSwfRNs/2CGhcCss7MAEW0PI2sMonGjt?=
 =?us-ascii?Q?zD/Is1QEnrOlacwVJ7Gt22Mv94vTTuHaJSpy8dFi/orNb8xhGLKpEM95nNTT?=
 =?us-ascii?Q?9VNKHnCvY7Rst1u91PqHZDOMvDbAoGUaIXZXyaqnXjXZEpGbNWx+LgacOivZ?=
 =?us-ascii?Q?6ZA8RBoWNfDJSkkoATq87MiBii8y6r29L2JbBKm1cw48kZ/d7s+8gRfLM14R?=
 =?us-ascii?Q?pSnKr8JOtyjgtOwydNgtRfKkkUV7+uArxbdZpLxx6m61QpAnETb012XGAWE4?=
 =?us-ascii?Q?jxBO7nYh0xibgykStN+9osjFi2bt1AOtHKIR7O/kYp5u9dWErI+O4cfzjYJY?=
 =?us-ascii?Q?ErsoXwOPFpQH2JwkQ6TE+qk1WqYTn8HBg1Wr4TbFs2AuQvi0IBU+0DYAWrI9?=
 =?us-ascii?Q?j0rBJnbaTzFEK8clsQXd6JK2DhK/fkG9zotsJCnBzxMEN0tifPSE4QtRtyjy?=
 =?us-ascii?Q?RSYy1ETeSKSldXNektQ6GtqO/XmTjamk9H12o+KH5LEjtXn7d0r/HA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:52.2873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e25b0d-23e3-4a7e-c508-08dd5c8a9a7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528

Introduce helper set_amd_cppc_para and get_amd_cppc_para to
SET/GET CPPC-related para for amd-cppc/amd-cppc-epp driver.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- Give the variable des_perf an initializer of 0
- Use the strncmp()s directly in the if()
---
 xen/arch/x86/acpi/cpufreq/amd-cppc.c | 124 +++++++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c            |  20 ++++-
 xen/include/acpi/cpufreq/cpufreq.h   |   5 ++
 3 files changed, 145 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/amd-cppc.c b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
index 606bb648b3..28c13b09c8 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -32,6 +32,7 @@
 
 static bool __ro_after_init opt_active_mode;
 static DEFINE_PER_CPU_READ_MOSTLY(uint8_t, epp_init);
+static bool __ro_after_init amd_cppc_in_use;
 
 struct amd_cppc_drv_data
 {
@@ -513,6 +514,123 @@ static int cf_check amd_cppc_epp_set_policy(struct cpufreq_policy *policy)
     return amd_cppc_epp_update_limit(policy);
 }
 
+int get_amd_cppc_para(unsigned int cpu,
+                      struct xen_cppc_para *cppc_para)
+{
+    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+
+    if ( data == NULL )
+        return -ENODATA;
+
+    cppc_para->features         = 0;
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
+int set_amd_cppc_para(const struct cpufreq_policy *policy,
+                      const struct xen_set_cppc_para *set_cppc)
+{
+    unsigned int cpu = policy->cpu;
+    struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
+    uint8_t max_perf, min_perf, des_perf = 0, epp;
+
+    if ( data == NULL )
+        return -ENOENT;
+
+    /* Validate all parameters - Disallow reserved bits. */
+    if ( set_cppc->minimum > UINT8_MAX || set_cppc->maximum > UINT8_MAX ||
+         set_cppc->desired > UINT8_MAX || set_cppc->energy_perf > UINT8_MAX )
+        return -EINVAL;
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
+    /* Activity window not supported in MSR */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
+        return -EOPNOTSUPP;
+
+    /* Return if there is nothing to do. */
+    if ( set_cppc->set_params == 0 )
+        return 0;
+
+    epp = per_cpu(epp_init, cpu);
+    /* Apply presets */
+    /*
+     * XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE/PERFORMANCE/BALANCE are
+     * for amd-cppc in active mode, min_perf could be set with lowest_perf
+     * representing the T-state range of performance levels, while
+     * XEN_SYSCTL_CPPC_SET_PRESET_NONE is for amd-cppc in passive mode, it
+     * depends on governor to do performance scaling, setting with
+     * lowest_nonlinear_perf to ensures performance in P-state range.
+     */
+    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
+    {
+    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        min_perf = data->caps.lowest_perf;
+        max_perf = data->caps.highest_perf;
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        min_perf = data->caps.highest_perf;
+        max_perf = data->caps.highest_perf;
+        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_BALANCE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        min_perf = data->caps.lowest_perf;
+        max_perf = data->caps.highest_perf;
+        epp = CPPC_ENERGY_PERF_BALANCE;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
+        min_perf = data->caps.lowest_nonlinear_perf;
+        max_perf = data->caps.highest_perf;
+        break;
+
+    default:
+        return -EINVAL;
+    }
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
+    return amd_cppc_write_request(cpu, min_perf, des_perf, max_perf, epp);
+}
+
+
 static const struct cpufreq_driver __initconst_cf_clobber
 amd_cppc_cpufreq_driver =
 {
@@ -533,6 +651,11 @@ amd_cppc_epp_driver =
     .exit       = amd_cppc_cpufreq_cpu_exit,
 };
 
+bool amd_cppc_active(void)
+{
+    return amd_cppc_in_use;
+}
+
 int __init amd_cppc_register_driver(void)
 {
     int ret;
@@ -552,6 +675,7 @@ int __init amd_cppc_register_driver(void)
 
     /* Remove possible fallback option */
     xen_processor_pmbits &= ~XEN_PROCESSOR_PM_PX;
+    amd_cppc_in_use = true;
 
     return ret;
 }
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 7f432be761..9c96020d69 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -261,7 +261,16 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
          !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
                   CPUFREQ_NAME_LEN) )
         ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
-    else
+    else if ( !strncmp(op->u.get_para.scaling_driver, XEN_AMD_CPPC_DRIVER_NAME,
+                       CPUFREQ_NAME_LEN) ||
+              !strncmp(op->u.get_para.scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME,
+                       CPUFREQ_NAME_LEN) )
+        ret = get_amd_cppc_para(policy->cpu, &op->u.get_para.u.cppc_para);
+
+    if ( strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
+                 CPUFREQ_NAME_LEN) &&
+         strncmp(op->u.get_para.scaling_driver, XEN_AMD_CPPC_EPP_DRIVER_NAME,
+                 CPUFREQ_NAME_LEN) )
     {
         if ( !(scaling_available_governors =
                xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
@@ -417,10 +426,13 @@ static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -ENOENT;
 
-    if ( !hwp_active() )
-        return -EOPNOTSUPP;
+    if ( hwp_active() )
+        return set_hwp_para(policy, &op->u.set_cppc);
+
+    if ( amd_cppc_active() )
+        return set_amd_cppc_para(policy, &op->u.set_cppc);
 
-    return set_hwp_para(policy, &op->u.set_cppc);
+    return -EOPNOTSUPP;
 }
 
 int do_pm_op(struct xen_sysctl_pm_op *op)
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 7c36634d40..0a2eb2a26f 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -292,5 +292,10 @@ int acpi_cpufreq_register(void);
 
 int amd_cppc_cmdline_parse(const char *s, const char *e);
 int amd_cppc_register_driver(void);
+bool amd_cppc_active(void);
+int get_amd_cppc_para(unsigned int cpu,
+                      struct xen_cppc_para *cppc_para);
+int set_amd_cppc_para(const struct cpufreq_policy *policy,
+                      const struct xen_set_cppc_para *set_cppc);
 
 #endif /* __XEN_CPUFREQ_PM_H__ */
-- 
2.34.1


