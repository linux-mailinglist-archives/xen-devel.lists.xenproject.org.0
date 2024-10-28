Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0969B30C9
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:46:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826452.1240738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8m-00069X-St; Mon, 28 Oct 2024 12:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826452.1240738; Mon, 28 Oct 2024 12:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8m-00065Q-OB; Mon, 28 Oct 2024 12:46:36 +0000
Received: by outflank-mailman (input) for mailman id 826452;
 Mon, 28 Oct 2024 12:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXyF=RY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t5P8l-00050g-12
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:46:35 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2406::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a965d574-952a-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 13:46:34 +0100 (CET)
Received: from MW4PR04CA0245.namprd04.prod.outlook.com (2603:10b6:303:88::10)
 by DS0PR12MB7802.namprd12.prod.outlook.com (2603:10b6:8:145::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Mon, 28 Oct
 2024 12:46:31 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:303:88:cafe::9a) by MW4PR04CA0245.outlook.office365.com
 (2603:10b6:303:88::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23 via Frontend
 Transport; Mon, 28 Oct 2024 12:46:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 12:46:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 07:46:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 07:46:29 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 28 Oct 2024 07:46:28 -0500
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
X-Inumbo-ID: a965d574-952a-11ef-a0c2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utYT/0/qj3Y5kKAeBTKBkaobdm9di9wZ6AL4r1e98rLqo8jMasPm39+cv0A7gcq72dxJY2HHL+Qs26W0Figbgn3EMhcI3/CqOJX2PBPiBxp4qEat17jTJxmyfsmCDPVkTfN9Ebf/lSgAaZ9CT8D5qNzIFFOPGF1tm41vuoO0inwrxmduGPxbn8Fbyxj8Ry92PvUycwnshopdK3iBT+SJzer+3hiNSS5na+3NwauNQe4CxsDU6rd34bIjFGVmq8jmj+t1QdsrR8LHwK6IZU290jeDa+fcDUfXiBEkuDnH8s636+qDDy+ClP3pn1ZrDv3oFiPQSnCC3+3vklJfhHRJlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E4ilOMJ0iLFTChx6I4m08V3KKvqq6Suvoj0IUas/+dk=;
 b=JYsAo6pMSsfH6oKIT+t8oa6d/CiV9K6hO0R5jgx7Bq17pA70QNunhRsBR80Csn9Hejy1tnTSBglQvlV7dBsSjUXZY9HtTDCbhxwtpCpi+xTfmDxPPS3PBv4mi7vAHCTatkDWc7nDrIKAU8wIJeDR8HnWumwtOcyZXBJmABpu9KdHg6CUqqmUaKAi2TXYIThI+A2qd0I9TkaBNLFg1wzMoh3plOLeds9JpR4i98w6qmzcbtMZqL/gkiyF38O8mPeFDM4o1XfD4RUGBHOKKTZTr1XpZUTTP/aksb7BAViC92QGG82T9lk91ccVM2ZhiBjqPKVvD8lidVbEtfE9M7riPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E4ilOMJ0iLFTChx6I4m08V3KKvqq6Suvoj0IUas/+dk=;
 b=lZhITCuqQZOJ5XeQFfP6q0oPYrMLis3i+TYjv0lf0zCsZT5Mogry6bamTkcrhDicwu7tD2ky/VprbZJjjUQi4XqngWch+LwmiQ5ZlkbHRLn+Bs31S2HoHarEIHwTtI66DsiDddk/UsMWHUiMoGv0vfn/GSecfXV2uZN2Itv96+g=
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
Subject: [PATCH v4 6/6] xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm
Date: Mon, 28 Oct 2024 12:45:47 +0000
Message-ID: <20241028124547.1371867-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|DS0PR12MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d27b14-c259-4f8a-90b5-08dcf74e8be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RmhAJoKWcSepcARtEC+MOLVdyHdtUItooXLteO87lYEHMUEhnh6M7tZHZr95?=
 =?us-ascii?Q?aOHZ70QEG9RaBEx+OghUXygN6eMp6HNt+dZ1fEA86eUfvhaf9az6RnZb8hBd?=
 =?us-ascii?Q?RnAvpssN32DN9xQq30KneQAxDP3aAGPRbCAqi3bih23sXAbxFOLyO7iSYcco?=
 =?us-ascii?Q?nYUwSatgr9kMt/yWChajte49pfxGQ6QShuZidf96RtJDXW6NFACZuNNzPHDg?=
 =?us-ascii?Q?sFgXNEvAxEEPW1b1gAG1kXxKlmhGM1e+fEtvOVhGVkKNmIU0ggqVKRDf2zbY?=
 =?us-ascii?Q?FS1Zb5P8Ub8qlGyqpf+mgo//tlUYpEnsNg/mfjSkkSm1i9Kg1lJhOcuT6pqH?=
 =?us-ascii?Q?vRRGPL6ck2YAF6MDYOt7cjIUuxrSA0J0M27V9lC8XzQCEHWVoHtLi3s2bgEr?=
 =?us-ascii?Q?rOkffekFCV4OASBgiBEii/0gzxhrQRbLsywq6e2eQetxZh07X7SQ0Ubu5Q44?=
 =?us-ascii?Q?WsgJtCSv7tfqz7HcXpTeODEVCu5SmO+XZYoecgHIWwYh/gpeodjwZdz6a/Z2?=
 =?us-ascii?Q?YPyuipZz1iUr+5weWzRFM0UJJMZBTBm7LcOeNWpoh5MS8LyYJ4nYeDilbZEX?=
 =?us-ascii?Q?KSHCopIAHqQ9YtsMZLXgPw2ZqqJ3Yu5f8oUkyjHKAsXKfBldw5UEa30skOw/?=
 =?us-ascii?Q?2apmpYS6AuNRvcEF20yeoZBfh+D4ao49p57osxVAHAjlIuh2/Y1ysgxFv75c?=
 =?us-ascii?Q?IwQvAPoPdDNy/StH9kOM4+XIGQlfYf4yBy4u4k5aCtNtlCS/+m0gnyM7kNAv?=
 =?us-ascii?Q?B8GFhQOCZDOLpKilZHI3baVB9Hx8LGF7yakWERYL/jAila0h6RKtKSaz0HX0?=
 =?us-ascii?Q?1zw5X+522EsUQV2f3oHctuVMHhFxv6UQDOX+RIp+7XUu/oMWYC/Vxn1ctdmn?=
 =?us-ascii?Q?ULaE76OHD9RTOogTnwqfVzjP8auOkDevaFXicIwtnazkRhmkI3Tcq7A+YHl0?=
 =?us-ascii?Q?2RoGhdoe1xd7Smvz3OpVv91WtC63dGiPfLily4w13R3yIlH2vDW3nUiF6suk?=
 =?us-ascii?Q?ImybKOJscc7MaLtAOx+B/iTIsCMPvqKkY9slIoP7tpmIqcN4xdQG7FhWMBco?=
 =?us-ascii?Q?AjUey9DCcGwX46M9GlMAXcaB0Lz3k7armUmX/BXZC4T2mbwgXny8urivTF+/?=
 =?us-ascii?Q?9vdOqLhfT/yZP7IfiLMmjiA1yOblqeJjGGDEri9uNJGzDqbviFMoDWYAoVrb?=
 =?us-ascii?Q?XxCQm0/8dd26+A3yeTxdbFrDjYuCdCYeFCYIoKt6qaXIfm5PnRfriCHibHIV?=
 =?us-ascii?Q?/t1BMvYXb/9HWRye/Ue06T/nKiec4WgZrUViqiNZCoIodjvOktuvXri7Falf?=
 =?us-ascii?Q?NBPWfZUarAdfXroZEHOq1BkcHqFvZ0n52LJgb18kFiEXOvWsj+OnGbXswS8k?=
 =?us-ascii?Q?8+gR3B6QSQqKyqO2Lix49bRG/dlSIWlwE/Kr/oZMJVabLGIfHw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 12:46:30.5246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d27b14-c259-4f8a-90b5-08dcf74e8be0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7802

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

v3 - 1. BUILD_BUG_ON() is moved to smp.c.

 xen/arch/Kconfig              |  2 ++
 xen/arch/arm/arm64/mpu/head.S | 10 ++++++++++
 xen/arch/arm/smp.c            | 11 +++++++++++
 3 files changed, 23 insertions(+)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 308ce129a8..aa383577a4 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -6,11 +6,13 @@ config PHYS_ADDR_T_32
 
 config NR_CPUS
 	int "Maximum number of CPUs"
+	range 1 1 if ARM && MPU
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
index 0edadb009c..5a6aaf47cd 100644
--- a/xen/arch/arm/arm64/mpu/head.S
+++ b/xen/arch/arm/arm64/mpu/head.S
@@ -140,6 +140,16 @@ FUNC(enable_boot_cpu_mm)
     ret
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
diff --git a/xen/arch/arm/smp.c b/xen/arch/arm/smp.c
index c11bba93ad..b372472188 100644
--- a/xen/arch/arm/smp.c
+++ b/xen/arch/arm/smp.c
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/init.h>
 #include <xen/mm.h>
 #include <asm/system.h>
 #include <asm/smp.h>
@@ -6,6 +7,16 @@
 #include <asm/gic.h>
 #include <asm/flushtlb.h>
 
+static void __init __maybe_unused build_assertions(void)
+{
+#ifdef CONFIG_MPU
+    /*
+     * Currently, SMP is not enabled on MPU based systems.
+     */
+    BUILD_BUG_ON(NR_CPUS > 1);
+#endif
+}
+
 void arch_flush_tlb_mask(const cpumask_t *mask)
 {
     /* No need to IPI other processors on ARM, the processor takes care of it. */
-- 
2.25.1


