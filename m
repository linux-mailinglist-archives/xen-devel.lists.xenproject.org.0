Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4027AA90DD2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 23:30:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956561.1349967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AK3-0002da-D4; Wed, 16 Apr 2025 21:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956561.1349967; Wed, 16 Apr 2025 21:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5AK3-0002V3-3Z; Wed, 16 Apr 2025 21:29:31 +0000
Received: by outflank-mailman (input) for mailman id 956561;
 Wed, 16 Apr 2025 21:29:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5uj=XC=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u5AK1-0001ht-EN
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 21:29:29 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [2a01:111:f403:2416::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df24c58f-1b09-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 23:29:27 +0200 (CEST)
Received: from DM6PR02CA0121.namprd02.prod.outlook.com (2603:10b6:5:1b4::23)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Wed, 16 Apr
 2025 21:29:22 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::27) by DM6PR02CA0121.outlook.office365.com
 (2603:10b6:5:1b4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Wed,
 16 Apr 2025 21:29:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 21:29:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Apr
 2025 16:29:20 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Apr 2025 16:29:20 -0500
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
X-Inumbo-ID: df24c58f-1b09-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYfT2IMpD4aOcagAuuod8/f0c9k5AJ+9uABeB3XxTjfNGzhVabR62kcNiub/HV6LsmNOfz7UU2X9wmqBoMrjNqiI5NFHZ9SX3/xPIwu6hzbjDK+eEzveHyMrZbCNXGEpuEngQoLUNbUQksdRU890sWGrJrbIT/YK7YeWPYH1holuyvAMBOWkqmgvtQ3U/Yz0sXq7uzJdEwVcsbgWsEM+BPi1khj2s8uS3ltDXMjhR+kTb9/i3bKSw6XfZyq9tKDXELuA0mUrGF+Xafqm+e9ejh2wG+UgLjaD5BP64WJ2nguzOM15c6iCzx6XVCBJRuDOUABCio9zP+bwmyMb16NSSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BayIoS8WcfscVo3mfe5z0RwTBcrAxvvhaDemFCv9sXo=;
 b=iBTf3P1WPsz7DiwyNVUHuB4PhokL0rG1Bh8xGWrm3NB41OwmPrVrokhcfWYvLaSGqrw1oIU7snwb5CdoA5+WwjJin77zW+DjEiB5P7zhm6IwmSi9nC+VtmZfJPWGrvbw3NrepRmBr0uPsfuqwmFgjJKoqQy74qhLk9y58RcYAzisDWTxfNDchJYmcn0M7WWYega2U+Q5vhphUZ27nLwu9Tj6fm2ht+C+KIHPn+pb2AgXGqQViBLK/fOmxJaV85bFB1Ek+fNo0air57jocBmaDjnMQcncR/B+miWxO/uZ+d57qtoD2dTnCq9VWXJiMgGTafYirs1wM7HJ8nWj1aM1QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BayIoS8WcfscVo3mfe5z0RwTBcrAxvvhaDemFCv9sXo=;
 b=FQelfhWFVYnZrb28/FqX9OtAhXZzoTToLNM/HAEYBeXo2HnBGSqL6CyygOczjFhb0pW6eKCRnom5hphsUZ0YZQPg1UJbY+wK01e4YsEdzc9vqh6gYLtLjvGOPpRAALvOXB1AsU7nCwGYaPPDoGy5MjWbmgajw8PvYUMxOy6wuZc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 5/7] tools/init-dom0less: Only seed legacy xenstore grants
Date: Wed, 16 Apr 2025 17:29:09 -0400
Message-ID: <20250416212911.410946-6-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416212911.410946-1-jason.andryuk@amd.com>
References: <20250416212911.410946-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|MN2PR12MB4333:EE_
X-MS-Office365-Filtering-Correlation-Id: 70dd5be5-99f4-4f74-b7e9-08dd7d2dc069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CIafX6FuezUTVE2o1HOdGr6rJprR0cqQurQkxQk0DFjwuFbRu3EnfOqAwqrC?=
 =?us-ascii?Q?l7f2RxD0yOotEIhI9FU+W2L1W+STyIQGUwKp6c0IIzooSULMMyn+Djqe8Svj?=
 =?us-ascii?Q?hfotUTM4KGDIL6NVwtUIVJ3yW7HlcZVwcX4qYKUdSMlZBrilFeTxiEfX6CDM?=
 =?us-ascii?Q?mDmx4ddsgiiT9mNVu+vXUxMMtI19pkqt+HryzAhFQfOtpOoTHfxV65QR78Ip?=
 =?us-ascii?Q?CvNRpCndPVkpmw2+ft5xviBSU8WpIMiwV64MffyS3ztKmK29ePPZO+nNaE/E?=
 =?us-ascii?Q?kWEGw3YYMT2j72aU+z13dmC9UJ00vP4wDqwemJXmvS1Imi0Ln6qPoV25h6Mq?=
 =?us-ascii?Q?PjlQoZwXQOEBbPa7v9C0DDOK4GlyaLGeGVlRp4FObsITrbOILgn6WfZAfMkB?=
 =?us-ascii?Q?IaODMAjmDJ6tj1v9iZkAJh+9rleY/RdBwnf6jNVhgy0TysPpK1ChwnMx7iGt?=
 =?us-ascii?Q?BGhnrklSJyd0tPgY47/8b79pnByMBA+5mpkAmpo3vNpGF6mn4meQCQ9c7rLu?=
 =?us-ascii?Q?m5177r4pI9SfX7I7rT1FiHHMFPWxivE2t9X4V2+glWbmrJiyKJ118NyOW6M6?=
 =?us-ascii?Q?KKdrmnKjVX/U94Fj75U7LNFvzAhbFNynzEBy1t5AgB0WAbDlj7j/So74qSbn?=
 =?us-ascii?Q?Qd2ox9oj3Rj4LnmmeDpy4/pqYGmUBFD12xsI5Qv0H9BDEEkYendhJl7FWp98?=
 =?us-ascii?Q?+Rk4c31GUgesNlPlAySM0SJI6jOwssGLAirY6cuT9W5Is/FOofV/+APdwN1W?=
 =?us-ascii?Q?6BUaxbz0SarQ82pnzieMj9rUGjs2vKzMQrN4lEiMVx4WOiAKhOZzs+LOmQIT?=
 =?us-ascii?Q?S65UX1ILpv5KdbwYFaj6XFb4zPz6uTK+Iq7NMrf+TCsLxRSDQw2QY4O3K+JD?=
 =?us-ascii?Q?qE9uBG6md3kFHIZYr8+SpEx+yd7TJt4SSi3S4Z+6ygYcWVVGZsKRoKHflGY0?=
 =?us-ascii?Q?OgnEpa9Jd++AqcDl8ijgkrSZrZkZj2szceD9ZWtgu9KHv3Sq/YDX1kMCCV38?=
 =?us-ascii?Q?p/rgUhjSxirad1jRmFQJiOiyk0qz28116dmO8Vwom/AjWkIlZGU9F60u+C+J?=
 =?us-ascii?Q?dFjwvI8LwbtaSm0nglC+2XzBNNhnL0R9JFwNg5IYJYSfhLDPlF4XhHYhVQku?=
 =?us-ascii?Q?tiTj7ly24zk0J45zOWxQS1Fp7Cu8Gy7KM08Ny2Gy2zG2IBp9SKy2cXmA57Po?=
 =?us-ascii?Q?WH26naXBvD3InMakHlQ1WivqkPoDe2TzsiiyD2iWvmejDYpZzdAqYTCSZ56Q?=
 =?us-ascii?Q?5Qzx6DNMsW8D9jk9EtZ/r+IJk0ysgAhEhvE+gcDfuzQdfMapxBXppxObeo/6?=
 =?us-ascii?Q?TdkFG4Skw8I318Sy5stENhvKUz859+Q4FOQolvENba0Jb1VHcbBeKC0nVie9?=
 =?us-ascii?Q?p4tsnSs5Qk3brrAteKoWRdMH36x7p872wzj7XLUxTWuUEaFKfehtfoZ1726z?=
 =?us-ascii?Q?+/KERl55eSdSq8xzqe0nN/k8g0COY08qK+eB4Wr8fCvDsp7KlKSDveD6kpnf?=
 =?us-ascii?Q?gSsOusQGILGzqOQ3Go+w/YtGkQ7Aty4HUXWS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 21:29:21.0695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70dd5be5-99f4-4f74-b7e9-08dd7d2dc069
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333

The hardware domain is unable to seed a control domain, but we want the
control domain to use xenstore.  Rely on the hypervisor to seed dom0less
grant table entries for Xenstore, so this seeding is unnecessary.

However, that only works for the new xenstore late init.  The legacy
protocol which uses init-dom0less to populate the page still needs to
seed the grant.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v5:
No change

v4:
Add Stefano R-b
---
 tools/helpers/init-dom0less.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 17579fe2e8..91edf17b6c 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -286,12 +286,12 @@ static int init_domain(struct xs_handle *xsh,
                 xenstore_pfn);
         if (rc < 0)
             return rc;
-    }
 
-    rc = xc_dom_gnttab_seed(xch, info->domid, true,
-                            (xen_pfn_t)-1, xenstore_pfn, 0, 0);
-    if (rc)
-        err(1, "xc_dom_gnttab_seed");
+        rc = xc_dom_gnttab_seed(xch, info->domid, true,
+                                (xen_pfn_t)-1, xenstore_pfn, 0, 0);
+        if (rc)
+               err(1, "xc_dom_gnttab_seed");
+    }
 
     libxl_uuid_generate(&uuid);
     xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
-- 
2.49.0


