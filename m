Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6968C7455
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722997.1127532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxw-0007d9-TU; Thu, 16 May 2024 10:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722997.1127532; Thu, 16 May 2024 10:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxw-0007ZA-OJ; Thu, 16 May 2024 10:04:00 +0000
Received: by outflank-mailman (input) for mailman id 722997;
 Thu, 16 May 2024 10:03:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MS9v=MT=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7Xxv-0005T3-4q
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:03:59 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cb6c228-136b-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 12:03:58 +0200 (CEST)
Received: from PH7P220CA0105.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32d::20)
 by DM4PR12MB5867.namprd12.prod.outlook.com (2603:10b6:8:66::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.29; Thu, 16 May
 2024 10:03:54 +0000
Received: from CO1PEPF000042AA.namprd03.prod.outlook.com
 (2603:10b6:510:32d:cafe::3c) by PH7P220CA0105.outlook.office365.com
 (2603:10b6:510:32d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.29 via Frontend
 Transport; Thu, 16 May 2024 10:03:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AA.mail.protection.outlook.com (10.167.243.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 10:03:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:52 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 05:03:51 -0500
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
X-Inumbo-ID: 9cb6c228-136b-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6cDwxO82zVZLhGS1fy16FpelQP4WNG3Ys4u65CT48A/rvuVSWZQFSn3cORmA6L6v/oLpxHRUQJ6hs718YpXuGiLiYqre2+rjnDiLWLgkCWvn4/r0bonA1Cdq+lyhCa1bemVJtNntBz3EKMekuB3zy1+nh9DWtcs0zCM4uVxT2u9fet84BH/Jg/kVdqW3J/abTA6txstnJ9c6ykvrj3C/9x769vxCBFh4Quz/9G/8Xj4jJD2l0WRvpwkPE3Vvpco9BYFLVBFCh7e3bfdRAQgfqYhUBd7NaKDm6/BxRkd5VyesAcAECA24pjlaiKi6YLRAT32qGG2BOdbo/U6DDaruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/Vywe/ogvtzCaenHHy7pk7r94uYXwgaQHO2LYJtq4Y=;
 b=d2Ac9Yv57g5c8k4qvUqRR9iV7ICX4xZMvKKRt+EhyRK0oHE3d9x3FeXPGPUyt08kSb9Xm9RXX03IoO+LeKbGFse7Ogt+jb+q0PcI+vX2SdQsbAWfxyHxkh7UzrvNs9/4j4ZEXbuTuorgOhgHaX1G1P4oAi/+SIHNYihVUiTL3iYsPrSW9DnnBYKEbTF0TxE9kHxYL3ly3wUyC5W+UXfK0M7oyN4ohO9WLEu3cYtXz3xxLUSNG8D8yZgTi2TVTnBZ4CK4nzf8Ki8+EKSpNGh9cfiB7NCiko1z6+v6EgH5wda/j8B7Fq1TiVQqNpwDy3hfb/4lTrdZWPAozU63P0VW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/Vywe/ogvtzCaenHHy7pk7r94uYXwgaQHO2LYJtq4Y=;
 b=dvIZDONT3W5ainpu7h0e34Hl0u3ueCu0dg9BqYh7BlftTnMGXXKxptrQWFQcOvJFaomsHUgHWTIWeu1TAbYZgk4Ux9KeexCKzab7RnSRFNUhGfF+UREKv4+LSJ7xkj2n0D87FSpC6hvBhSNL4vp6W/xy8jxqI3mgL2VWFPAjI8w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>
Subject: [PATCH v2 8/8] docs: Add device tree overlay documentation
Date: Thu, 16 May 2024 18:03:30 +0800
Message-ID: <20240516100330.1433265-9-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516100330.1433265-1-xin.wang2@amd.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AA:EE_|DM4PR12MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: ff737319-4604-4d2a-f520-08dc758f7e49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AHvP9pqvWSLHwdxEjSz16tS/r58hqMsutxIYmn6IiroeSLWQyfn9kX4tpRyJ?=
 =?us-ascii?Q?AmV8/UfBjjKJm75JMrHMo941QljY9LDp+gGhLXvOLYkR2VkbcMK8ysGyEM6c?=
 =?us-ascii?Q?8zlvdJHLaCZCZahsXb4He44Qimqaq0hfDnpXnY+9SYuU8fksT7nnTm05mOkj?=
 =?us-ascii?Q?i/3GrwgjOzKbjDurB/QrpUr9C0y6mXq+BgsAwFE4E45NEDWKtR5D2zj/vmoR?=
 =?us-ascii?Q?NCi7sjFJvBgEqZQY8HdBcC+A8OKetwVvhBGwK/h5ZEuubLNXqCvIzLZUY3AS?=
 =?us-ascii?Q?lwJG03P77iKvAhjZ+NRauotuj/Dr9dlNgte47Jp9jSF0UPvzt2Ywhq+H36Zn?=
 =?us-ascii?Q?uT5OGyxe/F+30XP38lWiODlOsGz9FNd5r8328GyrP6o+vPYpAaxTClZNfVMO?=
 =?us-ascii?Q?bhmXFLM7pC+8vnZrL7UlGvqunS+fKZKNzbGGDVGdv4qrodshpStc6L9tOFgd?=
 =?us-ascii?Q?M6DOmYJc+vIfrg4js8wLJgqAeYxcycJgV5ZoRoQ81Zwb+3JD6XDicAL//6qJ?=
 =?us-ascii?Q?8/wzBI5im86uFr47ZLacqh/2erKSrI2DPBPXHR67hp79GM7nm39XF4lfJaL3?=
 =?us-ascii?Q?YyXz88O6+zi2XZhiqv7BVD47hhHCZennWSGfExxZsdR7SMBkx/FG8tv5945S?=
 =?us-ascii?Q?GSfiAbkOoPmBHREnCFmckV9rxVsuiQzXKzG84341TNepDaFaUqxaW/wyA8iZ?=
 =?us-ascii?Q?gQskrn3HBctOhmaBHpXF5iJDkB8V4RFf8mLpu0bqWliXhS7pN5Ev7sGZB99/?=
 =?us-ascii?Q?JQLCWjy/dqNh6j3GaK3kc2XBGoLXuWtjohsnJ59VuFxnqJz2XOngKtkNBVWA?=
 =?us-ascii?Q?BJoqaSpF4OXcLz1T9IkvUufp3QF79eerG/KI3VXE8JgkK34vpt7PBTv7jtNU?=
 =?us-ascii?Q?XQH1iHBdBQoyzs7HzeZQRP4PaBky0fTSRCH2bJx3guApuRwdrr+H6vkgWQMX?=
 =?us-ascii?Q?5ao63aAJklHHeZPB3ywvYEDkpHs5TT904k4J05t+yiFWLOPQ3e/PNEfuWua6?=
 =?us-ascii?Q?wLW3YDH/U1Y5xYCSNKurSSHwPjEHyV6hUL2jO9YTApdEV5L4QWYeybcX0Ue9?=
 =?us-ascii?Q?GtP5AKT3QqMUcI61A0C0vvwFV6xlzLDweaTXs00k6egbNqaC3RlWhF/ALWCZ?=
 =?us-ascii?Q?9bqgbF3wJa6LxZSg9MDJQITH4dIbIvtPC1NzcPinbGoc7dVthylf/Y8i7zqP?=
 =?us-ascii?Q?xH+FNFP4pgf5dCfWbRBhJlstbnKkfKF+IM04Yo7peNMewhLYUKZJkhmhr3ko?=
 =?us-ascii?Q?GMnRC3joNAeX9MUEOjY5ry6Du3PryJOX3iVAwizV+Je8YPlmle5aGTQXcbom?=
 =?us-ascii?Q?9kM6g1BQ6xsBTkvL5Uu+ckyb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:03:53.7910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff737319-4604-4d2a-f520-08dc758f7e49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5867

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
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


