Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C50A062ED
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 18:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867701.1279272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVZSj-0002nw-5h; Wed, 08 Jan 2025 17:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867701.1279272; Wed, 08 Jan 2025 17:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVZSj-0002lQ-20; Wed, 08 Jan 2025 17:03:21 +0000
Received: by outflank-mailman (input) for mailman id 867701;
 Wed, 08 Jan 2025 17:03:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1vVY=UA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tVZSh-0002lK-96
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 17:03:19 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f403:200a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7313a695-cde2-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 18:03:16 +0100 (CET)
Received: from BY1P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::17)
 by SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.19; Wed, 8 Jan
 2025 17:03:10 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::90) by BY1P220CA0013.outlook.office365.com
 (2603:10b6:a03:59d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Wed,
 8 Jan 2025 17:03:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 17:03:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 11:03:07 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 11:03:07 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 8 Jan 2025 11:03:06 -0600
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
X-Inumbo-ID: 7313a695-cde2-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUk0brJ/8o1eLMYJGCIumrg4YX1CbAvquaFDTne0ge6ihQsROT9NmPPmFAgmgT4iR+o/YQaypO3/mHOy6DXAo5TfvcaOt2bfHI2RYgmeKH/O+f5nWX1b1Y2+mItnF4ipUZEIbnp2D5/LOVGvAuuaNTOFWaCXN6ECQZK/rYfOVsAOvn3G65jhC+Lj97+opqT4Rq8xTx7EQbh0vTjL7cFtlVz0qig698TFteEzZwcrLQUl1PbeHLAvocqUmw+thR4um6jf7ug6alXa9O2ZIBLtSOrRkJrAuraVlu+SZ34h5aEfgwXyV7XvLlc4RGoqESVK30VYx9qkFMV8arZ84MbIVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7rqeH4KF0j/7m/EK5/QZVF8WBFKKh0OezQfB70YS48=;
 b=OBVd4o4W/YPpdVrhz95KkA34yoXdW3I3/PTH8A5A5EmNsJ9966jqFO+GNH529HXp3poITC+GLG2xJ1ANlE4IrU5u0Yo2PuGDj9SM3+V3/EPGwZcxOGd+nPuG1PPowmc2nqoz4ULEAVIjCGoSIo4fBUoTBfiPy5z0v5NKcDvq8WVW9b41ALrGJWlx56syP7slZ2lS+J3G7DqrglZrnQKmA/XCRRS6HCySVu4LQJTVHi+WBthWPKS64t+FcDZO3Gqubd2IDbJ/P4poU5fTWY8Y85PzWVX3NRkfV7QnUapi+45XH9O5GgjKPjirrfAM0gJ3iHYthGp/knQli/BG5b1LoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7rqeH4KF0j/7m/EK5/QZVF8WBFKKh0OezQfB70YS48=;
 b=i7JKAdcWjHe/etwNmSPgnzMDSesvS3KWOfAzgDlhUcR0y+wiGRXD3pTwfvr4SFAM9o8PzTUeEIKTNW0kO0waswu67oEKY277mOrfrY2d3E4qJg9I4vReodDL60FD27A0fnzfIOIDH9uUuSz1Jbm6B5DJJTc2bpi2xnNzufikqq0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>
Subject: [PATCH v4] docs: fusa: Add dom0less domain configuration requirements
Date: Wed, 8 Jan 2025 17:03:04 +0000
Message-ID: <20250108170304.2250917-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|SJ2PR12MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a770a88-9b55-4d1d-6bc9-08dd300653de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LiaWK+q2g6MsxpGQUGyAwmqwlmbmokWhtjJJmeseFpgsvbaaP2aKyBExDohv?=
 =?us-ascii?Q?E8y1HPjAx6Fso0w6MmwsvejmDf6/E8Oum3fN90Cfx02E7P0NKRH7IshaEM+W?=
 =?us-ascii?Q?jiQ2UaxQi0k6GtKhXy/12d/6p9FeeWr0KyhS72FiYwhX2bs9yKZ5c5opiXoq?=
 =?us-ascii?Q?QvTatzEYS2NPH5nptk4VsUP6zn8UVtE6eJYU4hDoWP0mmQH/dd346sk6iZoN?=
 =?us-ascii?Q?PfY/6Hb0T0bcgvhRTnFPD8BYihyZEEG7EFSj3CAJ1ab1GR/EBmx8Y2UPDMFh?=
 =?us-ascii?Q?9p86jPweAJLmdzLBU8kVf98BkgHH7/JyReWJMWWa9+BKNofWkxBBGdvt8pI3?=
 =?us-ascii?Q?5ScXyPGl6jKPgTnPBCUW+RF6OXOm/GXk7u0yfrjj4u+0a7vJN6cn3M+UxBcw?=
 =?us-ascii?Q?oWAq6gp7iGZDW7LqbFhwrbqDYEHGgRNJYCz+LnD2n5xFYoP9eDr1cPvXCaZP?=
 =?us-ascii?Q?4THGKwlT4rgBvj5JB6d+l9S3o/i+dsqiuCoCNxyNOf1ItmeBr9l8/HHuQRjj?=
 =?us-ascii?Q?u8D6WAYMrT2XMh2Xn9yuBY/WVY2yTo91Gdvf0/yEtscQJvO2PggIoEwux6vx?=
 =?us-ascii?Q?6vZxXP+lIi39iLxm2FfDkDDChcqF7DhLEZL0ep7h6/e6fkvAeMSfTSFvkCrJ?=
 =?us-ascii?Q?0GPn2Z62oyngVTN3taAeK29w3JvQY4xVs3t2pSIOAR6awuPhRyJw6gMVpKyL?=
 =?us-ascii?Q?y5CPMpA/ciAch0AfWI/vSPr6NhPD6XwUTTDn826Vn4fbzccSYyokZHZQjtmt?=
 =?us-ascii?Q?NBqTLf0on67+ZbVle/sg2Uku4tDXyT/dMuUMHV+6KF0luvW7RwnymBt58gYe?=
 =?us-ascii?Q?bcN9zpK+l+HreJ+GlrUTF38FNlwAnMIB+hp+UVRKNhoq+Aa05nu80fhRJkIE?=
 =?us-ascii?Q?yGwJDiY95edItvBzg/pWxwKCrkfI0eyzqDQfxQCK6p8hXxxKRg0gB66vYRLO?=
 =?us-ascii?Q?Oj1eJuiDzyAtSVbRR23y1NmIc8+YUaCEoXpmgP/m9UvbZ4RgQDGX38gXMmgB?=
 =?us-ascii?Q?wGd4pVA0sNefOO1NUtZZkZo4HYe+4bMA076AB4ML/Nx5OoPaaq1VjWoGneCY?=
 =?us-ascii?Q?QXGqLOYr6Nl/p9j6hYK06XAnN3782ZjU09zAOe3u6PKxSqSe8lEAHr3RRA2f?=
 =?us-ascii?Q?CE5CwsG0uf33GMzgzdFR4Av8oWFKrv1fxsBls+7NdIAYCvNsIt8wG0k8Q/GD?=
 =?us-ascii?Q?DwSkrP2d2uHdcqITkHGA+fFw/7e2ngmK7UDa27NKPZbYt2sxPOwq0Ivi6wV5?=
 =?us-ascii?Q?D83S0p10Yk2ArezV8j+z5fdzf6zwrQiQ5BlJmKIMJRYxaR/m39SRi3rWvwUi?=
 =?us-ascii?Q?KtaH/S4MbkfwYWRdFZ0nUgdXw5dawZ2HFVeLxAVbyuUtk9Up630ADnf/zq34?=
 =?us-ascii?Q?ClDInWFGMnWkfKLakuS+Q4XchTDLfZ32dTx4xZh0nGNfLL1WToqOUiyi9SEJ?=
 =?us-ascii?Q?nZViPJ1/HfJY2nhbPXCDqP92MoBiFXfg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 17:03:08.9782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a770a88-9b55-4d1d-6bc9-08dd300653de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8739

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

V3 - 1. Removed duplicate mention for 'Rationale'.

2. Fixed some of the descriptions as per the review comments.

 docs/fusa/reqs/index.rst                   |   1 +
 docs/fusa/reqs/market-reqs/reqs.rst        |  31 ++++
 docs/fusa/reqs/product-reqs/arm64/reqs.rst | 128 ++++++++++++++++-
 docs/fusa/reqs/product-reqs/reqs.rst       | 160 +++++++++++++++++++++
 4 files changed, 318 insertions(+), 2 deletions(-)
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
index db91c47a02..ad5c1fdef7 100644
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
+Xen shall assign hardware shared peripheral interrupts specified in the device
+tree to a domain.
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
index 0000000000..88d8de7811
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/reqs.rst
@@ -0,0 +1,160 @@
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
+Xen shall create a domain with the amount of memory specified in a device tree.
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
+A domain shall have a configurable number of virtual CPUs (1 to 128).
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
+Xen shall have a credit2 scheduler where a physical cpu can be shared between
+more than one virtual cpu.
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
+Xen shall have a nul scheduler where the domain virtual cpu is always running on
+its dedicated physical cpu.
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
+Xen shall support assigning pages of iomem (address and size aligned to a page)
+to a domain.
+
+Rationale:
+
+Comments:
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
+Xen shall support forwarding hardware interrupts to a domain.
+
+Rationale:
+
+Comments:
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


