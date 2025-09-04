Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C715DB43286
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 08:36:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109507.1459112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3Zk-0004Nj-GP; Thu, 04 Sep 2025 06:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109507.1459112; Thu, 04 Sep 2025 06:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3Zk-0004Kr-8y; Thu, 04 Sep 2025 06:36:04 +0000
Received: by outflank-mailman (input) for mailman id 1109507;
 Thu, 04 Sep 2025 06:36:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UG7t=3P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uu3Zi-0002id-Nv
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 06:36:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2413::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b5a9337-8959-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 08:36:00 +0200 (CEST)
Received: from MN0PR02CA0021.namprd02.prod.outlook.com (2603:10b6:208:530::23)
 by MN6PR12MB8490.namprd12.prod.outlook.com (2603:10b6:208:470::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 06:35:54 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:530:cafe::17) by MN0PR02CA0021.outlook.office365.com
 (2603:10b6:208:530::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.28 via Frontend Transport; Thu,
 4 Sep 2025 06:35:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 06:35:54 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 01:35:52 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Wed, 3 Sep 2025 23:35:48 -0700
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
X-Inumbo-ID: 6b5a9337-8959-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJuN5vRu+UbjEdaXdKl0ZIUZjBbe8UWisbHnVxdqhdZYPeEATbVbRJnBjRaMgZmSFBR5xtdPFUI/kpCxCBbOKcJkx6yyQ71z/6bzL3/ZdlMw51KosGFXkUqlkpO3MZ8OwxZ7FU1oHROvKLNxavyWSaGk1NdMA7LsYAcKnUnoxfy/Z5BW9Q1USvpP0HvoojQwMq/CNB2VjLgWJ/z03z9arLkBByvlp6p0VG5+wviTV4BbXkQfms+r4si/qo2edg8NFrHOmy7axuCbtP4UB4M6e4ai+4MI+DMmNID3kYC9CdazrfesoWNCad0Ea2DsaMDOvHcZ+q4uhTkudTzmdmWlTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Toe6Isc8jD267iNGh3XLoNGxPPh/1SU1rDpbA94F4Os=;
 b=S1URRXxdFiDaLuqRtX+/x8Zf44tqbeSp5FTYKOG9ia8bbP3KINeMc3QaGfy5xaaEoa3cUoa7L0Hy1BqycCqjiCRHaAuzSleP+YJi+0FIl4vXhM7xkCR7sS1mnRbJEre5jjMKnRoA1b0FHbPXuifmqCFmxbVU50sNfEB1FtEBRyJr+BG6CEUpR4mNejnGoSQJFi+J3um07Y5zqxmBUshaHpKZMVHCMIRqv0TsFjQ5Lblm0zHpFRY2SgffqWRhKr7hWb4TcvkvKuUuV65K1+aSiPBejOPX5cSdjgEZWWlG+hE8tTh3KANnTOcO66o8LA+e9sncLSaVQ9Jkx7Mgi2btlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Toe6Isc8jD267iNGh3XLoNGxPPh/1SU1rDpbA94F4Os=;
 b=orsWwYkqkpywO4THZICY+z/uvYGcl3m+sq76ZmF1Wy+1QjBhAX8Rs7LByM79SqLFiJySaEz+/aOo1dhdhlQrstCm/wD/AuOay46ZuEwrxP+NI0CfjJ0EcavnZIMy8G/znwLUNqAGOi6sMsXsf8z1U2SGlZY9blGsvNgWSUnGIts=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v9 5/8] tools/cpufreq: extract CPPC para from cpufreq para
Date: Thu, 4 Sep 2025 14:35:15 +0800
Message-ID: <20250904063518.2097629-6-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|MN6PR12MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 040bf4e4-cb5d-4f0b-f403-08ddeb7d4c5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KhpjyCZM8vgSfSZjB+0jQIUmGOQoBNhOUu+opGDjHCnWAtrCUVInIpsqsQlx?=
 =?us-ascii?Q?952YsMlY1BDCUvKs7JppGchOEfKiDL1wc/kxORD27kWMCbUda19JW2S4t/Xv?=
 =?us-ascii?Q?zNl8uFYY2XlA7iAw0lqnsvvURJmtQmorXeLMb980VNIhe57QDOoLuSX5+5xZ?=
 =?us-ascii?Q?VDjPVnCKDlCUt2mQfncKDQy5+3EHHSGpIgfKK5Jx85JN/EWgTNDgGoc4oJ73?=
 =?us-ascii?Q?DQfjVoOzrc3ENDvoRuTTE9RFH0kbpp1M7fsiKYZjt4Z4Flh8fTqVAcMZkitl?=
 =?us-ascii?Q?FFz44rdDydqoP5kvonfOh/TYe6DMG3gLuRA8iWUhtK9Mm+Q0yL20HeyjF+OA?=
 =?us-ascii?Q?uZqZFJ4JPY5MEUk9XpQB8yOrFH1NmDn7BajAd+JQYrnTkYbxVnYZu8ZQfidp?=
 =?us-ascii?Q?J6at9cPWTb4sQSrecNibDwNWbGJ9Qmk56cYOT3bbtku774e0D8DZ9m3HAphF?=
 =?us-ascii?Q?Q8czyhKkPKy1CuCCW5MbMZ4eb9ZjltuS3VY63TKQrwSWh9lVa8W6hYwKhwOt?=
 =?us-ascii?Q?QkrX6NVHTTNIMF/uvgQBJzqhLLh9+fJda9uJkSq2tG00MviUFES7D2hLGdcN?=
 =?us-ascii?Q?2JKuC5y+GCl11zFj/6Y5fg7afolIMtdQexRgER4l1Zz775SMUK2ee4SCQLXB?=
 =?us-ascii?Q?1NxfFSnhfGRv2diGfNaAqCYiG5r3TDmZTAqnA5rRVaKh0RfBkEXKvADAC7n1?=
 =?us-ascii?Q?mfyrRAS0c92m0P4z9vPe8LHJPypGHTrG2hLRCT0ERVp1csQg6STBTQAVVjbr?=
 =?us-ascii?Q?oRwI/k4CJU1ivsEgTYAADh/mYNjUHcNy4ZiwFqRP6eePf8cbiWCsTRO3ATGX?=
 =?us-ascii?Q?scGmpjjQG2Jwr0YfYts4B8JfdwkOk+kZKkmv4/A+N0KJ1699RIq2lOdUy7ID?=
 =?us-ascii?Q?bDiuiKpSWqWmgR8PaDL8mfjsGg33lcogULrpADgVMNzCTcGNSO7nTsKDQ1Hh?=
 =?us-ascii?Q?sJEA6hXhH6DKJhYhdi1sa4wfW7p/EVyiZJwT17xZ1+MOcxJzxbiPU9Op17h/?=
 =?us-ascii?Q?dWEZRnKYKo3R/Av8i7JIYPqa8nVXDHLC6/x1onG5iDrFceYbyHqvEaIWgaUx?=
 =?us-ascii?Q?3fBmn8sLjKu+6Ax8SU/nL5/msK7WMLxIRxPZTYDEdeGdq2oZhe8lbXvvTR1i?=
 =?us-ascii?Q?FmtRdce1yfAIeG+31MgTT5rqNB53DeyKf16zc6NSUr9ouHDNdhMZAmpcqsaS?=
 =?us-ascii?Q?1PgX6HR8D1/pmM6Il9Yt4RJ7/hgu0oBUFojJIWHdi/+WxTOI1bZjH7CGSuXE?=
 =?us-ascii?Q?rYtz2+FBX3esJ7F31KUv5neNpwFStSZO7lrJjhlIAJ0TRUWPu9rMAAZcEc5P?=
 =?us-ascii?Q?L/aU041RgyS+IdsB80GlnTqsVIP1EuKDHLU/C5dlvbfo0f2osHScBE2llEDC?=
 =?us-ascii?Q?o6iFhiNGk8WeRdNjw9xLknZhA5iznmjAHqWKhVEzKVZvahqfnJ1yTOW/XDnm?=
 =?us-ascii?Q?6nuAG6LqOhYjo5n4GOvuxsQ+lc4kTh5ZdnaH9QuXHuQLzq+tkG/lo22fK7BL?=
 =?us-ascii?Q?MiALowmKwJYtyLc2g8mxcZdN4EIEouWoVXfs?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 06:35:54.0633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 040bf4e4-cb5d-4f0b-f403-08ddeb7d4c5c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8490

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


