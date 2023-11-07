Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 269A07E3AB7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 12:03:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628763.980566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Jrc-0000yl-Iv; Tue, 07 Nov 2023 11:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628763.980566; Tue, 07 Nov 2023 11:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Jrc-0000w8-G6; Tue, 07 Nov 2023 11:03:20 +0000
Received: by outflank-mailman (input) for mailman id 628763;
 Tue, 07 Nov 2023 11:03:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q5W1=GU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1r0Jrb-0000vu-Oj
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 11:03:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41d1000c-7d5d-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 12:03:18 +0100 (CET)
Received: from SA1P222CA0180.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::17)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 11:03:13 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::63) by SA1P222CA0180.outlook.office365.com
 (2603:10b6:806:3c4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 11:03:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Tue, 7 Nov 2023 11:03:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 7 Nov
 2023 05:03:13 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via
 Frontend Transport; Tue, 7 Nov 2023 05:03:11 -0600
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
X-Inumbo-ID: 41d1000c-7d5d-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLr1u+tpquAtM9+b/F3Qkup6oavobICVN+v/wcT0TXtTmpryvpB5fwCEbFp8USpOz+1I/8hGd6MPrv61NqgN73Amt8FpwuDT81ShWhoJK1O1OGXWYF2u+KHvxUuDau8I3bUpkLckGerNTtsFXN88VNLRrNiRe2lNJPFmUiZbnlNoDdH6unO7G5MRlXj6RxbvW0bpX6nLUyKy9mh00OuGoi4vqjcxgAa18nPEGEQVPap3PMBPiGCSb0+Dy51c4K89me8MKmrINsykQ9Qy+98pcDlNqaw1m+tQe5bYUaXlRo6QSrBMnHis4r9K/ckpLf/vTCCI7OL/50UJHx4F+ajdmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=295kC5RqrkcuwLMEXOng/E/UTwyernbSiTB90Q1I9Os=;
 b=iJT5XT5r00SKLS3KIEChI8PC8l2Gvh5j0QoCKVov+9Ml8K+AiQys4K0A7HAYye7JmA/8lIOtu2nR+wlJiKKmP+JMLs8YU5kNyD5e0ErM1GY7rAEXj+BoZqiIJuqjShjcS7jVPzlt2PZgNozJ0NTfRBwRAjSJjNtcGw2D0RvCSzkZ9dr3U0jKU+ZkUiG174REu9WkeIr8VzTvnvKbbOnGQ/1pqhTGS6YJAy2rmhssRG+xjcJVO5NNyLTwsb/9I/+r+806X+5qLAlLFhwJvZdyJDVq3FHFFQH4bSSRveRXseSgc5v3354jjlpB2ElWPKKjH29TaMYkvm3BnqsvifwlSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=295kC5RqrkcuwLMEXOng/E/UTwyernbSiTB90Q1I9Os=;
 b=G7KpHgshcBwztD/kkihNIIhdnUtxl04ygSTelsB2KwyvBBSmxoarlfLuL1z5q6XumdylPOQDDIYN0Gq6ACdg9vHvqqEp0qDyI/FVYm9/NUFD/a3u/67SSi8mUDVnr9zeWGnI6/rmm4q7vqXCyZCJrRg/jSI8bI4A+3ZBqS4w5ro=
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
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Michal Orzel
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 1/2] xen/arm32: head: Introduce enable_{boot,secondary}_cpu_mm()
Date: Tue, 7 Nov 2023 11:02:16 +0000
Message-ID: <20231107110217.1827379-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231107110217.1827379-1-ayan.kumar.halder@amd.com>
References: <20231107110217.1827379-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|CY5PR12MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f026f2f-57e6-4613-9ead-08dbdf81233b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B+D57BJHPy3G2S5Bs4lB7M67xrkAcknCC9SA1GMiOdjKAyLielXGQbCvH1CtDidAI4fX9Q0ydcxm2vgD87GlfnhHAbWjEd5ImZwLtQH7aEUX6EIRh8NwzZ0QjyR0/oNtOKRiHvyImzqgrt12pY8cYXFIjmQdut6fhK6nEPYzS9l3jjsJpZ8HSk9plQWBcmfaKnDvxf2E42bFfddtTIXAaI5owJAUG4k48ARKeYBmEp1LMiW3b652ZdCYWnQiCQc9DxI/Rux8k6FW3Z/h5mh6MV9SzzHJZV0nmlN58s56YqPA3weHF8xi+sQjGwE1+oTvNsU2fFla2B1dipyw8sAKshhqYps3Ck/yFqeziK0pdEWUklV9TCpZ2bwhx0xUPpEMYQAL0YpuU0TecUnDFyAg2/J9NB39WMi2Ad7eQdRlsVNv2gl/Qk5fh0qtX9COaf2eAqox2pDyulukpuFflYU6zf80bd2yhqmTfMVl14k/wHK4IjvJeHq8t4LPE76bttv3waCbRGPMfRB0Eu4rZz5mS8RDbg/6ndCF2z9ENL9G/6eGSG4SIT882meQ6IjqpEldE7fJ6/MXLViaPvKo9CXKJm4ONDSDCLAGaLu308FmpOVkrN0XlfvtCJdROLfSyIvxn7gAuOV+B8qTGN/+h6UKOm7ZXuPwalOl3WTbl7HG7sGVoALSx2cDRhMZtj3TPR5JuxlkatTTkMJj4Czf6rF8wnFr9hfHcVAER40j8EG//a1a8ZfHMBZUsTpyrQtnuWSea9kio+8a5jHwiX8MJ4KrEHfbDMwvzMI4Q5eE/CZBSoE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(36756003)(5660300002)(36860700001)(40460700003)(41300700001)(2906002)(103116003)(86362001)(81166007)(356005)(82740400003)(70586007)(70206006)(26005)(316002)(54906003)(426003)(6916009)(336012)(478600001)(2616005)(1076003)(40480700001)(47076005)(83380400001)(8936002)(8676002)(4326008)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 11:03:13.7317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f026f2f-57e6-4613-9ead-08dbdf81233b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035

All the MMU related functionality have been clubbed together in
enable_boot_cpu_mm() for booting primary cpu and enable_secondary_cpu_mm() for
booting secondary cpus.
This is done in preparation for moving the code related to MMU in MMU specific
file and in order to support non MMU cpus in future.

This is based on d2f8df5b3ede ("xen/arm64: head.S: Introduce enable_{boot,secondary}_cpu_mm()").

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---

Changes from :-

v1 - 1. Added a proper commit message.
2. Some style and other fixes suggested in v1. 

v2 - 1. Updated the comment on top of enable_boot_cpu_mm() and
enable_secondary_cpu_mm() ie mentioned the input and output registers.
2. Updated the comment inside enable_boot_cpu_mm().

 xen/arch/arm/arm32/head.S | 102 ++++++++++++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 2d7e690bf5..2204ea6dce 100644
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
@@ -692,6 +674,82 @@ ready_to_switch:
         mov   pc, lr
 ENDPROC(switch_to_runtime_mapping)
 
+/*
+ * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
+ * The function will return to the virtual address provided in LR (e.g. the
+ * runtime mapping).
+ *
+ * Inputs:
+ *   r9 : paddr(start)
+ *   r10: phys offset
+ *   lr : Virtual address to return to.
+ *
+ * Output:
+ *   r12: Was a temporary mapping created?
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
+ *   r9 : paddr(start)
+ *   r10: phys offset
+ *   lr : Virtual address to return to.
+ *
+ * Output:
+ *   r12: Was a temporary mapping created?
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
+        /*
+         * Prepare the fixmap. The function will return to the virtual address
+         * requested by the caller.
+         */
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


