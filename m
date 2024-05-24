Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784248CEC86
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729965.1135333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdp3-0004bY-E4; Fri, 24 May 2024 22:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729965.1135333; Fri, 24 May 2024 22:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdp3-0004XS-7n; Fri, 24 May 2024 22:55:37 +0000
Received: by outflank-mailman (input) for mailman id 729965;
 Fri, 24 May 2024 22:55:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdp1-0003hQ-Pe
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:55:35 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e88::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9b2213b-1a20-11ef-b4bb-af5377834399;
 Sat, 25 May 2024 00:55:34 +0200 (CEST)
Received: from DS0PR17CA0010.namprd17.prod.outlook.com (2603:10b6:8:191::26)
 by CYYPR12MB8921.namprd12.prod.outlook.com (2603:10b6:930:c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Fri, 24 May
 2024 22:55:31 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::2a) by DS0PR17CA0010.outlook.office365.com
 (2603:10b6:8:191::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Fri, 24 May 2024 22:55:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:55:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:55:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:55:26 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 17:55:25 -0500
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
X-Inumbo-ID: b9b2213b-1a20-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnrCBpNrmfHy7+Kd8KYhHEIbY0uedHDgUD5UuN6PTWYJGbhtzdX+pat6YhwZd8YhtS06+qszkr+qsqqKIUDqPNCHYmb3uReTcLly5PkDnH1p8tKGZeQ769VKEDUI7OW3bCuXkDYTE9LpfI6hqdNV6UuuWF1YdBg8Ydoh6tCFpyMZkebFMyNdW3qkJmHFfVzHoPSJcstujIDLcfsdbqJ6COqzth/yZzzeFfhEo5Xe7frSZySoa80F/eA2BL5rMVqemVsBSycna6Yb+882JTfPrpuCAvQCaMmHrP7FGyDcjy2Vjso5lv40CkhYjqnRK3dRqlLGNcsxWCof/mKppkfQUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bm9n7d0lv39csuk5HxxqaBGOy78rYQuqOosnK5AZnWo=;
 b=jDfES2qfzbdw9HZD2zYMxLw1k9YsFzQX4MTi0v6q2BGnyF3CXEj7u3lzhZsFCn1byxjzs2M1QF58ur8uEDOOmGhNcMwpQ2qIj2Z/4jNKdKS8amclzW4zoN8IQfsYXTM7Wp7+PGcGHXFSnlOmo3SrZ39/7/2a89r63+kBojiKRNFjYWivCLQOqKG5RMPld6BK9dhEOPNxNPLTbG9YUbXiAlDT1VB448cIgLX7VQW8vnnVWdpq6mlZb/3MqSdAX6yqnRhXW28/6ztOP0O3JUVnbXSEIeqvu8iagFZHXJhUOjoi5uvOzamy1XELIjCWwoI3rlWufWF3JDE6mGsWoMAjgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm9n7d0lv39csuk5HxxqaBGOy78rYQuqOosnK5AZnWo=;
 b=IwQEMAv+Oe/Lx2FiUMjPDh28/vGS7kgI+uRC+EcE93yD+IXaOpvb7JGIRs/x9tf2FZ9c2QNa/FPAFtcpxwLruKZRVAvufSPIAnD3RFRFMh5MJ1FHhG6kqbAqsGgTxEdRqTt4Fx87RrfE33/osYpCg/8QpykRycCDZBGPALbudZY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Henry Wang
	<xin.wang2@amd.com>
Subject: [PATCH v4 4/4] docs/features/dom0less: Update the late XenStore init protocol
Date: Fri, 24 May 2024 15:55:22 -0700
Message-ID: <20240524225522.2878481-4-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|CYYPR12MB8921:EE_
X-MS-Office365-Filtering-Correlation-Id: 536ff34d-cb6c-4bc7-555f-08dc7c449cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3ZTtasn9ADcl2gwGhIWw2r5zzUZzb2+JF2TMnHN/LUZ702OrTzcXGgC3LbqV?=
 =?us-ascii?Q?Lz2s2SG8RzBwXzZnDheg/6dP5ASdKx+yFOawIYRzjNXEMxSO4++6AUhPj9sK?=
 =?us-ascii?Q?9UH6lpSAfbuApknpQ1vpNC3R9pCQNa7wljFHsOKj8SaAP9F7si3CsW7yv5Lx?=
 =?us-ascii?Q?xiYekh+92jHeNOANh2iXVM1+E7dECzj2d15F6TAGuaa+VnH6rbpax5qU2Wo0?=
 =?us-ascii?Q?oW92xCC3mEnXLXHW5Sgt1IaEfgnK9PZakScP0fEOZYJn4dyKbICaRRU7kGWT?=
 =?us-ascii?Q?L9KkJl+0JTSmCwyt53mu25iAcdEtx1bxFq0vZwBzus6/gQ4mi2PXANOd1Fnt?=
 =?us-ascii?Q?qkoVuWDejpMTdHDcZ/8jEnpkhUTdOX1ojzZIaR6Wxqykom+SjnbZW4l0i031?=
 =?us-ascii?Q?JFZLtgE9SHHMQrow9KADZ0rmtyhjT2RCxLy5dUqsANYAHG7LBRAYVXhpst3x?=
 =?us-ascii?Q?bJJxeo3BBNTG86cAZTPYZ7yUwMQkXVY29Ebpd7Lf7ohGG/aKEwC/j7JBL3rD?=
 =?us-ascii?Q?S88uggv1/xdHToUPdQkQ5aoVI4AVMZy49emXOypRYCN+xGLlXKuWJBWVf6+c?=
 =?us-ascii?Q?bJVDFZYj93IycEm2mD2d8giq7Kb1A24Zgk1DWLmoONh/MT/lSvq1E9iW/9qg?=
 =?us-ascii?Q?9LQqzEQzyTXVFXlc5fHk8snClDJXmuEws1YNvoY7KHU0+ZUyvcLx/tFr9C2n?=
 =?us-ascii?Q?7VzwCdh+LXvFttB0opPW1U7mh7ZBiAI3LqWh8pM6cAyM3uFOPubp0pFPus4W?=
 =?us-ascii?Q?Dlrk8KSdUDy54s3EizePCRMY10yNLOJlklp1LQxkkYERDBuagctqcgobiI+g?=
 =?us-ascii?Q?2/DwuSRRNc/KWSkGD+gU5cpIf/vsSHBtvMlAxCkVon6XBH/R9XpjHIgfBk/G?=
 =?us-ascii?Q?15Qpds+H/20VFFXnEK9K8vQCEkGPaYI1nJNEmYwRFFznZeQ8z5NK4A5xnioF?=
 =?us-ascii?Q?Z3rNruJKrbWglZe4ij/PJBhIX/qLOVQ3xbt44h7A+sqHP050xqXQphFjB8nz?=
 =?us-ascii?Q?rfvbzHfNdIh0xQ2nns3Ojhe7RXG47J+ZH+tNJCNr0lXhrqAWpkq6S6JbySEg?=
 =?us-ascii?Q?GZuY9YiKGivY95QJ7dP5AR7MgryuMFzQJq0QqI3sU7fyUm5w7qgnm2IG7U4e?=
 =?us-ascii?Q?PESaZubfER1A07ByZIooYD39ww4s0ONrBUMxTokZERxOf5DBcLcb4PbEN5BC?=
 =?us-ascii?Q?NCV9rCNnu4A6hbJQ2Guk9uXlbG7TLhhTk/70X0l2X8WFOiCRHVjQo6dw97wS?=
 =?us-ascii?Q?bdrALJNd1Nb1YLIE5V7ZcUrv43CYWEdtCWMw0CXUAxrJAi1fR0zSsK9kJiTy?=
 =?us-ascii?Q?25R2K6mYbVZd6NV8dw64ux4IKTpn8HQd9E4ipF1M7niILpF9RdE+7ZFUDac5?=
 =?us-ascii?Q?zVYSsxFVx5/eON+mvSZXh9DSGRE9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:55:31.1053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 536ff34d-cb6c-4bc7-555f-08dc7c449cea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8921

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


