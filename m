Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F43B37443
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 23:09:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095136.1450303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0ut-0007wj-Ko; Tue, 26 Aug 2025 21:09:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095136.1450303; Tue, 26 Aug 2025 21:09:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0ut-0007pf-DZ; Tue, 26 Aug 2025 21:09:19 +0000
Received: by outflank-mailman (input) for mailman id 1095136;
 Tue, 26 Aug 2025 21:09:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ur0us-0006z4-Jo
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 21:09:18 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2414::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec62b11a-82c0-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 23:09:17 +0200 (CEST)
Received: from BY3PR05CA0009.namprd05.prod.outlook.com (2603:10b6:a03:254::14)
 by CY1PR12MB9602.namprd12.prod.outlook.com (2603:10b6:930:107::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 21:09:13 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::dd) by BY3PR05CA0009.outlook.office365.com
 (2603:10b6:a03:254::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.12 via Frontend Transport; Tue,
 26 Aug 2025 21:09:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 21:09:13 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 16:09:09 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 26 Aug
 2025 14:09:09 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 16:09:09 -0500
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
X-Inumbo-ID: ec62b11a-82c0-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oHySlXxqNmM1s62brizEOcGayhRh+wwqZxdVUg6xXO5PNVjHuSNbzlvkbiWbWZq6BBZexDMHBIyOSmJFS9UF95t5lPFJGWxcw+SEz8/Ly86UaevhMYzN8Ver9M21doiozPOjX2qRy8tZbR8War1UTDykPiJ70Of3/bGLao/kBPGZYtoI7OFKJJQeCNs0U7vrz0kkriEoVb4jsFQCZ5pX3jLUljny5LKGByyBXS+cQc756bQhfyhT3PFa0DRQQ6Ld8Rb+W8quaKVlS9qvLRab4YdO0TVWrtE23VrFUyFAZQFqlset3FLQmsp6WKwdCf1s5C79NDONddxwAuRa/j1kFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZbY69DMqrM0tK6H3yhGR3gho187BPnTnu5vuJ1naLY=;
 b=BlrLlnDuiqg7k/MwdvhIacp2x8vHbS87Juw43zvKjj3FPAShoMEeVeFQgVbwdSk00JvEODK0UmG2nAU9m1tbeWN0DlTg6aVBDZqu611hYHrwMYteVkSUc1jVNoaqY6/7mOC6rF95rkODPACxXJLin/H0XqYEqn1VCt/IWZ7QYvDqfl9VNT9Uwx7gBTV7G9+NuRcJFf3joEWaZyStFBMdsHrL8lTPVd15hcXrzt6dBz1QWNc0PnPSUT2ECAL7e/2jr60F6r7ErPJmcqNc1YK/X82UHXGvMJG88uhB90RRoBvvLAYolD6pVQkpY+sBAjU4wUc3SY4sMiayXjtGFpvcBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZbY69DMqrM0tK6H3yhGR3gho187BPnTnu5vuJ1naLY=;
 b=lJobdyhDvWrckjr+PUtncrKlU+tnfMSGXLO90qCcRKw8n2NBsrX9LUYznIHkw36AGImku++IZcZCe5Yf88sUrxZBkIaMtZa0IvB0PkdCFVpy8BxO0Mzwd+xknjdpTRQ/1ICFNgJcwQ+Oi8kZhBIxaiA7hiErul5qqc2g3NBIPy8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v3 7/8] tools/init-dom0less: Continue on error
Date: Tue, 26 Aug 2025 17:08:46 -0400
Message-ID: <20250826210847.126015-8-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826210847.126015-1-jason.andryuk@amd.com>
References: <20250826210847.126015-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|CY1PR12MB9602:EE_
X-MS-Office365-Filtering-Correlation-Id: 77675c30-0ab5-4da9-e533-08dde4e4ceed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4QOwJ9WhhVgdkKYI0cf8yXqP8eLmYiVXMKKDQwfoURXtP0fcM3ociF6SU5H9?=
 =?us-ascii?Q?7qHjIYxR6jrLFLuXyZbZZ7S0j9geXVSADO6QRAEnTn79GQUayxkW4Wz4Bs1g?=
 =?us-ascii?Q?MDqgUuR6VB/ScGGrxc7l8x5xI4Ietz3NH/6H6mObe4iZbJgrPwzdtbJJVdQS?=
 =?us-ascii?Q?WvoLZt+SnPOv9Bu4WZZC2e+6JdFtxGf6Uh0DOPLp/2AtXY/7TROJVMvT2zi2?=
 =?us-ascii?Q?4no1sd+LEtM80jNBndUBSXo4PbeRvd0fsBnXChwFKtlF2XMn3BUnckVx1jYC?=
 =?us-ascii?Q?1JezpnxJI8qVJgfMNWtCH3U3ddX5Om4M6W1fjrC2Bi7YeQ6klrOA9vLWuuzc?=
 =?us-ascii?Q?sILTcF9IsVKpkVaJE8vHCHDnBGMSHfXVUgZs4XQc/tgeQTg/r68vJjPj2wPA?=
 =?us-ascii?Q?GTTkjkNY9o84Tc3sJvgs5XdVkmNfA48pxeDhQU26Y3PxDDL9dNaMVJu3i1UL?=
 =?us-ascii?Q?pX/47fFrH+bTzUP/xTqIjT2vdU64DDtDywuwGy45mh6JUKcpy+gmQicta/P7?=
 =?us-ascii?Q?RRbCtLv8SwDXDlTUrlltQVSb2NN4m9qNz9Bb/Qwmeum3ISAzMxGr1fJecSmF?=
 =?us-ascii?Q?4uxV5TBdwUJPpwhbTFXYwOU8dINWqwqCh/JS/RzneYset38N4fJQGKRleOLH?=
 =?us-ascii?Q?ODyeZ0zx48IbyA7ENO429p+I0vSooFLPnJs2hHnFY3055ZKQPU9t/EklaEtL?=
 =?us-ascii?Q?KjxuJc/QZ+URPkrtS6pczAaK3l8WTcnUtniOOvSSjV2+4DU81/Ont6g3T5k/?=
 =?us-ascii?Q?1T9urIk+JEHx4VcAfXCl9p8rV8qGcpCtT01mF83FV9Qj3ueSAGJgjEStny4i?=
 =?us-ascii?Q?2PGWf1Cs8VvTIOAuiY6vyQk79JsQwo/f6vdGKUP5ZhCKxdRUCSd6WiclIM4J?=
 =?us-ascii?Q?gcidD2ha5w3TFxMK+AX1vbVxyoA9pG/SptVEZi5mobQ1HkC3fqZIJ44fGBqD?=
 =?us-ascii?Q?Eztl/J97eONJruXQ/0/YLcoOa5MYh2vkFhhC6TgpEIS/qQ5YUjBERhD+fabE?=
 =?us-ascii?Q?PzV84YQkNk54p/1hZ3BYu8PFu09kQhViioyNyXYucDrk3njYOHtW5b8SUOVe?=
 =?us-ascii?Q?kJy2KNGEsWxra+/ZP6VnmLH9q5ZzqwZrM6KP7cagUEuH5CgnrFfi+TThBYxI?=
 =?us-ascii?Q?X9pNKC46hIwV3eQUGHGh0VQo49IG7HqWm4Fse1wM9MQ2MPTWJi2Ueuh3OAYk?=
 =?us-ascii?Q?sFhe6JCgtMSxrsEDy5m7IQkVzpkphvvPkASMzu5iL2Xw9c2o0vn0gQB2/L8i?=
 =?us-ascii?Q?wUi8bY1PmDBDFi7avFCl/S8i3oeKUEI7+QEDo9Lf3IH7HT4y+O5HoYSRz3Re?=
 =?us-ascii?Q?AUQYybIfxZ7PWdnGNWPK7JtAgAbY1EP7uZPLfUXgQCu359eVnX4X1MCXzLWa?=
 =?us-ascii?Q?Ie/vRIfFN9wkFkFXiYX3IJVJE/11hboIoIDujC5D2rhaLO6Nj4mpU7/+XU2t?=
 =?us-ascii?Q?RV08jMHlO9ZLrPUhD8uwrHkgj+SxuhQ5okNgC/QvWQBsGKQZ8n/I5bKXTxNT?=
 =?us-ascii?Q?WHD1Zqvf+tMpgtYzn4wePsVGMqyX4kfN8ELM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 21:09:13.0501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77675c30-0ab5-4da9-e533-08dde4e4ceed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9602

An error on one domain doesn't apply to others.  Continue the loop over
all domains if init_domain() fails.

There is a mix of positive and negative errors.  0 is success, so just
check for that.

The last rc value is used as the exit value, so clear it before the end.
This avoids a stale rc value indicating failure.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
Use != 0 since there are both positive and negative errors
---
 tools/helpers/init-dom0less.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index d08b0b1362..ce70ddee29 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -406,12 +406,14 @@ int main(int argc, char **argv)
             rc = init_domain(&info[i]);
             if (rc) {
                 fprintf(stderr, "init_domain failed.\n");
-                goto out;
             }
         } else {
             printf("Domain %u has already been initialized\n", domid);
         }
     }
+
+    rc = 0;
+
 out:
     libxl_dominfo_list_free(info, nb_vm);
     return rc;
-- 
2.50.1


