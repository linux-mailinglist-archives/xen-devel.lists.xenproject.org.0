Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2952497BFE1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 19:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800378.1210301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqyqH-0008Ib-Sj; Wed, 18 Sep 2024 17:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800378.1210301; Wed, 18 Sep 2024 17:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqyqH-0008H1-Oh; Wed, 18 Sep 2024 17:51:53 +0000
Received: by outflank-mailman (input) for mailman id 800378;
 Wed, 18 Sep 2024 17:51:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3Wy=QQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sqyqF-0008Go-NJ
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 17:51:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2416::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad5297bf-75e6-11ef-99a2-01e77a169b0f;
 Wed, 18 Sep 2024 19:51:49 +0200 (CEST)
Received: from BYAPR08CA0028.namprd08.prod.outlook.com (2603:10b6:a03:100::41)
 by LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 17:51:44 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::e6) by BYAPR08CA0028.outlook.office365.com
 (2603:10b6:a03:100::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.27 via Frontend
 Transport; Wed, 18 Sep 2024 17:51:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 17:51:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 12:51:42 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 18 Sep 2024 12:51:41 -0500
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
X-Inumbo-ID: ad5297bf-75e6-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZEruCjEAvdZyssQ89l7YjfSTx6h7W1JXFIwWXMIZfF/d8/DIvMFJsLresaiekN2rmD/PJXlfQV0sdLS/NXHTxI+1HTVDy+ny4Ls8NqIe4Y1MLkhA8hDdL/4To5Ts7eCwLo/LUZuDX2HbCef5OAVd5IlzGswz0YRaUDWI9Gg1kUueO+WjB4dsSI4OexRqqVy6/muUfWhGvHHmz+75oQgI5MBl4wNvlas5nd0mV4rnntyjia1SQ64h/HbtDT8OogMswZTf7HRtYPtmcCuBndZgRJjRlFvHmEGUYPNPHr/Oy/oNv3MCeQr+6dC5LU8buoim7TW3ZcbhWHs2OvB5dUV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKC3XsyeACsYL3+HDNJWJBNlZL6CNaqXlu/q8ubsmFo=;
 b=zLxKl5oF9ovCFFiB1h+aaUbfhBi3aYn0/CTbfYtIarvIty4zn9JRs4SBq3oliUOQ+6iv/dVWR1R+I0S0R6D7j1tn0jp4WVqxqi5pX4PmkCti7qM/yqEThyQMmbSUKksgt8tALEyJqMXG98D5NeKRuuzJFdtnR4fIF0uk3LfbbKjcMD0s5RuBEJP1U6oiXEpM2gtmkUN8z+ck5QjlEfmCsyKdtCr+gSO9Hq+WtK6XXE3B/V+Ifnl9OVZWVtC1GijVQiV4qfwm0y+i2x2CbXBUkhpUCMqx8Ct0Nbvw6Ey1rigVA9V9OlGQ56uingdJ0G1Zw7OKazjjtI8Y97A76wEY0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKC3XsyeACsYL3+HDNJWJBNlZL6CNaqXlu/q8ubsmFo=;
 b=wMpyKmap8iVQnAlhp4NyaWZJBKWDNOHXKaD2bER9d+WSHPx1qQjrVIkkXyQ9i7k4pxXq+hqanandpYPx2mFaTNMHhkBtFqAtASB4KOP8DMJ10+I2ZNB/d58OyDBXGj2z8ZtVmbprkzYhhEYYz6hfXPgqAbkT8K9ZJjU3gBoVtHI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/4] xen/arm: mpu: Introduce choice between MMU and MPU
Date: Wed, 18 Sep 2024 18:50:59 +0100
Message-ID: <20240918175102.223076-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|LV2PR12MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d39b26-64a7-41e1-6ef7-08dcd80a8eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eOKLW/V/17YJC7jFVYRe2/2w1nLShFiWNu5z1QVYY9SFpQGmiXL7eg50/+Cz?=
 =?us-ascii?Q?VH5acQCvfWPEZ5ORVm4i0csKRtUoRh6z3AfnZS4tuvgD6Dsc/kZBbARnM1rt?=
 =?us-ascii?Q?wVP9M1OrZlHMItaP6YopQi4f0STn1rE3DmdzJ9gEpnkO17NXrNZaF+BeIXR8?=
 =?us-ascii?Q?1gLpR/cc13GYHRCSV76gsBn8BXdzyMC2ZjyyiCf65BCbBf8SVRMVKLQT4QFg?=
 =?us-ascii?Q?xeJf3b8p5lSVkmm9qvl2XFJmKTyFzNR+vohzGDOHLEf1BqA9Swz/ph+IwrGU?=
 =?us-ascii?Q?vhy1LFN1TjJS9OR6fjE8RVs2ouOnm62dvJ/xn3V/jqnGfk/FJViKNpxLtIfq?=
 =?us-ascii?Q?ss3pdboGg3sxT8UjS78l+tX4hlDtJ9KfxzmQdlqYFKXkQNskLp7VFv4tp/2n?=
 =?us-ascii?Q?ieOaJgnJtUDfo3L5gPQSRYZ+0v9kmPnqgQQAvgISPaRl1kQHZ8Q0mpSGMF2j?=
 =?us-ascii?Q?+SRWrPdkmyRP/FI6Mbwb9HIMq/ZD0F08R7lXauE7adh6VsiO40rxqJOvR0xw?=
 =?us-ascii?Q?A53bb5joto5KTfLIXP4JWjT0lz4K17AfxLc5cOJYwtnCZ8rgWpJLW4g3tS5P?=
 =?us-ascii?Q?mS/eEXaMY/9bAeraNZfzY5+IEgdSh8J5qGesPoejrDr/8BQwe67AjwDM+zQX?=
 =?us-ascii?Q?gKlZ9z6yCF5/sx0Qst64/br73dg0D2Mr30qSqqwsyogxjl1+yrfXYy4m+irQ?=
 =?us-ascii?Q?A7cdQ/diDOKRYHesPbZCawqy6i4mfxD50aptwYfmMUCJOA2J3dQkKoQB7hXG?=
 =?us-ascii?Q?aGKCRo3DFGIaT6ESdBfZu71UlOc9B91scF9Elrqg/Y/1624ozcDjGqR4WTxa?=
 =?us-ascii?Q?OEU+LjR3V2mpBLvji7/zNBd861zDyUrWvLzPgZmwPlbc0MtVecNHkAQwC24x?=
 =?us-ascii?Q?PilNgEU5P9GE8Inz7EbW07TLwmbY2HP+lwaA1fgxW0XcI/pZJlqMx2aEUkSq?=
 =?us-ascii?Q?dh2tO1XCxGIRkhD6hTOJo/CEK1YmFEpX3kP/9OcBEaMbSIIfRbY0GKALD649?=
 =?us-ascii?Q?UZ0gA231+luEgxeIeSDrlvyu+mwA+MhRu25FykI+P234o5vv2NS8JnW8LMyr?=
 =?us-ascii?Q?0yPBSUnc/o4I3AXsAgDdYQqqgnkU8q250KQQJ6wQpWt5vHgwelgngXrWGFYv?=
 =?us-ascii?Q?dGdiYpHKvK+YlOb+ax1SgbmVo4V/xQArkbWg+2UnBpcaAak1IpJSfge7UHO/?=
 =?us-ascii?Q?qUpZU2Wm43t9y0e5bqZtSO/pf/lQy22/DniAXr7x0ozCOqT49L/Iw5ucJ3Zc?=
 =?us-ascii?Q?/fUMeZCZkFkBIr9m09SlTUZmAf331WU0VaNWinOc8DzrDm6cBHBSZ7JAA82I?=
 =?us-ascii?Q?eoI8w4sEi79izyKxBCmGF2opfhXhzKbzt8oJSJ/gfcxtKwMTe3bRCMhTRyu4?=
 =?us-ascii?Q?SLnC+r6B+HnYEFajWPbK2KYydhyq0woonjJZBCEBJ8I/c0g4NzTaBhBSogJP?=
 =?us-ascii?Q?BRQkqRsiaepKJNJo2zeELIh5J98VToH+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 17:51:43.3823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d39b26-64a7-41e1-6ef7-08dcd80a8eb4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944

There are features in the forthcoming patches which are dependent on
MPU. For eg fixed start address.
Also, some of the Xen features (eg STATIC_MEMORY) will be selected
by the MPU configuration.

Thus, this patch introduces a choice between MMU and MPU for the type
of memory management system. By default, MMU is selected.
MPU is now gated by UNSUPPORTED.

Updated SUPPORT.md to state that the support for MPU is experimental.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Reworded the help messages.
2. Updated Support.md.

 SUPPORT.md                     |  1 +
 xen/arch/arm/Kconfig           | 16 +++++++++++++++-
 xen/arch/arm/platforms/Kconfig |  2 +-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 23dd7e6424..3f6d788a43 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -40,6 +40,7 @@ supported in this document.
 
     Status, Xen in AArch64 mode: Supported
     Status, Xen in AArch32 mode: Tech Preview
+    Status, Xen with MPU: Experimental
     Status, Cortex A57 r0p0-r1p1: Supported, not security supported
     Status, Cortex A77 r0p0-r1p0: Supported, not security supported
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 323c967361..e881f5ba57 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -58,10 +58,24 @@ config PADDR_BITS
 	default 40 if ARM_PA_BITS_40
 	default 48 if ARM_64
 
+choice
+	prompt "Memory management system"
+	default MMU if ARM
+	help
+	  User can choose between the different forms of memory management system.
+
 config MMU
-	def_bool y
+	bool "MMU"
 	select HAS_PMAP
 	select HAS_VMAP
+	help
+	  Select it if you plan to run Xen on A-profile Armv7+
+
+config MPU
+	bool "MPU" if UNSUPPORTED
+	help
+	  Memory protection unit is supported on some Armv8-R systems (UNSUPPORTED).
+endchoice
 
 source "arch/Kconfig"
 
diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index 76f7e76b1b..02322c259c 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -1,5 +1,5 @@
 choice
-	prompt "Platform Support"
+	prompt "Platform Support" if MMU
 	default ALL_PLAT
 	help
 	Choose which hardware platform to enable in Xen.
-- 
2.25.1


