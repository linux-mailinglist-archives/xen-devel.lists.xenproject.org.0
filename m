Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 641067F1631
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 15:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636902.992616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55ad-00046e-Rb; Mon, 20 Nov 2023 14:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636902.992616; Mon, 20 Nov 2023 14:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55ad-00043g-OP; Mon, 20 Nov 2023 14:49:31 +0000
Received: by outflank-mailman (input) for mailman id 636902;
 Mon, 20 Nov 2023 14:49:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G1Kk=HB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1r55ac-0003gw-9T
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 14:49:30 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 004ca22c-87b4-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 15:49:28 +0100 (CET)
Received: from SA0PR11CA0058.namprd11.prod.outlook.com (2603:10b6:806:d0::33)
 by PH7PR12MB7258.namprd12.prod.outlook.com (2603:10b6:510:206::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Mon, 20 Nov
 2023 14:49:23 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:d0:cafe::ca) by SA0PR11CA0058.outlook.office365.com
 (2603:10b6:806:d0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Mon, 20 Nov 2023 14:49:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 14:49:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 08:49:22 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Mon, 20 Nov 2023 08:49:20 -0600
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
X-Inumbo-ID: 004ca22c-87b4-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcswAyPTmsFMmosFnLKnAoE178CADe4MgXwIt28kRJGI/P8EMk4EdXdFQhZ5YZ42U7j+zi6/hy9wethwCDwvDyXn1f9PuQUvGhTpk61G6//ollQn89EL0Dy+kLEnDa55YwLywfs50ilf3X4soXURGV4sfk4VUVtveQEGebnPyQgWowTm9f9+1LWv9qMN1IBoto/98v5cyiNo6wEsPrDHGDu6FiFPRxef3O90z/9N0nmCq84Lypgl4p2JxKMbJtVZH0GHhTX9NaFsxqUox07hjskP0B6g3zZsaPLr+yPtAruKeLBllKYp6CcYHsl58Tzexhn58VhSOaoGBA3p/+UmgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZJrjolNjBjdGBvrhoUS/DFn0b4f+Qhe6XXmL49qaf0=;
 b=CjJo7VSGaudaXwsjhp13OjyEJG711Yz8vxm4tlcFiQZ0haf+1vPZ0QerrRuoLkdM4sP2HyWUy9G3kqABdgcomniTQPPE5jOPQR0wJUvrpC9/ifqgaPj+7n9BL21tvTtb/593cfko4+hRg7JYLHjUodsOBJDKJidWGlht6Z+xSzch0CL2d/1fglVDaOpjf8nB1w07KsZuZbhMzPqIbrzeR2VVY7op3fOjRIESm5pdt6Vye9TMyLbQldi8uXYPCK8S7Sa4qxtTqssdawLvDWXY2SJmUBDcYSvQdQJY0or7UfDxztTNVcNyElUxUmtmMcTCqcWUVROWRq1ydzvZeVY8Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZJrjolNjBjdGBvrhoUS/DFn0b4f+Qhe6XXmL49qaf0=;
 b=rVk1rLNg12pK1qpoNAzOAI7S0ZCQjy4bKZ0+XIOBN0iY8TtG4DjYbKA8WwaM33MlxVnhYUlcHwoa320l96h2yAb3pg1y/y0duazwqX338rt7Awf5IxPXlv0ktnYV77icL/bT4FqwbMZ/VakE1o8eEGaaSYpgZvld9kcBeU2/Dts=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <henry.wang@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v5 1/2] xen/arm32: head: Introduce enable_{boot,secondary}_cpu_mm()
Date: Mon, 20 Nov 2023 14:48:58 +0000
Message-ID: <20231120144859.170965-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120144859.170965-1-ayan.kumar.halder@amd.com>
References: <20231120144859.170965-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|PH7PR12MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c7e579-785f-478b-522f-08dbe9d7e259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YRa1wklsbmrpKW043pvyjzCoXUq+7tvnrkDePI4U6NBDKqTSW4jZ2caJyZqPMWut023mHpiJVTyzBjuVzq6imaGC8FEeg788RKwRFvGuCISOB+lwx0NyycfH5XRkm8/FSreL2htSGIksgedHc5/HOgtmz+1xErBvsDNdpoJGdK/3DxGVXe0puJZaQSCL8FLE7LqpbxH7dCKHrFhemkv2O5+9Q/SrwTE6ffikU4B3uMpb+LCHTr1tJIl8zKblGRnoXKkxOb3A4VsehcZCo8M3IgzOywzOvlnSz+0rh2NRJbAMLbX56ivunIWdb081AvtrD+2mwLBFEAOyX5b8DQnu22lpBS+PjvQY78FyjhoH88W5irpYnWuVIRS9Ytqx9zLxSe9XH/LQUwr5rKYUwS8t/9bzKA2jEYpvYinCowTwHGA+rlnZEUyOFrzUjlv7zJZwc6Ie2BvVf86j5fRb7li+0DZ5gbiQvdzl8Rxgv90LCFo4Eowzg4KFB6JpVtGlnag2MJB1KR4oU1ccjlrQ/iRYnUxm57Xf34b2HukLLoPkYUlIPFZbsiJgNYlIbkB2vKAeV5AczruDHQUEbMtxR/nWHluETzssBLQpStC+J9zYMsFLQnrnkQoz2yk50IUAwuxLylqSUB8MH7J5NqsgMbep1q8hXvktarrqwkycXKwCZtFn1x5Ovce3Wa6KpXK/jqXsSkrywjahNa46W+wRzLzSXsuFhfEU/CPqyTbMaCOyPSMY9EB3hpJnqHJQkej4Qur/a9YgkW8Qv4z+WjpnZwWtyv3Co7CLIvDBDXpGM3we1dY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(82310400011)(1800799012)(64100799003)(451199024)(186009)(36840700001)(46966006)(40470700004)(336012)(426003)(6666004)(2616005)(478600001)(1076003)(26005)(83380400001)(8936002)(40480700001)(82740400003)(6916009)(70206006)(54906003)(316002)(4326008)(70586007)(8676002)(81166007)(47076005)(36860700001)(356005)(5660300002)(2906002)(40460700003)(103116003)(86362001)(36756003)(41300700001)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 14:49:22.6552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c7e579-785f-478b-522f-08dbe9d7e259
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7258

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

v3 - 1. No changes.

v4 - 1. Fixed a comment in enable_boot_cpu_mm() 

 xen/arch/arm/arm32/head.S | 102 ++++++++++++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 3011fb34aa..52fbb180ef 100644
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
+        mov   lr, r6
+
+        /*
+         * Prepare the fixmap. The function will return to the virtual address
+         * requested by the caller.
+         */
+        b     setup_fixmap
+ENDPROC(enable_boot_cpu_mm)
+
 /*
  * Remove the 1:1 map from the page-tables. It is not easy to keep track
  * where the 1:1 map was mapped, so we will look for the top-level entry
-- 
2.25.1


