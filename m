Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67419B1166D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056831.1424864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Am-0001hL-Ul; Fri, 25 Jul 2025 02:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056831.1424864; Fri, 25 Jul 2025 02:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Am-0001eT-Q2; Fri, 25 Jul 2025 02:28:36 +0000
Received: by outflank-mailman (input) for mailman id 1056831;
 Fri, 25 Jul 2025 02:28:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8Ak-0000gR-Su
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:34 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20619.outbound.protection.outlook.com
 [2a01:111:f403:2414::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f64acbd-68ff-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 04:28:33 +0200 (CEST)
Received: from MN2PR15CA0017.namprd15.prod.outlook.com (2603:10b6:208:1b4::30)
 by SA1PR12MB7151.namprd12.prod.outlook.com (2603:10b6:806:2b1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 25 Jul
 2025 02:28:28 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:1b4:cafe::26) by MN2PR15CA0017.outlook.office365.com
 (2603:10b6:208:1b4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 02:28:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:27 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:26 -0500
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
X-Inumbo-ID: 0f64acbd-68ff-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yf5zhsUBEUZmzi6ic9In5NG8Bs0KH3q6wkTH2cWDlimepqhoOOEStQ8Y+rAWqejjULax+U0reAwtppMZbwD8n0jAZovQ+OeOo3zhs9QeCvgPwoLsPoMhpH4mJE8BV4FT+/PN/qcvz39KWn9wpKihzcM3ONPKTz6707MuCTrd2TkYagUe8RX83UxPOvfT8Af779ba/43Wjb6PpHTZ+dT+HoUtpHQo8b/BzHKlHIWbcFZCRF62hQMxXP2NIl7ua5XKZ6lbiyjHGjxC8PHB0RefLRGP07I6bpjBgTmZUN2cdMFvfmPD9ZqT25b8lQpogxVItpfiZcn4ONs3HTTuKqcHOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsQY3CEOxMXmJwgGeLeDonCu0Zez5UFFVJskUGMmihQ=;
 b=ZJGfRSXqw0q8nFwjS97kliI+v1/RCejT/pBWrgQ3eXtXcLEmgJEGf9vB8AZdOlVZr1J1yH8dJrnah8/QuxXQ13wtYWDm3WBBWr3f7APsjkDh+NpdiS7jPEoTC9/zNfZfEwwFSHgxVTOmnfx8eRXQrVDMVzF5zG6qqy8cxqMmFoNe96f2Cj6FtSHPQjUSJAVRH/duDK1cu0CYFpXpBOoecbKEdpv7ZNWn9Gn/DUtE7tXdAXQPUFvoya4rB+Uxb1W16sLlO0d8kIiyKzhe0/U8zXk3B0c+jwlV8gmfweem2GvJChTkY9vl4MO/xnqVmQQctp5a/m5WUkTEKjgHV/EfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsQY3CEOxMXmJwgGeLeDonCu0Zez5UFFVJskUGMmihQ=;
 b=2NFl7LBE4ijEdNXG/6ZyuWs4NobE4zP/lYcyUUx3ocAHbY/NCrDqbVRnf73/c7qUyPodyTINnLJ350c6rUTKEAc0BCO+z9v+GFpreF+rNU1/ZOW/RjVG2U9mYFSW+FeCtA+8OUhhqr3kj2lOyC9KnzhHwqI4ZASvB4qPEXqhZjk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v4 04/12] xen/dom0less: store xenstore event channel in page
Date: Thu, 24 Jul 2025 22:28:04 -0400
Message-ID: <20250725022812.466897-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725022812.466897-1-jason.andryuk@amd.com>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|SA1PR12MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f22048-1462-424b-3d9d-08ddcb22f07b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EqO0lRWQPv6YyUOdd0tMk2RuRMum5aK5+LM5+eTfy4DVxaNm/etcGzRFKIHB?=
 =?us-ascii?Q?7m/I0bchneF/PfIZVZueNKjdjRS9i/2NzEF6mIOLQx3n4uebTlg3lEoAABDM?=
 =?us-ascii?Q?EwoQEHvk/laNCd5hZQAliUV+oPuDpllmwfJG6fu8G+8GdVetylVhDrFBiZaz?=
 =?us-ascii?Q?96aKqo7iNgaXKasEqK+smxKcEmGcT0uT90jqJn09NANznG2wbjzEF8K1N96R?=
 =?us-ascii?Q?O/oeQq9hE9M7BxqhiNfHugsSIxXjMLHTHWZiMbLMOjxv3PXXfuhsSu3YdMD/?=
 =?us-ascii?Q?kjGt3ODpyq7v3+0cQraap+DG6WoIz9HahjHmHeTxIYT/rZEUk1lGVQVZLKkv?=
 =?us-ascii?Q?qbOMb5Gk+wgfai03lmrdAx0RmFrS+4tSo2l8tWV0Q/3IbIdjXNaTcvq/YyDI?=
 =?us-ascii?Q?PK4nfWXdiwVt3xHIw3v9o1+cp3CGABIeEqJzNXyjP08NxVIVmxLcIsfv17dq?=
 =?us-ascii?Q?nFpPE5sw/VjWPHEHVAu+V0gL9saXhDfSTm4mmCBENVlxAY/5xc2X5RFaspFo?=
 =?us-ascii?Q?+PEMhOcF8E5jE/MbXSmkgCBiLJiQcAkGojboL3DT/UegyY9JT/WhujZLhJ4p?=
 =?us-ascii?Q?DkJU9sq3/ahIpPQKHbQrgxEzk82vVpF5r1gHw9TK3UqwF+vY0qWFLtoef4nK?=
 =?us-ascii?Q?sopNmq1F6E0A66R55hHV+urwZdaTnP8BRtS0eyc5ZlApQNtNtGYQA7g0J8+n?=
 =?us-ascii?Q?EsDh/ZBUXCjsS66Nxsv3BwNW7xpqmtkT5p0YYMmyfHCn3lxmvYEBoRZNQN6U?=
 =?us-ascii?Q?V4QwgZ6c+8ubLJ64yM6u4Q9+oyBK22JtAbSeBPUnnaMNSNACOGDqnSsdtu6Y?=
 =?us-ascii?Q?Zn43D4y4y7t5NBiTNZshn5HnaMIUUgQn5uYrBbSKKqSZmEHMywHG6pG3jHuZ?=
 =?us-ascii?Q?KFafxjZksOaNVgRp48bA91Sp1Ibn1KiJoxHVECUS4U7kLjsajVTVhmMDoFfn?=
 =?us-ascii?Q?WzjYNG1y4UlHLfK+daG+0tGDn9GPcTem1Y+L9nTk/UE1413FAfYCYitmqnWO?=
 =?us-ascii?Q?tKRqCzZKdbFIa1TNyAFXWGdVPCrQ+RQKgZQQRTWpUQEFt/id0hU9kRmpRKF7?=
 =?us-ascii?Q?dpvs6R9Skjv7OMTiFwJEyInSpXuJKkerNaTLFNgjY2SLveKRU/y62ebn+aD4?=
 =?us-ascii?Q?u6u+HGZaSt80jGeOfvHg64EyWxzsaBBlTo67skauO/Us1DwmktXwwxRVzcWp?=
 =?us-ascii?Q?ziNuJbhlwlTMDGz4OPc0ZYsG981OjJp/lG5dCHLnJuLth6TDJRpxM/LS2Q9H?=
 =?us-ascii?Q?TFFoVvf/432XRo0apgebvpASJ32LX+YanP06BcNwLmaaK5jq4Mj2kuAi0KCg?=
 =?us-ascii?Q?YesC6XAIHak9qXv09LlWB8A3+BAmXW7ywMRlzzpeV5ipuBVVCGLrP4UN+XK9?=
 =?us-ascii?Q?pdZGmARpRBfMM36Kc5jTsFgnliiP+c1NDF4+09x0vHKoyo89jfdgSURMrzJ9?=
 =?us-ascii?Q?hb+dmZ42ckZMbDe9DkosCGAFwj3DJVg8/bKc+fdDLsbCK1Aud3FKrF9NtRNv?=
 =?us-ascii?Q?7+zWi/3toceH9N4UZpBPvxMRyi8jcy8gZm+a?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:27.9979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f22048-1462-424b-3d9d-08ddcb22f07b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7151

Write the associated event channel into the xenstore page so xenstored
can read it.  xenstored can map the grant by the reserved grant table
entry, and then read out the event channel and bind it.  This eliminates
the need for an additional mechanism to discover the event channel.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
This is ARM-only for the time being.  A common function to write to
guest physical address will be needed.
---
 xen/common/device-tree/dom0less-build.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 6bb038111d..a96089d9bb 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -26,6 +26,7 @@
 #include <public/event_channel.h>
 #include <public/io/xs_wire.h>
 
+#include <asm/guest_access.h>
 #include <asm/setup.h>
 
 #include <xen/static-memory.h>
@@ -120,8 +121,14 @@ static void __init initialize_domU_xenstore(void)
 
         if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
         {
+            evtchn_port_t port = d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN];
+            paddr_t evtchn_gaddr = gfn_to_gaddr(_gfn(gfn)) +
+                offsetof(struct xenstore_domain_interface, evtchn_port);
+
             ASSERT(gfn < UINT32_MAX);
             gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
+            access_guest_memory_by_gpa(d, evtchn_gaddr, &port, sizeof(port),
+                                       true /* is_write */);
         }
     }
 }
-- 
2.50.1


