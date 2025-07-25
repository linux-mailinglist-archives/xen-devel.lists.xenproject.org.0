Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF05B127BC
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058727.1426290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSKJ-00015L-DO; Fri, 25 Jul 2025 23:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058727.1426290; Fri, 25 Jul 2025 23:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSKJ-00010K-6B; Fri, 25 Jul 2025 23:59:47 +0000
Received: by outflank-mailman (input) for mailman id 1058727;
 Fri, 25 Jul 2025 23:59:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSKH-0007YZ-6d
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:59:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2009::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ec65af6-69b3-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 01:59:43 +0200 (CEST)
Received: from BY5PR17CA0070.namprd17.prod.outlook.com (2603:10b6:a03:167::47)
 by MW3PR12MB4347.namprd12.prod.outlook.com (2603:10b6:303:2e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 23:59:38 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::e3) by BY5PR17CA0070.outlook.office365.com
 (2603:10b6:a03:167::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 23:59:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:59:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:36 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:36 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:59:36 -0500
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
X-Inumbo-ID: 6ec65af6-69b3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXFBJlqFEQEC+sjEBt6TKIi0UKO4Zu7k0gearcymzO3GwNmT8oBxHwNPis3xitWQylAkMzYUVPL32l/Z9aJVSGWmpqlVO+SHuKV1OHuwc1MjRIQPTgjlBzFrAWqEYc1TWYQxYxq4W0mk+mqBtGTsbTIWX4nq3s8jSrg+Ttmd8Sm+hQXVz5cR1IG+kIzCetpEpxP7TMD0euF9j4rmPP4pOIX83WjLG1tHutqdhAatbF2gWeyA1BihXrZE2amwD5LAhTgCLPHlq3UyoGmlPIGBpSYA5CznP73RM1lzMmFdpZXtqwDrJrlE7cgZJESvh15PwEzXnfQ1I5UbLB5cBT97TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qWkiKC5suZIzWW4U7EhVfJcFngSvVnzgyONjQcceXA=;
 b=EF10HaPuVoO73IbBqk5ygDDZq7rSOk/jNYkLpH80iCKqGfe7dXBnfhZ9DjgVqWDlwl3ee9O0MTkeXAXJG8/NwpOvaGzfQ2u2pfmqplgYmCdvw6k8RBeS/GllPX2+Itx6GckMr3Zz/XjHMVmBEh+aZSlFKhDGrtCFHeCDf7KBXGhqzK4OELzsXXeky4YH9QYL+5DCHck+6DeguGARINwRyGbPGjD/7jqu40+JXpYIvDn7Orx4IycGsCs3QNLqy1hxBj+bB4Gp07F3xoS1DNX45sGg1n+KbZLkLeI5QbVntoz4XlhZCWCkr3Bs8pPlTwswPqApIhcEQRH77wOKGXr9ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qWkiKC5suZIzWW4U7EhVfJcFngSvVnzgyONjQcceXA=;
 b=Lqk+14reOcndAalIIcfWW5bYU5WIZ+/HiHOUDhdGZ9uQqBokd+VGBnJHd6p5mDzz3C8bIBTEKvUDV2cu/0PC9VxpM8A6dqLO/6R33d92PWzieqoyKQVEtWgKzLY3LCFckx+kjS/oPDbRsJdGM1AKLgp29WFW0tqQMQnf5PAdEds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v5 08/11] tools/xenstored: Use priv_domid for manual nodes and permission
Date: Fri, 25 Jul 2025 19:58:55 -0400
Message-ID: <20250725235858.666813-9-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725235858.666813-1-jason.andryuk@amd.com>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|MW3PR12MB4347:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b60338-4d52-4487-3821-08ddcbd75006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Y8DBQu1QtYKePLvC3l5VvMSaLPaUa/7WaEDHT3fbvHMSLQDZSoWR1pj90+Z?=
 =?us-ascii?Q?SJgzdzAYJyL/uR6CPXRkd+efahBVUbE26Zlc3dRrPvlr5aIYpNVqE+3qI3f0?=
 =?us-ascii?Q?BW3WbXmbacxIQ7TcotZHUQTKXiTmst1ImC11nDWnkfOu3Z54uDqEk2wD7olO?=
 =?us-ascii?Q?RKY0NKuHW7C7iVxKE/DvJenhK8xWAf6qEgeR8msMWoxyIi18NSjlQ863AX7N?=
 =?us-ascii?Q?gqX821jACgtquGMJIY8jMZm5mxHV0qJDA80xbIx0haIDuQ9mMYUbkOyQQYsH?=
 =?us-ascii?Q?x6f/e27TpQfsyl7TudxOSGe5w3D1hSSqu4kdj64eP70yM0HbjZ0EuGpFjVwP?=
 =?us-ascii?Q?yvuPbVN3Zxr02SyTfkk5FE18KuzSzlmIKjE32W9+mZPn/MAPUUkzksaZtvE2?=
 =?us-ascii?Q?p8ChNX0xIl2iXj4tDqG682Qq4vfX91pQo9uICdxuBnzVt+TyEEOHONWHIo1S?=
 =?us-ascii?Q?io9knlIz/1WiDMvd39K1a+djIPOAVjhcHTgDqYZrIPCmG6NxuvNJB93/CPmL?=
 =?us-ascii?Q?S/EMQm82YJP99fn5/VD3TKstl7yjvZUEVC2uCG3Um+kC+hglg4jyialmgHk4?=
 =?us-ascii?Q?amZX55r89VpEphh+CUxizfTG5X/hVA8EtAbQ7RgsY4EJdaeYCsePVH9PhPet?=
 =?us-ascii?Q?GnK9Rl+wx0VOgoeF3cA65KxMF9BtsPTPK6rb/H8uRmWQRQKf7VSyHaIwup03?=
 =?us-ascii?Q?TxFnnoHg3AHiai/QbhdHpSgD5VYfzXPSSI3+5O08WQU5OCLAZam7WIb6DdpU?=
 =?us-ascii?Q?GSvpAUPyiXM22BpinVpuqZjqZVZ33Vv9GtmBpeUIDLm3ZV0M4LwCwX/bZuHw?=
 =?us-ascii?Q?ySwf0AGzp2ui+dJCa5C7CQTndwBLt5tkjKQARUoQiYaQJoKbPWN3x9xj5dgG?=
 =?us-ascii?Q?M6NcoqtH2DYL0X2EQWLoyDuvY3P+GA/y3Gse3btYUcP6ADdl1GKA8hTQsN7a?=
 =?us-ascii?Q?G4mh/gZbUan/5fgTafzX+MIJkmw8HFfAKihRovHUuWtw78PjEke8+KO5zb60?=
 =?us-ascii?Q?0LjGRzanhElkKvHpJnIkkyMyX8xfWq8EPFQOY+QBiZJDRRFVifKQCAPYkYYy?=
 =?us-ascii?Q?0pDT0FizoC/I1Bzo5NXvwIonZSPrfIvU6+bFFEXoJbB3MYNgnP7LzeL2G8eS?=
 =?us-ascii?Q?uaoi5ALXAtGXv0SE/Uags6Na9nzqyRElOJwh6pBPKxi2wsM3div0ncIOUZaH?=
 =?us-ascii?Q?EKMQQtwdy/zhsgxgLRCjTdoO+D96U4AFF/0duJzvHKGvD14c8AIPXLsIoJWi?=
 =?us-ascii?Q?Ud8zUUsCryhKGQ37eIO1ZmV1CQnwbciXzt890qndHBMM+rqvoepky4KCFL90?=
 =?us-ascii?Q?phaVf6XAR7FWKA9cE4c7iMn6Da0ZIxozRjmJBlUS82ehZKUh4XfKRY7x8yAF?=
 =?us-ascii?Q?hj36pElHonzd3IG23qh9jR1aTOzzY9XUSeVc32mMIfLQZ0jxLTnTKxvlJEbg?=
 =?us-ascii?Q?3WJRT4WXT3xT4+7Yb+bTLbG9Fo3S7qYZqN4if8WjD+aSbeQSnn2fMhaE5an1?=
 =?us-ascii?Q?yPfwXxuU9klYxAQdGrGZe6Smas2C5rL5XA18?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:59:37.6127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b60338-4d52-4487-3821-08ddcbd75006
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4347

Usually, priv_domid == dom0_domid == 0, and that is what is expected.
If we rename s/dom0_domid/store_domid/, it seems more likely we want to
actually have the priv_domid as the owner.

That leads to follow on changes to ensure that the priv_domid is created
first.

If priv_domid is unset, set to dom0_domid to have a functional
xenstored.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Held off R-b Juergen because of priv_domid setting

v5:
Add unset priv_domid setting
Additional change for continue check inside the loop
---
 tools/xenstored/core.c   |  4 ++--
 tools/xenstored/domain.c | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index dbf3548a8e..098958f611 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2266,7 +2266,7 @@ struct connection *get_connection_by_id(unsigned int conn_id)
 static void manual_node(const char *name, const char *child)
 {
 	struct node *node;
-	struct xs_permissions perms = { .id = dom0_domid,
+	struct xs_permissions perms = { .id = priv_domid,
 					.perms = XS_PERM_NONE };
 
 	node = talloc_zero(NULL, struct node);
@@ -2317,7 +2317,7 @@ void setup_structure(bool live_update)
 		manual_node("/tool/xenstored", NULL);
 		manual_node("@releaseDomain", NULL);
 		manual_node("@introduceDomain", NULL);
-		domain_nbentry_fix(dom0_domid, 5, true);
+		domain_nbentry_fix(priv_domid, 5, true);
 	}
 }
 
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 5e53fe8736..94cbe81ca5 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1014,7 +1014,7 @@ static struct domain *introduce_domain(const void *ctx,
 	struct domain *domain;
 	int rc;
 	struct xenstore_domain_interface *interface;
-	bool is_master_domain = (domid == xenbus_master_domid());
+	bool is_priv_domain = (domid == priv_domid);
 
 	domain = find_or_alloc_domain(ctx, domid);
 	if (!domain)
@@ -1037,13 +1037,13 @@ static struct domain *introduce_domain(const void *ctx,
 		}
 		domain->interface = interface;
 
-		if (is_master_domain)
+		if (is_priv_domain)
 			setup_structure(restore);
 
 		/* Now domain belongs to its connection. */
 		talloc_steal(domain->conn, domain);
 
-		if (!is_master_domain && !restore)
+		if (!is_priv_domain && !restore)
 			fire_special_watches("@introduceDomain");
 	} else {
 		/* Use XS_INTRODUCE for recreating the xenbus event-channel. */
@@ -1311,22 +1311,22 @@ void init_domains(void)
 		}
 	}
 
-	if (dom0_domid == DOMID_INVALID)
-		dom0_domid = priv_domid;
+	if (priv_domid == DOMID_INVALID)
+		priv_domid = dom0_domid;
 
-	if (dom0_domid == DOMID_INVALID)
+	if (priv_domid == DOMID_INVALID)
 		barf("Could not determine xenstore domid\n");
 
 	/*
 	 * Local domid must be first to setup structures for firing the special
 	 * watches.
 	 */
-	if (init_domain(dom0_domid))
+	if (init_domain(priv_domid))
 		introduce_count++;
 
 	for (unsigned int i = 0; i < nr_domids; i++) {
 		domid = domids[i];
-		if (domid == dom0_domid)
+		if (domid == priv_domid)
 			continue;
 
 		if (init_domain(domid))
-- 
2.50.1


