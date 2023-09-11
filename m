Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C704979A872
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 16:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599437.934877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhTD-00067P-JN; Mon, 11 Sep 2023 14:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599437.934877; Mon, 11 Sep 2023 14:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhTD-000655-FT; Mon, 11 Sep 2023 14:00:55 +0000
Received: by outflank-mailman (input) for mailman id 599437;
 Mon, 11 Sep 2023 14:00:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S94K=E3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qfhTB-0005N8-PM
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 14:00:53 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e810d98-50ab-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 16:00:53 +0200 (CEST)
Received: from CH2PR04CA0021.namprd04.prod.outlook.com (2603:10b6:610:52::31)
 by DS0PR12MB7745.namprd12.prod.outlook.com (2603:10b6:8:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 14:00:49 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::af) by CH2PR04CA0021.outlook.office365.com
 (2603:10b6:610:52::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 14:00:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Mon, 11 Sep 2023 14:00:49 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 09:00:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 07:00:48 -0700
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via
 Frontend Transport; Mon, 11 Sep 2023 09:00:47 -0500
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
X-Inumbo-ID: 9e810d98-50ab-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMfuXEPV4FiAganS7x5zuheUqg6EA2clj2LBu76e/ej5WQR9Juz58pF56fcp4E+D2fUjWJLpzj7yV2+XsWr6z9lbl5Zw5pw1d7Xqi+BycUtL6Tu+xbLd7VkhayvqVbq7cvIgUXTZXDuCGrVH2rUgsPZ95BgRLLUgEHPk5+9z3040VBZnuuxiRBlJi83qZHrKXFqVBIhlPC/S00mJRTJR9nIUIDLb6+JKZuZ7XdHTVShiGZyvNt5xxjV/rzSw67IqlFVgTXrZORJDuwViWw3b+D4qfCiVzFCtbPOlELPdwcKCcm3uT0rcHcQ7DGztOq3Jfjx2teR3o5I5hhj6h9tCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRY9UbEDG6nTXq04KFID+lWxWkzScTYfxvU19N9FVto=;
 b=HRoSBNQvoGlXTGY75a+RSVc1PLRUGIOg28cNtWsvdce4dKE73VGgtyyiKVS7j65yLvrMnPSKfHhw5FEp5kO5Eh96rlNjArCXuTISMCItp0F/Bfk+iDTRc+o07q9dMV/9zJO80n3jNcVbuSGw7NwlxdT9yNfSwvxl0tUWZF5QK3N3edyIxbVgYG7RTLs0udhuVeyaLK71RhiPb4+KpIp1O+f+8+jBQMXgOKKdkg6r2a6V7rugdypKj8Oiacz7Amko0AIzNwFfTIFzo4ZuXloP6J38x/5SQywAxMLGHIwl3gPgR374RMgs5SP+Rv2gndgczRZSTomhlGVKNMHS7kP1TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRY9UbEDG6nTXq04KFID+lWxWkzScTYfxvU19N9FVto=;
 b=UWlSq4iwy+JC67HXwbBoznQuAf4YB75MooFFdX7DgJ1zhb4woxQ/5fSyubcXi483opEFbGxiZH5Gbd7gQzrR787RMaMw1qT1kbBCmnuQDyPReQHzg2CgqRX87ICfhM14e8Ew0ZcnQp1xhlX3YP5i1aa2WQu7czv083xl8OW036M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, <wei.chen@arm.com>,
	<penny.zheng@arm.com>, <henry.wang@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v1 2/4] xen/arm32: head.S: Introduce enable_{boot,secondary}_cpu_mm()
Date: Mon, 11 Sep 2023 14:59:40 +0100
Message-ID: <20230911135942.791206-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911135942.791206-1-ayan.kumar.halder@amd.com>
References: <20230911135942.791206-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|DS0PR12MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f51f141-1b18-4824-fcef-08dbb2cf810b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VJiYg1RMJ5R92LU8zGcShPIcgq280RaOoltvaUXww0Ak2Xu0BAENkw0vBovfBcR4qUdEKyy5h34qDKYMKqCc1BdsuNk2olHB+eDO91oG545Oz9EPAdMEkV9CCEfOTOmMOxp1A1e0U7452flLMYQYmMCn7EoJMUpZQk+LoeIN08XA49dy3dQY5bYiqLCagH4irr06zHXrntufPSHaLUuCbIFQMtVcYWsfiGbuRRti39SBmbvFOB/rMF7ye+FyzeghkdAXZDkQlYjVQypyvI9NjnVdmRN4WHcanf0N4bWGZIzjdXNzb6ESpt9b9GYpq3pirSqIZE8sYwShluqzume6qKxhBJ67d/CO54jciP9OYr5FBdXysMX1rvg9IjPODF9MlrzKx97MlQBeQOnnk7qnKUai1Bte1brC5MxYZ/XnpxOkpP4sJw2bVNhelCcn9U+V9XuiSAI4KiwgBvMksAVH6hq0dL93OqLN+jeKMEn4FSg0GaT4tVzW0e/CLyZePYHMlf/z7uCFzxRzMF8AT8c7c30RhjAA4ZwsqyCpRi0zUvdUS+JB7ToDELodpu8oin/FwM0oz+WCOZhIAPmoQW7t4nKN+0A4JO+rM60+qzacpNxAvJjyeG26/r3/FERisWOByg1MNq2PiBacO9H6SOdbLq7gPk4y594vX4ExZlZFKCjjDSbu34iPi042zhZDqa66H/DGsyNJfou1WN++e7DO7SnOEiluWyJ4UmCoTC0+ScdHY2pA0jeXXaDRHL6Ou2Tge6Ds0l7aot7PGyB0XrabZ0Sr7Z8i1zcsBVBeZlx/YJ8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(396003)(346002)(186009)(1800799009)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(5660300002)(316002)(6916009)(54906003)(70206006)(36756003)(70586007)(8936002)(4326008)(8676002)(41300700001)(40460700003)(36860700001)(2906002)(336012)(1076003)(47076005)(426003)(26005)(40480700001)(82740400003)(6666004)(356005)(81166007)(478600001)(103116003)(2616005)(86362001)(966005)(83380400001)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 14:00:49.5296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f51f141-1b18-4824-fcef-08dbb2cf810b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745

This is based on:-
"[PATCH v6 01/13] xen/arm64: head.S: Introduce enable_{boot,secondary}_cpu_mm()"
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg151918.html

This is being done for Arm32 as MPU support will be added for Arm32 as well.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/arm32/head.S | 90 +++++++++++++++++++++++++++++----------
 1 file changed, 67 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 057c44a5a2..c0c425eac6 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -201,13 +201,10 @@ past_zImage:
 
         bl    check_cpu_mode
         bl    cpu_init
-        bl    create_page_tables
+        ldr   lr, =primary_switched
+        b     enable_boot_cpu_mm
 
-        /* Address in the runtime mapping to jump to after the MMU is enabled */
-        mov_w lr, primary_switched
-        b     enable_mmu
 primary_switched:
-        bl    setup_fixmap
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
         mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
@@ -249,27 +246,11 @@ GLOBAL(init_secondary)
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
@@ -692,6 +673,69 @@ ready_to_switch:
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
+        bl    create_page_tables
+
+        mov_w lr, secondary_cpu_mmu_on
+        b     enable_mmu
+secondary_cpu_mmu_on:
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
+        mov   lr, r6
+
+        /* Return to the virtual address requested by the caller. */
+        mov   pc, lr
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
+        bl    create_page_tables
+
+        /* Address in the runtime mapping to jump to after the MMU is enabled */
+        mov_w lr, boot_cpu_mmu_on
+        b     enable_mmu
+boot_cpu_mmu_on:
+        bl    setup_fixmap
+
+        mov   lr, r6
+
+        /* Return to the virtual address requested by the caller. */
+        mov   pc, lr
+ENDPROC(enable_boot_cpu_mm)
+
 /*
  * Remove the 1:1 map from the page-tables. It is not easy to keep track
  * where the 1:1 map was mapped, so we will look for the top-level entry
-- 
2.25.1


