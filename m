Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E4F7E077D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 18:35:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627287.978232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyy4O-00037T-NH; Fri, 03 Nov 2023 17:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627287.978232; Fri, 03 Nov 2023 17:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyy4O-000342-K7; Fri, 03 Nov 2023 17:34:56 +0000
Received: by outflank-mailman (input) for mailman id 627287;
 Fri, 03 Nov 2023 17:34:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VrR1=GQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qyy4M-0002p1-Nq
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 17:34:54 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b6ed440-7a6f-11ee-9b0e-b553b5be7939;
 Fri, 03 Nov 2023 18:34:53 +0100 (CET)
Received: from DM6PR01CA0027.prod.exchangelabs.com (2603:10b6:5:296::32) by
 DS0PR12MB8573.namprd12.prod.outlook.com (2603:10b6:8:162::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.24; Fri, 3 Nov 2023 17:34:49 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:5:296:cafe::11) by DM6PR01CA0027.outlook.office365.com
 (2603:10b6:5:296::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.22 via Frontend
 Transport; Fri, 3 Nov 2023 17:34:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 17:34:48 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 12:34:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 10:34:47 -0700
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via
 Frontend Transport; Fri, 3 Nov 2023 12:34:46 -0500
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
X-Inumbo-ID: 4b6ed440-7a6f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQmA+7ea8x2c/dAEBOymvF3E9IRuh9zagNOWH4musoxhXSvF3uceWXCOqdFbhNk24Zdws4W7XcLem7VG7N2NgMWXjyujcubcvI6q+C9hqs2EZZysH0fdIp9kisD82WMb2vVo59eUicVAcJ2xqvLRnrAVLfKLy6/g6akN/82ji+bwR3EZUQPGeSag3rIYwn0ZnNcHoD48reALB+Xhv7g2xrc2I0IyMOAvEv/u2cV/MFyUhew7AIAviILhLnvm8YPa1zfNdd8Vbnx0qLbE5r3O52lMvacTlbulc8jwdYV5ijS8/qr5XfgFXuBcvKods7fgOtgukAkcFFtCG7xu3nllug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVyKlruN93Y2nH2RPeYOuO64js7MDsSPgd411DOj63s=;
 b=lAUyK0LC6X+XC6lt2IAIfiOKchpaMwM5PLLVjEPzj18i8jdAGbvzsKGso9vtXfVrXE/dwtpcafpjGQdJEuZm8eLvaKBUIf1gFxysFVJfsxoXRfNoChUmqcjzG5HcPvHiilDBHeKT3dYgAYtxMqiekaVNdzjO3l7+cL1RiTB7GJV0OsOD4XMwWUI1m3g1c3orAsuvI3v31jlUJdNx6/5cKQBo6m99AolsD2TDgJCh0KseTLSpwBEZEqxmFfuJ75zWu8Z4sr+1J95cfVqNvdSljbm8VIqVRuVOAL+rOZj2aCviPOih0uR9fqt+WZnKeHzOe2y1Z3No3vXVco9YzMzz+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVyKlruN93Y2nH2RPeYOuO64js7MDsSPgd411DOj63s=;
 b=KW3VcHLO8uezEsbCvyNwLIpPxYTYWOaEsaQC2KP+DoSvyt5f3p1two9Mw9SqipT+WTbYRPCo3ZqMXZAKNbS7bxesmA8anhCiwZzIEWibM8A6xkhsQFOWvUL1wQVowb/b4K6cSLUlt57zAlnC7KjP0SUSbCtWjlQ3+2lmTqZCvno=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@arm.com>, <henry.wang@arm.com>, <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v2 1/2] xen/arm32: head: Introduce enable_{boot,secondary}_cpu_mm()
Date: Fri, 3 Nov 2023 17:34:35 +0000
Message-ID: <20231103173436.3912488-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231103173436.3912488-1-ayan.kumar.halder@amd.com>
References: <20231103173436.3912488-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|DS0PR12MB8573:EE_
X-MS-Office365-Filtering-Correlation-Id: 8919aee2-9ec7-40fe-b050-08dbdc932db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wAgzK9gumNvvp6Ojbwzj4+FKByloeoQtoCxWFM19YiD/wPSU9VyJYjk46Y8Ci6v4Biw69urJ/IKfpXICruT+BF1Enh+JkYXCa+rR5XbUqyXxDNKKPl+xKW+hvPZWDDuZzXN1/XXgS0vpb9wuw1rYd8CgUt89gBZWCKNbZ70yN5EgHYyGxsmZfK9obxYV9mX3GwV1XDbyCtFcRuy5qZGGnfvjFYQMT7Il/KrR24iegZj6pyXpig9jY3heDcw87FAh9ISYcp4R9kKHPoyPQmeF7XE7JHoRFUq6s7q4XLOoVLDWfJPaJw9fH4pv5aQStfx+N1XoLSTxteU7ZQZY057JXM2+JNKiWEudZw9Gmt2Wy6FZGvDJgfKrt6F41gFV7BLjb86MlBw1B6azHuGJcrIskLRWDevTB8kCi1n8mlHkyCzslif4eTqkKHZXaXqfmL94vp9l1mIdw+FT41o8CiUQDWBpgQczzoR4V6vzifFc7mtEfpGZrqUETnk8JclmmAmMOVGFowu4zN/+HJ6g6YcEUqLbMnKF/k7Xo8VmY/+mxcAPJJmA4FJyMKkijxXNUhlextZyMjTLgenOFE0NvyS8HbO64mb2K11+Orl5wIoBzZe1sK3y7bZ6Eazi/dGpSPZ6jUq71+6irzuOOHHSws2UXcH+uQNCEsU1q8/8/rJgl0av4Vq3Qfptoh2XoDCvO1YioG1XF0XkclNXedUQUVgNrCZrrE3DEOM4w/MrsOQwJlQ3RIUsTqjNNxLKrNGPaU5vaBNpgWbeUf8S5UcI0ouNtRqx4c4klMhwhuzLx/A7GDA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(41300700001)(316002)(5660300002)(6916009)(336012)(426003)(40460700003)(103116003)(4326008)(8936002)(8676002)(36860700001)(356005)(83380400001)(86362001)(81166007)(2906002)(26005)(54906003)(478600001)(47076005)(6666004)(1076003)(82740400003)(2616005)(36756003)(70586007)(40480700001)(70206006)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 17:34:48.6820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8919aee2-9ec7-40fe-b050-08dbdc932db0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8573

All the MMU related functionality have been clubbed together in
enable_boot_cpu_mm() for booting primary cpu and enable_secondary_cpu_mm() for
booting secondary cpus.
This is done in preparation for moving the code related to MMU in MMU specific
file and in order to support non MMU cpus in future.

This is based on d2f8df5b3ede commit.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from :-

v1 - 1. Added a proper commit message.
2. Some style and other fixes suggested in v1. 

 xen/arch/arm/arm32/head.S | 89 +++++++++++++++++++++++++++++----------
 1 file changed, 67 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 2d7e690bf5..7004443798 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -201,13 +201,11 @@ past_zImage:
 
         bl    check_cpu_mode
         bl    cpu_init
-        bl    create_page_tables
 
-        /* Address in the runtime mapping to jump to after the MMU is enabled */
         mov_w lr, primary_switched
-        b     enable_mmu
+        b     enable_boot_cpu_mm
+
 primary_switched:
-        bl    setup_fixmap
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
         mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
@@ -249,27 +247,11 @@ GLOBAL(init_secondary)
 #endif
         bl    check_cpu_mode
         bl    cpu_init
-        bl    create_page_tables
 
-        /* Address in the runtime mapping to jump to after the MMU is enabled */
         mov_w lr, secondary_switched
-        b     enable_mmu
-secondary_switched:
-        /*
-         * Non-boot CPUs need to move on to the proper pagetables, which were
-         * setup in prepare_secondary_mm.
-         *
-         * XXX: This is not compliant with the Arm Arm.
-         */
-        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
-        ldrd  r4, r5, [r4]           /* Actual value */
-        dsb
-        mcrr  CP64(r4, r5, HTTBR)
-        dsb
-        isb
-        flush_xen_tlb_local r0
-        pt_enforce_wxn r0
+        b     enable_secondary_cpu_mm
 
+secondary_switched:
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
         mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
@@ -692,6 +674,69 @@ ready_to_switch:
         mov   pc, lr
 ENDPROC(switch_to_runtime_mapping)
 
+/*
+ * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
+ * The function will return to the virtual address provided in LR (e.g. the
+ * runtime mapping).
+ *
+ * Inputs:
+ *   lr : Virtual address to return to.
+ *
+ * Clobbers r0 - r6
+ */
+enable_secondary_cpu_mm:
+        mov   r6, lr
+
+        bl    create_page_tables
+
+        /* Address in the runtime mapping to jump to after the MMU is enabled */
+        mov_w lr, 1f
+        b     enable_mmu
+1:
+        /*
+         * Non-boot CPUs need to move on to the proper pagetables, which were
+         * setup in prepare_secondary_mm.
+         *
+         * XXX: This is not compliant with the Arm Arm.
+         */
+        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
+        ldrd  r4, r5, [r4]           /* Actual value */
+        dsb
+        mcrr  CP64(r4, r5, HTTBR)
+        dsb
+        isb
+        flush_xen_tlb_local r0
+        pt_enforce_wxn r0
+
+        /* Return to the virtual address requested by the caller. */
+        mov   pc, r6
+ENDPROC(enable_secondary_cpu_mm)
+
+/*
+ * Enable mm (turn on the data cache and the MMU) for the boot CPU.
+ * The function will return to the virtual address provided in LR (e.g. the
+ * runtime mapping).
+ *
+ * Inputs:
+ *   lr : Virtual address to return to.
+ *
+ * Clobbers r0 - r6
+ */
+enable_boot_cpu_mm:
+        mov   r6, lr
+
+        bl    create_page_tables
+
+        /* Address in the runtime mapping to jump to after the MMU is enabled */
+        mov_w lr, 1f
+        b     enable_mmu
+1:
+        /* Return to the virtual address requested by the caller. */
+        mov   lr, r6
+
+        b     setup_fixmap
+ENDPROC(enable_boot_cpu_mm)
+
 /*
  * Remove the 1:1 map from the page-tables. It is not easy to keep track
  * where the 1:1 map was mapped, so we will look for the top-level entry
-- 
2.25.1


