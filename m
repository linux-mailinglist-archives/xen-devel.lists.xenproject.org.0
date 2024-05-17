Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513DC8C802A
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 05:24:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723792.1128898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7oCe-000819-Np; Fri, 17 May 2024 03:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723792.1128898; Fri, 17 May 2024 03:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7oCe-0007zw-J8; Fri, 17 May 2024 03:24:16 +0000
Received: by outflank-mailman (input) for mailman id 723792;
 Fri, 17 May 2024 03:24:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6mIz=MU=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7oCc-0006l6-N9
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 03:24:14 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee33ac71-13fc-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 05:24:13 +0200 (CEST)
Received: from CH2PR12CA0005.namprd12.prod.outlook.com (2603:10b6:610:57::15)
 by PH7PR12MB7209.namprd12.prod.outlook.com (2603:10b6:510:204::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Fri, 17 May
 2024 03:24:09 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::62) by CH2PR12CA0005.outlook.office365.com
 (2603:10b6:610:57::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Fri, 17 May 2024 03:24:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 03:24:08 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 22:23:56 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 22:23:55 -0500
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
X-Inumbo-ID: ee33ac71-13fc-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n26oQiB3rqYQQhQY7AHV0S4Zl1cvg9yF0o0rMNei2YEX4kszHQevDgJy1nNlVNTBcFXhuCUH2OKzu7KVUd86vSRg/nn6BDu6PU8raGFGE//t3JgI5t06xjXABvIgSASX5WuXX8BqMQ0MqkMZdO+/L9Qou23lykiQB0jBwobPmvEbJfx/N/M/DIGsoipqNAthh2K6Q73PEJpjtCU9a54/CLR6NVjlBkUTgMKOWbFos8dSI7BTf481OjWXUpvAF9L6mi03aExjSrf5by/GwomtfFlLILwMa7xCu+qW0SDPNoGSgog24t3ICxD3iXQACzhXcNi9RNdAev/VG+zNQu0sVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1u+M1MpJUGmCneiJ6tyWezkJk2s1bMCTX2NWTZTsw/0=;
 b=mjtzhKxESPc/Tdud9EX0lppgwWM6CqqXKDwKDB0o2rdOv5fLb+sGJ75NdpWPRkUEe/TuF62plOkMv5DQ9SdBvPn2IGbLEuOcsauOemei2OjMFU/aGzWVLMn21LwKXGFxqInS6SlM+eiQ5iycuPJInirGImmwHLqv4y/e5amchorSSRG8S2+ul+l+8JtowR2/2OceZFqca4wgKqHu0gu8Vollo8NZVzZiG1PSAwPL7WsMItbn6nyk9FuVGdOfFiq0MgMZW+7GiBKiQUpW6nTPKDJUnfvVY9lt1fr2tUQ/SQ92piJt/2bZn2V/NuWmLJioDqVApK7PNThifD0eirVwhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1u+M1MpJUGmCneiJ6tyWezkJk2s1bMCTX2NWTZTsw/0=;
 b=zgCaMAMQCRubaJCTtqToLscyBF7EEpGybk7Jihnxcq4ykznbPD+4sonFC7B86G0gm+t34qgPVeYJajPoTTSfMjCgj2os35BwlU2JJWRFZoKcR9wetvRuWdciz/0qMtsgWrF0GAh8KujWHrUQ9JdNEirZ4G1k9XdAmYvRkR77oE8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 4/4] docs/features/dom0less: Update the late XenStore init protocol
Date: Fri, 17 May 2024 11:21:56 +0800
Message-ID: <20240517032156.1490515-5-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240517032156.1490515-1-xin.wang2@amd.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|PH7PR12MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: dd70f450-ec54-4c0f-c236-08dc7620d06c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|82310400017|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X2ampRtCEEh65iOCTCHgF9XZPwfHtYMd3/m7SyaVaJ8i/dguyoN3bVymRiOR?=
 =?us-ascii?Q?7T4NAeRVBegjjh81/fppiX2zczUy068D2Gn6UHwtPBUJ2cJLICFmKYqtYBw1?=
 =?us-ascii?Q?RSRTgn276VawDMoBb1qqbSDGMLOeBQD+n2X0XqCvMKh5UENsxV0l9HgweVru?=
 =?us-ascii?Q?1FGrNmSffQ2yPXw8RBkVbynrkwURoL+IpCV9Pj+dM90RMkMLmHzwN3z90Hy0?=
 =?us-ascii?Q?xEPPSDrG09B5B5M/GMMR8r0HrtmLdMdYXg87jcpo1KoDeY9CqlxNqjxr/Q5y?=
 =?us-ascii?Q?jtD6SrEOzfh0bn5XOi5PQepQuGZSB6rAuyfxa7oY09itSF/4kQ7uw1pouool?=
 =?us-ascii?Q?2ROU7zRJTXWTrmKj8HwRrlxK7TB++4Kde9VXsPcWPhV+GeRkJPToCqhp12a9?=
 =?us-ascii?Q?M3w6IK8vPZx452riFs8aUcaJUqtnwthlEHvWjS1WzHafi0EEjw3oDIX/eFes?=
 =?us-ascii?Q?q5X9zLrdxlwltAkNfrxwtgJoWHlk5CJAM72l2wpYgafsdu+9hfnwjeEMXlTe?=
 =?us-ascii?Q?b4JHtgGtdndK4RE9GuCUG7HjBwZYp29YiG5f9z+/ti0HH1z9PHMr9tmBAUup?=
 =?us-ascii?Q?GvfQsS+/mmTOw0Qhd2KanLaeSb2SduNbG2Q9EC4X7GLnq6IxMgrdwYZip7yB?=
 =?us-ascii?Q?AcwB+nKpY69Euk8dPbYaW6XKhFfe5tTsqUceH6Fy9C+r0Lp8vNjAfBLQw3D5?=
 =?us-ascii?Q?E/MZNhSUMFVNtDNluWavL8VgLBFfRScaD4ePE2MBTbHjTZyIyUzLKLovuhbr?=
 =?us-ascii?Q?7OwKLjgQ7ph0NJuOJystpV5O8yBve14FHJp5sFibHUXcQZ7Q271i5QoSYPA0?=
 =?us-ascii?Q?NVos41CE+AlAztRLAevkk0BPE+190ckI1phcEJfhIdrs55HZzxuv9zYd1AY/?=
 =?us-ascii?Q?K/Bs2cxBYk9m7KHIBeiBJJOlhlcMHlbR+frmf1K61O4DNWCukwGpJ4v3qp9P?=
 =?us-ascii?Q?tN2NEGOzKhem5ZJ5azWXnRYM4hqrLKFiAHvo2wm6MRuIDZjmUFWeJtNdYdxM?=
 =?us-ascii?Q?A1xw/ENu1jQBpq/sYEdn06uCEdEcU+StQuBI0rWc8WD5ayXs5xsRgY9XifWo?=
 =?us-ascii?Q?PUAMHa2HGlptdEVwIXritzPH0uogOiIrntmBWCRizQvg5ePC2Emnzcnlr+74?=
 =?us-ascii?Q?YSulqRHTbJXzE+wIYp5nKpLBagm2/Ltle7gRzvzhRpfWrL97/31stIXhLb+n?=
 =?us-ascii?Q?gkxwj5KJSZAAEwCMu5UhXJxWGohYE36d35WKhYBYS9A8Y5jNBvy0zAInUZyS?=
 =?us-ascii?Q?e98tfIYpJNy704yJUyLok75QCOk1PTyD47z/WI71J3JpqFgt59Ds7cG/m8sM?=
 =?us-ascii?Q?Gou/uGZhHEx5YvPjyO/3mP1+tqMj3eV3n29S5K5CE9S4TqLM1YgyVVq6Cfiu?=
 =?us-ascii?Q?34Y60s+tGwAraZ9IQ2G4OcQq16q4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400017)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 03:24:08.6806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd70f450-ec54-4c0f-c236-08dc7620d06c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7209

With the new allocation strategy of Dom0less DomUs XenStore page,
update the doc of the late XenStore init protocol accordingly.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v3:
- Wording change.
v2:
- New patch.
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
2.34.1


