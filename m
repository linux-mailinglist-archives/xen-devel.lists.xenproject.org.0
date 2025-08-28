Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1817B398FC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:02:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098125.1452255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZSm-0004eG-FI; Thu, 28 Aug 2025 10:02:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098125.1452255; Thu, 28 Aug 2025 10:02:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZSm-0004bT-C4; Thu, 28 Aug 2025 10:02:36 +0000
Received: by outflank-mailman (input) for mailman id 1098125;
 Thu, 28 Aug 2025 10:02:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urZSk-0003xr-N7
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:02:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2415::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d6d6e39-83f6-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 12:02:33 +0200 (CEST)
Received: from MN2PR13CA0017.namprd13.prod.outlook.com (2603:10b6:208:160::30)
 by CH3PR12MB8710.namprd12.prod.outlook.com (2603:10b6:610:173::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 10:02:26 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:160:cafe::38) by MN2PR13CA0017.outlook.office365.com
 (2603:10b6:208:160::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.15 via Frontend Transport; Thu,
 28 Aug 2025 10:02:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 10:02:25 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:02:25 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 28 Aug 2025 03:02:22 -0700
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
X-Inumbo-ID: 1d6d6e39-83f6-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWog7YzwkY5ucx5OL5nmp5QiX7aFSopu+jwdeNoPKaiQiaP1WN1wNCb5T+jnOVaf+VThkYPmvkNbP6mXORyK4T785lMHBiOGQol9YqRobYDz4e0Jvbs01dySkNbXALYnO+n+7FIyqbF0lvNLkThZtNrly6I/MeRgh8Vq1L4aTFKHWyXxTV5+S1C1sNutVd/jjOa14ueI1gNyQIh5ZyTDqzQhtoTcst9QUSHZC0FmTtHCYRehrf03yr1Nj5qlsv8Un5mlIGMyoUOWSNhhktbEo7nLgsOJnlXwFfPYP6OJfgrkPWxrljM9bypGgg77Q7yFA1z9RAFPiXmRbo6dpgsQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFow82ppPAxmI3VLc61oBcj1GCRPcjquAW8F/RqbHEo=;
 b=G/KEEnWbmtjjKw037PwAKNT6qXgHLsWhzPw6/B0g+wD5tnzeuuJt3uiuk/NBEMj2tkPa+lSwXcM0kqC/fGnj0b/JG3T6G4Os34wGJRC6hf6+8b6K+jmnw1OkFYbHZ9YRNCAmoH/y7E7y08wuVn1wfr7jvOom3o/Hx0OQf12a6nvupLqp21drABwQtFfi3otkxH/u83PtaVQ+TBsn9OfQEse1VAAr9Sex0OsG1zlLfZFuYJQaQxdHtWv6ARrlayKBm+Xe0ZLVk32ppNhB6PRr4KhgkVstMPZcVJkTgIKk2jBDqlvJYFBfoHh52VppyofZENmAF4/8rBMr+l2se/HCyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFow82ppPAxmI3VLc61oBcj1GCRPcjquAW8F/RqbHEo=;
 b=xEq/ZerqsB4GZTAzhvgd1R9xgwpVziuFZbMbij4CzCLYL3PFBRrg+sQmQbu+P8IE1i/uPpSfZeVHBCt6viFjDO/SR65GavF4FfdBQ7Ab6IrNIJDaBLIXPdME0WVh0dWCrl01/Dy0WIusvfSZiLbuD7wuXSdillTVHXZhKV4EBZA=
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
Subject: [PATCH v8 1/8] xen/cpufreq: introduce new sub-hypercall to propagate CPPC data
Date: Thu, 28 Aug 2025 18:01:58 +0800
Message-ID: <20250828100205.1775636-2-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828100205.1775636-1-Penny.Zheng@amd.com>
References: <20250828100205.1775636-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|CH3PR12MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd69065-2fdb-4dbb-3d33-08dde619fda1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UGd/ocvBTxLY8R66C9UC0isi8xpKUBhnwP0JPkDJK7RI5vYx7RuK9S1mCIap?=
 =?us-ascii?Q?gAv81OkP+BcOrzNKBnSGeWArCCYnCMwcB8fBK6+n4Tva7bh7v2/vLWRp3HdC?=
 =?us-ascii?Q?QX/wSfdGgcrWespl3c9ASb0wGQn/iM3YXFm8BWTApdiu1s+d49YG4aYmrqo7?=
 =?us-ascii?Q?kC7wmhkz8er8umPFrdupE2AlWCVAh6TK5pY/2ikmLeHlc3M/UNgx9v04Fsh1?=
 =?us-ascii?Q?dyP54ugGGj0CwIFnYURmpE2fSGx28gMN0bCI1HhH0x4vE6kqimZp+8llxRQv?=
 =?us-ascii?Q?BsD+9+KOD6NA0CDl70/3u0QpeqaN/4wxDYHZ5g7ogIoAhQurkBhhd3CsUAzK?=
 =?us-ascii?Q?ybiS6+EafGQ1ICPwuV6rmxx1KquLD83Ty4BCyuG9y2LVJVbJer+XKJUOqYFr?=
 =?us-ascii?Q?iBeTGjdAvngxPF4VsSOLHfjNh0kx8dcRQpPfz7gw7F6hjJFbSM2jOeU4iNHj?=
 =?us-ascii?Q?17TKsXhTwBkgswzf5CySyaSPfUoQb4VnL5IWubDrSdYPBpw/PkPNKTSLSVXy?=
 =?us-ascii?Q?5uKynFBn/R8jel2AaxH0nDz6ScUAXJN0eheA0ZzmXfg6yc8d7jLqFsnz9BMT?=
 =?us-ascii?Q?V3Q6wI0jMug+/xgdPLbkNyQyHV8I6s9XO/C0rYU8yBXCSiMGSi2WuKi4OS3k?=
 =?us-ascii?Q?EPSG5rQnMgXNF/xIPg8tyKXkSZDQwOIgGIAjIFlmgiutVbC2qUWmC1qii4FC?=
 =?us-ascii?Q?/MqNHWz8NBBE4ZuuXtt5OKZwuX6MTwLLqAYXHYPcg1l7U9kLyWs2IQfu7CEQ?=
 =?us-ascii?Q?8o6dl4mFCZVBNewZsUtpCGJeNjtPpzjPHp7zFZ9ZMi5PjIZ1+PJ+vqcVEjvF?=
 =?us-ascii?Q?FX7ifXrd8yp1zq0GEh7HLiy4+hl3xGa9RwyPDhfyFOJWjtpoeiO2zBG2h+n+?=
 =?us-ascii?Q?2dtHv3vSsrXfOezX88RlMPelKmo8BaW/BCumBy6rQ7KGwGiQgy9qb9Y5n+Yp?=
 =?us-ascii?Q?XReZ2oPT59XZu3I7oVaQDE3zKAa+5DBs4BKTq87h7oil7+CKo6U9THLInou+?=
 =?us-ascii?Q?QGpGE0p36Md5exLhMiBFAljkvaG76RnlHZsRLJKBekTPni9H4FnEVlGS4BTj?=
 =?us-ascii?Q?D0KVeFqSvYIuINAJ7uE1mQiDVjcc0IxNWY6L5AdZJ3k77lb5y3Yi8Lgbuzw4?=
 =?us-ascii?Q?7oxfyQ76Lek0NHDtbn3w51OMEpyBo4txFPj3kp1nxK89+r92+rnMYWv+DBLi?=
 =?us-ascii?Q?0NiWa39SbwpFjLqIQi8yb7TgA2aKuyTBrSNGZiXxw1L1uGht0B9g7Iw6E/v/?=
 =?us-ascii?Q?Z19M91RyvtrRtwkU1CpZB9Miwouk55c92n+C4rILIrVdlo2+bam/P3Zuu8GU?=
 =?us-ascii?Q?+vc69n5gOVGnpHyQLh3szk7gtSgQufGEmuSJRnPTmpF3owPlmj/fKtRR5YDE?=
 =?us-ascii?Q?56qtwy3RdxdhxYDrKui68gy367z5PvcvQD1u+lVlnpCurpNrqsiQ/nUz5Iae?=
 =?us-ascii?Q?TBmU6vWz9Nr4SRPHdg5PWJDH15Qw0KHO4P7+naij1W4bPrRyubb/yTqTih7f?=
 =?us-ascii?Q?zmJY/SqfNw3tB5Xxso43AbLId/Zr+jgLhMNI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:02:25.9814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd69065-2fdb-4dbb-3d33-08dde619fda1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8710

In order to provide backward compatibility with existing governors
that represent performance as frequency, like ondemand, the _CPC
table can optionally provide processor frequency range values, Lowest
frequency and Nominal frequency, to let OS use Lowest Frequency/
Performance and Nominal Frequency/Performance as anchor points to
create linear mapping of CPPC performance to CPU frequency.

As Xen is uncapable of parsing the ACPI dynamic table, we'd like to
introduce a new sub-hypercall "XEN_PM_CPPC" to propagate required CPPC
data from dom0 kernel to Xen.
In the according handler set_cppc_pminfo(), we do _CPC and _PSD
sanitization check, as both _PSD and _CPC info are necessary for correctly
initializing cpufreq cores in CPPC mode.
Users shall be warned that if we failed at this point,
no fallback scheme, like legacy P-state could be switched to.

A new flag "XEN_CPPC_INIT" is also introduced for cpufreq core initialised in
CPPC mode. Then all .init flag checking shall be updated to
consider "XEN_CPPC_INIT" too.

We want to bypass construction of px statistic info in cpufreq_statistic_init()
for CPPC mode, while not bypassing cpufreq_statistic_lock initialization for a
good reason. The same check is unnecessary for cpufreq_statistic_exit(),
since it has already been covered by px statistic variable
"cpufreq_statistic_data" check

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
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
- replace -EFAULT with -ENOMEM
- indent fix
- add comment for state_count check for CPPC mode
---
 xen/arch/x86/platform_hypercall.c         |   5 +
 xen/arch/x86/x86_64/cpufreq.c             |  19 ++++
 xen/arch/x86/x86_64/platform_hypercall.c  |   3 +
 xen/drivers/acpi/pm-op.c                  |   7 +-
 xen/drivers/acpi/pmstat.c                 |   4 +
 xen/drivers/cpufreq/cpufreq.c             | 124 +++++++++++++++++++++-
 xen/include/acpi/cpufreq/processor_perf.h |   4 +-
 xen/include/public/platform.h             |  26 +++++
 xen/include/xen/pmstat.h                  |   5 +
 xen/include/xlat.lst                      |   1 +
 10 files changed, 193 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 21f9f795c1..fafc176475 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -577,6 +577,11 @@ ret_t do_platform_op(
             break;
         }
 
+        case XEN_PM_CPPC:
+            ret = set_cppc_pminfo(op->u.set_pminfo.id,
+                                  &op->u.set_pminfo.u.cppc_data);
+            break;
+
         default:
             ret = -EINVAL;
             break;
diff --git a/xen/arch/x86/x86_64/cpufreq.c b/xen/arch/x86/x86_64/cpufreq.c
index e4f3d5b436..525b29da71 100644
--- a/xen/arch/x86/x86_64/cpufreq.c
+++ b/xen/arch/x86/x86_64/cpufreq.c
@@ -54,3 +54,22 @@ int compat_set_px_pminfo(uint32_t acpi_id,
 
     return set_px_pminfo(acpi_id, xen_perf);
 }
+
+int compat_set_cppc_pminfo(unsigned int acpi_id,
+                           const struct compat_processor_cppc *cppc_data)
+
+{
+    struct xen_processor_cppc *xen_cppc;
+    unsigned long xlat_page_current;
+
+    xlat_malloc_init(xlat_page_current);
+
+    xen_cppc = xlat_malloc_array(xlat_page_current,
+                                 struct xen_processor_cppc, 1);
+    if ( unlikely(xen_cppc == NULL) )
+        return -ENOMEM;
+
+    XLAT_processor_cppc(xen_cppc, cppc_data);
+
+    return set_cppc_pminfo(acpi_id, xen_cppc);
+}
diff --git a/xen/arch/x86/x86_64/platform_hypercall.c b/xen/arch/x86/x86_64/platform_hypercall.c
index 9ab631c17f..0288f68df9 100644
--- a/xen/arch/x86/x86_64/platform_hypercall.c
+++ b/xen/arch/x86/x86_64/platform_hypercall.c
@@ -14,6 +14,9 @@ EMIT_FILE;
 #define efi_get_info        efi_compat_get_info
 #define efi_runtime_call(x) efi_compat_runtime_call(x)
 
+#define xen_processor_cppc  compat_processor_cppc
+#define set_cppc_pminfo     compat_set_cppc_pminfo
+
 #define xen_processor_performance compat_processor_performance
 #define set_px_pminfo       compat_set_px_pminfo
 
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 9a1970df34..e3b5c8bcaa 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -91,7 +91,10 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     pmpt = processor_pminfo[op->cpuid];
     policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
 
-    if ( !pmpt || !pmpt->perf.states ||
+    if ( !pmpt ||
+         ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
+         /* Avoid NULL deref of pmpt->perf.states[] */
+         ((pmpt->init & XEN_CPPC_INIT) && pmpt->perf.state_count) ||
          !policy || !policy->governor )
         return -EINVAL;
 
@@ -351,7 +354,7 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
     case CPUFREQ_PARA:
         if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
             return -ENODEV;
-        if ( !pmpt || !(pmpt->init & XEN_PX_INIT) )
+        if ( !pmpt || !(pmpt->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
             return -EINVAL;
         break;
     }
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index 4fae0c14af..0f31736df2 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -108,6 +108,10 @@ int cpufreq_statistic_init(unsigned int cpu)
     if ( !pmpt )
         return -EINVAL;
 
+    /* Only need to initialize in Px mode */
+    if ( !(pmpt->init & XEN_PX_INIT) )
+        return 0;
+
     spin_lock(cpufreq_statistic_lock);
 
     pxpt = per_cpu(cpufreq_statistic_data, cpu);
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 267e4d3f3b..c6ce31c0ac 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -40,6 +40,7 @@
 #include <xen/domain.h>
 #include <xen/cpu.h>
 #include <xen/pmstat.h>
+#include <xen/xvmalloc.h>
 #include <asm/io.h>
 #include <asm/processor.h>
 
@@ -234,6 +235,11 @@ static int get_psd_info(unsigned int cpu, unsigned int *shared_type,
         *domain_info = &processor_pminfo[cpu]->perf.domain_info;
         break;
 
+    case XEN_CPPC_INIT:
+        *shared_type = processor_pminfo[cpu]->cppc_data.shared_type;
+        *domain_info = &processor_pminfo[cpu]->cppc_data.domain_info;
+        break;
+
     default:
         ret = -EINVAL;
         break;
@@ -259,7 +265,7 @@ int cpufreq_add_cpu(unsigned int cpu)
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
+    if ( !(processor_pminfo[cpu]->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
         return -EINVAL;
 
     if (!cpufreq_driver.init)
@@ -434,7 +440,7 @@ int cpufreq_del_cpu(unsigned int cpu)
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    if ( !(processor_pminfo[cpu]->init & XEN_PX_INIT) )
+    if ( !(processor_pminfo[cpu]->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
         return -EINVAL;
 
     if (!per_cpu(cpufreq_cpu_policy, cpu))
@@ -693,6 +699,120 @@ int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32) pdc)
     return ret;
 }
 
+static void print_CPPC(const struct xen_processor_cppc *cppc_data)
+{
+    printk("\t_CPC: highest_perf=%u, lowest_perf=%u, "
+           "nominal_perf=%u, lowest_nonlinear_perf=%u, "
+           "nominal_mhz=%uMHz, lowest_mhz=%uMHz\n",
+           cppc_data->cpc.highest_perf, cppc_data->cpc.lowest_perf,
+           cppc_data->cpc.nominal_perf, cppc_data->cpc.lowest_nonlinear_perf,
+           cppc_data->cpc.nominal_mhz, cppc_data->cpc.lowest_mhz);
+}
+
+int set_cppc_pminfo(unsigned int acpi_id,
+                    const struct xen_processor_cppc *cppc_data)
+{
+    int ret = 0, cpuid;
+    struct processor_pminfo *pm_info;
+
+    cpuid = get_cpu_id(acpi_id);
+    if ( cpuid < 0 )
+    {
+        ret = -EINVAL;
+        goto out;
+    }
+
+    if ( cppc_data->pad[0] || cppc_data->pad[1] || cppc_data->pad[2] )
+    {
+        ret = -EINVAL;
+        goto out;
+    }
+
+    if ( cpufreq_verbose )
+        printk("Set CPU%d (ACPI ID %u) CPPC state info:\n",
+               cpuid, acpi_id);
+
+    pm_info = processor_pminfo[cpuid];
+    if ( !pm_info )
+    {
+        pm_info = xvzalloc(struct processor_pminfo);
+        if ( !pm_info )
+        {
+            ret = -ENOMEM;
+            goto out;
+        }
+        processor_pminfo[cpuid] = pm_info;
+    }
+    pm_info->acpi_id = acpi_id;
+    pm_info->id = cpuid;
+    pm_info->cppc_data = *cppc_data;
+
+    if ( (cppc_data->flags & XEN_CPPC_PSD) &&
+          !check_psd_pminfo(cppc_data->shared_type) )
+    {
+            ret = -EINVAL;
+            goto out;
+    }
+
+    if ( cppc_data->flags & XEN_CPPC_CPC )
+    {
+        if ( cppc_data->cpc.highest_perf == 0 ||
+             cppc_data->cpc.highest_perf > UINT8_MAX ||
+             cppc_data->cpc.nominal_perf == 0 ||
+             cppc_data->cpc.lowest_nonlinear_perf == 0 ||
+             cppc_data->cpc.lowest_perf == 0 ||
+             cppc_data->cpc.lowest_perf >
+                 cppc_data->cpc.lowest_nonlinear_perf ||
+             cppc_data->cpc.lowest_nonlinear_perf >
+                 cppc_data->cpc.nominal_perf ||
+             cppc_data->cpc.nominal_perf > cppc_data->cpc.highest_perf )
+            /*
+             * Right now, Xen doesn't actually use highest_perf/nominal_perf/
+             * lowest_nonlinear_perf/lowest_perf values read from ACPI _CPC
+             * table. Xen reads CPPC capability MSR to get these four values.
+             * So warning is enough.
+             */
+            printk_once(XENLOG_WARNING
+                        "Broken CPPC perf values: lowest(%u), nonlinear_lowest(%u), nominal(%u), highest(%u)\n",
+                        cppc_data->cpc.lowest_perf,
+                        cppc_data->cpc.lowest_nonlinear_perf,
+                        cppc_data->cpc.nominal_perf,
+                        cppc_data->cpc.highest_perf);
+
+        /* lowest_mhz and nominal_mhz are optional value */
+        if ( cppc_data->cpc.nominal_mhz &&
+             cppc_data->cpc.lowest_mhz > cppc_data->cpc.nominal_mhz )
+        {
+            printk_once(XENLOG_WARNING
+                        "Broken CPPC freq values: lowest(%u), nominal(%u)\n",
+                        cppc_data->cpc.lowest_mhz,
+                        cppc_data->cpc.nominal_mhz);
+            /* Re-set with zero values, instead of keeping invalid values */
+            pm_info->cppc_data.cpc.nominal_mhz = 0;
+            pm_info->cppc_data.cpc.lowest_mhz = 0;
+        }
+    }
+
+    if ( cppc_data->flags == (XEN_CPPC_PSD | XEN_CPPC_CPC) )
+    {
+        if ( cpufreq_verbose )
+        {
+            print_PSD(&pm_info->cppc_data.domain_info);
+            print_CPPC(&pm_info->cppc_data);
+        }
+
+        pm_info->init = XEN_CPPC_INIT;
+        ret = cpufreq_cpu_init(cpuid);
+        if ( ret )
+            printk_once(XENLOG_WARNING
+                        "CPU%d failed amd-cppc mode init; use \"cpufreq=xen\" instead",
+                        cpuid);
+    }
+
+ out:
+    return ret;
+}
+
 static void cpufreq_cmdline_common_para(struct cpufreq_policy *new_policy)
 {
     if (usr_max_freq)
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 4e045da983..e6576314f0 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -5,7 +5,8 @@
 #include <public/sysctl.h>
 #include <xen/acpi.h>
 
-#define XEN_PX_INIT 0x80000000U
+#define XEN_CPPC_INIT 0x40000000U
+#define XEN_PX_INIT   0x80000000U
 
 unsigned int powernow_register_driver(void);
 unsigned int get_measured_perf(unsigned int cpu, unsigned int flag);
@@ -43,6 +44,7 @@ struct processor_pminfo {
     uint32_t acpi_id;
     uint32_t id;
     struct processor_performance    perf;
+    struct xen_processor_cppc cppc_data;
 
     uint32_t init;
 };
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 2725b8d104..94349fc5f5 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -363,6 +363,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
 #define XEN_PM_PX   1
 #define XEN_PM_TX   2
 #define XEN_PM_PDC  3
+#define XEN_PM_CPPC 4
 
 /* Px sub info type */
 #define XEN_PX_PCT   1
@@ -370,6 +371,10 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
 #define XEN_PX_PPC   4
 #define XEN_PX_PSD   8
 
+/* CPPC sub info type */
+#define XEN_CPPC_PSD   (1U << 0)
+#define XEN_CPPC_CPC   (1U << 1)
+
 struct xen_power_register {
     uint32_t     space_id;
     uint32_t     bit_width;
@@ -457,6 +462,26 @@ struct xen_processor_performance {
 typedef struct xen_processor_performance xen_processor_performance_t;
 DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
 
+struct xen_processor_cppc {
+    uint8_t flags; /* IN: XEN_CPPC_xxx */
+    uint8_t pad[3];
+    /*
+     * IN: Subset _CPC fields useful for CPPC-compatible cpufreq
+     * driver's initialization
+     */
+    struct {
+        uint32_t highest_perf;
+        uint32_t nominal_perf;
+        uint32_t lowest_nonlinear_perf;
+        uint32_t lowest_perf;
+        uint32_t lowest_mhz;
+        uint32_t nominal_mhz;
+    } cpc;
+    uint32_t shared_type; /* IN: XEN_CPUPERF_SHARED_TYPE_xxx */
+    struct xen_psd_package domain_info; /* IN: _PSD */
+};
+typedef struct xen_processor_cppc xen_processor_cppc_t;
+
 struct xenpf_set_processor_pminfo {
     /* IN variables */
     uint32_t id;    /* ACPI CPU ID */
@@ -465,6 +490,7 @@ struct xenpf_set_processor_pminfo {
         struct xen_processor_power          power;/* Cx: _CST/_CSD */
         struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/_PSD */
         XEN_GUEST_HANDLE(uint32)            pdc;  /* _PDC */
+        xen_processor_cppc_t                cppc_data; /* CPPC: _CPC and _PSD */
     } u;
 };
 typedef struct xenpf_set_processor_pminfo xenpf_set_processor_pminfo_t;
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 8350403e95..6096560d3c 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -7,12 +7,17 @@
 
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
 long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
+int set_cppc_pminfo(unsigned int acpi_id,
+                    const struct xen_processor_cppc *cppc_data);
 
 #ifdef CONFIG_COMPAT
 struct compat_processor_performance;
 int compat_set_px_pminfo(uint32_t acpi_id, struct compat_processor_performance *perf);
 struct compat_processor_power;
 long compat_set_cx_pminfo(uint32_t acpi_id, struct compat_processor_power *power);
+struct compat_processor_cppc;
+int compat_set_cppc_pminfo(unsigned int acpi_id,
+                           const struct compat_processor_cppc *cppc_data);
 #endif
 
 uint32_t pmstat_get_cx_nr(unsigned int cpu);
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 6d6c6cfab2..9d08dcc4bb 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -160,6 +160,7 @@
 
 !	pct_register			platform.h
 !	power_register			platform.h
+!	processor_cppc			platform.h
 ?	processor_csd			platform.h
 !	processor_cx			platform.h
 !	processor_flags			platform.h
-- 
2.34.1


