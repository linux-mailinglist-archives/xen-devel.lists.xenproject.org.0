Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BF4B07F80
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045790.1416109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aN-0002sf-W4; Wed, 16 Jul 2025 21:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045790.1416109; Wed, 16 Jul 2025 21:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aN-0002W4-72; Wed, 16 Jul 2025 21:22:43 +0000
Received: by outflank-mailman (input) for mailman id 1045790;
 Wed, 16 Jul 2025 21:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aG-0007F2-VL
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:36 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [2a01:111:f403:2413::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fad9978f-628a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 23:22:31 +0200 (CEST)
Received: from DM6PR03CA0091.namprd03.prod.outlook.com (2603:10b6:5:333::24)
 by SJ2PR12MB8875.namprd12.prod.outlook.com (2603:10b6:a03:543::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 21:22:25 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:333:cafe::a7) by DM6PR03CA0091.outlook.office365.com
 (2603:10b6:5:333::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.19 via Frontend Transport; Wed,
 16 Jul 2025 21:22:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:21 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:21 -0500
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
X-Inumbo-ID: fad9978f-628a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLQ1BshmjSsrbPEJYkFFZDyajgi2LWH0vrVlFu+IT0bttlin8Encycsw4bhMT/v8LSApaPmPQ9ul5EC1Jq/l4gIYW+VpaAaSRcpdCnWMLHy1UHjEbEYqCxVXA9wuwpUYb10PHjkVrYSOpEkE1y0TRD8ZR7JUCcb5+2p1Q2gOgWpa5CmWIb5ADRs1yQM/JMRJ7iU0rwDfOtSDOTyRPNaoygjP/Zax8mRoa76sWWm3RKqYOcODFn/ymW79FToMXsuffYrygrUt4ESLEf3eYMOWMY4UePT+u8i7E6cr6vuMIzb505AwLcXBH9N2RvcuKGmguxiNH2whdJyV+GYJDF8HdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97KUf7mPxnlBQ7FNs7Dg1VDm2iUHMnZSy61+ihwrWT4=;
 b=I6yx2TUMorJq8FTGnuBMyEGrCAZy56Bm0aENtsk9FQnWMq5xivrHLH61Sd57xvGS5Lcp21Qho0BiHTCo0B57V6ndymeLLz6DfnaV9nmcscBRNE+U0isVz/K0THA8jdXp0botvXtFWLoeA1w+59H403CfqDlpLOHG+7sGCovat+5jOpY0bJqxNIly+ZwuGS7MBE4nZTbFM6pm8I/hT7V3HlELu+gCVInvg53oxHEXmU3s9qPOW50QdKn7pmoxpEvMJeN+rFBQr6CRtn+YF6wEPKXyQwVZzQS16ijEvi5G1/O9f4472nHD7UlqgUyc9/GtusRUi0pW2jW/zJQWBSC3qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97KUf7mPxnlBQ7FNs7Dg1VDm2iUHMnZSy61+ihwrWT4=;
 b=Kzup2kg7QffOl3hq+hHApTP29pM7rz0S5BI8uhhncbOc6a+6h+vsq09zOkDJaEDuf/+JcKMwklPCSAN0Gb8UoU00qmiji0KA+TolPKm7iY0cgrHzRbYGvuubJ5H4kytSB78+nmU/0OFMc3z1Je4Bk9LDTSA8WqzF6UjYMuRCsQs=
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
Subject: [PATCH v2 13/17] tools/xenstored: Delay firing special watches
Date: Wed, 16 Jul 2025 17:15:00 -0400
Message-ID: <20250716211504.291104-14-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|SJ2PR12MB8875:EE_
X-MS-Office365-Filtering-Correlation-Id: bae8fb9c-d551-4038-277f-08ddc4aedbf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E6UgghSZ8HpkCblTl02V3t4D8Vdxs4Z+T3Epau7LKSTiGKY4mLC3zIsv3Mft?=
 =?us-ascii?Q?KTi450ZukX7ClUIGxXaP9PW9IkxfGEmuIV3JIkutMe6TAARO5nPKiDINbH9b?=
 =?us-ascii?Q?6CgZXsDC1K2LP/pJTNMC27FvLQWNuA0tHG/PDAU7T8z438rQr8YPDPfdylEH?=
 =?us-ascii?Q?YgpeQ8RiBBGLDT6sWdOdvxAfw2jTfpgqfBU8Q2uHp90BSnGsClXJzQnQ1uJ8?=
 =?us-ascii?Q?el7CJeV12Q6GyJAiyH1Jlya0TKwIX1my9qcJ2c7wS77XySP93zv2c/4rsuUN?=
 =?us-ascii?Q?Jt0Jno7SXPTG5EHhHhVetYyGtRBT67BbpNboDEO1T2RU0AitA+wXRO13jlC8?=
 =?us-ascii?Q?p9ukI0Y3H6ndiGc38sm6rmpHz5kaVXNOZNN+ULY2HSRNZPBsA2FBErkYPwgG?=
 =?us-ascii?Q?Fg4cDM+z1O+xQR/JqCVBd8mzZinbyItA6k/DVD9MGjzJaU42yuTlnNryQ9gN?=
 =?us-ascii?Q?RxrzhwfDu0t8Iz2itQyWQVqYCripcIVNVTWLOHdlK8SGt19ayXWLmdhcIymp?=
 =?us-ascii?Q?ieg5tu7P5vDAxhoyayevfv2UWxe/SnXKtRjxwyfE8ZNKuDAx/2ttUn3Vp8Ba?=
 =?us-ascii?Q?uhNeXEZCaBsZogLiXWiwbxDYFh0w8gwZJu9/PSB9B7JkOnl17aN1bc6Kzeb2?=
 =?us-ascii?Q?urzZWmg6yzHKeaFzqHtYMmbkh5v7yOPY6ru5DfY5ok62mxQpHx+guftOJRhf?=
 =?us-ascii?Q?OA5AWu+08zCPB7C4adEmN2U9YAAQZ48YX1qdVXFFpQFPQp1yodstqKHnyXDS?=
 =?us-ascii?Q?wbnf1/VJESizLXvaBAZcuEEn/9pYdJlxuGLjXNZXIwrmzNXmKTioEAahTrjw?=
 =?us-ascii?Q?8CzQtFJSiJ4FL24cO6glwD+Ij9ZTMiVG/h4RS/h/mXmIm2Bj/RgAzLttrJNN?=
 =?us-ascii?Q?gKUAqlqXywvtzFoydp/DjaYYPnlRPFalX54vglj5ZWgldoTTfxpmXbnzCEE5?=
 =?us-ascii?Q?5gp2Yz6nFPGudPto7b2zZGtHsZrusrQMfwWP2gVzFizsWdZbV0egyRspjfhO?=
 =?us-ascii?Q?zPGKLImIEB9kYXV6yoj9qfKVzmbl2m22r89FMpOAHYx0oOviVnBy+jNuHyd8?=
 =?us-ascii?Q?u2bNFI/aaCnEVWiytcczO/Hp8t+VAhWajCkW69nbFtL8xf+ypuRS4O3F7dgI?=
 =?us-ascii?Q?WLWk5lU0iGnznZclHf1hjuS0tY60glzzpRDmDx+KZ5awRs9FpX8i+VQTi1YA?=
 =?us-ascii?Q?Xw0VbJKTGmddADT/z4ip3x2u1sb5M2QxS4VzlkZetTdVJTziW6FVgus++So2?=
 =?us-ascii?Q?4/oV+0MD22Kt7qfcXUtP73MFtsjkpa6u66j6b8p8tf9BDIpLkUqJIgz/Ookt?=
 =?us-ascii?Q?+ZIThFjHYn9moNbfkxFi0/co3bBVkdqHxmKLOCWpotfbH1TVy46sWm3HzqDO?=
 =?us-ascii?Q?mVla3r034GdoLn0byEF/xuhqaTeOYafym9nB4fyR4R26dho9WbCrN2T/XwWf?=
 =?us-ascii?Q?4P6Fs/+uFJs2fgzb1ZIlltZ4yRgvHKcl/PKaCNCBhX0dC24Mi2mKn3ba9xHd?=
 =?us-ascii?Q?bgCX4vtDP2oENpn2/kKRkLxLCVEW8zkAJm83?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:24.9114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bae8fb9c-d551-4038-277f-08ddc4aedbf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8875

fire_special_watches() can only be called after setup_structure() has
been called.  If it is called before setup_structure(), the hashtable
search will segfault as the nodes hashtable has not been allocated.

Normally, dom0 is setup up first and setup_structure() runs before any
other domain.

If we iterate xenmanage_poll_changed_domain() to discover domains, there
is no guarantee the local domain running xenstored will be created
first.  Suppress firing special watches until the hashtable has been
allocated.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
With a known domid, xenstored could construct that first and the iterate
skipping itself.
---
 tools/xenstored/core.c   | 5 +++++
 tools/xenstored/core.h   | 1 +
 tools/xenstored/domain.c | 6 +++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index 37e4dd5a5b..550e879a00 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -2321,6 +2321,11 @@ void setup_structure(bool live_update)
 	}
 }
 
+bool setup_structure_complete(void)
+{
+	return nodes != NULL;
+}
+
 int remember_string(struct hashtable *hash, const char *str)
 {
 	char *k = talloc_strdup(NULL, str);
diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index 632886cecf..3fe80f7c66 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -301,6 +301,7 @@ const struct node *read_node_const(struct connection *conn, const void *ctx,
 int rm_node(struct connection *conn, const void *ctx, const char *name);
 
 void setup_structure(bool live_update);
+bool setup_structure_complete(void);
 struct connection *new_connection(const struct interface_funcs *funcs);
 struct connection *add_socket_connection(int fd);
 struct connection *get_connection_by_id(unsigned int conn_id);
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index d2b6fffa62..5443b4e608 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -579,9 +579,13 @@ static void domain_tree_remove(struct domain *domain)
 
 static void fire_special_watches(const char *name)
 {
-	void *ctx = talloc_new(NULL);
+	void *ctx;
 	const struct node *node;
 
+	if (!setup_structure_complete())
+		return;
+
+	ctx = talloc_new(NULL);
 	if (!ctx)
 		return;
 
-- 
2.50.0


