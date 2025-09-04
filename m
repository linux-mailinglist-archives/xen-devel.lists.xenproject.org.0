Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7189FB4327F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 08:36:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109501.1459081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3Zf-0003Xc-4s; Thu, 04 Sep 2025 06:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109501.1459081; Thu, 04 Sep 2025 06:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3Zf-0003UF-0q; Thu, 04 Sep 2025 06:35:59 +0000
Received: by outflank-mailman (input) for mailman id 1109501;
 Thu, 04 Sep 2025 06:35:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UG7t=3P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uu3Zd-0002id-5B
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 06:35:57 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2416::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68bb4358-8959-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 08:35:55 +0200 (CEST)
Received: from BN0PR07CA0004.namprd07.prod.outlook.com (2603:10b6:408:141::22)
 by SJ2PR12MB8717.namprd12.prod.outlook.com (2603:10b6:a03:53d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 06:35:49 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:141:cafe::2b) by BN0PR07CA0004.outlook.office365.com
 (2603:10b6:408:141::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 06:35:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.0 via Frontend Transport; Thu, 4 Sep 2025 06:35:49 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 01:35:49 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Wed, 3 Sep 2025 23:35:47 -0700
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
X-Inumbo-ID: 68bb4358-8959-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FAzzTj/5Kc7saUwPSVjXmsIonZwDGS0ZGbtFCpzGVi06grq3D0JHXvSsTon72k3ughDRnEMjri4qcd8V+fwAZ8c7bAT/QRnovfgbmMBqgD8SP4WlU8NH72gMTjXSXu/RnGJxUm+ZduFWHt9HQc5SHjirIU7okey/v/DkD6wIUaxFB4FncFTR4ObApN/eZhkI2SceZveaLWIY7NvM2jPfrP2Svejy/0OYvHyuibVfh/kBEsJk1LAVzjnCiApCqAXrK6ucVpE0v5vw0qB1mCUBcI6+72/IECKnkS+xEOSMc4DbFLAAHSU5+2cqK10LoeLmNKp/iP47YKH/+Iv2Q17TZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwwi0tW4Ht3ef4KEnk99tP23MKB3LmcikYL/tmBwt+Y=;
 b=ClN4CMBSsQSWJDnWlIINnRJaAJet8wqbnkuaf+R92j3sZPgZePTCd+pDIYnMMlZjySsSjnynLLre03iiiHJZGD8QY7KJt6LdGDp0hushKmgR39OzG4ByQiqMuK0q6I0fRayzeaU4uQQjHVByNEc7kCYmxLN+0YsmqlnnxAp3RRg+1uvFI/PKW4ikF9F71BCOZ3hxIxp5fKBkX0+7486njzKS4/b+3p0OotmzsTST98aBf0DkW6+i1p+rA2Qgr5r1+IptXlL7jnHAHkjud5gqilIOyJV6oUAn3a4OjEVPNf/Oye9ofyVK0AyExqiAF8rzrzzDn+vT60qIzBqTICPpzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwwi0tW4Ht3ef4KEnk99tP23MKB3LmcikYL/tmBwt+Y=;
 b=aVk9wFHFswzkz44mbuH5m27I/azqOqqvVGSzEgGeBxmGyrgDC8O5ySVqNIVQV6F+IOgJS0N2aYkZqW0Aei8xeO9MAvZ3HORiuRz1DwCGmnF/gLFSHcQgX52ILdxXxyTkXM8kQ6i1qRtqYikwZLOPfNL8dxiNrW2SK920fVJxpvk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v9 4/8] xen/cpufreq: get performance policy from governor set via xenpm
Date: Thu, 4 Sep 2025 14:35:14 +0800
Message-ID: <20250904063518.2097629-5-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|SJ2PR12MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 0314d65e-5834-498c-5d89-08ddeb7d49b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u+Mi3DimZ+UyW6CYKdnemqhM8xCOq/S0jChMsdtX+rZFENYSZPtG4TgbCut1?=
 =?us-ascii?Q?4rEyzyW0nUYKtJq7kTVsCjAy2fubbMiYM90HACIn+sa3VIOTyZIVlJhsALfv?=
 =?us-ascii?Q?TR/JNQXZZ6A10gjOsswCB22gT6Y5ybXz+3DMmeIeTTYZuOZQOygoIZz//TbV?=
 =?us-ascii?Q?9GQV5M0B79Nu8pTLwTt9zZbGqk+pI2+5KwnP7FvPEBPdIN3VUTEK3+THGSX+?=
 =?us-ascii?Q?dA6j9Oyf5pzDXl4YZey1fivfwJYCtvkgUlBR52MiMzFbfRZEZRLtk/DcIMdK?=
 =?us-ascii?Q?JrJNgYRDfgNr4LsS7z/eOev+VUyuiMKZw7xGwR7B1VefWDc/vzB1ZCsS+Mid?=
 =?us-ascii?Q?tdvugmuJDemu6u+KvOKbNlHi3VRsPWsrXqEtshu05Ps3ZJEza4Vp7rPJVIJU?=
 =?us-ascii?Q?QQWTXLK2jQT5NPHkUJCtmrcvk4BErAsuwWKKuyFLqhiSAnQcXngnsuFuMBDX?=
 =?us-ascii?Q?mTG9zUj2C1pcYZopBL1xIf3HqCR3dDpBB5y12cc0K2IsN/IzgvkoD3p3ppIa?=
 =?us-ascii?Q?mKDlSoIWZpYZfHa9fiXWduwaxfcd8tRY05iAOYl6LLQt1kuXbYM5FeQavqG/?=
 =?us-ascii?Q?Mb/Y+Rk9aV5QUDs5LFofSkeCA+ea+hQ3Ow7VaFPf+p6py8CIvPGPxhrwOiGE?=
 =?us-ascii?Q?5vzqZESx1CRJZl/mLM8wnZZr725ReR2Tr8RpSGADkOCx+95t0k0jwZwISZgC?=
 =?us-ascii?Q?dRItpl7QFrXfmZO1ohcwtIl1n2WVYUS/W93wEY8/zoLjDvvdG24x1fRTCpcp?=
 =?us-ascii?Q?ei+bZBDjkTEml5mrrzLbIN3qsJF/amdkyi12XpP86dR1B7qSvgO2nll2H4f2?=
 =?us-ascii?Q?Kat+pK3XxpxqxE0IBoRO80EAxfONyMuoK5L9aEEhR3z2wi4pwcUSoHrhlo6y?=
 =?us-ascii?Q?r0QhKaYsncTbXBES9GZeBlb9TGbkAftieC8thj/SPqIPUcDvgsXM6RZnelqB?=
 =?us-ascii?Q?6mwUoHtGUnDurdvYQo5dfIi6iutXQDLc4KfKg/zi9zL+zQHPDVSfV1iArNqs?=
 =?us-ascii?Q?GxUu9kam87xw++Yw/tFQzm2gVxvNXWeyxLYow2oI6p7XFPciZnWZGXY1WwYI?=
 =?us-ascii?Q?KGN8mJCad9RS9opUn7mhEMqDE/4uP3Hu7CK+Qd4g1PEAIMKZpyKYxEte9Wq0?=
 =?us-ascii?Q?bEHKxncW+1ho1h0E9m+GImf052xvOTEz0NM0IO+C4IPeu5suu4JknOTozJHv?=
 =?us-ascii?Q?97SpnnFjqVCs0LKPOaLgv2dIt7kcEY1SSBwLQHzdA05enGQqKrjO06bOL/P8?=
 =?us-ascii?Q?Rb+lO/GMnfrB8PaJ3zbRTX1/DzhawIfneqeoiTUw6Q8GT/FNaxuFSYK3jiJL?=
 =?us-ascii?Q?zxqTGOTCtKY6qtRrhZvXOQwMsbYQaoCK7+GRSORIbCWOjIORP9sTjZcV7ns2?=
 =?us-ascii?Q?tJ0LanZH0bTEhtrpap0pXgmgyCBxXD6PL+xGtSq9prttvG7srIAnXCsfmseQ?=
 =?us-ascii?Q?J5VX/OSB7drIgwl3OA5NP/dWSyM99w/9m4rQIpk5asrlQuWGmOcvO5HqyL0g?=
 =?us-ascii?Q?UK2Yjogg9JK37TOZOkrZlMpakDnxyIYVwiiE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 06:35:49.5834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0314d65e-5834-498c-5d89-08ddeb7d49b1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8717

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
Acked-by: Jan Beulich <jbeulich@suse.com>
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


