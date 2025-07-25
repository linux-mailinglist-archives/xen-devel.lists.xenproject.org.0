Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8A1B11678
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056883.1424933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Cv-0006rr-7y; Fri, 25 Jul 2025 02:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056883.1424933; Fri, 25 Jul 2025 02:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Cv-0006pW-3V; Fri, 25 Jul 2025 02:30:49 +0000
Received: by outflank-mailman (input) for mailman id 1056883;
 Fri, 25 Jul 2025 02:30:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8Au-0000gX-T7
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:44 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20620.outbound.protection.outlook.com
 [2a01:111:f403:2416::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 149f716a-68ff-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 04:28:42 +0200 (CEST)
Received: from BL1PR13CA0028.namprd13.prod.outlook.com (2603:10b6:208:256::33)
 by DS0PR12MB6464.namprd12.prod.outlook.com (2603:10b6:8:c4::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Fri, 25 Jul 2025 02:28:38 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::94) by BL1PR13CA0028.outlook.office365.com
 (2603:10b6:208:256::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.6 via Frontend Transport; Fri,
 25 Jul 2025 02:28:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:36 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:36 -0500
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
X-Inumbo-ID: 149f716a-68ff-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlvwsQ+5SuwL3xlYTH50vXRP3ELsRtkrZXfykGQ4AJkRe6yL/ioI3B2UZCBPuFMof3RMJ6GVws0xyLXOxuz6S+C4AxmoC2HlTmjFT6KhhHL2Kx2a6oWDemylWxN8zvCov6d8pyCixwEl0HRQcYauDjdXsi0WUGjj7pu3LPMEnr34hV9I48mVG2WQ4D8xCGVCCtSVM82v1r+lKlMIeWgYWLejAdIWvlfk78LwMLGWIUw9bavxxkAxcvMm3UckdkrJryQ2UfvagumB7z9hvjOo36OSDN4ZZPamfiXVsTQ96zpd4ZxgaZ6gtk744F/dEH5dgKTZcSVwPCnZftZSmEAweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXAy8+XrxvcI4+I3pip5hEDLU6VX5kM2jBwL5ALEmE8=;
 b=dqs6PfvMAxpRhBufOZ7oKmzJAG7hwYUBaQ12SFF0POH91Shz55HgSjgkgsLRRFpgMnuGKAg5rJDwazF4PZ3oxn6yR846yS3TdYsfR6ZJ6369yu6nWBgVO08gLJu7fXIwKIfesEuW9k55L3iq+GaoB4FBcbf4kPUCWyzVBRGuGcP9n0gWW9yC+FZxojeQrtFqu8oxiVzh/32zq1zGbDfMkFCeN5b41rwLxNbe2OzP5oa0oecPJTEfIBznt4u1z7CEfKT7OMLzEkT9LYqJWVuJfHrQMGb7SE/53fJvnk6TqR+wS+J85qmJULMFObvKnyeQ2Ayll0b0wvKcGlBBZSnfag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXAy8+XrxvcI4+I3pip5hEDLU6VX5kM2jBwL5ALEmE8=;
 b=Q3LLKSUrMRIJdGZ0LMaxIJKD2gnh2V5XnRzuUAFUBJMKSPc8+C2GWCHJiS5akIxDQ1lsiKoPA8nzJNVdora7hC//tuNjTf+LFkNrZ4lBb5qJ7Wiq0pU6KndUMpwG0qDBUATF8l4PZBDgOGiqNhHmaCoZTeMgOfombu42LzXZPv0=
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
Subject: [PATCH v4 12/12] tools/xenstored: Remove hardcoded implicit path
Date: Thu, 24 Jul 2025 22:28:12 -0400
Message-ID: <20250725022812.466897-13-jason.andryuk@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|DS0PR12MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e31e40-50dc-430c-e4cf-08ddcb22f629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?snwcDH2Q50IwDMWmBdsJu5DRTX7LQonk+bUmPj95DNrAHXnO4etiZy0ZFCpr?=
 =?us-ascii?Q?i1iyDmWkz3mXl92XEZISXoUZPcTO9gKZgORTEfL8xf5tCLbjKgtlGsX4WOV7?=
 =?us-ascii?Q?4VoXF0KDfFOOE8aLdi+ZaIH7vtkFWFfukjwBgxdBmN1zIAjklglnhoQ1oJEF?=
 =?us-ascii?Q?SkIZL/M9FIUliyNECTXMbee5uHO8odwwaSVJx5/x6JfI5Jdtj9zUnxyS7mNf?=
 =?us-ascii?Q?faolTXfYwRekt37kXdP338AiwqhFYn4jHOm11zh8iqUeJa6klpbYTN3BXlJq?=
 =?us-ascii?Q?Jvgq1B8JnjqVTi4x7THEco2sbrsZS/kAHe3FXJBft7O8VjpwMLCRFv2IQhFv?=
 =?us-ascii?Q?YNZBvG+m5DoKbSA/wtSDjp7+gGnF5maP3cw74iVv0LalfHtPF5Si3cnw67yy?=
 =?us-ascii?Q?YahU66Pn6JD5YfwI/bJ2z2P7Aj9CUEiB5rjvXl2rLEXq5rq+bUy05n1PSvJJ?=
 =?us-ascii?Q?r7eGFrhE4da6CgPi1NAvY9OHMUuw7UkGmBGYkFlbiBW3m60GwjzNv/f4ixgZ?=
 =?us-ascii?Q?vjYjd260Zl63OtQMD0m0q9qOLrfQoA6YZPjrMDKDCNAXc9/r5+4fzNAY1MO4?=
 =?us-ascii?Q?H+gb270x69Ev9jFyg4iyIYc59S8xRMqMADiGQQYUZD1kB2LBTq0iKPYRJUP4?=
 =?us-ascii?Q?YEUhuRzfF4YGUPOWxn/H66tzbSYDbHSt6DnzGJ+gqRq+yngE0InO9dYwuExQ?=
 =?us-ascii?Q?Lo3QzySQpTVGYEoSXp9zQJv8r0EbDOG7kSoQH0cDeEBZG/FOupLY3SMlrxWX?=
 =?us-ascii?Q?7/Byrb2uS2p84GYdoCNmBwU6Jz+cza/FmWehZQRZlDXz2GGstx8dgAdw+iht?=
 =?us-ascii?Q?7C8BhPm/8qh45gde9kKKj3BbYqqi4N26y2RCT23wVUrNBzQkshhXrti2SARJ?=
 =?us-ascii?Q?F5DHeRY0/lXbJGSIJhv2/FZA3X69yhzoJC9cF52LJB0+WY6F9PsemmvESDza?=
 =?us-ascii?Q?WOKGuYg+Nnv8DLMWJRfjflDMkBDTYgLW3+UaG6oORR35fAofsBi26gB9/0NH?=
 =?us-ascii?Q?A/wfqwFc3ib3Jz8gqa+3ni9nIP2T6EHOIGibrfbPHyxmUn2i/8lB7cZ28QAK?=
 =?us-ascii?Q?1j46YAmb3Cn1ty43msqlpsAqkPwD31Alphr7lwJR+Ashumsbj5r1iwNpWqYn?=
 =?us-ascii?Q?rLG1XVHr67zoLULyX45c9nT/oiIBVc/3PM6mRu+ta+ZLZEkdPPGbT2LeTyvB?=
 =?us-ascii?Q?WtrcH1PYKHuB7r/SCYFNemAVa4eH+roBfTAo2Odu43ulup1UgxWz4s6RC8vG?=
 =?us-ascii?Q?01AlRIusEtfUIADkW3xfjVDY7ZRILRUtED7eniVcyoEk6IoICpdDcGEAU2FX?=
 =?us-ascii?Q?zXIQ87etOXmHFCLzkLDWfHNTjmeeVRn/biGVB0x2oLP0YwS0wFPScDw6Tw0L?=
 =?us-ascii?Q?uYmUgwh1JWgG5PrjoaUIhIaQCSwZ0d0TNHUQQeLY3QgJsltZeOLfM5OYozZM?=
 =?us-ascii?Q?nQbOYnAMsGgK9zbFKXC5S06qu8wgJDseXX8jz9GjkxviFGy6Kpo92mFYxFW7?=
 =?us-ascii?Q?+KePlGsGXiiPHhZwtJiQL5e3Cf6r5Yv8W9xu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:37.5294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e31e40-50dc-430c-e4cf-08ddcb22f629
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6464

Update get_implicit_path to return the correct value for a non-dom0
xenstored domain.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/domain.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index f1527a6db7..ae59b6e60b 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1238,11 +1238,13 @@ static int close_xgt_handle(void *_handle)
 	return 0;
 }
 
+static char store_domain_path[] = "/local/domain/65535";
+
 /* Returns the implicit path of a connection (only domains have this) */
 const char *get_implicit_path(const struct connection *conn)
 {
 	if (!conn->domain)
-		return "/local/domain/0";
+		return store_domain_path;
 	return conn->domain->path;
 }
 
@@ -1309,6 +1311,9 @@ void init_domains(void)
 		}
 	}
 
+	snprintf(store_domain_path, sizeof(store_domain_path),
+		 "/local/domain/%u", store_domid);
+
 	for (unsigned int i = 0; i < nr_domids; i++) {
 		evtchn_port_t port;
 		struct domain *domain;
-- 
2.50.1


