Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B67B287C1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 23:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084083.1443500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25f-0005G0-Vn; Fri, 15 Aug 2025 21:35:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084083.1443500; Fri, 15 Aug 2025 21:35:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25f-0005Cm-Pz; Fri, 15 Aug 2025 21:35:59 +0000
Received: by outflank-mailman (input) for mailman id 1084083;
 Fri, 15 Aug 2025 21:35:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IuPz=23=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1un25d-0005Bt-Oq
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 21:35:57 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2413::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d35bb020-7a1f-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 23:35:56 +0200 (CEST)
Received: from SJ0PR05CA0194.namprd05.prod.outlook.com (2603:10b6:a03:330::19)
 by MN0PR12MB6004.namprd12.prod.outlook.com (2603:10b6:208:380::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 21:35:51 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:330:cafe::f2) by SJ0PR05CA0194.outlook.office365.com
 (2603:10b6:a03:330::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8 via Frontend Transport; Fri,
 15 Aug 2025 21:35:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 21:35:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 16:35:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 15 Aug
 2025 14:35:49 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 16:35:45 -0500
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
X-Inumbo-ID: d35bb020-7a1f-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPtkbm23uPCfYDWELpsvlmSOeHEl8wk7RR8AKt6x4uTdbck3fLVTXem71xf4PGmGmRmj4WPZeNRF1D64jEKJGQhppv4PzssogLk1HsfOYkF7rymeHoqods2mr3zOv3lU54p0DHYok+Q5YDGh5c8WkjwGhdCXuZLCZ3yqI45/hNA0tL+Q1ZXlaX4Af7OxJLUe7nrtTYsKLYVvauGgZ6PzTt3lGzd4CPs0q1gWOl2/4yOf22++UValaXGWiI7taTexEvYHfiE4PxUnCuIRcJbvMJ8GRQGX3ZzWDCrKMnMO8/5cVI+F1DJNtDu+/FOH60eLghrX9O9PjD1JJ9l3IlgFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVn2duUPp9hjMB8CoqALfiWNheVOsXnVO9y1TaPjV/s=;
 b=iOgqRK0ozg1geOZtrEFW+u0UpObRdfp5FIGFkY/ttRdr2HQmkcW8yjCDnQySDZr72l4asawhaM/vw96QZ+gj4wK330H9twpxxn5d7sfm+KuY3Zd2IuAaTgSUtbKH5pRmyweRR9SNyzTFmefdqNCtq39Q9TtQq5ltNWkQmCu3Brt0vjzzj+Eev5EaUV668BuYlLQuDkLEu2jYLCMlTL8mxPQPMsyZKJDOD8z63uVdswWBFMxzrL8ofBtdj4MHmmk5Eed+73+4YKoaUje8J5Chz/w45VJf08BjKcoA9LLk9aMsMSwEzE3jPhOdKxsC60Q2fDcmj5R6dzaODHVu3s+4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVn2duUPp9hjMB8CoqALfiWNheVOsXnVO9y1TaPjV/s=;
 b=ZyiffDc9P65mKZ0Rq3mRxzlJc9B3f0XbNkjWhPkeSOyBa3taKbSba6LEE00rlFhVi5eFHlIFe3CrGygF9rka8MaOtQTevTGtnpj5oFYRmNvfyz6JZkDgZUbr13ClvhxZJRQ/5ReN/0cD2QTpaXCW1Jmy6qL61Pu8RtscvqUWtqw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v6 1/8] tools/xenstored: Read event channel from xenstored page
Date: Fri, 15 Aug 2025 17:35:49 -0400
Message-ID: <20250815213556.90068-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815213556.90068-1-jason.andryuk@amd.com>
References: <20250815213556.90068-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|MN0PR12MB6004:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8980c5-5113-4b8e-7456-08dddc43b4d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q2iWiQfB3VnN4jwIp6UZmXVaohc8S6XK2yYWDuLkTbCIIEcwi7qRdavPQSDa?=
 =?us-ascii?Q?AgU08rVZfYhiwwarzPdXvwwor5UP196Zw/Ph/RWovJs0qXIPHzI67q+Wmv4q?=
 =?us-ascii?Q?Sk30azgqTuZZVZRRJS9Zg4LISnbKoG0dCXYPXXcW6IUHELECD5/IEdv3JWSc?=
 =?us-ascii?Q?wH2myzwBSPsqs8UFN8vw4pM0e/RuwgfbGAPht9DRcZ5sIGIHSwwceWMrgZKe?=
 =?us-ascii?Q?1bDqFquaDhXCDae1T02RIqBG2ckGnRSZqx8nTliRfJ2QRqubloqO4r/58oca?=
 =?us-ascii?Q?uORdMOUwI+zIqungdiL4+6I7ekFguCiTL1Q66pXizs2GO502+lAAuEQ81CSC?=
 =?us-ascii?Q?brrdsBz4vew4JvwmiocTRhJCEIjGeb/dAkJLEjNTv8mNSqvP197i9W/deyFE?=
 =?us-ascii?Q?vDD8AnDr/A/61bVxjPzOsVlHfP/zdKFO+mkcezd7Nv+A83L9oqRyrxXjNOeq?=
 =?us-ascii?Q?aDsuKZIsRUcwuW9otNwFbqw+6rIQ9QTjDgJBxqWknXKVPs2vQNX+3HsZrpis?=
 =?us-ascii?Q?wv8YXhD/LFNe4l60rfZSh/H+GBvSfNseFTOQxBk4VndYnAdxH2ONcdKna0L1?=
 =?us-ascii?Q?ONcrAdYgJlQgFjhjMKkECA57LBs3pBztfeTYROdyEd8N6qfdwJUGdYfOq50K?=
 =?us-ascii?Q?FuyyaAzTzxDMWD98xFnZjag0OaO009xn4Hl5SK21yY/ScyAsqNfy/CmmtPwO?=
 =?us-ascii?Q?y4J5qn93uZrp02IfB49pruzqEtMORl2ag5ePIoLNqv0mRDNZlovMUF2OaaEG?=
 =?us-ascii?Q?3rU10khBm7KASL9Sgt5q4zHVLbUo4nB4KUET36FY5XYc/yS3MLxYDswIzotM?=
 =?us-ascii?Q?mwYHlF9tTasiUF06QDxxOFO2lPpwb2mlTx6up1HCk7bvdhCygd2wuI3LJVSa?=
 =?us-ascii?Q?U+0yHXjfW7lGuO2PU9fXS5LdSY3GuNC0z1wg55yNOMeTFvW9kyCkoUgIqKO+?=
 =?us-ascii?Q?B7YEHCNtff9fb/Jndqf8ioOdd84iEMPFqCGRZ/PiQ60Ofh57HwYj4/HsKjLq?=
 =?us-ascii?Q?tW16kNQI27w/oLggeNDD7uucp3Ks7C5k02aSyqC0pbkkM8BzjVB9wdJdJXsd?=
 =?us-ascii?Q?5O9GrHuBbLwQMZFb8ww/Z/Y6vxEyxZzdmG5rFaImkm+F0UzRkhvr+EP9l7XJ?=
 =?us-ascii?Q?MVlBNuOiLQYCx7YFGs+AWD0mykDo+LiCyvdQtx8/oAuK93BlcsYMFRxbjqGj?=
 =?us-ascii?Q?ZRa1lk01FZ4sJvzgAlO187vYNTZZpMjq0NfDAjzIpjvjY7243yRy29QNEmmj?=
 =?us-ascii?Q?3M76X0ANtFL2V1OCF2OgJ4jrT7VogjwT4oXshfVefano95xl2YkmRp7H6Bz2?=
 =?us-ascii?Q?Px3YEbwNITPmzXvGy0CMgZvxGslllF1Po9sTToPsA3LxZeUwf0iKTG5lysKP?=
 =?us-ascii?Q?yFmEgeq+WMGohCn1tPhTgjz9Rpn70CHk7LfoHOeMjay+EW/Ap7jtdX1H8aw7?=
 =?us-ascii?Q?SLAPjYDP0+/DST1PzhLkOlLf9YJ8OG9XpCzc1ek+PWV+AUY44NXVfeWVF0s5?=
 =?us-ascii?Q?Gtm6kyEY1v3Ey8TQiJF6SE99MhqOA2OSX7g8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:35:50.9589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8980c5-5113-4b8e-7456-08dddc43b4d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6004

Make introduce_domain() use an event channel from the the xenstore page.
It is only used if non-zero.  Otherwise the passed in event channel port
is used.

The is useful for a xenstored stubdom to configure domains autonomously.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v4:
R-b Juergen

v2:
Remove iface_port variable.
---
 tools/xenstored/domain.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 34ebeaac9b..60d398682f 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1036,6 +1036,10 @@ static struct domain *introduce_domain(const void *ctx,
 		interface = map_interface(domid);
 		if (!interface && !restore)
 			return NULL;
+
+		if (interface->evtchn_port)
+			port = interface->evtchn_port;
+
 		if (new_domain(domain, port, restore)) {
 			rc = errno;
 			if (interface)
-- 
2.50.1


