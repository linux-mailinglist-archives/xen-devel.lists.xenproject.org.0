Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C80E3A29E3E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 02:09:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882390.1292531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO1-0007jv-Nd; Thu, 06 Feb 2025 01:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882390.1292531; Thu, 06 Feb 2025 01:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO1-0007ha-Jk; Thu, 06 Feb 2025 01:08:57 +0000
Received: by outflank-mailman (input) for mailman id 882390;
 Thu, 06 Feb 2025 01:08:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EC/=U5=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tfqO0-00072L-06
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 01:08:56 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2416::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efa3cc62-e426-11ef-a0e7-8be0dac302b0;
 Thu, 06 Feb 2025 02:08:55 +0100 (CET)
Received: from BYAPR01CA0066.prod.exchangelabs.com (2603:10b6:a03:94::43) by
 SJ2PR12MB7824.namprd12.prod.outlook.com (2603:10b6:a03:4c4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 01:08:51 +0000
Received: from CO1PEPF000066EB.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::70) by BYAPR01CA0066.outlook.office365.com
 (2603:10b6:a03:94::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.25 via Frontend Transport; Thu,
 6 Feb 2025 01:08:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066EB.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 01:08:51 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:49 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:49 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 19:08:48 -0600
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
X-Inumbo-ID: efa3cc62-e426-11ef-a0e7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1MVvYLK0MnIDLTR9XILBhPvG7MHmJVct1Qb/DUnhN13azJ7Yk1aFJwUErh3tJkmIoQjwEXcctnOYBX0SZh/z1xEQ8bYuMTSDE7cps6vT3G0gn94NBP5CAYHijAL4fDa4CB6zLBFW3tYS0cR+jJeMT7sEqGABc+6uewCxhv7X2YXkB0aRRUBgLAXullGOqMukeRkdy6UtAFqA2yb7t7K6yyAUIS3PKCJqF+NGk/YYhKVHWntstgOJwLk90ONor6OrUJOPM/5pVRktT1j+ZvCnzF61xYmQpn26XqvRqlbKFAEgoqSlvtsLMF04DHwe/zWaTD4b4XxqEvEsNDU8R6fMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bm9n7d0lv39csuk5HxxqaBGOy78rYQuqOosnK5AZnWo=;
 b=NuN6EKtVjsH0LGTi02OkAV7iyB0RybPlpecKxbVHBHt3VhA8GkfdKOaR1l5LGTh7Yc1vLZ2NV7WLQgVIdv1YzHgZsMj5bBom4fGGNR3qVqTGBJDUmF3p70vw2DlHWhueZLJVlu1POLJ/pDGkGOJHuOOO6MoAPfMjdhPTH+V1UCT+ytDnKN80AqjtKLE3yRRiDuYyWIZdX0w3tcpjp+b8rSYwAB/M83poO1UEo4K5fICGbtnMQxuPo+dC/mFfiImRpleXWaK1RODfkfnzSWujs5y6Rz0P8D1fsRofkl2Xw3hdvZRHjpM+jM6v3isr9HUTJWGC8TlPZcc3ia2G3hmEIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm9n7d0lv39csuk5HxxqaBGOy78rYQuqOosnK5AZnWo=;
 b=hofMgEO3Vmws0LjG9Pbs5Oq7uvkHVQpGjWlGw0ixElpqFuE3Pjs0zx7VqnOrjk5XqEK/RQfIkLg6B2CvS4U8jXDwMUayNuN7A7UGVu8T1H5cU7Pq5fhyzPd72kBMLuGBhRfdV2+66g8fDQhH08MRZlKtRB70NUkuH3uEqdF4dpU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Henry Wang
	<xin.wang2@amd.com>
Subject: [PATCH v5 5/9] docs/features/dom0less: Update the late XenStore init protocol
Date: Wed, 5 Feb 2025 17:08:39 -0800
Message-ID: <20250206010843.618280-5-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EB:EE_|SJ2PR12MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: 0693b1f3-b470-45fb-edf9-08dd464ad1c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g/oa4K21HW+dKkukW3XSqtvozEXtefoLSDVLZJVbMy78oBDxDZFCRD3v76P2?=
 =?us-ascii?Q?sRkopHzppQGPdVTe+uZBx1TqGmCK4peFz2PTc4CxVROivGCN/IGdXUPRhK8E?=
 =?us-ascii?Q?KrMtVsjNK9RazqUltpihTH21V9DRovWNLFhJGCQtSn1G9BmYNtOldJVJ6/at?=
 =?us-ascii?Q?+D3zfYE7NhqiOSJYhvNM07+8aI5ailcvnNufDc5yxWfvU7oTjnVpUjMC/NzT?=
 =?us-ascii?Q?D1sE6R6rrUrJxaGeSCJijfMcKK7B7PhwS0bh8rZ+s9WDIq5+2tnzLeHYk66t?=
 =?us-ascii?Q?tPGmW2LofYj/WwgmrVhppU53zzT5D1NLIOfoNMJRcZxDGMHBKZCXRPpIE6im?=
 =?us-ascii?Q?AeD+ZSrizEvPts1p71HcawiOArbDpZYBPDkABDisAIwUIw9UuVWAAG4uxYGE?=
 =?us-ascii?Q?wGc4EFpcoG40BK996/UIY/UxsBlewT6Tved5fWA+JrDPB2UZkDrcp8JZyfcw?=
 =?us-ascii?Q?3l/q1wh/AijVgoBUOuZGiWwb/ZXYPnA5oce9fnOK2o10C4R70/0T2pTU/j7L?=
 =?us-ascii?Q?4+UatFYZ+pIwjyP5ZGOOA0uM7pPFykrqI1zC0QUnp6o8cAXU5xOuek7h7MsW?=
 =?us-ascii?Q?/Fu/f5Ma/NJq5wGg4qn/MdHqCX95iSBk2LDjzzTfofcA/3+L0xux7C98rkIw?=
 =?us-ascii?Q?I1mZR7oLUtHYY6kJxQJlxMLTdaqg8JZwYmtAeHGAzqfzkyzBmcPn5WqyNq+D?=
 =?us-ascii?Q?ZwxbUw1EKQdk5i7k9bFZ+BRochSQlIqsSiSx0KknPG5zeJ1TtvJ0eakwigiA?=
 =?us-ascii?Q?+auClP1bnlbU2ApAQpE1dgxpUzah/UHK0DE3L205TqaNYDAj+FSeQK7wlX/o?=
 =?us-ascii?Q?HzIP1LuXbuToP17GYiPJMGWik0/4q86BW7hsr4k40cQOxqv2nArqHfq4Z93d?=
 =?us-ascii?Q?DgsGLnXcgyxLyu/b9oPnbOh9BCGPB/5aKnqF4zQB0KRKEBLp7YkaOL2YViVn?=
 =?us-ascii?Q?SzmOGmaNdbBr2FmIuWOOgLtVNKcXFbZyZ+pA52ll0pKZ9AkSxmq4nHAmOsQf?=
 =?us-ascii?Q?PJXhOI/GeWbPLuffZjNgR4GH5UFutr3eYLk697KNVHjOohVOMWIwbhoHu5KL?=
 =?us-ascii?Q?pXD9ED5z8ttRFdL8Y3loHfeVSgBi7Te6EaCqfr7OD/rV3EASB4igAo0xFzpb?=
 =?us-ascii?Q?uovP1PucUNTdqhi/aRRkqCue+bSRVBd70r8wMm7fWqDCrAEsx9LC1wcZX8P9?=
 =?us-ascii?Q?nPUhZi0/kezTAyzlIZhKuPnVoKZikI/3PtDdNwV08TAcfsBj5OQ5sprpoPbh?=
 =?us-ascii?Q?4v1bx96gWJw9bhJM/KneR1J0JNdxQCZdBKHdMTgsitYzLZuKrraZvAwEsH1R?=
 =?us-ascii?Q?PJWT8MAHMCfTVg+QvwaUIuuZkwJ4eg1t1Ky13oppyp7tuOxCRv0mMzUdee8p?=
 =?us-ascii?Q?aKAGVcH27MMzlRadm3SvWU64k0g1uksLRmdvzqU/7lKYg+qK55PttOhgmCRh?=
 =?us-ascii?Q?OF5rwy44aSWAqcMim4Ad6mYEmbfMZUpYHX9OxRAb/TR6npAu8i2ReWNE563j?=
 =?us-ascii?Q?WoUwPSNktdR7rgo=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 01:08:51.5431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0693b1f3-b470-45fb-edf9-08dd464ad1c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7824

From: Henry Wang <xin.wang2@amd.com>

With the new allocation strategy of Dom0less DomUs XenStore page,
update the doc of the late XenStore init protocol accordingly.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 docs/features/dom0less.pandoc | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pandoc
index 725afa0558..8b178edee0 100644
--- a/docs/features/dom0less.pandoc
+++ b/docs/features/dom0less.pandoc
@@ -110,9 +110,10 @@ hotplug PV drivers to dom0less guests. E.g. xl network-attach domU.
 The implementation works as follows:
 - Xen allocates the xenstore event channel for each dom0less domU that
   has the "xen,enhanced" property, and sets HVM_PARAM_STORE_EVTCHN
-- Xen does *not* allocate the xenstore page and sets HVM_PARAM_STORE_PFN
-  to ~0ULL (invalid)
-- Dom0less domU kernels check that HVM_PARAM_STORE_PFN is set to invalid
+- Xen allocates the xenstore page and sets HVM_PARAM_STORE_PFN as well
+  as the connection status to XENSTORE_RECONNECT.
+- Dom0less domU kernels check that HVM_PARAM_STORE_PFN is set to
+  ~0ULL (invalid) or the connection status is *not* XENSTORE_CONNECTED.
     - Old kernels will continue without xenstore support (Note: some old
       buggy kernels might crash because they don't check the validity of
       HVM_PARAM_STORE_PFN before using it! Disable "xen,enhanced" in
@@ -121,13 +122,14 @@ The implementation works as follows:
       channel (HVM_PARAM_STORE_EVTCHN) before continuing with the
       initialization
 - Once dom0 is booted, init-dom0less is executed:
-    - it allocates the xenstore shared page and sets HVM_PARAM_STORE_PFN
+    - it gets the xenstore shared page from HVM_PARAM_STORE_PFN
     - it calls xs_introduce_domain
 - Xenstored notices the new domain, initializes interfaces as usual, and
   sends an event channel notification to the domain using the xenstore
   event channel (HVM_PARAM_STORE_EVTCHN)
 - The Linux domU kernel receives the event channel notification, checks
-  HVM_PARAM_STORE_PFN again and continue with the initialization
+  HVM_PARAM_STORE_PFN and the connection status again and continue with
+  the initialization
 
 
 Limitations
-- 
2.25.1


