Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CC6AD58E3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 16:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011828.1390359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMZP-0000BX-Rf; Wed, 11 Jun 2025 14:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011828.1390359; Wed, 11 Jun 2025 14:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMZP-00008h-Lr; Wed, 11 Jun 2025 14:36:51 +0000
Received: by outflank-mailman (input) for mailman id 1011828;
 Wed, 11 Jun 2025 14:36:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBzX=Y2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uPMZO-0007IS-0I
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 14:36:50 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2414::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81554b26-46d1-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 16:36:49 +0200 (CEST)
Received: from MN2PR08CA0029.namprd08.prod.outlook.com (2603:10b6:208:239::34)
 by CH1PR12MB9624.namprd12.prod.outlook.com (2603:10b6:610:2b3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 14:36:43 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::65) by MN2PR08CA0029.outlook.office365.com
 (2603:10b6:208:239::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 14:36:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 14:36:42 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 09:36:42 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 11 Jun 2025 09:36:41 -0500
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
X-Inumbo-ID: 81554b26-46d1-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9vHTyGKFQ/ndJzA76oLJSGsAugqh0G20DptYAQwivCAM9NddeM2EzKZhQnLWLOVG5TpjE0SVzH/SFLvuhsmaC6u5Isg3Qd6IuzeRxFNOgvYcHUpLARBKHZuomD27lSMwzv7Dae53l83lo0Ta8ZyYuEjCmReH/VrWPoU6gOMNZrQuPCM7EABLXMgWJrfxtN8E7c8+ngb+N/4AVAHUZkvqigsT9bcWqaZpxe6c6z+VCW/X6IcNjcMqXkA056dap+Fkf21+/KY+D5Pk8/NAPbOPv54Rvx8gbpdKKR/bLKAF7v0lb1R5NG2T5Ns5pZaLxRwaxDARqfYn1JPM9OqoTJglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/H9MESwJREpyi29D9fh/4pN64Tv8g3m4E/vnLHEsHQ=;
 b=edegU2FoHfR5WYz0h2PQ79Qrg/I9QJw98peM3VKW4wvbOgqZYkHkvCR820kJUFTpRlo0AS2nZjV5bA9siaNb0IasxsfSUGCtLW7N4VV/CGMStczwSsYRLmO2ZWGes8O9TOrHDFU1qpciVWt1af3jpMojvF1CGlBH/zjxjggEWqlTJunniUjVAQjZHPNF/4sQBcT4SSBeCGD4WD92NkqLNzgQDAmXAEFoixd3eRIKWeMdtqWg0mAhJlwCK0UTf37/JN5QDqj40EQ2TwMqkTzP818NKcq6ngaZS7u6VHGwfGdnL4PBPKTR0ZJBGHwVTWHoJFcCfSwdhaRMvU6l03XcGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/H9MESwJREpyi29D9fh/4pN64Tv8g3m4E/vnLHEsHQ=;
 b=ua+o8EdEW2ci0w+w/UCBbOjMMPxAmBcCA8ILpihKWV2Qz4/uDzmR1WlPMBxDT2t7dIzHpMcOO1oe99WAX74nFFqFQJeJDcJEInHnXsdo0GGw7R8JmYkWGYINIJV3z1oB1wQzz7uq/IHu9R/bN77qU27ch+1Q02vugSi700vSTLA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 3/6] arm/mpu: Move domain-page.c to arm32 specific dir
Date: Wed, 11 Jun 2025 15:35:41 +0100
Message-ID: <20250611143544.3453532-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|CH1PR12MB9624:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e6445f3-62a3-4b00-6a8f-08dda8f5626a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9hZ1Vm6m/AI+AXfI9HjX/nVbY+BsbYySnB+5aVXjCoYh+nujJHOxJIdCF6p7?=
 =?us-ascii?Q?KH/2vMHZ6l5VmWgvmu4D+SEpB+eC0A5qVZ5PYxDHmVEGAzg2FJpHA18rrcbL?=
 =?us-ascii?Q?I1JJh/SwcMaZ7FARGIQq0v+c+0ETZk/xqL8jfdb461g9m2DbgljIEavwWupP?=
 =?us-ascii?Q?/w7q1hUL9vamrt1Y5DDVvUzxomuHMcOLXDfUB7mdR63YvJVQrONdkwjvz7A/?=
 =?us-ascii?Q?B6q1EdS9ql0KndpPRJ4ZqFbWrkdEknDql44bJ0eQtDpSksM1iu193K8KtWCE?=
 =?us-ascii?Q?Hkl1DCCd7XTCSJbMFWDptz2jVsY3ar+WYvWVGG/Z2Tm4bEm6tc5AcyPJWfxn?=
 =?us-ascii?Q?JUv2a3YcRW61Nqibn3aAmTmk4cddISM8/Lfb0wzD9RKtjyIh37L1k2k4mNBv?=
 =?us-ascii?Q?yXAXncAQm0RVxql3u3GHlAJzenW6dHCj0QA6Qh0alr+PSkqXBzcWY4FoVw8R?=
 =?us-ascii?Q?UhY+C5sLVF9QnVb43XRpwvmOUQtgUPiaRBou3z2YdnrvciFJgCR0UO8xofbs?=
 =?us-ascii?Q?ZT4ReBo7mBzvISAF0Vd+sq4oulc5ircRnqx6Asj0s5bNwkFig0kSmpqEecMy?=
 =?us-ascii?Q?ovy2ojoBo/sfJL/VhVux+9hpVPnwkAz7EUTe2ec9/Rj2qujKuWpM6B43nQCV?=
 =?us-ascii?Q?Kk590aBbHKMHntA8+uyL3JyIktqvVuMJ44bzBHq+G/z9uMr5nMh9xTPcavRr?=
 =?us-ascii?Q?eHsIHwZotwPJ026YbEiE68mH+cEL2icvtG9uSvesjAxLE/Jj+eQK4mbzBSw0?=
 =?us-ascii?Q?A2CkeUWVqehlJ0fo6gno9zVGFUmJNN5ZoDD/hwg0uHioSXjdau+zdzrgc8ai?=
 =?us-ascii?Q?yzL1XlTV16XWLyVtk9p1EwTwBBjh14YP48CC/RbqDbCHpw8hV1Pmfe0DSfsZ?=
 =?us-ascii?Q?H00TABXKi6GDyDXQWHfUl/VlhbxprWi/z9e6RsjpLC6ZtdgByioeOdeVzrWi?=
 =?us-ascii?Q?AH7U2t/XgJOswLMyrN/SAnLXpK762dnybPLRhcNWu6iexw2isuwNOb4ejSfS?=
 =?us-ascii?Q?nADV3pPCTb2mb/jZ37NEmH3BTeFow9hhEXD6TGjKKVUoXeNpMUJXnprL3j0x?=
 =?us-ascii?Q?MLpg/GHHYsf0EexENgFKMs8H2CubqMWD8s+pK/fZQIBY/i/6gpCqCFgSledy?=
 =?us-ascii?Q?tAuWXgxAFRHwJgtNgr+ZdPXUWGvVCbrMShQnl5XT2x/ezqtUSjYsyxYqFIC2?=
 =?us-ascii?Q?mBulHOzNM6OgT+Q0DNfWQ3SO+hdlz6S5zU/IsSWU2NVee8j+Nypi7RNFhq4X?=
 =?us-ascii?Q?1Ni5lQADavPwDhWWGorkmlbhlgFBi8xHGMQ+Bm55wpjo4gdo3aeTvb7c5tlS?=
 =?us-ascii?Q?jYVNivFQ6JucYBTOjkwOK0Q1p8rqMgzZtXHQSr7PLJV9eUROO1yruWnxnzKS?=
 =?us-ascii?Q?k7rGdUWnvVfXEF98FAxa7auyijsXFhszNYWjochdVJ+Kg6o9BjcgSiVrJsgJ?=
 =?us-ascii?Q?OoIvKjum+urkRiXdIg7SqHmEkK1YrWlEWGCQQgKvxemDnu6npL+Kx21AlHqN?=
 =?us-ascii?Q?mhYU7jim8tNbA85LKlA8O2iC4pEqiQjVvOlL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:36:42.7635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6445f3-62a3-4b00-6a8f-08dda8f5626a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9624

Create xen/arch/arm/mpu/arm32 to hold arm32 specific bits.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1..v2 - New patch in v3.

 xen/arch/arm/mpu/Makefile                  | 2 +-
 xen/arch/arm/mpu/arm32/Makefile            | 1 +
 xen/arch/arm/mpu/{ => arm32}/domain-page.c | 0
 3 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/mpu/arm32/Makefile
 rename xen/arch/arm/mpu/{ => arm32}/domain-page.c (100%)

diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index 808e3e2cb3..9359d79332 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1,4 +1,4 @@
-obj-$(CONFIG_ARM_32) += domain-page.o
+obj-$(CONFIG_ARM_32) += arm32/
 obj-y += mm.o
 obj-y += p2m.o
 obj-y += setup.init.o
diff --git a/xen/arch/arm/mpu/arm32/Makefile b/xen/arch/arm/mpu/arm32/Makefile
new file mode 100644
index 0000000000..e15ce2f7be
--- /dev/null
+++ b/xen/arch/arm/mpu/arm32/Makefile
@@ -0,0 +1 @@
+obj-y += domain-page.o
diff --git a/xen/arch/arm/mpu/domain-page.c b/xen/arch/arm/mpu/arm32/domain-page.c
similarity index 100%
rename from xen/arch/arm/mpu/domain-page.c
rename to xen/arch/arm/mpu/arm32/domain-page.c
-- 
2.25.1


