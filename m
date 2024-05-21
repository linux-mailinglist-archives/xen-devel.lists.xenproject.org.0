Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784158CA775
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 06:36:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726506.1130859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEd-0000Gv-I0; Tue, 21 May 2024 04:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726506.1130859; Tue, 21 May 2024 04:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEd-000091-80; Tue, 21 May 2024 04:36:23 +0000
Received: by outflank-mailman (input) for mailman id 726506;
 Tue, 21 May 2024 04:36:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H+om=MY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9HEb-0006hu-QU
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 04:36:21 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaab29f0-172b-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 06:36:19 +0200 (CEST)
Received: from SA9PR13CA0038.namprd13.prod.outlook.com (2603:10b6:806:22::13)
 by LV8PR12MB9184.namprd12.prod.outlook.com (2603:10b6:408:18f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 04:36:17 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:22:cafe::c3) by SA9PR13CA0038.outlook.office365.com
 (2603:10b6:806:22::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.17 via Frontend
 Transport; Tue, 21 May 2024 04:36:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 04:36:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 23:36:16 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 23:36:14 -0500
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
X-Inumbo-ID: aaab29f0-172b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fywDq+F8ZGMrfUxKPqSqqF3oAolIRpEEbBFbzBbAa8KXVzudey5rsgsIMbNRln5vrQHdRLJ9ab5T7pk215gEzEvj0OsmDfhE1f8optPrabs0UyZOvnWuJf42OMe5FZ4qY0ovnWcH4D23pXFa0mUa4XuR2B+HMp7YC8+Q45sJqq0Mi3hUq9FeJ9HH2/UQe1qKq/dw6P4b8/JEI1kGeEp8Fu/jeWaeu9/moU+vo09wA+yWHLlvSAMMaMK93PEW80sUbWEgkZoUtJ45OyNrlU8iwhfeYaPSwuShMpH2WAUL27clBZPq8S0/OckiRJeYlDnASdMpd03zChjsImOe0+kOVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLkeA8mEKzf4yLdB3J64v/O8UY7F2ncd41W/P3+Us/g=;
 b=UUub2UTTVSpd/hDLNf1Id5Kw4FolJSjfqMNtapVVOJr0CNMcYp4XXmDzQiz84aapscx3VbC0ybGwWqvDLhIKkC6woFYbNOfCdPGh4TCCq6t3L18JbWcXgtri1/g5VaVd5xq2rHrpDrayXC1RGXxnx8mO1QyFa4bBClO5NPBrpRpA6+An2BX1tr5U0W0ehABmiPadlouqzF74Vxl0pXiUyrdabfPynS5j4LbZLXSdfE7GYygv2M0EYjfhAHZcnqe0g6sKXhn2X6DpqPYXQrlJIr5bGO2moTryTgPpm1j2BBUdDZsCzudJc19YU9PPryCoFSjnQ0zvxJQnIX3yxgjN3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLkeA8mEKzf4yLdB3J64v/O8UY7F2ncd41W/P3+Us/g=;
 b=JDTEYIVXoeRRJgh+spDH81Yzkfx9TPDdd7H346WpzdFVni27wvGUP/7dE5HUaZsWJBFCG2HnpRO/FI4YAibEySljg+P7qfVlNeUlBseFSmA+LjZgcH1uZ9Byw5tniT8KGp/+OLHbj71/mfFnQLGtJOOFC2/77YDBx1dtaWUBAZU=
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
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Henry Wang" <xin.wang2@amd.com>
Subject: [PATCH v3 8/8] docs: Add device tree overlay documentation
Date: Tue, 21 May 2024 12:35:57 +0800
Message-ID: <20240521043557.1580753-9-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521043557.1580753-1-xin.wang2@amd.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|LV8PR12MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fc71ecd-dcde-4d0a-93da-08dc794f8e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TBe6ZPZElNPFoIHFtmMPTFQQ9IZdZDGoI6LfPDW8BdhsaoX3Uy1pdWfPHH05?=
 =?us-ascii?Q?aidU7lt3oXxEXHQjtrBCxlbQq5KOnisUzbbhiQolp1BAM3RjxFiDfFAgmhmg?=
 =?us-ascii?Q?dL1VuA/Upb0OfbwtU+Uqs9cnOyT4UNxBuM0SIaDo5rmZqxqGqynnZzJaGt9s?=
 =?us-ascii?Q?2kAUQ7FFoQ+n1HJmElJR7b37QqyjXhm3UE9kVsXYL7p1Yi+RZMasUSYfp/np?=
 =?us-ascii?Q?1BtP/LgVgKhWHcsxiYGWNRgzOKTfDIXBR3lV4NUeL3c0c9uXtZORXjNw0fE5?=
 =?us-ascii?Q?smxIfxB4LPHyyDVFrjRJ02em5GH7K31i7uxoW8awXiGFepv3jdlNn3zC8LJc?=
 =?us-ascii?Q?GBGlPcEwHNb9IDif/kWw5PaWXKBj7XIo6eTQE0fs+vnHiKUjoGGDIo13mjg+?=
 =?us-ascii?Q?OWlJEJxkblHavDEwq0yfIcEU3n6X0vhxQAkk1sNtmw2fe4ZNP4bwICahgWM0?=
 =?us-ascii?Q?/bGbKGZwbWLbCHxcVbXerDMx8Dqgt1J1sOi+BjWH72GhaauoqTY4niLCxA9Z?=
 =?us-ascii?Q?0oWbSNu5GE1o+Sv5rlnWOkcWflKFr6TA3UQDaX7/rlhIRd7vNGP+avEL/Jc/?=
 =?us-ascii?Q?xP9GjhiaObiBey8O79FDb28sDntQwC9kGth8+gpY4o+Hc0dElZm0H62aifQ2?=
 =?us-ascii?Q?MGmeZBhyKxR1fvw2DIG3UwwXlGQmEogDYPfxKIecucdUsidVQ1d4MdTKmiE6?=
 =?us-ascii?Q?ohXXbIoqp6a0bpCeIucUCrbofKAgVZ/u4KtR+/1g/u1wSnr6zpc0UXfZhx3K?=
 =?us-ascii?Q?wkVQ6X3FG1+2uFlocRz3cPjlwfbbKe+CfFJI8kJPzIXvojV3t7xseqSw5stb?=
 =?us-ascii?Q?QuD3saALNrTWej5pI4yP3uo3OHX4bMthi+lfFFjv5WjNI5fg6CG+I8AxfHs9?=
 =?us-ascii?Q?whFINvUnol8u9XvRc7k4UyPH+ofMRoPydf/9YnerRb2w0g9xumXvMa6aWIKj?=
 =?us-ascii?Q?70hAIPUrp2QMyTo/AMa+gOcfcaS7rSI7/NcL8VPD+6kHbwTW9UL7LgbMHu0T?=
 =?us-ascii?Q?feUusEEaQKclleAMAMLw1n+VX8QWmeiduGPEB34LOE8pnQYOGHBPrKhXPe+m?=
 =?us-ascii?Q?Bxjk8OdJWSwlG9jcvvAp1iHLQ7yrbhcjXIYeY2xvyItdn4MEGKpNclZ6sTmS?=
 =?us-ascii?Q?iNxpnO9CowvtGiLtCRgs/RH0qVSOoDg11KOjFdtPmllmxRZ0Kxg6GWK/19D1?=
 =?us-ascii?Q?h3F4OL9iFN5WMk3aFZ9CBdcXfDJygGon7LpzZNA4oSERyvCkZhWmJzlQUDek?=
 =?us-ascii?Q?0AVZ5hVgx+FtL+x08FshCcysfgtwZJHAzEVv/Ux9TKW4k7wzOxwqu4rl1iq9?=
 =?us-ascii?Q?LmYmrDcjdxIdyzElOozVliSj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 04:36:17.1446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc71ecd-dcde-4d0a-93da-08dc794f8e08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9184

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
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


