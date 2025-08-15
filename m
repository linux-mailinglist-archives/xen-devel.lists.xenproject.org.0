Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82583B287C3
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 23:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084087.1443537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25n-0006IA-6b; Fri, 15 Aug 2025 21:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084087.1443537; Fri, 15 Aug 2025 21:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25n-0006FX-2d; Fri, 15 Aug 2025 21:36:07 +0000
Received: by outflank-mailman (input) for mailman id 1084087;
 Fri, 15 Aug 2025 21:36:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IuPz=23=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1un25l-0004xK-Gw
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 21:36:05 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2009::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d797e75e-7a1f-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 23:36:03 +0200 (CEST)
Received: from BY3PR10CA0006.namprd10.prod.outlook.com (2603:10b6:a03:255::11)
 by CYYPR12MB8732.namprd12.prod.outlook.com (2603:10b6:930:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 21:35:59 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::2c) by BY3PR10CA0006.outlook.office365.com
 (2603:10b6:a03:255::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 21:35:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 21:35:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 16:35:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 15 Aug
 2025 14:35:56 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 16:35:56 -0500
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
X-Inumbo-ID: d797e75e-7a1f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeMN+4wmElynPYLdrILMLDjMIqU8je+i0dolCtvD9JfQjbfQ8Ekp4ZxAZER7pW579S11e5Ae13yPboicOXEfDDz9m5Bob1VGjuJq+MOD9oUhNBPDvy9GLjoPNTrPHbiIT0uV4OSEzgtV1KXliSJD0kvEb2oTaejjj1F1qTulutD3wE+k5fqiYrVS8CQ1ZiUwPMfJGQ9OInnb7IWVlUbQchS3Ry10GWqGvNK+yLD/daGF6q9U8K1/84Nukx79jCdkomC1icON1+FGUohn8bvbp0yHq4hV/vTEI1yadK2z6/MLOMC0GgJFJDfbSJgNGhd2Ir/TgIxnbf5h5W0CMrL6DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYlxeCuUWQFVD2Lqd3WOg1K+vgoKT/PL3YrRM2td0dw=;
 b=pIm2fIxjHFM3SA1j72JihVfrUzT4324UOXJebFbLkRDcjNZPwwXEz1XN6ADfDCcMMc5CFbJpsKyZRbE0vxU1CvWsnlNG5XlRZRBZvPk0sR8vz3QJ1Q4BGTvjR6OEJO+BwpvLJUhFFg153HAYUlL31QPfTdIGKLVpnXIpYQQXoF/1WLalLircxWlq9PrvswrscFrwDiWARyIzXgEWF7Vbq9EKrmsROdrA8Arsxlv9PF4Gi9ZUpyIY1CLup3+rVK5D5CCNHXZgnKwn13pBr5zqf22/8aeQ0XClK5TTHuRAYHvGxfpTWowVwOMalJayOKqL4LIYHzoOl1nOqKepYrVUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYlxeCuUWQFVD2Lqd3WOg1K+vgoKT/PL3YrRM2td0dw=;
 b=nle9G64PJHQJLp7gIDPAecESI707bOG74BBAutpKk7aqLMzd5zLIMFqoyssejNDn9DcoOPYLSjS6HQ/jwLypPwtYTbmcoDY7lTDgu9GPy0wAt6WxEC08Zlozb/hFlur5dGIe4oZzEeRQROF+uwJebn/VppG33C7//1BgrI02hxo=
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
Subject: [PATCH v6 5/8] tools/xenstored: Use priv_domid for manual nodes and permission
Date: Fri, 15 Aug 2025 17:35:53 -0400
Message-ID: <20250815213556.90068-6-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815213556.90068-1-jason.andryuk@amd.com>
References: <20250815213556.90068-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|CYYPR12MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 099e23d6-1c01-4c69-d5b5-08dddc43b8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YR+BLkoi9Pv451Mb/gbtkoVPaxH2E1EJ9kWHGffGQC4LXzjaVwrNtNEtk8K6?=
 =?us-ascii?Q?AiAomoXtgSGWq3vwIAOAw98iTz21628Co1pBym+RKoDrVeyh/r0AaDqEDxX8?=
 =?us-ascii?Q?eoYSYw2IEU/MDY0JCev+is2owA8whyKc9mzxY14pEt/hcTh/X048F9enHxBN?=
 =?us-ascii?Q?klb5873KHNu0PAiI5jAC79QyWt2jypU3302qN7gFq36gaDbZCYtdWXCIy9Z0?=
 =?us-ascii?Q?oQLWqx4W0NrlFaAkN3TLoYZp/qmH/eGAGE1hE50fbLTVoabuf8Q6EsUdmCyX?=
 =?us-ascii?Q?gH84JEQga7xycZ6bFZlJfk3216APBj9KXFPKDseSgnueQx9dKqCIM2mtJTHT?=
 =?us-ascii?Q?UKsGNl9qA5wcA0Kz9NgDT9dkpWNurCbXTNudm65nYdyP20KOoOjcvypUTzS2?=
 =?us-ascii?Q?el4QwdMEjTkGgfmm6YYFuSo1Vpw5VWVsw+Lb6xN+hqV6weceiKaPPuGcFluQ?=
 =?us-ascii?Q?AM0OJ08eCf1qZcx3wGxXFYKJIUWVyvAs6U9wnkICYplEJsNxswybmNIAh6aD?=
 =?us-ascii?Q?OORxJeoQrvVin1C8iGM9H32bKoiFDSCp9P7pr1Mkp0P36Zo+HeyUmAQI7Qkk?=
 =?us-ascii?Q?JuGOVSYUBWlhzQZt67M3r7PFWRAkeTOpb3SD5DORylhG19pWPX3gH8aIreLU?=
 =?us-ascii?Q?rL745JHaVniFzpq/+QDV0GUiqOMd6n6TkAJ1wUI8CIfnHLzhD359njJAW7Ve?=
 =?us-ascii?Q?qBvdgJrzMXZhYM46a+yiWr/lODVTks1NSxJ/2Kp2MG6UvZn8T7kZMXhYBa2r?=
 =?us-ascii?Q?tn3O8sxRAvbxPqaQL5Yjz5PFN2COH+6G3JN9i2YZgqMRKGxEXNw2n8HltIhB?=
 =?us-ascii?Q?XX1eofBa2OdBpeMJ3KQMzIoiJ9AqkvmsA2zsRKnQrLFBFLnTBwG6oOpyNrBT?=
 =?us-ascii?Q?afSJHFfVz8971tn+vmqzJdSSXqFlRhC8WkEh9RDJFyrDHFkiM0Wh3Ydj6/lE?=
 =?us-ascii?Q?S6PMRg7YcesMNvUZCNTg1Hhy4PaBG7DVCJTe1yiLWj1ktWwERMeEjAzU8eNe?=
 =?us-ascii?Q?BMIPWx5raMjY/Tf6HSDk529rYP2g3MbbnCMcectbemm1uNLZRzsfBVstvAwF?=
 =?us-ascii?Q?E+0i+Nn7srH2JUanLe1yMPgW2emqPIhaveYJ2XEoUo30TD676ZL7Vr5bKsBQ?=
 =?us-ascii?Q?xrhmi8hjNQ9MsG8tJcmzdBmbrWo3p/hGTcUdE4FKrQogvfJ3v6n19zpL3bz1?=
 =?us-ascii?Q?UjhpN/jAv2h8vT1fHJYmwhU/nohTQs7BR2+vCYd7PiuoKMNN5uBQ098Te8oY?=
 =?us-ascii?Q?GHsMbRS1PDzk2AzNEC4O3GEOhgSjohjDVNtd8bbR//nWruHg3pS6RbwA9mYt?=
 =?us-ascii?Q?mv9z6EKVgV6e/9WIjuF7aP4mWNUMgETQqtw9D5VNxORmkPh6lBA6XmnDE6lK?=
 =?us-ascii?Q?OkBfMEDl2c7zAsfD+pAPGHJfhbleyBrYwve8NwOZ9R6SziTiWnfnQ2wtcflD?=
 =?us-ascii?Q?N0bhIXY/MQeI/MDrUj+cshvhqlIU2HJwj6yfubbyw8vJc2Lafx/t2tmjdut2?=
 =?us-ascii?Q?Kz2MB0gj3Sg2qNBW38QKlEhxTX6DohcaPOn7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:35:57.9614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 099e23d6-1c01-4c69-d5b5-08dddc43b8fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8732

Usually, priv_domid == dom0_domid == 0, and that is what is expected.
If we rename s/dom0_domid/store_domid/, it seems more likely we want to
actually have the priv_domid as the owner.

That leads to follow on changes to ensure that the priv_domid is created
first.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v5:
R-b Juergen
s/Local/Privileged/ in comment
---
 tools/xenstored/core.c   |  4 ++--
 tools/xenstored/domain.c | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index d447e1167e..7a65ddb585 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2269,7 +2269,7 @@ struct connection *get_connection_by_id(unsigned int conn_id)
 static void manual_node(const char *name, const char *child)
 {
 	struct node *node;
-	struct xs_permissions perms = { .id = dom0_domid,
+	struct xs_permissions perms = { .id = priv_domid,
 					.perms = XS_PERM_NONE };
 
 	node = talloc_zero(NULL, struct node);
@@ -2320,7 +2320,7 @@ void setup_structure(bool live_update)
 		manual_node("/tool/xenstored", NULL);
 		manual_node("@releaseDomain", NULL);
 		manual_node("@introduceDomain", NULL);
-		domain_nbentry_fix(dom0_domid, 5, true);
+		domain_nbentry_fix(priv_domid, 5, true);
 	}
 }
 
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index c74bafa165..bcc63104b7 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1026,7 +1026,7 @@ static struct domain *introduce_domain(const void *ctx,
 	struct domain *domain;
 	int rc;
 	struct xenstore_domain_interface *interface;
-	bool is_master_domain = (domid == xenbus_master_domid());
+	bool is_priv_domain = (domid == priv_domid);
 
 	domain = find_or_alloc_domain(ctx, domid);
 	if (!domain)
@@ -1051,13 +1051,13 @@ static struct domain *introduce_domain(const void *ctx,
 		if (!restore)
 			interface->server_features = domain->features;
 
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
@@ -1392,15 +1392,15 @@ void init_domains(void)
 		barf("Could not determine xenstore domid\n");
 
 	/*
-	 * Local domid must be first to setup structures for firing the special
-	 * watches.
+	 * Privileged domid must be first to setup structures for firing the
+	 * special watches.
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


