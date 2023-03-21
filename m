Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC296C33CC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 15:14:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512709.792861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecka-0004Hs-Ct; Tue, 21 Mar 2023 14:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512709.792861; Tue, 21 Mar 2023 14:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pecka-0004En-9W; Tue, 21 Mar 2023 14:14:08 +0000
Received: by outflank-mailman (input) for mailman id 512709;
 Tue, 21 Mar 2023 14:14:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CsWt=7N=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1peccY-0005Xe-1P
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 14:05:50 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20630.outbound.protection.outlook.com
 [2a01:111:f400:fe59::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ad39153-c7f1-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 15:05:49 +0100 (CET)
Received: from BN9PR03CA0538.namprd03.prod.outlook.com (2603:10b6:408:131::33)
 by IA1PR12MB6330.namprd12.prod.outlook.com (2603:10b6:208:3e4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 14:05:46 +0000
Received: from BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::19) by BN9PR03CA0538.outlook.office365.com
 (2603:10b6:408:131::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 14:05:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT013.mail.protection.outlook.com (10.13.176.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.16 via Frontend Transport; Tue, 21 Mar 2023 14:05:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:05:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 09:05:34 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 21 Mar 2023 09:05:32 -0500
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
X-Inumbo-ID: 7ad39153-c7f1-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frXxxiAUk2BWq6Bj1p8JCFrPG4NhhXZoO0V5Ar+6KZupDBZJoHy6l2WoUnRDR9QmjwmueUGvtlfP1FUC+gyXuOTHNB5OLo5eaoWwyRKrQqGTpG26EBCuw8gVnU0vvXxFNAZeTjU9o6MNWau+zXxRCjwirGw92oHmadYpjsE5kwdQIoZWc6yWVImr084T4HTTgc9WzY3w2vljIMAPVMNxLrIeTTGCfo190MIjSrSpaKB9+iSpGcQinS03D/Yyb8Nj1YLPnX7FDmdsJPVxT7l5romUdqaW0ASLWWRCFHTZYXyie5QjQK8+qiHWWYhzLrYL51felky5mvrSF8M5N7/e9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcfEw0YmhpLuK5yfYdcOma+HR1pKGZ8HcIt8DLoLQyI=;
 b=PJ1lfEkhNJP0+C4rK58bp1ggPHUE/1GNsRYXRPapJfS9hDAYy3lBDaA42QxxLqSYcOzyVv3Qkw8Wpr3QD3pvmB0oYiHQrXaP2Cqw24kYMBwVUxASg7LsSfXOTJT6+BGd2/JDXgTg4t336PWRmJOujVIlutM/UVzBGwJfosQCCrHlAeuzn/jKQMPl96GLRywAqC9wTVKuvj5phOvx8tyWFwct6Xw43vh/b9ZqSup5KHktSV6Wpcq/N53ENLFDAghf/If3hi24nE9hDg2qiGVual30/691hJxgCwdlBepO1Oi6OFitJIjk7lK1XKi6k4groKYC/Ym+Aw8hCabX+BP6RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcfEw0YmhpLuK5yfYdcOma+HR1pKGZ8HcIt8DLoLQyI=;
 b=qnS6WYbUuTw4AXb16ZtPssyvHsbcivqPAGQtQ8n68PFNRWMxy6AXZK7jYM16DinY6IaCTsNUQt5704a/YAA+7XZdcQirnfg5lW/Kun9ZCWP9pRzM/yAaay6c/U/5IU1PgoGsBcLXGW+Pf0QbNXAmnIJVG9mnCTkAziitc6Ez65c=
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
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 10/11] xen/arm: p2m: Use the pa_range_info table to support Arm_32 and Arm_64
Date: Tue, 21 Mar 2023 14:03:56 +0000
Message-ID: <20230321140357.24094-11-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT013:EE_|IA1PR12MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: 79928000-796f-4c80-5b07-08db2a155dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ik9um8+jW5gbh+FSQaoI1hhsId6tDt21Xczjpc8Pb/FUJnlu+G1MWcsQlDu0a0X01icqHURgD9d7kiP4DQnPgJWFQTJcnp01r5gs/G57RLR/HYR8ei0w6XL6bCkiy4HNcn99FSagv7XME37y5G+WYyZqVnHLSF1zpgIGdbmWmWjyIG38giY6Ork5Ue5DZye1hAgb+CccmBwnIo4Z4yZE9WU/2yoFW+spGxCgkZpUuevxrruret/5s/VMWtldrtC1XfDPPFeFmo9Aa/MYwVkzx+qHX6jAUxhG2VQnQ8uie1sUKfMze2ub8sG8sSXpKfZSXot2QzTwTDo9nr+9YFY/T/bZnao5iO/Gsp+iVKKxspCoXBM9GPz0fsidML8W4lYkP8FluonFMy1zXcUT6bxkP1ax1+zRVrk5f99VZ2/pdypLYs4FRK9REyc4WreFctu0xQpvnDXD7vJLQCyIcX4AZK5IyNgcmSISLjOghWEqU6C0w7lFN8Ha41N1lvl/pLiEyajQyGWNqIUhWvNvxzZVPxdWzRRAiQfCIbB/O+VoFf/QWpyw5F5d50A8OHOMGu5CQF1zW7jZdNiPhHytB5rKeWJDVZujC218zOPTpSiG5o+GIbZAq2GLKZEKKWr9Xs/FWb85cyGRH6kh4bjunBT2suSt9EhZefcM/PFwLZwGatmtjPKyX3bEneWLEftSTRxBLcQmNy6VNpH06t0igMoeJJqkzv91Fh+C1hlYPwcQGdk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199018)(46966006)(36840700001)(40470700004)(426003)(2616005)(316002)(47076005)(478600001)(83380400001)(82310400005)(54906003)(186003)(336012)(1076003)(26005)(6666004)(103116003)(36860700001)(7416002)(70206006)(356005)(8936002)(81166007)(86362001)(40460700003)(2906002)(5660300002)(6916009)(82740400003)(4326008)(70586007)(36756003)(40480700001)(41300700001)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 14:05:45.7001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79928000-796f-4c80-5b07-08db2a155dac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6330

Restructure the code so that one can use pa_range_info[] table for both
ARM_32 as well as ARM_64.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v3 - 1. New patch introduced in v4.
2. Restructure the code such that pa_range_info[] is used both by ARM_32 as
well as ARM_64.

 xen/arch/arm/p2m.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 948f199d84..f34b6e6f11 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -2265,22 +2265,16 @@ void __init setup_virt_paging(void)
     /* Setup Stage 2 address translation */
     register_t val = VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
 
-#ifdef CONFIG_ARM_32
-    if ( p2m_ipa_bits < 40 )
-        panic("P2M: Not able to support %u-bit IPA at the moment\n",
-              p2m_ipa_bits);
-
-    printk("P2M: 40-bit IPA\n");
-    p2m_ipa_bits = 40;
-    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
-    val |= VTCR_SL0(0x1); /* P2M starts at first level */
-#else /* CONFIG_ARM_64 */
     static const struct {
         unsigned int pabits; /* Physical Address Size */
         unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
         unsigned int root_order; /* Page order of the root of the p2m */
         unsigned int sl0;    /* Desired SL0, maximum in comment */
     } pa_range_info[] __initconst = {
+#ifdef CONFIG_ARM_32
+        [0] = { 40,      24/*24*/,  1,          1 },
+        [1] = { 0 } /* Invalid */
+#else
         /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
         /*      PA size, t0sz(min), root-order, sl0(max) */
         [0] = { 32,      32/*32*/,  0,          1 },
@@ -2291,11 +2285,13 @@ void __init setup_virt_paging(void)
         [5] = { 48,      16/*16*/,  0,          2 },
         [6] = { 52,      12/*12*/,  4,          2 },
         [7] = { 0 }  /* Invalid */
+#endif
     };
 
     unsigned int i;
     unsigned int pa_range = 0x10; /* Larger than any possible value */
 
+#ifdef CONFIG_ARM_64
     /*
      * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
      * with IPA bits == PA bits, compare against "pabits".
@@ -2309,6 +2305,9 @@ void __init setup_virt_paging(void)
      */
     if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
         max_vmid = MAX_VMID_16_BIT;
+#else
+    p2m_ipa_bits = PADDR_BITS;
+#endif
 
     /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
     for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
@@ -2324,14 +2323,13 @@ void __init setup_virt_paging(void)
     if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
         panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
 
-    val |= VTCR_PS(pa_range);
+#ifdef CONFIG_ARM_64
     val |= VTCR_TG0_4K;
+    val |= VTCR_PS(pa_range);
 
     /* Set the VS bit only if 16 bit VMID is supported. */
     if ( MAX_VMID == MAX_VMID_16_BIT )
         val |= VTCR_VS;
-    val |= VTCR_SL0(pa_range_info[pa_range].sl0);
-    val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
 
     p2m_root_order = pa_range_info[pa_range].root_order;
     p2m_root_level = 2 - pa_range_info[pa_range].sl0;
@@ -2342,6 +2340,10 @@ void __init setup_virt_paging(void)
            pa_range_info[pa_range].pabits,
            ( MAX_VMID == MAX_VMID_16_BIT ) ? 16 : 8);
 #endif
+
+    val |= VTCR_SL0(pa_range_info[pa_range].sl0);
+    val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
+
     printk("P2M: %d levels with order-%d root, VTCR 0x%"PRIregister"\n",
            4 - P2M_ROOT_LEVEL, P2M_ROOT_ORDER, val);
 
-- 
2.17.1


