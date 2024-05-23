Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C0B8CCD28
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:41:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728103.1132940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34Z-0003xn-Rl; Thu, 23 May 2024 07:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728103.1132940; Thu, 23 May 2024 07:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34Z-0003qF-HU; Thu, 23 May 2024 07:41:11 +0000
Received: by outflank-mailman (input) for mailman id 728103;
 Thu, 23 May 2024 07:41:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Po+=M2=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1sA34Y-0003CF-A9
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:41:10 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0c96977-18d7-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 09:41:08 +0200 (CEST)
Received: from CH3P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::6)
 by SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Thu, 23 May
 2024 07:41:05 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::18) by CH3P220CA0028.outlook.office365.com
 (2603:10b6:610:1e8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Thu, 23 May 2024 07:41:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 07:41:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:41:04 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:41:03 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:41:02 -0500
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
X-Inumbo-ID: d0c96977-18d7-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmbpJ0HsSwwe+NJUpclGR6c3RxCh0P/ps3q7wVmhSEmnerM6SjhVj4T8DmBqzUIOxdZCaFGy/JxMm5TMJKuD8mfFc8vuFqdG1gBPTvsRhuXntrSxXCQDmoZt93I9QZP3U9eDC+5IRtYS54gjXlucnPt7US4lj8wAp2EkvZZqwHcxxN529JgwfRGDUW+jgt7KhmQKO2UwcSMPDdDG0wFRO7eyK//VSWBBEAW4Lar472c3dCDy99V4Z8brmIjKtrteYzTke1PYNrpRwSu8Hpkk6NLgatfk+7GisFvpbh0PX1OGKCQowsyUzHVgEGvPd3XW0hyThy3ncy1sTCqzMxGXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/FY1olHM2o9Q7bHo9+Dh+AEIc21S3KHBajG96rQ8uk=;
 b=GPy/cb2Ftw3Aaur26qyqNTFgeN/2u3/9MbDFiK8zqiTGDu8z/U3UXiy+xE156kpxoww6NtAXwGjSYzHpaGnVFih5/AM3N5qAmQxri2sp/sMawJ70kQlZZOITfeJjcsgfL9x+17ZmbCqDUe+bRNNfG+Bxlg0f5SMM5ycOrF2dXi5Z+lcYgqKYdgoaIX1nqNLhep5icI569r9zgJtfy8QIiN97v9p9ny6swpaNc5plh/Vyt88HZTzjYLR8pTTYfRmK6bSFcE/mNVw38ZZsBN2pO+MAC1Rlc8tluB1uHB3U9ifaSRas4mr1oVNtwXgeBI0sioKpR8uoXcl8VJyhaBct0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/FY1olHM2o9Q7bHo9+Dh+AEIc21S3KHBajG96rQ8uk=;
 b=x0HF11Ut5J5qvqv8o8lEU9slHgbH7ylvjLio4m13+rUqwcw5DQOaMpbwJuuD2ekcKieCMX1FFGUIGm3rGm2GehLf1h+a8gbdtTbQPA07GGgH+NeozFcnEizPLZbROMy1obq8hJaxfGk39w5UH0RZGM9MiMBgCfSOaeuPceWy6RQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Henry
 Wang <xin.wang2@amd.com>
Subject: [PATCH v4 9/9] docs: Add device tree overlay documentation
Date: Thu, 23 May 2024 15:40:40 +0800
Message-ID: <20240523074040.1611264-10-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523074040.1611264-1-xin.wang2@amd.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|SN7PR12MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: c8cfb63d-fa69-4f2c-610d-08dc7afbb381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x8MX7l7cJJXwKSNdmYB957qHQ8qn5KZnsPnXe83e9gpHl7382t3HE5Mc6QG/?=
 =?us-ascii?Q?gjk0ygz8Htq/J6xGJ6xR25aawR97fF04ipzWqCGogE9XKPLtcW9R65DOgcNS?=
 =?us-ascii?Q?Ng6kZiLd0NBfWPE1nOgNhYv4Acn+LQ30X/BZDdpDxR1N43GW2UJ/V4VM2WBr?=
 =?us-ascii?Q?7pexlZu1VnJ7Nwt8RRF4ebpSaiyBQ/sBJSaMXP98iChBsTADivoRHBqewBd0?=
 =?us-ascii?Q?f8IGq3JStb/bmhjKvvW1Byh1j1paIm/gNSQPXkrLYd8VuhoFjFzQ8U3vUBuX?=
 =?us-ascii?Q?wotU1G4DCHYK8i9VOcAGQbKPibC5keQHs4e/vI1Jk2t7NSHw22bIqf3yBrns?=
 =?us-ascii?Q?brdnnlbZONunHGV2WXw1FJ2gdymVnGNhg0i2S2S8MlgF3ybw0imC70Jp4AU9?=
 =?us-ascii?Q?fZ4PMvgGFYpHSg8HlgdOrN00L1LFOIRPm81XpzhOvI5hB9HJkomb2G+KrpSO?=
 =?us-ascii?Q?vaqQ4nHMBwsHhVSNxS+XJqwjOVFfWvbgiGGmXI0DlMUoyntQ084HHmOgyzPj?=
 =?us-ascii?Q?XeGHRYKakXMO1it4xLJQ/JAAQd8CgkH4/UDmVXKJlWoR+vNE3ZoCkDIXGQcU?=
 =?us-ascii?Q?u/XGefwmO9r7JWtkGuoVF1J+lvvi7/8JlwuHW7YCmigvhzUSIvBr/hauNDe4?=
 =?us-ascii?Q?fl8IA8uGlYCOI4q23OuyXOmmbG9Jfp8eUNKqk6+0w5XnONGKIIjZcKU5CZIJ?=
 =?us-ascii?Q?sobwK6OHVmq0K5GWPVnSqvpC5MD+CSHwDVsTH25Ygy73NTTELS1By8xmkdly?=
 =?us-ascii?Q?PqkopfgGLT4QXrPqkfEwySxJLEaouqCnQHN4rdrxfgwbmK7IcTm01xRtveWN?=
 =?us-ascii?Q?JlT2+e7MvtyU/IA34TM/OjLoLjD3dgnLmmgq77jlEOd8oaLBQ+DI7CjIMHIj?=
 =?us-ascii?Q?B7lq+sezpMfkttFNnJ2fF3zrbaR1Ny8JVV41ybcBYEy0nHXcgE1hhDSyHrIc?=
 =?us-ascii?Q?mclND3WqtrSbLE/teyjU2GvJ6h8rBgvQDki9pYQ9sIq/0x+0lTmBp28M3UVT?=
 =?us-ascii?Q?XP5QIfTvtnTC+VKGRpz0t582Z8+JZPmkvjoYbUvC3x9VRHlATxYhC6sCXZFA?=
 =?us-ascii?Q?JUWLdg6/sE/gqrku53hmK+WQrZTh85M1B5SRbjHdG02Kb7OM4Z0XRkgkxHnE?=
 =?us-ascii?Q?oEkyajwl3I3dQFyT681KgFK0zR1y1VwVKjmvQeArUqE2SAH56ibvfT/kO6tr?=
 =?us-ascii?Q?qSObuDRJwNQutbmhGWTEMBEbLt9EChCZo+nxBPISv//bX4VXANDhF1j3CVvg?=
 =?us-ascii?Q?F2Wi8jvPQQVXI68iLl395GobR9qF4F9n7E1FHDqw+mZ/8llJtmVwz/f0XDnn?=
 =?us-ascii?Q?qUNwoTfnCTotvjD0bxCuUg5i?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 07:41:04.5967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8cfb63d-fa69-4f2c-610d-08dc7afbb381
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6839

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v4:
- No change.
v3:
- No change.
v2:
- Update the content based on the changes in this version.
---
 docs/misc/arm/overlay.txt | 99 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 docs/misc/arm/overlay.txt

diff --git a/docs/misc/arm/overlay.txt b/docs/misc/arm/overlay.txt
new file mode 100644
index 0000000000..811a6de369
--- /dev/null
+++ b/docs/misc/arm/overlay.txt
@@ -0,0 +1,99 @@
+# Device Tree Overlays support in Xen
+
+Xen now supports dynamic device assignment to running domains,
+i.e. adding/removing nodes (using .dtbo) to/from Xen device tree, and
+attaching/detaching them to/from a running domain with given $domid.
+
+Dynamic node assignment works in two steps:
+
+## Add/Remove device tree overlay to/from Xen device tree
+
+1. Xen tools check the dtbo given and parse all other user provided arguments
+2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
+3. Xen hypervisor applies/removes the dtbo to/from Xen device tree.
+
+## Attach/Detach device from the DT overlay to/from domain
+
+1. Xen tools check the dtbo given and parse all other user provided arguments
+2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
+3. Xen hypervisor attach/detach the device to/from the user-provided $domid by
+   mapping/unmapping node resources in the DT overlay.
+
+# Examples
+
+Here are a few examples on how to use it.
+
+## Dom0 device add
+
+For assigning a device tree overlay to Dom0, user should firstly properly
+prepare the DT overlay. More information about device tree overlays can be
+found in [1]. Then, in Dom0, enter the following:
+
+    (dom0) xl dt-overlay add overlay.dtbo
+
+This will allocate the devices mentioned in overlay.dtbo to Xen device tree.
+
+To assign the newly added device from the dtbo to Dom0:
+
+    (dom0) xl dt-overlay attach overlay.dtbo 0
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
+## Dom0 device remove
+
+For removing the device from Dom0, first detach the device from Dom0:
+
+    (dom0) xl dt-overlay detach overlay.dtbo 0
+
+NOTE: The user is expected to unload any Linux kernel modules which
+might be accessing the devices in overlay.dtbo before detach the device.
+Detaching devices without unloading the modules might result in a crash.
+
+Then remove the overlay from Xen device tree:
+
+    (dom0) xl dt-overlay remove overlay.dtbo
+
+## DomU device add/remove
+
+All the nodes in dtbo will be assigned to a domain; the user will need
+to prepare the dtb for the domU. For example, the `interrupt-parent` property
+of the DomU overlay should be changed to the Xen hardcoded value `0xfde8`.
+Below assumes the properly written DomU dtbo is `overlay_domu.dtbo`.
+
+User will need to create the DomU with below properties properly configured
+in the xl config file:
+- `iomem`
+- `passthrough` (if IOMMU is needed)
+
+User will also need to modprobe the relevant drivers.
+
+Example for domU device add:
+
+    (dom0) xl dt-overlay add overlay.dtbo            # If not executed before
+    (dom0) xl dt-overlay attach overlay.dtbo $domid
+    (dom0) xl console $domid                         # To access $domid console
+
+Next, if the user needs to modify/prepare the overlay.dtbo suitable for
+the domU:
+
+    (domU) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
+    (domU) cat overlay_domu.dtbo > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
+
+Finally, if needed, the relevant Linux kernel drive can be probed:
+
+    (domU) modprobe module_name.ko
+
+Example for domU overlay remove:
+
+    (dom0) xl dt-overlay detach overlay.dtbo $domid
+    (dom0) xl dt-overlay remove overlay.dtbo
+
+[1] https://www.kernel.org/doc/Documentation/devicetree/overlay-notes.txt
-- 
2.34.1


