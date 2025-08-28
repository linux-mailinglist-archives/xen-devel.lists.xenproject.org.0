Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C09BB39907
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098180.1452316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZVg-0008Jx-DF; Thu, 28 Aug 2025 10:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098180.1452316; Thu, 28 Aug 2025 10:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZVg-0008Ge-A7; Thu, 28 Aug 2025 10:05:36 +0000
Received: by outflank-mailman (input) for mailman id 1098180;
 Thu, 28 Aug 2025 10:05:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urZVe-0008DS-Ek
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:05:34 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2413::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8854376e-83f6-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 12:05:33 +0200 (CEST)
Received: from CH0PR03CA0409.namprd03.prod.outlook.com (2603:10b6:610:11b::17)
 by DM6PR12MB4107.namprd12.prod.outlook.com (2603:10b6:5:218::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 28 Aug
 2025 10:05:28 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:11b:cafe::c4) by CH0PR03CA0409.outlook.office365.com
 (2603:10b6:610:11b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 10:05:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 10:05:28 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:05:27 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 28 Aug 2025 03:05:25 -0700
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
X-Inumbo-ID: 8854376e-83f6-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vbf8McWGeW2dqLMQ2AtvO6vuWz6kM4KisNQyhW0y7j++fkw4W0i2TYeM8epA4qHqGLyJuEzZuoH5yjb1+p3IkpT+4p/YCF6n5kkIcN4mMDgQpdqs3zYvpSA4ddRrYz1uaJgDsep9PwSl0eHQten2k/byzUpglcPTWxKXw/YRsNEDTyin6HK0XcPMRMtse6H34VvwoEsvpsQm46VaCNoI6bfaVdPTVVIuW5S+VmEEiNnoUFewGvXgN1niGW63koRVnOwmXSQRObpl8r2G817ErOWRq8dPVZuad4GPPulJxQLygLBmxragGviKpTfwHYeKCBULvnwJemAEzh7/Eltp/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Toe6Isc8jD267iNGh3XLoNGxPPh/1SU1rDpbA94F4Os=;
 b=FroFL342Fi0V5rw4LAx1uOXHpAU5jq46Z6p7Gtdc2yQAYnumaMCrXb8+kjxNtiUKVhJ7+7ko5ysTAvJKm2YOEuycA6WjA2MY+olRlkZEAjUqqhchVEQMZYv2PIvBBIlUruaVVMLjK3g6I/JvU3jaLywaCglUMOr0puwZW3+EFhLw+haUIaADLrDV5SXM9ZljREBdpFVSpaOpmgMF76DfWZ7MutRIGeSTDvlVBcozWb8pDk4mB4m3jSdCSZQ6fB9RUdkR+NH3dW5wcVIOHiY++7Is4ltmZELlUjBFnkHgFBnNtQ7Sz7LvtNKpo84PqhQIBMuZ2bhK7bnjhsKSUZ/Kkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Toe6Isc8jD267iNGh3XLoNGxPPh/1SU1rDpbA94F4Os=;
 b=vwLFQFkLvymwFeavOKzRlAjvtorK9n3IwcneL1qQFAHInRrN9qMPJ7Yze/92ypJ1JmE80okqjzng2HFAEJ+Zd3BitFeXejyXeY8DJ+Q1JupDUKheMIKHGZclET4SF8siDsjDQFlTBas2NfT+9luvM8DVYyHBNKPG7sW/BVzyd4w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v8 6/8] tools/cpufreq: extract CPPC para from cpufreq para
Date: Thu, 28 Aug 2025 18:05:10 +0800
Message-ID: <20250828100510.1776855-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|DM6PR12MB4107:EE_
X-MS-Office365-Filtering-Correlation-Id: 49bde12a-5deb-4fe6-898a-08dde61a6a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mT4lIxnOwhitJNi1D9JaP0LqGREqvyoE/Ulo1OeCO7sFzaQuXPDj456Vm4JG?=
 =?us-ascii?Q?Ed0hCgvUgPvWdgjOrIVxo1SQgRMfdBd2aZgEo9PXFFbupFDHb3vCceR/7wCK?=
 =?us-ascii?Q?VzuiSogPke+Spi/U5NnqWPJ4YAgzyvW8W+41Z/yUuaNwC188HGMYPgeQzANE?=
 =?us-ascii?Q?CAXlaEkHFx4CwvGIaPVNH7u9xQJ6CCa+5h2u8/1ANMmdiyhKtIj2ZTbH/I+x?=
 =?us-ascii?Q?STweqdTG0Bsl3LnIduoRZ657nG3mhHE0mvoPq9xjFIUnADoI8bpm4+ZrXcKF?=
 =?us-ascii?Q?k6kMZzH93Td2Q/QEuF8K7Mj/UvJvCVFqR50xbDr04XK81UhyycO4Kc90pcQF?=
 =?us-ascii?Q?nu470ngf6agoirK5rnLLhoBAfQ8QSenRjwBlrw4D3Yc94w60vVRKLN13p2//?=
 =?us-ascii?Q?0paE/Ka9Ca4bFF7njGRk4oZO3HaQAB7VCVxo2YEB1Q7jSLYNPz/ZETF7fm5t?=
 =?us-ascii?Q?x1HBIW8KFwQJTRZNzC5FVSiGrF3jAtV8/Meq9dnZmM4HYH0pDwQFsc4b8sMk?=
 =?us-ascii?Q?Bbcq1XEXG2UdkGa0O/hqHjbuMtmzMGRCCUXyZbbB1dRN4jTJlUXquD6TSOjk?=
 =?us-ascii?Q?182W/aBSSNVg1ANO//D2h85/BsUsYcmB749N/20bKQNiyNOnsIX3oDzxWJPB?=
 =?us-ascii?Q?Sh8rdw9btklHXoQJaH+Y/M7lnTk2bDprz/nno7onC42XCE6J+kBjg0jjxBnD?=
 =?us-ascii?Q?0W4DNJU4bmnUrd280NZ4tABZ680Fljke3Nd5y8b7rlunFpHuCeRFWE6QUPlI?=
 =?us-ascii?Q?9NDK/gGhJWqemszlQmBOA1zDpnJCdh55dLkj3/O2dTJBlYu+7qMhI+/NQ/98?=
 =?us-ascii?Q?EcJUlfrUwzu4DZQsjCfQdatd6ck2sPW/JpESkBrXNVHeGnegbZv17WO2lY2n?=
 =?us-ascii?Q?WDKtGWy0RVIpvi+7Bbwj2npsRRyLVtjuH5hwe8UluN9N8Do1jujVn25tV0S3?=
 =?us-ascii?Q?2ssZV51lzSvcsb79O3hPq8vNr1zgy41s9OCN4nCwRk2WpzU2YnrircEvHoCZ?=
 =?us-ascii?Q?KyfT+7J+8FqIr3sGhLKiQxcqHJobpgXJdqZcGXnXyMk61ZUU9v/wJlP5eMZw?=
 =?us-ascii?Q?E+aBBjLt9wr2o/kcYUsjPnLJuMumfo60gpa2e8zrBdYnymSt2KBhLBwjtk87?=
 =?us-ascii?Q?nEA5ZUyrYPXnWKfXc2XRrVzECVsDX3VJYzqcNeXr1Y3jOCdcOe318HigChHL?=
 =?us-ascii?Q?0S10rpZMhYaGFwZLPMUQE9SkytkdZudQzvCcfN8DB2td6VpAT6aK9vaMfnw1?=
 =?us-ascii?Q?ruCRp7+PpIt2f3SW64RDIApdHy39iq1n71+nn1vgYRQ3dWqPfNLOc4Jb1OR3?=
 =?us-ascii?Q?D0EKtDjQSjKEDbbBEd0GPRPBBhjeCeiAPI2ygHPUtHGTYoFvscX8aw2Fa9f0?=
 =?us-ascii?Q?j2hDke1I/Ol2GE+t50xzCecel8o2/qPOKF5+8kICrJjRus96KSOzATC3j/wt?=
 =?us-ascii?Q?ijiGd1Ks4tZRi9ZzntMD4QWbE+Q/GhvnyzxYmaDfVenvhEouOI2NRfq3MALe?=
 =?us-ascii?Q?vKx/aXmSsZw5x02v2AQbCyQD0gHu0tvom1Nm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:05:28.5487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49bde12a-5deb-4fe6-898a-08dde61a6a74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4107

We extract cppc info from "struct xen_get_cpufreq_para", where it acts as
a member of union, and share the space with governor info.
However, it may fail in amd-cppc passive mode, in which governor info and
CPPC info could co-exist, and both need to be printed together via xenpm tool.
If we tried to still put it in "struct xen_get_cpufreq_para" (e.g. just move
out of union), "struct xen_get_cpufreq_para" will enlarge too much to further
make xen_sysctl.u exceed 128 bytes.

So we introduce a new sub-field GET_CPUFREQ_CPPC to dedicatedly acquire
CPPC-related para, and make get-cpufreq-para invoke GET_CPUFREQ_CPPC
if available.
New helpers print_cppc_para() and get_cpufreq_cppc() are introduced to
extract CPPC-related parameters process from cpufreq para.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
Acked-by: Jan Beulich <jbeulich@suse.com> # hypervisor
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
v4 -> v5:
- new commit
---
v5 -> v6:
- remove the changes for get-cpufreq-para
---
v6 -> v7:
- make get-cpufreq-para invoke GET_CPUFREQ_CPPC
---
v7 -> v8:
- use structure assignment as it is a alias
- add errno info to the error print
---
 tools/include/xenctrl.h     |  3 +-
 tools/libs/ctrl/xc_pm.c     | 25 +++++++++++-
 tools/misc/xenpm.c          | 79 ++++++++++++++++++++++++-------------
 xen/drivers/acpi/pm-op.c    | 19 +++++++--
 xen/include/public/sysctl.h |  3 +-
 5 files changed, 96 insertions(+), 33 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 965d3b585a..e5103453a9 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1938,7 +1938,6 @@ struct xc_get_cpufreq_para {
                 xc_ondemand_t ondemand;
             } u;
         } s;
-        xc_cppc_para_t cppc_para;
     } u;
 
     int32_t turbo_enabled;
@@ -1953,6 +1952,8 @@ int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
                         int ctrl_type, int ctrl_value);
 int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
                         xc_set_cppc_para_t *set_cppc);
+int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
+                     xc_cppc_para_t *cppc_para);
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq);
 
 int xc_set_sched_opt_smt(xc_interface *xch, uint32_t value);
diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 6fda973f1f..56e213018a 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -288,7 +288,6 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
         CHK_FIELD(s.scaling_min_freq);
         CHK_FIELD(s.u.userspace);
         CHK_FIELD(s.u.ondemand);
-        CHK_FIELD(cppc_para);
 
 #undef CHK_FIELD
 
@@ -366,6 +365,30 @@ int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
     return ret;
 }
 
+int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
+                     xc_cppc_para_t *cppc_para)
+{
+    int ret;
+    struct xen_sysctl sysctl = {};
+
+    if ( !xch  || !cppc_para )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    sysctl.cmd = XEN_SYSCTL_pm_op;
+    sysctl.u.pm_op.cmd = GET_CPUFREQ_CPPC;
+    sysctl.u.pm_op.cpuid = cpuid;
+
+    ret = xc_sysctl(xch, &sysctl);
+    if ( ret )
+        return ret;
+
+    *cppc_para = sysctl.u.pm_op.u.get_cppc;
+    return ret;
+}
+
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq)
 {
     int ret = 0;
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 6b054b10a4..e83dd0d80c 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -801,6 +801,34 @@ static unsigned int calculate_activity_window(const xc_cppc_para_t *cppc,
     return mantissa * multiplier;
 }
 
+/* print out parameters about cpu cppc */
+static void print_cppc_para(unsigned int cpuid,
+                            const xc_cppc_para_t *cppc)
+{
+    printf("cppc variables       :\n");
+    printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear [%"PRIu32"]\n",
+           cppc->lowest, cppc->lowest_nonlinear);
+    printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
+           cppc->nominal, cppc->highest);
+    printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy perf [%"PRIu32"]\n",
+           cppc->minimum, cppc->maximum, cppc->energy_perf);
+
+    if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
+    {
+        unsigned int activity_window;
+        const char *units;
+
+        activity_window = calculate_activity_window(cppc, &units);
+        printf("                     : activity_window [%"PRIu32" %s]\n",
+               activity_window, units);
+    }
+
+    printf("                     : desired [%"PRIu32"%s]\n",
+           cppc->desired,
+           cppc->desired ? "" : " hw autonomous");
+    printf("\n");
+}
+
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
@@ -826,33 +854,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    if ( hwp )
-    {
-        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
-
-        printf("cppc variables       :\n");
-        printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear [%"PRIu32"]\n",
-               cppc->lowest, cppc->lowest_nonlinear);
-        printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
-               cppc->nominal, cppc->highest);
-        printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy perf [%"PRIu32"]\n",
-               cppc->minimum, cppc->maximum, cppc->energy_perf);
-
-        if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
-        {
-            unsigned int activity_window;
-            const char *units;
-
-            activity_window = calculate_activity_window(cppc, &units);
-            printf("                     : activity_window [%"PRIu32" %s]\n",
-                   activity_window, units);
-        }
-
-        printf("                     : desired [%"PRIu32"%s]\n",
-               cppc->desired,
-               cppc->desired ? "" : " hw autonomous");
-    }
-    else
+    if ( !hwp )
     {
         if ( p_cpufreq->gov_num )
             printf("scaling_avail_gov    : %s\n",
@@ -898,6 +900,24 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
     printf("\n");
 }
 
+/* show cpu cppc parameters information on CPU cpuid */
+static int show_cppc_para_by_cpuid(xc_interface *xc_handle, unsigned int cpuid)
+{
+    int ret;
+    xc_cppc_para_t cppc_para;
+
+    ret = xc_get_cppc_para(xc_handle, cpuid, &cppc_para);
+    if ( !ret )
+        print_cppc_para(cpuid, &cppc_para);
+    else if ( errno == ENODEV )
+        ret = 0; /* Ignore unsupported platform */
+    else
+        fprintf(stderr, "[CPU%u] failed to get cppc parameter: %s\n",
+                cpuid, strerror(errno));
+
+    return ret;
+}
+
 /* show cpu frequency parameters information on CPU cpuid */
 static int show_cpufreq_para_by_cpuid(xc_interface *xc_handle, int cpuid)
 {
@@ -957,7 +977,12 @@ static int show_cpufreq_para_by_cpuid(xc_interface *xc_handle, int cpuid)
     } while ( ret && errno == EAGAIN );
 
     if ( ret == 0 )
+    {
         print_cpufreq_para(cpuid, p_cpufreq);
+
+        /* Show CPPC parameters if available */
+        ret = show_cppc_para_by_cpuid(xc_handle, cpuid);
+    }
     else if ( errno == ENODEV )
     {
         ret = -ENODEV;
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index a7eaf29c31..19aedf6b0b 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -77,6 +77,17 @@ static int read_scaling_available_governors(char *scaling_available_governors,
     return 0;
 }
 
+static int get_cpufreq_cppc(unsigned int cpu,
+                            struct xen_get_cppc_para *cppc_para)
+{
+    int ret = -ENODEV;
+
+    if ( hwp_active() )
+        ret = get_hwp_para(cpu, cppc_para);
+
+    return ret;
+}
+
 static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
 {
     uint32_t ret = 0;
@@ -143,9 +154,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    if ( hwp_active() )
-        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
-    else
+    if ( !hwp_active() )
     {
         if ( !(scaling_available_governors =
                xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
@@ -385,6 +394,10 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
         ret = set_cpufreq_para(op);
         break;
 
+    case GET_CPUFREQ_CPPC:
+        ret = get_cpufreq_cppc(op->cpuid, &op->u.get_cppc);
+        break;
+
     case SET_CPUFREQ_CPPC:
         ret = set_cpufreq_cppc(op);
         break;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index eb3a23b038..3f654f98ab 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -492,7 +492,6 @@ struct xen_get_cpufreq_para {
                 struct  xen_ondemand ondemand;
             } u;
         } s;
-        struct xen_get_cppc_para cppc_para;
     } u;
 
     int32_t turbo_enabled;
@@ -523,6 +522,7 @@ struct xen_sysctl_pm_op {
     #define SET_CPUFREQ_PARA           (CPUFREQ_PARA | 0x03)
     #define GET_CPUFREQ_AVGFREQ        (CPUFREQ_PARA | 0x04)
     #define SET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x05)
+    #define GET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x06)
 
     /* set/reset scheduler power saving option */
     #define XEN_SYSCTL_pm_op_set_sched_opt_smt    0x21
@@ -547,6 +547,7 @@ struct xen_sysctl_pm_op {
     uint32_t cpuid;
     union {
         struct xen_get_cpufreq_para get_para;
+        struct xen_get_cppc_para    get_cppc;
         struct xen_set_cpufreq_gov  set_gov;
         struct xen_set_cpufreq_para set_para;
         struct xen_set_cppc_para    set_cppc;
-- 
2.34.1


