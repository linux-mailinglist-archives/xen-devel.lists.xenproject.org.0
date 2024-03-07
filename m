Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BD78747C1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 06:56:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689639.1074810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri6is-0008Co-7F; Thu, 07 Mar 2024 05:55:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689639.1074810; Thu, 07 Mar 2024 05:55:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri6is-0008AA-4M; Thu, 07 Mar 2024 05:55:18 +0000
Received: by outflank-mailman (input) for mailman id 689639;
 Thu, 07 Mar 2024 05:55:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xW6h=KN=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1ri6iq-00089h-Sv
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 05:55:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42ac9224-dc47-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 06:55:11 +0100 (CET)
Received: from BYAPR07CA0028.namprd07.prod.outlook.com (2603:10b6:a02:bc::41)
 by DS0PR12MB9397.namprd12.prod.outlook.com (2603:10b6:8:1bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 05:55:07 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a02:bc:cafe::83) by BYAPR07CA0028.outlook.office365.com
 (2603:10b6:a02:bc::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26 via Frontend
 Transport; Thu, 7 Mar 2024 05:55:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 05:55:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 6 Mar
 2024 23:55:01 -0600
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 6 Mar 2024 23:55:00 -0600
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
X-Inumbo-ID: 42ac9224-dc47-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3uF0LZ5mHUqL4lnhFMMXMWgtdMAuswDaXCrQszi8g3xssWak1GowtcbQ5D7GWN3yL7fX/gzCY23B12Mb4pkTSwyHPIempcHWd4i5YyTXCiHFp1j8XRghrRl6Aqy8UjR1vN9CK/EhbiA8GYWO657VLVty1DM3eOeF25l+KDORcOYNrSKBRdlJ05c66UodFRWVziTjOUDooLVARoMMwaSndKZ4fQnI0Va72FxpQqIyVsH+7YGqswDlM9sp3d9qkm9Fy4Kc0QNjPKyQFVrcaePOhiVX+QWxxaUK2iVR0qJ0WvDfTmiHPAZ0BRgp+vMlu1zNUgAAlSUfMVlnwiPuFM7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78w9s71NV2KazP+BbvasXgCjVEuk6yUlpVAXh+Du19M=;
 b=hgTjJG7uUOqAuLC/3XDHeBrNQjGSV4oJrROh4ErMwEeVMznFAHRS9agjXK3xf3sAslgPqKfHqSfLq4pltwXLLs2vIM8sBwv2/O0lkreS3pJBR+xoT765aB3Dk8jAYHSCOu5Xv50o2KecUCLDYzqLywrDZIbhGjdlkJ4PDlD2dpceoTvzwOizQdgXIC8QaHxDjY6FXbXHVlm2KY9cbzWF6tjg4c3YJxarNnLn2J6lb9HhVaAeKvF2eXsOGd/wFqME0NaRS7uIcCnurZFbFB+85utq0MIndRCgjY8KtGstAPh1aR/nquKwxLQvLL4BUu/xJ8xDQXPzFzXL9PEM0JNkIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78w9s71NV2KazP+BbvasXgCjVEuk6yUlpVAXh+Du19M=;
 b=ENSW7ekQ3tV9tZn+UgjIU40tMgXXW5bWjYp+7vd1V6kl/955z/pGtPXktTy6Q+Hdx0QSc1lddj0GJmOZJwS0Ndh3NTfoS9T5JhpIgNFpaJZ6ef1ULRnSPAXQBdFqNaANGdPxfXvp10/J4Njhw4WLhRsXwZ+tz6gDm/6IEtnful4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/9pfsd: Fix build error caused by strerror_r
Date: Thu, 7 Mar 2024 13:54:50 +0800
Message-ID: <20240307055450.3158740-1-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|DS0PR12MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 3745b813-d816-436b-1385-08dc3e6b23a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OhVbymWOMmnDrnazVXqQxWOGSAMWsF51VtD0DssZfG/yLh3hardnHnoDiHeZra6pbO+H481as9RMrDluAGFl6qikLPY6rIXdph7Lt4ydaV6jymJcjJoyDyIb7gjNDIFXosyv4cGKjpc6NrBFYceoOnqDuaXDV/9IaPdDJHBLlQOiIoIKmj6agu6bpLXHwDNuKTfT29Hx2wtv1D9CwhQNKqIbH5MJ9Ew1vXMSRpncxcq+MNhC+j3BIlR5Msa47XPaYVcyi907JYtL1WPYnWBIux/gwtWB/GbZntWSe8FKZQlsZRTr/hd1WvgfrWoM9ZdrysmuuSvIs0IQItneCMgeBjeKwgzOG3sofpVM6XzROKbrXB5OKu/USQc7hdNREYBPsq3bxZTUZxwMY+szLnmp7C8KdQRnDc5b2dxf0+NEnIB7H1hgQbvXPxw3i9YWHhkTud3yb81F5WS18k8EZ46uYg1rRWcqO8raqx37O4N+D2jFNbv+RAPp5qn7STkh45p3RC7tkWD7kHz+VbEg10DxdH5twNs8xqhzk8ihihHMPwaajphyCCMTlAgN416oZV40k4MVB15l7+udpALbH58x9MCbsoo9F5Hg/nERDqPxYttTMlsRgX/eYJn20k8HxV6SR8YnYjMQcPLSUICcnM1VtvklETKEbfFg8jLYOX7SrQVvnOVZ5ltUySJJgzLViUexndBojcwKEvuodJB7UQ7SSLEiBZ6hmbrfu2MTPWBBWtHoGOeMberIqJNoWjiQWZS8
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 05:55:05.8321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3745b813-d816-436b-1385-08dc3e6b23a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9397

Below error can be seen when doing Yocto build of the toolstack:

| io.c: In function 'p9_error':
| io.c:684:5: error: ignoring return value of 'strerror_r' declared
  with attribute 'warn_unused_result' [-Werror=unused-result]
|   684 |     strerror_r(err, ring->buffer, ring->ring_size);
|       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| cc1: all warnings being treated as errors

Fix it by adding a return value and check it properly.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/9pfsd/io.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tools/9pfsd/io.c b/tools/9pfsd/io.c
index adb887c7d9..163eee6ecc 100644
--- a/tools/9pfsd/io.c
+++ b/tools/9pfsd/io.c
@@ -681,11 +681,17 @@ static void p9_error(struct ring *ring, uint16_t tag, uint32_t err)
 {
     unsigned int erroff;
 
-    strerror_r(err, ring->buffer, ring->ring_size);
-    erroff = add_string(ring, ring->buffer, strlen(ring->buffer));
-    fill_buffer(ring, P9_CMD_ERROR, tag, "SU",
-                erroff != ~0 ? ring->str + erroff : "cannot allocate memory",
-                &err);
+    char *ret = strerror_r(err, ring->buffer, ring->ring_size);
+
+    if ( ret )
+    {
+        erroff = add_string(ring, ring->buffer, strlen(ring->buffer));
+        fill_buffer(ring, P9_CMD_ERROR, tag, "SU",
+                    erroff != ~0 ?
+                             ring->str + erroff :
+                             "cannot allocate memory",
+                    &err);
+    }
 }
 
 static void p9_version(struct ring *ring, struct p9_header *hdr)
-- 
2.34.1


