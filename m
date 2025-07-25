Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D988B11670
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:29:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056827.1424854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Ak-0001OL-JF; Fri, 25 Jul 2025 02:28:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056827.1424854; Fri, 25 Jul 2025 02:28:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Ak-0001MQ-Db; Fri, 25 Jul 2025 02:28:34 +0000
Received: by outflank-mailman (input) for mailman id 1056827;
 Fri, 25 Jul 2025 02:28:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8Ai-0000gR-Sa
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:32 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f403:200a::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0def454e-68ff-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 04:28:32 +0200 (CEST)
Received: from MN2PR15CA0005.namprd15.prod.outlook.com (2603:10b6:208:1b4::18)
 by PH0PR12MB7930.namprd12.prod.outlook.com (2603:10b6:510:283::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 02:28:26 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:208:1b4:cafe::43) by MN2PR15CA0005.outlook.office365.com
 (2603:10b6:208:1b4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 02:28:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:26 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:25 -0500
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
X-Inumbo-ID: 0def454e-68ff-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMHteKIi6r8JKnFvta5BqWWS4d/co5wW4mqV//wOtJoy6TUN7DRf1YLo5Pw0GFMEYA2I4TnjM3aJDVE7FOsEzslINa6YC6QYmNOJ1bHQo6i7IqQQkmYITeMhEyvxJg3rUfK4T5VZh4x53f2oGZc1BHkEdtTiUVjfVlztKJq/QJrL8KsAyEzlCrQseSkogV8EiMpC6nz20f6bmfLp7Ssn4ca3g4zuUytT4e0xI5F1yXHxpt8oN9WqowL1rd/49kTXZL1y4bOYYEaOG6zhs8M2/dk/G0IOYm6pEaM//lbA5bPqpQXAdLHjKTVEKE5fVJi+kxTswhjG0KydMsRJOqZR5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7V3nt4OkeSNPSJ4nHqixXneapfe/i7O8Q64iPvkpFA=;
 b=BRN0ch15ZGLTfVuWmxXcVf+buQAhYvGBjEkpA/XjCmpk5ZdffxI7PD4CEdjIgJ8smozxAt4mN499a6q8gfaNqwUhU7xMKxIp9q1btB/OT7SnLj0zH8+7ZdFx15jIlCHcCF19SvyaQxt3rieERq73RQZVL8DgYWte7soL8hzNMD6NTkaGBwt6MMvoSdzpnrwSPCsE8GPuaUU/NxId+v8oljbtRxkI60hy0fFqCS7zUlIMDZt+gjj/UFTleaWhyUfRBsvGYEAt1k5JF2bpMz9kvI8wBtJUEW3Yk/RHdWFYb+00ZerYRjBLZEv5snzrlQ0APsP0CGCkprbUb/CfTxfliA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7V3nt4OkeSNPSJ4nHqixXneapfe/i7O8Q64iPvkpFA=;
 b=fjcZgSblD3KfNtlOreI/WMXY+SWkTXPoRcyPh5ZWRxGYn2ZrVdoDPa4Ge95AhmJ0QaE3/UFmvXzBFmHHhhBRq8JBoXps/s0JN0QzRHWP9YX44fednTxPZNwsHgAToUDi2wLB9ianOQ+7AAF+bAFTCISktPrxkgU8FLetkLbtOdw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v4 03/12] public/io: xs_wire: Include event channel in interface page
Date: Thu, 24 Jul 2025 22:28:03 -0400
Message-ID: <20250725022812.466897-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725022812.466897-1-jason.andryuk@amd.com>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|PH0PR12MB7930:EE_
X-MS-Office365-Filtering-Correlation-Id: 22cc1978-fa2b-4052-713a-08ddcb22ef8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TBT53ROuF2XAofdFSfs8P7UJw8lUkWukL/RpVMe/9Fg68X6VKD2hoPqrTcwP?=
 =?us-ascii?Q?YtsFvEVketTeKdwJ2gIqyvPLDVL2Ve0LJNEtnJrt1yD0daKXu7lRR/vWvPeE?=
 =?us-ascii?Q?62KjUqJk3or6pZ1GU0+cqXc5ClTJ/8ne8h7M/vYncMcFV0HrkzDLmDfEwbhR?=
 =?us-ascii?Q?QDUxojUHZEZQQqDFp4Vst9DdvMnB4e9IGPXQvMS7J+ODk3/tW3PhCfFcWy+/?=
 =?us-ascii?Q?1sG1oidc2P3u9d8iuF9MjXGf9a4UglmsipeX4uWpT2g1SMQv3lMXHkfE7KEZ?=
 =?us-ascii?Q?J6FCgkbal7rrq0ibuXywdtp1/vpM1GRVhRHbZ5Aw03itO5a0i0/bQmljIwVF?=
 =?us-ascii?Q?9onCv+H54KTlliCsvdUFkDqWuzCh0xMZtwtUhFTUeCVA1THwOu6X2+dq6hfk?=
 =?us-ascii?Q?uyjQaBz29u4VOCEiI/dlSoVElp4VgviGy1IAicDDPDi/NsX+LytyNWn2Jam4?=
 =?us-ascii?Q?vYhGYF+COH2vtrOFna6QgX0+TpuZGENLiPTqHiJl/dOtBDGG37ioLWR6P1qo?=
 =?us-ascii?Q?cqgpC1OiOP+xs+ldOEsoge8wsyFdSvnLk4pUTQqlpyL4xPJx7gpG5dCjTIky?=
 =?us-ascii?Q?lThFiZpMOT5vXkMVxYt7EkeUFYtPQs8wnLfc2EBd3HagIgmWUI7gZlpgYguQ?=
 =?us-ascii?Q?NEwC8jXTobwMET1tu3vNmpZJk0D5F6TkBgbD2BUjK+IqNmjyz9FRZBzBFywV?=
 =?us-ascii?Q?v3nuJg0E+IK/r/g8/F4v8IAsHYeqpWZDBSnCoGT0IMroJfC2sG/imXjgtX+m?=
 =?us-ascii?Q?vcpHKpF9bLcO2/XnhtJkyvhMS+90Ver8A7OcX1HYhy0GjhIyVi4q+cX5Ineh?=
 =?us-ascii?Q?/BSifEXzw5dpbZIQ3KwlpY1NNeHGzeiQMZJ/BMK82x7s32eTjUd3s0btDKrC?=
 =?us-ascii?Q?vXfFMFOj8gTmo+TycTrs4CLP0nE+zZGai6XE0NaF1LL3KdCYX+945q5BdagY?=
 =?us-ascii?Q?KClF7IaRAG4PUnhftFxzXJ5YhA3VGjvJbOv9QkLUegLFuIqw77ma+BeD3+v2?=
 =?us-ascii?Q?sMa5+sDFbOBL15GID5oEtMW++EilbkzKhfk55mUzvb0udmI7MR7XCTTGwd6y?=
 =?us-ascii?Q?+j6PSpOLqGP9UTHGLqT0jBv/Zutf+6Ec2Zn4KK7mipYqtkXLAlHvQETvRA6p?=
 =?us-ascii?Q?qV9T062EWRiV5FDjediO85RLB92WRkhvouwCGDlOyJkL5/qUIkBj/7AKyVDH?=
 =?us-ascii?Q?cwh7BeAt87Tnhc+Z3GPISYkAqN+aHFc5jmufIvxAGjGMvR9upmp+CaCGnpz8?=
 =?us-ascii?Q?YQQEGsU714SSRKRd8I5HeSrONHjb1T1U2opmLsi53jvb2ctkaWM80fyyh6rw?=
 =?us-ascii?Q?/0olWIR0vhA2pWzMnehjQPT+077IPf+YgdAjtnsLbukEg4ixEBn/zfKPvzSg?=
 =?us-ascii?Q?+VAWe09EywTxpYdUk2+LppA/qFD1w14g0sQ5UjZkOOLU+jUy+6pxol9x2a/q?=
 =?us-ascii?Q?GPBwmwpyUwwUSTSbdes9Z5fc8xVHHJFAokBEd1lesnvI9A/T/ejDbdAneXq4?=
 =?us-ascii?Q?nNABo3QACBuNQfloyemWfG+JwiyoWmioCb2G?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:26.4268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22cc1978-fa2b-4052-713a-08ddcb22ef8b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7930

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


