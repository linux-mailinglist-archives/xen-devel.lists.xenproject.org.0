Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6615708434
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 16:47:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536431.834766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeul-00055C-Pn; Thu, 18 May 2023 14:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536431.834766; Thu, 18 May 2023 14:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzeul-00051s-I2; Thu, 18 May 2023 14:47:35 +0000
Received: by outflank-mailman (input) for mailman id 536431;
 Thu, 18 May 2023 14:47:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R7bG=BH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pzeoZ-00074K-GH
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 14:41:11 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06f2fec4-f58a-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 16:41:09 +0200 (CEST)
Received: from BN1PR14CA0029.namprd14.prod.outlook.com (2603:10b6:408:e3::34)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Thu, 18 May
 2023 14:41:05 +0000
Received: from BN8NAM11FT106.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::6a) by BN1PR14CA0029.outlook.office365.com
 (2603:10b6:408:e3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 14:41:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT106.mail.protection.outlook.com (10.13.177.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 14:41:03 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 09:41:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 07:41:02 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 18 May 2023 09:41:01 -0500
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
X-Inumbo-ID: 06f2fec4-f58a-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GPNXG2IM5Ehud4tR8pGKKxkxebCruwh99eJLIRN7YSosKkRwMpYDaLefAKSJNS5vqrv9+vgdy3LeW1Ab497ytE8Nk+HNzcxBbEhghekitWuLvf1e0K1ucstY8gl5qp+Py6Ey3nh49ROe0gRnIHQk0pThD9cPq0YkI77+zonfYEXdQmOe7ArjIp7i2y6p8jJtGqyNvvxSOwxp0XNolRx6QcUhTwln7xipvn+SxBaucLKO+7hzuktQykLpC0Pmspq1RJvh4iBH1OH+qbgktJFzodTX7mw/mbqMbiH+zGobvvVLYlTD/95Q8BBXw0uLVyGrnAIIful49LSn+HuNnA2PGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9lGGyp31QTztHVbOYMqPwY8XuOJ0Ip79morXeJYXlE=;
 b=GMidtoGFfHj6WV7uCedW5BvLrbHb+m2JB4InlSwfoJkDfiP63jLCpFl7tNvdropKx02hh5MzIiXb+sBl9o6oBOwkU5QdTgV+XxOSnbRWtPgpBbQCq+TfTg5d2q0/WJyfkOJsWPvdvGzUxCQIZJVXXojEwgVvya5VxdgryuDSdw17TXpegDjRMD+t/XxAxlFG4mMxal8tUD3B2HioS9AqfiqdMZLmrDLM6Il8AOcQkzqjkYSN9ibAYaASE1xym6DUhvcN1611DWhH1WWHGrMgcVD9cGexoSMiydxv6lr+eWSNSbcuTdGFH3BvDh4P19x9V/L60gcGC13YlBEco8zqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9lGGyp31QTztHVbOYMqPwY8XuOJ0Ip79morXeJYXlE=;
 b=IT2LIcMcwekH1Ud2KAbMJOkR8BIIlplEaDM5TbXL5kI3vJt1A7r1i6ECUJrPoVUeuIr5afCedunYlt4X+Mp7Hlug62g1Yy2aY050nL+8DohCij06uInyZkuiTxyrkNITCV+AfF4maA9Msy64YN6mrIxlNCsPdeB3x2N2SUjjXrU=
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
	<wl@xen.org>, <rahul.singh@arm.com>, <michal.orzel@amd.com>, "Ayan Kumar
 Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v7 07/11] xen/arm: p2m: Use the pa_range_info table to support ARM_32 and ARM_64
Date: Thu, 18 May 2023 15:39:16 +0100
Message-ID: <20230518143920.43186-8-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
References: <20230518143920.43186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT106:EE_|SA0PR12MB4576:EE_
X-MS-Office365-Filtering-Correlation-Id: 45b85d64-7e76-4884-f1e6-08db57ade836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PxuliIDOJ40wAcLwYeedNUZOELXqQoDpOsDruCR20x86iC3IdBng0iwshjGch7LRBxVEyXgsbbNYP8mFrR1v1X2KjJZXMwi55nsfkeMUntTx0+U/IfjZvxxoRLvj1WJdRVFKyeaWO56HlR20nrk0AxNoKQQIyKo4XEkTL75VTk3ohlH4FzF+9NONIHCCEpjNIBf9EMrqWH5LuSxCUis14vUE1XiOUdGVnKVofSf95S/iS5apfc1gokykrMMD5Fx8CfAji6+DF8Nqih8YyM1NfEJR7Tff1Lk9I1Z+XYE0Ov0VsURBeOSLzdbU+UtVr1Qifl+nAOWsaGFmpDAGQhW+fgQPjzZFDJR9W7zsi+C2g4T3Xc7wT8K61BDZtDxiGyycRwaZZp2NF0kMy8p5KiqQ8hMKpA09w42sH/U415Zd9xtNqhQTZ4CPqziAeGwsa8sJ1vLTSOSX+GnmJs8mKEjyBd/s7rsRf0Zstc792r7BGLogKuJ/aEcyhcMZ/byDRz8qBfnVGGp6/j8Vbm//kEip55Jbh60hobXVqsjM2XGhk6dmdYX8ETb+1dEyJow2pTnODIJjiEwCg12XcWTP/mvJCHThv8S8fl9Bd7hH/ZLV45Qj+kRRnz+GlOigomCff+3ExpTCHfXQuvUHgKCU8IwtKV9o8E2bV6mRk0cx/DvuJSVbduXUt86PTXrT8eZxWJjlw+/VfWIRngT5kpwat7+lt2xqmYV/AJ7AojJ0EiCVw59MDrjMhCh6ekianD8mksifos3xeCqf6ZjWp/14tmD/HQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(36840700001)(40470700004)(46966006)(6666004)(83380400001)(2906002)(82310400005)(47076005)(36756003)(426003)(336012)(2616005)(186003)(5660300002)(82740400003)(8676002)(26005)(1076003)(54906003)(7416002)(8936002)(81166007)(86362001)(41300700001)(40460700003)(36860700001)(70586007)(6916009)(103116003)(478600001)(70206006)(356005)(4326008)(316002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 14:41:03.9462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b85d64-7e76-4884-f1e6-08db57ade836
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT106.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576

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

Thus, VTCR.T0SZ bits are interpreted accordingly for different architecture.
For this, we have used union.

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

 xen/arch/arm/include/asm/p2m.h |  6 ------
 xen/arch/arm/p2m.c             | 37 +++++++++++++++++++++++-----------
 2 files changed, 25 insertions(+), 18 deletions(-)

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
index 418997843d..755cb86c5b 100644
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
@@ -2273,11 +2264,22 @@ void __init setup_virt_paging(void)
         [5] = { 48,      16/*16*/,  0,          2 },
         [6] = { 52,      12/*12*/,  4,          2 },
         [7] = { 0 }  /* Invalid */
+#else
+        { 40,      24/*24*/,  1,          1 },
+        { 0 },  /* Invalid */
+#endif
     };
 
     unsigned int i;
     unsigned int pa_range = 0x10; /* Larger than any possible value */
 
+    /* Typecast pa_range_info[].t0sz into ARM_32 and ARM_64 bit variants. */
+    union {
+        signed int t0sz_32:5;
+        unsigned int t0sz_64:6;
+    } t0sz;
+
+#ifdef CONFIG_ARM_64
     /*
      * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
      * with IPA bits == PA bits, compare against "pabits".
@@ -2291,6 +2293,7 @@ void __init setup_virt_paging(void)
      */
     if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
         max_vmid = MAX_VMID_16_BIT;
+#endif
 
     /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
     for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
@@ -2306,24 +2309,34 @@ void __init setup_virt_paging(void)
     if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
         panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
 
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
+    t0sz.t0sz_64 = pa_range_info[pa_range].t0sz;
     p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
+#else
+    t0sz.t0sz_32 = pa_range_info[pa_range].t0sz;
+    p2m_ipa_bits = 32 - t0sz.t0sz_32;
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


