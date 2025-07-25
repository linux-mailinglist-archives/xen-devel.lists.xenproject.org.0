Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0859B11675
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056863.1424894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Cq-0005hK-4D; Fri, 25 Jul 2025 02:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056863.1424894; Fri, 25 Jul 2025 02:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Cp-0005f4-Sl; Fri, 25 Jul 2025 02:30:43 +0000
Received: by outflank-mailman (input) for mailman id 1056863;
 Fri, 25 Jul 2025 02:30:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8Aq-0000gX-SV
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:40 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2408::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11e3694b-68ff-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 04:28:39 +0200 (CEST)
Received: from SA9PR13CA0109.namprd13.prod.outlook.com (2603:10b6:806:24::24)
 by DS7PR12MB9475.namprd12.prod.outlook.com (2603:10b6:8:251::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 02:28:34 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:24:cafe::9f) by SA9PR13CA0109.outlook.office365.com
 (2603:10b6:806:24::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.6 via Frontend Transport; Fri,
 25 Jul 2025 02:28:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:33 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:33 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:33 -0500
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
X-Inumbo-ID: 11e3694b-68ff-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTH05AP4tQb74sN15EEE8/zVz0UKDB4tpZ5YE1fOA0A8XGgUqAVwZlvTDfqFUFmQc5GL5musBhXBIM98uN+D+7kE3SLm1Nv5taVXZN2cR4qt850ImfNrEQKFULGWPM7N5M2QPzs1+JwVk60pasWg/gU9uvsexyTiijJFIfoO3Ownu6cL8YKjJsvTd4TNE0bM1PlTFkFNG/uL2fG3k8H/3Lh2kXSvhrVLEWhsFDM4XUkB+YmN3Z7Ea8RLWyDZPkRe/N5lhRRgyPKR5jPx6AMg1RYFfRejb+U0mBN7eSz6V/+tS/qGrnjt635u8FYqaE84PpeQFRdVT/EOnKZ0A6YSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlugRIedb5kUb20fgbK5OIj3tsxnkaC/u/n2bSU12Pc=;
 b=LZD+vz9Z1H+pwz/cQ2Nsecz1/77WhoDpb1odmfcbvfQnwvfUmWWsP6CeIed2ChhpEoGyiZPKpbnEeUsl7sjOH5jozrIbc3QLWuzy+RiesZwP5NfEEu7xrtURBDVuVc1d+0re5L2H1E5g7JUW6Qr124lAuqJ8HRQkLBP79L62gLYo3sBmFbiMWjSJjygl3wBX030A0XIhBSD0Cy51vFVbewiP6xrAgCbh2tPt/Sw4sDIV5HJtILqNDfxEA3W6c2QvVgjjgp3FOQOIg9jVNPGB/yH9Ys9GFlEM+ou13fa0v2xKvT9Bf+pPy2iS/lfPj3HFmwCcVWvQkYoHcWwkgqtZWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlugRIedb5kUb20fgbK5OIj3tsxnkaC/u/n2bSU12Pc=;
 b=V7XulosiiXJfxxk93x9Jjhrb5v8sU+3dftRx9qwB9Curiz5Qdyqp5d/YIQv39uOYv9kA66LBRsBWZJiPpflM8YLKH9SXuBcwW2IsJy4l8ar4ehp6i1YugMqVsZRUNGRuIPPcy5hIw13l6bDig50hN0oSyZ/qL3qDLqnIzjTuWu8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 09/12] tools/xenstored: Use priv_domid for manual nodes and permission
Date: Thu, 24 Jul 2025 22:28:09 -0400
Message-ID: <20250725022812.466897-10-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725022812.466897-1-jason.andryuk@amd.com>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|DS7PR12MB9475:EE_
X-MS-Office365-Filtering-Correlation-Id: cf41198b-5266-4921-f224-08ddcb22f42a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vj43dZRcyN+6F52LqMK2scNd4Lgz8VvBW/p/Vw/LEi05smkoSkcQaLhAxiOE?=
 =?us-ascii?Q?CBOoVoToEvpTVi0snp5otJuw9qWZsRnMXWwyI0wx5HBAe5TdbU6h9ALrQXeb?=
 =?us-ascii?Q?qBpemerDQGE7qD0GcHA8u0pUWAvmBc61X4E2iO+KfvKSBpo+2uXFFzD7ZjAU?=
 =?us-ascii?Q?hbGSuAlfFf1LVs9wDOdFLRYuNd8PiTmsfu14NGDpBXo/3vGJgWy3rRveGD1v?=
 =?us-ascii?Q?uFOOLjHysFi+aRPpT/Yh5cVkAMeyvrgeQhluxh4wC+FEItqbjwEamraII65S?=
 =?us-ascii?Q?b0phZrx/SankR7ZmIPntmeQQ38zMC9XH8iXuXNjaa7mFUgyFtFJfn8aiC5W7?=
 =?us-ascii?Q?7KDdEoLXge3DNqlh/YJ0tizAi/BvtkAEeqKJ/NvMzSzbeIhpU9wyfe8/v5TT?=
 =?us-ascii?Q?i809WNBghIm0sC6sbJXd0ZYwQ/XOv3jJGR2Qf1ELnGPrONfVzZ4FJ5JOVViy?=
 =?us-ascii?Q?kWebKE/uWKLc1ZyUV9QyewMhIjZmwrGEcse0q9y0Sg2Y7ym/rUr8x3nERr8O?=
 =?us-ascii?Q?Zy4GLzgEy/9KcSS5vfuh0P+3L4P49in2USA35lb0nSwl6FEo/SAEcljRmXFK?=
 =?us-ascii?Q?xAR2kHtQjN1Pf+Fu8BU6qKEVIkM1sGAVirf7VfqbhC03bJAtHIBiiLumfHPu?=
 =?us-ascii?Q?2oN1cONNWrKG1EWiZ6ubYS+tNCn32zJ7KEeG2vsqhueux04IkP6n5z6H3d7Z?=
 =?us-ascii?Q?18BVbEI/HJ6KXRkfn1mUJWaMIgShwEnlbWnsK67IneddPpngYZk7R3gIdYa8?=
 =?us-ascii?Q?o20i3D7gpE2EVXU6UmbG245yDoy6SMdoUL/yJA+J0C7Lx+BsJ42ibrBhBHQ+?=
 =?us-ascii?Q?pVc808BZVLWOJ3ebDOGogvTVIHbeBEJj/3oUY4WKIXRa1g6grXVnOqswCGuF?=
 =?us-ascii?Q?b9uzO9jTnFHEIZhws8/+mdC//bVn1wgM1NXCNQILYV66X3Q0Myo3O2Awx262?=
 =?us-ascii?Q?e2te22Sfd4tmtHpmxGlOlWXm2Qgab/8pYOhzRWXqG6OR+Nzz5DIOnyTotr3W?=
 =?us-ascii?Q?1F00xNc1F+SvMKwMn08Z6LTfQGNvdIyqLXQ+SOcAMDaa19vnk2cA0/pnDctU?=
 =?us-ascii?Q?Us5TlCdLCg+TWWNBhq7SYQSmGN+TaU74kJE40AFwg20Y/j6Ob4apVZIL1VVY?=
 =?us-ascii?Q?qm9zwA5uZ4QXh26zQG0Rc583OQLllEHWdhUZzui8fSdo8ii8Cykv9peAXrmP?=
 =?us-ascii?Q?jJg4Q079FZB0bSwOwYmzfivvdB7p3E6Qf5C/IkVSDnwAo8oqnV7o6TCcv71M?=
 =?us-ascii?Q?EKiK/3Gw/SPMHvAhHuGiEW5YLHdw3/U3clGsfmqDtRXzaw9CjJNue7ybhfp6?=
 =?us-ascii?Q?EGc6IDbqckQoAIWS3q8rtCp+NNXS2w6884hwHwocH49Ggvl2PH4BGkeKaSKe?=
 =?us-ascii?Q?ZkhZ4WSrnTpHtk7ZhrdqNleXpakMnkBi17+h88lp3VcR9+ZYZYVLvai5g8S+?=
 =?us-ascii?Q?T8X6yIRgG/lgrO1Z9PlHgIrIp1xbMhxYmXJGwgP+s9pRahyxZIUFjw1z+bg7?=
 =?us-ascii?Q?YcN7Z7kcqmZpV4gd1Gp1xzBn/aSfTKMIVKtH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:34.1599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf41198b-5266-4921-f224-08ddcb22f42a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9475

Usually, priv_domid == dom0_domid == 0, and that is what is expected.
If we rename s/dom0_domid/store_domid/, it seems more likely we want to
actually have the priv_domid as the owner.

That leads to follow on changes to ensure that the priv_domid is created
first.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Will this blow up if priv_domid doesn't exist?

Maybe it would be better to just create these as store_domid.
---
 tools/xenstored/core.c   |  4 ++--
 tools/xenstored/domain.c | 15 ++++++++-------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index c2f8d20211..19edd75bc3 100644
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
index ac4ac72f99..dbeacaa93e 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1009,7 +1009,7 @@ static struct domain *introduce_domain(const void *ctx,
 	struct domain *domain;
 	int rc;
 	struct xenstore_domain_interface *interface;
-	bool is_master_domain = (domid == xenbus_master_domid());
+	bool is_priv_domain = (domid == priv_domid);
 
 	domain = find_or_alloc_domain(ctx, domid);
 	if (!domain)
@@ -1032,13 +1032,13 @@ static struct domain *introduce_domain(const void *ctx,
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
@@ -1295,17 +1295,18 @@ void init_domains(void)
 		domids[nr_domids - 1] = domid;
 
 		if (caps & XENMANAGE_GETDOMSTATE_CAP_XENSTORE) {
+			dom0_domid = domid;
+		}
+
+		if (caps & XENMANAGE_GETDOMSTATE_CAP_CONTROL) {
 			memmove(&domids[1], domids, (nr_domids - 1) * sizeof(*domids));
 			/*
 			 * Local domid must be first to setup structures for
 			 * firing the special watches.
 			 */
 			domids[0] = domid;
-			dom0_domid = domid;
-		}
-
-		if (caps & XENMANAGE_GETDOMSTATE_CAP_CONTROL)
 			priv_domid = domid;
+		}
 	}
 
 	for (unsigned int i = 0; i < nr_domids; i++) {
-- 
2.50.1


