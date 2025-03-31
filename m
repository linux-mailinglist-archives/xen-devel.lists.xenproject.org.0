Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C53CA7703C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 23:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932996.1335048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMuv-0004le-Kn; Mon, 31 Mar 2025 21:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932996.1335048; Mon, 31 Mar 2025 21:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzMuv-0004js-HD; Mon, 31 Mar 2025 21:43:37 +0000
Received: by outflank-mailman (input) for mailman id 932996;
 Mon, 31 Mar 2025 21:43:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vLSd=WS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzMuu-0004aC-PV
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 21:43:36 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2009::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31c8e539-0e79-11f0-9ea7-5ba50f476ded;
 Mon, 31 Mar 2025 23:43:34 +0200 (CEST)
Received: from SJ0PR13CA0043.namprd13.prod.outlook.com (2603:10b6:a03:2c2::18)
 by DS0PR12MB6608.namprd12.prod.outlook.com (2603:10b6:8:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 21:43:29 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::a7) by SJ0PR13CA0043.outlook.office365.com
 (2603:10b6:a03:2c2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.20 via Frontend Transport; Mon,
 31 Mar 2025 21:43:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 31 Mar 2025 21:43:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 16:43:27 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 31 Mar 2025 16:43:26 -0500
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
X-Inumbo-ID: 31c8e539-0e79-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqq1WQU3eeueK8dcfyvh31KoJB/KwqrRA8bNDZJDYGnbFS0+cOsS6qm4eZUqJpXyIOtLu++HNeX3fG7+bXIEky7ITBs0mM+MsC2TQlQD9teI47AtxZ0QRqsAOJRBrO/jLLUIdYePTBK4mS4IOMB6kxqp8iFh+HhzeCp+lMoZ6qkm+3KjKnh/ybdaqWMZS1/8+UwSo7uSkDn9A81YmRCsuJ8GznL3BFasZgE16YE/vr4P9BZcTnqnJ4yd2CfK05/Luwpd70h4H4SXT5MDKwOMkqhhj4066kFEwdmrGTqzRXUUhKq0eLd5Wzz5+qLHNiT/mYdH6rGaUUGdQw1gNT27Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q0hX3MCb+pXj1x8o06lhrPKBbpxKlpmGAl267NUETHw=;
 b=QZkLbHDZroI64xHcr+LEXSCGUeM0zv5FmQRu/31riRTi/HJMA0Rh9N/jbSQ3W9sIDHKmKUHZzKq8gBnmzLyCU/O7YmeaspMz7x4Ba+zQX8Wywl+4p/9L5Hq7e1sBegCFk+CAWOLQsaDgPWaUAmMTKTtZYT6lQXKgpVaTECDkVqRVUazw29IxTSrI3DPSgAa2DMwOpocmiXqoYcfPxGl+Dzi6BdbVr7+2o3FMqo3OtUv51NWIlSasNOmd+8u4qumsVvhsnc7jt3d/kBENlK7PfJbn+eEH0DsV5AvOYZFatdGo2DiUR+IpqkRssnUaEWkjzDnNU50XnnJCIlLBLoReKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q0hX3MCb+pXj1x8o06lhrPKBbpxKlpmGAl267NUETHw=;
 b=sxyzwyrZfoh03drI/ibdRS5Ozpb6mw0w+FA8TiE+iU00YaQSTg1DGV7WqLFXWBtq0PdCqocxLSXMAHe0GxzHZhgOpupOZeg0kznLvZAfNftATi8qNVVVKBRcdYiydF9mvlRovtUltEVTWFujRdYQFSrp/liDv3erecB8nLDrSrY=
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
Subject: [PATCH v2 1/6] xen: introduce hardware domain create flag
Date: Mon, 31 Mar 2025 17:43:16 -0400
Message-ID: <20250331214321.205331-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331214321.205331-1-jason.andryuk@amd.com>
References: <20250331214321.205331-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|DS0PR12MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 02aeb4d3-79d5-41b0-d0bd-08dd709d12eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|34020700016|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hvZECFTcQVbns7mR5kGAgcKD1Pd/HNuUci6HIF18OJn20OokqNjMkioEkQrw?=
 =?us-ascii?Q?RWVvGF3fbcr7wdtsgjaWoqmU7qRyG8re6niitceYy4QQsASlnexURItFVnfo?=
 =?us-ascii?Q?Kv5mVu37srDEx+shE6siCjSDOtUB9Ko+NhpmydSCBfIotEMitqqtfbH6ytiz?=
 =?us-ascii?Q?2Dm416SCdTYlH5LhpXwxwHGVBmQsMcdk/0tS2XsjVEstmk8jfWkarA7Zy+d/?=
 =?us-ascii?Q?s5TqRoosuKqURZWc366+DwL0pMkJBMmCFWHXkdhdaoKquCe2NvrocGrlzyv8?=
 =?us-ascii?Q?X43LfIbSA5mVIjsenb2p69a8UMaJg96ZecRYkN6RPCoUMPEuRt1CPjTFY3vn?=
 =?us-ascii?Q?8U3Q6tjbzq2uNIniX/GGrvnCcwUCgOLq1pD2lVIQDhCo/dL6pzm8LYQnnj1b?=
 =?us-ascii?Q?Qg5ifw3YES7Cj+qBu5xQJxhvUG7mqTvgZjoSJU7088aP0NfSisMxZ5mdqGmu?=
 =?us-ascii?Q?sRopcrIhlC6AcjWPjC4pb7njtKSlQ61xuYWm0S4/qSCJY+nWmIy9Hiq1WPVR?=
 =?us-ascii?Q?XBfDbTXEJjdegrT93+LCeN1FmelVDvxghVn6wyHWX+6jVxlHxor8pivYgdpA?=
 =?us-ascii?Q?Xo0thh0bUXvnpsbNS02rI/ooX68dpTQsKxsIXW8PEVqB2c/AUci8tcFkhPOM?=
 =?us-ascii?Q?I1cdxUaPmnzOhqco74czQD7cPtDBbUH1giEhOy4WHHy8SiJLjCeTtqs+CXrd?=
 =?us-ascii?Q?XWvzSUJW5X5BbP1mhoKdBGCQ8dmoHfIcIJjzRM35/1Yvm9Pz/FDZewCZF8lo?=
 =?us-ascii?Q?zY00KG6l+eQGn/POSHN6/uhbanfdIAzEpZJIJvAK/jWxsvpiQppcq+7fc1d7?=
 =?us-ascii?Q?3mKNgUDK3kx9uVBeZ4GW09qTQ7gktC9EYQw+aMtVZAZepW0ZvLnQvU61iel3?=
 =?us-ascii?Q?7tsNRjg8VGjQFNuWw9TTdvhXfDFc7uNjs6GCAWpicnjssrBZYcyrnGNHrPXN?=
 =?us-ascii?Q?aGJwWaYIGbJSCehEmwTA76V95Bv17Jn+VxfoCs39wNYFb5ULUyjfBDUtXUo7?=
 =?us-ascii?Q?cAlOmMuqDeQbzT0+sSMdRN6YhkEo02mUmDys6SJE0TV820+gyNz3yq1R+EeQ?=
 =?us-ascii?Q?SJyne3hBZ+YBFcfaMo4XJ0fp+ylirOcwMMiU4cI0RlSsASBsOBIGCeWOYr0k?=
 =?us-ascii?Q?YKnBXeLotXTtiFvfImKdlwjTjM7gmsOcp9Vp8G4aWnlJRH5tkKoyiShWkNyw?=
 =?us-ascii?Q?RRzWIzOebBvmLjD+r8/YZOJZEUG4Q0S2uLcaaclCNRluBMAWzIlrwjok0QXV?=
 =?us-ascii?Q?PwRGbcUckY2w5sg9ryghLzGpDvqzKNN+hmYhfEOutK4Au8PmGQw0P4EpqraH?=
 =?us-ascii?Q?1fhUUm5Cu4Al4jKO1dQDE47nK9rgRhJcGzGIrs0zpU99+Hdcb2MjZyW9wVyz?=
 =?us-ascii?Q?yXC59RawDoryKj/dRqp0GFHN7DwqE/KID29jGdUpHcSf7WTUbeEsC/jpUOMc?=
 =?us-ascii?Q?mP/zJZeHPTLfBwZIEOlse6xI6Fl+NmnR/8G1HHR+KwSqcEXE8vVf9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(34020700016)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 21:43:28.4536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02aeb4d3-79d5-41b0-d0bd-08dd709d12eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6608

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add and use a new internal create domain flag to specify the hardware
domain.  This removes the hardcoding of domid 0 as the hardware domain.

This allows more flexibility with domain creation.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
() around binary &
Only allow late_hwdom for dom0
---
 xen/arch/arm/domain_build.c | 2 +-
 xen/arch/x86/setup.c        | 3 ++-
 xen/common/domain.c         | 6 +++++-
 xen/include/xen/domain.h    | 2 ++
 4 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2b5b433183..051c48329a 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2366,7 +2366,7 @@ void __init create_dom0(void)
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
index 585fd726a9..b3eb589872 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -820,11 +820,15 @@ struct domain *domain_create(domid_t domid,
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
     }
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 83069de501..9be18d16b9 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -52,6 +52,8 @@ domid_t get_initial_domain_id(void);
 #else
 #define CDF_staticmem            0
 #endif
+/* This is the hardware domain.  Only 1 allowed. */
+#define CDF_hardware             (1U << 3)
 
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
-- 
2.49.0


