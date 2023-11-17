Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476A67EF54E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 16:31:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635279.991151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r40oe-0007ab-4F; Fri, 17 Nov 2023 15:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635279.991151; Fri, 17 Nov 2023 15:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r40oe-0007Xs-0f; Fri, 17 Nov 2023 15:31:32 +0000
Received: by outflank-mailman (input) for mailman id 635279;
 Fri, 17 Nov 2023 15:31:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0J2k=G6=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1r40oc-0007I6-At
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 15:31:30 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 608aee9c-855e-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 16:31:29 +0100 (CET)
Received: from BN0PR04CA0207.namprd04.prod.outlook.com (2603:10b6:408:e9::32)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 15:31:22 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:408:e9:cafe::dd) by BN0PR04CA0207.outlook.office365.com
 (2603:10b6:408:e9::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 15:31:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 17 Nov 2023 15:31:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 09:31:21 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via
 Frontend Transport; Fri, 17 Nov 2023 09:31:20 -0600
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
X-Inumbo-ID: 608aee9c-855e-11ee-98dc-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQaHcboAFL8R+KCKw6CvPjx19R9qM736gWcEk7MwLr2UAg5pG9qT9KPvmRo+x0gK6OFDNBb9BkozM78p960NBUBE5YURCqaxSXptOPoPeqWjK4yPc5bA8WlW1OTEy6O9UkQS5+Bv2wm5G4EsbPLCA2l5hIM9r6VKIDexxXz0wRtglo6losEbaflXPivCtFc+0AZ6S9+PBC9qDiJGHFHs2LpGXVgXivzmYkM2amkMer+VhpXcFfZldEatZiJbGuLF9SJ4mQ87mS4o79ouD7+Cz7cyyY6m6GrP8woEpc1PiqXLS98vb4eCZdXt0FNYkxHEQW/GdvUGadBKz+O/yEZ1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OihA4Qmlj5uSZ4Y3TMJU9MouaJQymzPglqZ/HF/KsjM=;
 b=MNdud67l7QJIVeIk9Zd/vnskzBi86kB6Z728sm+apOAVJbaFlNhYlEniwiZ+NmBhy5RuhnH6jYxd2bx4wYrMe3QS9ti+N0k/OmP9rUalcCKHrxwW//HRuDhBCs5lBvZFanRi42eTHkWFMt8Z6rGvqqccg6nC4HFe2DEVFbrM0lB55vOnUV4QcTEj6ffbV7Ytv96PcwnJhkgn9VbZ9QHJNEjOYS3zz9lnBZwh9JhRdeWJlIU8hH1xE9K9O5oVtFI/MW6664WkmZ8v2AOL3bJr1r/9ZbzEY/AolQe6PMAbwYXgkYiDvUra2/sm/Pt24u0PiV6bnYMoS6S60WULESTsLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OihA4Qmlj5uSZ4Y3TMJU9MouaJQymzPglqZ/HF/KsjM=;
 b=MnPMkjQMfqffLC2FF+c/RpdfbgVygGb7mENnaKjS0DEtoWa5Pq2B3cmyhuZDWvnR67XjMF9oQTSCYt3TVjvpYgRGbtpDPgHJV235Zd7TvG0lGpl5whV6oQGO/8/6/Vg+I3bmEluUjBJOnMvKHp6qIHiplA9K/ZPBpW+LGxDjO+k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <henry.wang@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v4 1/2] xen/arm32: head: Introduce enable_{boot,secondary}_cpu_mm()
Date: Fri, 17 Nov 2023 15:31:00 +0000
Message-ID: <20231117153101.2902792-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117153101.2902792-1-ayan.kumar.halder@amd.com>
References: <20231117153101.2902792-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|MN2PR12MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: bc628910-673f-4db8-1e36-08dbe78240b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l/YQiaX00DZRWoSE8TDZOd0GkpPd3a5sWhPmS5oT3rfgpx2MMAD4SnJs3AHrqh1BpGDJNzimgB2Tk3r3fGMenVT+1HP7ZhDTJilqE4kkfjZjXWObO/489aAJ4C3v+TTECXxQA9GB0U8p47WzNbvya1dEAWsBxA9WYLML32H4sF6Rv6Yhvl011QDjMb1fdRTbfySK7UjAKnx83+wzGpjY5SlFgT6TGKOUq0jLEr+1IWmQjM9trx065gExFnG6XXV5a0TK+sPLubKGBu70R8vcu1kE+hblePZkRVIRLdbPTYoBPKq8ol1xRoIa541sn6tkCbQ1tLZWJYv3G1Qc5rgy9/nIjJEzTnpUhl55KmWcOLNuyQiI4a7DgoP/TgUizoXedUJsX/n8nVewIy7uYHuIJ2BsUXIa8sDuwpgjymitFyBC4mv/ga6aufcnuUZcavRYi4ccG5VA01NWq4m6SdcPh5jII26GMMDNcVhplNG5FhTXyX6/5fBIWLyU8MIQATw9JVOz1djaXxCSSMuSLf+4ZvY1gp+eSvQDEtO2hgA1qFwJ9jmuKnqeEb3xjIY03VLTWVV0Sl9EtMLByb2eE4UMKIkS1mx7my8uJCMkPkSjP2mphvlgh+GCWQItgujLNikNdvSHCEUrf7rfV2K3iQtVkM3RtRsKzmNdENStZ1hDNgfpAcNRhr8LC4lzh8L5r3RHnRBkqPRRsNBOv3CvHpJYhylvzCZ3gD7IGGoRTpZtqL+V+9Om0Em1ybIKX99TUWqSKWb/u4+aE7/6sJ4jAWvmss4SRQc/icFP8uIxDzSMFMU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799009)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(478600001)(40460700003)(70586007)(426003)(336012)(54906003)(70206006)(316002)(6916009)(81166007)(356005)(41300700001)(36756003)(86362001)(82740400003)(2616005)(103116003)(26005)(1076003)(36860700001)(5660300002)(4326008)(8676002)(8936002)(47076005)(2906002)(83380400001)(6666004)(40480700001)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 15:31:21.9677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc628910-673f-4db8-1e36-08dbe78240b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470

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

 xen/arch/arm/arm32/head.S | 102 ++++++++++++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 3011fb34aa..b3f6d111b0 100644
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


