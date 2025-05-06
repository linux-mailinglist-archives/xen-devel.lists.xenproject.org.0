Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB09CAACEDB
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 22:46:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978014.1364896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCPA0-0008JZ-Kf; Tue, 06 May 2025 20:45:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978014.1364896; Tue, 06 May 2025 20:45:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCPA0-0008H5-Hk; Tue, 06 May 2025 20:45:04 +0000
Received: by outflank-mailman (input) for mailman id 978014;
 Tue, 06 May 2025 20:45:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LATA=XW=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uCP9z-0008Gz-1s
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 20:45:03 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2412::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9be76b3-2aba-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 22:45:00 +0200 (CEST)
Received: from BLAPR03CA0086.namprd03.prod.outlook.com (2603:10b6:208:329::31)
 by CY5PR12MB6036.namprd12.prod.outlook.com (2603:10b6:930:2c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Tue, 6 May
 2025 20:44:52 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:329:cafe::41) by BLAPR03CA0086.outlook.office365.com
 (2603:10b6:208:329::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Tue,
 6 May 2025 20:44:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 20:44:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 15:44:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 15:44:51 -0500
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 6 May 2025 15:44:50 -0500
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
X-Inumbo-ID: f9be76b3-2aba-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJrjXxWuuq2A59bZ72Tqu9LmeZ43/Z0oSpEvzYPa7rmKkThK3XP/epGQPR24U1XxLMw3rrsadA4lRA3L0xqd7p2LArdx7scK6Z7nN/qLoeGgZuqcIZMlipmw97X/HBK7YGkhysfYvk4acHC4KooVGzg+saKan21adhDQu4IwCGqO8qUuD4jnmONUyXT0K5XFi1ryewHgK+reNu3sD2WUolDETNHI1PDXjXabebVVhEqEnGUVmb5vEO0mIKSDFDr/lYWsbMsWHlOg3IXaevEiDjXgaxtGL4pq0feq6G1kqfSJKmT599hoAISOWQ4Q4hspeZFTRxIYrDkaReYJR1CFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tH2aBzTLtGyOv5D7f7OeME/gvHNM1uvC6mzTtLdJQE=;
 b=CpyV7sroFdumwDXSmtPHzBSHmm7DwplpqEaBwWs54ed8ykyG3XCYy6U0TIn0ZFlsJPZ6DmZn9oZcl5nD0r8lgpJvDLVmhbhpMJpcEehOZHx5FmL9Kb9B6PCdka02GjKXJlE7+6tVZmf/ACkUm83SzL/nOMQn7+3wh8tzhWWqER4QWxn25l4hbKy/42/+UHagD0TqMt5tk8SbcV0Mfa6IFEYZlrxxjHZmNf26TgF04VWagKoY/IYOBGn262V9HaiRFewTto8HWTuh/llDHCSCC3efVdoq16mwrsEjD4D+jW6PFplDB4YHDV+HDtzFnhJOjt2tSp3KU4FIs1vevcXPVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tH2aBzTLtGyOv5D7f7OeME/gvHNM1uvC6mzTtLdJQE=;
 b=D56GcaL05AACcrNACB521xL6fWRlmqSAfX7krICDSHO8grFn0hR3KSach5heMMriZdAI8F23OZrGkHnOIVj95U0gTzcN0e3+7fWuluSR3seP8aMmaLYSyiYlpGyAHsX0NBkUrbG5/jc3R8oefHMGTEUjPCCN+vjr25Lzz4R+uZA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] xenbus: Allow PVH dom0 a non-local xenstore
Date: Tue, 6 May 2025 16:44:56 -0400
Message-ID: <20250506204456.5220-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|CY5PR12MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: 054fefcc-122c-473c-6933-08dd8cded9b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kq7VJbIXgT0QVpxbz4uqZUDZPrzqKCRkf3HWW0vaFIlRkUNwhI00rKYNOAWZ?=
 =?us-ascii?Q?hCqTyf6mOiUn4uuQ0zkP5DziDGCjltqwjL54ZCnnvaTkHl/KEwnaV9VM8fHT?=
 =?us-ascii?Q?rwdXNCyY+7RI4z0CJXTeU3PsnNSt9gFwXm7llnBZF9esRsKO96pPyKOM4LNu?=
 =?us-ascii?Q?bv9zEX/Hw5/oMgnp4oPz8ys4D5ZrmQ/Azj4x4ep/FIgZrg2vAjwfZUGclJl5?=
 =?us-ascii?Q?H8MGlLOftrBNnoWfSPP48+NS7yci8SwWL/2+7mOoJa+fH7uQq+9YQavQ3RZ7?=
 =?us-ascii?Q?nnsaxjxhg/6tgO+EdXWPf9uKcEfNTDnMrerXuwmueLxLngYOgml2wp6RTu4q?=
 =?us-ascii?Q?TlJA5JMQ2ohH+y4GulHaVw7/VwYey/5o6UPty78zdf1ANzemYrDiC6v9nakV?=
 =?us-ascii?Q?n86Tq07kyYDMPMLOuGe7+lz0/SqpZxoaJoRbOlhLFC/qj+mjst97jJjrS/xl?=
 =?us-ascii?Q?CaEpR/TYOtK9R//cV9yyMYHxhBpRCRwESBL9xBqox/vtK9lfsOJk77ePsYwk?=
 =?us-ascii?Q?IULzCzXZk8uUhrQPuinLmcBXM6FxxNkVYQ5JhbASqPn7n04iabX+KPglaKpg?=
 =?us-ascii?Q?6SCaVJZNGe0qXO7w+mlAxdfssTWOsgt4QjzXRwBytmp+yOkcyclyGwJMncky?=
 =?us-ascii?Q?ZNsDFwMnhSGJNFDwCR47VJm+1BLsIf3aUlzSrOCxXtmgEfLP/LObx0qRkMGq?=
 =?us-ascii?Q?Po4TP2CHGfBr944HtEvkQEjNrOkA4aNRajorLvDCzjZcVlnBmRuIfKMGBsY0?=
 =?us-ascii?Q?uIL/J06m3vKA+K+JF+nq8MQQZ2mAx4RW090zSjAbkmdC2tk0GUCaf6FwyZ/i?=
 =?us-ascii?Q?zWeQRQVkh6Wu/Kmy0SFquTYsFdZAghuUabASxN76hbU6u/iRl+uESPf1sZsn?=
 =?us-ascii?Q?LHrTZdYc225RU3LieR2DxIpHFQ+W4jZ+W5WZO2iZyiSh3Ow9s0m70d8mt6YY?=
 =?us-ascii?Q?AxWLUeCHhskOPHenomR6Pxe5czH0Y7o9SMFri9WOkmSvr267Dzp58wrNrBnV?=
 =?us-ascii?Q?Jb4u1XhS2u0GeowFxdvSQ9oadazb9FAbCXAqO146n3IZqCYrDLD9mxVzsNFw?=
 =?us-ascii?Q?l5LgNiWPmHOSOdnYJZY+KJtf4gZUZq6Jwuw/VFrW5kM9wSLZ2TE3c8roRuZm?=
 =?us-ascii?Q?FmfMkMJEBY1a3vXfXqZIuMV5I/fuUuZZL9OS61pVoFjJQXVvYMmdXMRDVz91?=
 =?us-ascii?Q?2GEb5eKQYgfPHgCc7R3uKCVuonhXLa/FOqwcy930LXJxVGG/eIq5bFg/mvi9?=
 =?us-ascii?Q?Cm4kaDLlVAs+PmNp7U/JydPmaTdFSzsmYNFATZN+hKrYuNots7n0ZUTeef1w?=
 =?us-ascii?Q?l0WD4KuN8qtFIjBr8wmFBLfSjEpbMpD0S3o1SDY0sEIGDZer4dLjAEUb7vaX?=
 =?us-ascii?Q?MvE7yW4TYa/6dr7S8GnQMdC4F0dbXn510YLDl8lfMUDly/Xyh/LH57xJz06V?=
 =?us-ascii?Q?zP94PL/0SvA4RgNYL0Gvmlmy4znpt+DYoJS9ypWdzExwpn2QIgLfjE/FZYWD?=
 =?us-ascii?Q?5SLRz5zt1izzkGo/+XRxl2CJZux1NewJbAJK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 20:44:51.8897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 054fefcc-122c-473c-6933-08dd8cded9b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6036

Make xenbus_init() allow a non-local xenstore for a PVH dom0 - it is
currently forced to XS_LOCAL.  With Hyperlaunch booting dom0 and a
xenstore stubdom, dom0 can be handled as a regular XS_HVM following the
late init path.

Ideally we'd drop the use of xen_initial_domain() and just check for the
event channel instead.  However, ARM has a xen,enhanced no-xenstore
mode, where the event channel and PFN would both be 0.  Retain the
xen_initial_domain() check, and use that for an additional check when
the event channel is 0.

Check the full 64bit HVM_PARAM_STORE_EVTCHN value to catch the off
chance that high bits are set for the 32bit event channel.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Change-Id: I5506da42e4c6b8e85079fefb2f193c8de17c7437
---
v2:
Re-add xen_initial_domain() check to avoid breaking ARM's xen,enhanced
no-xenstore mode where event channel and PFN are both 0.

 drivers/xen/xenbus/xenbus_probe.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 22d3f90ee205..b12cbd9663e3 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -969,9 +969,15 @@ static int __init xenbus_init(void)
 	if (xen_pv_domain())
 		xen_store_domain_type = XS_PV;
 	if (xen_hvm_domain())
+	{
 		xen_store_domain_type = XS_HVM;
-	if (xen_hvm_domain() && xen_initial_domain())
-		xen_store_domain_type = XS_LOCAL;
+		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
+		if (err)
+			goto out_error;
+		xen_store_evtchn = (int)v;
+		if (!v && xen_initial_domain())
+			xen_store_domain_type = XS_LOCAL;
+	}
 	if (xen_pv_domain() && !xen_start_info->store_evtchn)
 		xen_store_domain_type = XS_LOCAL;
 	if (xen_pv_domain() && xen_start_info->store_evtchn)
@@ -990,10 +996,6 @@ static int __init xenbus_init(void)
 		xen_store_interface = gfn_to_virt(xen_store_gfn);
 		break;
 	case XS_HVM:
-		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
-		if (err)
-			goto out_error;
-		xen_store_evtchn = (int)v;
 		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
 		if (err)
 			goto out_error;
-- 
2.34.1


