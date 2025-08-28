Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81447B39906
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 12:05:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098177.1452305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZVQ-0007tc-4R; Thu, 28 Aug 2025 10:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098177.1452305; Thu, 28 Aug 2025 10:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urZVQ-0007s8-1n; Thu, 28 Aug 2025 10:05:20 +0000
Received: by outflank-mailman (input) for mailman id 1098177;
 Thu, 28 Aug 2025 10:05:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ityt=3I=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1urZVO-0007re-Lj
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 10:05:18 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20612.outbound.protection.outlook.com
 [2a01:111:f403:2406::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e673ea6-83f6-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 12:05:16 +0200 (CEST)
Received: from CH0PR04CA0048.namprd04.prod.outlook.com (2603:10b6:610:77::23)
 by SA0PR12MB4432.namprd12.prod.outlook.com (2603:10b6:806:98::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Thu, 28 Aug
 2025 10:05:09 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::fd) by CH0PR04CA0048.outlook.office365.com
 (2603:10b6:610:77::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Thu,
 28 Aug 2025 10:05:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Thu, 28 Aug 2025 10:05:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 05:05:03 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Thu, 28 Aug 2025 03:05:02 -0700
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
X-Inumbo-ID: 7e673ea6-83f6-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tTuG5AONUt1+xtynw5AhCYGu/WoyI14yUehycG0SjLHyNIUXFcyMRhqmv+pvDzR7+eeTGhPUNDGw4QX7I2J4bx3T9bdLsWaeYyyyYxQeFKaFIQRF67wqgAyRwbVY85brXJOcnfqjxI7+9MzaGrAQKWKxOTcwczTOwXna8HM5hBSBIJdfBTOMZi8taPFp8vW3NtPsFHUhcwhv0g0zv2MXryvvWaWQlVlQ5hPJKuWln9O36NqxH20dWhTgVGOQjQyzRAugOPybgyR2NQQsYni60Qhy8AiyBygYCCQI79tLnVyCKmQ1r3M/GJtpCXzZU8L9y9ykLM3tZX2/+az6u8Udcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGXRU6OOlfIx4vW48sL+1I8w8ruvVFPQAhs++IqOvzU=;
 b=B4VpCPAuVMdg64ShLt3jpMv/BjZgWUN8BxCRUkWzLG/BpH6v/3ZPbnZZLQeCsZXxgGc6hc5PNmFwKFBPn6+G9jiS7r56cByr9QKEbj78jnvJ1+bnbVrrnUtFAvUAcnxxNiTgpYbh5Bb/whLnpE6F/Av0AafIt8Bg9RmPT91dPS8aIWz94GTBhsjb5RNghixxZT3bvsel5/49XrDNkKmUVL8MwGIqIUxGHa9iXmlJql1M0ppNzser9NBSBrJ1lektiikzFIAA8VXp7nlzJmz6LUyvxeaXfBbl1k4OMCrhpgm0tNR93WVNwKNPXYOH5bX18UzK7ERLJ8oFZw3N4Kmtzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGXRU6OOlfIx4vW48sL+1I8w8ruvVFPQAhs++IqOvzU=;
 b=y0+R/8862otG+WRloRPA+tyGWx1tdSWMP53lp4K4iQuoCI6wLZGyIexlFutkd6B3g8hhOuv77WhiUe1eAYZzAYeE5tfTjaGgg84QQNzCyuUmRjuwmZcyruTf8E2nHcwkDvVyIWp6bqdps7G9t9jnESF2shadDscVMWTQpupmh1Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v8 5/8] xen/cpufreq: get performance policy from governor set via xenpm
Date: Thu, 28 Aug 2025 18:04:43 +0800
Message-ID: <20250828100443.1776675-1-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SA0PR12MB4432:EE_
X-MS-Office365-Filtering-Correlation-Id: e4117e5f-63db-49b1-5e63-08dde61a5ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KPmU22SrPM3QidHzAZ8ikf9cAQeSRdw9zQPUWLGoHYW0azIEmcQ6FUsYJNmv?=
 =?us-ascii?Q?UAz0+vNAxNYoAmGqqWUW/lLFQyHYIxRqs8H+iw5mIpKage8+ji2xHRRh5i/s?=
 =?us-ascii?Q?ljnsPMNvQtn+Wy1Z6WgitcuQlF0LKLytEqnnJwXRkbSrDW8mCVB+DlvMMYls?=
 =?us-ascii?Q?1FzdhCUntzPU1047ONDhcpCeILOhMJBzCME7jejni2SlBGEYyqTfEiu4xqMx?=
 =?us-ascii?Q?vPBWmT/CeOMagUriIv1p+GspHKmcZETvXMzqcN0r1lFR8f61qAm/vEOr7ITa?=
 =?us-ascii?Q?PBFPw28o+3cLAwxyMuLl6oUwQwpjV/bZQvCvo+5FRto7VRa95uNpXyv0FXXw?=
 =?us-ascii?Q?ge1cz1DlVU4+REPpzG70+rASXfPMByDJxh2KmgWFRCfTrYexw2CcG1MZU33V?=
 =?us-ascii?Q?T97cdCXfyBwsO5okkuqAP4zjTJbMDNX13PxGuyeFR0yubMv/YSG3EyX1spbG?=
 =?us-ascii?Q?Q7LerZ4K8uUhqVlvhTDYjFAeW2PJp8QwZxVA50Roa0nTjLw/LYiTOpeF8Bk/?=
 =?us-ascii?Q?QAbG4JMgwrI3MsSU1qkWpnqeeLouMF+RH6VYqlP/OXo9n4qXH2tM2tGInFn7?=
 =?us-ascii?Q?T2P2KECNE0U9+m7lDh/Fm/C0MYtob+oD1Rh0W/1gSqtSywf0MQDZHk7UuNd/?=
 =?us-ascii?Q?Ql3xXlF3ijINwIAUUO89qTXRMDlUebbqYu1r9KTYWyFQdsNPlrPCQjOrXRgC?=
 =?us-ascii?Q?H4Rb1o/4DCfX2JbaGXbK0o3CpunAOI76c2gmYLs9LcXcOqpWyhGrXNQbePAG?=
 =?us-ascii?Q?6snx/myBPfdQqGSwGZwe8lqWd0VrhO7h8Loc/W6IcVasIhS8KfIoi5jnB5eN?=
 =?us-ascii?Q?cLBCYI674VKI3VfL3DG0pN0367j2M8g9gqWza4rXZxLdekGNwL4dyZbvEtZR?=
 =?us-ascii?Q?KgjsijjzrWAZ8pYlSW+VbTm6ZowAB7U/X4fitJ4xMb+xFzl6VfaWVEO2in/S?=
 =?us-ascii?Q?e0hdjLvJdo6NMQVSPXg/IPpgdaA0nEQi2opszYz5gQUc81rXOfbsoLrKV9sv?=
 =?us-ascii?Q?A9Qi+uVNrIbCpL4BCyhBUHEns1Vy9i445x0paVc69wr+bWeUGpy5zqle7Zid?=
 =?us-ascii?Q?ZIEGX9aLHt1twMXqKpuW0yj0z3pGzOh9xNV6Iy+n9hO/rfbsyZkZIX6kMnnx?=
 =?us-ascii?Q?CKy0R6c77eMmYTgdX5IuWWgSECXTSY+Ncein5eKPieh5jIu+nQME7ligUzPU?=
 =?us-ascii?Q?zJZJzTsZMCjvjDBlQo8Wx509WDmSm0q7TwOiy4heND8zAPt1G9MKJHhQNLR9?=
 =?us-ascii?Q?WwwF+IRYD5fONKchePTSo7Kv/NDmUGhwNAGH8glQSqQWK8OGBGBw7zjfmluj?=
 =?us-ascii?Q?/U/EBFKRU4kaLY6PvW8iF1E/JTiiIvKRHhdC92ph7z0tcSSzK6Gpn8aLyPLS?=
 =?us-ascii?Q?T4oSAwXtJlJnEwA1Kd9TRo/CxX7HgaebRfuKfokGgr8EcQKZlCqvA/YTkwjW?=
 =?us-ascii?Q?Q0V/cCe3x/HMOm4nZYnp/CHttR+nE3SyPyRE6V7aNNPWsOsXeBddVSF18/h1?=
 =?us-ascii?Q?uN4/x5oBZ7ndsi5K8BDrEBA2N5vpl8/6GvKQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 10:05:09.0314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4117e5f-63db-49b1-5e63-08dde61a5ed2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4432

Even if Xen governor is not used in amd-cppc active mode, we could
somehow deduce which performance policy (CPUFREQ_POLICY_xxx) user wants to
apply through which governor they choose, such as:
If user chooses performance governor, they want maximum performance, then
the policy shall be CPUFREQ_POLICY_PERFORMANCE
If user chooses powersave governor, they want the least power consumption,
then the policy shall be CPUFREQ_POLICY_POWERSAVE
Function cpufreq_policy_from_governor() is responsible for above transition,
and it shall be also effective when users setting new governor through xenpm.

Userspace is a forbidden choice, and if users specify such option, we shall
not only give warning message to suggest using "xenpm set-cpufreq-cppc", but
also error out.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v4 -> v5:
- new commit
---
v5 -> v6:
- refactor warning message
---
v6 -> v7:
- move policy->policy set where it firstly gets introduced
- refactor commit message
---
v7 -> v8:
- policy transition is only limited in CPPC mode
---
 xen/drivers/acpi/pm-op.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 2f516e62b1..a7eaf29c31 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -207,6 +207,17 @@ static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
     if ( new_policy.governor == NULL )
         return -EINVAL;
 
+    if ( processor_pminfo[op->cpuid]->init & XEN_CPPC_INIT )
+    {
+        new_policy.policy = cpufreq_policy_from_governor(new_policy.governor);
+        if ( new_policy.policy == CPUFREQ_POLICY_UNKNOWN )
+        {
+            printk("Failed to get performance policy from %s, Try \"xenpm set-cpufreq-cppc\"\n",
+                   new_policy.governor->name);
+            return -EINVAL;
+        }
+    }
+
     return __cpufreq_set_policy(old_policy, &new_policy);
 }
 
-- 
2.34.1


