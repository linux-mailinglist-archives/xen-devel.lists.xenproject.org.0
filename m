Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA5FC9D323
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 23:20:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176400.1500895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQYix-0001Rs-Kk; Tue, 02 Dec 2025 22:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176400.1500895; Tue, 02 Dec 2025 22:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQYix-0001Pg-Hf; Tue, 02 Dec 2025 22:19:55 +0000
Received: by outflank-mailman (input) for mailman id 1176400;
 Tue, 02 Dec 2025 22:19:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O/vY=6I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vQYiv-0001Pa-B0
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 22:19:53 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01fe637f-cfcd-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 23:19:47 +0100 (CET)
Received: from PH7PR03CA0016.namprd03.prod.outlook.com (2603:10b6:510:339::13)
 by CH2PR12MB4133.namprd12.prod.outlook.com (2603:10b6:610:7a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 22:19:41 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:510:339:cafe::e6) by PH7PR03CA0016.outlook.office365.com
 (2603:10b6:510:339::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 2 Dec 2025 22:19:45 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 2 Dec 2025 22:19:40 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 2 Dec
 2025 16:19:39 -0600
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 2 Dec 2025 14:19:38 -0800
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
X-Inumbo-ID: 01fe637f-cfcd-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfonmEbpUFH0KB8lchwHJ3edJppfdTZvEk0vrTdowt+LPhB5w6xuvAtBuw4TGkrRZ9FLbnVoAKwwojNqC8K/sw2rfFgS1KQn4aFjs/v+Xi1StncD0xeq6yj92Q1+7WU9sMKuyBG1XsL61ZLYa/Q13WNAzYkxIzXfNkOmm0YhdtDxJjyS3L3AK3EZQasjTpoLPx08P/idGZhUDpQgYMWyitemeeIdzQhvLbzKkG7/yi6FAbJ3fcy61+duu3PTTIyoZkTd8wg3Li5Bzcw3RGAdD4b+2wSJ5GGKDRKRqBOczw4rr98r252LJOnIprAf8InOfoaqPNCPKyvWenphPGOeEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9fyRm/qkLAdJRd4Zac3oiSGIvPacBykJHufEhTl5FY=;
 b=TifzNIaegVMnjOhDFipU9EBJXCn1TLV2tOr62jJc3KnfS/FhAs84zjpqVMlnBD/myf1EAg7pQEGQZLApxU0ziQ7NwAdlSTWyYvKexMXPKX9kr2UORweifouZPBqTlgJmG9FcWbBMT++tkL85pe4dejW1yneX9ivFmiGD6X7Gd1PyO9stnfih2dWDnBjYYrZ8rp4IzoYLZdF9qvTJZ/y/t7LG7waevuRlV5WmNRY7sW9G4VW1L2sscndqdGlTqaFANDdqi0Ib9/DnaLfrzBViRh79xHY9etMqa2+KYOMD6ZojaNQ9YsA6CwtbHXXv4iz4sS2YwVxGPvChTiFEl6KbFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9fyRm/qkLAdJRd4Zac3oiSGIvPacBykJHufEhTl5FY=;
 b=gB15+TvHA7B0cR73xGp5j5kCIkDzzTY6Gv9DokooJs0JEbRL7/w5FBiaRrltx4hXMJ+U+00kO+0RwGTsU2BnlR089xtcZCbvrYT3z/kAOYU6r6ewIihIjLQ5yGVojSaFCmhlIw5EdhDqahCwzG3g8c6PnNq8mUOZ4/IgcXZg6LA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/gen_hypercall: Fix if indent
Date: Tue, 2 Dec 2025 17:19:29 -0500
Message-ID: <20251202221930.151264-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|CH2PR12MB4133:EE_
X-MS-Office365-Filtering-Correlation-Id: a459f76a-21de-4344-147f-08de31f0e2f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9P4H8JSWx3tOpei+5bsACP2gzAZLx/+R4ZB81gvsgb6U8zqZcFHNJoruvo2o?=
 =?us-ascii?Q?V+9XR3ufy2ifO35P5WDCd778KjZwEGzf38bTeLNnuwKpzTtk3SMUl+QCynxM?=
 =?us-ascii?Q?fKRq86QzYCUS6TwC+cJEIEWcK3lCX8BjDu6R8+t9M4w1SZY267K7+8rRkKfO?=
 =?us-ascii?Q?4c4wZN0ieuYbNL3WoAUNovAx1Hnls6u2IXxPYGRuIj7qPLWYQe6E6sofCKWA?=
 =?us-ascii?Q?00t9PJhzeR0yI850JzvseimnxMtGcPW6PSgvEm64pyE2D8s/gOsnJO17Yi+L?=
 =?us-ascii?Q?5uBmv+qhmDUFi+Uu8EXSAVBzbw3CtwRQcSGwwTWCIgqJMGwQjPlxkK2esu09?=
 =?us-ascii?Q?aNb3IQkl48XFepiJVCvwSeLA5OL+BxGEfy+ym5RTdKXClGXjCkxASSg1RdU9?=
 =?us-ascii?Q?EUHAJ+Z8aQOKA4ZT2Tuu/5LdJV/Oh+hAkdkVtu2eqVqVLud8tdQB2N4n4WVn?=
 =?us-ascii?Q?uuxIrV4JGdT/xae9Ubgt2Naf2xkY+8uX4G10f0rkOQbP/RaqBFJunGRqV3Zo?=
 =?us-ascii?Q?x9MyHpO1f0iEKPD6ZC5qm4/s5pXcILPpG4t/DICEjVfVKGjk/jq0JDgooH2b?=
 =?us-ascii?Q?HOtdP2bkDFNkmWAeMRyFYZx34/tgqR/lGWRkknvAPe/D5rXkQq/6dwFwuQHM?=
 =?us-ascii?Q?ey4u/CKI9KZo/KeebL8jbNT9o3PmnwDTpHXuiz31lMPaE0KyAvLNDfRZd0H5?=
 =?us-ascii?Q?+OPdr3z3yXvYbXciBpxDHdFUkIPCcbcdkt9OUplWBaZsCJqiWZ46v8rk/EhZ?=
 =?us-ascii?Q?j4Jm76Cl+w5965KmHAe6poSmPjITn0bj7ojYEinGR2mmtParfqX61P04FHHJ?=
 =?us-ascii?Q?zIyq+K7QsBW3KlFJ3Bprg8nTKhxAWraaWRw+kGafq8C+YlsoeOLIkBq+cEIj?=
 =?us-ascii?Q?m1vCu6cqTJgsi3xsEug9k7Wody9kbL6uRBNWMlUH0Ln2PvonGh/oc0kZuyiO?=
 =?us-ascii?Q?UK1Yq1Xe45bIwBnmLu9L2RzVxsDeta5K/s346GOBnBpjo8a3hbhVidW/GIYJ?=
 =?us-ascii?Q?zCV1OH09hSjcMKKnD1vkQbDkrQvkXNCi+MNSvRf1VnK1/jPtqLz1DCLFfkW6?=
 =?us-ascii?Q?cRkBEQZh42J+FIMDCXx5bqo53ZnlUrTKFHi9bbcO7zFB7gGBKSS0NSdESdYs?=
 =?us-ascii?Q?a2ot9SjAhxd32O4TjHCFdvbbjisoQ8lfdJsccsUzPbKIn4azb28jd2D0GWjf?=
 =?us-ascii?Q?QoN8Bn6wHs/WyAdYz6wgLRT6Z/yJob5zl9H1yCD2/rqJp9dFCpQlGjZwTfF3?=
 =?us-ascii?Q?hCkZ9b5ljkk+TTn5QjCfKtZPExEyhGlXLtPiybuznwgBIc/ao1R952Pyp7G3?=
 =?us-ascii?Q?cciFEa0w557FbOE9BEUxoiMUG6Tc39loNzirAsvuMpoWaPVrje9ff7rfSOQF?=
 =?us-ascii?Q?FPy5a5VKF2cewKQpNaD6bLlwHnLpUafwfnWNzT8t7t6zHrJ1EzmaL+ByD32g?=
 =?us-ascii?Q?C7vs5T8VlERowQneAJRoLHX6XISjfUyUCFnVbB2xv2JcXQl2iPqxVywn6RVh?=
 =?us-ascii?Q?zHd9iGoqGrEhTLFYyzvpGigF+35tglBqU8xZlFuoKNty/7N1dK8d3fK8STTs?=
 =?us-ascii?Q?O+Lp8QMZxYAq2HZh8wU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:19:40.1681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a459f76a-21de-4344-147f-08de31f0e2f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4133

On x86, the opening if of call_handlers_*() is indented 4 spaces which
breaks alignment.  The alignment is broken by printf("    "), but
that actually aligns ARM's opening "if ( likely() )".  Move the indent
to the if that needs it.

This results in x86 hypercall-defs.h changes like:

 #define call_handlers_hvm64(num, ret, a1, a2, a3, a4, a5) \
 ({ \
     uint64_t mask = (num) > 63 ? 0 : 1ULL << (num); \
-        if ( likely(mask & ((1ULL << __HYPERVISOR_vcpu_op) | (1ULL << __HYPERVISOR_event_channel_op))) ) \
+    if ( likely(mask & ((1ULL << __HYPERVISOR_vcpu_op) | (1ULL << __HYPERVISOR_event_channel_op))) ) \
     { \
         if ( (num) == __HYPERVISOR_vcpu_op ) \

ARM's hypercall-defs.h does not change.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/scripts/gen_hypercall.awk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/scripts/gen_hypercall.awk b/xen/scripts/gen_hypercall.awk
index 47a18cd75e..b544fe1c4d 100644
--- a/xen/scripts/gen_hypercall.awk
+++ b/xen/scripts/gen_hypercall.awk
@@ -266,7 +266,7 @@ END {
         printf("({ \\\n");
         if (need_mask)
             printf("    uint64_t mask = (num) > 63 ? 0 : 1ULL << (num); \\\n");
-        printf("    ");
+
         for (pl = 1; pl <= n_prios[ca]; pl++) {
             if (prios[ca, p_list[pl]] > 1) {
                 if (pl < n_prios[ca]) {
@@ -292,7 +292,7 @@ END {
             } else {
                 for (i = 1; i <= nc; i++)
                     if (call[i] == ca && call_prio[i] == p_list[pl]) {
-                        printf("if ( likely((num) == __HYPERVISOR_%s) ) \\\n", fn[call_fn[i]]);
+                        printf("    if ( likely((num) == __HYPERVISOR_%s) ) \\\n", fn[call_fn[i]]);
                         do_call(call_fn[i], call_p[i]);
                     }
             }
-- 
2.51.1


