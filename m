Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F04888D037
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 22:39:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698210.1089685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpEVf-0005zE-9r; Tue, 26 Mar 2024 21:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698210.1089685; Tue, 26 Mar 2024 21:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpEVf-0005uP-25; Tue, 26 Mar 2024 21:39:07 +0000
Received: by outflank-mailman (input) for mailman id 698210;
 Tue, 26 Mar 2024 21:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfY0=LA=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1rpEVd-0005qH-G6
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 21:39:05 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43218716-ebb9-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 22:39:03 +0100 (CET)
Received: from SJ0PR03CA0007.namprd03.prod.outlook.com (2603:10b6:a03:33a::12)
 by SJ0PR12MB6926.namprd12.prod.outlook.com (2603:10b6:a03:485::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 26 Mar
 2024 21:38:59 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::d5) by SJ0PR03CA0007.outlook.office365.com
 (2603:10b6:a03:33a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.13 via Frontend
 Transport; Tue, 26 Mar 2024 21:38:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Tue, 26 Mar 2024 21:38:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 16:38:57 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 26 Mar
 2024 16:38:56 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 26 Mar 2024 16:38:56 -0500
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
X-Inumbo-ID: 43218716-ebb9-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhdFu1xwgU2D7StoOxnoKiJIJxxVApjrqOX4pnrDvU1v3ExHYFc3FKWfS/F7S6gMBFDrPCvLBdnpnyWYcqmEiyGxZRiLWPBnfHogy6awVu8AqxU11imMYxRO6X7+9BcQgAENpWjS2Zfu5QrHJ3+k5Uu+azWcV+ciwmztU5J2XRpadGdqZTmZgpdNJ7bMAcWj3Y0GChhAuhnJdjH7SVHveiGI3DT8lmB09Dkxij+8tM0qZpbShutgcpVt07ItrMfOIVu9HyXAdXT/0ZsChbq4B7zrtBREAlNacAsjZi3Yy9doVeXcG9/ZOc4J4oIb1edmTUIAZ6m8uXsicU6IWPlSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpYFdzJHkuO60SpR1aTtd436m2Cbip6KFJuG8vrlzio=;
 b=R2IcNaMHFc339T1mzpptb+zUnbdVNwgXfJsc39lJjHIik6TRtlYWh1akeiXdqzdJ1D2xVSFWoFaZ2/IYcVAjl31DLyuotpnC5izN/SOCTKcdNu/GAXt8FuY/GGM4qXQySEPs75feCrjNTmFNylATyaCTuwZNZrYpOaHaUERjJjXSZpRbkQ/MLolkMwMXRTMM/GUaE7FK4cq9rD9Zr3eYEUPmWqit7xnWc4xCeuZbBRxv2SA6ox5Glg9wO4XCvNVYe2cT1mY8WwWPCmfF3Tkgr23tj/ylntFIbGxthxV/osQTZq4fxWwg38J5gz582qBMQGQpdUf8BJWa5HSam+pH1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpYFdzJHkuO60SpR1aTtd436m2Cbip6KFJuG8vrlzio=;
 b=K8Cm1S/axfTTIolhv3oJof5OqJ67b8WhVQWLeOV1ZnZ+bf0UtyIr1E6Zy3rSLomo6bZdUW0L+qlERVvVvtJerBSMaTs5m7yBWPSQZX8C/eNzNaDg/RCdtx3rPdYUftyeDuhwAjh3MSyLPxi1etHePjq3Dd5gut8aqf6zIpk88Bg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v5 2/6] tools/init-xenstore-domain: Replace variable MB() usage
Date: Tue, 26 Mar 2024 17:38:43 -0400
Message-ID: <20240326213847.3944-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240326213847.3944-1-jason.andryuk@amd.com>
References: <20240326213847.3944-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|SJ0PR12MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 278345a7-6735-4fc6-e4d2-08dc4ddd2597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NWpdKKn4Iyc2x7lf13yxcQzDyk7RRN0tqHJbWUVK/WUIoh/H75TQyy5Rf9Gb8KOZNDyBQzBDd+9EjYmAdM2XFKgISaDhq95l7MCgAjyvwq+Q0WSlUWmhyI6znL5Dqc4ZVFv8alJl13SAezXAQK2yLBuOuHjmSVWDZT1NZodc3TsTkal9oIu1sEb+goMq2DjO7JZMf+wwRjnsOR+6j8J+/Z4+XbtwlGwiAzX5ft/+zU6sJRZsgqP4hgzSK4vY2ksx5Bx5n4j7N/sKH2JJeH7wl5xMKMSdDZPOtRewncBoR9vLAi+c1F7BRFhf0GHzC8H3+6LHrcs4bvLzTuUy3hPMyPbuodKAro/Bn7eAjfRxOZQO3g43EcxBzss+T2x82QziNOc47UTQOkJPF0j0TQFhmKxruaqzmfMOQFiBkVE0i9mbVwTAWi0Sf4lzJj5aX2YLtrmDgzPYx1jIdMKrGyAYgslAhgtPSq6kxHwqb7DzEx4kYQ8OD9fACapr1Wf2fGz/NCvLxcoVsg21yw0GQE2hXdLz0zO+WBO8SxcyWLT++o8hvU+2z0fKQVL3W1+K0+RGklzuUzfztGlGoPYvCxCU0+TXoBa0GNCQUCHSVtl0cAQ7/hX7XhwCNJGDU5Mzuos+iV4wMUFnCF/Nh5ip/ZpLl4He9mXBK47ckNsEyRUav4FQoVpxRiyjNu+YLwpC3xwDfYEUBkeiYU1jCZQmD8wCV1jtv8i5ZC5H4mI7PmVVEqFwK4h/khCx3/ZcWE7N6yx/
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 21:38:59.2027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 278345a7-6735-4fc6-e4d2-08dc4ddd2597
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6926

The local MB() & GB() macros will be replaced with a common
implementation, but those only work with constant values.  Introduce a
static inline mb_to_bytes() in place of the MB() macro to convert the
variable values.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v4:
New
---
 tools/helpers/init-xenstore-domain.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/helpers/init-xenstore-domain.c b/tools/helpers/init-xenstore-domain.c
index 1683438c5c..5405842dfe 100644
--- a/tools/helpers/init-xenstore-domain.c
+++ b/tools/helpers/init-xenstore-domain.c
@@ -20,7 +20,6 @@
 #include "init-dom-json.h"
 
 #define LAPIC_BASE_ADDRESS  0xfee00000UL
-#define MB(x)               ((uint64_t)x << 20)
 #define GB(x)               ((uint64_t)x << 30)
 
 static uint32_t domid = ~0;
@@ -36,6 +35,11 @@ static xc_evtchn_port_or_error_t console_evtchn;
 static xentoollog_level minmsglevel = XTL_PROGRESS;
 static void *logger;
 
+static inline uint64_t mb_to_bytes(int mem)
+{
+	return (uint64_t)mem << 20;
+}
+
 static struct option options[] = {
     { "kernel", 1, NULL, 'k' },
     { "memory", 1, NULL, 'm' },
@@ -76,8 +80,8 @@ static int build(xc_interface *xch)
     int rv, xs_fd;
     struct xc_dom_image *dom = NULL;
     int limit_kb = (maxmem ? : memory) * 1024 + X86_HVM_NR_SPECIAL_PAGES * 4;
-    uint64_t mem_size = MB(memory);
-    uint64_t max_size = MB(maxmem ? : memory);
+    uint64_t mem_size = mb_to_bytes(memory);
+    uint64_t max_size = mb_to_bytes(maxmem ? : memory);
     struct e820entry e820[3];
     struct xen_domctl_createdomain config = {
         .ssidref = SECINITSID_DOMU,
-- 
2.44.0


