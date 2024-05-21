Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C18CA76F
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 06:36:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726498.1130790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HET-0006of-3P; Tue, 21 May 2024 04:36:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726498.1130790; Tue, 21 May 2024 04:36:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HES-0006l6-UY; Tue, 21 May 2024 04:36:12 +0000
Received: by outflank-mailman (input) for mailman id 726498;
 Tue, 21 May 2024 04:36:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H+om=MY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9HES-0006hu-3W
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 04:36:12 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4385c6f-172b-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 06:36:08 +0200 (CEST)
Received: from SA9PR13CA0057.namprd13.prod.outlook.com (2603:10b6:806:22::32)
 by DM6PR12MB4252.namprd12.prod.outlook.com (2603:10b6:5:211::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 04:36:06 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::46) by SA9PR13CA0057.outlook.office365.com
 (2603:10b6:806:22::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17 via Frontend
 Transport; Tue, 21 May 2024 04:36:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 04:36:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 23:36:03 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 23:36:02 -0500
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
X-Inumbo-ID: a4385c6f-172b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBWTSlySG9p9Ae6RjL0C+Kr51gF7ITt0cBlVY003oDwljuC3e9lwBPuxooeRQdBOWr3H94GjZkD41AkAb+rjvf46Eic8gferqRxss5IujoWAnoqf56bpwxcAckFBOq8f8lP/wa08KDAk6BQxP48bDJBpAjJHffOg6FwFnRYnadvEkwdpjYOgKc17RrP3ekfw6IiHIRoGMEyZxdMKJgUCLX7J/8rc3vJCX+l0RuygBaMx+i+KABiQMoa+vmhfeCQgLRZ71Q/nT8Lf4P9VzFa4MZTl19nm5Ssy3SoeewJNnqxTPMPoUiZu2B3vGX+13OSI4k5gn3YA3GC3cPRh5nCUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MgtBjlO1A8ilW5oFOin/8HiTsVKeBou6t2YnvlwNys=;
 b=oeHMEoOkkpR1cbiCvXZL4B/zvvoKPa3pGw6i4hVo0NuA7I1pOQSHJyWqia0FcCiYpzdzErUvp/phEaUtZ/ps8uz3bC2V0T47KX7FZgFcH8Szsf4dnq9zBdNf/rcOk0ZGKBSz7uGBfnj0//PzUr/bCDms0MNPbu+cs0+XGwNt1Yvqz39STI2f77t7QXfGv4cdnRiUUU0Kx+X/0iubBUFla7/MtHzeW3P0d2HtVnV/PSd0l1aDfCzPv1IWxRmTsfb3App75fGTZ6qtj13ToDdkpSXMQzXWwWa4/gmqhHQmIHmc0zSukJgDeBrD8EyVGmzTS+2AAJtFGyPZZ0HkJSfzyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MgtBjlO1A8ilW5oFOin/8HiTsVKeBou6t2YnvlwNys=;
 b=oRW02LtyEF6Ox24cpEq+YTKbIq6Hr82X3gFFA2uJZ33twsZLH+coinuNIRl/FdLFnNaz/hUnKGvf9RjBcQksFHZi3u5a4RjkHC5dwyr2NfnRWlR6q0Mt/DB3iT2ppJjcyFZtzW/5Zy6Rx76OM0pGS8COg3AtiF94FH15zRTWq94=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Henry Wang <xin.wang2@amd.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 2/8] tools/xl: Correct the help information and exit code of the dt-overlay command
Date: Tue, 21 May 2024 12:35:51 +0800
Message-ID: <20240521043557.1580753-3-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521043557.1580753-1-xin.wang2@amd.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|DM6PR12MB4252:EE_
X-MS-Office365-Filtering-Correlation-Id: effbd565-7baf-44a3-f460-08dc794f8791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cz8HrDpXqiDvLVcZTeBBGTQdK1ZTcd9yoVmYA4g/cC/7cYlKEJ9SqPkw7lUY?=
 =?us-ascii?Q?jbHTO6IsWNsBf3/8pj1kStE+2s7Ri5acSonboWaveYOvpFpSOUJpqe+DpAfx?=
 =?us-ascii?Q?sxTyRxmdto+5UZuJKFYZJ/NneEUDwSecZLmGYlWrKR5ToCTex4mWLCmO9ddf?=
 =?us-ascii?Q?s4VKu1FJLpNHbPxihnD4idiyrTCdUWiOagJtY/75L4uwK0sSp1HVdbFDbJtA?=
 =?us-ascii?Q?vC8tLImRNNUcHDlpleKU+3pnzfvkTH9sxn7nuREh1rF5otmLh2zZBhpY8MpD?=
 =?us-ascii?Q?FJ6lYdmrzjI3w/HNqs3imEpkBzGoNLDI7Ep66RFCQOhNmCrboS+IBNDO5Xcr?=
 =?us-ascii?Q?C0jOILIaV3P3xa2TDGRmxHE8NbNg91HrsKcx/KxuN6AI8adwOkpwCoN0pCOI?=
 =?us-ascii?Q?NnNVu0SOxeeWy0TkeEG9XYg+kPtR+7s3iU6nwaedY3ub8IzGBHpCDBBB4daE?=
 =?us-ascii?Q?06ZvYXA69i1ta7HRRzZ8EX5fZ/089ywT1Omx5ZwZ3FHOX3eXaFPtOGxdssTL?=
 =?us-ascii?Q?zGwuQ3sKphsFWLuhjM7cN83grRw6x/khiTEn/EjGkYgt82TE479GTE0A0EiW?=
 =?us-ascii?Q?myLjHqlX0ZY6nXEyfEQCfHoQMPIvUPigxPNt17r6RVn07QrqoCOSLwhT/im6?=
 =?us-ascii?Q?lGnq814NIVHQoWpEtPbXWsrBON9NWLFTHGw1qd5gdDpAjKGDyORLleLLHmQs?=
 =?us-ascii?Q?H2sNb0yr+Mf4LBcoR4tl+MSBVSpF/nMTweJ4TLHFF0pnIznZkLKurCmRCKAf?=
 =?us-ascii?Q?XFlyrezmGGB1QomkVFwDnAL4Gyj5hKhLi8CWlDaq6obW9Y2/EVlfJHeQEPXN?=
 =?us-ascii?Q?DjWH3no1Nf7Uzg9l7icKHqtGWA3HbhIAS6MBUu1wy1ZWmAIdyLFWOsA8K1Tv?=
 =?us-ascii?Q?iw3ORBEvh2XlU7SsN8+fPI/KFUJLLBosfq15wWS/sXBVTBewJGOuv8pFOnvx?=
 =?us-ascii?Q?4q1turwr9w5t4mIFTDNpTIeicvNkqUUFYtQ0hz+SQiZgxrhookwDGRHS5S3l?=
 =?us-ascii?Q?B8BLjcj1nrJu13u4HK4WUoP/s2D+YAZruEUfiayJrJRMnKINdwxkPzCAyaQk?=
 =?us-ascii?Q?BSojwVmKen6lBc2GeOidLYN/EhDXfWW/jNbCb5sMY4r2Z1Meby0ZK065GNws?=
 =?us-ascii?Q?52rNr8sOWaNBhh9FMxygQa8jSxi6vsy4EviTh0RufkRR7d8VCNVHSV1ZWGHK?=
 =?us-ascii?Q?NGbko7XOnbc0jCYVqrTM8gR8QCTMw84slNTIUgVV5uJw2KWLOQ4RREZs7O5h?=
 =?us-ascii?Q?DnoilTjtjVLO75GO7kHZ7YL6RknP/2b3WVC7uDf9RVTFb9JC24FrDklPUfI9?=
 =?us-ascii?Q?wnohQ2cKC1OXteqrb53bmnNLunLCt1/ufxDoBrgkRfkpX41YPcnRbHYqps3X?=
 =?us-ascii?Q?cxfIYmY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 04:36:06.3009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: effbd565-7baf-44a3-f460-08dc794f8791
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4252

Fix the name mismatch in the xl dt-overlay command, the
command name should be "dt-overlay" instead of "dt_overlay".
Add the missing "," in the cmdtable.

Fix the exit code of the dt-overlay command, use EXIT_FAILURE
instead of ERROR_FAIL.

Fixes: 61765a07e3d8 ("tools/xl: Add new xl command overlay for device tree overlay support")
Suggested-by: Anthony PERARD <anthony@xenproject.org>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
- Add Jason's Reviewed-by tag.
v2:
- New patch
---
 tools/xl/xl_cmdtable.c  | 2 +-
 tools/xl/xl_vmcontrol.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 62bdb2aeaa..1f3c6b5897 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -635,7 +635,7 @@ const struct cmd_spec cmd_table[] = {
     { "dt-overlay",
       &main_dt_overlay, 0, 1,
       "Add/Remove a device tree overlay",
-      "add/remove <.dtbo>"
+      "add/remove <.dtbo>",
       "-h print this help\n"
     },
 #endif
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 98f6bd2e76..02575d5d36 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1278,7 +1278,7 @@ int main_dt_overlay(int argc, char **argv)
     const int overlay_remove_op = 2;
 
     if (argc < 2) {
-        help("dt_overlay");
+        help("dt-overlay");
         return EXIT_FAILURE;
     }
 
@@ -1302,11 +1302,11 @@ int main_dt_overlay(int argc, char **argv)
             fprintf(stderr, "failed to read the overlay device tree file %s\n",
                     overlay_config_file);
             free(overlay_dtb);
-            return ERROR_FAIL;
+            return EXIT_FAILURE;
         }
     } else {
         fprintf(stderr, "overlay dtbo file not provided\n");
-        return ERROR_FAIL;
+        return EXIT_FAILURE;
     }
 
     rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
-- 
2.34.1


