Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A80EAD590A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 16:40:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011846.1390379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMd4-0002eI-Lh; Wed, 11 Jun 2025 14:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011846.1390379; Wed, 11 Jun 2025 14:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMd4-0002c6-IK; Wed, 11 Jun 2025 14:40:38 +0000
Received: by outflank-mailman (input) for mailman id 1011846;
 Wed, 11 Jun 2025 14:40:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBzX=Y2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uPMa0-0007IS-MY
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 14:37:28 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2413::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 990cc80c-46d1-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 16:37:28 +0200 (CEST)
Received: from LV3P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::30)
 by SJ2PR12MB8925.namprd12.prod.outlook.com (2603:10b6:a03:542::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 14:37:23 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:408:234:cafe::b) by LV3P220CA0010.outlook.office365.com
 (2603:10b6:408:234::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 11 Jun 2025 14:37:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 14:37:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 09:37:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 09:37:21 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 11 Jun 2025 09:37:20 -0500
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
X-Inumbo-ID: 990cc80c-46d1-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0pIyIegpyqGlzHw/o/CJ49c96BORyP3jOPtrNaHUZlwlYlhc6UWBrCX5g1IrnDpTWHoukmNMnPFGk+8gU7JmxjYvtJRcIZ/NWPLCziJ3jwnvbrR1qFvVB2zJIixsnYrLXu84YQJZ2z+JjvtgPfx3U66ZrSZ4d9/uORMFDBftKf7rca43tbhHA/p0HUqjPPL6o5eWgD7ZMe1llwWD113e23L8qnnNVIEr7w7tK3yxSmhDECI8cMrnGNAgQBxzcIeiGjlgi4V6S9mVH2hNgO8m/UKblCslhCdRTxY7IfvjelUS7J115i/TdByv6q9I5ov5dY5V+wAF3zIi8lP7rbSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUpmQLoTFyCDjuUjHFpcV7C6yipFkzFMP1YDXzutgCE=;
 b=ImWP7FqJJ0bv48OtdOG8juP38OwYwOIbSZu1tyd1k3n0mKg84YKHGiyb7FLF1v35i36NBvRQOdrV42DtChUN48e74QyjVOd0agnpc4LlvmL3XM5eYyfwj6FsV2MP0TBVBQSgTZMnLMxse6hD7KyQcXBRIjMGvjD4vRUO0POFV8pFc2JndF2eR41wU2FVH/1CCJf9PjqIqOYbu+EFMQ+KCYJsAQwM05Qv2m85KRaPPtQtw2h2ZQhHyslJfUhdUklw1NpWurns1JeeLytz/Uw5HNJCYzYm+uf5HjT75YQMyYiNbSYQB6Ss9qAJdHQst/gY6AQ3tid91Kd00Mxuk5+D9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUpmQLoTFyCDjuUjHFpcV7C6yipFkzFMP1YDXzutgCE=;
 b=soAWdLVm3NjwASssPLI5ErOBNUkFVuha9kd167M1f7JOldcJq8TiZuTAVACRFkgZTFeJFnxVKh1EQLrh9AM+KtVQ7LfKpcSaCyf6yAEoBo6btNPYzrA7zvjul9/f04hOhnZOi/vsquG3Y/OCGz7ZybNEPxj5OK31z1/a6vuImpA=
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
Subject: [PATCH v3 5/6] arm/mpu: Define arm32 system registers
Date: Wed, 11 Jun 2025 15:35:43 +0100
Message-ID: <20250611143544.3453532-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|SJ2PR12MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: b5cbc5cc-9f9a-4045-1d12-08dda8f57a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P0i73ViDKfL76kQVCIHHVfFM+sf4cxk9NH6dRmfv+xPKDbYNzHg+mox5h16O?=
 =?us-ascii?Q?N5KXC/Vfghsxrt9zviTutFZCOAEav6V8jylb7VW1QJ4PITG4l1rueR6Evvif?=
 =?us-ascii?Q?sKQjYBqUOHakmThpsJqahD1fP6gNC4/QRx0o5LKAu4tBkf1NEvnr49w86zkn?=
 =?us-ascii?Q?nGUdpCHi6mXEvCLGjyCKR+Ev6V60/FE7PHSbAh6WWtRBbtOd2wRQqS6Leb4d?=
 =?us-ascii?Q?YAeTMxnhMiBG/wvIMCgLAerAbdpCqABH5XjiCkbCzDDCLKyK/mfo8vhfa/pa?=
 =?us-ascii?Q?+RL1zmqQYi3md/ORoikweQe8P2zPFestqQvp8M1dhrqtz34SeolwMGyybr79?=
 =?us-ascii?Q?2ZuD6hXl3kgkX7qBEgfhhphCmzEPVWSadkznG71fZ1T9d8Sa657+jWkotwnS?=
 =?us-ascii?Q?y9G7sbb57VTpk0sI+3FExGecXg70ugt35JCz37SZdLVdKo5vsjs7E6LPoEVx?=
 =?us-ascii?Q?83jzu/cDSiJL6+8nu8qpX3hYzOa3O/5u8ik7xHREcY6tm42JBkOUzPQIPyUv?=
 =?us-ascii?Q?WAXaUhyGTXV0ozb70mP9Wp2SLkMI6CwCmyFMJN1XQfOR36ol2fT2Nu4W4aAC?=
 =?us-ascii?Q?dDNJha8CoYvnkb8RXf9gKmUbkUkOOaTq1AzScqlLjEscEE7DVIH/ChS3z4yF?=
 =?us-ascii?Q?E70Oazv8O3q5u2BtxEcfVlrLEoSVssZV29RQ9gnyQIvO2q7FVvEW16K3eq83?=
 =?us-ascii?Q?Ctg3BGCyYwc5yUrIwzOp4vV5rBn86LKe1rIgvv9mtrGqq8y4hzpQdWVO1BwI?=
 =?us-ascii?Q?pDAKNefOqEljlpPaPSaIJjBR1SnHQg3ewV2ZnU5yceXZ9QKbwVcrOx7iuhxj?=
 =?us-ascii?Q?yZZNaknf5pDydXZq733rTtnhRdRhXG4yGLMMhj8gBlA+YNDeRxWRkq+82gxR?=
 =?us-ascii?Q?6h67PWg6nhQTWZTEkt5GZoYtfa4WRhpMHyerHU+29htthmbyF4GO58ZrKc/x?=
 =?us-ascii?Q?PM2L36afI+bQZUC2Z8TthX6iP+IAKpDhG6SMlUp4ouvjn6/YbMuWA07d1QaV?=
 =?us-ascii?Q?GIRZemb0zZxwF4h4o6OY+9+DMYm6pt51UXAgckDavCSFiSZ9mjjsgXuGBx6x?=
 =?us-ascii?Q?uZvdvibGvVyQ9gBiZ01pQFjhvK7z1Hqoo/irsxXITk0GWUC7VoviDkCCBAoy?=
 =?us-ascii?Q?PC0B4QLbaZv1AzXPakRb/im7BnrEGiPS3doolCEL6hQ+fj6qajv8TFHMCpiS?=
 =?us-ascii?Q?9KxERnxD/ZmBbEZlzTihj1oHXyGtJ6FuyYCiIDzM4nsL5vJQgmcoNVq0HYH+?=
 =?us-ascii?Q?EauEjd+dHb7kql/dCUrFMI1bt4ro9te+qY6CtjD2m+rq3+GBqqdsm8W5umyw?=
 =?us-ascii?Q?moWZPMv4ITNY6xrHnVWanTwm7GUHe9R4NKzhEVADNyW3UqPj9pjklB6P6VNE?=
 =?us-ascii?Q?EcLVt/SYhpaDF6BlR02NnDnPKeWnpBJi9mC4fBQPVgOMoYvKTYlFae6aN+8p?=
 =?us-ascii?Q?B49DwfaXlmXbvHZ4S+tZuaA0KIBP+Y0NNeqi97693wcU6rxAb4fVNmDWA6G0?=
 =?us-ascii?Q?8fX5MQfjB7F6+vcwz5EFmqvPk3108xuPdigI?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:37:22.5031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5cbc5cc-9f9a-4045-1d12-08dda8f57a1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8925

Fix the definition for HPRLAR.
Define the base/limit address registers to access the first 32 protection
regions.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - v1 - New patch introduced in v3 (Extracted from 
"arm/mpu: Provide access to the MPU region from the C code").

 xen/arch/arm/include/asm/mpu/cpregs.h | 68 ++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
index d5cd0e04d5..bb15e02df6 100644
--- a/xen/arch/arm/include/asm/mpu/cpregs.h
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -9,7 +9,73 @@
 /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
 #define HPRSELR         p15,4,c6,c2,1
 #define HPRBAR          p15,4,c6,c3,0
-#define HPRLAR          p15,4,c6,c8,1
+#define HPRLAR          p15,4,c6,c3,1
+
+/* CP15 CR6: MPU Protection Region Base/Limit Address Register */
+#define HPRBAR0         p15,4,c6,c8,0
+#define HPRLAR0         p15,4,c6,c8,1
+#define HPRBAR1         p15,4,c6,c8,4
+#define HPRLAR1         p15,4,c6,c8,5
+#define HPRBAR2         p15,4,c6,c9,0
+#define HPRLAR2         p15,4,c6,c9,1
+#define HPRBAR3         p15,4,c6,c9,4
+#define HPRLAR3         p15,4,c6,c9,5
+#define HPRBAR4         p15,4,c6,c10,0
+#define HPRLAR4         p15,4,c6,c10,1
+#define HPRBAR5         p15,4,c6,c10,4
+#define HPRLAR5         p15,4,c6,c10,5
+#define HPRBAR6         p15,4,c6,c11,0
+#define HPRLAR6         p15,4,c6,c11,1
+#define HPRBAR7         p15,4,c6,c11,4
+#define HPRLAR7         p15,4,c6,c11,5
+#define HPRBAR8         p15,4,c6,c12,0
+#define HPRLAR8         p15,4,c6,c12,1
+#define HPRBAR9         p15,4,c6,c12,4
+#define HPRLAR9         p15,4,c6,c12,5
+#define HPRBAR10        p15,4,c6,c13,0
+#define HPRLAR10        p15,4,c6,c13,1
+#define HPRBAR11        p15,4,c6,c13,4
+#define HPRLAR11        p15,4,c6,c13,5
+#define HPRBAR12        p15,4,c6,c14,0
+#define HPRLAR12        p15,4,c6,c14,1
+#define HPRBAR13        p15,4,c6,c14,4
+#define HPRLAR13        p15,4,c6,c14,5
+#define HPRBAR14        p15,4,c6,c15,0
+#define HPRLAR14        p15,4,c6,c15,1
+#define HPRBAR15        p15,4,c6,c15,4
+#define HPRLAR15        p15,4,c6,c15,5
+#define HPRBAR16        p15,5,c6,c8,0
+#define HPRLAR16        p15,5,c6,c8,1
+#define HPRBAR17        p15,5,c6,c8,4
+#define HPRLAR17        p15,5,c6,c8,5
+#define HPRBAR18        p15,5,c6,c9,0
+#define HPRLAR18        p15,5,c6,c9,1
+#define HPRBAR19        p15,5,c6,c9,4
+#define HPRLAR19        p15,5,c6,c9,5
+#define HPRBAR20        p15,5,c6,c10,0
+#define HPRLAR20        p15,5,c6,c10,1
+#define HPRBAR21        p15,5,c6,c10,4
+#define HPRLAR21        p15,5,c6,c10,5
+#define HPRBAR22        p15,5,c6,c11,0
+#define HPRLAR22        p15,5,c6,c11,1
+#define HPRBAR23        p15,5,c6,c11,4
+#define HPRLAR23        p15,5,c6,c11,5
+#define HPRBAR24        p15,5,c6,c12,0
+#define HPRLAR24        p15,5,c6,c12,1
+#define HPRBAR25        p15,5,c6,c12,4
+#define HPRLAR25        p15,5,c6,c12,5
+#define HPRBAR26        p15,5,c6,c13,0
+#define HPRLAR26        p15,5,c6,c13,1
+#define HPRBAR27        p15,5,c6,c13,4
+#define HPRLAR27        p15,5,c6,c13,5
+#define HPRBAR28        p15,5,c6,c14,0
+#define HPRLAR28        p15,5,c6,c14,1
+#define HPRBAR29        p15,5,c6,c14,4
+#define HPRLAR29        p15,5,c6,c14,5
+#define HPRBAR30        p15,5,c6,c15,0
+#define HPRLAR30        p15,5,c6,c15,1
+#define HPRBAR31        p15,5,c6,c15,4
+#define HPRLAR31        p15,5,c6,c15,5
 
 /* Aliases of AArch64 names for use in common code */
 #ifdef CONFIG_ARM_32
-- 
2.25.1


