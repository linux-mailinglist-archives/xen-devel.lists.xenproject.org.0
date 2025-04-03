Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 248E7A7B1A4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:48:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937373.1338411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SQZ-000447-Pf; Thu, 03 Apr 2025 21:48:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937373.1338411; Thu, 03 Apr 2025 21:48:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SQZ-00042a-Mg; Thu, 03 Apr 2025 21:48:47 +0000
Received: by outflank-mailman (input) for mailman id 937373;
 Thu, 03 Apr 2025 21:48:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GAK9=WV=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u0SQX-00042O-Hd
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:48:45 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f403:2415::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69624f55-10d5-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 23:48:43 +0200 (CEST)
Received: from BL1PR13CA0238.namprd13.prod.outlook.com (2603:10b6:208:2bf::33)
 by SJ0PR12MB6992.namprd12.prod.outlook.com (2603:10b6:a03:483::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 21:48:38 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:2bf:cafe::c8) by BL1PR13CA0238.outlook.office365.com
 (2603:10b6:208:2bf::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.17 via Frontend Transport; Thu,
 3 Apr 2025 21:48:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 21:48:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 16:48:36 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 16:48:35 -0500
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
X-Inumbo-ID: 69624f55-10d5-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KG6Fs4bZCpGpUSR+Lo6hOAKRu24ulJMccpKoY3p186VXmmFXKwgIR0+XpHvEbKOsZ9O5ihsos5WcfHsFYC9onTrumLy9cBz5K4lhIsqm26CfZUqFzXlxFmCJyqpPMMrHQDYhvu1+YPf15FlCHB/nX8kj+MaVbt9lWj5m6tfK1VdTVlU6RgB3InSmcQDPICUZDkSUilBAENMUhnrx6PQunzknQP9qvw+jaHzYYN2P9WofzD6WCMwljASzeWjFOAuJWlqkbVihb+95ub07LVY5bBu7XzCAiHZJe3kt5j5PLkLe1KzdscjEIiYmsObXIvAqB/u1OOBuGai2GHkW3zcVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7WpMxzStKRb4yl90BOglzDn0Ex8GUy7QeVdyk5lpYk=;
 b=Lx0GfmGFTs9dT8EQ5ZfD/PUN4QojrvSJqPGTDE88pnjiM9mz6MDo++o7WQjC09OvaPvbzKu/sjm2etthGXPK4D4AG+H9gU5VNcmhTnUczLZwHXNsic/iSQyjuf7IfQ9xRTQXzQJaX5mm+FSqJ5UJH5wqs6QnVe+WQXxw9GQ8s3lFznV4xVSDVj3R2WPfKRB/caDBKouxnjjEgY1KlrKx4CizgaqtQZz9yJqMwZbZ8Wa8xRA4d/WTtX8cwG5N5kvFIWPJ23yXPPcgKqJbBQYV3GU9aeuN3FA2+i7ielmQdwEp4ULRy0dDUxdKby8rpoLF2ZIbwUu4qGipQKXD5QFfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7WpMxzStKRb4yl90BOglzDn0Ex8GUy7QeVdyk5lpYk=;
 b=WVL+xB2kxv6KbRDYdiOdLfZaFA2JIxXz4ltn2+JXIrF6kC3eATIn03uot/R7Cy36z//AAtqK9GHWwll12Yue3jaA6iImgwruXUGhpJVwRxoRwIamHempPiKe/6DvLMIvM3PMXRoUWKcbTHJsUJBaHAU8ddqFOcyajrohZdIlwv8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<gwd@xenproject.org>
Subject: [PATCH] sched/null: avoid another crash after failed domU creation
Date: Thu, 3 Apr 2025 17:48:19 -0400
Message-ID: <20250403214829.128294-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|SJ0PR12MB6992:EE_
X-MS-Office365-Filtering-Correlation-Id: 769195ac-9595-4434-b8f7-08dd72f949ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mcaGAWjjs7fn/M5jmYK1F48PjHBotXB6+y47Nut/NvotRM4mrDwYMqw5PhWj?=
 =?us-ascii?Q?N9spcYf/TiDKyNLqWpZ376eXvICUfFBSUBi4Zfs8MSZM+boDv5XmX9UkWtH4?=
 =?us-ascii?Q?waFjns03Ox4iW95123NWWyLmcAMcxcGCS4q8z5cvvhquvUeqWNgFZT9PrBNb?=
 =?us-ascii?Q?c97gFrd0rVRRds2WCYDKk9QY9l9u97qUExmLvOQ2MjaYEJTkVt9hLiaqYiBD?=
 =?us-ascii?Q?/fs23qRBfxOW5xq1NC6gqgAKdN0evdIvti7a/PZWH8xrwtQR39E0pvMHrDPo?=
 =?us-ascii?Q?kglGFDYolXWkdhL9pDy0GJekTchGI5RxqPZXtkIks9oRzo10SfpcPHX/g4E6?=
 =?us-ascii?Q?033p6MuOVhhXOaU4u3SSv0AF8OgGV93LB3Vdd+C/VtGeZPApoS2pVizc341F?=
 =?us-ascii?Q?UYmI/KCOa7qIIh3GL9Tr2Lu15LOPsNcdQZ+d3f3E+zcLDYvd4wl2dEfTtULW?=
 =?us-ascii?Q?6/qz961AGNJQVKAvXakW4LNh8YbfoBv+z1zTjQN1L35mtZPC1aS7QWr+MOEe?=
 =?us-ascii?Q?t0UPvHdzCVegEZoF/HIgphyOlRScan0X1JuwJZ7k5l34JP2trjG2bpF23BiL?=
 =?us-ascii?Q?1h7DSuL8YhRXAuzqopo0IM1DM49yVQr4Z4a9iItcWEBtNV6RuB56ukOY5IXt?=
 =?us-ascii?Q?/Ljhdy5aZdAeJwiTcTs0VcNBWX1TA1MjZgQhU/BsXkgYsc1P5oikmggViLn8?=
 =?us-ascii?Q?R0SnP+itAkPYFpjmcrhC+o5d3dNJmAVCObD1+6kJjemrk3KP1Xn6N2cdNUC2?=
 =?us-ascii?Q?eOEPVVkej5Lm5h31Op4F6/DwarPOnmANFAuYGUVSiFkHni3lgiu3sJdLvba7?=
 =?us-ascii?Q?LPJautjnP7NixZB99Rxwpk11dky3r3Y+d5cElPgwPW6ZCLKO/vFIUtC5OsfD?=
 =?us-ascii?Q?dgOiZnksvMgO6a12sKaEdXZsO6qUwGptAZr3EDEWGGTvqijYl5vVE9e0diPb?=
 =?us-ascii?Q?o7QXEaBA5PfMWWeyeHifzETin8+HVfxJ4X6FjIUO8z/UnCtxmU0yrNbX9rAC?=
 =?us-ascii?Q?RrRvlv4XGsHRt4g8DqixEp4rJmlzpJtLc+SGgS9SON1pqP09fOlz1yUbOusq?=
 =?us-ascii?Q?wvyLkkx2fp9009LQlKr8tA5e0e1WXnAMmfQoTKuElG1LC89QEzk2TPqyOo5k?=
 =?us-ascii?Q?7GJ4N7SN2VLcAr7ql+8sx765amDIngStnZ7MwXVA0DlM2+87JSRRsRp0OiRu?=
 =?us-ascii?Q?fGuqQ6ETZEMh8vRru7HWVF2MyzgZGJSsDsUXcd0rEy0lMb+68/rF9hosEoVJ?=
 =?us-ascii?Q?eiUCSQAoB8SCXZktR8LTfbHNez6QpVkDipzWGYs0DUuva2xEvE5k52Y5R8ET?=
 =?us-ascii?Q?xUn2p65MOh0tCLRad+EMJd8beZ/cDUJPQXQFdEOC9QYR9FuJaIZNRBzJzTAO?=
 =?us-ascii?Q?SXLIxzteDGhjFRvIIOj5/E51M7Xx18XV9t34k1VtE36jYfcA//BwrTIMf4J5?=
 =?us-ascii?Q?GoK/B3MR9LsNMQveHOak23e708zAbM/DP6jl5kL6trS6DF5AesMr0Fc7ffTe?=
 =?us-ascii?Q?cyJm+5MJm0lw+1+W7yMAIpfd4V4JJ+N7M3JD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:48:36.4554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 769195ac-9595-4434-b8f7-08dd72f949ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6992

The following sequence of events may lead a debug build of Xen to crash
when using the null scheduler:

1. domain creation (e.g. d1) failed due to bad configuration
2. complete_domain_destroy() was deferred
3. domain creation (e.g. d2) succeeds

At this point, d2 is running, while the zombie d1 is not fully cleaned
up:

(XEN) Online Cpus: 0-3
(XEN) Cpupool 0:
(XEN) Cpus: 0-3
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Scheduler: null Scheduler (null)
(XEN)   cpus_free = 3
(XEN) Domain info:
(XEN)   Domain: 0
(XEN)     1: [0.0] pcpu=0
(XEN)     2: [0.1] pcpu=1
(XEN)   Domain: 1
(XEN)     3: [1.0] pcpu=2
(XEN)   Domain: 2
(XEN)     4: [2.0] pcpu=2

4. complete_domain_destroy() gets called for d1 and triggers the
following:

(XEN) Xen call trace:
(XEN)    [<00000a0000322ed4>] null.c#unit_deassign+0x2d8/0xb70 (PC)
(XEN)    [<00000a000032457c>] null.c#null_unit_remove+0x670/0xba8 (LR)
(XEN)    [<00000a000032457c>] null.c#null_unit_remove+0x670/0xba8
(XEN)    [<00000a0000336404>] sched_destroy_vcpu+0x354/0x8fc
(XEN)    [<00000a0000227324>] domain.c#complete_domain_destroy+0x11c/0x49c
(XEN)    [<00000a000029fbd0>] rcupdate.c#rcu_do_batch+0x94/0x3d0
(XEN)    [<00000a00002a10c0>] rcupdate.c#__rcu_process_callbacks+0x160/0x5f4
(XEN)    [<00000a00002a1e60>] rcupdate.c#rcu_process_callbacks+0xcc/0x1b0
(XEN)    [<00000a00002a3460>] softirq.c#__do_softirq+0x1f4/0x3d8
(XEN)    [<00000a00002a37c4>] do_softirq+0x14/0x1c
(XEN)    [<00000a0000465260>] traps.c#check_for_pcpu_work+0x30/0xb8
(XEN)    [<00000a000046bb08>] leave_hypervisor_to_guest+0x28/0x198
(XEN)    [<00000a0000409c84>] entry.o#guest_sync_slowpath+0xac/0xd8
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Assertion 'npc->unit == unit' failed at common/sched/null.c:383
(XEN) ****************************************

Fix by skipping unit_deassign() when the unit to be removed does not
match the pcpu's currently assigned unit.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
See c2eae2614c8f ("sched/null: avoid crash after failed domU creation")

Another consequence of deferring complete_domain_destroy() is that
eventually domains may fail to be scheduled by the null scheduler,
despite domains/vcpus having previously been running on available pcpus
have been destroyed.

(XEN) common/sched/null.c:639: WARNING: d4v0 not assigned to any CPU!

... but that is a problem for another day. After all, I'm not sure how
common of a use case dynamic domain creation & destruction really is for
the null scheduler.
---
 xen/common/sched/null.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/null.c b/xen/common/sched/null.c
index 7e31440e5b84..c8e327e3cdd0 100644
--- a/xen/common/sched/null.c
+++ b/xen/common/sched/null.c
@@ -557,7 +557,7 @@ static void cf_check null_unit_remove(
 
     cpu = sched_unit_master(unit);
     npc = get_sched_res(cpu)->sched_priv;
-    if ( npc->unit )
+    if ( npc->unit == unit )
         unit_deassign(prv, unit);
 
  out:

base-commit: befc384d21784affa3daf2abc85b02500e4dc545
-- 
2.49.0


