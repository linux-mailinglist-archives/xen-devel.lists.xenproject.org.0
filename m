Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04ACA7ED9C
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 21:41:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941057.1340667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sLB-0000zy-P6; Mon, 07 Apr 2025 19:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941057.1340667; Mon, 07 Apr 2025 19:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1sLB-0000wr-JG; Mon, 07 Apr 2025 19:41:05 +0000
Received: by outflank-mailman (input) for mailman id 941057;
 Mon, 07 Apr 2025 19:41:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tcrT=WZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u1sL9-0007y6-N1
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 19:41:03 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [2a01:111:f403:2418::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cb8d1ff-13e8-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 21:41:03 +0200 (CEST)
Received: from CH0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:610:b0::29)
 by PH7PR12MB6660.namprd12.prod.outlook.com (2603:10b6:510:212::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 19:40:59 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::9e) by CH0PR03CA0024.outlook.office365.com
 (2603:10b6:610:b0::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 19:40:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 19:40:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:40:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 14:40:56 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 14:40:55 -0500
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
X-Inumbo-ID: 3cb8d1ff-13e8-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3EXpgjQCOZX8w2FsUa28Be67Soix0WNzwbxJF5gaN7yl7A3d02N1eDo8YMl4rkLQqe2EhcBt8+jxuVrGaF7+ojTAUnhVWFdYrbeLYgvh4qBEsNIV6pkNBNCwtOGJaB9Y+Lteq0iCXgrRgg1jtelNHUT8R67O3zVlLdnfefTWXgH6039OmFX9/6B21U5rWluDVUY2jxKqf2XNxF9aFLQUSKYf9MXC4n+bAeWN6UYb5Q+YLJ0IHoz4J1CBCbxWKR2J/dcl8looH59Y1Kn+77F7E8M+7n34NYdv6DHHyrR7ohM1QGuowyoHeDRyEWgAe8bK7pWfBldEKe/uFmrMLKdJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aQHZqiuRYN5jscb9zg/LYDaYmQF1YrRq995L6yh9YI=;
 b=JKKtIzhxEn8HgwnrX7apScmn+Cnw8Zn9rbMR+Jq/F4dG2PzPVT0ywi5c/QmWd07qISPmtlok+u/GorZDWbwpkY5zn40fNR4ECMM1+2vGudC5BLAzjfweT2MGpcynXoq38XiCWWyB0jXM6s/CNkjKXXEF1n2lvRMzi3387bo6SwuuMINAdTxZVewVNCLCS19FlViDUmnc6gj8Zsav7fQM9W7862lhWcsPVF4aWsmZV7IlpOT9ZPATjejwapcWnBd0QLjG04DYf1kKvjQVU1OASg8/6W4gFRqzf8nx72fzwfjfp9Io4uIhfv5/AA1E13KJ4QUsU2u+/fVU61Wli6G1rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aQHZqiuRYN5jscb9zg/LYDaYmQF1YrRq995L6yh9YI=;
 b=zkBIfEsR2qeC02eAlEuGyMCxc1fPg8ptA+My/EHnNLvaOO0LfXDJrkPnzjHq+iJtWZE1cL9MePnprdIS3HaYEMkTCvOZ3eaiIFLdbUo5SBfzLia4AuTkt15rtT0MCqPwZsknicEid7hfoV13ne1QFoBZpitKvb2G/EGXrCxsnTg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 5/7] tools/init-dom0less: Only seed legacy xenstore grants
Date: Mon, 7 Apr 2025 15:40:36 -0400
Message-ID: <20250407194038.83860-6-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407194038.83860-1-jason.andryuk@amd.com>
References: <20250407194038.83860-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|PH7PR12MB6660:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df8e2bd-f073-448a-8073-08dd760c1ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jBhs6vB5GL6SxA8+N6YSRU4CB/CtlSfxz2BtuXaTyoqi3EIKq5H/L9jkZgWH?=
 =?us-ascii?Q?dOWi68VG7pjSMj+hvuTOq5gEFYhHqbvSaIKiAMgDyjyB9rsMbYF2Hq2LXJeJ?=
 =?us-ascii?Q?pmDHA5pkQ5pbhTTslJuR4Umya/l7TQhXuN8KxfmHzGQiEqVjzR8vlsrauku6?=
 =?us-ascii?Q?sBkrL/RJft3oCXSwpbfD3ilGt6vt7fnSM1B8jkqRCC6TLnuP/oFn7msenoed?=
 =?us-ascii?Q?ZMYdAjolUGFBSdjKoZiT+PoUiZamgQbnXuRtbQnSaXcyrGBYJYIo3QT3B4bl?=
 =?us-ascii?Q?hY4rPm45AlbHJFCTQl7CcnqH7KclWMA+QexJvsqHoz+jU3BeFTlezFAizB7G?=
 =?us-ascii?Q?lHOupQa9UjzC2+A5d0WUwZgnc2lpFSiH89PFHcBRjMbCqXqX2TR9RPrulTQn?=
 =?us-ascii?Q?SLZO9O2y7ncekJ7x1X6BNUDhkv9fBCAIAd6eorn1Lib5ayXuCZCfUJ9ETUOp?=
 =?us-ascii?Q?930hYM7B/QiciNp22cejDluPjyy4cPwbJ4Rxt25+1QdlGlq6Q6Q2B4/3phOQ?=
 =?us-ascii?Q?XE2mgd75eihjxRd5mqyNqgjQRhsPWz/p4JtYEpzrIADl2a7b0OkjO+QB/+r9?=
 =?us-ascii?Q?4NepUPLztBVa/JocZCJLHXWjVtP/OSlQPWuRX7+WqRGGMWhNtjCxpclakosF?=
 =?us-ascii?Q?d+JqsyoR91gQtowfGx+U5jAai3bPgpTYd9y9cywPxeVfiBafNuSH0BV+B42G?=
 =?us-ascii?Q?ez58/FywYrxyyLnHvDE4jPgmVVgx3a1cTCUbdUI5mSUvpjimqRlFxJpDT/sz?=
 =?us-ascii?Q?/5hdXHgiXvBUXoRT0tSEPOftvWPANQXWv18iZzNVp5eeQGJeS/cpCgS9/OxK?=
 =?us-ascii?Q?EL1J+ooYC+7b1ocopqz8OK+slzL9CUyFsc0BIrNqC7z8qoKlDJKFmF3xDxFY?=
 =?us-ascii?Q?Tb98LmMK2izNhLJxRMG3Owk5jxVt4gXKpM7rc6DzMtWqMi85VHKeUXVv3ulB?=
 =?us-ascii?Q?tp2Yyar784N6sn21vU3z4X9EW0PxMRad8DPtMVrCq+//ijnn1wiZ10WRqq+a?=
 =?us-ascii?Q?cpxznIxonRNe5x+oQ39RvmzsWd1MrQPSkX+OZqQtwc73UcYIr0r6P7JfKY+X?=
 =?us-ascii?Q?iwF8qeQmkCIC5yFkWHosnpR0DI9z6jJmTMbdyFLJQd+0ho5Z5NYNlCMk0ojM?=
 =?us-ascii?Q?Vd7YTLSnOJ2rVndww+xv+T+3fFjtYXpWD++9Kfd+clj3b/jImzc9AR94vKQ4?=
 =?us-ascii?Q?qXCAIYliBpTA8ifjfKFi7yeV2Ji8bm2pynENRKauXzCIfKx4stI7FEXnbjOl?=
 =?us-ascii?Q?rrHZGQP1nl5Wqv1v4rYwWq9UnwpqOBbsz48j+73Oe/Jtn2lebsRit/D4JuS7?=
 =?us-ascii?Q?zqxAxRRcpD+SUO1CdkUBnezxZkutwK24AHo2lvXIa0/LQjuFA2k6jiQt+CdQ?=
 =?us-ascii?Q?NSSnvla1u4PEM1g6voLcwi4bawyU6qXgVSd3hL1aLQMK+0b9nhq7JFpgfOOj?=
 =?us-ascii?Q?bHXsW35t6YACC1bwbQ+7iBkNFsd93ILdnuY45DPcb4r3tlX4lM8/Gdx+777d?=
 =?us-ascii?Q?SG5q6U0A7vqQ+anyQ996gxyopGmE4piac80U?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:40:58.4469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df8e2bd-f073-448a-8073-08dd760c1ed4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6660

The hardware domain is unable to seed a control domain, but we want the
control domain to use xenstore.  Rely on the hypervisor to seed dom0less
grant table entries for Xenstore, so this seeding is unnecessary.

However, that only works for the new xenstore late init.  The legacy
protocol which uses init-dom0less to populate the page still needs to
seed the grant.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v4:
Add Stefano R-b
---
 tools/helpers/init-dom0less.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 17579fe2e8..91edf17b6c 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -286,12 +286,12 @@ static int init_domain(struct xs_handle *xsh,
                 xenstore_pfn);
         if (rc < 0)
             return rc;
-    }
 
-    rc = xc_dom_gnttab_seed(xch, info->domid, true,
-                            (xen_pfn_t)-1, xenstore_pfn, 0, 0);
-    if (rc)
-        err(1, "xc_dom_gnttab_seed");
+        rc = xc_dom_gnttab_seed(xch, info->domid, true,
+                                (xen_pfn_t)-1, xenstore_pfn, 0, 0);
+        if (rc)
+               err(1, "xc_dom_gnttab_seed");
+    }
 
     libxl_uuid_generate(&uuid);
     xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
-- 
2.49.0


