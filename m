Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDF1A99ABB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965477.1356043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7he4-0006gd-DG; Wed, 23 Apr 2025 21:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965477.1356043; Wed, 23 Apr 2025 21:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7he4-0006dN-9X; Wed, 23 Apr 2025 21:28:40 +0000
Received: by outflank-mailman (input) for mailman id 965477;
 Wed, 23 Apr 2025 21:28:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbtc=XJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u7he2-0006cN-Tw
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:28:38 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2418::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e72e88b4-2089-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 23:28:32 +0200 (CEST)
Received: from BY5PR17CA0046.namprd17.prod.outlook.com (2603:10b6:a03:167::23)
 by BN5PR12MB9486.namprd12.prod.outlook.com (2603:10b6:408:2ac::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 21:28:27 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::79) by BY5PR17CA0046.outlook.office365.com
 (2603:10b6:a03:167::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.31 via Frontend Transport; Wed,
 23 Apr 2025 21:28:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 21:28:27 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 16:28:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Apr
 2025 16:28:26 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Apr 2025 16:28:25 -0500
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
X-Inumbo-ID: e72e88b4-2089-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQ4zu61/om/qOgF5ckDzbD0Uw9HfrNyJaI+7NbN2Lko07BUqL8HOHvHPhINeVDL0raLY5m1q5scVDP4EO1hEvwZRRxUz49BFYEqfM+E44Gn0hmqCB3NZJ02POuBREihPHVA3BazRKTJWuQb/x9dNXWOyS5ep3zboz0d1oAUzT/mmgnBHHUkK9ZK5qvZjgvD4wcdxlj2b8y5eTXgQJNt0vu0l71COGwN4q855hI9cbacuKaYFF8+efhlvpVnK6ky+lvLJM6fNtxyRtCkipBzpGjFSOG0OC/pSM7lxZXDC3/4Y+VKZAVx8QOP4VziP3BBomzZF9SN4ysXhr7Mk+dR9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPr3onDnXjTLJ/AyL3duJiMnjnp1h+MlfHNJftHVH1M=;
 b=RrAB8ytNUMKt4IvKlo2iIGdnDoJNmWipHgfX2NNJaI4xtsOo04w19vaD5mbtG/hv9Gn2DYL8RsaSPoxcVTMwJ3D5/ZPW6U5phyjQnNW9pzIZxNEF4nW1rU4xBZcAn2AKOed9NGJIfucvj97K5yHemSvDz1qYW0puUYmBPY3oIkxtc7LPYMncbLOpfutYjj9SlFbTXDH7sUhhSUcPxKXw2NLXzeJ3K9JAeNMPhNbUjjLWyy5MSkW8C5eltUIKYG7/pqiuF/0PonVxhZPTV+9nkXLNT+WPJFOjdOCfb9YKVy2v7R1g3Jh+FnxQOs/qir7/CTT+E8Hn+8Xr0VsEt/SSCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPr3onDnXjTLJ/AyL3duJiMnjnp1h+MlfHNJftHVH1M=;
 b=e3j2UDj4k+o3fAjvyaXeFpdN7CwY75Hj/J+7+vwyc8/0GFqFXafpcRuBZd2UolEZycAuhBgPHI4z7JkG5s9uoQR5Hng4LtvM2u6QsH4ZgfA/F9a/JHTYheYV+2y3eWr33DAitzDEYJX5wxkS+w6VN8+FStBWlqY+kM89JuIH9Ok=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH 2/2] tools/xen-hptool: Replace hard tabs
Date: Wed, 23 Apr 2025 17:28:21 -0400
Message-ID: <20250423212821.42776-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423212821.42776-1-jason.andryuk@amd.com>
References: <20250423212821.42776-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|BN5PR12MB9486:EE_
X-MS-Office365-Filtering-Correlation-Id: aa85f572-2f80-4860-1664-08dd82adc91f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IUq2Bg7XQd0OAtiFi7MBYi1IpDc/WHvpzjf4muXjM9P0QYsuF5vwBenp7H5t?=
 =?us-ascii?Q?QNLBg4C9EQI9VAVD+Q/jOd2z+cg1SEuBqMQB9lKzzACjqGBvK5IAdHtVGP0y?=
 =?us-ascii?Q?OIvtr6yWmBIZOEzOdL/2YsLZ6TCv3uJr3ZEwL9vr1C6VIQCHD26Io3SpIM2i?=
 =?us-ascii?Q?BhFTe1o9vB/fCaodjZNik9sPuPnDCVkcy0C4g37H6Xcdt4JgRcpgGOVcZVW7?=
 =?us-ascii?Q?VgMIGQjuqAgJIBVSHiDHSbn1IIB0hUdDEtrHm4ExidC/QqV1sIN3tiSx2xVf?=
 =?us-ascii?Q?+7tp9/5M0j7EfjiPnUY9n+QVLS9Y9n9oPcaaaFRFFAgvlqfMeSficgp7b7/d?=
 =?us-ascii?Q?a2of2XBmPssexYRGk5FvhmZtHEfoaar/nAhRJQNeIutONdsQ74y8DjSqeAPW?=
 =?us-ascii?Q?13MbKo7gd5KYBjXzViCHGpg5fmVrEekP5iufHKG39UBaiTiC7hosRbgv547D?=
 =?us-ascii?Q?SxksAAUWvUotlkUjl2KhTjI0BhGx3NvCPjkD7Z3KjrL74EKTpafZIEHhRLb3?=
 =?us-ascii?Q?wcDdlXbeaVAUhgPrJjGBlCq1UfykTC1y7/lRu6WZljSoJFYEaespnnS8asNR?=
 =?us-ascii?Q?Jqtk5pxAls5kAsUYbTnviAO3TvoMm81qA2KzXw5w642oIOrEvAzewV39aF7I?=
 =?us-ascii?Q?dXOA8qCYAXww24qoqExsbhqDvPYK/QDrQSqzJ16lLEf/zVW6weB1m46aitTE?=
 =?us-ascii?Q?43COxCxMKM6OQYckokv+5tHQMhk8QmxDq/e+Ccj+RCEQos34iKDZqiDwbQ8k?=
 =?us-ascii?Q?mUlCCCRhBIKx/aj24/CAsMEajiJxoOFl9iGueHTeUMrbVEB9A/+tWnBAZJzp?=
 =?us-ascii?Q?zEIXvxVE39HVOiDGIXJe0HDPtkwaTt0L1bLL9d1moNQ5SmJbHa7pY6WvBs44?=
 =?us-ascii?Q?WArT+LEtdzFT4BXOA3VcxVA3nbCDAwW+vpGhihKL+XLtjgP2PIDAEw2KaZi5?=
 =?us-ascii?Q?06s2aWlpSFpHbeFp/I/cI/6Km0Z5faGB8MYpyXuJRqzdKiZ5H5I7rm7dyF50?=
 =?us-ascii?Q?2z62CPRwX6X7KVuCrk5sSYSBsMj3bf/cnPsZkoDh519CRx52ejl9RKiagrxH?=
 =?us-ascii?Q?U9aDFDGe5Vo++YYF9T/mTOfRN0i5vkKJdv9BHQkr0xRwtDkC+DnBXIJoWfKf?=
 =?us-ascii?Q?1fKDouotOzCEpTeOv8H5RPoUtvK31WjzkziILEJllHNgJwb3peN09Vtwc6vI?=
 =?us-ascii?Q?UCKDky91ykFHPDhulBf5fVfxQEtgIvNkCr31rx2PxWoIhfyUbCLaR5IMIyY5?=
 =?us-ascii?Q?xSlb43Hc+xZKmbr1Ij3019zvS1WB0yozX7d/oOWmp9FB3IHYOm8Wi0EDfBqs?=
 =?us-ascii?Q?KEOureG9tULXWM4hny164eTQryQpdD9oycyoBpJ+KAAGtKIM8qSt8HScW/RX?=
 =?us-ascii?Q?2427Pn1Yv7dlPzwc2K7UgH2p0U1r4AcUmOBQr3A8uVsuZJzYrEH9gOCFzUhQ?=
 =?us-ascii?Q?W5Rhdhh/xppAcDbC67htrL61WEJbtEHmPP3JOuM178uH8Odz3T/EMexH+tok?=
 =?us-ascii?Q?ucTOGsvInpW4l7Tav+ZF2bG3YbC0+B8jZkvV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 21:28:27.0283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa85f572-2f80-4860-1664-08dd82adc91f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9486

With a tab stop of 8, the alignment is off.  Replace the hard tabs with
spaces to match the file.

Fixes: 284d5633be37 ("Tools: add online/offline hotplug user interfaces")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/misc/xen-hptool.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/misc/xen-hptool.c b/tools/misc/xen-hptool.c
index d850404e31..590810b6eb 100644
--- a/tools/misc/xen-hptool.c
+++ b/tools/misc/xen-hptool.c
@@ -56,7 +56,7 @@ static int hp_mem_online_func(int argc, char *argv[])
         fprintf(stderr, "Onlining page mfn %lx is broken, "
                         "Memory online failed\n", mfn);
         ret = -1;
-	}
+    }
     else if (status & PG_ONLINE_ONLINED)
         printf("Memory mfn %lx onlined successfully\n", mfn);
     else
@@ -85,14 +85,14 @@ static int hp_mem_query_func(int argc, char *argv[])
         fprintf(stderr, "Querying page mfn %lx failed, error %x\n", mfn, errno);
     else
     {
-		printf("Memory Status %x: [", status);
+        printf("Memory Status %x: [", status);
         if ( status & PG_OFFLINE_STATUS_OFFLINE_PENDING)
             printf(" PAGE_OFFLINE_PENDING ");
         if ( status & PG_OFFLINE_STATUS_BROKEN )
             printf(" PAGE_BROKEND  ");
         if ( status & PG_OFFLINE_STATUS_OFFLINED )
             printf(" PAGE_OFFLINED ");
-		else
+        else
             printf(" PAGE_ONLINED ");
         printf("]\n");
     }
-- 
2.49.0


