Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEB3817C01
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 21:34:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656386.1024502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFKJE-00042W-RB; Mon, 18 Dec 2023 20:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656386.1024502; Mon, 18 Dec 2023 20:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFKJE-00040g-OS; Mon, 18 Dec 2023 20:33:52 +0000
Received: by outflank-mailman (input) for mailman id 656386;
 Mon, 18 Dec 2023 20:33:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wqZ=H5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rFKJC-0003D2-Mt
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 20:33:50 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf0886fe-9de4-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 21:33:49 +0100 (CET)
Received: from SA9PR10CA0013.namprd10.prod.outlook.com (2603:10b6:806:a7::18)
 by DM6PR12MB4076.namprd12.prod.outlook.com (2603:10b6:5:213::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 20:33:43 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:806:a7:cafe::73) by SA9PR10CA0013.outlook.office365.com
 (2603:10b6:806:a7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Mon, 18 Dec 2023 20:33:43 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Mon, 18 Dec 2023 20:33:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 18 Dec
 2023 14:33:42 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 18 Dec
 2023 14:33:42 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Mon, 18 Dec 2023 14:33:41 -0600
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
X-Inumbo-ID: bf0886fe-9de4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Opqnm9EEJLhIvYbZ6SjsVqI1E4aLl8pBcSV1nXmSYi+pq8JY6edpR/gea5HFEaqfUFcHGZto7GlJppkWrD853/P1AxMqtSOd0avS+ayemYYS4V/w3tWndkrkQsV49OTL+3n6tXkBdTsk2WCksz8esSqHxBNlRDC3jjDjBk+oHaWN4GPZLgAEoBVgwL5aGCNpRIUlx6PulmT0aOeyYFAfRyPCabRZRCEx/g1tHu1SZb/D6pJeVvH2qT/yi9aandeqn6ZT3R6sn7ohLzBVRTPpM7tNodE/Eb997e1Rfz8lWNk1jHBPf4NrxvNJmrbPFdTrjgmzWQq2pEQjCsK4SyY/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smYuQZK3qvIyePU2wMqadUuqF2Ed1vqa9lCU8cNIDlI=;
 b=DyjMtWF6HTUAcHOTky9EuuSAtxBHqVS3K1HzAsgaG7cMR1um3XBfAtZw2afL5M/iWI6VfnaR/eC7bT86OnVPun8vjHjUYQvcf1Lan2tmPpw/qlbqBGvarCNjw6462B78OgLRLtagBsVnLdBWCN3XbzKSwdNB3X9FyIzDW6Vg/s3HApowFBDMFAE9wbmyoKEeZZsv9ngOahMQTlQE+Ako6aC7GFuzFgJM2viKuM7JEOsc4gbsWLXUTS9PqO5Aq5NvvGxIIeqiz885BcLOFqkDnhR5tz+HDaNJMQjisqFS5fm7erwIrf6DKME89luPHvAdwP7hJEPt5HKSXyF/x996ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smYuQZK3qvIyePU2wMqadUuqF2Ed1vqa9lCU8cNIDlI=;
 b=j048MfKM6lNd5D1smEapVQnh8heSRVPLJes3syCQtpeu5X2rXoiMJdWObH4gZ6kYJVl+/hYUeZChSZj/2h7ACFUqsY5PRdJCBB6Z4+N8y/htfiN8igsX7frGrah1GRM1NfmBEr2eGKuDCjCur3QPbMRUUj42lLTPanXXW2Ygfes=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <julien@xen.org>, <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <stefano.stabellini@amd.com>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 3/3] xen/arm: Introduce "partial-emulation" xen command line option
Date: Mon, 18 Dec 2023 20:33:39 +0000
Message-ID: <20231218203339.1394354-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|DM6PR12MB4076:EE_
X-MS-Office365-Filtering-Correlation-Id: 9867b0e7-f1eb-47d0-9712-08dc0008a07d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JY3NktIUuNsKzBEX39wHwjMBe8O9RLkM491/2atcuUloDS3L2Uo5XWp451nMvDNb7brQSg548/xGWjFFaSgSLoJoFROIM+TucTjdTCmzYjNyO9jWHXqHo3xDAyL68LRDShQ4ILbFpbmNhIdqv1ytHfsmVaNfSmbleDwzc0awkzN3vpM3nOnQMyhM14OgJ2DWzn2ewTQlxMK8yt+IY2BOnMmz0o1i8nKvIeYGD/NDesu+O0SJsKt/sCZP7r/DF9HsGf3ZdyMr1wWUxazrfxhLRCabPurlw0YlWQtpGvJhSJdCQhpTTCv6GICdjMf9AYBzBknJ1268tkoq1J7cZNZOqadf3oKGqow5+YX/6Jnq9y4zYui0nPR9O8us6h3Bc7oovxxR6AgWwmXOPYshK3RNI0ZI4cFSAQbORweBHGu+/2X+1wmuNP2AtzOV8MEVavmuWVM1TYdj0RRFT0ralFYx9W3PfqGWSWz2O7z5GFROYU98wNJkyteJUPmsEnhr15U7sgunzVhBzvIyF0RNp+jWxiCGqXbCD41sLLneu/OakgsBXUiQ7ecV/fSLLgh9WieKeSV1enKApUxPBalScrGPU80YfsW0vEmcYgGXlOZDyXD8TtBRRAyRXmdNNYOoRoUgcjbFq80kYkjB/w5kRC5ANoctPgvOqUi+hV7PrPtW9QITAyD1mPJJz59Bf9jWJFNthHBeL678jJHtnC05Cb3MDXwkfM7kWP7UCLGeb/BYNqbtdM77B+rgH6z43BU5bjKqMn5GTgSMPSwrDgQocwIIfQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(1800799012)(64100799003)(82310400011)(451199024)(186009)(46966006)(40470700004)(36840700001)(36756003)(316002)(6636002)(83380400001)(336012)(426003)(110136005)(70586007)(70206006)(40480700001)(8676002)(47076005)(2906002)(8936002)(5660300002)(36860700001)(4326008)(26005)(478600001)(1076003)(2616005)(86362001)(81166007)(41300700001)(40460700003)(356005)(82740400003)(103116003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 20:33:43.1153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9867b0e7-f1eb-47d0-9712-08dc0008a07d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4076

This option is used to enable/disable partial emulation of registers at runtime.
While CONFIG_PARTIAL_EMULATION enables support for partial emulation at compile
time (ie adds code for partial emulation), this option may be enabled or
disabled by Yocto or other build systems.
However, customers can use scripts like Imagebuilder to generate uboot script
for booting Xen. These scripts can use "partial-emulation=true" to support this
at runtime.

This option is set to false by default so that customers are fully aware when
they enable partial emulation. They can also disable it without the need to
rebuild Xen.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1:-

1. New patch introduced in v2.

 docs/misc/xen-command-line.pandoc |  7 +++++++
 xen/arch/arm/arm64/vsysreg.c      |  5 ++++-
 xen/arch/arm/include/asm/regs.h   |  6 ++++++
 xen/arch/arm/traps.c              |  3 +++
 xen/arch/arm/vcpreg.c             | 17 +++++++++++------
 5 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 8e65f8bd18..dd2a76fb19 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1949,6 +1949,13 @@ This option is ignored in **pv-shim** mode.
 
 > Default: `on`
 
+### partial-emulation (arm)
+> `= <boolean>`
+
+> Default: `false`
+
+Flag to enable or disable partial emulation of registers
+
 ### pci
     = List of [ serr=<bool>, perr=<bool> ]
 
diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index 0fa8716884..02497c9fef 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -192,7 +192,10 @@ void do_sysreg(struct cpu_user_regs *regs,
     case HSR_SYSREG_DBGDTR_EL0:
     /* DBGDTR[TR]X_EL0 share the same encoding */
     case HSR_SYSREG_DBGDTRTX_EL0:
-        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
+        if ( opt_partial_emulation )
+            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
+        else
+            goto fail;
 #endif
 
     HSR_SYSREG_DBG_CASES(DBGBVR):
diff --git a/xen/arch/arm/include/asm/regs.h b/xen/arch/arm/include/asm/regs.h
index f998aedff5..b71fa20f91 100644
--- a/xen/arch/arm/include/asm/regs.h
+++ b/xen/arch/arm/include/asm/regs.h
@@ -13,6 +13,12 @@
 
 #define psr_mode(psr,m) (((psr) & PSR_MODE_MASK) == (m))
 
+/*
+ * opt_partial_emulation: If true, partial emulation for registers will be
+ * enabled.
+ */
+extern bool opt_partial_emulation;
+
 static inline bool regs_mode_is_32bit(const struct cpu_user_regs *regs)
 {
 #ifdef CONFIG_ARM_32
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index f5ab555b19..c8c00d2dd5 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -42,6 +42,9 @@
 #include <asm/vgic.h>
 #include <asm/vtimer.h>
 
+bool opt_partial_emulation = false;
+boolean_param("partial-emulation", opt_partial_emulation);
+
 /* The base of the stack must always be double-word aligned, which means
  * that both the kernel half of struct cpu_user_regs (which is pushed in
  * entry.S) and struct cpu_info (which lives at the bottom of a Xen
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 52a8732423..6bf417487a 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -578,12 +578,17 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
 #ifdef CONFIG_PARTIAL_EMULATION
     case HSR_CPREG32(DBGDTRTXINT):
     {
-        /*
-         * As DBGDSCRINT is emulated which is architecturally mapped to AArch64
-         * register MDCCSR_EL0. MDSCR_EL1 is not emulated. So DBGDTR[TR]XINT can
-         * only be accessed as EL0 level.
-         */
-        return handle_raz_wi(regs, regidx, cp32.read, hsr, 0);
+        if ( opt_partial_emulation )
+        {
+            /*
+             * As DBGDSCRINT is emulated which is architecturally mapped to
+             * AArch64 register MDCCSR_EL0. MDSCR_EL1 is not emulated. So
+             * DBGDTR[TR]XINT can only be accessed as EL0 level.
+             */
+            return handle_raz_wi(regs, regidx, cp32.read, hsr, 0);
+        }
+        else
+            goto fail;
     }
 #endif
 
-- 
2.25.1


