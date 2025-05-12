Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FDBAB4810
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 01:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982263.1368812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEcz3-0002TQ-Cf; Mon, 12 May 2025 23:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982263.1368812; Mon, 12 May 2025 23:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEcz3-0002RO-9q; Mon, 12 May 2025 23:54:57 +0000
Received: by outflank-mailman (input) for mailman id 982263;
 Mon, 12 May 2025 23:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNBB=X4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uEcz1-0002Bc-Bl
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 23:54:55 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2408::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f842323-2f8c-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 01:54:53 +0200 (CEST)
Received: from MN2PR14CA0022.namprd14.prod.outlook.com (2603:10b6:208:23e::27)
 by LV3PR12MB9118.namprd12.prod.outlook.com (2603:10b6:408:1a1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 23:54:47 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::fe) by MN2PR14CA0022.outlook.office365.com
 (2603:10b6:208:23e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Mon,
 12 May 2025 23:54:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 23:54:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 18:54:46 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 May 2025 18:54:46 -0500
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
X-Inumbo-ID: 7f842323-2f8c-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yztJB1E6jZtmrOVY5I9VlUcAvwXGM0A7lXTky+QTTmZIrgbDMeib+qw60oT2N0GTZNCpByPVehWh71k1OmRuJ7FwvrgH/0B2Bvy4fByeY2h6FPi4YxJ6GNhjEc/Wk+U7aoZgjl3mtyuAY/UTSNMoRDli/SrzGK+F/9uWdHjauxJKU+ooXNivoR0bu5274kn0+C15dRzUl7lIwZctfe9xkwuZKUNCXRs8oREXN1GgEky5o6oouj3DoW4id8BVjzPK7vfbMMpa7rOdAvrB/u6F49pjCHy8qkIWJ0aydbh7koHNBte13hy+kD1SM/vR+F4XUI1eB43wurmgDIAvx4DKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FWzImoHZtUsaD5LYTagTZgAmQYYnBWuK5k+u1fuPZEk=;
 b=emkViMz0FXpc9yv29gMaMtu7f/xValj61OAV1jfjvOuWBL6i27yYXnhW8ASx1+HZt+qcIBvUVF7BspiQVwmc3GY8TOmJCeBqrKSI5t7EB76IAUOqrqRIIXAMghuZ82ZmQhaDBNvr3CelgIsmlh+6kCaoA/vaairq1rsZF+2TeK8eHJDUASYBzKg8a98LjGXDjQ//x7uL/emUOCAojPS4OjFFdKBpH+8G9vvPRsmfFIIvRdrJf7U1nMmgGkibAPqhYobhX4R2+UrPFGfR0somPozXubmkhHcltURAwic94jvWRWhrPBUIxfaDleSoQ2dnZXdzp+OwhmnjUySawQMPTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWzImoHZtUsaD5LYTagTZgAmQYYnBWuK5k+u1fuPZEk=;
 b=40BFBm+DmCPn1SuHqLNGJPYq+jaOrI+v8UQDXLWXdEEsmglvF5UXvu8/UrR7LtrREEEvjbdb6CFLv/aMymnF7ppfd6yqdP0RQttOIe8sAMTyEDF86UmV0o9584/gC1zHOrMKqJa/ox0cQB4L4zhP6aL4SGamsw4a4xdVn/vU/S4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libxl: Only read legacy altp2m on HVM
Date: Mon, 12 May 2025 19:54:08 -0400
Message-ID: <20250512235409.18545-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512235409.18545-1-jason.andryuk@amd.com>
References: <20250512235409.18545-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|LV3PR12MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: 1348f7b4-4e24-4abd-8664-08dd91b06024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?686xZexnsJM7L7P+fkLupATpuuo33P2iTSUGiYIHcb68g4Z9nvKnCyLHPIRp?=
 =?us-ascii?Q?oMYQtduucLGg6AYrXjrruLrzHaxEo5KQwG2vd7pzC6JCYZIFMKgnIHbKtqOm?=
 =?us-ascii?Q?+Lh9FiT+sBgH9bIcgfvvwUOHb+YUDDiGHUCYeyZObGFCH6DsIeDDVc+pN5QI?=
 =?us-ascii?Q?I3BBJxLC6dKnJD4bc6QQD9/mXBpmU8U9Jur3gwSpwgaS6lie779sVBhk2SNd?=
 =?us-ascii?Q?QxC5OA0nnHq68ex0AAJi7p2GIN9OI81eQdzL4NP0ZB55GhiI9ZjDvSyVSFw7?=
 =?us-ascii?Q?OieFMpykp4VBgutUlIKW7N0l1OrUqX1snTIMKxCn+Q54516bjF+JYwbMzR9H?=
 =?us-ascii?Q?wtTjXNFaK4N6LF3QlSJj4ksKQPuyJeJMPqFMCfxWduUZMNBp1B6W+fILxx6I?=
 =?us-ascii?Q?HGoz2afiUcvP4Y0BZLiuS9hzVYCu+bU3ttmXjUq38EayNkjkQzbumlMmDygv?=
 =?us-ascii?Q?KXJz4R3+OTWMwkn+rQPDl20/aiMuHZT1dmR7Ce5P5/rGbkBpNTbVC8HYOO/G?=
 =?us-ascii?Q?ZiH8x2xT3a8To5nOWfqGX+i7z8Da2aJ67MCzBwM+4Z7OHI1AGcS/6p7lQYlJ?=
 =?us-ascii?Q?AdPrez1H7xpwpC3YTbrCGiJkN8y82pP0HGqt6gFyJlbtmYjc0P369mAy3iOU?=
 =?us-ascii?Q?tJt9eYGh3biNWOpFM3IhtNVNxOSJw4ms3a/gCdvpR7fYHWZxNhmjOlzRpwup?=
 =?us-ascii?Q?uvXm5wFKqM+HaZKIufdQ9yfXM9WzPl0d/F+3jsji7ehfr8AkHhnTtkWLI/ss?=
 =?us-ascii?Q?OWWyPnD4FsI6ZIgDQLj/Nt9sGfAyzwmtl8+nn8l9eCwrtoOn6BMMKSm/hilf?=
 =?us-ascii?Q?iBCME7oWTB79cJAuSkYt4TRSbfE6ut4gN3X7Y7l2N3w2L4GQrdjf5BKRbAsJ?=
 =?us-ascii?Q?XX2G4UshrybPvsw0VCxjoq1C9NCE2v16nnJTdce3EBnl4nEKMVFGSxMXBDMq?=
 =?us-ascii?Q?Xai2Eznn5HntSgg21S8H4zdafRywGTtNHMIhCZXzqqv4j3nZLfY2v8acKfzH?=
 =?us-ascii?Q?hE7qJ6niscN3kR/wafSYoI/QGnE6fDfolKsSLtCR/C1j7yqdBSTFvsaHDjGc?=
 =?us-ascii?Q?eeh588URSqj87+RPErJtZj0rBT8wIaPs8rz+yJkENSETMBDJOIenLL1GSMRg?=
 =?us-ascii?Q?7x6DKrHvUm0DnPIiq8yNiq9j7t9LXl74CLnJUgvWJb3ljGY07D6JYXGyqOJr?=
 =?us-ascii?Q?YNlny3EvOZg1n9jns0EFUYgFBhgZ+fUMSGHFXC9ugGTRTn08bZzaehTqX+Ap?=
 =?us-ascii?Q?5rHI6mrGHxUPbnNEdhPOVr1OjFLTNUNTKqE60tAUx7V5+iBgK44KLLXhTpSu?=
 =?us-ascii?Q?Fi7pu1zYpykU18YxId/+lA07z0FDAi1ikvp6HYuNqjSeYmLYynlCz87uRw+f?=
 =?us-ascii?Q?hUBuO+GKW268AVe/NcUzOsiauyP9Cdi6L8lkC8RXXdVUGWf2FjIYRVDsdy8X?=
 =?us-ascii?Q?wOtm384VQWxiItzkrnAv65/WVPgFEpYaCjjOXqRCJNy4RLdvjsJbhoafRtVV?=
 =?us-ascii?Q?eKW6DLQDrzz0XEUtIX1ql08aMHCrG2eSvmXA?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 23:54:46.9326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1348f7b4-4e24-4abd-8664-08dd91b06024
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9118

Only read the HVM union b_info->u.hvm on HVM guests.  The union
access is not guarded, so this reads even on non-HVM guests.  Usually
this doesn't matter as PV and PVH unions are smaller and
zero-initialized.  But it could incorrectly set b_info->altp2m through
aliased data.

Fixes: 0291089f6ea8 ("xen: enable altp2m at create domain domctl")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/libs/light/libxl_x86.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
index 0b1c2d3a96..b8f6663829 100644
--- a/tools/libs/light/libxl_x86.c
+++ b/tools/libs/light/libxl_x86.c
@@ -821,10 +821,12 @@ int libxl__arch_domain_build_info_setdefault(libxl__gc *gc,
      * If the legacy field info->u.hvm.altp2m is set, activate altp2m.
      * Otherwise set altp2m based on the field info->altp2m.
      */
-    libxl_defbool_setdefault(&b_info->u.hvm.altp2m, false);
-    if (b_info->altp2m == LIBXL_ALTP2M_MODE_DISABLED &&
-        libxl_defbool_val(b_info->u.hvm.altp2m))
-        b_info->altp2m = libxl_defbool_val(b_info->u.hvm.altp2m);
+    if (b_info->type == LIBXL_DOMAIN_TYPE_HVM) {
+        libxl_defbool_setdefault(&b_info->u.hvm.altp2m, false);
+        if (b_info->altp2m == LIBXL_ALTP2M_MODE_DISABLED &&
+            libxl_defbool_val(b_info->u.hvm.altp2m))
+            b_info->altp2m = libxl_defbool_val(b_info->u.hvm.altp2m);
+    }
 
     return 0;
 }
-- 
2.49.0


