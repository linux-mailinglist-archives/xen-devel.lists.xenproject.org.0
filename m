Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A008CDF70
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 04:19:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728989.1134135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW8-0005JJ-O6; Fri, 24 May 2024 02:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728989.1134135; Fri, 24 May 2024 02:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW8-0005Ew-Gf; Fri, 24 May 2024 02:18:48 +0000
Received: by outflank-mailman (input) for mailman id 728989;
 Fri, 24 May 2024 02:18:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAKW7-0004I4-DO
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 02:18:47 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f19a7382-1973-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 04:18:45 +0200 (CEST)
Received: from BN1PR13CA0028.namprd13.prod.outlook.com (2603:10b6:408:e2::33)
 by SA3PR12MB7808.namprd12.prod.outlook.com (2603:10b6:806:31b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 02:18:40 +0000
Received: from BN3PEPF0000B374.namprd21.prod.outlook.com
 (2603:10b6:408:e2:cafe::71) by BN1PR13CA0028.outlook.office365.com
 (2603:10b6:408:e2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.5 via Frontend
 Transport; Fri, 24 May 2024 02:18:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B374.mail.protection.outlook.com (10.167.243.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.0 via Frontend Transport; Fri, 24 May 2024 02:18:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 21:18:35 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 21:18:34 -0500
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
X-Inumbo-ID: f19a7382-1973-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fs3ERBiqLH43cXK4d92rJTJk5XKoqn/N9iAZyMIGSBTo5kAMwcidPAxPDhubgzub6ENMkj+OhIYrwIi0ReCD258Dp2yEagpUf8fn1iEXO84D01rJimDzpNZ5/3b0tx7K05rd+TiaO2izJq1ovDCDZ5vDb1pPM5TCnWhkTWftQp7gT/O3IPrdm9f86mkd31ZXF2aCJZVCLFKfvIPLXtWQbAA861nOnCagd9EG1gs2hhC1SvjM9zW7XCr+VROOTjcVrMsNyzBxxbqasfIuhy+FoyvOT3HPYTLpH/VQ5nxICfUyruFvcpWdFNyxJyPNglhwtOC/8P7t6M58ZqPzRn7opQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spfuWcKUhy4IpKgxdQbUBhNNhHU158grwSfyfQ+eUYo=;
 b=HYKmb8aI6KtNvlloVTSrsMxCRN8LKkj0H3Gjb3IhMghKn/0ldjNg9siSvVAUbyDcBZQgTjXiVRwBym+u0X7EzkXUlJ8MrYsgwhBlIgJPlHs7YnnN9ZasgyoTX2DQxcuNteUzKSj5avlVla+C1YgVEtajPqftWoTkqqfhVJA00lh20l9p5tMgU5B9VtrvTeBydgcBoEA+S91O4DLhk2FReLf3ZYYU7iJeXvf8NoTB7GPQIJ4NEcc83zOVHgOHfQ+T5f/K3P8nhLMpvOzJ2vSF9FZ7xOC+9J5NeiaO8ZmEzZbfdB9hZdl7r6yoTKDNMrVT8qHKolD973086XctB1v0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spfuWcKUhy4IpKgxdQbUBhNNhHU158grwSfyfQ+eUYo=;
 b=qgUa3GAcc0X79CF2OsHLFWP/KK341C23/WpjuZEUvrTlsGHnln3bYg5KILYth5xNqjQ1bSuZgdLU9nhxR43hXbJBFiIj3eK5nQuwBQmuL3Inxf2+JI2jKGbDvpg4UZf+ZfDxS8c2lA+IsuslAMk/N+rQ5AKzqdD3Y+pF8PU86JY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
	"Stefano Stabellini" <stefano.stabellini@xilinx.com>, Henry Wang
	<xin.wang2@amd.com>
Subject: [PATCH v5 7/7] docs: Add device tree overlay documentation
Date: Thu, 23 May 2024 19:18:14 -0700
Message-ID: <20240524021814.2666257-7-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B374:EE_|SA3PR12MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: e4961a22-ac01-47d0-80d5-08dc7b97d2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|82310400017|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WLmn1WgWEulHuBgsdlmgC06rLAkeRjI7lKTDnoUxl9HAFHN6vGddY044lrNl?=
 =?us-ascii?Q?uLTx+mWFd+cxpC2lMCdMqcPqX8XmAOx+QPgxxokOHrQPtAGO5UWVj/Ftmhin?=
 =?us-ascii?Q?XXFoiUZXPkojMntMhhGWWuQRpAMInUIksgXx2o35I9b/2CJEiE1BindYw3m2?=
 =?us-ascii?Q?QN4YUSfjO90iqzbjNqBLMcmu1F77Mdi7ftUZ47nMR7tVs31EoETftWHXfAKg?=
 =?us-ascii?Q?XfIsNGjsrgNzmilFbAJ5cr7UX7OHWBtyDmjtjZtYZRq8bkoSyN6nXjdekVAK?=
 =?us-ascii?Q?9Xp9Z5u6XXhj5rWDF6Oe5W1u3ZqmjUQo5Td7An5Zta/k++Xh7Yp8t5po8ZG+?=
 =?us-ascii?Q?TzJLJdtcXTvrmjZwvBDI5JbanPxdEkDoPmTbusKAejzWSJwVue4aK9vD7n20?=
 =?us-ascii?Q?8/F6Thu3Ingk7lr3tCo0eJXIOY1PJrIctaCt9wSvt97uKicW4c+8pobrbitE?=
 =?us-ascii?Q?GIDH5LI29ZiedKIrwkfFp4yy4Mh6r1DNQfL09Ejsq6MliuEy33iCWrevANoh?=
 =?us-ascii?Q?APLojt9fz4NNo2uMFvU6Gyxk5Xz2q3tdwDawlqlcD6+h5dFU2q1UaC3SPzWx?=
 =?us-ascii?Q?9xmeHiGV9q8SwTzrdCBO4bmtZ6KSbkweDXNQdd+ujTp2PSI7703HDiQqtWMI?=
 =?us-ascii?Q?UQnPybyZVtNbmU5cNJrSzJLPAPwA0XsfB/LimTDpIUT3q9Z6P86+ctVPez/6?=
 =?us-ascii?Q?Z79GrF9rPMgqRrzN+GErd2/pGDNb8KPEh166gRZ3g4GiHMcJfsHYXP/PKsph?=
 =?us-ascii?Q?HRcEtAtJ5iQnsP3fyHBd2UGvzyfi+DuHSy1ofHc1dJnjRH4NpMReCtv0qVVY?=
 =?us-ascii?Q?XP6GOq6l5apBfPM19R8Rr5yUdz7+lKvf76t75hKWVk/Drt6iOaFtbyowigQc?=
 =?us-ascii?Q?2vgrgq6LGSYTaCQQxsAdIz2bL9kHwq0eEnq4x/Ev6OAUOhfA3+6KtlAXQxVl?=
 =?us-ascii?Q?LoQcSmDHRLfVvCvr8ST2Po9fyGsVue+QmGanaYulI6e2tEzEGKQKJLP0z9md?=
 =?us-ascii?Q?GL7iVTtHfzzLjbmx33rp73aotZ/VCL6rPi1D94RrF/lkV0971IlqWDluIrG5?=
 =?us-ascii?Q?DegjslMF/Iy/kI/odgdngVL8sQEqdK1MPepPA90+z8qMvGjBV1A1k08iy/Xr?=
 =?us-ascii?Q?Ah+KhGzkyYRCsfGp8oZgM+HG8Y0RMVwDpAccnr/wcAcnJ11xnMSdeojJG4hD?=
 =?us-ascii?Q?FfXEEIGHEGEKK8JLb5o0VzBS8pkTJW26v3v3h8PswvJsuC8S6QTY11mVAWrL?=
 =?us-ascii?Q?1EGmoLEp7AS1CEeVl6e/wU9Zwh6OahGOXC88L5aRv9NwMi6wxsGl03jT6JxK?=
 =?us-ascii?Q?LEZY/ZxGkBn4ESo4sUIhUWUH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 02:18:38.8750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4961a22-ac01-47d0-80d5-08dc7b97d2f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B374.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7808

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 docs/misc/arm/overlay.txt | 82 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 docs/misc/arm/overlay.txt

diff --git a/docs/misc/arm/overlay.txt b/docs/misc/arm/overlay.txt
new file mode 100644
index 0000000000..0a2dee951a
--- /dev/null
+++ b/docs/misc/arm/overlay.txt
@@ -0,0 +1,82 @@
+# Device Tree Overlays support in Xen
+
+Xen experimentally supports dynamic device assignment to running
+domains, i.e. adding/removing nodes (using .dtbo) to/from Xen device
+tree, and attaching them to a running domain with given $domid.
+
+Dynamic node assignment works in two steps:
+
+## Add/Remove device tree overlay to/from Xen device tree
+
+1. Xen tools check the dtbo given and parse all other user provided arguments
+2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
+3. Xen hypervisor applies/removes the dtbo to/from Xen device tree.
+
+## Attach device from the DT overlay to domain
+
+1. Xen tools check the dtbo given and parse all other user provided arguments
+2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
+3. Xen hypervisor attach the device to the user-provided $domid by
+   mapping node resources in the DT overlay.
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
+## DomU device add/remove
+
+All the nodes in dtbo will be assigned to a domain; the user will need
+to prepare the dtb for the domU. For example, the `interrupt-parent`
+property of the DomU overlay should be changed to the Xen hardcoded
+value `0xfde8`, and the xen,reg property should be added to specify the
+address mappings. If xen,reg is not present, it is assumed 1:1 mapping.
+Below assumes the properly written DomU dtbo is `overlay_domu.dtbo`.
+
+For new domains to be created, the user will need to create the DomU
+with below properties properly configured in the xl config file:
+- `iomem`
+- `passthrough` (if IOMMU is needed)
+
+User will also need to modprobe the relevant drivers. For already
+running domains, the user can use the xl dt-overlay attach command,
+example:
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
+[1] https://www.kernel.org/doc/Documentation/devicetree/overlay-notes.txt
-- 
2.25.1


