Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E556ACE3D8
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 19:43:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005792.1385183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMs9M-0006QO-5M; Wed, 04 Jun 2025 17:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005792.1385183; Wed, 04 Jun 2025 17:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMs9M-0006Oj-1d; Wed, 04 Jun 2025 17:43:40 +0000
Received: by outflank-mailman (input) for mailman id 1005792;
 Wed, 04 Jun 2025 17:43:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eifV=YT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uMs9K-0005sE-LF
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 17:43:38 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f403:2414::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71669a7a-416b-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 19:43:37 +0200 (CEST)
Received: from BLAPR05CA0010.namprd05.prod.outlook.com (2603:10b6:208:36e::19)
 by DM4PR12MB5964.namprd12.prod.outlook.com (2603:10b6:8:6b::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Wed, 4 Jun 2025 17:43:32 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::f8) by BLAPR05CA0010.outlook.office365.com
 (2603:10b6:208:36e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.22 via Frontend Transport; Wed,
 4 Jun 2025 17:43:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 17:43:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 12:43:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 12:43:30 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 4 Jun 2025 12:43:29 -0500
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
X-Inumbo-ID: 71669a7a-416b-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aR+nXiwif367zRAg0TWdwfLBmb+T+51XrgREj9L+rNpmwB6FOcvfLj9rEqp5Yn4/6UYkMjtoMgJsxujMHxQDRpFG1eBJu0JoJMegTUDvB9aCxfYKW5y43QbO1wZLmgY7Pph9O+FOg2sfUU9UWkQQyTmIfWuHEhUZSqt2XwvKKxtVvVtnBKCSmICIRnfBdgnLiUvo8yUgNIF2OTed3sQIad0B/TaVyotpcARZy10feHmYkXfzyPZm630FmZQr+F210oru5Xhba5N9lCcC4JtxRhcavZwAxmSoLopJg03JimFmSTFCGc0RFV7PkCJiiiZSWmu/xsQ/zJAVhRrE9V9Myg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KI8E/qyLOB0LA8peY0GYGndGcJOK3jDcX0S5pyP3xs=;
 b=LPgaS5yxTyjDPPIAs+x3u4z07BxcgR86LCKgZtMXyvDufyKFruLSsC3hUxRLR24XD9ph73Pub9FQ3llAodmayXevWvSZU7XrdR6quj4w3pDYOkehLiRkbo+xEOf/s3Y3TD5+B980y+zlPhrtfjhO1MUmOWNtPbaY1XzDuxep/E5GzLSF5z7Z5DpJyKrpF5/bRgkJ/Fe76AAFQwiNo6vqfDfLkGGrVm0SUMEmetaQMT45PKdTmG/u6L+tAAmenpBn8kxRSZZ9Rh3xWwu6L0DlL360k5Z3D+u+I/fejx3U/YbTRy4fhCzJWWw9m4kWZ94/Ilx1SWy5N/aOZYN9H04kUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KI8E/qyLOB0LA8peY0GYGndGcJOK3jDcX0S5pyP3xs=;
 b=5czGjaZGMquxt9rluCJrBcn7p7XNr8WghASnBjlGFrRrLN2caZv/WmvTClvcXNl+KrUPsB2RFwX+O5smeYXWqm7EHNIUn8T9IHTy3mjqw1rQBoEL/AQRPnP6hKOCF4DrrqYWJCZgdGLRQ1a0PHpM2IsoNtnJZwMCrQxNaBpT6iU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 3/3] arm/mpu: Provide access to the MPU region from the C code
Date: Wed, 4 Jun 2025 18:43:11 +0100
Message-ID: <20250604174311.754899-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|DM4PR12MB5964:EE_
X-MS-Office365-Filtering-Correlation-Id: b378e537-3325-477b-ee5e-08dda38f5250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HWZyI3vynkps4EEWpIagT4erp7YW9/BBaPbX8YTtYyq2DHG7T91ZR8tojCNZ?=
 =?us-ascii?Q?zAT03D0G4aoRtrlW+CYL3d9w4rgMYUc0ajPjRTTaI4Li799/1SzRiS6khVPg?=
 =?us-ascii?Q?tkGG6YtFq6jCKUHMmTohAdaNt1VUmvfUL1qeUeT7LEjQxaEpFziiiONUx/UY?=
 =?us-ascii?Q?oVXRISkW9u9m5V9IXUG6nquh5khXWjaWEFvFTWz2TAk4nC5QO2rS5B6NoIMF?=
 =?us-ascii?Q?zOd+r9HXPx4ey4NMt1iGlhEhNH/C6JwzqQ3Q4Dmaa/A6nTXM4or4Iaq3koDb?=
 =?us-ascii?Q?msVq8ueMy6li7eLbNyb/gIf06j0TsjKYQoL/Do7M9WQFMCPFkCJJw1TFG/fi?=
 =?us-ascii?Q?hb/iEEG5SjAwgQ0qdm2S+d33WFEp8dU5JaeOJOYDkMYQDIEUiivCk2iYfPz1?=
 =?us-ascii?Q?Mq+g9qYgr4OtlEbpxux6AmUjDMr7qTltrJ3biO9m2EHcnhgtJNmbuNy8rg5G?=
 =?us-ascii?Q?iozW/cHyqz6qIDqeF9fQUIdxMg6g06aCckmtgq1gAqXa+Ax4g5cqpua5jCxf?=
 =?us-ascii?Q?+gw9V6XnLbkE/SyxvzKF1SnhiOLFBjg7h4hrzY0q1ksZkOo+uHG2Gs78lHDK?=
 =?us-ascii?Q?qM+YHpnQt9dFy1ffKWCRAsw8VuKlzQdWl5oSObKfth8UZuuj8ikvB7hbW5HR?=
 =?us-ascii?Q?acnOVlt57oiAKWFzGc5wJ3sRpKt5aOrT9I083gwCKzOemm3U82nn1LtThH/7?=
 =?us-ascii?Q?/G4VBjOHcNWlo7HUn6nd56XkukY/FO5EG7yQ82fpCU4UsezgLXrK1yVzBQjF?=
 =?us-ascii?Q?ZwcM0zxlLfwfNhQM2BcR3CSf419Dtc8bBO+RVxmDz9LqpbHML/kefX0rzJHI?=
 =?us-ascii?Q?fEG5o6kkokzHBN1N1rNMgmdHA2mG6hgagvJgSALoVctV4/e6ZJBWgXPYF8QX?=
 =?us-ascii?Q?8qQgh2pmpawoETSXHQwevTcuVryaixhWT/96R49Op7zvw51/LOKVx8mYDP/e?=
 =?us-ascii?Q?xubsAsINBiNk+ilpaegItpb9jGhmeuQTu+QUa9K7nT/2bh2A7T8XgftF2fvT?=
 =?us-ascii?Q?BW374Ai0AQsLZMMj0S5FD2nj+8mRnH+/E5T59vDc/Mypui2kAbDdGmhF/aBL?=
 =?us-ascii?Q?ZQRy6N92hBzByRHpXc/pB71weDqocsJx8gnJPaEhESnO+CA7Cd3yhGzUjjgb?=
 =?us-ascii?Q?AmqolqK40gnX6LQENRD49LxEMwGG6vgRkC9ERfeAlhmARtXefLZrxLJp+/4X?=
 =?us-ascii?Q?B6NEs0u5VBniibmrAZNw4JAANIYFNVxnvn5hHPCOTmFFj3XfIInPTvZELkJL?=
 =?us-ascii?Q?sGEXcCsLfu3NcWLlVxk0ip26/s5fY2uCnkcgVop0UTfoGrWNEQDgxFB+B0gg?=
 =?us-ascii?Q?Iwgga+Q6W5aaIyepqlhQafJ8hRziOZEJ6NwIAUyDPfi9bq0uq1hfGhY8KM0x?=
 =?us-ascii?Q?0GxH8Zb+EPVMgpxOxaMPVFZ2eC1gr3dlU+xSVnDuPV3j3YF0ce2E/3xHtHJQ?=
 =?us-ascii?Q?KB1Fpm5NIrpi49DeRffQ8G++VWw7nO8Wi3OCvuLPz6onOHBzvvfDekXZhE6Y?=
 =?us-ascii?Q?OAmHfI44OP1CqDVW+NWA3aeZ4Ir0327vA7be?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 17:43:31.2734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b378e537-3325-477b-ee5e-08dda38f5250
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5964

Enable the helper functions defined in mpu/mm.c and asm/mpu.h for ARM32.
Define the register definitions for HPRBAR{0..31} and HPRLAR{0..31}.
One can directly access the first 32 MPU regions using the above registers
without the use of PRSELR.

Also fix the register definition for HPRLAR.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/include/asm/mpu.h        |  2 -
 xen/arch/arm/include/asm/mpu/cpregs.h | 72 ++++++++++++++++++++++++++-
 xen/arch/arm/mpu/mm.c                 | 31 ++++++++++--
 3 files changed, 98 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index c8573a5980..29f507ce3c 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -31,7 +31,6 @@ typedef struct {
     prlar_t prlar;
 } pr_t;
 
-#ifdef CONFIG_ARM_64
 /*
  * Set base address of MPU protection region.
  *
@@ -91,7 +90,6 @@ static inline bool region_is_valid(const pr_t *pr)
 {
     return pr->prlar.reg.en;
 }
-#endif /* CONFIG_ARM_64 */
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
index d5cd0e04d5..9f3b32acd7 100644
--- a/xen/arch/arm/include/asm/mpu/cpregs.h
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -6,16 +6,86 @@
 /* CP15 CR0: MPU Type Register */
 #define HMPUIR          p15,4,c0,c0,4
 
+/* CP15 CR6: Protection Region Enable Register */
+#define HPRENR          p15,4,c6,c1,1
+
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
 /* Alphabetically... */
 #define MPUIR_EL2       HMPUIR
 #define PRBAR_EL2       HPRBAR
+#define PRENR_EL2       HPRENR
 #define PRLAR_EL2       HPRLAR
 #define PRSELR_EL2      HPRSELR
 #endif /* CONFIG_ARM_32 */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 2fb6b822c6..9aea9fbacb 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -40,7 +40,10 @@ pr_t __cacheline_aligned __section(".data") xen_mpumap[MAX_MPU_REGION_NR];
 #define PRBAR_EL2_(n)   PRBAR##n##_EL2
 #define PRLAR_EL2_(n)   PRLAR##n##_EL2
 
-#endif /* CONFIG_ARM_64 */
+#else  /* CONFIG_ARM_64 */
+#define PRBAR_EL2_(n)   HPRBAR##n
+#define PRLAR_EL2_(n)   HPRLAR##n
+#endif /* !CONFIG_ARM_64 */
 
 #define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
     case num:                                                               \
@@ -68,7 +71,6 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
 }
 
-#ifdef CONFIG_ARM_64
 /*
  * Armv8-R supports direct access and indirect access to the MPU regions through
  * registers:
@@ -85,6 +87,7 @@ static void __init __maybe_unused build_assertions(void)
  */
 static void prepare_selector(uint8_t *sel)
 {
+#ifdef CONFIG_ARM_64
     uint8_t cur_sel = *sel;
 
     /*
@@ -98,7 +101,8 @@ static void prepare_selector(uint8_t *sel)
         WRITE_SYSREG(cur_sel, PRSELR_EL2);
         isb();
     }
-    *sel &= 0xFU;
+    *sel = *sel & 0xFU;
+#endif
 }
 
 void read_protection_region(pr_t *pr_read, uint8_t sel)
@@ -123,6 +127,24 @@ void read_protection_region(pr_t *pr_read, uint8_t sel)
         GENERATE_READ_PR_REG_CASE(13, pr_read);
         GENERATE_READ_PR_REG_CASE(14, pr_read);
         GENERATE_READ_PR_REG_CASE(15, pr_read);
+#ifdef CONFIG_ARM_32
+        GENERATE_READ_PR_REG_CASE(16, pr_read);
+        GENERATE_READ_PR_REG_CASE(17, pr_read);
+        GENERATE_READ_PR_REG_CASE(18, pr_read);
+        GENERATE_READ_PR_REG_CASE(19, pr_read);
+        GENERATE_READ_PR_REG_CASE(20, pr_read);
+        GENERATE_READ_PR_REG_CASE(21, pr_read);
+        GENERATE_READ_PR_REG_CASE(22, pr_read);
+        GENERATE_READ_PR_REG_CASE(23, pr_read);
+        GENERATE_READ_PR_REG_CASE(24, pr_read);
+        GENERATE_READ_PR_REG_CASE(25, pr_read);
+        GENERATE_READ_PR_REG_CASE(26, pr_read);
+        GENERATE_READ_PR_REG_CASE(27, pr_read);
+        GENERATE_READ_PR_REG_CASE(28, pr_read);
+        GENERATE_READ_PR_REG_CASE(29, pr_read);
+        GENERATE_READ_PR_REG_CASE(30, pr_read);
+        GENERATE_READ_PR_REG_CASE(31, pr_read);
+#endif
     default:
         BUG(); /* Can't happen */
         break;
@@ -208,7 +230,9 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
     /* Build up value for PRLAR_EL2. */
     prlar = (prlar_t) {
         .reg = {
+#ifdef CONFIG_ARM_64
             .ns = 0,        /* Hyp mode is in secure world */
+#endif
             .ai = attr_idx,
             .en = 1,        /* Region enabled */
         }};
@@ -225,7 +249,6 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
 
     return region;
 }
-#endif /* CONFIG_ARM_64 */
 
 void __init setup_mm(void)
 {
-- 
2.25.1


