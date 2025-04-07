Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83637A7ED9D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 21:41:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941047.1340627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sL6-0008JV-Hv; Mon, 07 Apr 2025 19:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941047.1340627; Mon, 07 Apr 2025 19:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sL6-0008HT-EO; Mon, 07 Apr 2025 19:41:00 +0000
Received: by outflank-mailman (input) for mailman id 941047;
 Mon, 07 Apr 2025 19:40:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1sL4-0008Ee-Sn
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 19:40:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2415::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3764ee1d-13e8-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 21:40:54 +0200 (CEST)
Received: from CH0PR04CA0067.namprd04.prod.outlook.com (2603:10b6:610:74::12)
 by CY5PR12MB6178.namprd12.prod.outlook.com (2603:10b6:930:25::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 19:40:51 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::4c) by CH0PR04CA0067.outlook.office365.com
 (2603:10b6:610:74::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 19:40:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 19:40:50 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:40:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:40:49 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 14:40:48 -0500
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
X-Inumbo-ID: 3764ee1d-13e8-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWjLm9Hji0hFWF2rs0NuuT9mF7MsSNVY0CIbajs695r91tQMc5LlcamWjB9gCOY+FKAX32J2PIxxqfiydYWaOzc251Ay3NeXH5K7WJ0C3AlMSakVWNIpb37N7aOpQpdpVGcCzQGjCqIecYqCzEIUXP0MeWJFAAvdzTeI6er3Dmu6MTyUcKNq+QbR5h9N3zNkbNzj1xlZxS7Z3fZk6BKUjNAA/5zazAagCSQOdq/uVZNhDeS1P5hkIFGtiZStTzUyQ24jaKzaljjnsRN9LBxtFgl8hJuouLkUOS0zvu+Q91VsGRuHfHcP4vcOIGEJ3cb49dP9+nQgqNuXY2OrxnMu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3p0FGui6Z5M9Ye7NZVim8VjmVP70aPbrgWc4AnqYQ4o=;
 b=LNhiVxYkQ8Wo9fC8BDPNqWGrRwE6qBP2U8E74hc9I16ctRyDdE92LjwNOdGzud+9MaI+cShZP9R8hK1BoyTJQO52oj5ouJom0YUknqJfVPfH/a0/x9y4vrnUwLE+CjDBV7N8yx05EiVrEXXtVUO3uSSxnEUezC+OJe8taC5L9MYz4smDyg3EkPoE66ZqhwqR2/YcQ345buZh5tMlZmPVxPHar40xpigDRWDoFhR74SSydVKMi7YG4qCH3dvk/IiFlCTcGXYASWxkgN1ZWqOAx3BfWR3pteRKYw3jtPfD/yZDpdNFP/r4YHVo+DcqcwWuIaaX6U1Sql/kB8GkHlf+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3p0FGui6Z5M9Ye7NZVim8VjmVP70aPbrgWc4AnqYQ4o=;
 b=tRGCJW1iUyBIgazKvdEwoA2mlDXxuNysE1pimItVEarbek/4pc5hSAlETQuhMgkTFSGn2bpMZi/fA/+SszqIof4m4YGY/KC/VeNBfVtQIsJW7AyCq4VPewv5OlMtVdSNHioQlrlcPHe4xyby9KSQ+b+82vmvXw7LBpeVP6qIfl4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v4 1/7] xen: introduce hardware domain create flag
Date: Mon, 7 Apr 2025 15:40:32 -0400
Message-ID: <20250407194038.83860-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407194038.83860-1-jason.andryuk@amd.com>
References: <20250407194038.83860-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|CY5PR12MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7664cb-c172-47d7-6fdc-08dd760c19e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d8Knl9EmaK7+G0KCMu483uELKYP/ZRCHcRvmUxn8LxYOJRsqPFwoREhKaN/x?=
 =?us-ascii?Q?L/js0Kz5CtOQ2fBWTXmn701mB/KofuXZCCLCyvRFOz/cp/+2AvyN18pEFfXi?=
 =?us-ascii?Q?z3O6KbWK4mXPaPhINOWZkpFRUJdWSngrQdpZDlmOHZGrKwtzsyyIEvKTxsJg?=
 =?us-ascii?Q?Hwd7IsooxVE6AT3E13vprK6qERU37kLAPrxU8ktn6cjchYP5OefvZro7RJ9J?=
 =?us-ascii?Q?QJHUddy2/7y2OD9PrPlLvPmNKOg8wWQP6cwNjYWKXDpmjIv6LgtJ4RVXSLuD?=
 =?us-ascii?Q?6prlqJmD7/j3otB1HOV64DLKI9J/244y2dGD/9+hS8i3vLkcECFYfgEXjrzA?=
 =?us-ascii?Q?sEOzibwQWCBoc3KWK+FDkWWwOQldyf05ONvPRX+Z3R5BMhpHrPcHV0czBxE/?=
 =?us-ascii?Q?Y7FU6wFvQ5/99bY4cxfX1hKZ/l3R0rNV/NUJM62hVUtD5OADqLmWuiRRwOJ+?=
 =?us-ascii?Q?WYEiPiIc9cVCHvsgdI2oOZo0E2HrDRRYqEyOz8E9q1UawOyE0chrdwth/7Yl?=
 =?us-ascii?Q?p1fTpF4zqoCFhmMhLO7md76B9PcHxgHV23jxE0xm7sQcNI32AvEAmxZYCPUe?=
 =?us-ascii?Q?+BHAimrbih4fXVuR0lD+tgjUI2ScA2dOfwO2fW/JwQLfMEvaJPOlCL/xnKcH?=
 =?us-ascii?Q?RMHkoSdnBrUOd0kYv2Y8ktDncR80aIaUMfu81fSJwWGC4+3BmHUqj36q2Y0z?=
 =?us-ascii?Q?HLsx9Gd7X+hAa+1zdWOpgAkmO6trPbv29lARyRmdr1jNNkiFSUqYAyOCywwP?=
 =?us-ascii?Q?lnUi+NVpcDmRWghqwbcgI0zyFl4gXXVveA3jKXuKqd4Y60omTcLCCNYDaIUO?=
 =?us-ascii?Q?KsRBDKIPMu5Sq/6g9vWGQwDy/j04n7FF5paBSs3CBltB+oi7SVEKjvbJkBpv?=
 =?us-ascii?Q?dsRw5ZHtqqBI1CO1VYWfQu2zwC01xFQydvTaWUxrMKvYmEHef17Xfr7SZpYL?=
 =?us-ascii?Q?ISuq5E2nWn0Oe7l3BxYLz9qMgdhLWfs35qvEI0c5ivkoFNthEWrSmSDJ/tzt?=
 =?us-ascii?Q?vbBntC9hzUg8qRs1lhgQi7JnmAcz/j7T7eHHolJM4gyoiA5jHf8mu0cR+koB?=
 =?us-ascii?Q?+IOSv6O/zYI7GCNf1gkjZK95q7pZzeexKr67Bo1uP3R3olGjTIqAnCWjP6EV?=
 =?us-ascii?Q?YGt8FhohoxLG3bqwrO1Z6xvNwZPZ9ndSU6JRwdslArzR62IKFFvBkdPBNKkR?=
 =?us-ascii?Q?eo647WtfG3fAGlouTFkMmGKlsNNKsmuxHN+pMxFR+KBzKHbdr39PHj37iCxU?=
 =?us-ascii?Q?kGsj123GvmCD/KLp/jOAaD5FeReIcfT8NdZZVwnvFrsHjHkBA4RxxBHsrOfM?=
 =?us-ascii?Q?S+WigcxbPajOnwkp+X/+Sx084atucXcCCfJVVWS29mjFWGyUsZYtkNSmBUQO?=
 =?us-ascii?Q?GbiAIrWq9f7+wjJ8DIp/yeNG0AMcPC2GSFfmFASZ8B5BMP3SOFw8/i1M5hP2?=
 =?us-ascii?Q?xonzBLy7pI5pM62YxkneSCciKIz0Zt8ecwrtM2iXqs5jUASWpxVg2w+UrfJP?=
 =?us-ascii?Q?zHiKzWZn9xX9XXhIeGUY4RVjCYxUpzZup6YP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:40:50.1627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7664cb-c172-47d7-6fdc-08dd760c19e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6178

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add and use a new internal create domain flag to specify the hardware
domain.  This removes the hardcoding of domid 0 as the hardware domain.

This allows more flexibility with domain creation.

The assignment of d->cdf is moved later so CDF_hardware is added for the
late_hwdom case.  Also old_hwdom has the flag removed to reflect the
change.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v4:
Move d->cdf assignment later
Remove Jan's R-b

v3:
Or-in CDF_hardware for late hwdom case
Add Jan's R-b

v2:
() around binary &
Only allow late_hwdom for dom0
---
 xen/arch/arm/domain_build.c |  2 +-
 xen/arch/x86/setup.c        |  3 ++-
 xen/common/domain.c         | 15 +++++++++++----
 xen/include/xen/domain.h    |  2 ++
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 634333cdde..b8f282ff10 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2369,7 +2369,7 @@ void __init create_dom0(void)
         .max_maptrack_frames = -1,
         .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
     };
-    unsigned int flags = CDF_privileged;
+    unsigned int flags = CDF_privileged | CDF_hardware;
     int rc;
 
     /* The vGIC for DOM0 is exactly emulating the hardware GIC */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index d70abb7e0c..67d399c469 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1018,7 +1018,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     /* Create initial domain.  Not d0 for pvshim. */
     domid = get_initial_domain_id();
-    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    d = domain_create(domid, &dom0_cfg,
+                      pv_shim ? 0 : CDF_privileged | CDF_hardware);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 585fd726a9..116ac183cd 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -804,9 +804,6 @@ struct domain *domain_create(domid_t domid,
     d->domain_id = domid;
     d->unique_id = get_unique_id();
 
-    /* Holding CDF_* internal flags. */
-    d->cdf = flags;
-
     /* Debug sanity. */
     ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
 
@@ -820,15 +817,25 @@ struct domain *domain_create(domid_t domid,
     d->is_privileged = flags & CDF_privileged;
 
     /* Sort out our idea of is_hardware_domain(). */
-    if ( domid == 0 || domid == hardware_domid )
+    if ( (flags & CDF_hardware) || domid == hardware_domid )
     {
         if ( hardware_domid < 0 || hardware_domid >= DOMID_FIRST_RESERVED )
             panic("The value of hardware_dom must be a valid domain ID\n");
 
+        /* late_hwdom is only allowed for dom0. */
+        if ( hardware_domain && hardware_domain->domain_id )
+            return ERR_PTR(-EINVAL);
+
         old_hwdom = hardware_domain;
         hardware_domain = d;
+        flags |= CDF_hardware;
+        if ( old_hwdom )
+            old_hwdom->cdf &= ~CDF_hardware;
     }
 
+    /* Holding CDF_* internal flags. */
+    d->cdf = flags;
+
     TRACE_TIME(TRC_DOM0_DOM_ADD, d->domain_id);
 
     lock_profile_register_struct(LOCKPROF_TYPE_PERDOM, d, domid);
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index a34daa7d10..e10baf2615 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -53,6 +53,8 @@ domid_t get_initial_domain_id(void);
 #else
 #define CDF_staticmem            0
 #endif
+/* This is the hardware domain.  Only 1 allowed. */
+#define CDF_hardware             (1U << 3)
 
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
-- 
2.49.0


