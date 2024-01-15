Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D62182D90D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 13:49:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667372.1038563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPMP1-0000FJ-Je; Mon, 15 Jan 2024 12:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667372.1038563; Mon, 15 Jan 2024 12:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPMP1-0000CM-Fh; Mon, 15 Jan 2024 12:49:19 +0000
Received: by outflank-mailman (input) for mailman id 667372;
 Mon, 15 Jan 2024 12:49:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0euc=IZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rPMP0-0000Bs-F3
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 12:49:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d22ab1f-b3a4-11ee-9b0f-b553b5be7939;
 Mon, 15 Jan 2024 13:49:16 +0100 (CET)
Received: from BYAPR21CA0011.namprd21.prod.outlook.com (2603:10b6:a03:114::21)
 by LV3PR12MB9144.namprd12.prod.outlook.com (2603:10b6:408:19d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.23; Mon, 15 Jan
 2024 12:49:11 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::b2) by BYAPR21CA0011.outlook.office365.com
 (2603:10b6:a03:114::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.14 via Frontend
 Transport; Mon, 15 Jan 2024 12:49:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 12:49:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 15 Jan
 2024 06:49:07 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 15 Jan
 2024 06:49:07 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 15 Jan 2024 06:49:05 -0600
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
X-Inumbo-ID: 7d22ab1f-b3a4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7Hbmgke0zSQ1Z+9ghQ9Xn0lIUW0PICZJv6ENsTkoHr5nDCFMkK+3G6+PZ/B70Eg5tXt4o1FKeSk5nXFWmEPlRiRLzB+9FTgFZc8OWTte2xHLmSOwY3qD7jyUafZzrDHOe8acIki/1/Z5I8uF+0gq83T4YfeCkieq/jG0JfNusfyHI4YTnMQJkXAfMHvEDQN6T2G7eEQMbbvXi0ge5ioEsmAAyndcwkqWyxCPcTRnzMkVuANpG2Zh8aHZjA6WcD+SgtaEMZQJGtMI2eXU65kpAGDxGdaFUcM5ySzvEkE/UuZZEwZfTuUzsQgJWML//TxdVRonq0Brk9i2PXSffg61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQDEF2iuhtk4R2tIGqGFUXRYJohLUzHLoyqSVuATIKw=;
 b=Blq2QFeRx5x7e9R7ErT8+okeTrhehPPAHLTECddC21Ey1iP4s9s7Foog6W0CdLC9dnm4B5XQa7OzWYBbj0lWHs8W3gmu2LztgRTRppfUbOUYcsHIAP87bMbfKhLAtd0l3LaU95qjKpEFN+5WnYLZ27T2iKB+6cow7NvO//mUQNES6U8J24/I/e4mgs5q/ROyRHsuRqruCYN4SJhT6fhCdvf5lEv8lRXnEyQDBb+8uiAfhNIr+qFkSpaWD67WaZXgBlYOWnlixmJXtpKNqB9bHcstqQmypgg6SI6MTkiihEkOZQMWUO6RRj1GpChAwmpOVozrt89jj02X9oUvoGZXQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQDEF2iuhtk4R2tIGqGFUXRYJohLUzHLoyqSVuATIKw=;
 b=E8P1htWWf33f/GnsNBihRpZoo1MzFcFhPyQQTDruGdNkhnq2OskcEqTnOtFwcd0LP6RnTrcVfuyiFuIaErt1ikqFmn2zEsC6JdVTfQ5m5qZa8ZIwxQ62aT2O3p5NTdKJ3luCsrG+X5eIjLUyQb4t+uJ22U10zLTGAQzI4gDSaEI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm64: head: Allow to use early printk while on 1:1 mapping
Date: Mon, 15 Jan 2024 13:48:59 +0100
Message-ID: <20240115124859.89218-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240115124859.89218-1-michal.orzel@amd.com>
References: <20240115124859.89218-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|LV3PR12MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: 335c26fe-4393-4cca-43ee-08dc15c85f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	njCq5+cfuTg4l8+g9VsWbWm4pNsbDhbsefxtN5IFFSaG/ovDYlu0aTzS5xixDBMf9wzQKazjLIZ/rh08G5cDAnGgOyPUWr7BoRBCMpwo5SyfQmXI/hK5aQbZFNFIE+Wc+fbFHrHZwVcGrOYai9CDLD/PL4YMXym/EQleTxgySPxMZCsN04XxzF8Q1GWKALKk5WyAMLn2XQE93gT9l2S9w/TPFgh4CzQDk+ZGdZELA6GgGksntKOcu5OtzeOKBqBuDqKBdkjDR+A+pRL+TdRaCHVwfS8Ox9b8D2TghSfTVZiiZAXWXECNM7rbP7pI5zJwiZVjGrE/xzzmOLcQD6ESG9K41iXP0LvowdQIL0hswCDh7cpWxha6ES809X4xDwxDRYYeFf3w0H96f80Ag1FJEVy2ZzgFi8pl4ADUBbT35D3kFiCvqO+9108Vpkp/4/yRH00+VihLzVDn1S72BZp17vQxMoF0Pfcsmd9RkLXd09bN3F1vx/ZC+I6nNV+6ZUsoIfzKK43ltgjjAaLhWlKRLe2lQWY2d9DCsjMBBMGCawBzW0MOZac0eLsSMwDg05vq69kwX64Gao2UctxVl3Vjez0Uug+cQXawOo8WJ4L5azX4fu2QLN+k2zMMJu2bZU2+Tpq7ajjPSrZDOSxynfabCbmMIsLx93r4eo5KdDiC3GjhU0p0hmirkln/z/J9+HKREiutD6/UqGGZVouw3cAtvkRZ9xX26rA6fCw6VD7T5Elgxa9yF+LwOi0usBlaLKNAdPLJG1easvvfQxQDxclJ9g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(40470700004)(36840700001)(46966006)(26005)(478600001)(1076003)(70586007)(70206006)(6666004)(2616005)(426003)(36860700001)(336012)(83380400001)(41300700001)(4326008)(44832011)(316002)(54906003)(8936002)(8676002)(5660300002)(6916009)(2906002)(47076005)(36756003)(356005)(81166007)(82740400003)(86362001)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 12:49:11.3199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 335c26fe-4393-4cca-43ee-08dc15c85f33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9144

Take an example from commit 1ec3fe1f664f ("xen/arm32: head: Improve
logging in head.S") to add support for printing early boot messages
while running on identity mapping:
 - define PRINT_SECT() macro to be able to specify a section for storing
   a string. PRINT() will use .rodata.str and PRINT_ID() - .rodata.idmap.
   This is necessary, because when running on identity mapping, the
   strings need to be part of the first page that is mapped,
 - move loading a runtime virtual UART address right after enabling MMU
   (the corresponding steps repeated in {primary,secondary}_switched are
   now consolidated in a single place),
 - move early printk 'hex' string into .rodata.idmap and replace 'adr'
   instruction in asm_putn with 'adr_l' to extend the addressable range,
 - remove RODATA_STR() macro given no use.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm64/head.S               | 13 ++-----------
 xen/arch/arm/arm64/mmu/head.S           |  8 ++++++++
 xen/arch/arm/include/asm/arm64/macros.h | 25 ++++++++++++++++++-------
 xen/arch/arm/include/asm/asm_defns.h    |  2 --
 4 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 9d7d83a5ed2b..cfc04c755400 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -256,10 +256,6 @@ real_start_efi:
         b     enable_boot_cpu_mm
 
 primary_switched:
-#ifdef CONFIG_EARLY_PRINTK
-        /* Use a virtual address to access the UART. */
-        ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
-#endif
         bl    zero_bss
         PRINT("- Ready -\r\n")
         /* Setup the arguments for start_xen and jump to C world */
@@ -304,10 +300,6 @@ GLOBAL(init_secondary)
         b     enable_secondary_cpu_mm
 
 secondary_switched:
-#ifdef CONFIG_EARLY_PRINTK
-        /* Use a virtual address to access the UART. */
-        ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
-#endif
         PRINT("- Ready -\r\n")
         /* Jump to C world */
         ldr   x2, =start_secondary
@@ -480,7 +472,7 @@ ENDPROC(asm_puts)
  * Clobbers x0-x3
  */
 ENTRY(asm_putn)
-        adr   x1, hex
+        adr_l x1, hex
         mov   x3, #16
 1:
         early_uart_ready x23, 2
@@ -494,8 +486,7 @@ ENTRY(asm_putn)
         ret
 ENDPROC(asm_putn)
 
-hex:    .ascii "0123456789abcdef"
-        .align 2
+RODATA_SECT(.rodata.idmap, hex, "0123456789abcdef")
 
 #endif /* CONFIG_EARLY_PRINTK */
 
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 10774f30e40e..92b62ae94ce5 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -295,6 +295,14 @@ enable_mmu:
         dsb   sy                     /* Flush PTE writes and finish reads */
         msr   SCTLR_EL2, x0          /* now paging is enabled */
         isb                          /* Now, flush the icache */
+
+#ifdef CONFIG_EARLY_PRINTK
+        /* Use a virtual address to access the UART. */
+        ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
+#endif
+
+        PRINT_ID("- Paging turned on -\r\n")
+
         ret
 ENDPROC(enable_mmu)
 
diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
index d108dc3a3a71..10e652041f57 100644
--- a/xen/arch/arm/include/asm/arm64/macros.h
+++ b/xen/arch/arm/include/asm/arm64/macros.h
@@ -34,16 +34,26 @@
 
 #ifdef CONFIG_EARLY_PRINTK
 /*
- * Macro to print a string to the UART, if there is one.
+ * Macros to print a string to the UART, if there is one.
+ *
+ * There are multiple flavors:
+ *  - PRINT_SECT(section, string): The @string will be located in @section
+ *  - PRINT(): The string will be located in .rodata.str.
+ *  - PRINT_ID(): When Xen is running on the Identity Mapping, it is
+ *    only possible to have a limited amount of Xen. This will create
+ *    the string in .rodata.idmap which will always be mapped.
  *
  * Clobbers x0 - x3
  */
-#define PRINT(_s)          \
-        mov   x3, lr ;     \
-        adr_l x0, 98f ;    \
-        bl    asm_puts ;   \
-        mov   lr, x3 ;     \
-        RODATA_STR(98, _s)
+#define PRINT_SECT(section, string)         \
+        mov   x3, lr                       ;\
+        adr_l x0, 98f                      ;\
+        bl    asm_puts                     ;\
+        mov   lr, x3                       ;\
+        RODATA_SECT(section, 98, string)
+
+#define PRINT(string) PRINT_SECT(.rodata.str, string)
+#define PRINT_ID(string) PRINT_SECT(.rodata.idmap, string)
 
 /*
  * Macro to print the value of register \xb
@@ -59,6 +69,7 @@
 
 #else /* CONFIG_EARLY_PRINTK */
 #define PRINT(s)
+#define PRINT_ID(s)
 
 .macro print_reg xb
 .endm
diff --git a/xen/arch/arm/include/asm/asm_defns.h b/xen/arch/arm/include/asm/asm_defns.h
index ec803c0a370c..eecafd3b39ef 100644
--- a/xen/arch/arm/include/asm/asm_defns.h
+++ b/xen/arch/arm/include/asm/asm_defns.h
@@ -27,8 +27,6 @@
 label:  .asciz msg;                             \
 .popsection
 
-#define RODATA_STR(label, msg) RODATA_SECT(.rodata.str, label, msg)
-
 #define ASM_INT(label, val)                 \
     .p2align 2;                             \
 label: .long (val);                         \
-- 
2.25.1


