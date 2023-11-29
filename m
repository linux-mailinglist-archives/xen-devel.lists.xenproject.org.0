Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 926407FD1B2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 10:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643764.1004225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8GX9-0005ZW-Uq; Wed, 29 Nov 2023 09:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643764.1004225; Wed, 29 Nov 2023 09:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8GX9-0005XB-S7; Wed, 29 Nov 2023 09:07:03 +0000
Received: by outflank-mailman (input) for mailman id 643764;
 Wed, 29 Nov 2023 09:07:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rgXt=HK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r8GX8-0005X5-FV
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 09:07:02 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a63c45ad-8e96-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 10:06:59 +0100 (CET)
Received: from CH0PR03CA0118.namprd03.prod.outlook.com (2603:10b6:610:cd::33)
 by CH0PR12MB5075.namprd12.prod.outlook.com (2603:10b6:610:e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 09:06:55 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::40) by CH0PR03CA0118.outlook.office365.com
 (2603:10b6:610:cd::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23 via Frontend
 Transport; Wed, 29 Nov 2023 09:06:55 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Wed, 29 Nov 2023 09:06:55 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 29 Nov
 2023 03:06:54 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 29 Nov
 2023 01:06:54 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Wed, 29 Nov 2023 03:06:53 -0600
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
X-Inumbo-ID: a63c45ad-8e96-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARPk8CvJ45kBQANhdUcHImMW/IxIBeZ8vAkmj7b5k/T3QIIo1+GEzCTJbVEimINIx4iglx6D0SPdfWNqgulNJWXDP85VANWmg3ALBTcnVnGLf2cjTkezjeWzw4E3ILOPxjdXp4c6trUt3CMW76J6YemSPnt1+d+P16bX2ohhfbHkvxBPPK64vI7cFpu20296ZySX8DAmdOK2NkeAwV1SX/LBmdFJ9VnGumdf0J2gr+99ORzVNYr/TNwUA/6OosA4ZLdUGzNyEj3IgdSytVKeYN+B348OP9GH3yjnDsHxtzIAhECtMwybAzOOm48F0Co35rMPxGVlMZ+aLdkIvHxrPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGUKd9Al4IUUb1ICrxBp73pRFL1/0iuKpdeLmfFpWNw=;
 b=CNbkHFi9oTJMBIbEWOVq1biKBUkuN7u9jX1nAib/67Ho0AIhL3FvwcebpILa6c45ZNt6VJ2xg460Nv8LzyhCEA+WrpW/iibt/AocvqquRJmn4vG1LJ5ydkWJ4adhRDlVQnScmUbyu10WSGpufsMBDRM++vYUd23cnyUARfqkAnuBohlo9fY0uuA+sBD4pcg1VLvF5gaKklMqTnOwIrOwwz4Bsrglc1AvEWs8Jq4SfF7J9v4iStRbPaUgJGpO2ynfAs5dANx7Yf5aonvpmNXAH+hLvxYJiXcQ4e+x6/uzSZx3T+yclQA+IB5BcyvkfI29/x1WnhA91e4xUBnslDFLGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGUKd9Al4IUUb1ICrxBp73pRFL1/0iuKpdeLmfFpWNw=;
 b=F8lXr0AUl0KEWc7432si4MYf6Y0WM/fx6q76dR2hZkM3ao/PcBaBEL9csMX3j2eFU1+FMBaZ129+nmGdr997e4MkOdPdq0bk3iLDai/SP4rGCYU2YG7PoM48V54uRR0s1BI0mtzUIqE6a4nHyFoOfUCArx8I+5FZpDZZQKB9qtE=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2] xen/arm64: Move print_reg macro to asm/arm64/macros.h
Date: Wed, 29 Nov 2023 10:06:45 +0100
Message-ID: <20231129090645.26137-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CH0PR12MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9edc58-0a1b-45ed-824e-08dbf0ba88f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	o5Mi8K6B3s7x1ydjtDC7+Z70kJjjStO80rGqPjRquEinKdoSNvNUHrC3ZKZTdQ4kQXyQrkYDrxq/7DMZzdnAv90Dvff2HWTHHzDSIN2ExuaULIQDe8VwADLZAWSIX4jgJBGdkGeDs3ST6+iAWRy8m+IyYfqnYnIIaThjxzuNQzHQN7fzWFPIbj6o2uK6ofY/7oADwGAQKQWdV2zItZ+SgE/gIczgIGQ0aKjgcOPe1IEa3a5GbcQtkdYtEvvV+2ebD/jBQ9vrGUn886OyECTlNxexSXUwaHuIPdgE9GsyCBy3ut2RK7q/GUwLid5OAEB7U5Q6r0NQBeyqF5Ii6cIOuq0JDwChPWmlxQpxIV9ONYQdQF34hS3WOWlLGX8vuXfG4mkD8+LNLLdMTwY5szhUl+Lw6YnfCg1w8QbekHKzk4JIYF5aTTuZChh6UkinPkO26mEBveMoA1Qn1TcDvtL79KxGX0nZGp9ir8Pfx7s3XFnwyOJm6xPE+Ls9HYmR7MPgfr1JA3OrvmVp2WNnubfIKEtjonobDGHTFT8MzR44vXoX2Yv2+zmzDC8fuwilTuM0Me+mJdsYMwdW+fWZRK4cnS1EuprrTbVFxIv5yXVMahjGIgB9w8rsG/onJZgnquo5eniHptZxEldxP3xptW/2CqOUznTWsMldOLsdeUO6X77ingPUeQjNZCtl29YWMmO629uNaTN0HUBGHF2K30FB0Xi1snGtx2lCTxcJiD7d5cM+f45BvmiO5eZ76FcnY1B+8lUj3a0iHW6ayb2QBxL5JQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(186009)(82310400011)(1800799012)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(2906002)(40480700001)(44832011)(70586007)(41300700001)(70206006)(8936002)(54906003)(8676002)(6666004)(4326008)(5660300002)(478600001)(47076005)(2616005)(336012)(26005)(1076003)(83380400001)(426003)(316002)(6916009)(36860700001)(86362001)(40460700003)(81166007)(356005)(36756003)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 09:06:55.4781
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9edc58-0a1b-45ed-824e-08dbf0ba88f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5075

Macro print_reg is used to print a value of a register passed as an
argument. While today it is only used from within the common head.S,
in the future we might want to make use of it from other files, just
like PRINT(). It also serves as a great aid when debugging.

Expose print_reg macro by moving it to asm/arm64/macros.h and:
 - rename putn to asm_putn to denote the usage from assembly only,
 - use ENTRY() for asm_putn to make it globally visible.

This way the behavior will be consistent with what we already do on arm32.

Take the opportunity to get rid of unneeded stubs for early_puts,
init_uart and putn since the calls to them are already protected by
respective #ifdef CONFIG_EARLY_PRINTK.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v2:
 - re-sentence the stubs removal in commit msg
 - patch split out from series (others dropped)
---
 xen/arch/arm/arm64/head.S               | 32 ++++---------------------
 xen/arch/arm/include/asm/arm64/macros.h | 15 ++++++++++++
 2 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 8dbd3300d89f..9d7d83a5ed2b 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -74,25 +74,6 @@
  *  x30 - lr
  */
 
- #ifdef CONFIG_EARLY_PRINTK
-/*
- * Macro to print the value of register \xb
- *
- * Clobbers x0 - x4
- */
-.macro print_reg xb
-        mov   x0, \xb
-        mov   x4, lr
-        bl    putn
-        mov   lr, x4
-.endm
-
-#else /* CONFIG_EARLY_PRINTK */
-.macro print_reg xb
-.endm
-
-#endif /* !CONFIG_EARLY_PRINTK */
-
 .section .text.header, "ax", %progbits
 /*.aarch64*/
 
@@ -493,11 +474,12 @@ ENDPROC(asm_puts)
 
 /*
  * Print a 64-bit number in hex.
+ * Note: This function must be called from assembly.
  * x0: Number to print.
  * x23: Early UART base address
  * Clobbers x0-x3
  */
-putn:
+ENTRY(asm_putn)
         adr   x1, hex
         mov   x3, #16
 1:
@@ -510,18 +492,12 @@ putn:
         subs  x3, x3, #1
         b.ne  1b
         ret
-ENDPROC(putn)
+ENDPROC(asm_putn)
 
 hex:    .ascii "0123456789abcdef"
         .align 2
 
-#else  /* CONFIG_EARLY_PRINTK */
-
-ENTRY(early_puts)
-init_uart:
-putn:   ret
-
-#endif /* !CONFIG_EARLY_PRINTK */
+#endif /* CONFIG_EARLY_PRINTK */
 
 /* This provides a C-API version of __lookup_processor_type
  * TODO: For now, the implementation return NULL every time
diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
index fb9a0602494d..d108dc3a3a71 100644
--- a/xen/arch/arm/include/asm/arm64/macros.h
+++ b/xen/arch/arm/include/asm/arm64/macros.h
@@ -45,9 +45,24 @@
         mov   lr, x3 ;     \
         RODATA_STR(98, _s)
 
+/*
+ * Macro to print the value of register \xb
+ *
+ * Clobbers x0 - x4
+ */
+.macro print_reg xb
+        mov   x0, \xb
+        mov   x4, lr
+        bl    asm_putn
+        mov   lr, x4
+.endm
+
 #else /* CONFIG_EARLY_PRINTK */
 #define PRINT(s)
 
+.macro print_reg xb
+.endm
+
 #endif /* !CONFIG_EARLY_PRINTK */
 
 /*
-- 
2.25.1


