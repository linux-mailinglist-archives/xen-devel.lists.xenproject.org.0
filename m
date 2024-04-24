Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0F48AFFF0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:44:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711053.1110728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTXs-0000fA-US; Wed, 24 Apr 2024 03:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711053.1110728; Wed, 24 Apr 2024 03:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTXs-0000cN-Qj; Wed, 24 Apr 2024 03:43:44 +0000
Received: by outflank-mailman (input) for mailman id 711053;
 Wed, 24 Apr 2024 03:43:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTQk-0003iy-7f
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:36:22 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d10f4b04-01eb-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 05:36:21 +0200 (CEST)
Received: from BLAPR03CA0133.namprd03.prod.outlook.com (2603:10b6:208:32e::18)
 by CH2PR12MB4246.namprd12.prod.outlook.com (2603:10b6:610:a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 03:36:16 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::c9) by BLAPR03CA0133.outlook.office365.com
 (2603:10b6:208:32e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Wed, 24 Apr 2024 03:36:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:36:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:36:15 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:36:13 -0500
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
X-Inumbo-ID: d10f4b04-01eb-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGCbezdktqld2vbBB95zhs1DELJyKC2mW/o9ZQKBEqJXWqGlJ2PbyfnyX+xqbiKHgXEfsPej918SG/oOmKJZPOJhjlHIhtPFGiNdx2MGdhjTQrBXTSXtNCgDaE0HAK4V8redAX422glkagWeg7zZo4dZFpkhNkZVjx3HojLjuJsGxqzWcLykDtIsQn8kJQwpGPPL+fCGbx+MifftvlycEndEMjAE/tpWJQSTDFhZ3R7wS839k1DS3dASn/+X2Lo0Ojw3JR9RKy4DQ+6wgDl273yeGWKitQuQFbdFlfdt6oEoryuGHIbZQWZ3Zdl13NH6l82EPQQ7ZKjaAo7ZDoQESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTNLBtjiYYmlxApKNXyZCt+SLybH8i5qLWCARszzQRM=;
 b=gEHr/K4qysy9Yk+pLTqnSiYCjEA3L0iAQ3gDFdG30ftOVikzJ5zyDgHtSJB6yTHILUJ2ffbq6qsWnTKls6H4RRjZ7Wu99dsjpw5ylAkznw9p63vmLulwROmkiqPyDl3YgwIZwgNN5qThwUwmR7Vo08u1kdJAiFcblYvGU6nReNaeHP3L6iHCBrgvHii0sqz6Rqe/SbytYLvEIThbMhY4Vf/clhsTPEsG4LJbZ4SLjDeL415QwWtO0GG2tLWqui7oMjwnIqwbtm/Ng5d/lbsBaUyun01pTFDeGvS5pCtZ6I9NKcLEsqhm0jvjX9PG0ciyFPyeo0uofYdwGWMkatXOrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTNLBtjiYYmlxApKNXyZCt+SLybH8i5qLWCARszzQRM=;
 b=TyhUEB8xgPQSpvDftFo5LvIY70qHo/Eo+KTUqPjOuH+sDEqCbZWE3DAoEfwPMLGZtZ4VOJ7EM4DLrvsh/yhgLrM1ooEXppfitRTxR1xphnMSDBzOYWI/t52xR/p6y7EItVAbPnOINCrJrnd+tSHe6lWcZW1096PKYeklj5Dz3ag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Henry Wang <xin.wang2@amd.com>
Subject: [PATCH 15/15] docs: add device tree overlay documentation
Date: Wed, 24 Apr 2024 11:34:49 +0800
Message-ID: <20240424033449.168398-16-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|CH2PR12MB4246:EE_
X-MS-Office365-Filtering-Correlation-Id: 6846187a-e152-4a97-c74c-08dc640fb25a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PGGIThaCJFQX0jXmTSnPba5ZGxXovPsG4o001npZbHll1SNu6Nd5xRq+2Pno?=
 =?us-ascii?Q?KYbv9ZmjTf1Mrl7v4DCRo3AN6ZDx1KMIeTL8h91GBsycf4ZQYgpIuDkd+u/B?=
 =?us-ascii?Q?Ka/NyKU29s1ZaXJsex7ZovFfoJJkth57+ixi0KR5lHZ2NCvJNiICe68z+AGa?=
 =?us-ascii?Q?M5NdcpKUyU1U/up/AG3pcxNhX3M1LTAO6bMQH/Bu4/9PCYqQnjT1FSTFghEO?=
 =?us-ascii?Q?xX5MEvkRPXvXRz094DE9WhZC/ucvUlRDhz4hRIU3puOrztB4QdIJPkAvibI9?=
 =?us-ascii?Q?xuMigunKYi4YgkSdAS3ThgaiI2V8d+x/un2pR0aLNTfjSXrsPfopW8Cjp6Oa?=
 =?us-ascii?Q?H4ABp59aJ+wCW7MrArKzUBYRBiWal2JDPAkrsN5St1L3+wBAz43e/srs+gsk?=
 =?us-ascii?Q?xgNXpeMUaKwP1S6t3IbQtp/DOSRHFgxy5ykTH5KDawqjrH8pyiVayM8qqhfa?=
 =?us-ascii?Q?ZLLldCltPxp8RvlAP0Qv1FZILXBc9pnJsoUnCpxaj49B4E0FD/ipTT4bv4FG?=
 =?us-ascii?Q?sgciItgH8jvC8JvJtxCuIGHG08L1s4mOKjdv/fr/BAhSb8Trz87KSA+HYRb8?=
 =?us-ascii?Q?xuyodhwUo5F1ep1T4qVsc4hEwsXT6hFWZiW7KvMr8Fa3i/AFsH6cQjX8nviv?=
 =?us-ascii?Q?N+wOODMBmisXc80M9X9IJhrcpxYyw5NyMQImi142twSZlAnbBOm2XjAXY/WU?=
 =?us-ascii?Q?BbzgJH0gkdp0L2NXt3fyOv8FiNKFzOsz77i9emAyrlA435u+DOs5ntZHMDES?=
 =?us-ascii?Q?xA3qnTjBH2PEUbuwHh/p+gHyZ6ovrl0o1niy787QMmXSqL7Nv4tPyHbcTU5x?=
 =?us-ascii?Q?Q4WVIeRfTMds5ja/Gq3nR6Fdzmvx/QucEF7GyxoJQ4XvSVV5U6hMnqB68ja7?=
 =?us-ascii?Q?VL/kAKpzA+lG+12BEMLaGMJQMgqYLk3W+kbKl/DRuaDby2FkSwvdvYxPG0oM?=
 =?us-ascii?Q?H1JryQTeDVvVPPN7yespSbSac+9IKRzJ3g2IG0+TegBJjhuE2jnnfocVWz51?=
 =?us-ascii?Q?K+8cVeEY/Y8l8IRqsnJsNrsrnkxq77/mp7F3QsfV1bq46JfR5hFw6cP79Mw2?=
 =?us-ascii?Q?wXc4mJPKGhquNhM25KBe6tyK/Lf3ZkXmsTwP8NpjM31X///cGYHAMoLh16Om?=
 =?us-ascii?Q?Ac7HnzHiB/7c3KTRS11Y1lsGtepKwo281uV+BX6yZSSxwOfKQbCBNm0VZy24?=
 =?us-ascii?Q?PvGR7wChR/BUTH0npnBTNyuMgQYrRtKPZoWDJiRGl//rPS3wWDqhd8ppQH+y?=
 =?us-ascii?Q?WgjwCOkpIi/X0vxgzlhtbbOgc2vkkXrWeIV7CMsA30I7VpVz0yFNIOxi1pyl?=
 =?us-ascii?Q?i03kw0Pj3BDQkYh0BIjSSNQbAwNo5gmZvoiO49u9fN8S6d4Jpkm60nGojeTq?=
 =?us-ascii?Q?J7kB5k8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:36:15.8879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6846187a-e152-4a97-c74c-08dc640fb25a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4246

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 docs/misc/arm/overlay.txt | 172 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)
 create mode 100644 docs/misc/arm/overlay.txt

diff --git a/docs/misc/arm/overlay.txt b/docs/misc/arm/overlay.txt
new file mode 100644
index 0000000000..0351f82a19
--- /dev/null
+++ b/docs/misc/arm/overlay.txt
@@ -0,0 +1,172 @@
+# Device Tree Overlays support in Xen
+
+Xen now supports dynamic device assignment to running domains i.e.
+adding/removing nodes (using .dtbo) in Xen device tree, and assigning
+them to a running domain with given $domid.
+
+Xen supports two modes of operation: normal mode and expert mode for
+assigning nodes to domU. More on this below.
+
+Dynamic node assignment works in following ways:
+
+1. Xen tools check the dtbo given and parse all other user provided arguments
+2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
+3. Xen hypervisor applies the dtbo to Xen device tree and assign the
+   dbto's node resources to the user-provided $domid.
+4. For normal mode,  Xen tools share the modified dtbo with domU. domU needs
+   to run get_overlay.sh to get the dtbo from dom0 and apply the
+   overlay. get_overlay.sh uses get_overlay application for data transfer
+   between dom0 and domU.
+
+
+# Overlay Sharing protocol based on Xenstore
+
+The overlay sharing protocol with domU works in the following ways:
+
+1. get_overlay creates Xenstore path data/overlay and creates the
+   following nodes under data/overlay path:
+       a. receiver-status
+       b. sender-status
+       c. overlay-size
+       d. overlay-name
+       e. overlay-type
+       f. overlay-partial
+   and write "waiting" on receiver-status and "not_ready" to sender_status.
+
+2. libxl waits for "waiting" status on receiver-status, then writes
+   "overlay-size" with dtbo size and "ready" on "sender-status".
+
+3. get_overlay waits for "sender-status" to "ready", then allocates the
+   pages, next it shares the pages with dom0 (the page-ref num) by creating
+   page-ref node under /data/overlay and finally writes "page-refs" to
+   "receiver_status".
+
+4. libxl waits for "receiver-status" to become "page-refs" and copies
+   the data to buffer allocated with page_refs. libxl also writes the
+   "overlay-name", "overlay-type", and "overlay-partial" nodes with
+   user-provided information.  Lastly, libxl writes "done" to
+   "sender-status".
+
+6. get_overlay waits for "sender-status" to be "done".
+
+7. get_overlay copies the data and writes it to file.
+
+8. Finally, get_overlay unshares the pages with dom0.
+
+Note: get_overlay application needs two drivers xen_gntdev and xen_gntalloc in
+Linux. These can be loaded using modprobe xen_gntalloc and modprobe xen_gntdev.
+
+
+# Examples
+
+Here are a few examples on how to use it.
+
+## Dom0 device add
+
+For assigning a device tree overlay to dom0, enter the following:
+
+    (dom0) xl dt-overlay add overlay.dtbo 0
+
+This will allocate the devices mentioned in overlay.dtbo to Xen device
+tree and will assign these devices to dom0.
+
+Next, if the user wants to add the same device tree overlay to dom0
+Linux, execute the following:
+
+    (dom0) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
+    (dom0) cat overlay.dtbo > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
+
+Finally if needed, the relevant Linux kernel drive can be loaded using:
+
+    (dom0) modprobe module_name.ko
+
+
+## Dom0 device remove
+
+For removing the device from dom0, do the following:
+
+    (dom0) xl dt-overlay remove overlay.dtbo
+
+NOTE: The user is expected to unload any Linux kernel modules which
+might be accessing the devices in overlay.dtbo. Removing devices without
+unloading the modules might result in a crash.
+
+The following is an incorrect sequence:
+
+    (dom0) xl dt-overlay add overlay.dtbo 0
+    (dom0) xl dt-overlay remove overlay.dtbo
+
+The last command only removed the nodes from the Xen dtb but it did not
+deassigning irq/iommus from dom0. This will result in unhandled
+behavior. The correct sequence is to deassign the nodes from dom0:
+
+    (dom0) xl dt-overlay remove overlay.dtbo 0
+
+
+## DomU device add/remove
+
+There are two modes supported for domU use cases: expert mode and normal
+mode.
+
+
+### Expert mode
+
+All the nodes in dtbo will be assigned to a domain; the user will need
+to prepare the dtb for the domU. User will also need to modprobe the
+relevant drivers.
+
+Example for domU device add:
+
+    (dom0) xl dt-overlay add overlay.dtbo $domid
+    (dom0) xl console $domid  # to access $domid console
+
+Next, if the user needs to modify/prepare the overlay.dtbo suitable for
+the domU:
+
+    (domU) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
+    (domU) cat overlay_linux.dtbo > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
+
+Finally, if needed, the relevant Linux kernel drive can be probed:
+
+    (domU) modprobe module_name.ko
+
+Example for domU overlay remove:
+
+    (dom0) xl dt-overlay remove overlay.dtbo $domid
+
+
+### Normal mode
+
+Libxl modifies the dtbo suitable for the domU. Currently, it does basic
+modifications like updating "target-path" and "interrupt-parent" to make
+them compatible with the domU device tree. Please note that this might
+not work for nodes which need more complex adjustments. The user needs
+to make any required changes for complex overlays and modprobe the
+required Linux modules.
+
+For normal mode, the user is also required to input below three parameters:
+
+a. overlay_node: the name
+b. overlay_type: whether the nodes are fpga nodes or normal nodes
+c. partial or full overlay type: only needed for fpga overlays
+
+Example for domU overlay add:
+
+    (dom0) xl dt-overlay add overlay.dtbo $domid overlay_node_name overlay_type is_partial
+    (dom0) xl console $domid  # go to $domid console
+    (domU) ./usr/lib/xen/bin/get_overlay.sh
+
+Finally if needed, the relevant Linux kernel drive can be loaded:
+
+    (domU) modprobe module_name.ko
+
+Example for domU overlay remove:
+
+    (dom0) xl dt-overlay remove overlay.dtbo $domid overlay_node_name overlay_type is_partial
+
+The get_overlay.sh script automates the following:
+
+a. gets the modified overlay.dtbo from dom0 using Xenstore transactions
+b. applies overlay.dtbo to the domU Linux device tree depending on what
+   type of overlay it is
+c. removes the overlay nodes from device tree when the user requests it
-- 
2.34.1


