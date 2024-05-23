Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BBF8CCD27
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:41:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728094.1132873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34H-0001md-TY; Thu, 23 May 2024 07:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728094.1132873; Thu, 23 May 2024 07:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34H-0001l7-QN; Thu, 23 May 2024 07:40:53 +0000
Received: by outflank-mailman (input) for mailman id 728094;
 Thu, 23 May 2024 07:40:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Po+=M2=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1sA34G-0001WY-PD
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:40:52 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c73155d3-18d7-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 09:40:52 +0200 (CEST)
Received: from SJ0PR03CA0272.namprd03.prod.outlook.com (2603:10b6:a03:39e::7)
 by DS0PR12MB7509.namprd12.prod.outlook.com (2603:10b6:8:137::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 07:40:47 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::d0) by SJ0PR03CA0272.outlook.office365.com
 (2603:10b6:a03:39e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Thu, 23 May 2024 07:40:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 07:40:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:40:45 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:40:44 -0500
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
X-Inumbo-ID: c73155d3-18d7-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXdzLE+kKH46u9Sng84dpWlCTRQJI357cr0AvkengcQnhlsrf5Iwemeh7WjtNCl+oVmvyaOl+qRo056poVrfNWXIYqMuDkUyZNhExvVXeiGUK0NlJ+szO1eTUux0rxa1nrSuFTBhixg8+ls7qMOtkMPs0fkXS2Uny0J19MlrVILVjVAPMI3vp+to+wGDURkbvXSbl3BScWM3vpuOCr7azFdDV7Xg2OBIBeh9x4/93YjS6OKYXFWLAGMMSW8cDIBLF9m7y4KdPa/op6HPrPd+2ni4N4dh2OUfsgNYJHgO179kwWPMfBZR4BtlniN1+bT1AyOFT6Q+UFu6CID2JuMPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/W168QEvQVYTC09iGsQQFU2oTMKOq6gSMJXAiUxem4=;
 b=NMaeuc0ruls78XaqMFJNAgAvtcN6bNBfxoJjmuiCbICes0/+QLC2obkCdpPQoVBhQL0ENQfje4cRmfZFR9KgqniUMpebFrkOOz3cFsZrqlmcF31v1qWJ5Rs0Ll3JbQypn8xlwTwasDpzPBUxDLNiwvc5y5Yej4wNOlhb9oYIcEuUVTSIlWLDMICcgpBs8uGxpfN2cYo335BptrilvzGoDOBd0yMxzEbWl0MlhPL1GU/fM7VMJviBrWDKUtfm9AtIS01DhceT3L80FxcC2t133Lz6riFYjAbvLyc6LS1EqgJ4WRhMDqh1CvGnwLuuxNo0t5LUrztUNWrKLCEPqUA/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/W168QEvQVYTC09iGsQQFU2oTMKOq6gSMJXAiUxem4=;
 b=TXD8tE0v34Mn88tGEFcaqrfSKdZLPHpYn6pij5jvSEULaSUd5NfphWjyhYC4Wk8RFLc6Cjdgs0+Z9W0yFOh1XcOvIvj/168jlMKJmYT9dfPb/Fa6rEtzuSsdLyE+tntQWY84HDSRhDRTpYEVhelkQq3AVSwuDUbD/3tXMgFEHXA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony@xenproject.org>, Henry Wang <xin.wang2@amd.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v4 1/9] tools/xl: Correct the help information and exit code of the dt-overlay command
Date: Thu, 23 May 2024 15:40:32 +0800
Message-ID: <20240523074040.1611264-2-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523074040.1611264-1-xin.wang2@amd.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|DS0PR12MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: d377181f-5b2f-445f-d9d5-08dc7afba8e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aBxdqU1m92P565gZjrLCwUTUZ7iEh2pilmYFgRhCAGqcNpKQ2StZPIxzzdVd?=
 =?us-ascii?Q?96H/MB6e+5lA6zQaY1Ygk0zcz0wvfAuc4PudQL6b7spKqWEZZ84fHVWih+/f?=
 =?us-ascii?Q?76YGFzs14idDEeONJXl8x/+TFsqcViwcVpUoEHIQz4n8qwccKhdCxNPLhmKh?=
 =?us-ascii?Q?qvVaLAC4GEHySL3+qKLA7uAara81nnO+rPGhzJa4kKrTBlWfz6/g8Nz2JsMl?=
 =?us-ascii?Q?lz2HLILzJlxEHYGtZyfvoZLF9Z1sb6c91J4jUCy7SmpCRcKF42HkxmISBx0u?=
 =?us-ascii?Q?XDoUkJd3LaHZm3mpQRnQsQVKpb6zNez9gKi2HSLipryEgnyr4sEh802JgkBV?=
 =?us-ascii?Q?wYWnCrGZNF1jozBkvdFXGsZAFPM2duvy8tdWzQluoIfdQw7P7Tr9+njnFoXM?=
 =?us-ascii?Q?aLdlY45m51BjgXsjZAtPBixECkcedvnTfQxuuFgXmRAz+lgnefSYOJ84Se1h?=
 =?us-ascii?Q?477hGdGmXXoocAS4FQTeuoUJ9RxRI3xIbeVPf6oC+weWCzOqfnrH9zjiBqB8?=
 =?us-ascii?Q?9rv3I5PkWUJVOuk0jX7c3JyJ2KRvra0s09OGoi6YnTQ/OzWJ0OcHSn31kL9K?=
 =?us-ascii?Q?q2mzNIM65dbeMa2D2BDvBasOLyjFoKH1bIVFPoYmyK5bCpUaHlALXct3Ck9+?=
 =?us-ascii?Q?8UMfhnixOiX/EpU45+P/NwvqQXjg4/VET6KCcPTpvKtWFOHqVnKiN8E9r3Lo?=
 =?us-ascii?Q?prWwb6iuuXQkww4Y2mPmpve4yndQyXNp3IvN6JtFADjGskdtnZraZqmuEAbU?=
 =?us-ascii?Q?w7y6Gwo3QFTpvGVirVQa4ba13obncpsabH/5DEugocn4eyjegc8YB9rk9xRk?=
 =?us-ascii?Q?IhOnIyeOiSI5X1eWxN7mYThjkanxeUadYfqpKSu+99l8tlw+UW+Eci97Yr/L?=
 =?us-ascii?Q?+S+LrCEEdfbAD/a+MW9f4Q9Xe0qYo3LOn8WEG48DbsW3623Bk8y7yVawC5Nf?=
 =?us-ascii?Q?VCFGnTlnsC5eNIhqPbCAXxXlqiwVXgDfh9kcJFJWEYijHjJUS8sWG1pZbhiN?=
 =?us-ascii?Q?OH/5e/Sim4eQkCHRWCdmRSRhE89HnvPlnBXVtAbnkr2DAqcyWvjIiZc8WC84?=
 =?us-ascii?Q?gHjbM/ud/tf9RPk5RN8RJ5tOR7mWC+b+DM0O75iYebIuysx6GMv2nSIgQdpA?=
 =?us-ascii?Q?RYzFoFkm94etGITtytCUNlhjcU4g1bMqcqRKeYqUnOgtrhhpmfHEP523D9P4?=
 =?us-ascii?Q?nniGe3UZDHH/Pj4tyhKOAnJIl1FSgSZoe/TsnIww0SRQ+WHVwfdwz44P+zvm?=
 =?us-ascii?Q?jaGNIDUiA6+D0923XI/AlDwjBNneGhUhl6XUIUUgR7hvfpci/YNRdvG96VDr?=
 =?us-ascii?Q?ma2RNU9wq+unOYC9luT8f9w05OpSDAxXMp0gcpcCywDKtRaLhZ3tAeckhHTc?=
 =?us-ascii?Q?Dm5ZfbE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 07:40:46.6883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d377181f-5b2f-445f-d9d5-08dc7afba8e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7509

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
v4:
- No change.
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


