Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB4D79A874
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 16:01:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599443.934898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhTR-0006sN-DN; Mon, 11 Sep 2023 14:01:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599443.934898; Mon, 11 Sep 2023 14:01:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhTR-0006pL-8j; Mon, 11 Sep 2023 14:01:09 +0000
Received: by outflank-mailman (input) for mailman id 599443;
 Mon, 11 Sep 2023 14:01:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S94K=E3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qfhTP-0005N8-B6
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 14:01:07 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a666a1b7-50ab-11ee-8784-cb3800f73035;
 Mon, 11 Sep 2023 16:01:06 +0200 (CEST)
Received: from CH2PR04CA0008.namprd04.prod.outlook.com (2603:10b6:610:52::18)
 by CH2PR12MB4328.namprd12.prod.outlook.com (2603:10b6:610:a6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 14:01:00 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:52:cafe::ea) by CH2PR04CA0008.outlook.office365.com
 (2603:10b6:610:52::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 14:01:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Mon, 11 Sep 2023 14:01:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 09:00:54 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via
 Frontend Transport; Mon, 11 Sep 2023 09:00:53 -0500
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
X-Inumbo-ID: a666a1b7-50ab-11ee-8784-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dvb1ASgV803bOS/IKi1FVDCGSEXUMJiIzW+GOOck7TWQG1ntkbtYRPHIeya/kLuTz2ccACmHfOjOfdc2NSXnCHdY4aVN9uPCT3ytywBn96kiFHVp3ulA+/Nc6L3884Owg/MJ/S9Gml/DqhnrRxHf28Bq4zaLHVPXzPCl/cf9ti0V1/bHJ4VdSnK1vyC6KuXTXcRjgGITE8/uv190vUv6aO8Bsmekfhp93IZKdBmPfn1MQbbu0ByXmyrxeN7xtS32Ugx3HdlEFoxf/96DBC0gHn0EHuDyKE8M4fFs/bp1nYQ8AvDwCidhzzDAJHeIt3MnO8fzqpKZXGT7lPbL//eGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZ03rabC0ifyCB6txpZL3Bm38Ko4qgK8bj669nLmS5M=;
 b=PjYPtyJWNc3Fj4h7u4GB6qVq9fP5nNbEGcjsFCV/idX+fbT58vQfElvxx6K+5aU83fBDODh2yBdWk1qiYpghzW9C3ugu6NjyzXcHl7YQpYf7axeahuPpERhP66W3pGGXl5xenp/CDenzvbQLVmiG/oE0YIOCyzSDDRvaY9r2e6fdmWeJGZtSVwiavlo0EDRxMuA5FPZW+85Id4sw5f2hDwKZNGw4HddUCsh/hVmon7SZbzVl3tyv9UTPnGk8/9eTFlEPDqZUkTC6EhblWlpAneD+8RNqpS3Q8GiE/fidMyFmBfiJ7/I5G/+KLgBV0pXljkD1rzOcDa2M2NftwGac6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZ03rabC0ifyCB6txpZL3Bm38Ko4qgK8bj669nLmS5M=;
 b=X8Mjjek0VrIGfA2Y9iYnpE5b/aN3a2KTI6tu3vUBc9zBSExM5rpHiZP+p1BkAKQKKZ2014rV61nZbFOdKurTKwJPaFJimTUXsEMBABgItMKpcIbBPuV5B1YNzHZeDQZ0AoAhoSpdZHLQmWjQsDxGvfOhc9pT4riXyQgAWCcnQ68=
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
Subject: [XEN v1 4/4] xen/arm: traps.c: Enclose VMSA specific registers within CONFIG_MMU
Date: Mon, 11 Sep 2023 14:59:42 +0100
Message-ID: <20230911135942.791206-5-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911135942.791206-1-ayan.kumar.halder@amd.com>
References: <20230911135942.791206-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|CH2PR12MB4328:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a7c3af5-8f2e-4ce6-4edd-08dbb2cf8774
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5jMevpm3KxWfY2402R2YnZOkislKOztc59g7u2ezdcagfiE8l4fezFotJT/nssRSwW4X5sfPHCAARJEQX6Eb7mE7B1EbCRAwCEPhHD7sAoWbDatwoi8mi6vIAXtpwsCepzG+1Sj6ENwxYbYAYRRcnYgy/vZZQaDfVMLgD+qJ3NiQCOlOr9uTTqDRO3LbDABIEIaKUu9uVm4BHbzXe3rOWMuVlDjBXDLrAdY93IqBZQmlwvm5O7BY3gJz9Ibweb0mMT75RlGJlbCv31IUhcgfUH/yKo358EAwJDtW3XO8VmqWyKbpBI1/Oo2Pkc0GmcgQZ9w/HLKleh0gk4axzpb53Heucgidv9VydB6HbPBwgHLu4emnpQDjAQkeNIxC9lYMlTy1L3zxuG8ZPafA6LAG79h/t5rIYz5kx76WHqThr6WNJng5TuRN+5IJKwZU1x+GwE0AhS+IzhvX+jd9TNZh2C7HKkJzYnddNOTDR700f+1Uh2oS07U1rCbVwe5TbZMi+NIx1sMmbsmBPRQvvD0KlIqhxQcp1TssHE+1KqFbXKuR2fc9+VgJgDL8INM1a2AQN48yttr5obTJYqTTdVVbnIbLqrcJLCux/zr9n1DmMBax41NgvnrxE2Opsaw48W1W9aAgQlnQBGzhRX66qlp1CpeXXojLFTRSjk/2fLohG6u8zYZWb0NHxaX9+URNc7eDdV2eSnYjn2AVtCH4lAgrB5AkmUtkYjqm9o/CbY7f1addM507pvgKMI8Rww4jdf0L0O5NEAbWKJO8FWCDCMH0QA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(1800799009)(82310400011)(186009)(451199024)(46966006)(36840700001)(40470700004)(70586007)(26005)(86362001)(1076003)(426003)(336012)(2906002)(83380400001)(103116003)(6666004)(40480700001)(2616005)(36860700001)(356005)(82740400003)(81166007)(47076005)(40460700003)(478600001)(36756003)(5660300002)(4326008)(8936002)(8676002)(316002)(54906003)(6916009)(70206006)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 14:01:00.2796
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a7c3af5-8f2e-4ce6-4edd-08dbb2cf8774
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4328

The VMSA specific registers (ie TCR, TTBR0, TTBR1, VTTBR, etc) are valid when
MMU is used, thus we can enclose them with CONFIG_MMU.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/traps.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 46c9a4031b..83522fcc5a 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -698,8 +698,10 @@ static void __do_trap_serror(struct cpu_user_regs *regs, bool guest)
 struct reg_ctxt {
     /* Guest-side state */
     register_t sctlr_el1;
+#ifdef CONFIG_MMU
     register_t tcr_el1;
     uint64_t ttbr0_el1, ttbr1_el1;
+#endif
 #ifdef CONFIG_ARM_32
     uint32_t dfsr, ifsr;
     uint32_t dfar, ifar;
@@ -801,9 +803,11 @@ static void show_registers_32(const struct cpu_user_regs *regs,
     if ( guest_mode_on )
     {
         printk("     SCTLR: %"PRIregister"\n", ctxt->sctlr_el1);
+#ifdef CONFIG_MMU
         printk("       TCR: %"PRIregister"\n", ctxt->tcr_el1);
         printk("     TTBR0: %016"PRIx64"\n", ctxt->ttbr0_el1);
         printk("     TTBR1: %016"PRIx64"\n", ctxt->ttbr1_el1);
+#endif
         printk("      IFAR: %08"PRIx32", IFSR: %08"PRIx32"\n"
                "      DFAR: %08"PRIx32", DFSR: %08"PRIx32"\n",
 #ifdef CONFIG_ARM_64
@@ -873,9 +877,11 @@ static void show_registers_64(const struct cpu_user_regs *regs,
         printk("   FAR_EL1: %016"PRIx64"\n", ctxt->far);
         printk("\n");
         printk(" SCTLR_EL1: %"PRIregister"\n", ctxt->sctlr_el1);
+#ifdef CONFIG_MMU
         printk("   TCR_EL1: %"PRIregister"\n", ctxt->tcr_el1);
         printk(" TTBR0_EL1: %016"PRIx64"\n", ctxt->ttbr0_el1);
         printk(" TTBR1_EL1: %016"PRIx64"\n", ctxt->ttbr1_el1);
+#endif
         printk("\n");
     }
 }
@@ -907,13 +913,15 @@ static void _show_registers(const struct cpu_user_regs *regs,
         show_registers_32(regs, ctxt, guest_mode_on, v);
 #endif
     }
+#ifdef CONFIG_MMU
     printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
     printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);
+    printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
     printk("\n");
+#endif
 
     printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
     printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
-    printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
     printk("\n");
     printk("   ESR_EL2: %"PRIregister"\n", regs->hsr);
     printk(" HPFAR_EL2: %"PRIregister"\n", READ_SYSREG(HPFAR_EL2));
@@ -931,9 +939,13 @@ void show_registers(const struct cpu_user_regs *regs)
 {
     struct reg_ctxt ctxt;
     ctxt.sctlr_el1 = READ_SYSREG(SCTLR_EL1);
+#ifdef CONFIG_MMU
     ctxt.tcr_el1 = READ_SYSREG(TCR_EL1);
     ctxt.ttbr0_el1 = READ_SYSREG64(TTBR0_EL1);
     ctxt.ttbr1_el1 = READ_SYSREG64(TTBR1_EL1);
+    ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
+#endif
+
 #ifdef CONFIG_ARM_32
     ctxt.dfar = READ_CP32(DFAR);
     ctxt.ifar = READ_CP32(IFAR);
@@ -945,7 +957,6 @@ void show_registers(const struct cpu_user_regs *regs)
     if ( guest_mode(regs) && is_32bit_domain(current->domain) )
         ctxt.ifsr32_el2 = READ_SYSREG(IFSR32_EL2);
 #endif
-    ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
 
     _show_registers(regs, &ctxt, guest_mode(regs), current);
 }
@@ -954,9 +965,11 @@ void vcpu_show_registers(const struct vcpu *v)
 {
     struct reg_ctxt ctxt;
     ctxt.sctlr_el1 = v->arch.sctlr;
+#ifdef CONFIG_MMU
     ctxt.tcr_el1 = v->arch.ttbcr;
     ctxt.ttbr0_el1 = v->arch.ttbr0;
     ctxt.ttbr1_el1 = v->arch.ttbr1;
+#endif
 #ifdef CONFIG_ARM_32
     ctxt.dfar = v->arch.dfar;
     ctxt.ifar = v->arch.ifar;
-- 
2.25.1


