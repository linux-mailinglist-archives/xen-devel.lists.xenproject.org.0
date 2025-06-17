Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB7BADC920
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 13:13:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018123.1395067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUFa-0006r2-Nb; Tue, 17 Jun 2025 11:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018123.1395067; Tue, 17 Jun 2025 11:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRUFa-0006oj-KJ; Tue, 17 Jun 2025 11:13:10 +0000
Received: by outflank-mailman (input) for mailman id 1018123;
 Tue, 17 Jun 2025 11:13:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DcaV=ZA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uRUFZ-0006nm-Jk
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 11:13:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2413::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b17e769-4b6c-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 13:13:07 +0200 (CEST)
Received: from PH1PEPF000132F9.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::2a)
 by SJ0PR12MB5663.namprd12.prod.outlook.com (2603:10b6:a03:42a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 11:13:01 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2a01:111:f403:c902::13) by PH1PEPF000132F9.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 11:13:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 11:13:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 06:13:00 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 17 Jun 2025 06:12:59 -0500
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
X-Inumbo-ID: 0b17e769-4b6c-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPrcb9PxmftpypCLJF3M+0GOuGIJtM5JxpQhs6YZgH9UvL+V2o3Omam3UcjzK7okLi+BtrAU+PzcZotcrHXOEHh5fswTkT1jh73ToINmSXQRg1qZY2KWxTFyC5bAUcrjgQ9zS+KdMk6JRHTDh1SnPUcp8DGvJ+gfJ5NjT5imReTZQglfmvs4fsAxZf81lqNcow4eyW8RWSXCubE0QM9XVtwmLsJ0R2YHtQvuEpcA8cDHRpAeFHyUsD/urLgdY1w4Oi3FqKSb6aiEjWwvYDzR/lk5ARPJTxp9CNwu3i+IWsUTopDS+1I6RfYMVCl3ysFLAn4tyeKTohC1x03OlJPS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBWonEOx3cR135w9gJzkI2e+vQSR+H8cHG9c5fj+CkY=;
 b=qFYRMJaTyJZ62nk6C2eya28mjt1Jh+tLQvRcDn2smodSCKvMSnP8SnG3JtOXVLoao4zxplSmv2PzRUsTAusMh1B8MDlPbfXZlI878qdK0qbyUzH0h2ftpAtcTb4ojntD7V+whb9l9n+HlVmLp9B+tyypuDgyz3pptITLtutEA/FNV998Hv8BSP2vxYq8mITi+ieC+TLG8I7Y+5UNz9VvJm15MfY6nKDHubuUBmflK54r5TfZa0Ljkk7rmW+6LqVCvuZdgWp47uSpEbVbv0wcsVG+0qyJtZ51yG46KFo5l+ZMsov6QLZ2NL5CKHc3e6L0C8CIvbmfSfWc9wveAFQWJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBWonEOx3cR135w9gJzkI2e+vQSR+H8cHG9c5fj+CkY=;
 b=UQ8zT78vFgq+SIEjRvI5CTu1/CIDEmDa0k1X5OHE0VFIXR7Pj9Uln1Gvdxu8cnMh8+0KnTzfoZmd7EH/y3O32HzvvhsQECpE7LFz4UaGunL4h+HhYTL2m0uiQJMeCgJjMv7xFQybIImJeC88aQ6BFDq8Rhh9Trcwri+bg/m469Y=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>,
	Hari Limaye <hari.limaye@arm.com>
Subject: [PATCH v4 2/3] arm/mpu: Define arm32 system registers
Date: Tue, 17 Jun 2025 12:12:50 +0100
Message-ID: <20250617111251.1711553-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
References: <20250617111251.1711553-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|SJ0PR12MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: 28d5c5a5-1973-42bd-ca37-08ddad8fec1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MIv8KLmoMAMsbCj68gdKbrTEv7b0QjM70X3FOc5Ca2/2B5fOvJBgtkoZSVkk?=
 =?us-ascii?Q?AYY9KaCk/3XHqChGaYxxbB0q+gSsXS4p4X6/UsVU1Ijpwps11zP30WxdKCSY?=
 =?us-ascii?Q?Hw9QuP+H9H5Fx/2W4bijoPj24k3H0Z0b/94+lg0XCo3SuunU9kPaZl4RwtZW?=
 =?us-ascii?Q?3Vmc/Ld0BxYwruSEZdVZHNDuUgY6fDBlwOseglKPlTh9c0PWkrM6Jdqyon5Z?=
 =?us-ascii?Q?YWc33GOebkBAUU/INPWSABEKJEkzNtTTDHAdOI/RVemPEdr2DHJ184G978vW?=
 =?us-ascii?Q?A9f80Q3EEXkmrBnu32/PS4f4mxj8a3jq63b0oa6WV4+mYC8LlCAADjkkel98?=
 =?us-ascii?Q?j8seXMQOvE43UAkSlYMQEfYTAwZwBfWummFzTnw72jbSLLUrfJo3IjXYRN7p?=
 =?us-ascii?Q?bcUarF1xekwmL6Bo2FnmvVIzHIJ4JD2OLdl+nIJ09w5+FxN20nchww+YkGv7?=
 =?us-ascii?Q?9QBAiDs4n9HR0g+FcrCM+7Y+Pi8FbwR3OXn1AuW7O7MYIYeEZJ1/cQROHfiy?=
 =?us-ascii?Q?sOZSMPeYfF7Ex5jq2WcmYlDZ8+oW9H2ULDj+oW+pMjQ2haDcQBHt/zjovxfM?=
 =?us-ascii?Q?YvqM7F1HK0rFg94ibqTFfNa9w1qC9rjdHeoZjvNWjprC8/W8NmkOfR+9lJcF?=
 =?us-ascii?Q?MH/fdC0pISPT/Bt4zuOvb3NtqD6mHmZU3ABiK7VJyBAFSEDGGHXk9Yx3zmA9?=
 =?us-ascii?Q?mopPTQe03tvwGb29UTZ/Annb/ltYgIDoK+VOGOZdQJNg6mBMSads8H/vsU4/?=
 =?us-ascii?Q?/VWfLUXHy6kCZKxYfEc9O3zX+ic87FnHUxOAgSLXpCSLKMGKRiMzOl4Oq8Nl?=
 =?us-ascii?Q?9SX+WjvHZuSbp4rR9vJ/dApG3yez2dgyY8837/hmAiK0Mov7ExfWmVBKI39/?=
 =?us-ascii?Q?SgehBiKQkh/calNryJHef26iwQIDDkrfe8iYYum7sX6s93YTlVJvEdKfcsUT?=
 =?us-ascii?Q?J3yod1pTY/ijPzKnJrdfN9Pe7Fz3ZvQ3Rh5Bv0e+wHSZAq3Gf6aVTvufdDrF?=
 =?us-ascii?Q?xknkZZyEB02TeQcrRuNeoJIWo0hbERoji23+6kmI+rzQsZSeqkkcu+4Cw6bR?=
 =?us-ascii?Q?QGfOJpKdDQ+j7fewdTHZXngBNfPsBV1N370m07cTo5cFSF2gS+4Gyp+tWyVo?=
 =?us-ascii?Q?ZGY1N+AUSrALbT1mQRFN2rmra8it7C0Xoj+xLF1Jdj+vIrdl9Bi2o4EUOON2?=
 =?us-ascii?Q?ZdEhD2tnQfyQAjph6PmTwpSIKbrrW24UuGk+iEBjgbgTyCTXE0dhfq29mVdq?=
 =?us-ascii?Q?uEiIFKAo+RaKB3oiuAL/jEhWn6YZlKVolqAj6HheclCiIHJMnpyr26xySOgE?=
 =?us-ascii?Q?oQjBpcRQUGaIbCYCNFrGVmRjN1BDvXKRoKIQfzzNqEedoMvp3pnUn6bbugqg?=
 =?us-ascii?Q?IYpb1JSEsTkRZp0uC3rFcfiOZMiMGroWll7dJ1uFHfQFTpKkxmgKuhfMCq8x?=
 =?us-ascii?Q?Ps4YaeGwSZZkok1uRc+9ogUpIdU6qf4CV8k3Yb/Mh2KSgnjubIigQfhzkjRZ?=
 =?us-ascii?Q?ObNHfptKgl26TW0Jd9CEMwHcua7p5Gdihq8A?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 11:13:00.8238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28d5c5a5-1973-42bd-ca37-08ddad8fec1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5663

Fix the definition for HPRLAR.
Define the base/limit address registers to access the first 32 protection
regions.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Hari Limaye <hari.limaye@arm.com>
---
Changes from :-

v2 - New patch introduced in v3 (Extracted from 
"arm/mpu: Provide access to the MPU region from the C code").

v3 - Add Hari's R-b.

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


