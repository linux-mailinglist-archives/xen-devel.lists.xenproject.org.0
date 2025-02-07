Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97376A2B877
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 02:54:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883269.1293331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZ5-0003es-9M; Fri, 07 Feb 2025 01:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883269.1293331; Fri, 07 Feb 2025 01:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgDZ5-0003dH-57; Fri, 07 Feb 2025 01:53:55 +0000
Received: by outflank-mailman (input) for mailman id 883269;
 Fri, 07 Feb 2025 01:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yNCd=U6=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tgDZ3-00037W-SR
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 01:53:53 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20609.outbound.protection.outlook.com
 [2a01:111:f403:2408::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60bb2e77-e4f6-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 02:53:53 +0100 (CET)
Received: from BN9PR03CA0944.namprd03.prod.outlook.com (2603:10b6:408:108::19)
 by SJ0PR12MB6904.namprd12.prod.outlook.com (2603:10b6:a03:483::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 01:53:46 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::6b) by BN9PR03CA0944.outlook.office365.com
 (2603:10b6:408:108::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.26 via Frontend Transport; Fri,
 7 Feb 2025 01:53:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 01:53:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Feb
 2025 19:53:44 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Feb 2025 19:53:44 -0600
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
X-Inumbo-ID: 60bb2e77-e4f6-11ef-a073-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vrx7TXj7AlCFVY8U3oupDb92Wtj/K1el1LpmPqzDOAviKFA7DYIKRFdUd9ct+T5JqV59rnDc/TVtx0lmQvbuPsoeIA9J3r64X2yS9VPKc/itLTRjTK/jNbMXnf9EbUMsg3NMQ8KVzq3ofWeLNVHxW63hzhkxHLAccwEgbpvy8EQ9oobfxq2vaXDBeeH8qQBkuc9aVgxmesdtGZFSHPMcJZUYScENuuPldGEl1+RuV625enDY5nf8S1vf5hJoBjRJQkR8Xa8JTS1EAoahyiBoABV/RlQHKkzuByWactsXQGU9BJdUSJekq4zRD9MrEd7MeS40lsoRzYqD/Vjo7LMjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bm9n7d0lv39csuk5HxxqaBGOy78rYQuqOosnK5AZnWo=;
 b=XLTZuOXd0qodEwuse212RnmuHsYF1tT51IEXgfd/d6m0Qf2aphygHssKxPtz073P/lO8V4bM/Kb/dKEwZwK51u4H3GXKkf2+ZeG2D1NP27045Ry4p72Stocj2YMAqnFOuyxEMEgxcjn5pFieZpUNpmB9592SOV14h7kIDT3A/4WksELGrCO2jO95mUv/+h78b4KmFcjN18vi/oh0UImzfMhfYA0pjEpeACBvRAKTj19GwwL17r59pV9m3iDsZKx2xg3M4jFswW60U0XXXkI6YTxI7UyJKKANYWFd1SUpED3a+3S98JM4/2Hp+JKeu1anXds6p7TkWhXj9ZrfMEO9aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bm9n7d0lv39csuk5HxxqaBGOy78rYQuqOosnK5AZnWo=;
 b=Ori03lIqE9xNUVR2F1GnRzptkVNHWF8MYaLLoW6qBiX+RhKRCciqqPnhQx2P1qLmXqVbox8qvnbjMUQR3qRMakv4A5mNyYclmx4nfJNhMaRsM31lkqTnCp3TWddsvFmUroDi5eV7jdLvxly1D6q5GdqnD9z40AhbLVzfzUGQk4g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Henry Wang
	<xin.wang2@amd.com>
Subject: [PATCH v6 3/7] docs/features/dom0less: Update the late XenStore init protocol
Date: Thu, 6 Feb 2025 17:53:37 -0800
Message-ID: <20250207015341.1208429-3-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502061750480.619090@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|SJ0PR12MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f49a20-2f93-4aca-a034-08dd471a4203
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QoEI7lx2x8If5zo6YH+SGln8/ftWKvb88wpTJqHwXtrfBPZcIrMQPBNJ2LNd?=
 =?us-ascii?Q?Y96zaMQuUVmHYpUJ4eelSOzuM4dtzMzc5bCs+UqjaTO1HE3poZ18iXJ9y9YC?=
 =?us-ascii?Q?O2USdanPrgtiPU0q3zdy35ZGSngt4ECEhx0Z746tXKHJpo2763zyZ5ceUApQ?=
 =?us-ascii?Q?QKsQwlTx3fygpxEXGYCwJq6NMFFkx8FqY+JsJ/k8/lPOWTWf4bUfQQTpGSGs?=
 =?us-ascii?Q?rz0M9sMJg8dFgzdAmfUB1llg2PMdL3xds4ct5D3gtukcszc1e+bU0QpBNNbY?=
 =?us-ascii?Q?O2B/uPp9ltc2pBr/EhpnBPh14HjbM75saOfDBH9FZl8F6EKJz/FPasDE4uQz?=
 =?us-ascii?Q?PpIXXZR4k+EUm/uaIyZPTaVEeKv0sAnUNaEGEkYkXa5UvJq7D7oojbxxWBCO?=
 =?us-ascii?Q?6IRynsyOQEAYVj8D6fFtYYqIxCrVC5zs1k0qVvLuKrgReixdKZ4hWrb+JCmM?=
 =?us-ascii?Q?LWYv1x7fTF8s5VFl++708taJJ9O/8N+JF43PlU4Srnsih2CoQt7PcLhWI1A7?=
 =?us-ascii?Q?Onl+K/PVxSecmOtDnDvt/V7hIppcYkdCXuKllHTrL3AgLhIuTo7XXmMdavSx?=
 =?us-ascii?Q?CHIldl0hoLhnNfJlOca+BpKYYKlxcnLYKteDNlkkD6PUh+t82YP5dMY0PC1c?=
 =?us-ascii?Q?uwpwMG/4HBBF6Za4ClzRYLt3FvZfLXH020sfETXBiUPUoC82bLkTdCSqme2H?=
 =?us-ascii?Q?6Ybqj7u4xWc9N5BxpBAbKjeJG/dg3VPQKVtDIZd24JSiTX9IcDXLEB7xDND3?=
 =?us-ascii?Q?VKSf0BXcnCxaCc/zOJ+SBCvgKcxxvlyy/IW28ULY8XChTHkoxwauB7a5JrtY?=
 =?us-ascii?Q?mmQI0R928U4ljXs2PZPNvE51VsxMko11y5VGUaosTFm5gJg3svgFxY/whdri?=
 =?us-ascii?Q?O1O8AY7UOxn8fLDHxTmvnME+TEbxfni7ZZCztzS5G3v7BEbl2QLBZWCxGb3u?=
 =?us-ascii?Q?TS+jInsoVxGujLO4KLjk0w/wezfzUBRntgsEhNeM5FtUmX9DtxcohGOuBkmO?=
 =?us-ascii?Q?S0M0Q/UeIkt1zhEcAOVn3KGzpY2iiv9okNo3LoNl8x5IjUY1V3zz31ZnolrE?=
 =?us-ascii?Q?zQ5PSYP61tVMPDcFUO7akd7jkcbDTvUlIRP4Ge+0jSgeJuo5x7cQOcUrzyUb?=
 =?us-ascii?Q?7HdkvbSG8Aj3zKjeHcMZj6C0loLeS/NuGpeIVp5JMwqhAKECD8voJWa0kggt?=
 =?us-ascii?Q?zp/B8UITHujPCj9T7i/5cKnqRyXGriJ0CHn/QjiauAdzj6VMYjkFuMJqR2TF?=
 =?us-ascii?Q?3i5ExF4xhw8slanSTPCVavpHn2S9whEgTS1gH3ZyEXQhEMTnBtjKXCk1TKDo?=
 =?us-ascii?Q?zsDGlrdUzoPAK9hh5AV1w1uNVqJsNq5e+WCYO2wRwN7wmQHWhdvvXzSQZbss?=
 =?us-ascii?Q?zj+iKWpA2p86oGfRrgN4FZMF0TjdqUFr0nlh/5ZBXgo6G9yNwyEmyIbR0zBT?=
 =?us-ascii?Q?K5vI6Nis/0LsWR3pSo+cRSD75zhTqNfAI+nc/N2EjeaFBvXDtd5ZptwVT5PG?=
 =?us-ascii?Q?4fuHwziL9PbQGnM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 01:53:45.7952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f49a20-2f93-4aca-a034-08dd471a4203
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6904

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


