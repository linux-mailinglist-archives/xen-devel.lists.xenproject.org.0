Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CA8B2A13
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 22:47:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712284.1112875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s05yl-0005b2-0s; Thu, 25 Apr 2024 20:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712284.1112875; Thu, 25 Apr 2024 20:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s05yk-0005Z9-U2; Thu, 25 Apr 2024 20:46:02 +0000
Received: by outflank-mailman (input) for mailman id 712284;
 Thu, 25 Apr 2024 20:46:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RK3P=L6=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s05yj-0005Z3-BH
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 20:46:01 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1734622-0344-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 22:45:58 +0200 (CEST)
Received: from DM6PR02CA0165.namprd02.prod.outlook.com (2603:10b6:5:332::32)
 by BY1PR12MB8446.namprd12.prod.outlook.com (2603:10b6:a03:52d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 20:45:55 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::d4) by DM6PR02CA0165.outlook.office365.com
 (2603:10b6:5:332::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.35 via Frontend
 Transport; Thu, 25 Apr 2024 20:45:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024 20:45:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 15:45:54 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 15:45:54 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 15:45:53 -0500
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
X-Inumbo-ID: d1734622-0344-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7iQ0LykB+aWpY57hw9GsM2NKOF5VxhgSWCoxCo27yoe4tz4vqn1x27y/IsL4e82eG2UKGcFNcXB876zpOjBnY2wuC1VL6eaPKAhCtSbUWzK1QLUZfS2xPb0GL29+zMwqnbl3M+Fek9PAAs4KT4XaNATRpvyPJI5f3xHrzuTcL5VkD0AMjjX0Fdgazn/ao2eZ0e3papHBngYyuUEJZxOc+b7JUHP6qvKgPNER1Fpo4F+TflvA7j9iP0mQluFvnJ2kCKM66bbPKI8mmevVqsVv3/gMKp5vAC4KcMDYazivyH3VAHAjDXfKH7Kbte2v4TY4EGKiwTRj8Ehsodo4reCeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNeK6N9wpfbbLcb1iF7zED3QFLOXRI3qCXVxgpC+kJE=;
 b=EJZPiOXrLRHKSqbnXr74GIHVhinRi8eCYP8bE+82fW0wvO5iMuv16OsotMSDn+mXeYUx7fM0ny53+B3k1XkEntIELl19YTH1pw4AlVfBbOUWirc8ESORGc0UmDBP9f7r+sc9mKF0ov71knpvX+tL9nVYpzPZ7B4JwVIddChdUoJhSSsKAbAusQM2e4Ro033g6X7w6SzhO9CG44YT4KS8OrPYqiIbzIXELhHhcXg1fK68B1cGqaBai+AvktIfWXjOo5OEN6HryoFJmAFZ+sxbMcHY3NLKNW4TiezN0kjmyNt6rn1Hdea2j6qpdjKJM/ud3x9E/ixRK5h//oU53kao5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNeK6N9wpfbbLcb1iF7zED3QFLOXRI3qCXVxgpC+kJE=;
 b=D1rMqNeMgrSoVxPkRTSr5FND4/gMIYr2x/6jkajUgJ5QfnZkR6UI/A8VxSmbq0ejE7raOlBeoWGFvMJ+FjyRf9HYBocDMEMy9F8wdndVVG54ZixocuSjeXsaNjX9QaCbwL++E17C5nQasSMBFe5ke4G0T/NofCZQdNBCWCbN/5M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=permerror action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/spinlock: use correct pointer
Date: Thu, 25 Apr 2024 16:45:46 -0400
Message-ID: <20240425204547.658536-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|BY1PR12MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 265215ec-17e3-4328-4674-08dc6568b43b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YmHJqAI5nSGQ6rPUiQP9PmGLd1pgK/XOS0rMfeCMqnygD7oDNbsvwgCzF0rK?=
 =?us-ascii?Q?0Y/F5X0MoqUJtA6+WgdyslFgB+3FSjhT/p+sXFobZMS/TivLQ5ApHp+RWdkg?=
 =?us-ascii?Q?IXhT+9/1IdF6/cLz920MYs9j1XGaXTkP7RGBwjEnUnLeVyj+CmleNoiILjFy?=
 =?us-ascii?Q?9x+TQn/T1pGMZDn4S3Mr2mzWnpG4NWiG5gZyVIRqsWcZUOAUCD0a2RZwT0oF?=
 =?us-ascii?Q?yVR+Ke5uunww3M4ra12BUvXbc1UJODfWaXtPAX3+hP7J3nmjp6OcS5AU1lwy?=
 =?us-ascii?Q?W8A4491jxeipONWdWtQlz5+9C2AG8X7vH10hxY46a6Kv9Dl7oin8ETm3dTvf?=
 =?us-ascii?Q?mzCyp8xSaIPcbB7PuQ+XdlyCce7m9ttprdAywA37v0kJH5cEzGjehbalV5Y7?=
 =?us-ascii?Q?rBnmRZkG7L6BMo7EDqJLDPZFfhcxbPUZum75kfxi6VzOinw3raeqgDSFmYQu?=
 =?us-ascii?Q?hNu6jK67aZaSMCDorKodUNfgYmOKWtU+AMGMUSlRw5e7LL46fefhUh1QDM9k?=
 =?us-ascii?Q?qHmEs9be+y83zAnjnCOYx7gLsD0zPxtvhLeIEykM+w8A1QuCpXFGEDzsqv7/?=
 =?us-ascii?Q?GDWvtoXFKCmYgAgPP1+TR3KGyDQgNmCPdbC54iPbvJ5cO4BRz1VLMngiMsT9?=
 =?us-ascii?Q?YZEBwBXlGs84RF/Y6LTmHhdlgwVoMmknHy/hMUk1nrPEHRvWPMaqSsbB+rjr?=
 =?us-ascii?Q?xTqwOTZzP1Ak/oqAcbRxOfmNIUsKi3r6QdSH42J0MZM6sJ4OWHVkbFVPYAVn?=
 =?us-ascii?Q?109mZpZo4KXTAFzW6jAysQcL5uss0ls7KlBFBOu7BlWoSF1zyMwUV1LW9q+x?=
 =?us-ascii?Q?+Zdm8lZQ0UPHtQEXZ10pdGspXzQ8TyR19RRfpfAn5fPo1R5ssR8kiT9jFGno?=
 =?us-ascii?Q?q5oVjyF+hBxocz3+rnCX+0JFizVQAld9BZkzTjugvYC+keIkkvUV1b6Pmdru?=
 =?us-ascii?Q?d14eTHFHM0t1KwuITOASZ5aWNtFOl0HiqEf/GbiC8eCTmK9gf6LHuW3Ye5wp?=
 =?us-ascii?Q?x1AHPRNA/nKGBBSwxVIgKK2eW75bS7wL2DmjMJNDneMihEXxfvr1lp5ACXSB?=
 =?us-ascii?Q?pzJHaa/jtvQvK7g82Pap9NH94Y3gCL7wMrvpl2nBB0kDqTP4rYcqmz45uAO5?=
 =?us-ascii?Q?BajyDyfnCMWR3YLgXYxsXJPqdL4zrtxafmooCEUjGUq0tGqjnyziuwM67YCX?=
 =?us-ascii?Q?jDUMJCzbbCWZdjJHUSUow86u98jFCuLyrxTHh6sED54e5eukH2BQCFWA6aKw?=
 =?us-ascii?Q?hYD7nKjp2bQZ2FVYp9j88NqCDQU8NsGvgyLcqfBA4ycLgJMGpl5vDQKEb2KU?=
 =?us-ascii?Q?FmPj2USTytOCR7MTBCsNg8P5iGdHVeTopkqq7+jrv8exVWD3bZW5AP53+o/v?=
 =?us-ascii?Q?LxjNnYhIdxQ1alQcmq7lAFEBbIe4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 20:45:55.3774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 265215ec-17e3-4328-4674-08dc6568b43b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8446

The ->profile member is at different offsets in struct rspinlock and
struct spinlock. When initializing the profiling bits of an rspinlock,
an unrelated member in struct rspinlock was being overwritten, leading
to mild havoc. Use the correct pointer.

Fixes: b053075d1a7b ("xen/spinlock: make struct lock_profile rspinlock_t aware")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/common/spinlock.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 558ea7ac3518..28c6e9d3ac60 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -789,7 +789,11 @@ static int __init cf_check lock_prof_init(void)
     {
         (*q)->next = lock_profile_glb_q.elem_q;
         lock_profile_glb_q.elem_q = *q;
-        (*q)->ptr.lock->profile = *q;
+
+        if ( (*q)->is_rlock )
+            (*q)->ptr.rlock->profile = *q;
+        else
+            (*q)->ptr.lock->profile = *q;
     }
 
     _lock_profile_register_struct(LOCKPROF_TYPE_GLOBAL,

base-commit: 23cd1207e7f6ee3e51fb42e11dba8d7cdb28e1e5
-- 
2.43.2


