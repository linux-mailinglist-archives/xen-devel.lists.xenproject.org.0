Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14CAB480F
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 01:54:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982255.1368802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEcyY-0001ya-1q; Mon, 12 May 2025 23:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982255.1368802; Mon, 12 May 2025 23:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEcyX-0001wE-Tw; Mon, 12 May 2025 23:54:25 +0000
Received: by outflank-mailman (input) for mailman id 982255;
 Mon, 12 May 2025 23:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNBB=X4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uEcyW-0001w8-24
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 23:54:24 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2412::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ca86e4e-2f8c-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 01:54:21 +0200 (CEST)
Received: from CH0PR13CA0044.namprd13.prod.outlook.com (2603:10b6:610:b2::19)
 by PH8PR12MB7157.namprd12.prod.outlook.com (2603:10b6:510:22b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 23:54:16 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::4e) by CH0PR13CA0044.outlook.office365.com
 (2603:10b6:610:b2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Mon,
 12 May 2025 23:54:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 23:54:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 May
 2025 18:54:14 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 May 2025 18:54:14 -0500
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
X-Inumbo-ID: 6ca86e4e-2f8c-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3kzDHPIpEf5EevnDgjJoEcaI7xJ4C3ubiE8ViyT1eA2PBSt2peEzGa/cR5yd0pgIiz1SspbJR5fIMjk/Gp6xmIHy0iQDkM/Hf6+t8TmNk/262PQZFGaFdMBF5MITADqKpDpcIAz/GKNzo/rl0czspY1NV8V4YIX3aQgrT2AbIw2ziB7jTzq1w5LxSP7vDfAnG1zoYhslbB01gxN5gy+Co9gmB0Z7LV3ugdtDPnE3pxQp2dhs7+J01kQoDKa6kbwmUpXf3kINubNwRX1/WgEc8GeayZpZGXtz6E96HCOBWd3UMS5Fg677WwNVRVLJ6CWzmwWsl199gEBZale8AbYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aF6YROwOuGlvpozS/KCefgc2H3PvRpkN/JGW+4Y0CPA=;
 b=xU1xSWwx7ZVIohcRScwyuqPyAUI4B4/GKCfyQ4Lhpj3Ef2lbC6xZTRWq7rogajTmaElu++RQHAxamFg+BZUY76cJKd136ydzVctRCb535MV4YPa8inTBQ8yv5bUfxen9kouQ6KTc5TQUXnDNsWHuZ+a6CKBXshqJZ1TnoM1cdo/3PbIB5A15ETBnpk8EirH22ompcajAnWv7r/SVtvYIDI4JRCxbSiMT1JKwCC+p1Y8KTRkwooKAJ0e3K7Rhv+kMibOa/tafx6m8/AUe/fFimNd4V4NoiNGbuhLL7VVmwJzh13uOBxzjiYtmwWVTtpWwfmEgnNioA4+7XQTiu2S4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aF6YROwOuGlvpozS/KCefgc2H3PvRpkN/JGW+4Y0CPA=;
 b=0X9MIKAACl7ySVZ91FvLVWm9Onsjzjrapql63uh1ojRvVSvqG553rD/ejl6fTggA57hISZBbSPoAD47WFFV3nYL6hsOuw5fz+iUqCy/2OGAE767AqwFaKMUpG9SP7eOaUBiJ3iJFXky+zW74Glv7ArxYH04N/25wQCDeKN2J9V8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libxl: Only access legacy altp2m on HVM
Date: Mon, 12 May 2025 19:54:07 -0400
Message-ID: <20250512235409.18545-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|PH8PR12MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 9536bfef-7361-4bc2-e442-08dd91b04d44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m3YSaJUj3TVL/jhTDnprYriagf6IuKWqYmYTAAj3zQhMAgORb+wvZMMaNlQs?=
 =?us-ascii?Q?A9y3uJLfO9LkaL3eSE1Hw2yfrbJIU/VwVtfVkoTVcxf2M+UNoezRLbTnqVzE?=
 =?us-ascii?Q?OnO3w9AoGWHrldYn0Grgv3pas1gqCpqWRP1k2rzj4Ieyy24RqtPOWCDijCRz?=
 =?us-ascii?Q?Eb1BPjvHWOmYYdrbP1d4JXWtJMQuW3tEzTWhJL0tLxIYx+SL3zm221E8GKd/?=
 =?us-ascii?Q?A8WiRHI/VLa4lhn1yQkZElIhbrSsBhIeWaNYckcl3MNbKl7g7yqjZN83IB71?=
 =?us-ascii?Q?LgWOl3/f9kkHdsJuVoEugGEPBlBZQIJlCejvjVfDI7dutHE3Rf4psqha0/QW?=
 =?us-ascii?Q?Gc4IyLNvbaLlag45qsVVq7q/j4BN0VJwY6p6+QsVZ1yqKDiMzoaF8H1MaqYF?=
 =?us-ascii?Q?mUba+46GIzNE845pe9QzzDxfpSqZWQKYT522o164neyJUX2Ohc7Mbe9nA4CA?=
 =?us-ascii?Q?QFvrHgA7kC2iyiZQDxyvizA/tASegVZs6ftu6U0eDxsFr84YOOspu5U6+X2s?=
 =?us-ascii?Q?1FJrh+HhIcTCO6kB4DgdJNrh/RvHRC0TJX90Rkk7e5pauywkzXMaHH+h/ct7?=
 =?us-ascii?Q?CrBWdWF0pxpv4vyNntAu9JrLuU0DgCoWHgFxwdEBjy4lLKyyB69g9YLGllQD?=
 =?us-ascii?Q?kCHno6ErHxmFd2XTQvD0kh5zu3IKyjW/lBHtOk9ONnyXdPSotPVy4WpbLmOl?=
 =?us-ascii?Q?LL1aaiuGizUV6ajnrMLle20rSWlyFlxdhzxJuEphKCoQNb/SGKIyo0B4aCof?=
 =?us-ascii?Q?iuT7ba7pHJYDj7n567jQeZeAtZPBAY4tVGgO2PxC3+sUMFjwFR4Yt6678VGF?=
 =?us-ascii?Q?0tQO4pqloajPsyIK47a2Q7tcT99YAC/FJJ2Ye2yRDNVW2CP5IoWmE5HvnKgk?=
 =?us-ascii?Q?+nmc+sEIoMYVHWD40qlDzySYpOZ7IFLfOwhdzYl7M10YmM1oNytK/AKtjGdS?=
 =?us-ascii?Q?/gh0iOu9RDBTep61IqL75FhRW5aIySLQgKSTmVj/v5g2zWpQm+1nSYBqJQbJ?=
 =?us-ascii?Q?RTwiBBH1+PZMn3tQHvdL749T8nCzORkKfiAhk369lfZOAeeha20EqxmLNF2f?=
 =?us-ascii?Q?+7cfVKejnlKJgfOolHvF0cGYVVRhr8Ufhh8wfW+TSKNH2Tcj0jQhnJRG+g3P?=
 =?us-ascii?Q?tZuQ+8TJJh5gBf2vKKOYii5K6QTTG6KKq083iuJivt1KEeoKhRs1grMSwGra?=
 =?us-ascii?Q?+5KPSmQcztjOvw1b2ks6s/ZeyIv4DgdFCgK+YlhRr6WpXnK1qLJ3cmdVapVu?=
 =?us-ascii?Q?WDonMFRkxig03i4lTyXm75VdbNaCVsIlxNfgirH9i8XUJqCfedpDfir+U8bP?=
 =?us-ascii?Q?bB0K6aBGBqRv4UxsJTqgvcGgRwcvAx6Cy3aQB2dsTEIYT20dHaesJrKlqfwY?=
 =?us-ascii?Q?6YfJvid51peOPWUSJ2enm0vm0slqj211G6LfgfoJldUsRntXnshJs87OiueT?=
 =?us-ascii?Q?6hAnVKtcIRplIbxwU8yjwZHJKwWYXwqwmDAw4jshnjhEVFQoygx5TZeWHxPt?=
 =?us-ascii?Q?ltpc1ARLKbEIYBHjJF8zio2c8BAXGe0RJAuV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 23:54:15.2549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9536bfef-7361-4bc2-e442-08dd91b04d44
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7157

Only access the HVM union b_info->u.hvm on HVM guests.  The union
access is not guarded, so this reads and sets the default even on
non-HVM guests.  Usually this doesn't matter as PV and PVH unions are
smaller and zero-initialized, but the zero default will be re-written as
a -1 boolean.  Generally, it it could incorrectly set b_info->altp2m
through aliased data.

Fixes: 0291089f6ea8 ("xen: enable altp2m at create domain domctl")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Change-Id: Ifaca3533dcce3f409c2efa292c7e96fba6371d9d
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


