Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94959988BE
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 16:05:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816169.1230397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytnB-0007Bk-IZ; Thu, 10 Oct 2024 14:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816169.1230397; Thu, 10 Oct 2024 14:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytnB-00079B-Es; Thu, 10 Oct 2024 14:05:25 +0000
Received: by outflank-mailman (input) for mailman id 816169;
 Thu, 10 Oct 2024 14:05:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwpE=RG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sytnA-0006aO-3f
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 14:05:24 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061b.outbound.protection.outlook.com
 [2a01:111:f403:240a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0721540-8710-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 16:05:23 +0200 (CEST)
Received: from SJ0PR13CA0162.namprd13.prod.outlook.com (2603:10b6:a03:2c7::17)
 by SN7PR12MB8604.namprd12.prod.outlook.com (2603:10b6:806:273::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 14:05:18 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::b1) by SJ0PR13CA0162.outlook.office365.com
 (2603:10b6:a03:2c7::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16 via Frontend
 Transport; Thu, 10 Oct 2024 14:05:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 14:05:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 09:05:16 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 10 Oct 2024 09:05:15 -0500
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
X-Inumbo-ID: b0721540-8710-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7ZF6A8n0zH7nv4XvOacBErxB9pZau3XFfW+loWWfoZxWmPIJiVh5oUpmlwi6RQC0xUzzST1lWb0wWjbDjfbppnFXbLMLRgPcmmKOtZ7Y4pFFqz+w1Qdyd4/dvnkXGK1gzHnf2+QHde7y4DqMTpnql9+Sph7zNeiRjqdE4YZDxORjKEVb2ci121Bem6XxOadqUBoWm5yTfP+hobvY2dlQYUv6ynf/vKM8Legoi3OwjdrC6jbI+kKS+5IbXYcU4TaHO79rSdsY15gZvuiZxJNmwKkFBe3cgpN24aaKaOXV6cbmH/6pQ8Kv3Pi1yzXqQfeh3dUsAqpcdJF+HspHshR3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yym0EEggncFfOSUc233UEcJGav1crXKLZ4st43Tahts=;
 b=r7DmcetMhpT63fMgaPTXhdRv23jSZRK/phWc8WBGdSXmkQ4czOKOegBqOkLHH97lBeJvOd4CqN2WWIg7yKbTeAs5BNH6ENqsCx9amuLWc2Wquc9W16rEli+Eh2dZKMmoYxxgZyQql1Qwg/ssHTQcj7CeR0nAuyXAxfezDXGvBaYIbiqDsh+vajDJtlYJ+qW76oauRW8syxOxcuwxSNbEyPL53KGdD1ICMyUMankJbDQs8asA5H8eesmw4yW1QnfZBmpsWpEubI7ySPKL4W7qEsNBURIYkp3E5zIRcgtoC+PXaEMUfkrL71mhy4c2b9y3x8gX89YFe/bjffX3y5517Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yym0EEggncFfOSUc233UEcJGav1crXKLZ4st43Tahts=;
 b=EUddmWfA5rQfJOEd7nxDEK8J542vrIW+cDaetVPISL1dILyAolZRbHNmdRsm7cSBbhSBhejOcVT3Hmrynp8a+R1uIbHzkRAeuWXbw6lrPYSFJasRz2HFuWSIU4O9lVVjIXZ6cC2IcAhbxSs6PX9OuAvYtFJIlCM9JTsAygBlHDs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 6/6] xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm
Date: Thu, 10 Oct 2024 15:03:51 +0100
Message-ID: <20241010140351.309922-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|SN7PR12MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: 1de2197c-76f0-45c4-af62-08dce934922c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zKmaI+0PbdyecuZ5f3AIC0+rnU0Y/yVPFmN7KjOaEdJ5wX/qRhCPPHauVhCt?=
 =?us-ascii?Q?oUe4T6goc+9nnqxmRbT8lcx8k9NztJ2gnofaima+oOj8y9YKVOdnNtRMKTFg?=
 =?us-ascii?Q?jZcjE7usBGqqz9WS+8NbuKa1A6/9is1ZDTqUcyAQ6UjLZuF8k7v+IuwHssDA?=
 =?us-ascii?Q?7AlfsH+fbRXqbaE6kmy0htVzMtnn/FM9QnZjGhNstZVKJqDzfDBFkducvN9p?=
 =?us-ascii?Q?YxmQ2wjkJfoBmO73O8FRPLJs3/7pdhWHl+DdSOpPpvAsphZAt1qY+pCQUD48?=
 =?us-ascii?Q?JO4EmjVBQXJ3cB87snROkKN6MSAQJasB5NNtEIvMU50sZw+d/XgsK0FIy81x?=
 =?us-ascii?Q?HzlhWqOZVluXZw+FcoWQqWOC9AaEP9omR56E/0/M0Z6wq1+jdL5uJMteVy48?=
 =?us-ascii?Q?GyguEFHCOGFTq8VIpxhIAD8KUBmxgUCq0HHRpPSkPn+mcNrEFYMhsVFvMJ6u?=
 =?us-ascii?Q?8c3ovakqHL04zfEQMeoAEczpX8dU33DA8KOI/DTBuOeFlFV08M5kEt4ln5cX?=
 =?us-ascii?Q?kwPAankJOcF2kCGVc44RPg/FQLkS0KfnZJdlzNFULal44y7KswgH0mq1rUTp?=
 =?us-ascii?Q?d5abGmU0btcHDBIkL9nj7ClTMb7elG5dEIVKRTgq/gT/EP5Z9d6dQt/akztC?=
 =?us-ascii?Q?MFTEVLsyz4DakjHgY85eg7/w3Yqh907r9MX+kmMoSi5us38JwRz54N72/9/u?=
 =?us-ascii?Q?+nAu9g9qa2ptIFgjZsc/yth2nUkDW9ns5po8BN94kybZiTcAhNQNGtWgI+sn?=
 =?us-ascii?Q?CJA0LjxhLJ9fabfwuRdicpyuZVOa0cY+d8VtAgpShmPSCvi99dpYSwANu/x1?=
 =?us-ascii?Q?Q1HBEvZyeYgzRC0SoCmB0SsH15SAPiVQ+p1vCasGtmqBhRPN8tqG2HqNtgmh?=
 =?us-ascii?Q?G/h7rZ1EGnEWYlyeW/+RDsTZevvIzwZ/pq8Sgr2iuTkuHwUoInviWxOwQJcc?=
 =?us-ascii?Q?EkqRVTEpI+w2K1BVMnogw2eBtIhTGAyQ4a5gGCsQM7bI5z4L/h8MJfYVv45a?=
 =?us-ascii?Q?thMoYkgKZ8X5p3i65VlZSxppglUo8k8mDXW9YWfqiQlVqUMn+t4eZ7JM7Bwr?=
 =?us-ascii?Q?+UTRXRFlOSFo/LDTnch+tBqoRMujCqsoFSeBeq5vW9uXvrPvAyj3WhgaWsSW?=
 =?us-ascii?Q?+EHJnY1llOcCoVZsmV3GyzvhmRLL2O1jSLfMnuiCcwX7dDiRsy8Lyf8CQZck?=
 =?us-ascii?Q?9XlOXt9L8cxwQiSRso0uENBpHnhNZFfSh/V6DtmwlGVvejfTmD+IpLKw07cF?=
 =?us-ascii?Q?2/4l03P2phdM2N+k7a//Kcq9J3YexWK/PY+CrQ8nOn6tN9ZzSXq/cdrZaNI9?=
 =?us-ascii?Q?2Xj4MMFPgeWuQgauJr5+rW2pvxzfqnTxSNXWBnKvR+wkaOiR5Fl5I2jLZry5?=
 =?us-ascii?Q?QdmlDo0RwYNQ49MbY47h5rmA++ds?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 14:05:17.8334
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1de2197c-76f0-45c4-af62-08dce934922c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8604

Secondary cpus initialization is not yet supported. Thus, we print an
appropriate message and put the secondary cpus in WFE state.
And we introduce to BUILD_BUG_ON to prevent users using from building Xen
on multiprocessor based MPU systems.

In Arm, there is no clean way to disable SMP. As of now, we wish to support
MPU on UNP only. So, we have defined the default range of NR_CPUs to be 1 for
MPU.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. NR_CPUS is defined as 1 for MPU

2. Added a message in enable_secondary_cpu_mm()

v2 - 1. Added the range

2. Clarified in the commit message why/how we have disabled SMP.

 xen/arch/Kconfig              |  2 ++
 xen/arch/arm/arm64/mpu/head.S | 10 ++++++++++
 xen/arch/arm/setup.c          |  5 +++++
 3 files changed, 17 insertions(+)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 308ce129a8..6053e048fa 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -6,11 +6,13 @@ config PHYS_ADDR_T_32
 
 config NR_CPUS
 	int "Maximum number of CPUs"
+	range 1 1 if MPU
 	range 1 16383
 	default "256" if X86
 	default "8" if ARM && RCAR3
 	default "4" if ARM && QEMU
 	default "4" if ARM && MPSOC
+	default "1" if ARM && MPU
 	default "128" if ARM
 	help
 	  Controls the build-time size of various arrays and bitmaps
diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
index e354f4552b..4d36a8c9bc 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -147,6 +147,16 @@ fail:
     b   1b
 END(enable_boot_cpu_mm)
 
+/*
+ * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
+ * please the common code.
+ */
+ENTRY(enable_secondary_cpu_mm)
+    PRINT("- SMP not enabled yet -\r\n")
+1:  wfe
+    b 1b
+ENDPROC(enable_secondary_cpu_mm)
+
 /*
  * Local variables:
  * mode: ASM
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 0203771164..5a0d343f5b 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -296,6 +296,11 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
     int rc, i;
 
 #ifdef CONFIG_MPU
+    /*
+     * Currently, SMP is not enabled on MPU based systems.
+     */
+    BUILD_BUG_ON(NR_CPUS > 1);
+
     /*
      * Unlike MMU, MPU does not use pages for translation. However, we continue
      * to use PAGE_SIZE to denote 4KB. This is so that the existing memory
-- 
2.25.1


