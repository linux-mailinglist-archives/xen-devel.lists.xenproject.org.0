Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06FDA90DD1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 23:30:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956557.1349933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AJz-0001xF-Vu; Wed, 16 Apr 2025 21:29:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956557.1349933; Wed, 16 Apr 2025 21:29:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AJz-0001vl-T9; Wed, 16 Apr 2025 21:29:27 +0000
Received: by outflank-mailman (input) for mailman id 956557;
 Wed, 16 Apr 2025 21:29:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5uj=XC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5AJy-0001ht-B2
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 21:29:26 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2414::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd74abfa-1b09-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 23:29:24 +0200 (CEST)
Received: from DM6PR07CA0132.namprd07.prod.outlook.com (2603:10b6:5:330::25)
 by MW4PR12MB6974.namprd12.prod.outlook.com (2603:10b6:303:207::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.24; Wed, 16 Apr
 2025 21:29:17 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:330:cafe::d1) by DM6PR07CA0132.outlook.office365.com
 (2603:10b6:5:330::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Wed,
 16 Apr 2025 21:29:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 21:29:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 16:29:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 16:29:15 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Apr 2025 16:29:14 -0500
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
X-Inumbo-ID: dd74abfa-1b09-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkcoCJ4UwGEbi1KBUd40fRmlEgt3f0L6AlHQm9j7Hip/anLkmCOEmMA1V41H/PeGqVPrdl+pGbewXz77US1JmwAOvICRFlVizM1C29Po8QpU3qAp4S69eaa4oZX6bp5l56UQDVzQfoKqDc6txYDE27mkL5xh8BMcHlh99q8NE3++hzGu4viX0jiVX8cSecJfBJetioYF0FsPX5PbuRjOs+3aq+HUejqxemnL5e6GXLKAxMmkQcktX33+/T2J9Gvuy8B1pkvPjZtEeTTEBwSbtZINl6+5ACCNTKJblM9duphMCKSqiSN8Eup5w21hziw+4zicjbyKMcTRUzFwdt1jNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIRm+gVOiD/R0teBKb+/Yy7EcO5lotdHtN+tWKBu7mk=;
 b=Loegm3rnxnr0FkAb+MFJxPn2QOXKCsqBrO1yz2lAqsdi2rJLGVkicBFDadgBB50rzjxoYX1dTJaEuxBktXhRVbk4uPAjkW46qXJb+TK+rN6XOirRobujj2GdpFSTCDnNBLKTmBC6kIIJROltt2ZLEaThjcQPxR4FyWVR7r8X/z0U7WHHWhCwxTNLgTIDVHZqWUlLDAtufH+nBHR5KTYh3dTEPOR4NiIL3Rrcn5/AWgVLpn7yRjnlWk0Scahy5OP4Uurje6pvEA68SRDmxRweUPXiWZdpZBvO6J/fXmtQzqEIcoUA0rZM8Nh5pJj6mY4L7fePLwIbdQeFCv2JcRhQ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIRm+gVOiD/R0teBKb+/Yy7EcO5lotdHtN+tWKBu7mk=;
 b=zeQ1xvnmwwcwyx7baPE76RCnKEbuBm/+CI9u9tLTWb2io8sS0OsdpkyDdJrs568Arpy/mdz2U2SuSM0zd147bDNzMtxTl+kd+sPcw4pCFqri3IkdQz1ilP3UryZFZ/yROCy+fBujkg3wT6IIOJzpc5hrNjnq0V/ZO0EbFKor7ms=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v5 1/7] xen: introduce hardware domain create flag
Date: Wed, 16 Apr 2025 17:29:05 -0400
Message-ID: <20250416212911.410946-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416212911.410946-1-jason.andryuk@amd.com>
References: <20250416212911.410946-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|MW4PR12MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b9b35f4-153e-428f-7796-08dd7d2dbdbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oTkWj5b2n4p2k2FRYSg8kfLH4AJVDGhzasTTOBWY6RW5/XeUbA4/XJy0/vGG?=
 =?us-ascii?Q?mwxpDzqnjviBm+S4Od/RINCB/IchlmtwoBQfxYzehyVD/5InlUVgJur3mgSj?=
 =?us-ascii?Q?Vdl0bWQj722Tf3dgGlpP11JfXM8id0gviQyCZUrakQvnNXd4PKLPdGl0RZjI?=
 =?us-ascii?Q?6uE52xiZIqpkG2ZJqAJEPJEkYJ5BSJBgl/1dMuK9f+Y5MmnhaorUzzlQ4zOU?=
 =?us-ascii?Q?27cRrsbG4WjAzTzSWqy1ZQxw9+vv53rAS0u4zLliQoElKGwySUoCz3tm/IhK?=
 =?us-ascii?Q?0FDRzPhnvdueA9v0sZWdDEpGMxajcq8tGWx83avYdt7YcD5ly6XOuTQVK7uk?=
 =?us-ascii?Q?C9ATIjIdCEkR4VaACTA+tH1Ko/pTGpwnT4IcGSOS5kyIQPdbz0oVUWhE8dvH?=
 =?us-ascii?Q?NqrUo9b3P6oDMLeEtJTDa37R17lANjl5sTPvElOvSEBCAgtsUZgtZqnyyVGL?=
 =?us-ascii?Q?QhF2775cjlXIWMOntpHz6wEipEVyodSoV2M4GfruMCSJOM/j4PAk20SjRuyr?=
 =?us-ascii?Q?/1hCB/xMbhQB1JBESfWLgZ1Q2FC6XpAJF6c5Vov6HhEP0mE/PyF/axCiENRT?=
 =?us-ascii?Q?mkuwgU/poPfvBN9ReBF+qnloed9vcn3WaWBwGAqvMvdoa+yozFTAfdfZPStO?=
 =?us-ascii?Q?iwRX4TxUPYsADAaaRiDF9RC5zGPITMYY1iBy9y6rHJlLq35FzrDnSRDzp+JZ?=
 =?us-ascii?Q?dosFrvjFJ9+zDeDKliNSheXCOHO1N27mLeP+GaRf3R0TcT5Wlk89W+y2LMXg?=
 =?us-ascii?Q?5/K9D1iv9Fzcs0pQ5rH2YsXrTQr0aoxMAqAOvVUsVBJvhys4i6mU7ckYPt+F?=
 =?us-ascii?Q?FyZApLu2nEOEhkY/mS9t/28m5pHf0JveVgj28K+0TQWJGxYdq9Qbauqxq5tY?=
 =?us-ascii?Q?qaLKPJzfompd+KeeOdZCNR71eA92Ncv4p4tWbX/Rz5qisuJhMp47HUr2w+bp?=
 =?us-ascii?Q?GiMj/Ym39IN+Ptalkp1MXf/f8KI6e0YPeWQWFZSZOfo9o+ceKrHt2XdwoZob?=
 =?us-ascii?Q?zOUCOFV9z0dOgOfwqCO4TtWUY78OwKxdKxeocYY8Zs5X2ryw/h4wdN1xGG/n?=
 =?us-ascii?Q?/qREid5A93WPaSZypZKDnOy6p0f4mjS1kMwIeZXcFaQFSCrwywTEDEYrFcjV?=
 =?us-ascii?Q?wrZHSD4wuJL6QUlkPjh5ce9grELhURyFRL9/nkeu1HygVhFJozHwjddps9Xs?=
 =?us-ascii?Q?v5ITiH8tWF4C6NA3ru8DwBaINFcJ5vGIO4lbBhcr8h6nU5Orw6PLaCwGuUML?=
 =?us-ascii?Q?3SlM/Til5whZF2BRLhNDQRmsRO8rWNo6xEWmRTcTWPisx7Ri6bWGyBK+JIF5?=
 =?us-ascii?Q?GlcJMOhlHjM6vCOqJ50Qj/LuouFwZCHBR0HxvWMxH7JNHfEJtTBhHDy5/9mS?=
 =?us-ascii?Q?1SdUyQQSw4uPha/d9Tcl8TynnjD7EtjJsvB6HhXoROIBbR7j4cnyjRx4x7ay?=
 =?us-ascii?Q?/MiJLYQaMM4cKMeB+2cOsFRAsGrzn8ICT6yw22wiV5QgOma9RA2OBHinSRlt?=
 =?us-ascii?Q?7XtYZtYiCwX5vvQ98embEZMHRaRbsZpuJveI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 21:29:16.6073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9b35f4-153e-428f-7796-08dd7d2dbdbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6974

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add and use a new internal create domain flag to specify the hardware
domain.  This removes the hardcoding of domid 0 as the hardware domain.

This allows more flexibility with domain creation.

The assignment of d->cdf is moved later so CDF_hardware is added for the
late_hwdom case.  Also old_hwdom has the flag removed to reflect the
change.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v5:
Restore CDF_hardware to old_hwdom on error
Add Jan's R-b
Rebase bd->domid addition

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
 xen/common/domain.c         | 19 +++++++++++++++----
 xen/include/xen/domain.h    |  2 ++
 4 files changed, 20 insertions(+), 6 deletions(-)

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
index 3c257f0bad..24b36c1a59 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1011,7 +1011,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 
     /* Create initial domain.  Not d0 for pvshim. */
     bd->domid = get_initial_domain_id();
-    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    d = domain_create(bd->domid, &dom0_cfg,
+                      pv_shim ? 0 : CDF_privileged | CDF_hardware);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 585fd726a9..abf1969e60 100644
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
@@ -973,7 +980,11 @@ struct domain *domain_create(domid_t domid,
 
     d->is_dying = DOMDYING_dead;
     if ( hardware_domain == d )
+    {
+        if ( old_hwdom )
+            old_hwdom->cdf |= CDF_hardware;
         hardware_domain = old_hwdom;
+    }
     atomic_set(&d->refcnt, DOMAIN_DESTROYED);
 
     sched_destroy_domain(d);
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


