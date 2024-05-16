Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 795698C7459
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722990.1127461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxi-0005VG-CE; Thu, 16 May 2024 10:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722990.1127461; Thu, 16 May 2024 10:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxi-0005TV-9D; Thu, 16 May 2024 10:03:46 +0000
Received: by outflank-mailman (input) for mailman id 722990;
 Thu, 16 May 2024 10:03:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MS9v=MT=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7Xxh-0005T3-2T
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:03:45 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 939f7113-136b-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 12:03:44 +0200 (CEST)
Received: from MW4PR03CA0337.namprd03.prod.outlook.com (2603:10b6:303:dc::12)
 by BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 10:03:38 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:dc:cafe::62) by MW4PR03CA0337.outlook.office365.com
 (2603:10b6:303:dc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Thu, 16 May 2024 10:03:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.0 via Frontend Transport; Thu, 16 May 2024 10:03:37 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:36 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 05:03:35 -0500
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
X-Inumbo-ID: 939f7113-136b-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ajw8jvLIdS0hWT6baNa0RZztzpKE35uPM2NqX3o+g4QDdMctbOyacesvJISS9V4lkMTWXxwUZc45CQtKpuq6f5BeQ068x3vwo43XtxTG3MW/ak25k61NzM0x9MFGUVUpL41A0B8nKP076xx/SqZgb3VOthMyw/ouCm2hBWRyZrahJOy7DFZPSl/alBmyjVx26Wm08D+/o/0vRIV1CSY9SjD8OhjUFICW3K85i5iemcMDrEV4DyjkDJ0aNjSr8iHm0Ou+K5JtqMcVmzpoaL64cvZDdackoWxGR4x4k/++Isj5eBYC7RJMmE2+vMmNmM+2SCqDRW6dnprWOAX+HPhJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7coXZqUivStKOWByVVC93sA3+vqD9Aj0YK2CmeBB7tg=;
 b=m4l7p6qOF1lRreW1l3CBIqWZKzMv3E/eRQyWes6HlXU7afJOK1Os5GpzuCaaSUGhAYnC++9kNXSahM3gNStDtfr8J50Toi2GW1DJiZc21QO7V3UsfhiuIFAkAQHr8eb4bAQLZA8SWyU66qI0UQnE/48qF3+64DU+NHeO8MNjIXFLSlP+pVy5l33AZgDNDWgeAGb6MHzxZD5av5CtVneyPFtT+oQ0lt1tB8REnV7OjQipKFZBJx1nhGje82TmTISY5gehBPtGnDG3yGJBSZnbhfBnR3unTLsE6kWBYsaXcQ+ky6LdRzPpWlx7eOsPyWvQgl6VtJojMeYOETNCp0waSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7coXZqUivStKOWByVVC93sA3+vqD9Aj0YK2CmeBB7tg=;
 b=wY5yQibSag/CEOhjV55+Z1bmmARMTm7lc2/3XCwvpWnXWfeFW0DK93DLHFe8d5SfCocjKaub9K/y9mMEK5Ynxkk2/B8tQi5jUw6E9383q8Nzbk6JUZFM9Xw3UPl0fkjpe9EeAHeHmccVMYVoOQ3XDRlIXUhS6pZPtRqrffuBpv8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD <anthony@xenproject.org>,
	Anthony PERARD <anthony.perard@cloud.com>
Subject: [PATCH v2 2/8] tools/xl: Correct the help information and exit code of the dt-overlay command
Date: Thu, 16 May 2024 18:03:24 +0800
Message-ID: <20240516100330.1433265-3-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516100330.1433265-1-xin.wang2@amd.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|BY5PR12MB4115:EE_
X-MS-Office365-Filtering-Correlation-Id: f596d05e-10a9-408c-7a0a-08dc758f74cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hHCAM0qA+YQejaY8Ejkz5P90V/g78QFOFlZkGkZdpZmnCNzTPawDr+0lXK/Q?=
 =?us-ascii?Q?lOTtamM87/KlPnlc8MkZjtHP/yAcc4PN9a/D2IBRgTOcozS16oDgolr2v+uX?=
 =?us-ascii?Q?TGcBa5mFRj3nh8Y/iVq1/T+yUIJYLpRC4rHLBbulJcq+oUTbUmSSeBpCFTS9?=
 =?us-ascii?Q?ORnTVWgN45NpQwlupFDuyIPoZ3u1LSVYHl+IQDySLn7wQyqpwzv8cDxXgFdu?=
 =?us-ascii?Q?dOL0Lx9DyxDMd1t5njMLom0BcSJt4kXLhGZX8hCoLTM6mn/GZTg4ErdSLUuz?=
 =?us-ascii?Q?sPEKg6SGmgXKAJugQakVU0+PrBE0/WzB4orVQlkQFhEFQ505SBS+zf9ZClhd?=
 =?us-ascii?Q?gDcDW5GTHm2JppcJ6VeUaDeWbVq0XV0x5xzQlDefMWpgMVxfRzOQJrHgqEkh?=
 =?us-ascii?Q?bWZPQfSIl+kOTA5sOeWY6Y7waVBCbQvtpxIcI7RHp9GdPk9582wGQn2niyM7?=
 =?us-ascii?Q?LshtjNrlK9w4PcZKEAiVOtt6Umty4ukkJJJAppExNqn9RfCwEu0t4SW3bpVF?=
 =?us-ascii?Q?BwOM6kMk4KxjkSx4ycDQBsJcqoZ9Bmy8v2Sj8P5joVKNc36ndQTeLJclR7Gg?=
 =?us-ascii?Q?L3Os2MnluclWzvhp763uf9JEDW6VTZP5h5FJiB50P3AaXtzsvnU9EfqctCZZ?=
 =?us-ascii?Q?mtCkOfso2cOHlUYFs2m/tLiqp6qspX2l1xS/m40TIehXk/iGqrugXPfY4JDs?=
 =?us-ascii?Q?Odkb+qQKPxywyHqyztvW/8noMMcaF2o3u6i5W9R2JL5ayNM+3Y1Wsb+l2BHA?=
 =?us-ascii?Q?2asJFfsywu2VMVAB/yWsEMXiCvbgCX6bSsKTsNl1SfsYAVYLdTlJbIjGu10W?=
 =?us-ascii?Q?4C/owNzJr7pcD+aExUzvbhT7o6CvYC887Y2jVliRk30xtWh+OgdjB1hJQs47?=
 =?us-ascii?Q?O4tor6PA733nEoBw2P7sxwf3kFeV5UkytnwtRAICt6Fai1V6jtzlLFD/FJKy?=
 =?us-ascii?Q?c0JYfYp4nh5lHzxG1PeoUrmQzaYRzBxCvVfkAavJomHZc/J2W/LyTfU8F+da?=
 =?us-ascii?Q?aUPgv/pJqh4OF5Xf1K0ijKyWPBnze+9J9lFJmhAEVs3TzE+btbfmDrgXv7C3?=
 =?us-ascii?Q?JuGuIYXUjd5tmO4Q5RimWd2YuEzK73v8nF3sH9js55uRjKKrclEpufHIS0KE?=
 =?us-ascii?Q?JyUaR7Pf/TCAuhdR9Z7/BBND8CvdXAyskPEwFwHlceSvipLqcfvrE5IPhj0j?=
 =?us-ascii?Q?WOFFuW4kXWIt1WUlhMEas8HVQElslbUi8qvA6hF3wTJRxmt6QRCekJaxno4u?=
 =?us-ascii?Q?pt57ATXgaUfjHk1YAaTocWGZod+Keusm7AmlTCMso2v4D26om5HAWW9UnZhL?=
 =?us-ascii?Q?MtJxlvSiH69Ffxoh15YPG/B2UKTIyVsCRX4r/AdiHdCMyy25VWobm1DtJZOv?=
 =?us-ascii?Q?Dn5W6FE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:03:37.8445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f596d05e-10a9-408c-7a0a-08dc758f74cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115

Fix the name mismatch in the xl dt-overlay command, the
command name should be "dt-overlay" instead of "dt_overlay".
Add the missing "," in the cmdtable.

Fix the exit code of the dt-overlay command, use EXIT_FAILURE
instead of ERROR_FAIL.

Fixes: 61765a07e3d8 ("tools/xl: Add new xl command overlay for device tree overlay support")
Suggested-by: Anthony PERARD <anthony.perard@cloud.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
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


