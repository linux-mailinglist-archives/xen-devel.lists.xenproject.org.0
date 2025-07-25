Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF59B127B9
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:59:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058720.1426246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSK9-00089I-T6; Fri, 25 Jul 2025 23:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058720.1426246; Fri, 25 Jul 2025 23:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSK9-00086H-MV; Fri, 25 Jul 2025 23:59:37 +0000
Received: by outflank-mailman (input) for mailman id 1058720;
 Fri, 25 Jul 2025 23:59:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSK8-0007YZ-Tz
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:59:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2415::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 695fede1-69b3-11f0-b895-0df219b8e170;
 Sat, 26 Jul 2025 01:59:35 +0200 (CEST)
Received: from BY5PR17CA0038.namprd17.prod.outlook.com (2603:10b6:a03:167::15)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.24; Fri, 25 Jul
 2025 23:59:30 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::c) by BY5PR17CA0038.outlook.office365.com
 (2603:10b6:a03:167::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 23:59:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:59:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:29 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:59:28 -0500
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
X-Inumbo-ID: 695fede1-69b3-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yb6WBpbeMj8OUC4WiGkFTpo6pTl1oN1WOAQPJhabShz9npYXCD5inV/9p/gD5rmcfTw4y4JWBAyPIVzifsGNiy9nB78bWyfzxhC53QBFPklnA6lGneObO22rYnQc5rJ7Mb+/Bl2gj4CtB08UXSUTaCCQ/FR6JFVfOMXDOrKu5LxWvkPtVBukyeUkQl/NInpKlA5O5q2zWCW4unYnsMKhWr3P/F8M9W2KbBRcZGQw/yh4dXNEHX3m77z8iSaubK9y1yuf6mWVpFRIPZfL72RziaY2R0Ui4fdnGgEc+08FfHv/r9uSsTnyW/3N/ZnEylZWetCz+hJSCSQbK6fxNDiScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7V3nt4OkeSNPSJ4nHqixXneapfe/i7O8Q64iPvkpFA=;
 b=U6zntJBrWrr2Tdt4PKws9HtsDs8BqkaSXpZEi6aM2hlrfScz5ticrj6I2mK5XhdjQkFCH61C/4CJWVqkAFmyOinTH80G8qIJwnM4jPNj4y/s49tzPPL1fOIWebVFrx4bTp4kN9ofp9X/ttm2UW0h3VLelOL1/+1V9ww/JfoDrKKCx4YipSbmUkMEMsXIUjN5u+wEQojaR1VLhRevT/ZHDk2rJaw3jMnWDU8pAS4pw2Sir0TWUjarh066/6ZAhCyPq6P2U1w81U0rIKJJ3ILhwGSZ9DltLCVilSajpDXIVVp8eP8yzgfn03fVkVDgoESC/6v8FXYMVgghM1cb4rxSqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7V3nt4OkeSNPSJ4nHqixXneapfe/i7O8Q64iPvkpFA=;
 b=tdiFRGYgZJdCZHh3kESsKGBuQLPjnFLgxU46f6IydmwhAAFf4RIyYMpqPpPG2KBDt25TXeCkf8P+PS8YcZ8RjedUyqFBKBlKgLeJSLzcr5JiIfP9a1tX74odgp0zcWdAqR8D5QR8NaUK0EdWy+UR/s+RY3QngRC0RzqiHhL9j3M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 03/11] public/io: xs_wire: Include event channel in interface page
Date: Fri, 25 Jul 2025 19:58:50 -0400
Message-ID: <20250725235858.666813-4-jason.andryuk@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|BY5PR12MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4832a1-777c-4f72-8c04-08ddcbd74b76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oqFik96MvO0a+jLZpe8sUf7+qrByNXJih4ht+L9Qm39drrwiZqbxd/WMyEB+?=
 =?us-ascii?Q?t5vnoI3C218GEQCeiW70rALdDSq4cOxqKsFitXEvvvfNPnDzxUQ+5IuXjiHk?=
 =?us-ascii?Q?0jBFAeqvwfl6U+LIAzjmlzV7N0Se/28qNqAJF2/3567D6TDZudPEadeFLnbG?=
 =?us-ascii?Q?lSnTO0k42Fajwa7+lzJHlZCETSYKuV9Ai2h0uihirOVnIVJ68voiPvUwwNAu?=
 =?us-ascii?Q?eG1G7fyfejsbWAn06L/17X5OkPyM6HtFiC6LTqvrqPT2QJ3+rWCP+HXTy9mq?=
 =?us-ascii?Q?Fb4sfmU1OAr13GkB1EPzA8JgHYzASySQivNIga3SaLZQtrC+rskdD1lw2xUj?=
 =?us-ascii?Q?UcP0LHttirthfsmSonAfaW7DpBfxnxmzueqi7UX9TTLw2MdY2EafWXHuZDe3?=
 =?us-ascii?Q?3so9otzLiDdoPdCxtlOT8UJbb59qiyY8P0QvgwuodnM9fAZXPPYq5OTN34sE?=
 =?us-ascii?Q?gVwpYsNDZixkI+ps/zWbio97VfbohrQjrejdzurC/0hWIkcnred4xkDwDkCv?=
 =?us-ascii?Q?VIljQv/7AudpJ5obI2PHDA9eS5MUEVKuRx/hyU8aUkfZNzJaBECgn3FGDW4M?=
 =?us-ascii?Q?wr3Lj7IA0/SP+P+ZmGC9EZoQ2VO3Csx4LlJTVQL00b/gnuWrBc3G9NdV32UL?=
 =?us-ascii?Q?TfZfear1WGaOiYDQX2UxYRBaKfuj2Bg/62e6Tukrw5DMLbRiNH5GofmKpv9m?=
 =?us-ascii?Q?y0jmVKauwaeqpkH7Sag0E/EtknOY6pSXRlrzoK/sDppnEXA6+3EYdw4gj80B?=
 =?us-ascii?Q?95024nyKqYwjUqPQezEcRbOHtmfFzyF5wctHDtezr+QsmTcD+vH4iNIhq9GY?=
 =?us-ascii?Q?xhEfAcDNVIQmBCGHoSjXOI+H8ejfUY3deEO8MtJY8so52Kl+DPqWMYcq3QV3?=
 =?us-ascii?Q?rgRMJ5/0o+pFRp7ShVxG0QIpIXB9qr/i3w519xkBcDRL492mNyOH7yU+9COY?=
 =?us-ascii?Q?7aMYT3JIQA/g0WrCaclrtAyLT+cLCOPPzVYbG64dbNXHGPjOjpXch9KrIR8v?=
 =?us-ascii?Q?7QEMIu4wVMHLOnwOS3hewfJ49uvndGyYXkW7bcjVMxBy3YJkVgmn8k8RE+/s?=
 =?us-ascii?Q?uVZB9TWeKq+REajIfHT8pOJ2k8sVTVF/X40d9WQmw7kKOvWfRKqP9ZrRBRq9?=
 =?us-ascii?Q?x3CG4kkTOXlKUBaYZemaQQCfEbEzR5iRjHr9wbDI+d7uusD/SgdK6YZNeJCK?=
 =?us-ascii?Q?lRl++F3/gXULfYxKcQpJcXAaN2d4KxaQKRKmV9EbVaMRv2nFt1xZEVRdXHwQ?=
 =?us-ascii?Q?1p1+jdec5cHGGg27Gm3VfwlxaNy5X4utXsfVCIK04PiMW/w0G1V+1xRNZG2A?=
 =?us-ascii?Q?PR6TpdH8M/2mGWOXM1nFDWTLEMkWdYngauenI756tgDdX7I2nmoN8gwBX/dz?=
 =?us-ascii?Q?MKohX5+KUKq+gCgZAz+UN/hqoBLCuL5YMAmei6XNqnj/KeDmXoRf6aTxxhfk?=
 =?us-ascii?Q?tN1hyVm8etL1wCRD5JYZKdg/fr2mhxq62Ok9XUXh2Jyy4rvz/KYbrtupx8U6?=
 =?us-ascii?Q?nyGNM1j5KK6mmTaui07cO83cX50GdLrSKNFC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:59:29.9610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4832a1-777c-4f72-8c04-08ddcbd74b76
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257

Include the event channel in struct xenstore_domain_interface.  This way
the toolstack or xen can communicate the event channel to xenstored in
memory xenstored already needs to access.

xenstored maps the grant with the well known GNTTAB_RESERVED_XENSTORE
index, so no further information is needed.

Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v2:
s/domU/domain/ in comment
Add Juergen's R-b
---
 xen/include/public/io/xs_wire.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index e92a87a07b..d2e2b8b9eb 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -110,6 +110,7 @@ struct xenstore_domain_interface {
     uint32_t server_features; /* Bitmap of features supported by the server */
     uint32_t connection;
     uint32_t error;
+    uint32_t evtchn_port;
 };
 
 /* Violating this is very bad.  See docs/misc/xenstore.txt. */
@@ -134,6 +135,12 @@ struct xenstore_domain_interface {
 #define XENSTORE_ERROR_RINGIDX 2 /* Invalid ring index */
 #define XENSTORE_ERROR_PROTO   3 /* Protocol violation (payload too long) */
 
+/*
+ * The evtchn_port field is the domain's event channel for xenstored to signal.
+ * It is filled in by Xen for dom0less/Hyperlaunch domains.  It is only used
+ * when non-zero.  Otherwise the event channel from XS_INTRODUCE is used.
+ */
+
 #endif /* _XS_WIRE_H */
 
 /*
-- 
2.50.1


