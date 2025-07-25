Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F78FB127BD
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058728.1426299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSKL-0001S8-0C; Fri, 25 Jul 2025 23:59:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058728.1426299; Fri, 25 Jul 2025 23:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSKK-0001MC-QH; Fri, 25 Jul 2025 23:59:48 +0000
Received: by outflank-mailman (input) for mailman id 1058728;
 Fri, 25 Jul 2025 23:59:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSKI-0007YZ-Bo
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:59:46 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2414::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f83f209-69b3-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 01:59:44 +0200 (CEST)
Received: from BY5PR17CA0048.namprd17.prod.outlook.com (2603:10b6:a03:167::25)
 by LV8PR12MB9667.namprd12.prod.outlook.com (2603:10b6:408:297::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 23:59:41 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::88) by BY5PR17CA0048.outlook.office365.com
 (2603:10b6:a03:167::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.24 via Frontend Transport; Fri,
 25 Jul 2025 23:59:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:59:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:39 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:59:39 -0500
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
X-Inumbo-ID: 6f83f209-69b3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQj3mm8BEdYL2oHmAC31tzW/DHBd0P/7xheiqZpKHSMlf9rBU5PIC6eToqahPDWX43N0MQVJ2naG+406ZmKQS/eXqDJtaXc9mz4dgo89dbVfsbk7JN8pZuk50z2EyYkoZpD0sEsjNmLPZLKUQ5Ft8A5oXzj0HGqnDJ4tkkGjUg28NguCtNRDNI3GIbBuekC8n46kvMYJTypfxSGwdHL2ZzKyykumMlToi1sQtZQqa7/keIobUGfBjlWu852WDDZ3mxfXM5y7EavQ0RXG1BrzLy2dbgB1QNy4pFzvBlTivIzQtSg4b+T/m1p0K9VvWSBjYUwcngBQHgLt2njlaqiwFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+kKFCNFyptcpiw4lFRKhcWH6qMRw/y7Ho+2rz52PFhI=;
 b=t81fjirudYbHdSnlZwUGZ7GYxPcebSHm4ad1ZaN2rk+8TWzcEhpmCY1UvNcitO8HkhqG/mVbwAjONpp3BlENy7xef4PVxRbYPJOiTXiI61ewYxQT0xebCpdB4llM+SNUQ83oB/Xq21GTphUVsSP2CkgG9YTAmF+z88bUcpCPSCk2EVp6+hNLxOEBBC78k0xmzKkxTLMUyAgkXsMy4PoCFBLjjdgbc1eF/OfccqTHd8tY4wkh27FgSwHWB0eDS6CrWDHPW3TqiuvmHnopbBKmjvYbOI17HUhABTWmF9yxbm6Z9pclPWj79klNRjRA1ZzTnIwwvrthUjwZ40X3iBgsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kKFCNFyptcpiw4lFRKhcWH6qMRw/y7Ho+2rz52PFhI=;
 b=KenbhnwM12CO+HGyPpnCgD9WY9mW41SZIqo6qnkGZvgiRtGRvIW6oFYqlr64ITcTIVgaMjnXqeLFShaSE180mLaBM7NAWev31HhygObxxmVIjAlTDa1grAiDnCOhOu52SpZrdIHQHs80pSwNSZyXghMHDIXqbwarUFa0AMq2y8Q=
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
Subject: [PATCH v5 10/11] tools/xenstored: Remove stubdom special casing
Date: Fri, 25 Jul 2025 19:58:57 -0400
Message-ID: <20250725235858.666813-11-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725235858.666813-1-jason.andryuk@amd.com>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|LV8PR12MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: e97f2bb1-92f8-44b6-b38e-08ddcbd751b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dTlWUGdn3kQuYDC3skqlNQ2ru6kG0INi4rLkW36n2Yxe4TVHTXbGf/FQYLrE?=
 =?us-ascii?Q?TnMrdQZ05TQhtfdxOlBgp/NkltBXs51d0cklyUepYu+MBuAPDyMLetIGa6Pv?=
 =?us-ascii?Q?ZUyh4dO/gHpJb5+AlJxwC23BlT6bxHfboxH398NEujXl9rYq2gR2Mm7Ms7E0?=
 =?us-ascii?Q?rEPWFdi1qoVfEIHTS1StUMx2v221zDObb4BxeqZy4QXhPiNXqayLCOwg688n?=
 =?us-ascii?Q?gJEVelUt0GMX6LzMcgzbAxxplGxsc5NTHZcSyr9PhSdcp/R2AaHHYPMOsFqU?=
 =?us-ascii?Q?OBN+jJ90SBWy5fXtzzufaVJP1WQYMP8g1LNWCKZeWjaYBt2zxon6pQ1QnG0T?=
 =?us-ascii?Q?S7KlR5Qhul+Ei6boMcGVRZ3MRfSuGNQbXegc3zMxItdVW7yMoCGRz3Gbez/1?=
 =?us-ascii?Q?n5IF5k9ySpMRdIfdJhM0ZQ4w43o6yX+U6M18Q2CUuT6KA3itO4rEtY7PnIEA?=
 =?us-ascii?Q?aN4VlcUCVU90cp1glhIUD70troLbPt5ovSSA75OPlBOZ4KyOGdCHsDmTlFEx?=
 =?us-ascii?Q?/6Y1kSR5kcLry3ZckcKeIr5/wIeJhoqpgoSuP2aLl9Yw+i9FJXzJE3rtrD0j?=
 =?us-ascii?Q?p7k6xduPQONB7kZ1Dr7RZndMDb7jSFuhVuJ9Z0ekLJpweDCgatZb7zS97yV5?=
 =?us-ascii?Q?JmJkX58aCKhmxgLeUAn/QmOeGBvclBIWpbJAplfARekOTP4ce4AOKZz3kCyr?=
 =?us-ascii?Q?QSVhqvH7CZyrW0SeheP/6u4DhLjVcKPPhcBtiT6cxgrsBobN2d67l9rP9Rta?=
 =?us-ascii?Q?yCsNYs9l/ByKMB+QQtO67W6RxUN2KRsb45zXTYbbc/0XxJUCy+WO+Twt+hlZ?=
 =?us-ascii?Q?IYVcwRZo8sblDR8ORKNYZRjVOc9sSlR5olJeFP5zkJjn7YrV0sfFdm7/nrEH?=
 =?us-ascii?Q?U+iLMWUhpypnOP6hwbHSf51Bnv029E2mMIiGxa3gaPjGlPowVqF9gUd+WzM9?=
 =?us-ascii?Q?4hEQFA2wI9VxysncQ/wTizST6WAS+CdQn0kW77n7hkotyneND5qnBRsEKsVx?=
 =?us-ascii?Q?Rb+Yadc1I7a4YAMN8WmnKFPPVRBs6ESbiHsUmh6I7Yx8Z5dwzCwEkQTxxbOK?=
 =?us-ascii?Q?47po2QlhpukBxBmg+3nnFEryXpYUgfbBgAm6td3bsQlcr07tQwpCsuPen0wZ?=
 =?us-ascii?Q?z3Y0ImyTU9RIRdor779pvX0enFknTC+c4s3s2eXCycZIrYMCzfpcJa9kPhJI?=
 =?us-ascii?Q?ntv6hmVgPC2Hz/G+o9/w5G1pV0elc5CoS7wLEf1hjodxcotywVCMa6Cey4qw?=
 =?us-ascii?Q?DyACuolrhDL9pJl1nzzZ47z52wfUz1CTKvRdkZ/4B8EZUzU+Ut62iUZPrR0b?=
 =?us-ascii?Q?StF8JeVpy16/Sb5Cjwco9A6AGGqiuZ4BnTgkjaWab8AWrHoeHuMI+4226pun?=
 =?us-ascii?Q?X+b0CapTgEHCZnM65y41KTs7sVOLH3eQ3Ooe4j7IIG2Ja42DBAcDRrVI4qnN?=
 =?us-ascii?Q?7lWDE0w+BCbd9UvNwf2/yiER6PvvtfAW72PUVONkIv0k1w17u/tn7Wjni3dW?=
 =?us-ascii?Q?y5A4XNCm7UpU65D0c4kKcqbx33FxtI+CwdLY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:59:40.4408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e97f2bb1-92f8-44b6-b38e-08ddcbd751b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9667

posix.c and minios.c implement the same named functions serving slightly
different purposes.

For xenbus_map()
posix.c maps the local /dev/xen/xsd_kva
minios.c maps dom0 via grant and there is open coding for stub_domid in
map_interface.

Change xenbus_map() to map the local domain's interface.  The default
grant table mapping is performed otherwise.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v5:
Re-order later
---
 tools/xenstored/domain.c | 5 -----
 tools/xenstored/minios.c | 4 +---
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 2f79db26df..be8dd19eb8 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -506,11 +506,6 @@ static void *map_interface(domid_t domid)
 	if (domid == store_domid)
 		return xenbus_map();
 
-#ifdef __MINIOS__
-	if (domid == stub_domid)
-		return xenstore_buf;
-#endif
-
 	return xengnttab_map_grant_ref(*xgt_handle, domid,
 				       GNTTAB_RESERVED_XENSTORE,
 				       PROT_READ|PROT_WRITE);
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index a86edbd5c8..54230796b5 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -61,13 +61,11 @@ evtchn_port_t get_domain_evtchn(unsigned int domid)
 
 void *xenbus_map(void)
 {
-	return xengnttab_map_grant_ref(*xgt_handle, xenbus_master_domid(),
-			GNTTAB_RESERVED_XENSTORE, PROT_READ|PROT_WRITE);
+	return xenstore_buf;
 }
 
 void unmap_xenbus(void *interface)
 {
-	xengnttab_unmap(*xgt_handle, interface, 1);
 }
 
 void early_init(bool live_update, bool dofork, const char *pidfile)
-- 
2.50.1


