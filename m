Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E472A5451C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 09:40:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903102.1311027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mL-0002oc-MT; Thu, 06 Mar 2025 08:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903102.1311027; Thu, 06 Mar 2025 08:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq6mL-0002mk-Ji; Thu, 06 Mar 2025 08:40:29 +0000
Received: by outflank-mailman (input) for mailman id 903102;
 Thu, 06 Mar 2025 08:40:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWYO=VZ=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tq6mJ-0002me-DT
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 08:40:27 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2406::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5ec11fb-fa66-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 09:40:26 +0100 (CET)
Received: from CH5P220CA0016.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::22)
 by CH2PR12MB4070.namprd12.prod.outlook.com (2603:10b6:610:ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 08:40:20 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::2b) by CH5P220CA0016.outlook.office365.com
 (2603:10b6:610:1ef::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Thu,
 6 Mar 2025 08:40:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 08:40:19 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Mar 2025 02:40:16 -0600
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
X-Inumbo-ID: a5ec11fb-fa66-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNpQz/d406M00mg8rUPr41qO4A8wg9CTU8yGG1bLPeXvgtE5mLp1wFklt8XdhNOY4cMN9bqlgTGXtRZI0cPQvB/Q2YFH4V6ZkEOpbjHDaTu1CV7Xm97Js/mNQbtU4UB/ZTgVy0fs/uxdR16quyfl+yQ/4U9ONUmRy/XTbVyYYnZgu1/rSVo1RN/55W4ijRtNEQv/izfVpAvYVn6U9CkODY8eq6UsiEhcx4Wr4cSSasbrNfcYfpz2IFTsabY50gOD1ZtnVKeZvD8xJ+Fm6zBduvfgiAifZwF2LuvW2gHSGJjSHInMx1ii7LJluuQatQ9oiuEW/yxGpO+KzP7y/EiV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKOvWKKYyGeKig90v2DKrCqpQS+45XMDdJKriCQHITU=;
 b=SxrwUXxRm6mvkYqd1r8Y1DYKR0Msc3zQ5TUQS9LDSmVKp/2ddM4oeaN5Al0zBnr+PiwZNRAVrvvJauVarjQZcJEQcW6gSI/Yc0GWkdGHHH5R3/wZ7tQfL/TwupCiWdIdL2Kyj31oYm+WSz/WaG6KJKPHJedA8c1fMT46WIxOBDIJzyPu3xkiaFZxmnne4PwKpPd+JaRwFbKfUsdnHCtnFT8vdfnPYM9entR+gkrdNDdktx+YhfKOTwYS21FLnniC20rCy75brYc48R6vpvf/sjv73d1JSEwFT9M6jYBdORtCUX1625+R7uO3HAXe2j7ClL3fXQVjYfzfNxhMspey7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKOvWKKYyGeKig90v2DKrCqpQS+45XMDdJKriCQHITU=;
 b=HUJMr8J2csRS3piRwf49V0BeD0me1U2vnCsOmIOsrUFr2w/tzKbg/a94vGSYKdozPbrNOCVRhRqTwTAsVNdO0fubqBznbpQSZNVQOkZRkDQlSgO95/ntKP8vrPHgMRbDJl1z+7hSJIPtCeYl+7Zh5ROqGLjfM9AxeCk2Xps7lQ4=
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
Subject: [PATCH v3 01/15] xen/cpufreq: introduces XEN_PM_PSD for solely delivery of _PSD
Date: Thu, 6 Mar 2025 16:39:35 +0800
Message-ID: <20250306083949.1503385-2-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|CH2PR12MB4070:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8d66af-a130-4bc8-f280-08dd5c8a8711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MgzRqoPMrAmAtp6L4FFb589g3umjqBQcyMJ+RkcQAmE4ulu8PnnwqlRs8F+L?=
 =?us-ascii?Q?vYBh/ksrc6Z3iYyoz/1t2hm7P8nSugKHe1PD0i69AqEMuepJ6jcYnJm8amXq?=
 =?us-ascii?Q?nxs6YX+3Az5BlTYPqmV+rL5Ps2biKnu2AImGqjRhpnePgovFwfeIsj8RG8xL?=
 =?us-ascii?Q?LoYXs9+NmWf8dOF8PxQER+tdpNoGqJoqWptuFsM5PhJe/HMUAZiR3UGrIrse?=
 =?us-ascii?Q?1x/AZ9XWKoy780FN/pGR5rkxXv0L7pTWC6yYB3zSv9XgynIsU/4ckKkLIsgw?=
 =?us-ascii?Q?4nFarWSF0ewFN9pR47deTJha0/+9OVqfzq1HRSMXlYf6x2ruy8q+ge8ZXC2Q?=
 =?us-ascii?Q?Gmj/OvW8S8mif/1trPfwvR7/Bo7xNmuAdcis+YWGKY0GJS23FoTFUiwmFrcb?=
 =?us-ascii?Q?ZggQEkVLyt9CjBpa1S7uzmXpeRM4SK6I4e6l90LXSq3pKRhj6tuWqFA3+x2Q?=
 =?us-ascii?Q?EV8tyfJGeyM1dzMQ0Pt9jt0M5NUXGewaGWVm5ddSdo1t2labqQvTNu1dcJ3A?=
 =?us-ascii?Q?n4a5VNwa2mnMclA70AkO7i8jS2ihDWosbbTDoZmtD03CBwsnB8lKXYSzfwID?=
 =?us-ascii?Q?bhvjwzbOCl5caSPnUeDXeLhKngc3UVdOnb4SsGfXR4YdiyW3F692HjcwgPJ2?=
 =?us-ascii?Q?X/qb6zdlhWtaqihdnJBxMJ67olVP/mwFLm4q8gBvzaBRjc2+zX3UaoXFrhdn?=
 =?us-ascii?Q?zB3hz0jlWebNGkNZQSACLyvXjM1JPTXfnMQU5gi0+526hROMDG5eMfWxy7M1?=
 =?us-ascii?Q?8jM/uvjHKyEPFGM8Yyy3wGhl+VWxwynVev7pSsH/kVAIH1gNypzW+pTuP+bz?=
 =?us-ascii?Q?tbi8fLlb3Uc1zRJJbz2u+6F2x//HO2lr2sNHMsVZjF+w4wLw8YzCKVQ8Z8sb?=
 =?us-ascii?Q?lV9fGqWRi81zPyWzR0OGzLRNKd7FN7RvHHrF7W6dCQ6ZvTpDyEpwSauvRs84?=
 =?us-ascii?Q?65BoVYRgMzPzOYXKMFP4d1dknIueFDn8yGPqG6UoEHIcSSIQuZUBybUAF3DX?=
 =?us-ascii?Q?4Ml0Zv5tBJt9ifucENvD9zblgTjfE5MEj+03AVNjcVpkjTPWE6dZQnHp22D3?=
 =?us-ascii?Q?NaNI8QbWng/zdGYaIfqZ+RR5rtgkoWMXS9UE3k5F00bDzXB1JQ6CacpgWG7p?=
 =?us-ascii?Q?J9VrnGwJx5knSyTGJEB7DZGrKBgJ14DmvcYn7TtDNOM0ncdcdvxNZhcpJIHT?=
 =?us-ascii?Q?gePSFiprMQSGCAzd50xIwo4vgFfKOi2MFxsexOgriGRm+d+KFEHBivD0iG+j?=
 =?us-ascii?Q?cHsjqujcxfwAX0lexinbqW+4s8wU3I1elS2nyJKWIBbqMDK/+/orMAqF0U4G?=
 =?us-ascii?Q?xpyAkXcqSQoMDDMduPvyNvwSUApbxanE4PFMmiDvZXk+UA/ucBsAc3Yc43iC?=
 =?us-ascii?Q?naS6ExpUj7V6Afcs7zpzedw2i4nJR/BLnTBrUAPKgg18VZzgs7hyJkXUEbP8?=
 =?us-ascii?Q?YWBwYEVVzhuoSLR5ORY/VywwKdc11Mb/eoEOG6p1DF2AzJJSHahL4H5TDru0?=
 =?us-ascii?Q?1ZeugoXo2LsCIZ8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:40:19.6883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8d66af-a130-4bc8-f280-08dd5c8a8711
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4070

_PSD(P-State Dependency) provides performance control, no matter legacy
P-state or CPPC, logical processor dependency information to OSPM.

In order to re-use it for CPPC, this commit extracts the delivery of _PSD info
from set_px_pminfo() and wrap it with a new sub-hypercall XEN_PM_PSD.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v2 -> v3:
- new commit
---
 xen/arch/x86/acpi/cpufreq/acpi.c          |   2 +-
 xen/arch/x86/acpi/cpufreq/powernow.c      |   2 +-
 xen/arch/x86/platform_hypercall.c         |  11 ++
 xen/arch/x86/x86_64/cpufreq.c             |   2 +
 xen/drivers/cpufreq/cpufreq.c             | 122 +++++++++++++---------
 xen/drivers/cpufreq/cpufreq_ondemand.c    |   2 +-
 xen/include/acpi/cpufreq/processor_perf.h |   4 +-
 xen/include/public/platform.h             |  17 +--
 xen/include/xen/pmstat.h                  |   2 +
 xen/include/xlat.lst                      |   2 +-
 10 files changed, 103 insertions(+), 63 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/acpi.c b/xen/arch/x86/acpi/cpufreq/acpi.c
index 0c25376406..0cf94ab2d6 100644
--- a/xen/arch/x86/acpi/cpufreq/acpi.c
+++ b/xen/arch/x86/acpi/cpufreq/acpi.c
@@ -393,7 +393,7 @@ static int cf_check acpi_cpufreq_cpu_init(struct cpufreq_policy *policy)
     data->acpi_data = &processor_pminfo[cpu]->perf;
 
     perf = data->acpi_data;
-    policy->shared_type = perf->shared_type;
+    policy->shared_type = processor_pminfo[cpu]->shared_type;
 
     switch (perf->control_register.space_id) {
     case ACPI_ADR_SPACE_SYSTEM_IO:
diff --git a/xen/arch/x86/acpi/cpufreq/powernow.c b/xen/arch/x86/acpi/cpufreq/powernow.c
index 69364e1855..69ad403fc1 100644
--- a/xen/arch/x86/acpi/cpufreq/powernow.c
+++ b/xen/arch/x86/acpi/cpufreq/powernow.c
@@ -218,7 +218,7 @@ static int cf_check powernow_cpufreq_cpu_init(struct cpufreq_policy *policy)
     data->acpi_data = &processor_pminfo[cpu]->perf;
 
     info.perf = perf = data->acpi_data;
-    policy->shared_type = perf->shared_type;
+    policy->shared_type = processor_pminfo[cpu]->shared_type;
 
     if (policy->shared_type == CPUFREQ_SHARED_TYPE_ALL ||
         policy->shared_type == CPUFREQ_SHARED_TYPE_ANY) {
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 90abd3197f..b0d98b5840 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -571,6 +571,17 @@ ret_t do_platform_op(
             ret = acpi_set_pdc_bits(op->u.set_pminfo.id, pdc);
             break;
         }
+        case XEN_PM_PSD:
+            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_PX) )
+            {
+                ret = -EOPNOTSUPP;
+                break;
+            }
+
+            ret = set_psd_pminfo(op->u.set_pminfo.id,
+                                 op->u.set_pminfo.shared_type,
+                                 &op->u.set_pminfo.u.domain_info);
+            break;
 
         default:
             ret = -EINVAL;
diff --git a/xen/arch/x86/x86_64/cpufreq.c b/xen/arch/x86/x86_64/cpufreq.c
index e4f3d5b436..d1b93b8eef 100644
--- a/xen/arch/x86/x86_64/cpufreq.c
+++ b/xen/arch/x86/x86_64/cpufreq.c
@@ -28,6 +28,8 @@
 
 CHECK_processor_px;
 
+CHECK_psd_package;
+
 DEFINE_XEN_GUEST_HANDLE(compat_processor_px_t);
 
 int compat_set_px_pminfo(uint32_t acpi_id,
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index 4a103c6de9..638476ca15 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -36,6 +36,7 @@
 #include <xen/string.h>
 #include <xen/timer.h>
 #include <xen/xmalloc.h>
+#include <xen/xvmalloc.h>
 #include <xen/guest_access.h>
 #include <xen/domain.h>
 #include <xen/cpu.h>
@@ -201,15 +202,15 @@ int cpufreq_add_cpu(unsigned int cpu)
     struct cpufreq_dom *cpufreq_dom = NULL;
     struct cpufreq_policy new_policy;
     struct cpufreq_policy *policy;
-    struct processor_performance *perf;
+    struct processor_pminfo *pmpt;
 
     /* to protect the case when Px was not controlled by xen */
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    perf = &processor_pminfo[cpu]->perf;
+    pmpt = processor_pminfo[cpu];
 
-    if ( !(perf->init & XEN_PX_INIT) )
+    if ( !(pmpt->perf.init & XEN_PX_INIT) )
         return -EINVAL;
 
     if (!cpufreq_driver.init)
@@ -218,10 +219,10 @@ int cpufreq_add_cpu(unsigned int cpu)
     if (per_cpu(cpufreq_cpu_policy, cpu))
         return 0;
 
-    if (perf->shared_type == CPUFREQ_SHARED_TYPE_HW)
+    if (pmpt->shared_type == CPUFREQ_SHARED_TYPE_HW)
         hw_all = 1;
 
-    dom = perf->domain_info.domain;
+    dom = pmpt->domain_info.domain;
 
     list_for_each(pos, &cpufreq_dom_list_head) {
         cpufreq_dom = list_entry(pos, struct cpufreq_dom, node);
@@ -246,18 +247,18 @@ int cpufreq_add_cpu(unsigned int cpu)
     } else {
         /* domain sanity check under whatever coordination type */
         firstcpu = cpumask_first(cpufreq_dom->map);
-        if ((perf->domain_info.coord_type !=
-            processor_pminfo[firstcpu]->perf.domain_info.coord_type) ||
-            (perf->domain_info.num_processors !=
-            processor_pminfo[firstcpu]->perf.domain_info.num_processors)) {
+        if ((pmpt->domain_info.coord_type !=
+            processor_pminfo[firstcpu]->domain_info.coord_type) ||
+            (pmpt->domain_info.num_processors !=
+            processor_pminfo[firstcpu]->domain_info.num_processors)) {
 
             printk(KERN_WARNING "cpufreq fail to add CPU%d:"
                    "incorrect _PSD(%"PRIu64":%"PRIu64"), "
                    "expect(%"PRIu64"/%"PRIu64")\n",
-                   cpu, perf->domain_info.coord_type,
-                   perf->domain_info.num_processors,
-                   processor_pminfo[firstcpu]->perf.domain_info.coord_type,
-                   processor_pminfo[firstcpu]->perf.domain_info.num_processors
+                   cpu, pmpt->domain_info.coord_type,
+                   pmpt->domain_info.num_processors,
+                   processor_pminfo[firstcpu]->domain_info.coord_type,
+                   processor_pminfo[firstcpu]->domain_info.num_processors
                 );
             return -EINVAL;
         }
@@ -305,7 +306,7 @@ int cpufreq_add_cpu(unsigned int cpu)
         goto err1;
 
     if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
-                   perf->domain_info.num_processors)) {
+                   pmpt->domain_info.num_processors)) {
         memcpy(&new_policy, policy, sizeof(struct cpufreq_policy));
         policy->governor = NULL;
 
@@ -359,24 +360,24 @@ int cpufreq_del_cpu(unsigned int cpu)
     struct list_head *pos;
     struct cpufreq_dom *cpufreq_dom = NULL;
     struct cpufreq_policy *policy;
-    struct processor_performance *perf;
+    struct processor_pminfo *pmpt;
 
     /* to protect the case when Px was not controlled by xen */
     if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
-    perf = &processor_pminfo[cpu]->perf;
+    pmpt = processor_pminfo[cpu];
 
-    if ( !(perf->init & XEN_PX_INIT) )
+    if ( !(pmpt->perf.init & XEN_PX_INIT) )
         return -EINVAL;
 
     if (!per_cpu(cpufreq_cpu_policy, cpu))
         return 0;
 
-    if (perf->shared_type == CPUFREQ_SHARED_TYPE_HW)
+    if (pmpt->shared_type == CPUFREQ_SHARED_TYPE_HW)
         hw_all = 1;
 
-    dom = perf->domain_info.domain;
+    dom = pmpt->domain_info.domain;
     policy = per_cpu(cpufreq_cpu_policy, cpu);
 
     list_for_each(pos, &cpufreq_dom_list_head) {
@@ -393,7 +394,7 @@ int cpufreq_del_cpu(unsigned int cpu)
     /* for HW_ALL, stop gov for each core of the _PSD domain */
     /* for SW_ALL & SW_ANY, stop gov for the 1st core of the _PSD domain */
     if (hw_all || (cpumask_weight(cpufreq_dom->map) ==
-                   perf->domain_info.num_processors))
+                   pmpt->domain_info.num_processors))
         __cpufreq_governor(policy, CPUFREQ_GOV_STOP);
 
     cpufreq_statistic_exit(cpu);
@@ -475,19 +476,13 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
                acpi_id, cpu);
 
     pmpt = processor_pminfo[cpu];
+    /* Must already allocated in set_psd_pminfo */
     if ( !pmpt )
     {
-        pmpt = xzalloc(struct processor_pminfo);
-        if ( !pmpt )
-        {
-            ret = -ENOMEM;
-            goto out;
-        }
-        processor_pminfo[cpu] = pmpt;
+        ret = -EINVAL;
+        goto out;
     }
     pxpt = &pmpt->perf;
-    pmpt->acpi_id = acpi_id;
-    pmpt->id = cpu;
 
     if ( perf->flags & XEN_PX_PCT )
     {
@@ -537,25 +532,6 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
             print_PSS(pxpt->states,pxpt->state_count);
     }
 
-    if ( perf->flags & XEN_PX_PSD )
-    {
-        /* check domain coordination */
-        if ( perf->shared_type != CPUFREQ_SHARED_TYPE_ALL &&
-             perf->shared_type != CPUFREQ_SHARED_TYPE_ANY &&
-             perf->shared_type != CPUFREQ_SHARED_TYPE_HW )
-        {
-            ret = -EINVAL;
-            goto out;
-        }
-
-        pxpt->shared_type = perf->shared_type;
-        memcpy(&pxpt->domain_info, &perf->domain_info,
-               sizeof(struct xen_psd_package));
-
-        if ( cpufreq_verbose )
-            print_PSD(&pxpt->domain_info);
-    }
-
     if ( perf->flags & XEN_PX_PPC )
     {
         pxpt->platform_limit = perf->platform_limit;
@@ -570,7 +546,7 @@ int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf)
         }
     }
 
-    if ( perf->flags == ( XEN_PX_PCT | XEN_PX_PSS | XEN_PX_PSD | XEN_PX_PPC ) )
+    if ( perf->flags == ( XEN_PX_PCT | XEN_PX_PSS | XEN_PX_PPC ) )
     {
         pxpt->init = XEN_PX_INIT;
 
@@ -582,6 +558,54 @@ out:
     return ret;
 }
 
+int set_psd_pminfo(uint32_t acpi_id, uint32_t shared_type,
+                   const struct xen_psd_package *psd_data)
+{
+    int ret = 0, cpuid;
+    struct processor_pminfo *pm_info;
+
+    cpuid = get_cpu_id(acpi_id);
+    if ( cpuid < 0 || !psd_data )
+    {
+        ret = -EINVAL;
+        goto out;
+    }
+
+    /* check domain coordination */
+    if ( shared_type != CPUFREQ_SHARED_TYPE_ALL &&
+         shared_type != CPUFREQ_SHARED_TYPE_ANY &&
+         shared_type != CPUFREQ_SHARED_TYPE_HW )
+    {
+        ret = -EINVAL;
+        goto out;
+    }
+    if ( cpufreq_verbose )
+        printk("Set CPU acpi_id(%d) cpuid(%d) _PSD State info:\n",
+               acpi_id, cpuid);
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
+    pm_info->shared_type = shared_type;
+    pm_info->domain_info = *psd_data;
+
+    if ( cpufreq_verbose )
+        print_PSD(&pm_info->domain_info);
+
+ out:
+    return ret;
+}
+
 static void cpufreq_cmdline_common_para(struct cpufreq_policy *new_policy)
 {
     if (usr_max_freq)
diff --git a/xen/drivers/cpufreq/cpufreq_ondemand.c b/xen/drivers/cpufreq/cpufreq_ondemand.c
index 06cfc88d30..5b23daaac1 100644
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -194,7 +194,7 @@ static void dbs_timer_init(struct cpu_dbs_info_s *dbs_info)
 
     set_timer(&per_cpu(dbs_timer, dbs_info->cpu), NOW()+dbs_tuners_ins.sampling_rate);
 
-    if ( processor_pminfo[dbs_info->cpu]->perf.shared_type
+    if ( processor_pminfo[dbs_info->cpu]->shared_type
             == CPUFREQ_SHARED_TYPE_HW )
     {
         dbs_info->stoppable = 1;
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 301104e16f..19f5de6b08 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -27,8 +27,6 @@ struct processor_performance {
     struct xen_pct_register status_register;
     uint32_t state_count;
     struct xen_processor_px *states;
-    struct xen_psd_package domain_info;
-    uint32_t shared_type;
 
     uint32_t init;
 };
@@ -36,6 +34,8 @@ struct processor_performance {
 struct processor_pminfo {
     uint32_t acpi_id;
     uint32_t id;
+    struct xen_psd_package domain_info;
+    uint32_t shared_type;
     struct processor_performance    perf;
 };
 
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 2725b8d104..f5c50380cb 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -363,12 +363,12 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
 #define XEN_PM_PX   1
 #define XEN_PM_TX   2
 #define XEN_PM_PDC  3
+#define XEN_PM_PSD  4
 
 /* Px sub info type */
 #define XEN_PX_PCT   1
 #define XEN_PX_PSS   2
 #define XEN_PX_PPC   4
-#define XEN_PX_PSD   8
 
 struct xen_power_register {
     uint32_t     space_id;
@@ -439,6 +439,7 @@ struct xen_psd_package {
     uint64_t coord_type;
     uint64_t num_processors;
 };
+typedef struct xen_psd_package xen_psd_package_t;
 
 struct xen_processor_performance {
     uint32_t flags;     /* flag for Px sub info type */
@@ -447,12 +448,6 @@ struct xen_processor_performance {
     struct xen_pct_register status_register;
     uint32_t state_count;     /* total available performance states */
     XEN_GUEST_HANDLE(xen_processor_px_t) states;
-    struct xen_psd_package domain_info;
-    /* Coordination type of this processor */
-#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
-#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
-#define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */
-    uint32_t shared_type;
 };
 typedef struct xen_processor_performance xen_processor_performance_t;
 DEFINE_XEN_GUEST_HANDLE(xen_processor_performance_t);
@@ -463,9 +458,15 @@ struct xenpf_set_processor_pminfo {
     uint32_t type;  /* {XEN_PM_CX, XEN_PM_PX} */
     union {
         struct xen_processor_power          power;/* Cx: _CST/_CSD */
-        struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/_PSD */
+        xen_psd_package_t                   domain_info; /* _PSD */
+        struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/ */
         XEN_GUEST_HANDLE(uint32)            pdc;  /* _PDC */
     } u;
+    /* Coordination type of this processor */
+#define XEN_CPUPERF_SHARED_TYPE_HW   1 /* HW does needed coordination */
+#define XEN_CPUPERF_SHARED_TYPE_ALL  2 /* All dependent CPUs should set freq */
+#define XEN_CPUPERF_SHARED_TYPE_ANY  3 /* Freq can be set from any dependent CPU */
+    uint32_t shared_type;
 };
 typedef struct xenpf_set_processor_pminfo xenpf_set_processor_pminfo_t;
 DEFINE_XEN_GUEST_HANDLE(xenpf_set_processor_pminfo_t);
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 8350403e95..fd02316ce9 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -5,6 +5,8 @@
 #include <public/platform.h> /* for struct xen_processor_power */
 #include <public/sysctl.h>   /* for struct pm_cx_stat */
 
+int set_psd_pminfo(uint32_t acpi_id, uint32_t shared_type,
+                   const struct xen_psd_package *psd_data);
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
 long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
 
diff --git a/xen/include/xlat.lst b/xen/include/xlat.lst
index 3c7b6c6830..0d964fe0ce 100644
--- a/xen/include/xlat.lst
+++ b/xen/include/xlat.lst
@@ -168,7 +168,7 @@
 !	processor_performance		platform.h
 !	processor_power			platform.h
 ?	processor_px			platform.h
-!	psd_package			platform.h
+?	psd_package			platform.h
 ?	xenpf_enter_acpi_sleep		platform.h
 ?	xenpf_pcpu_version		platform.h
 ?	xenpf_pcpuinfo			platform.h
-- 
2.34.1


