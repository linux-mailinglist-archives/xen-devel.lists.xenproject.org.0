Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7CA6E13A9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 19:39:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520877.808999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0uR-0005KD-LG; Thu, 13 Apr 2023 17:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520877.808999; Thu, 13 Apr 2023 17:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn0uR-0005Hs-Gc; Thu, 13 Apr 2023 17:38:59 +0000
Received: by outflank-mailman (input) for mailman id 520877;
 Thu, 13 Apr 2023 17:38:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2GAK=AE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pn0uD-0000rf-Tc
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 17:38:45 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe59::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08bf1265-da22-11ed-8611-37d641c3527e;
 Thu, 13 Apr 2023 19:38:44 +0200 (CEST)
Received: from BN1PR12CA0029.namprd12.prod.outlook.com (2603:10b6:408:e1::34)
 by CH3PR12MB7618.namprd12.prod.outlook.com (2603:10b6:610:14c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Thu, 13 Apr
 2023 17:38:40 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e1:cafe::b3) by BN1PR12CA0029.outlook.office365.com
 (2603:10b6:408:e1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 17:38:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 17:38:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:38:40 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 12:38:40 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 13 Apr 2023 12:38:38 -0500
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
X-Inumbo-ID: 08bf1265-da22-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IpfOCpxxw3i55eJofDliLG79xwMHrN9zM1RrU9iUWchqAFkd6S/h3eyDrs3pGiFo8Ifb2DXpAn+x2VmhjkyiXWLSiAnAwG2gQJaL6WUWOWng9NUVDoeGxYe4OoUJ3BVDVTbodyN+Vha6/VlC8pjDQQncwSnwL6klmbPdU3rKVy8jP67Uh92iAckIHaXT2WrUOIdmKkJ8c48LuLOy8LWE8KqpU4Mx30VQgpEnyNKVYQG1KV31akTAx4yS3JFrwilK7Hbx/cMRxuR7ZnXPgU2+mdqbRBmaOz3F8lyQj9A1nI7mUrvdWFaamXv5E4OL/Tdq91vsyo/39MYltQ5YlCBYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0Jv/eP8TblDgr/FC5ImnfRMvlRSI+Z7UaQME8KEVKw=;
 b=Rmi2FH3pDqxm9aw9ZkTnkAI0xvbQhNlUE/3FyAh+2KS5A+DmYzuuDUmXgDI6z3zvHt8myxHR8d+ss4c9SowWBFVo9gY8APVpx7aSScrNieyjpABWs2XTKq1RzXezD6jOrC/116OG/iNxPeOYQdZwe1kQHMae5SfU/ZuK4dBBIPOKBFg9yxcK42PLvrNv2Yu13zF34PPP6dJiYf9pZDffQWMkW3YCIQHJTjXpesoBTqaaoJtoOGqIX+GwQ4Gxe0ze9os+98I0SHfx+Ok7HMnBonjJ0hI17DF7xpnhg6RMXOTkTEMwB9QgzljkJRz2tt4UKeQ20obghAphboK9FreBLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0Jv/eP8TblDgr/FC5ImnfRMvlRSI+Z7UaQME8KEVKw=;
 b=gflHkHsPF8gff8+/kbhJx8Li+Yw2ZffhstP+ft8TB6nJm7TJ9G19nBru/g04I+kQvjPI+pehGelE+h5r4MO1X+Q/ee7QPPsMI71W3/NnaaElDKGnht72tlLlOIWDE8HUJQ70/hoYjWVy9VWWZ88mXRzhpOulFg/NSPUzT1JOeac=
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
Subject: [XEN v5 09/10] xen/arm: p2m: Use the pa_range_info table to support ARM_32 and ARM_64
Date: Thu, 13 Apr 2023 18:37:34 +0100
Message-ID: <20230413173735.48387-10-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|CH3PR12MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a193d6-7f89-415a-42af-08db3c45ebbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zv3qJxC33MucVc5vCEjLXLBXbDu7K1QsBy1Cb2EdaNGYX2Lx8M+79hyS5AIJjRED/uW3KwsDObiIvpPMfNO9S4wAYZQJbpsQ8Vwev2NNq+fXsv3z1l+b1EWihmrzNO39mExgopc8bFjZ5kO8SlLgpFCxfr/Mzd8T7NvjLnGMhn1mVIzIhFwC/bf42RMa7PhBYjzBrOhfz2Ea7/g8Yz91vCjqaC9sc9XbVh/eHA9RLAhKSZ6ODhgxri4s8HHycyUIU5Q6JQK1+D+7smPCDys+6FvoFHqyDTadurejah6VGXuXNzNpUxLOxdirMiJn+zLBjcF6WTxB+dI9q4Zu6QWeG3EavMksmgvuVykn324DPbY8NrV2+VHbZy4WxxkiduOo9didWBPzC9UNdS4/RxFtN7y/6z1aUVeHm1Jn9ENyWUvnP1+B5esN8f7wWaNzWBh0dm4fGC3KEwO7jWq2zfSwJKGtPHG1Z4vbzwfMumyvDEJXVvyfditoHHL+QRd8lx1DdqM9ltzaYel3hykMfFMboxoBQqfiJTLXJgDKTS3OSu6o0LlXWJVk50VTRxsEuh6DKN+xHS+dY6xff/Ku2BkHjqPQhx9pHeQR+1FjsQ5BuUl4JWbPAS6m9dzaCGiNJLHbwzMoX9ND/Pal4GWfXh+WMdiLud6B0ctED5/gtWrgIsB1f16J/nZ09OI5qdyu/EHcJDX95Lc2PNgJLJ7nVLhzsHuJVDE88PMWVVp4CWRCzRg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199021)(36840700001)(46966006)(40470700004)(26005)(1076003)(40460700003)(186003)(103116003)(478600001)(36860700001)(82310400005)(316002)(54906003)(36756003)(5660300002)(7416002)(8936002)(2906002)(4326008)(6916009)(8676002)(81166007)(356005)(82740400003)(86362001)(70206006)(70586007)(41300700001)(40480700001)(6666004)(83380400001)(2616005)(426003)(336012)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 17:38:40.8052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a193d6-7f89-415a-42af-08db3c45ebbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7618

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

 xen/arch/arm/include/asm/p2m.h |  8 +-------
 xen/arch/arm/p2m.c             | 34 ++++++++++++++++++----------------
 2 files changed, 19 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 91df922e1c..28c68428d3 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -14,16 +14,10 @@
 /* Holds the bit size of IPAs in p2m tables.  */
 extern unsigned int p2m_ipa_bits;
 
-#ifdef CONFIG_ARM_64
 extern unsigned int p2m_root_order;
 extern unsigned int p2m_root_level;
-#define P2M_ROOT_ORDER    p2m_root_order
+#define P2M_ROOT_ORDER p2m_root_order
 #define P2M_ROOT_LEVEL p2m_root_level
-#else
-/* First level P2M is always 2 consecutive pages */
-#define P2M_ROOT_ORDER    1
-#define P2M_ROOT_LEVEL 1
-#endif
 
 struct domain;
 
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 948f199d84..4583658f92 100644
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
@@ -2265,16 +2265,6 @@ void __init setup_virt_paging(void)
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
@@ -2283,19 +2273,24 @@ void __init setup_virt_paging(void)
     } pa_range_info[] __initconst = {
         /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
         /*      PA size, t0sz(min), root-order, sl0(max) */
-        [0] = { 32,      32/*32*/,  0,          1 },
-        [1] = { 36,      28/*28*/,  0,          1 },
-        [2] = { 40,      24/*24*/,  1,          1 },
+        [0] = { 40,      24/*24*/,  1,          1 },
+#ifdef CONFIG_ARM_64
+        [1] = { 32,      32/*32*/,  0,          1 },
+        [2] = { 36,      28/*28*/,  0,          1 },
         [3] = { 42,      22/*22*/,  3,          1 },
         [4] = { 44,      20/*20*/,  0,          2 },
         [5] = { 48,      16/*16*/,  0,          2 },
         [6] = { 52,      12/*12*/,  4,          2 },
         [7] = { 0 }  /* Invalid */
+#else
+        [1] = { 0 }  /* Invalid */
+#endif
     };
 
     unsigned int i;
     unsigned int pa_range = 0x10; /* Larger than any possible value */
 
+#ifdef CONFIG_ARM_64
     /*
      * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
      * with IPA bits == PA bits, compare against "pabits".
@@ -2309,6 +2304,9 @@ void __init setup_virt_paging(void)
      */
     if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
         max_vmid = MAX_VMID_16_BIT;
+#else
+    p2m_ipa_bits = PADDR_BITS;
+#endif
 
     /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
     for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
@@ -2324,24 +2322,28 @@ void __init setup_virt_paging(void)
     if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
         panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
 
+#ifdef CONFIG_ARM_64
     val |= VTCR_PS(pa_range);
     val |= VTCR_TG0_4K;
 
     /* Set the VS bit only if 16 bit VMID is supported. */
     if ( MAX_VMID == MAX_VMID_16_BIT )
         val |= VTCR_VS;
+
+    p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
+#endif
+
     val |= VTCR_SL0(pa_range_info[pa_range].sl0);
     val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
 
     p2m_root_order = pa_range_info[pa_range].root_order;
     p2m_root_level = 2 - pa_range_info[pa_range].sl0;
-    p2m_ipa_bits = 64 - pa_range_info[pa_range].t0sz;
 
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


