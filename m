Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12769E15F4
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:38:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847458.1262541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOQD-0000bM-MF; Tue, 03 Dec 2024 08:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847458.1262541; Tue, 03 Dec 2024 08:38:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOQD-0000Yy-JO; Tue, 03 Dec 2024 08:38:17 +0000
Received: by outflank-mailman (input) for mailman id 847458;
 Tue, 03 Dec 2024 08:38:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIOQB-0000Yo-Ae
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:38:15 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2418::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eec53702-b151-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 09:38:13 +0100 (CET)
Received: from DS7PR07CA0008.namprd07.prod.outlook.com (2603:10b6:5:3af::21)
 by DS0PR12MB7701.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 08:38:09 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::bd) by DS7PR07CA0008.outlook.office365.com
 (2603:10b6:5:3af::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Tue,
 3 Dec 2024 08:38:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 08:37:19 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:37:16 -0600
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
X-Inumbo-ID: eec53702-b151-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQ4t+E8YhMECFg1m3ObhAR/x+Y13kKeauuR2K++feAV4LpnuSZxmQVEmmEUl7T9ULyMdsfddaf+aQlOFw8HyTnWTFkH+GhoiQojcsS5dqVK23R0MDGIBiVRsJWXxMDwkYjdB3E9oDqospzkmey9QrC4P45sFEWgqxJso4kd/15gxggXLRwYPcW56Ny0ttk3iMfUl9WBo0CS5Xzx4UtS8gs6jAZpFOROSwR9A4g/yhDxL3WYeSO7WXYz+QAnzwJ0EhaHBtxYqFODo7srDZD900ig9lpuEBCtC09LNN8Bu8hwipV/l1UIRRfwr+q5p0+dew3F7gXkGQdwip148fDulrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2P9uY49wOAkSXwRdYzJBulEXJpWyFUaFXnQvFqoUiY=;
 b=dy8pAjXTdNJ2+XXHNtcG+AEgVQGG7wnOcFihBPlLMPoTQgeXBuSTHrhVGp3vVvQMEJBkztB1J591gXrKXvXudOAoa+jH+TTda/arg6fXTHs1+Qaclwr+7lNKSq/co7IEInPMGqR9aBAeMe8u2rOAUQIDBoY3dI1XQ1042hfS8LYknESJ/YFczZlsBf4AuH65bF84TRrphn74dA/s8jjI+F/ryWPPARezG6VL5Xah+AEbrH0MF4T8SShAsXCUmkJJm5IbW5+px1TCEAGiNY76Nzv0+KzGGupmFcCh4ZsKgSaquAIDdPI7xmutM9cKVe5JOdEbt/QOLwbDz6g5jRc0pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2P9uY49wOAkSXwRdYzJBulEXJpWyFUaFXnQvFqoUiY=;
 b=YyJAAQOuYg9QwcHejx4gnZ/EIO9DwOXgm3tK5C6XfEoTyHSKryjg78glev26FDDxwkAoqVbOGCmM70avmr6sbZ67NxT22OnO4pkg8Sl2UaO9ZeOK6cjGmfRXkMAvKoDkMgiu72BDIJeDABX9zo7a5ILj69aZFUeb/O5B4Ljc6lA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <Ray.Huang@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>, <penny.zheng@amd.com>,
	Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v1 11/11] xen/cpufreq: Adapt SET/GET_CPUFREQ_CPPC xen_sysctl_pm_op for amd-pstate driver
Date: Tue, 3 Dec 2024 16:35:35 +0800
Message-ID: <20241203083535.463533-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|DS0PR12MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 862962be-f0f0-4f2f-e16d-08dd1375d077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D+m1Y1EtbE75H87IXViBEXGpik6cDqKbn05jSjj7QmTA6Dmi7jPqW8Pj9MVe?=
 =?us-ascii?Q?WauTSHf/lbGDiP8YrI4y880Rfq7pkXBZboYK1Vkc+8aLnCVuscOSP3uOIN1K?=
 =?us-ascii?Q?qWnToDLSOhnZ22TWn809z4el4TmMLSwcrbLh6bjkxPhYSrXRii2ffOzwCdKl?=
 =?us-ascii?Q?jaMrM7iovHi7cfPx3I6+cZOQKYg1UlEw7NQlsDl0A4WcxCB4Z/m0eb91JzCe?=
 =?us-ascii?Q?buLh91A7HnGgW8cwu4IOI6dIXveyOL3GQeo5D8grv2DbpvL4M6Y/NgvcSART?=
 =?us-ascii?Q?yQeert1P0uwnol7GkkHNOcF1BoQbVHxK1dbovfK52rZg/VLuSG6HiQlSedHR?=
 =?us-ascii?Q?q14Ks0rucsEsy7AytyCEVpk/mHWEs6D0QsGJZXAwzhTFs1qU2ybTe0poG294?=
 =?us-ascii?Q?BxBxAO1KdEI3I9UA5hV4BCKqswI2a02FvyAgbK1sjGLeK6xYknnkCW352Ipr?=
 =?us-ascii?Q?P4nqI/dD2VX83npPtmPUyv0iJT6CdH8j6riE1HwvYLcdHG9zEyPJgBPl71Bu?=
 =?us-ascii?Q?NZRN785DEltCRrLPzdBArpnHM04C/Q98Yk35UxNOmKQAOz8jXYip0kD2s/0R?=
 =?us-ascii?Q?UovCsPdbA7iodDtpG4sWbmyfpZuBFl34K6XNHUYqSlvXy1kxZ5uv7GdqOixY?=
 =?us-ascii?Q?JlYDHuLU5PDePayhsZB8bRyjOOTeDIeFGhvyZxH6KvJ6Ti9vYWjihTx9FeXm?=
 =?us-ascii?Q?rAQu/3FsQn97g4aRQQQu4fmUXIHoijsEe/+KsKugu2l59i6rvgiHhQQAWtLK?=
 =?us-ascii?Q?MKwxO3HeNSHSmJtBeTE0AJB2oDzFrsWNzh6IXKTskNZH3DqWUgwl9zOdB81/?=
 =?us-ascii?Q?m/SjsnJ5TVasdfPg9n2SqIWyQd9a9ffmWL4uzyBBOwWK58DDl+MNmczkULX9?=
 =?us-ascii?Q?Oc0LxIDahVoXJSaKC8rN8JNdmEeA9RyNR3EzU2ir6+RqasHfZIIxcBZ5XWJa?=
 =?us-ascii?Q?UYKBfgkcbpKInLZrM3lHmlxIHAmQ9TsA46zXZ+aCL5v1ubtm6gH78CApotO1?=
 =?us-ascii?Q?/bW6oCKTFkI+9x/9amLOA5aaq0Gbr73gixr7ea4y/WXU8vZUXpRkC5MIFX/v?=
 =?us-ascii?Q?QFXxVMIxscNOR7PSHpCjONggrEhaX22dA5PrG15xLJ8yvr0om61F9lUOVcA5?=
 =?us-ascii?Q?dPHtw12JID/a406bn7E6bQiWubuzEy+EK8G+mhNVroZo0FPmQP6Na3tAQfos?=
 =?us-ascii?Q?Zp/yHEv4FtYVMqOKc5W9rxo67hb16/hJxLcd9HApszPetvV6D4RX5p64CA7o?=
 =?us-ascii?Q?G4lipc4nnsbbKWX4vWxQjf4mF7Kegq67NO6rPOP1apyzDUEEOatOt9Hq8QbI?=
 =?us-ascii?Q?ApxfIm0KEGhD88rPZ9/UTvHmBKduuD5Q8LFk8MfRzla9gj4ueGPShKLLmksT?=
 =?us-ascii?Q?zs5Y3MQf8nV07AMjmFSK9TIUiFB1STYmtE9nfN9BPR4suQZ3NJoJubNZn3aY?=
 =?us-ascii?Q?a4ypGpvUfppakkATbQnfOr4RIeKHVPpr?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:37:19.0317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 862962be-f0f0-4f2f-e16d-08dd1375d077
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701

Introduce helper set_amd_cppc_para and get_amd_cppc_para to
SET/GET CPPC-related para for amd-pstate/amd-pstate-epp driver.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/acpi/cpufreq/amd-pstate.c | 119 +++++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c              |  24 ++++-
 xen/include/acpi/cpufreq/cpufreq.h     |   5 ++
 3 files changed, 144 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/amd-pstate.c b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
index 40ecd04259..2b1f6c7731 100644
--- a/xen/arch/x86/acpi/cpufreq/amd-pstate.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-pstate.c
@@ -29,6 +29,8 @@
 
 static bool __ro_after_init opt_cpufreq_active = false;
 
+static bool __ro_after_init amd_pstate_in_use;
+
 struct amd_pstate_drv_data
 {
     struct xen_processor_cppc *cppc_data;
@@ -489,6 +491,117 @@ static int cf_check amd_pstate_epp_set_policy(struct cpufreq_policy *policy)
     return amd_pstate_epp_update_limit(policy);
 }
 
+int get_amd_cppc_para(unsigned int cpu,
+                      struct xen_cppc_para *cppc_para)
+{
+    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, cpu);
+
+    if ( data == NULL )
+        return -ENODATA;
+
+    cppc_para->features         = 0;
+    cppc_para->lowest           = data->hw.lowest_perf;
+    cppc_para->lowest_nonlinear = data->hw.lowest_nonlinear_perf;
+    cppc_para->nominal          = data->hw.nominal_perf;
+    cppc_para->highest          = data->hw.highest_perf;
+    cppc_para->minimum          = data->req.min_perf;
+    cppc_para->maximum          = data->req.max_perf;
+    cppc_para->desired          = data->req.des_perf;
+    cppc_para->energy_perf      = data->req.epp;
+
+    return 0;
+}
+
+int set_amd_cppc_para(struct cpufreq_policy *policy,
+                      struct xen_set_cppc_para *set_cppc)
+{
+    unsigned int cpu = policy->cpu;
+    struct amd_pstate_drv_data *data = per_cpu(amd_pstate_drv_data, cpu);
+    uint8_t max_perf, min_perf, des_perf;
+    int epp = -1;
+
+    if ( data == NULL )
+        return -ENOENT;
+
+    /* Validate all parameters - Disallow reserved bits. */
+    if ( set_cppc->minimum > 255 || set_cppc->maximum > 255 ||
+         set_cppc->desired > 255 || set_cppc->energy_perf > 255 )
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
+    /* Activity window not supported */
+    if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_ACT_WINDOW )
+        return -EINVAL;
+
+    /* Return if there is nothing to do. */
+    if ( set_cppc->set_params == 0 )
+        return 0;
+
+    /* Apply presets */
+    switch ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_PRESET_MASK )
+    {
+    case XEN_SYSCTL_CPPC_SET_PRESET_POWERSAVE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        min_perf = data->hw.lowest_perf;
+        max_perf = data->hw.highest_perf;
+        epp = CPPC_ENERGY_PERF_MAX_POWERSAVE;
+        des_perf = 0;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_PERFORMANCE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        min_perf = data->hw.highest_perf;
+        max_perf = data->hw.highest_perf;
+        epp = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
+        des_perf = 0;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_BALANCE:
+        if ( set_cppc->set_params & XEN_SYSCTL_CPPC_SET_DESIRED )
+            return -EINVAL;
+        min_perf = data->hw.lowest_perf;
+        max_perf = data->hw.highest_perf;
+        epp = CPPC_ENERGY_PERF_BALANCE;
+        des_perf = 0;
+        break;
+
+    case XEN_SYSCTL_CPPC_SET_PRESET_NONE:
+        min_perf = data->hw.lowest_nonlinear_perf;
+        max_perf = data->hw.highest_perf;
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
+    return amd_pstate_write_request(cpu, min_perf, des_perf, max_perf, epp);
+}
+
 static const struct cpufreq_driver __initconstrel amd_pstate_cpufreq_driver =
 {
     .name   = XEN_AMD_PSTATE_DRIVER_NAME,
@@ -507,11 +620,17 @@ static const struct cpufreq_driver __initconstrel amd_pstate_epp_driver =
     .exit       = amd_pstate_cpufreq_cpu_exit,
 };
 
+bool amd_pstate_active(void)
+{
+    return amd_pstate_in_use;
+}
+
 int __init amd_pstate_register_driver(void)
 {
     if ( !cpu_has_cppc )
         return -ENODEV;
 
+    amd_pstate_in_use = true;
     if ( !opt_cpufreq_active )
         return cpufreq_register_driver(&amd_pstate_cpufreq_driver);
     else
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index df309e27b4..63b4019c16 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -198,6 +198,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     char     *scaling_available_governors;
     struct list_head *pos;
     uint32_t cpu, i, j = 0;
+    bool hw_auto = false;
 
     pmpt = processor_pminfo[op->cpuid];
     policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
@@ -258,7 +259,19 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
          !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
                   CPUFREQ_NAME_LEN) )
         ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
-    else
+    else if ( !strncmp(op->u.get_para.scaling_driver, XEN_AMD_PSTATE_DRIVER_NAME,
+                       CPUFREQ_NAME_LEN) ||
+              !strncmp(op->u.get_para.scaling_driver, XEN_AMD_PSTATE_EPP_DRIVER_NAME,
+                       CPUFREQ_NAME_LEN) )
+        ret = get_amd_cppc_para(policy->cpu, &op->u.get_para.u.cppc_para);
+
+    if ( !strncmp(op->u.get_para.scaling_driver, XEN_HWP_DRIVER_NAME,
+                 CPUFREQ_NAME_LEN) ||
+         !strncmp(op->u.get_para.scaling_driver, XEN_AMD_PSTATE_EPP_DRIVER_NAME,
+                 CPUFREQ_NAME_LEN) )
+        hw_auto = true;
+
+    if ( !hw_auto )
     {
         if ( !(scaling_available_governors =
                xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
@@ -414,10 +427,13 @@ static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
     if ( !policy || !policy->governor )
         return -ENOENT;
 
-    if ( !hwp_active() )
-        return -EOPNOTSUPP;
+    if ( hwp_active() )
+        return set_hwp_para(policy, &op->u.set_cppc);
+
+    if ( amd_pstate_active() )
+        return set_amd_cppc_para(policy, &op->u.set_cppc);
 
-    return set_hwp_para(policy, &op->u.set_cppc);
+    return -EOPNOTSUPP;
 }
 
 int do_pm_op(struct xen_sysctl_pm_op *op)
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index d2a74d8315..bbc783cb1b 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -286,6 +286,11 @@ int acpi_cpufreq_register(void);
 
 int amd_pstate_cmdline_parse(const char *s, const char *e);
 int amd_pstate_register_driver(void);
+bool amd_pstate_active(void);
+int get_amd_cppc_para(unsigned int cpu,
+                      struct xen_cppc_para *cppc_para);
+int set_amd_cppc_para(struct cpufreq_policy *policy,
+                      struct xen_set_cppc_para *set_cppc);
 
 extern uint16_t dmi_max_speed_mhz;
 
-- 
2.34.1


