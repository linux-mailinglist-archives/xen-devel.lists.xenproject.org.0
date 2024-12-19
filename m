Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4799F79EC
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 11:57:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861072.1273066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEDB-0002mv-Tf; Thu, 19 Dec 2024 10:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861072.1273066; Thu, 19 Dec 2024 10:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOEDB-0002l3-Py; Thu, 19 Dec 2024 10:56:57 +0000
Received: by outflank-mailman (input) for mailman id 861072;
 Thu, 19 Dec 2024 10:56:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uI9H=TM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tOEDA-0002kx-Fs
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 10:56:56 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f55cb79f-bdf7-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 11:56:54 +0100 (CET)
Received: from MW4PR04CA0238.namprd04.prod.outlook.com (2603:10b6:303:87::33)
 by BY5PR12MB4276.namprd12.prod.outlook.com (2603:10b6:a03:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Thu, 19 Dec
 2024 10:56:48 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::15) by MW4PR04CA0238.outlook.office365.com
 (2603:10b6:303:87::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.25 via Frontend Transport; Thu,
 19 Dec 2024 10:56:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 10:56:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 04:56:46 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 19 Dec 2024 04:56:45 -0600
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
X-Inumbo-ID: f55cb79f-bdf7-11ef-a0d7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xupPMTkmreP5rxAsVhb4AeTlY6s1gNhaMFDa0ClPwM3caUI1S6z9vnC5MjecVEtstPJvmM6SJQHYmiyVw8sFiS2F8AEd1KCadDv6SCLi0NK30q2sEpYEY9tp0VJJfy1e60Kgi8GDT81kiUVwaFqlCB9p9esFdMXMcJrXKz7CR4jkZIPj6XdVRkkAkqZxOUHW2qRy04YLTnegXv/zo8M9HZgBubqYdYItkuj74XXkmW0QUR7Bs/hO64NCzIv2Vi7s8L+m5Blo1toM31nXSLaI53+YQKFML+9z5nAgSZzaCB2szy0p6jQ9eHiRPv8WtrhwZSlXmA1D88xJlp3tPZ4QSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHxm5uHc+E/fYv0O9Kf7RJsADfa13CFCzAn9OV8Y1NI=;
 b=xFBduoTa3NTclCZZnVw3iJ9WMX/+fMDDP+X6W0pRGyfm7c8RHv1IJAcNticaebSXSH4VSm1Cby4dbw+UNL66gESKHRgZirMFq7b8AJcKxIHyrGpgruzn2jlJdXSAun50Yx2raZXfZLykhkHu4W2e8G9DkU0gR0vnoI7OorKSxX+QJBLO+k1r2PPFXD9zZDt5qEW2Vdb2o9tc/upWmo6qynDNlExre3/oQ/PRBEMDC25xeWcz0KIjXqrWE8d8UOMB8HGzGDbUzQ5tjhrVpm4QXKQxNmjtJYPY/nkGI5h5fEP3SfL3+O0wVWL8eHijzCOwO2jc7Vb+6kC2wqzEE5afUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHxm5uHc+E/fYv0O9Kf7RJsADfa13CFCzAn9OV8Y1NI=;
 b=uW7URXeVgpdYQoFg/llVtkPiCK+PUO9sat22HcIkxChsPWvuDO8Z4r4TzgjvskAdBwqkz/j+jVlJH51OQE41+XE0OesEDCOFawGQ1bOvMaUk5rpuWX5BcPqrfcXoT6JhukOsNGBNNgr/KHhaGcjnwDy/99Kb113Yrz/g979mldA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3] docs: fusa: Add dom0less domain configuration requirements
Date: Thu, 19 Dec 2024 10:56:40 +0000
Message-ID: <20241219105640.3294591-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|BY5PR12MB4276:EE_
X-MS-Office365-Filtering-Correlation-Id: 7721285f-fbee-4560-3393-08dd201bd5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RfzB07/iBCULhiqzhghkJIohKTZyGU/Nbxu7qXOnpYFFGkKARCSzjKNbuUua?=
 =?us-ascii?Q?KR+KiTYzWzU/qrKAAGyW/PN/3s//+wiVINpDBKUI7EgNom+EpAt3D+kPhvBe?=
 =?us-ascii?Q?m+yMA8E+BFkmpmoiJsKoKZrdoZM1pR3cD8dH5jpswyLGVQxjI6a0+boLO/y+?=
 =?us-ascii?Q?5osT2mB6WhJhog/S7MJaIa0clO6Csq5Fw7fdP27vvrZey+bIPrQzVuN5rg8I?=
 =?us-ascii?Q?agUlwL1bq6XZ1LdaDnqtei/zOd7dz+W262zz2R3H6vPq5aRKR9Vymg16Flqp?=
 =?us-ascii?Q?TBBClyic5GRRnmfqy4PeI7LrEVWvCz0LUdLrpH1IYRACKZr7YHmtj8qTXDQ+?=
 =?us-ascii?Q?gw3SKkmZevX49yPk0IJyQfvErmhDMuSmj+I0MTOYw72OjI7qmt2WdobEAU4q?=
 =?us-ascii?Q?DvGrbiiB1zo3pWRbJcBJngER4UgI0FOqZHL5Xoh2LHB6JSFC+LlvELeerp7W?=
 =?us-ascii?Q?MmObhDcfZ9I26spbdBvPtJ5Omx/owM/ALSXR9Kt4M25NVp4kc+1Jv+hlC6cc?=
 =?us-ascii?Q?iZNSE+i/Hout1BclIiDx3MsJjXYbrf93ytVJv4HT2hWYHm264FCRRDr7WGL+?=
 =?us-ascii?Q?VnXJjCKiebvZtfbg9N36TRUWErp5OU1vwkqYXS3NDSXvtaW+TSSdDhHddgT3?=
 =?us-ascii?Q?wYV1R1NPyc4akwB2/1aKNK7O5xDnCAAEdQxfvK0Ay7klrFLujJoD/OPDkvhF?=
 =?us-ascii?Q?fAGWiD6lWw0d3yIzFJeNHgg+txIamIRN2gOa9C+YkJO6ML/OTeQ1jCARRJeS?=
 =?us-ascii?Q?vtF4GNjVCclj3xeqyR1FbJzmajXsFeOlEVHJomfPj+JGJwTAJzYe6lmOYrT5?=
 =?us-ascii?Q?iFqwMhKsZq7rb5jax9IsBJNBISR1CbftK2f4rpFf8LpGdenh/Q40VXQ+As++?=
 =?us-ascii?Q?R4JYXyfaxTDm6nYaKsDkOmwjUpoFt80vG/x1GY/GU1qqSgAPrtHp54yU4Kdb?=
 =?us-ascii?Q?iugKrKVYMWE5VM3Atx32y3nCADjdC2FuiMjmW1sC6W/p8+or7/w4dTJCj0WP?=
 =?us-ascii?Q?5QtlLBS9xbwR2ahFE0URWVduIjAmiNGO4QzJ2VaBG2JKIqHdoF6zegA0BKkM?=
 =?us-ascii?Q?B+lBpUzj86NFBIbHU8Rr7TQoiGqxJzUM3KKs7OnNdMicsXUCMtCcaYd/TIDG?=
 =?us-ascii?Q?cM9Us28y7eY73JvxqWGs8Ft+IJc6DWZS6Y82D7ToM5K9mhqM2NblSCbhDzFQ?=
 =?us-ascii?Q?GddPUIKY8SmZfY/o8QdPWvs2Fs2DN/+ODPZL/zWlT97q6TfIIO9k/549YGqb?=
 =?us-ascii?Q?ctqNw4dilj4W8TS/nu6C01DteCsDFOROCEbrKD3c/5GuBdsiLI3ycIAN8Hm8?=
 =?us-ascii?Q?wBhN/6E8O5Ckct18Etm97niYVVKbe8XvyRbVLFGFbRNKeZtTU/6/7MKnvApx?=
 =?us-ascii?Q?y637j1ebgbI+BvKFYDpeHxEEw+HDucXwDwz09U75dICt9TeG4Jt4alBDBPcH?=
 =?us-ascii?Q?wiYL2hiDZeI/VFLOWLCTtnYAGq95mUu+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 10:56:47.8116
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7721285f-fbee-4560-3393-08dd201bd5cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4276

From: Michal Orzel <michal.orzel@amd.com>

Add requirements for dom0less domain creation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - 1. As the dom0less domain creation requirements specifies the dt properties
for creating domains, it has been moved to product requirements. Product
requirements define the interface Xen exposes to other domains.

2. For the requirements which introduces new terms (like grant table, etc), I
have provided the definition as part of the comments.

3. Introduced new market requirements to specify that Xen can assign iomem and
irqs to domains.

4. The design requirements will be added later.

v2 - 1. Rephrased the requirements as suggested.

2. Split the product requirements into arm64 specific and common.

3. The arm64 specific requirements have arm64_ prefixed to their tag names.

4. Grant table requirements have been dropped for now.

5. Added a market requirement to denote that Xen can support multiple schedulers.

6. Updated index.rst as we have a new file ie product-reqs/reqs.rst.

 docs/fusa/reqs/index.rst                   |   1 +
 docs/fusa/reqs/market-reqs/reqs.rst        |  31 ++++
 docs/fusa/reqs/product-reqs/arm64/reqs.rst | 128 +++++++++++++++-
 docs/fusa/reqs/product-reqs/reqs.rst       | 163 +++++++++++++++++++++
 4 files changed, 321 insertions(+), 2 deletions(-)
 create mode 100644 docs/fusa/reqs/product-reqs/reqs.rst

diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
index 8a4dae6fb2..1088a51d52 100644
--- a/docs/fusa/reqs/index.rst
+++ b/docs/fusa/reqs/index.rst
@@ -8,6 +8,7 @@ Requirements documentation
 
    intro
    market-reqs/reqs
+   product-reqs/reqs
    product-reqs/arm64/reqs
    design-reqs/arm64/generic-timer
    design-reqs/arm64/sbsa-uart
diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
index f456788d96..39b2714237 100644
--- a/docs/fusa/reqs/market-reqs/reqs.rst
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -47,3 +47,34 @@ Comments:
 
 Needs:
  - XenProd
+
+Static VM definition
+--------------------
+
+`XenMkt~static_vm_definition~1`
+
+Description:
+Xen shall support assigning peripherals to various domains.
+
+Rationale:
+
+Comments:
+Peripheral implies an iomem (input output memory) and/or interrupts.
+
+Needs:
+ - XenProd
+
+Multiple schedulers
+-------------------
+
+`XenMkt~multiple_schedulers~1`
+
+Description:
+Xen shall provide different ways of scheduling virtual cpus onto physical cpus.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
index db91c47a02..c8fee0e49f 100644
--- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
+++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
@@ -6,7 +6,7 @@ Domain Creation And Runtime
 Emulated Timer
 --------------
 
-`XenProd~emulated_timer~1`
+`XenProd~arm64_emulated_timer~1`
 
 Description:
 Xen shall grant access to "Arm Generic Timer" for the domains.
@@ -25,7 +25,7 @@ Needs:
 Emulated UART
 -------------
 
-`XenProd~emulated_uart~1`
+`XenProd~arm64_emulated_uart~1`
 
 Description:
 Xen shall provide an "Arm SBSA UART" compliant device to the domains.
@@ -40,3 +40,127 @@ Covers:
 
 Needs:
  - XenSwdgn
+
+Linux kernel image
+------------------
+
+`XenProd~arm64_linux_kernel_image~1`
+
+Description:
+Xen shall create a domain with a binary containing header compliant with Arm64
+Linux kernel image [1].
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Gzip Linux kernel image
+-----------------------
+
+`XenProd~arm64_linux_kernel_gzip_image~1`
+
+Description:
+Xen shall create a domain with a Gzip compressed binary containing header
+compliant with Arm64 Linux kernel image [1].
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Kernel with uImage header
+-------------------------
+
+`XenProd~arm64_kernel_uimage~1`
+
+Description:
+Xen shall create a domain with a binary containing uImage header [2].
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Gzip kernel with uImage header
+------------------------------
+
+`XenProd~arm64_gzip_kernel_uimage~1`
+
+Description:
+Xen shall create a domain with a Gzip compressed binary containing uImage
+header [2].
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+SPIs
+----
+
+`XenProd~arm64_spis~1`
+
+Description:
+Xen shall create a domain with a number of shared peripheral interrupts as
+specified in the device tree.
+
+Rationale:
+
+Comments:
+Device tree is a data structure and language for describing hardware which is
+readable by an operating system [3].
+A shared peripheral interrupt is a peripheral interrupt that the Arm Generic
+Interrupt Controller's Distributor interface can route to any combination of
+processors [4].
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+ - `XenMkt~static_vm_definition~1`
+
+Needs:
+ - XenSwdgn
+
+Virtual PL011
+-------------
+
+`XenProd~arm64_virtual_pl011~1`
+
+Description:
+Xen shall provide an "Arm PL011 UART" compliant device to the domains.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+ - `XenMkt~provide_console_domains~1`
+
+Needs:
+ - XenSwdgn
+
+| [1] https://github.com/torvalds/linux/blob/master/Documentation/arch/arm64/booting.rst
+| [2] https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
+| [3] https://docs.kernel.org/devicetree/usage-model.html
+| [4] https://developer.arm.com/documentation/ihi0048/a/Introduction/Terminology/Interrupt-types?lang=en
diff --git a/docs/fusa/reqs/product-reqs/reqs.rst b/docs/fusa/reqs/product-reqs/reqs.rst
new file mode 100644
index 0000000000..9257fec713
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/reqs.rst
@@ -0,0 +1,163 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Domain Creation And Runtime
+===========================
+
+Kernel command line arguments
+-----------------------------
+
+`XenProd~kernel_cmd_line_args~1`
+
+Description:
+Xen shall pass kernel command line arguments to a domain via a device tree.
+
+Rationale:
+
+Comments:
+Device tree is a data structure and language for describing hardware which is
+readable by an operating system [1].
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Ramdisk
+-------
+
+`XenProd~ramdisk~1`
+
+Description:
+Xen shall provide the address of an initial ramdisk to a domain via a device
+tree.
+
+Rationale:
+
+Comments:
+The initial ramdisk is contained in memory.
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Memory
+------
+
+`XenProd~memory~1`
+
+Description:
+Xen shall create a domain with an amount of memory specified in a device tree.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+vCPUs
+-----
+
+`XenProd~vcpus~1`
+
+Description:
+A domain shall have a configurable number of virtual CPUs (1 to XX).
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Credit2 CPU pool scheduler
+--------------------------
+
+`XenProd~credit2_cpu_pool_scheduler~1`
+
+Description:
+Xen shall have a scheduler where a physical cpu can be shared between more than
+one virtual cpu.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+ - `XenMkt~multiple_schedulers~1`
+
+Needs:
+ - XenSwdgn
+
+NUL CPU pool scheduler
+----------------------
+
+`XenProd~nul_cpu_pool_scheduler~1`
+
+Description:
+Xen shall have a scheduler where the virtual cpu will be always running on its
+dedicated physical cpu.
+
+Rationale:
+
+Comments:
+A NUL CPU pool scheduler maps a virtual cpu to a unique physical cpu.
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+ - `XenMkt~multiple_schedulers~1`
+
+Needs:
+ - XenSwdgn
+
+Assign iomem
+------------
+
+`XenProd~assign_iomem~1`
+
+Description:
+Xen shall support assigning iomem to a domain.
+
+Rationale:
+
+Comments:
+
+Rationale:
+
+Covers:
+ - `XenMkt~static_vm_definition~1`
+
+Needs:
+ - XenSwdgn
+
+Forward interrupts
+------------------
+
+`XenProd~forward_irqs~1`
+
+Description:
+Xen shall support forwarding interrupts to a domain.
+
+Rationale:
+
+Comments:
+
+Rationale:
+
+Covers:
+ - `XenMkt~static_vm_definition~1`
+
+Needs:
+ - XenSwdgn
+
+| [1] https://docs.kernel.org/devicetree/usage-model.html
-- 
2.25.1


