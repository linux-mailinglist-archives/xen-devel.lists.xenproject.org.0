Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3058CAF8EA3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 11:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033095.1406568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckj-0000i2-Mc; Fri, 04 Jul 2025 09:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033095.1406568; Fri, 04 Jul 2025 09:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXckj-0000dW-HP; Fri, 04 Jul 2025 09:30:41 +0000
Received: by outflank-mailman (input) for mailman id 1033095;
 Fri, 04 Jul 2025 09:30:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MIza=ZR=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uXckh-0007ek-D5
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 09:30:39 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2415::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a202ab2-58b9-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 11:30:36 +0200 (CEST)
Received: from MW4PR03CA0258.namprd03.prod.outlook.com (2603:10b6:303:b4::23)
 by DM4PR12MB6061.namprd12.prod.outlook.com (2603:10b6:8:b3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Fri, 4 Jul 2025 09:30:33 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::c9) by MW4PR03CA0258.outlook.office365.com
 (2603:10b6:303:b4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.23 via Frontend Transport; Fri,
 4 Jul 2025 09:30:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 09:30:32 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Jul 2025 04:30:29 -0500
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
X-Inumbo-ID: 8a202ab2-58b9-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWrvtmYM+fpcgSCEM7s3iemLAzBLrKgItUYlIdPQtnMqvKea9Nhu0vRjM5Zx2T6qjDNq62WHUYSzu83zR19kVA2SIqI1mjuZQTkiJZSxTW+T43iqoBNYBLV8t0Q5GEFlnhnjtKV+pNT88hx6Fo9VDr8EysFEHT+29+vCSaGuexVUyndG/FQ1fgg4MlYGTyFOT+RrDW/isZQhPuTTct+Abu5OP/hrWBlt+7Li8DGVb+whd8NbdrNTJNnkwbXf+qhHERMs05nEkHePPTSFgmHr2Qvtt41VPJlNSzim0qoK0nhpXwvzDEGztJms061MUskB0PyKXHcy58Evp37omZ997Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lALUv2eeIrR35nidrUbaPvX6vIC0j7dptKgRQ7m5sDo=;
 b=fN8WGrR0ovMqlqawdLRD+vFzgCFPmn7gR1SHYdJWrd25whCenTPituFPxZzUkQggfFl6TeZEh+p13FntQhNhqkuc50qWbMfdbDZ0otgTG9pdBuSPZnz8jS6sKuFwEk023Fgj4p+EEWzTY6IWY7ivU3yKKVKXBl/tfj1usW46phyd3CMhreWutCBoOhe2eDoQgiBOOE/9rcl2G6/cfD+tjYhzwlFQWdWbHQIkDSO1NBdTV/l1Nr68oWh7mAU5mM9T42kWGitqGURm1GVza5EtbDkR+E8hX5BJsaKiFEQGXIIUUAFz1ERwlpxds7CniQEfMofhKAR2s/2BAtcHvRY5FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lALUv2eeIrR35nidrUbaPvX6vIC0j7dptKgRQ7m5sDo=;
 b=Q5COApKICuHy3X6ZZ9x8ihaRnersdFoCDThBd3uH3ZNS87pftZJOOwPu7RYkYq/b/NS3WWqX6BzcjT1I8Ywq8hWYiChrOoCVpf3Rf6gjaZ6CnGXKxxqaI3G5OnuHR2aGcIrnqBwAqZm1KrxeccwP5l4bHyrY2DS4aYK4iOl1f68=
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 08/18] xen/pmstat: introduce CONFIG_PM_OP
Date: Fri, 4 Jul 2025 17:29:42 +0800
Message-ID: <20250704092952.822578-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704092952.822578-1-Penny.Zheng@amd.com>
References: <20250704092952.822578-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|DM4PR12MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: 34501ae0-b6d2-4f07-43e8-08ddbadd6ca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pMYHvF6YB62ly65OA35j9S2MhRHerjP8en+6cap2uYJvhDiad9jQbaune6pz?=
 =?us-ascii?Q?EsisvYshyYDokREUZMZe+N+7/KuUp4eie/ZGZdpxgL81k2K+kIWh0dR6FYmC?=
 =?us-ascii?Q?lAdVVJrmnzLNA2tlzFGnSRqv1SOEXg71JA2IfBCaCf9yB2m1A99xB13I5MDr?=
 =?us-ascii?Q?MPq4l0bbD0ZeOabZjHTrPTvD/aGZLagDzxWct8SNyPmHgSTr4XqQzkPkhr/6?=
 =?us-ascii?Q?CFU54OotnNKk7+NS6cbfY6285v4NHYIqnCCMnG5N7ve8dEoy2EEsw9/9aOjZ?=
 =?us-ascii?Q?cSiW0lHG+KZlLz9/jhjTH9YHEHGkLZTIi1IFTWcBHkBaoCBAoGqJTcpNaXnR?=
 =?us-ascii?Q?fNE4jv4MIZMCWARdcQ3+T8184XnzorgLgV8i9wQsDumuUoHb+kh4cQRVXH1P?=
 =?us-ascii?Q?/DLpSf98ERwh7c2ltd2AAK7prQKbubUazTo9CaXsjbf30GfIF1AYSVIX/S5m?=
 =?us-ascii?Q?F5xPwlnsqzkijEJMqQwtqUo0j2FiRSzMGglDIxNCUcy2SltSNrjf8BiDdJf3?=
 =?us-ascii?Q?X9C09dQkBffRBDlCAJNEIAsrnk3HWxWRZbgAa5lWrxhHvP6kUwmiP2iSL1eO?=
 =?us-ascii?Q?K7XNosnKaAZ9CMsGOnxeFXhYDSxNJDK8Mb1QdpFIkQ07klICL4PiSd7L/C4d?=
 =?us-ascii?Q?Z1fV1520WMd4H0YBAwlNzLM/RMX29cDd6Ua8wUFBfHzUXr6oZ9X3uqZ4nSgy?=
 =?us-ascii?Q?xZkgkJwV5iqTQzV9h1qDxC69z0DhtomYfIWg2sKTvV9NGfnP/6BA/DZXxwz1?=
 =?us-ascii?Q?4lW3nT3/R7aN8IB4qBCJ10slMOaxMs/XJbC3bqq+yHahpaM1NMXh2cHSjvFD?=
 =?us-ascii?Q?L8Rhij/rxA4wFkYPnEoUYfhdMJJkpaxAYi7c2dAd/e99ETdC9zKIOkSiPZ8D?=
 =?us-ascii?Q?j4SBgU/RW+zrQhMkrQTOxzGAhJL7GUsLFJSFy2iw1TqP+LuyzfGZUCsmTB3p?=
 =?us-ascii?Q?MLSVANlvJTAdxuQEwqVu9kvOmsFAZXwWPeYznS2TpKWHi92g+WmSM8LpIhhZ?=
 =?us-ascii?Q?1QRnAhONrRi0LphLnn8aQMhRKVeV5DIfKqQWGwuBqhaTlKki6i9b+7nMpfKU?=
 =?us-ascii?Q?GD2XOla+CaZIrH27tD5/ZaCbaE6lfoSs+rS1JavtBbJogVCQOj6Kp5HAEbhT?=
 =?us-ascii?Q?rnzren7A6J6W/pNNw75/4IMA1PaCq6cf3pPQM92/zrq+rRDFlXUB/ytFPwU+?=
 =?us-ascii?Q?U1hdsT7Z98gx9f8jc9w3leXnVasvbalCY1ZKq/lpsDybKP7ClnjUzGS1Gnlv?=
 =?us-ascii?Q?TAfQRaStpne1E4OQI2k8CUEmfqwMN+9jGSHQ0bFadzuDK+V/1prNSP90htGt?=
 =?us-ascii?Q?+5r7QZ5Kp+YlqxtGqWZ2sfrFq1IpfwfqmKJPCuVn8Eaath5V1LKgcANse/YX?=
 =?us-ascii?Q?vagg/719QW9EWHt/NLLui9pza+AdPFli8EPNAP4qpdPkI9iD5vlBfL6cRhcQ?=
 =?us-ascii?Q?ck2FA7xT8mru0QHZjlGT23F/Mnhh7g1qSjvxd7NwV1V20xSe9xroYIzHHYpC?=
 =?us-ascii?Q?xO0trg7vs8C8yI4hC3rYeWc7jCqpIi7J5GBx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:30:32.8384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34501ae0-b6d2-4f07-43e8-08ddbadd6ca4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6061

We move the following functions into a new file drivers/acpi/pm-op.c, as
they are all more fitting in performance controling and only called by
do_pm_op():
 - get_cpufreq_para()
 - set_cpufreq_para()
 - set_cpufreq_gov()
 - set_cpufreq_cppc()
 - cpufreq_driver_getavg()
 - cpufreq_update_turbo()
 - cpufreq_get_turbo_status()
We introduce a new Kconfig CONFIG_PM_OP to wrap the new file.

Also, although the following helpers are only called by do_pm_op(), they have
dependency on local variable, we wrap them with CONFIG_PM_OP in place:
 - write_userspace_scaling_setspeed()
 - write_ondemand_sampling_rate()
 - write_ondemand_up_threshold()
 - get_cpufreq_ondemand_para()
 - cpufreq_driver.update()
 - get_hwp_para()
Various style corrections shall be applied at the same time while moving these
functions, including:
 - add extra space before and after bracket of if() and switch()
 - fix indentation
 - drop all the unnecessary inner figure braces

We shall also provide "# CONFIG_PM_OP is not set" in preset configs for
PV shim on x86.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2 -> v3
- new commit
---
v3 -> v4:
- rename the file to pm-op.c
- drop all the unnecessary inner figure braces
- be consistent with the comment on the #endif
---
v4 -> v5:
- add blank line before endmenu
---
v5 -> v6:
- rebase changes from "xen/cpufreq: normalize hwp driver check with hwp_active()"
and "xen/cpufreq: move "init" flag into common structure"
- add "# CONFIG_PM_OP is not set" in preset configs for PV shim on x86
---
 xen/arch/x86/acpi/cpufreq/hwp.c              |   6 +
 xen/arch/x86/acpi/cpufreq/powernow.c         |   4 +
 xen/arch/x86/configs/pvshim_defconfig        |   1 +
 xen/common/Kconfig                           |   8 +
 xen/common/sysctl.c                          |   2 +
 xen/drivers/acpi/Makefile                    |   1 +
 xen/drivers/acpi/pm-op.c                     | 395 +++++++++++++++++++
 xen/drivers/acpi/pmstat.c                    | 355 -----------------
 xen/drivers/cpufreq/cpufreq_misc_governors.c |   2 +
 xen/drivers/cpufreq/cpufreq_ondemand.c       |   2 +
 xen/drivers/cpufreq/utility.c                |  41 --
 xen/include/acpi/cpufreq/cpufreq.h           |   3 -
 12 files changed, 421 insertions(+), 399 deletions(-)
 create mode 100644 xen/drivers/acpi/pm-op.c

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index d5fa3d47ca..e4c09244ab 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -466,6 +466,7 @@ static int cf_check hwp_cpufreq_cpu_exit(struct cpufreq_policy *policy)
     return 0;
 }
 
+#ifdef CONFIG_PM_OP
 /*
  * The SDM reads like turbo should be disabled with MSR_IA32_PERF_CTL and
  * PERF_CTL_TURBO_DISENGAGE, but that does not seem to actually work, at least
@@ -508,6 +509,7 @@ static int cf_check hwp_cpufreq_update(unsigned int cpu, struct cpufreq_policy *
 
     return per_cpu(hwp_drv_data, cpu)->ret;
 }
+#endif /* CONFIG_PM_OP */
 
 static const struct cpufreq_driver __initconst_cf_clobber
 hwp_cpufreq_driver = {
@@ -516,9 +518,12 @@ hwp_cpufreq_driver = {
     .target = hwp_cpufreq_target,
     .init   = hwp_cpufreq_cpu_init,
     .exit   = hwp_cpufreq_cpu_exit,
+#ifdef CONFIG_PM_OP
     .update = hwp_cpufreq_update,
+#endif
 };
 
+#ifdef CONFIG_PM_OP
 int get_hwp_para(unsigned int cpu,
                  struct xen_cppc_para *cppc_para)
 {
@@ -639,6 +644,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
 
     return hwp_cpufreq_target(policy, 0, 0);
 }
+#endif /* CONFIG_PM_OP */
 
 int __init hwp_register_driver(void)
 {
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 69364e1855..12fca45b45 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -49,6 +49,7 @@ static void cf_check transition_pstate(void *pstate)
     wrmsrl(MSR_PSTATE_CTRL, *(unsigned int *)pstate);
 }
 
+#ifdef CONFIG_PM_OP
 static void cf_check update_cpb(void *data)
 {
     struct cpufreq_policy *policy = data;
@@ -77,6 +78,7 @@ static int cf_check powernow_cpufreq_update(
 
     return 0;
 }
+#endif /* CONFIG_PM_OP */
 
 static int cf_check powernow_cpufreq_target(
     struct cpufreq_policy *policy,
@@ -324,7 +326,9 @@ powernow_cpufreq_driver = {
     .target = powernow_cpufreq_target,
     .init   = powernow_cpufreq_cpu_init,
     .exit   = powernow_cpufreq_cpu_exit,
+#ifdef CONFIG_PM_OP
     .update = powernow_cpufreq_update
+#endif
 };
 
 unsigned int __init powernow_register_driver(void)
diff --git a/xen/arch/x86/configs/pvshim_defconfig b/xen/arch/x86/configs/pvshim_defconfig
index 2ad27f898e..bacd04c963 100644
--- a/xen/arch/x86/configs/pvshim_defconfig
+++ b/xen/arch/x86/configs/pvshim_defconfig
@@ -26,3 +26,4 @@ CONFIG_EXPERT=y
 # CONFIG_INTEL_IOMMU is not set
 # CONFIG_DEBUG is not set
 # CONFIG_GDBSX is not set
+# CONFIG_PM_OP is not set
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index dbd9747d1f..943cf0a950 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -620,4 +620,12 @@ config SYSCTL
 
 endmenu
 
+config PM_OP
+	bool "Enable Performance Management Operation"
+	depends on ACPI && HAS_CPUFREQ && SYSCTL
+	default y
+	help
+	  This option shall enable userspace performance management control
+	  to do power/performance analyzing and tuning.
+
 endmenu
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index c2d99ae12e..daf57fbe56 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -174,7 +174,9 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     case XEN_SYSCTL_get_pmstat:
         ret = do_get_pm_info(&op->u.get_pmstat);
         break;
+#endif
 
+#ifdef CONFIG_PM_OP
     case XEN_SYSCTL_pm_op:
         ret = do_pm_op(&op->u.pm_op);
         if ( ret == -EAGAIN )
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 2fc5230253..1d811a51a7 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -6,6 +6,7 @@ obj-bin-y += tables.init.o
 obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
 obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
+obj-$(CONFIG_PM_OP) += pm-op.o
 
 obj-$(CONFIG_X86) += hwregs.o
 obj-$(CONFIG_X86) += reboot.o
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
new file mode 100644
index 0000000000..a1f3c4193f
--- /dev/null
+++ b/xen/drivers/acpi/pm-op.c
@@ -0,0 +1,395 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/acpi.h>
+#include <xen/domain.h>
+#include <xen/errno.h>
+#include <xen/guest_access.h>
+#include <xen/lib.h>
+#include <xen/sched.h>
+
+#include <acpi/cpufreq/cpufreq.h>
+#include <public/platform.h>
+#include <public/sysctl.h>
+
+/*
+ * 1. Get PM parameter
+ * 2. Provide user PM control
+ */
+static int cpufreq_update_turbo(unsigned int cpu, int new_state)
+{
+    struct cpufreq_policy *policy;
+    int curr_state;
+    int ret = 0;
+
+    if ( new_state != CPUFREQ_TURBO_ENABLED &&
+         new_state != CPUFREQ_TURBO_DISABLED )
+        return -EINVAL;
+
+    policy = per_cpu(cpufreq_cpu_policy, cpu);
+    if ( !policy )
+        return -EACCES;
+
+    if ( policy->turbo == CPUFREQ_TURBO_UNSUPPORTED )
+        return -EOPNOTSUPP;
+
+    curr_state = policy->turbo;
+    if ( curr_state == new_state )
+        return 0;
+
+    policy->turbo = new_state;
+    if ( cpufreq_driver.update )
+    {
+        ret = alternative_call(cpufreq_driver.update, cpu, policy);
+        if ( ret )
+            policy->turbo = curr_state;
+    }
+
+    return ret;
+}
+
+static int cpufreq_get_turbo_status(unsigned int cpu)
+{
+    struct cpufreq_policy *policy;
+
+    policy = per_cpu(cpufreq_cpu_policy, cpu);
+    return policy && policy->turbo == CPUFREQ_TURBO_ENABLED;
+}
+
+static int read_scaling_available_governors(char *scaling_available_governors,
+                                            unsigned int size)
+{
+    unsigned int i = 0;
+    struct cpufreq_governor *t;
+
+    if ( !scaling_available_governors )
+        return -EINVAL;
+
+    list_for_each_entry(t, &cpufreq_governor_list, governor_list)
+    {
+        i += scnprintf(&scaling_available_governors[i],
+                       CPUFREQ_NAME_LEN, "%s ", t->name);
+        if ( i > size )
+            return -EINVAL;
+    }
+    scaling_available_governors[i-1] = '\0';
+
+    return 0;
+}
+
+static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
+{
+    uint32_t ret = 0;
+    const struct processor_pminfo *pmpt;
+    struct cpufreq_policy *policy;
+    uint32_t gov_num = 0;
+    uint32_t *data;
+    char     *scaling_available_governors;
+    struct list_head *pos;
+    unsigned int cpu, i = 0;
+
+    pmpt = processor_pminfo[op->cpuid];
+    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
+
+    if ( !pmpt || !pmpt->perf.states ||
+         !policy || !policy->governor )
+        return -EINVAL;
+
+    list_for_each(pos, &cpufreq_governor_list)
+        gov_num++;
+
+    if ( (op->u.get_para.cpu_num  != cpumask_weight(policy->cpus)) ||
+         (op->u.get_para.freq_num != pmpt->perf.state_count)    ||
+         (op->u.get_para.gov_num  != gov_num) )
+    {
+        op->u.get_para.cpu_num =  cpumask_weight(policy->cpus);
+        op->u.get_para.freq_num = pmpt->perf.state_count;
+        op->u.get_para.gov_num  = gov_num;
+        return -EAGAIN;
+    }
+
+    if ( !(data = xzalloc_array(uint32_t,
+                                max(op->u.get_para.cpu_num,
+                                    op->u.get_para.freq_num))) )
+        return -ENOMEM;
+
+    for_each_cpu(cpu, policy->cpus)
+        data[i++] = cpu;
+    ret = copy_to_guest(op->u.get_para.affected_cpus,
+                        data, op->u.get_para.cpu_num);
+
+    for ( i = 0; i < op->u.get_para.freq_num; i++ )
+        data[i] = pmpt->perf.states[i].core_frequency * 1000;
+    ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
+                         data, op->u.get_para.freq_num);
+
+    xfree(data);
+    if ( ret )
+        return -EFAULT;
+
+    op->u.get_para.cpuinfo_cur_freq =
+        cpufreq_driver.get ? alternative_call(cpufreq_driver.get, op->cpuid)
+                           : policy->cur;
+    op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
+    op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
+    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
+
+    if ( cpufreq_driver.name[0] )
+        strlcpy(op->u.get_para.scaling_driver,
+                cpufreq_driver.name, CPUFREQ_NAME_LEN);
+    else
+        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
+
+    if ( hwp_active() )
+        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
+    else
+    {
+        if ( !(scaling_available_governors =
+               xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
+            return -ENOMEM;
+        if ( (ret = read_scaling_available_governors(
+                        scaling_available_governors,
+                        (gov_num * CPUFREQ_NAME_LEN *
+                         sizeof(*scaling_available_governors)))) )
+        {
+            xfree(scaling_available_governors);
+            return ret;
+        }
+        ret = copy_to_guest(op->u.get_para.scaling_available_governors,
+                            scaling_available_governors,
+                            gov_num * CPUFREQ_NAME_LEN);
+        xfree(scaling_available_governors);
+        if ( ret )
+            return -EFAULT;
+
+        op->u.get_para.u.s.scaling_cur_freq = policy->cur;
+        op->u.get_para.u.s.scaling_max_freq = policy->max;
+        op->u.get_para.u.s.scaling_min_freq = policy->min;
+
+        if ( policy->governor->name[0] )
+            strlcpy(op->u.get_para.u.s.scaling_governor,
+                    policy->governor->name, CPUFREQ_NAME_LEN);
+        else
+            strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
+                    CPUFREQ_NAME_LEN);
+
+        /* governor specific para */
+        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
+                          "userspace", CPUFREQ_NAME_LEN) )
+            op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
+
+        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
+                          "ondemand", CPUFREQ_NAME_LEN) )
+            ret = get_cpufreq_ondemand_para(
+                &op->u.get_para.u.s.u.ondemand.sampling_rate_max,
+                &op->u.get_para.u.s.u.ondemand.sampling_rate_min,
+                &op->u.get_para.u.s.u.ondemand.sampling_rate,
+                &op->u.get_para.u.s.u.ondemand.up_threshold);
+    }
+
+    return ret;
+}
+
+static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
+{
+    struct cpufreq_policy new_policy, *old_policy;
+
+    old_policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
+    if ( !old_policy )
+        return -EINVAL;
+
+    memcpy(&new_policy, old_policy, sizeof(struct cpufreq_policy));
+
+    new_policy.governor = __find_governor(op->u.set_gov.scaling_governor);
+    if ( new_policy.governor == NULL )
+        return -EINVAL;
+
+    return __cpufreq_set_policy(old_policy, &new_policy);
+}
+
+static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
+{
+    int ret = 0;
+    struct cpufreq_policy *policy;
+
+    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
+
+    if ( !policy || !policy->governor )
+        return -EINVAL;
+
+    if ( hwp_active() )
+        return -EOPNOTSUPP;
+
+    switch( op->u.set_para.ctrl_type )
+    {
+    case SCALING_MAX_FREQ:
+    {
+        struct cpufreq_policy new_policy;
+
+        memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
+        new_policy.max = op->u.set_para.ctrl_value;
+        ret = __cpufreq_set_policy(policy, &new_policy);
+
+        break;
+    }
+
+    case SCALING_MIN_FREQ:
+    {
+        struct cpufreq_policy new_policy;
+
+        memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
+        new_policy.min = op->u.set_para.ctrl_value;
+        ret = __cpufreq_set_policy(policy, &new_policy);
+
+        break;
+    }
+
+    case SCALING_SETSPEED:
+    {
+        unsigned int freq =op->u.set_para.ctrl_value;
+
+        if ( !strncasecmp(policy->governor->name,
+                          "userspace", CPUFREQ_NAME_LEN) )
+            ret = write_userspace_scaling_setspeed(op->cpuid, freq);
+        else
+            ret = -EINVAL;
+
+        break;
+    }
+
+    case SAMPLING_RATE:
+    {
+        unsigned int sampling_rate = op->u.set_para.ctrl_value;
+
+        if ( !strncasecmp(policy->governor->name,
+                          "ondemand", CPUFREQ_NAME_LEN) )
+            ret = write_ondemand_sampling_rate(sampling_rate);
+        else
+            ret = -EINVAL;
+
+        break;
+    }
+
+    case UP_THRESHOLD:
+    {
+        unsigned int up_threshold = op->u.set_para.ctrl_value;
+
+        if ( !strncasecmp(policy->governor->name,
+                          "ondemand", CPUFREQ_NAME_LEN) )
+            ret = write_ondemand_up_threshold(up_threshold);
+        else
+            ret = -EINVAL;
+
+        break;
+    }
+
+    default:
+        ret = -EINVAL;
+        break;
+    }
+
+    return ret;
+}
+
+static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
+{
+    struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
+
+    if ( !policy || !policy->governor )
+        return -ENOENT;
+
+    if ( !hwp_active() )
+        return -EOPNOTSUPP;
+
+    return set_hwp_para(policy, &op->u.set_cppc);
+}
+
+int do_pm_op(struct xen_sysctl_pm_op *op)
+{
+    int ret = 0;
+    const struct processor_pminfo *pmpt;
+
+    switch ( op->cmd )
+    {
+    case XEN_SYSCTL_pm_op_set_sched_opt_smt:
+    {
+        uint32_t saved_value = sched_smt_power_savings;
+
+        if ( op->cpuid != 0 )
+            return -EINVAL;
+        sched_smt_power_savings = !!op->u.set_sched_opt_smt;
+        op->u.set_sched_opt_smt = saved_value;
+        return 0;
+    }
+
+    case XEN_SYSCTL_pm_op_get_max_cstate:
+        BUILD_BUG_ON(XEN_SYSCTL_CX_UNLIMITED != UINT_MAX);
+        if ( op->cpuid == 0 )
+            op->u.get_max_cstate = acpi_get_cstate_limit();
+        else if ( op->cpuid == 1 )
+            op->u.get_max_cstate = acpi_get_csubstate_limit();
+        else
+            ret = -EINVAL;
+        return ret;
+
+    case XEN_SYSCTL_pm_op_set_max_cstate:
+        if ( op->cpuid == 0 )
+            acpi_set_cstate_limit(op->u.set_max_cstate);
+        else if ( op->cpuid == 1 )
+            acpi_set_csubstate_limit(op->u.set_max_cstate);
+        else
+            ret = -EINVAL;
+        return ret;
+    }
+
+    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
+        return -EINVAL;
+    pmpt = processor_pminfo[op->cpuid];
+
+    switch ( op->cmd & PM_PARA_CATEGORY_MASK )
+    {
+    case CPUFREQ_PARA:
+        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
+            return -ENODEV;
+        if ( !pmpt || !(pmpt->init & XEN_PX_INIT) )
+            return -EINVAL;
+        break;
+    }
+
+    switch ( op->cmd )
+    {
+    case GET_CPUFREQ_PARA:
+        ret = get_cpufreq_para(op);
+        break;
+
+    case SET_CPUFREQ_GOV:
+        ret = set_cpufreq_gov(op);
+        break;
+
+    case SET_CPUFREQ_PARA:
+        ret = set_cpufreq_para(op);
+        break;
+
+    case SET_CPUFREQ_CPPC:
+        ret = set_cpufreq_cppc(op);
+        break;
+
+    case GET_CPUFREQ_AVGFREQ:
+        op->u.get_avgfreq = cpufreq_driver_getavg(op->cpuid, USR_GETAVG);
+        break;
+
+    case XEN_SYSCTL_pm_op_enable_turbo:
+        ret = cpufreq_update_turbo(op->cpuid, CPUFREQ_TURBO_ENABLED);
+        break;
+
+    case XEN_SYSCTL_pm_op_disable_turbo:
+        ret = cpufreq_update_turbo(op->cpuid, CPUFREQ_TURBO_DISABLED);
+        break;
+
+    default:
+        printk("not defined sub-hypercall @ do_pm_op\n");
+        ret = -ENOSYS;
+        break;
+    }
+
+    return ret;
+}
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index e276d55c97..da7a1f81e1 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -337,358 +337,3 @@ int do_get_pm_info(struct xen_sysctl_get_pmstat *op)
 
     return ret;
 }
-
-/*
- * 1. Get PM parameter
- * 2. Provide user PM control
- */
-static int read_scaling_available_governors(char *scaling_available_governors,
-                                            unsigned int size)
-{
-    unsigned int i = 0;
-    struct cpufreq_governor *t;
-
-    if ( !scaling_available_governors )
-        return -EINVAL;
-
-    list_for_each_entry(t, &cpufreq_governor_list, governor_list)
-    {
-        i += scnprintf(&scaling_available_governors[i],
-                       CPUFREQ_NAME_LEN, "%s ", t->name);
-        if ( i > size )
-            return -EINVAL;
-    }
-    scaling_available_governors[i-1] = '\0';
-
-    return 0;
-}
-
-static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
-{
-    uint32_t ret = 0;
-    const struct processor_pminfo *pmpt;
-    struct cpufreq_policy *policy;
-    uint32_t gov_num = 0;
-    uint32_t *data;
-    char     *scaling_available_governors;
-    struct list_head *pos;
-    unsigned int cpu, i = 0;
-
-    pmpt = processor_pminfo[op->cpuid];
-    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
-
-    if ( !pmpt || !pmpt->perf.states ||
-         !policy || !policy->governor )
-        return -EINVAL;
-
-    list_for_each(pos, &cpufreq_governor_list)
-        gov_num++;
-
-    if ( (op->u.get_para.cpu_num  != cpumask_weight(policy->cpus)) ||
-         (op->u.get_para.freq_num != pmpt->perf.state_count)    ||
-         (op->u.get_para.gov_num  != gov_num) )
-    {
-        op->u.get_para.cpu_num =  cpumask_weight(policy->cpus);
-        op->u.get_para.freq_num = pmpt->perf.state_count;
-        op->u.get_para.gov_num  = gov_num;
-        return -EAGAIN;
-    }
-
-    if ( !(data = xzalloc_array(uint32_t,
-                                max(op->u.get_para.cpu_num,
-                                    op->u.get_para.freq_num))) )
-        return -ENOMEM;
-
-    for_each_cpu(cpu, policy->cpus)
-        data[i++] = cpu;
-    ret = copy_to_guest(op->u.get_para.affected_cpus,
-                        data, op->u.get_para.cpu_num);
-
-    for ( i = 0; i < op->u.get_para.freq_num; i++ )
-        data[i] = pmpt->perf.states[i].core_frequency * 1000;
-    ret += copy_to_guest(op->u.get_para.scaling_available_frequencies,
-                         data, op->u.get_para.freq_num);
-
-    xfree(data);
-    if ( ret )
-        return -EFAULT;
-
-    op->u.get_para.cpuinfo_cur_freq =
-        cpufreq_driver.get ? alternative_call(cpufreq_driver.get, op->cpuid)
-                           : policy->cur;
-    op->u.get_para.cpuinfo_max_freq = policy->cpuinfo.max_freq;
-    op->u.get_para.cpuinfo_min_freq = policy->cpuinfo.min_freq;
-    op->u.get_para.turbo_enabled = cpufreq_get_turbo_status(op->cpuid);
-
-    if ( cpufreq_driver.name[0] )
-        strlcpy(op->u.get_para.scaling_driver,
-            cpufreq_driver.name, CPUFREQ_NAME_LEN);
-    else
-        strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
-
-    if ( hwp_active() )
-        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
-    else
-    {
-        if ( !(scaling_available_governors =
-               xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
-            return -ENOMEM;
-        if ( (ret = read_scaling_available_governors(
-                        scaling_available_governors,
-                        (gov_num * CPUFREQ_NAME_LEN *
-                         sizeof(*scaling_available_governors)))) )
-        {
-            xfree(scaling_available_governors);
-            return ret;
-        }
-        ret = copy_to_guest(op->u.get_para.scaling_available_governors,
-                            scaling_available_governors,
-                            gov_num * CPUFREQ_NAME_LEN);
-        xfree(scaling_available_governors);
-        if ( ret )
-            return -EFAULT;
-
-        op->u.get_para.u.s.scaling_cur_freq = policy->cur;
-        op->u.get_para.u.s.scaling_max_freq = policy->max;
-        op->u.get_para.u.s.scaling_min_freq = policy->min;
-
-        if ( policy->governor->name[0] )
-            strlcpy(op->u.get_para.u.s.scaling_governor,
-                policy->governor->name, CPUFREQ_NAME_LEN);
-        else
-            strlcpy(op->u.get_para.u.s.scaling_governor, "Unknown",
-                    CPUFREQ_NAME_LEN);
-
-        /* governor specific para */
-        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
-                          "userspace", CPUFREQ_NAME_LEN) )
-            op->u.get_para.u.s.u.userspace.scaling_setspeed = policy->cur;
-
-        if ( !strncasecmp(op->u.get_para.u.s.scaling_governor,
-                          "ondemand", CPUFREQ_NAME_LEN) )
-            ret = get_cpufreq_ondemand_para(
-                &op->u.get_para.u.s.u.ondemand.sampling_rate_max,
-                &op->u.get_para.u.s.u.ondemand.sampling_rate_min,
-                &op->u.get_para.u.s.u.ondemand.sampling_rate,
-                &op->u.get_para.u.s.u.ondemand.up_threshold);
-    }
-
-    return ret;
-}
-
-static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
-{
-    struct cpufreq_policy new_policy, *old_policy;
-
-    old_policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
-    if ( !old_policy )
-        return -EINVAL;
-
-    memcpy(&new_policy, old_policy, sizeof(struct cpufreq_policy));
-
-    new_policy.governor = __find_governor(op->u.set_gov.scaling_governor);
-    if (new_policy.governor == NULL)
-        return -EINVAL;
-
-    return __cpufreq_set_policy(old_policy, &new_policy);
-}
-
-static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
-{
-    int ret = 0;
-    struct cpufreq_policy *policy;
-
-    policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
-
-    if ( !policy || !policy->governor )
-        return -EINVAL;
-
-    if ( hwp_active() )
-        return -EOPNOTSUPP;
-
-    switch(op->u.set_para.ctrl_type)
-    {
-    case SCALING_MAX_FREQ:
-    {
-        struct cpufreq_policy new_policy;
-
-        memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
-        new_policy.max = op->u.set_para.ctrl_value;
-        ret = __cpufreq_set_policy(policy, &new_policy);
-
-        break;
-    }
-
-    case SCALING_MIN_FREQ:
-    {
-        struct cpufreq_policy new_policy;
-
-        memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
-        new_policy.min = op->u.set_para.ctrl_value;
-        ret = __cpufreq_set_policy(policy, &new_policy);
-
-        break;
-    }
-
-    case SCALING_SETSPEED:
-    {
-        unsigned int freq =op->u.set_para.ctrl_value;
-
-        if ( !strncasecmp(policy->governor->name,
-                          "userspace", CPUFREQ_NAME_LEN) )
-            ret = write_userspace_scaling_setspeed(op->cpuid, freq);
-        else
-            ret = -EINVAL;
-
-        break;
-    }
-
-    case SAMPLING_RATE:
-    {
-        unsigned int sampling_rate = op->u.set_para.ctrl_value;
-
-        if ( !strncasecmp(policy->governor->name,
-                          "ondemand", CPUFREQ_NAME_LEN) )
-            ret = write_ondemand_sampling_rate(sampling_rate);
-        else
-            ret = -EINVAL;
-
-        break;
-    }
-
-    case UP_THRESHOLD:
-    {
-        unsigned int up_threshold = op->u.set_para.ctrl_value;
-
-        if ( !strncasecmp(policy->governor->name,
-                          "ondemand", CPUFREQ_NAME_LEN) )
-            ret = write_ondemand_up_threshold(up_threshold);
-        else
-            ret = -EINVAL;
-
-        break;
-    }
-
-    default:
-        ret = -EINVAL;
-        break;
-    }
-
-    return ret;
-}
-
-static int set_cpufreq_cppc(struct xen_sysctl_pm_op *op)
-{
-    struct cpufreq_policy *policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
-
-    if ( !policy || !policy->governor )
-        return -ENOENT;
-
-    if ( !hwp_active() )
-        return -EOPNOTSUPP;
-
-    return set_hwp_para(policy, &op->u.set_cppc);
-}
-
-int do_pm_op(struct xen_sysctl_pm_op *op)
-{
-    int ret = 0;
-    const struct processor_pminfo *pmpt;
-
-    switch ( op->cmd )
-    {
-    case XEN_SYSCTL_pm_op_set_sched_opt_smt:
-    {
-        uint32_t saved_value = sched_smt_power_savings;
-
-        if ( op->cpuid != 0 )
-            return -EINVAL;
-        sched_smt_power_savings = !!op->u.set_sched_opt_smt;
-        op->u.set_sched_opt_smt = saved_value;
-        return 0;
-    }
-
-    case XEN_SYSCTL_pm_op_get_max_cstate:
-        BUILD_BUG_ON(XEN_SYSCTL_CX_UNLIMITED != UINT_MAX);
-        if ( op->cpuid == 0 )
-            op->u.get_max_cstate = acpi_get_cstate_limit();
-        else if ( op->cpuid == 1 )
-            op->u.get_max_cstate = acpi_get_csubstate_limit();
-        else
-            ret = -EINVAL;
-        return ret;
-
-    case XEN_SYSCTL_pm_op_set_max_cstate:
-        if ( op->cpuid == 0 )
-            acpi_set_cstate_limit(op->u.set_max_cstate);
-        else if ( op->cpuid == 1 )
-            acpi_set_csubstate_limit(op->u.set_max_cstate);
-        else
-            ret = -EINVAL;
-        return ret;
-    }
-
-    if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
-        return -EINVAL;
-    pmpt = processor_pminfo[op->cpuid];
-
-    switch ( op->cmd & PM_PARA_CATEGORY_MASK )
-    {
-    case CPUFREQ_PARA:
-        if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
-            return -ENODEV;
-        if ( !pmpt || !(pmpt->init & XEN_PX_INIT) )
-            return -EINVAL;
-        break;
-    }
-
-    switch ( op->cmd )
-    {
-    case GET_CPUFREQ_PARA:
-    {
-        ret = get_cpufreq_para(op);
-        break;
-    }
-
-    case SET_CPUFREQ_GOV:
-    {
-        ret = set_cpufreq_gov(op);
-        break;
-    }
-
-    case SET_CPUFREQ_PARA:
-    {
-        ret = set_cpufreq_para(op);
-        break;
-    }
-
-    case SET_CPUFREQ_CPPC:
-        ret = set_cpufreq_cppc(op);
-        break;
-
-    case GET_CPUFREQ_AVGFREQ:
-    {
-        op->u.get_avgfreq = cpufreq_driver_getavg(op->cpuid, USR_GETAVG);
-        break;
-    }
-
-    case XEN_SYSCTL_pm_op_enable_turbo:
-    {
-        ret = cpufreq_update_turbo(op->cpuid, CPUFREQ_TURBO_ENABLED);
-        break;
-    }
-
-    case XEN_SYSCTL_pm_op_disable_turbo:
-    {
-        ret = cpufreq_update_turbo(op->cpuid, CPUFREQ_TURBO_DISABLED);
-        break;
-    }
-
-    default:
-        printk("not defined sub-hypercall @ do_pm_op\n");
-        ret = -ENOSYS;
-        break;
-    }
-
-    return ret;
-}
diff --git a/xen/drivers/cpufreq/cpufreq_misc_governors.c b/xen/drivers/cpufreq/cpufreq_misc_governors.c
index 0327fad23b..e5cb9ab02f 100644
--- a/xen/drivers/cpufreq/cpufreq_misc_governors.c
+++ b/xen/drivers/cpufreq/cpufreq_misc_governors.c
@@ -64,6 +64,7 @@ static int cf_check cpufreq_governor_userspace(
     return ret;
 }
 
+#ifdef CONFIG_PM_OP
 int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
 {
     struct cpufreq_policy *policy;
@@ -80,6 +81,7 @@ int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq)
 
     return __cpufreq_driver_target(policy, freq, CPUFREQ_RELATION_L);
 }
+#endif /* CONFIG_PM_OP */
 
 static bool __init cf_check
 cpufreq_userspace_handle_option(const char *name, const char *val)
diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index 06cfc88d30..0126a3f5d9 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -57,6 +57,7 @@ static struct dbs_tuners {
 
 static DEFINE_PER_CPU(struct timer, dbs_timer);
 
+#ifdef CONFIG_PM_OP
 int write_ondemand_sampling_rate(unsigned int sampling_rate)
 {
     if ( (sampling_rate > MAX_SAMPLING_RATE / MICROSECS(1)) ||
@@ -93,6 +94,7 @@ int get_cpufreq_ondemand_para(uint32_t *sampling_rate_max,
 
     return 0;
 }
+#endif /* CONFIG_PM_OP */
 
 static void dbs_check_cpu(struct cpu_dbs_info_s *this_dbs_info)
 {
diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index 723045b240..987c3b5929 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -224,47 +224,6 @@ int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag)
     return policy->cur;
 }
 
-int cpufreq_update_turbo(unsigned int cpu, int new_state)
-{
-    struct cpufreq_policy *policy;
-    int curr_state;
-    int ret = 0;
-
-    if (new_state != CPUFREQ_TURBO_ENABLED &&
-        new_state != CPUFREQ_TURBO_DISABLED)
-        return -EINVAL;
-
-    policy = per_cpu(cpufreq_cpu_policy, cpu);
-    if (!policy)
-        return -EACCES;
-
-    if (policy->turbo == CPUFREQ_TURBO_UNSUPPORTED)
-        return -EOPNOTSUPP;
-
-    curr_state = policy->turbo;
-    if (curr_state == new_state)
-        return 0;
-
-    policy->turbo = new_state;
-    if (cpufreq_driver.update)
-    {
-        ret = alternative_call(cpufreq_driver.update, cpu, policy);
-        if (ret)
-            policy->turbo = curr_state;
-    }
-
-    return ret;
-}
-
-
-int cpufreq_get_turbo_status(unsigned int cpu)
-{
-    struct cpufreq_policy *policy;
-
-    policy = per_cpu(cpufreq_cpu_policy, cpu);
-    return policy && policy->turbo == CPUFREQ_TURBO_ENABLED;
-}
-
 /*********************************************************************
  *                 POLICY                                            *
  *********************************************************************/
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 241117a9af..0742aa9f44 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -143,9 +143,6 @@ extern int cpufreq_driver_getavg(unsigned int cpu, unsigned int flag);
 #define CPUFREQ_TURBO_UNSUPPORTED   0
 #define CPUFREQ_TURBO_ENABLED       1
 
-int cpufreq_update_turbo(unsigned int cpu, int new_state);
-int cpufreq_get_turbo_status(unsigned int cpu);
-
 static inline int
 __cpufreq_governor(struct cpufreq_policy *policy, unsigned int event)
 {
-- 
2.34.1


