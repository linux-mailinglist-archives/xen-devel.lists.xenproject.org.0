Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DA2720123
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 14:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543107.847765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53aD-0004T9-KC; Fri, 02 Jun 2023 12:08:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543107.847765; Fri, 02 Jun 2023 12:08:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q53aD-0004QC-F8; Fri, 02 Jun 2023 12:08:41 +0000
Received: by outflank-mailman (input) for mailman id 543107;
 Fri, 02 Jun 2023 12:08:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1jAO=BW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1q53aB-0003vL-SI
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 12:08:39 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e88::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33f3fb42-013e-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 14:08:37 +0200 (CEST)
Received: from MW4PR03CA0149.namprd03.prod.outlook.com (2603:10b6:303:8c::34)
 by CH0PR12MB5265.namprd12.prod.outlook.com (2603:10b6:610:d0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 12:08:34 +0000
Received: from CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::ca) by MW4PR03CA0149.outlook.office365.com
 (2603:10b6:303:8c::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26 via Frontend
 Transport; Fri, 2 Jun 2023 12:08:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT070.mail.protection.outlook.com (10.13.175.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Fri, 2 Jun 2023 12:08:33 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 07:08:32 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 2 Jun 2023 07:08:31 -0500
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
X-Inumbo-ID: 33f3fb42-013e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5CK5EPR3Bn7r0XVnsO0JiKxSzV3Eh8slaFfEbawrbIgsM3hTUc5LcZVbf1LHW74IpTmPVhrE9nveMyWngcq+V9Kxfy98tznHQQpuuQp6dHp8zoFYtq8FModo3emG/RkdO5zHq5eoVh4vDbwu6ppVn6L3OS6t0B//+vJtRcfWQOWlcUEWS7bc/mbWWWcQ3xmXP8qlHI96O5MerH3AfZLjcJPzYHi2mEp4eeICRq+0T/8iuis/v+d5q7NrHYCfQMs5itwSmrdKCYjC1Rx0FvM+VjBfqrnBVc+S9++fgfiPi7o5kKVMuw3xPAmrR0qQFoyGbP4HI9Eny9+RWxmITWPyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJO54s7DIDIZBjYPzs3C8whg1R3i4ZDxSSR0xflu0JQ=;
 b=iSqdvw6ma59yQd2VpxKxgWGGjQtsdnW1hC+/MtuCi6cKBeKy4HXWURcH2W0RCnfT8Ozs0a1z+OIcQEFUpL5C+JmJeQfK63y5Oltf2cmZgA0OoDhxntGJfmeF0Bx43tw4J1vqnMqJOgxoTrW55mOnoa8PvBKf2J19bvxaqzRESI5HvDuIJmvEu425X1+y21kHsrNUJGMcwpG7OQe3PxR7v1HXifhHiZgo1RoI0WtQfdvm7zyap0PEpRrjifL/OVC+i6I/8dJvVMs/sWjM/EySxfhZwJdQ1GvvJRw2zkvyoyg+N1Rw47BvyCj7fYM3Bvf7vlrEL13R9gxDGkXpU0o7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJO54s7DIDIZBjYPzs3C8whg1R3i4ZDxSSR0xflu0JQ=;
 b=QKxSar5+3CMaMb+teiFK7fQdg3QbLd+8Qd0OAxKT0vGj9XiAXlCvEClrY1TXaKUVBP4xDGB92cHSlaGJDw0f/CfwAd36kHOJN6pANOrb/hV+wRli2YegKpAGyDnxK9B2WQw9D2dXbqFfb/ENgwH58pmgO8QimiLYwX3BhN1/sDI=
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
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v8 1/5] xen/arm: p2m: Use the pa_range_info table to support ARM_32 and ARM_64
Date: Fri, 2 Jun 2023 13:07:50 +0100
Message-ID: <20230602120754.23817-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
References: <20230602120754.23817-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT070:EE_|CH0PR12MB5265:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e691522-3180-4783-aff7-08db6362161a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lMahqJ0kUUby7vGKL2tu3UJjV8LCAGmdvyKL5flSHN2l2fryHH1lz1ZrDxXnXeGn0pV+BoBKyzRkz4OlubvHtqZkMmTtaPYyuElUTEWDW/NqHLvWudx2cF71LMkrwoYcLa/06O4kDuzC0gmqQJzqqt6zIPXCZGNTU3cSSXGBnhvMPWrIq8gNimfv19crCqsgSNMVpFyILNrocYZehEjtgJZYWm99j45nLr7dK6qFkqMzqNEac5Pi3YOf5HKXpAc7vwhzVScCaht7L59F+vWqFv07bm/QejiNDzpLZE8xV5MNYBTgosVL1AlN4GTinm07dOkLvcz3GduKh9fDJybiqltRJ9ol8+OY99XFVh7R9o2nbXlMhA3Rxs668w1DQZFX8bpGatfBqQG8sJ8t0lXpH4bUNFDn+Ia7j31HSyDjlaGS4BRQxdIkAiV+4rHPJ6RJTXoBQbW1l4a6oYqbswyV7GAbjwFThrq8TpKhkueoxRFl3YkESwL5Aqv7urTqxVq3j/gEyVyyehFW3clWACwMppXGyiiD+iNdyrQR2HFQAEgBrn76fla4cfYoPmirU3mm+lRHwuiVjjQ4jn6Se6/f8rzSyjNUenZzT051cdlkd6gz3hZYbP51qPSGEznpUdiy1zA15v5hLW4eSVh4PSiFV0vqXzKgnAom66u3QrlGTuokdXxqT83N3h9qm9vtHF9t6BwZ4dFQwSo9LbDzkUpNUB7ekltPGPYiWMXiqpjxk9rK1kOuCrVI7mPwy0lYaR36b4v9T0j2F3nM0KZjqcBU2Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(40480700001)(356005)(40460700003)(54906003)(82740400003)(478600001)(70586007)(8936002)(8676002)(6916009)(41300700001)(70206006)(81166007)(4326008)(316002)(2616005)(426003)(186003)(336012)(36860700001)(47076005)(83380400001)(6666004)(1076003)(26005)(103116003)(82310400005)(86362001)(7416002)(5660300002)(2906002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 12:08:33.0443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e691522-3180-4783-aff7-08db6362161a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5265

Restructure the code so that one can use pa_range_info[] table for both
ARM_32 as well as ARM_64.

Also, removed the hardcoding for P2M_ROOT_ORDER and P2M_ROOT_LEVEL as
p2m_root_order can be obtained from the pa_range_info[].root_order and
p2m_root_level can be obtained from pa_range_info[].sl0.

Refer ARM DDI 0406C.d ID040418, B3-1345,
"Use of concatenated first-level translation tables

...However, a 40-bit input address range with a translation granularity of 4KB
requires a total of 28 bits of address resolution. Therefore, a stage 2
translation that supports a 40-bit input address range requires two concatenated
first-level translation tables,..."

Thus, root-order is 1 for 40-bit IPA on ARM_32.

Refer ARM DDI 0406C.d ID040418, B3-1348,

"Determining the required first lookup level for stage 2 translations

For a stage 2 translation, the output address range from the stage 1
translations determines the required input address range for the stage 2
translation. The permitted values of VTCR.SL0 are:

0b00 Stage 2 translation lookup must start at the second level.
0b01 Stage 2 translation lookup must start at the first level.

VTCR.T0SZ must indicate the required input address range. The size of the input
address region is 2^(32-T0SZ) bytes."

Thus VTCR.SL0 = 1 (maximum value) and VTCR.T0SZ = -8 when the size of input
address region is 2^40 bytes.

Thus, pa_range_info[].t0sz = 1 (VTCR.S) | 8 (VTCR.T0SZ) ie 11000b which is 24.

VTCR.T0SZ, is bits [5:0] for ARM_64.
VTCR.T0SZ is bits [3:0] and S(sign extension), bit[4] for ARM_32.

For this, we have used struct bitfields to convert pa_range_info[].t0sz to its
ARM_32 variant.

pa_range_info[] is indexed by ID_AA64MMFR0_EL1.PARange which is present in Arm64
only. This is the reason we do not specify the indices for ARM_32. Also, we
duplicated the entry "{ 40,      24/*24*/,  1,          1 }" between ARM_64 and
ARM_32. This is done to avoid introducing extra #if-defs.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v3 - 1. New patch introduced in v4.
2. Restructure the code such that pa_range_info[] is used both by ARM_32 as
well as ARM_64.

v4 - 1. Removed the hardcoded definitions of P2M_ROOT_ORDER and P2M_ROOT_LEVEL.
The reason being root_order will not be always 1 (See the next patch).
2. Updated the commit message to explain t0sz, sl0 and root_order values for
32-bit IPA on Arm32.
3. Some sanity fixes.

v5 - pa_range_info is indexed by system_cpuinfo.mm64.pa_range. ie
when PARange is 0, the PA size is 32, 1 -> 36 and so on. So pa_range_info[] has
been updated accordingly.
For ARM_32 pa_range_info[0] = 0 and pa_range_info[1] = 0 as we do not support
32-bit, 36-bit physical address range yet.

v6 - 1. Added pa_range_info[] entries for ARM_32 without indices. Some entry
may be duplicated between ARM_64 and ARM_32.
2. Recalculate p2m_ipa_bits for ARM_32 from T0SZ (similar to ARM_64).
3. Introduced an union to reinterpret T0SZ bits between ARM_32 and ARM_64.

v7 - 1. Used struct bifield instead of union to reinterpret T0SZ bits between
ARM_32 and ARM_64.
2. Removed the invalid entry for ARM_32.

 xen/arch/arm/include/asm/p2m.h |  6 ----
 xen/arch/arm/p2m.c             | 50 +++++++++++++++++++++++++---------
 2 files changed, 37 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index f67e9ddc72..940495d42b 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -14,16 +14,10 @@
 /* Holds the bit size of IPAs in p2m tables.  */
 extern unsigned int p2m_ipa_bits;
 
-#ifdef CONFIG_ARM_64
 extern unsigned int p2m_root_order;
 extern unsigned int p2m_root_level;
 #define P2M_ROOT_ORDER    p2m_root_order
 #define P2M_ROOT_LEVEL p2m_root_level
-#else
-/* First level P2M is always 2 consecutive pages */
-#define P2M_ROOT_ORDER    1
-#define P2M_ROOT_LEVEL 1
-#endif
 
 struct domain;
 
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 418997843d..76388ba54b 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -19,9 +19,9 @@
 
 #define INVALID_VMID 0 /* VMID 0 is reserved */
 
-#ifdef CONFIG_ARM_64
 unsigned int __read_mostly p2m_root_order;
 unsigned int __read_mostly p2m_root_level;
+#ifdef CONFIG_ARM_64
 static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
 /* VMID is by default 8 bit width on AArch64 */
 #define MAX_VMID       max_vmid
@@ -2247,16 +2247,6 @@ void __init setup_virt_paging(void)
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
@@ -2265,6 +2255,7 @@ void __init setup_virt_paging(void)
     } pa_range_info[] __initconst = {
         /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
         /*      PA size, t0sz(min), root-order, sl0(max) */
+#ifdef CONFIG_ARM_64
         [0] = { 32,      32/*32*/,  0,          1 },
         [1] = { 36,      28/*28*/,  0,          1 },
         [2] = { 40,      24/*24*/,  1,          1 },
@@ -2273,11 +2264,28 @@ void __init setup_virt_paging(void)
         [5] = { 48,      16/*16*/,  0,          2 },
         [6] = { 52,      12/*12*/,  4,          2 },
         [7] = { 0 }  /* Invalid */
+#else
+        { 40,      24/*24*/,  1,          1 }
+#endif
     };
 
     unsigned int i;
     unsigned int pa_range = 0x10; /* Larger than any possible value */
 
+#ifdef CONFIG_ARM_32
+    /*
+     * Typecast pa_range_info[].t0sz into ARM_32 bit variant.
+     *
+     * VTCR.T0SZ is bits [3:0] and S(sign extension), bit[4] for ARM_32.
+     * Thus, pa_range_info[].t0sz is translated to its ARM_32 variant using
+     * struct bitfields.
+     */
+    struct
+    {
+        signed int val:5;
+    } t0sz_32;
+#else
+
     /*
      * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
      * with IPA bits == PA bits, compare against "pabits".
@@ -2291,6 +2299,7 @@ void __init setup_virt_paging(void)
      */
     if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
         max_vmid = MAX_VMID_16_BIT;
+#endif
 
     /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
     for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
@@ -2304,26 +2313,41 @@ void __init setup_virt_paging(void)
 
     /* pa_range is 4 bits but we don't support all modes */
     if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
-        panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
+    {
+        /*
+         * In case of ARM_64, we do not support this encoding of
+         * ID_AA64MMFR0_EL1.PARange
+         */
+        panic("Unsupported value for p2m_ipa_bits = 0x%x\n", p2m_ipa_bits);
+    }
 
+#ifdef CONFIG_ARM_64
     val |= VTCR_PS(pa_range);
     val |= VTCR_TG0_4K;
 
     /* Set the VS bit only if 16 bit VMID is supported. */
     if ( MAX_VMID == MAX_VMID_16_BIT )
         val |= VTCR_VS;
+#endif
+
     val |= VTCR_SL0(pa_range_info[pa_range].sl0);
     val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
 
     p2m_root_order = pa_range_info[pa_range].root_order;
     p2m_root_level = 2 - pa_range_info[pa_range].sl0;
+
+#ifdef CONFIG_ARM_64
     p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
+#else
+    t0sz_32.val = pa_range_info[pa_range].t0sz;
+    p2m_ipa_bits = 32 - t0sz_32.val;
+#endif
 
     printk("P2M: %d-bit IPA with %d-bit PA and %d-bit VMID\n",
            p2m_ipa_bits,
            pa_range_info[pa_range].pabits,
            ( MAX_VMID == MAX_VMID_16_BIT ) ? 16 : 8);
-#endif
+
     printk("P2M: %d levels with order-%d root, VTCR 0x%"PRIregister"\n",
            4 - P2M_ROOT_LEVEL, P2M_ROOT_ORDER, val);
 
-- 
2.17.1


