Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19386CA7755
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 12:52:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178819.1502537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRUMB-0006Ob-M0; Fri, 05 Dec 2025 11:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178819.1502537; Fri, 05 Dec 2025 11:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRUMB-0006Lg-Id; Fri, 05 Dec 2025 11:52:15 +0000
Received: by outflank-mailman (input) for mailman id 1178819;
 Fri, 05 Dec 2025 11:52:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=itKe=6L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vRUMA-0006LL-4Z
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 11:52:14 +0000
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c007::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5f60e5d-d1d0-11f0-9d1b-b5c5bf9af7f9;
 Fri, 05 Dec 2025 12:51:18 +0100 (CET)
Received: from BLAPR03CA0104.namprd03.prod.outlook.com (2603:10b6:208:32a::19)
 by DM6PR12MB4483.namprd12.prod.outlook.com (2603:10b6:5:2a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 11:51:13 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:32a:cafe::fd) by BLAPR03CA0104.outlook.office365.com
 (2603:10b6:208:32a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Fri, 5
 Dec 2025 11:51:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Fri, 5 Dec 2025 11:51:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 5 Dec
 2025 05:51:12 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 5 Dec
 2025 05:51:12 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Fri, 5 Dec 2025 03:51:10 -0800
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
X-Inumbo-ID: b5f60e5d-d1d0-11f0-9d1b-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ed+qIam6lljdNBRmvG5eerl9zW4e/0DMrSKzgG/JS/oQp+fUZ8kaK9y58gSu2414cf8JqjMqt6kuVqXZqCYL7k23Nw4kSf7IaOOdjPpZGkAOCkqOl9X2ySdG1axNXunkifGO6QTsxbu9wZd9KB3xG6+RQNmxzYKiBybJXBAkLGjURhq/aCZpbXhCN+gPM3096z3hQ/Ojsux1UkWC8bEwOBbLhgJ+rVsj3KJ6vLFkPzHCFKygfLnT6+cQgAf6cKBSMwlVS+B9+OSwyQaA11V1oxtHLKB0qX3OdFWHID66fVC+XggfUPw7fzszVnH6D491GWv1fEPAjfOPZxUbJXCixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfmrvD0GvxlxUpk2W8eXR5CB2EZhdEir/U1Wc2sOxq8=;
 b=hIY46zXAKjKmjFIelqOG68SB4Wg/lWY7+KAkjfy7YHOz+LwMbfxrykWVajytzr1CmDff7jPUDoyhFii2CmZWybJn19ZrWUWQ+Mjv26a7uaqK3L8oPlAD/pC97nxaDwrn+ec9rLikLwnAmGDh6KxksCIyq/rELemXQEYvFpvvw/M2ORabAI0R1nv7Vzcz0SPZm+zcuceb56vop20EMDL2Uco8qhJfGhJfZJP5d9dgfFzf0YO2BvtkdQ5rhpkKZXpkbP8AGXQrgE2HqRgT2JQiH/zI7ttwhGXh1NW28ie0rfpguh9YduwXYrj3S7EkR2JkaFE73XEMNA6nDkhdPqDC6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfmrvD0GvxlxUpk2W8eXR5CB2EZhdEir/U1Wc2sOxq8=;
 b=AHYcmXoc4Ygc44odBvlHLclXKdTGea6WhJAPgxV09X3miZWk6foEAwIZl9RjJN6wdHykNf0TGRNbk4tjEaS4MQ5nvBDsdE4zZdcqgzaQ6Ou4zVFZBKXtwO/M/W9nmsopMx77l7QoDitZZWCBJjfss3C9J3U3LjsvDeNa+qOWM/o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH 2/3] common/kernel: Rename hypfs "params" variable
Date: Fri, 5 Dec 2025 12:49:59 +0100
Message-ID: <20251205115000.49568-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205115000.49568-1-michal.orzel@amd.com>
References: <20251205115000.49568-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DM6PR12MB4483:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a62e3a-a8d2-4db0-0e50-08de33f496f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DOi7ti8oM7GQ2bMzLulxhpwHGGsSHgjhR4e89yTAtmCc/5DOTxRTx4/u0F3H?=
 =?us-ascii?Q?sR9sKePeEkmTdsZaUEwIsg3Gw51LJ6oVvdgSQbHzlRN2DP7C3d1wMHbbEwzi?=
 =?us-ascii?Q?W2Dk/J3qVTRsUmRCAm2hpcWMgPscf8Bfm5j3KmUXty1dyo49vPv6fHZ/T9ba?=
 =?us-ascii?Q?E99ApbBFILdJsK3rS1hhMQuLo3UIxVzQFZLGN1lxSTQKg9HW+K8PFJC48t8A?=
 =?us-ascii?Q?H0LPJvNOnDClCfZLowh25kSheizEBh0JIHBWm7m0Ewu32mKD2R3c8hig+FJN?=
 =?us-ascii?Q?+vam91AYNM1gCkALdejqo2L7gtTWJajA+AEN+3e9yGfIzFtYZJdt2YfpP4XH?=
 =?us-ascii?Q?2H09Sv2ISj3QgsEPPwUY/j6gvaKdvwmnw6Xi9tFKwsNdtvk903wbtyZOxwWf?=
 =?us-ascii?Q?Oxfml7vG1QYVJSsbep3LJ4knyg13hDp6V5g4O0F2LaziqS1ELZ3ZY0/sZ/CD?=
 =?us-ascii?Q?qeV4JjlEDhnxsIUUaYbUCHTEJZNL9Uone5bSHKI4XEaTBV7C0chBKvCpitjN?=
 =?us-ascii?Q?XUDf1+7Mt8fxrKGY7lMTjU2bi9lfYRLG4MEMh+H3fvOwt7r+nlY9+D43OEeY?=
 =?us-ascii?Q?JA0dG0Dnyj7aNE0zojqt/1hUmT/QpR8mnlphFWlkXOPZYXvVLWbFNpSsLexS?=
 =?us-ascii?Q?W3XIPCXHanvbF1cSOLCin2pdIBOsfErUDD9MFAO5s3EAXLLxIqKiLmDmOcAg?=
 =?us-ascii?Q?FPv0l8Uja33pYQTJxC+8NhItdYbMVaMd13u3QDlrZ4woKuOQpOk/u1H3CHgz?=
 =?us-ascii?Q?VAJNqPSzfP/unujwIw6MXI/H0Mmi39kh+nVxb0WyN7N8JMihrefOxQWcDrF9?=
 =?us-ascii?Q?DApfM+YnEhSxJmiW22aAuh3hCTBjooFkxW4Ua4A85QXDP1MQTJoh+SD/EjXR?=
 =?us-ascii?Q?u1dOFgxQj8c/gSocr72T0vG16Q5NIHFtHGY1crZ0euXgjVIv7eW9EIatWnlv?=
 =?us-ascii?Q?CnMssQkySQbWnJWzA8cJLuX7FC+V0QmW8h0GwCPL+HhuTpkBGzluLTpCNWxb?=
 =?us-ascii?Q?JoFrleaEWC4jElj6ttUcoygD6exHCukgH4xuIWzB9aHsaSYP5p7otcxRFMrW?=
 =?us-ascii?Q?ZjwGWHcpb+ZcljXg0OqupmnY3reLjnv2Jaf9dSllZGjO7bfemq0r3FlrFBSu?=
 =?us-ascii?Q?PlK6WVDVhuxxqgnAeaNWbq1X0nSZp1BO+AyPJRowh7xBfuk1quPicjjwbOx3?=
 =?us-ascii?Q?8K7XpvYarzuV2+R17l4qkQ746bJEJU04cjXeSyGmmJbVrScneqMeaTQIvw9s?=
 =?us-ascii?Q?TBzAMOtfYcCV5qErbplaYUspyHbm4ksfAGRskmSg/b1+cHIUnuG4OAcDIQ9x?=
 =?us-ascii?Q?IVpeLSudZ0mYc3t7s/daGNhzuXojXkxMv2tB/Y/OWS8iAif3LgfoTYiHwP5T?=
 =?us-ascii?Q?X3TduluokrOCDI8Gt8N/Vu0fW5dyQJ6rx/cK4f3NIHpzuRWRYCB9gb4ah0/P?=
 =?us-ascii?Q?qHB2BjEoJZshJkAqBRetQZKxvre/zBZUHj9akOiYypuxDfKQr4hYhAMhKA3D?=
 =?us-ascii?Q?SftxTF0ZvENonjbPgtP0qd1vDS3wq/EAX/Sg7ouT88FxHORLGQwg9i+m6SE1?=
 =?us-ascii?Q?dmkAkd6ymT4f5jnMd34=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 11:51:13.0299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a62e3a-a8d2-4db0-0e50-08de33f496f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4483

Inside do_xen_version, there are two other places using local variables
named "params". Rename hypfs dir "params" to "params_dir". This resolves
MISRA C R5.3 violation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/common/kernel.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index e6979352e100..fb45f8139995 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -483,13 +483,13 @@ static int __init cf_check buildinfo_init(void)
 }
 __initcall(buildinfo_init);
 
-static HYPFS_DIR_INIT(params, "params");
+static HYPFS_DIR_INIT(params_dir, "params");
 
 static int __init cf_check param_init(void)
 {
     struct param_hypfs *param;
 
-    hypfs_add_dir(&hypfs_root, &params, true);
+    hypfs_add_dir(&hypfs_root, &params_dir, true);
 
     for ( param = __paramhypfs_start; param < __paramhypfs_end; param++ )
     {
@@ -497,7 +497,7 @@ static int __init cf_check param_init(void)
             param->init_leaf(param);
         else if ( param->hypfs.e.type == XEN_HYPFS_TYPE_STRING )
             param->hypfs.e.size = strlen(param->hypfs.u.content) + 1;
-        hypfs_add_leaf(&params, &param->hypfs, true);
+        hypfs_add_leaf(&params_dir, &param->hypfs, true);
     }
 
     return 0;
-- 
2.43.0


