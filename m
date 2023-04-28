Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB8C6F1DC1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 19:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527458.820115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSNO-00026V-9r; Fri, 28 Apr 2023 17:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527458.820115; Fri, 28 Apr 2023 17:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psSNO-00022a-6A; Fri, 28 Apr 2023 17:59:22 +0000
Received: by outflank-mailman (input) for mailman id 527458;
 Fri, 28 Apr 2023 17:59:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SG5/=AT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1psSNM-0006vK-FH
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 17:59:20 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e88::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 656c6e9c-e5ee-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 19:59:19 +0200 (CEST)
Received: from BN0PR02CA0036.namprd02.prod.outlook.com (2603:10b6:408:e5::11)
 by SA1PR12MB7038.namprd12.prod.outlook.com (2603:10b6:806:24d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 17:59:15 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e5:cafe::61) by BN0PR02CA0036.outlook.office365.com
 (2603:10b6:408:e5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.24 via Frontend
 Transport; Fri, 28 Apr 2023 17:59:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.24 via Frontend Transport; Fri, 28 Apr 2023 17:59:15 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 12:59:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 28 Apr
 2023 10:59:14 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 28 Apr 2023 12:59:13 -0500
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
X-Inumbo-ID: 656c6e9c-e5ee-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYI93H0aWx5bslBuTgES2z8gcyV89MrM5SfHZq09sJ98zM3WGT0uSxxljbpOJMbgoz0acvkb4Y1cQYC5jvlCCdohaqfT35i11rKaiafGzE09wzxSwtitbC28M9gZ2MD4daGM4DitSrPOkSJFNf2mXDxkASo5ub4gmNNE6wmpzjyKmDKnrGVW3gBfKy4X88gn+svXjdLuzjTm7WHbCfdmN0/9qZl3ED2AnOfD2tVQfXdBREx+dECkO3RCun9nN1UjN+a53wN/dmynZk2ziR3Qw5mknx+pibQ4bTxfHPaXF7C2x28t0HBAjWYkMRIwX3E94CWnJIs04UH7EbErfu7JMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXmmpQTEBupiASRKTbTu9Mst1nMy3GQUH57jkcbo7eo=;
 b=FLm6YTgSkEri3DqixTMo3MDIAlSBr1LOWdJ/0iT5Xf1/r+O9y0DHMLd5Buml7H5hZBnayDr4cNMAXUZVNO6GDzHsrtzcfSW24dh1VmLpOM0fd6FdMHanrO0OXNgAqd61Spn/JZpc+pan1G0NxceHZQf48cLZwMp2zcLMQhHe3QHZ7j+oZWZhLcGENT07ZvKzUusDeBA7lP33ozQTwxRrLc2Ms0bkvWBTZIwwJToQhKJ3CwUFXCWRgSg+GiBAjjwBhdOk2iApXN2wEoHLytLs1qmXJ1K29EpmD+CBiKQELwyvcREL5SrQz2WCfULNfj/Ko4ZnIl+xh+C6hSehX7oAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXmmpQTEBupiASRKTbTu9Mst1nMy3GQUH57jkcbo7eo=;
 b=WlQPaVRlY9vccLkzUq5mRtGdnK+GH2aWud2EPElne94AG5KdxSd7RtwUkHv8YAXBL6DROBikC8CgP3zL0vKhCcf0gyxVxTRMmctXfs5mj4RKnakQQiGMNj6yMH0VDqectuFGY9uoU/rxAgaur8orRgqYvduvBDhscIwBGmUE1G8=
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
Subject: [XEN v6 11/12] xen/arm: p2m: Use the pa_range_info table to support ARM_32 and ARM_64
Date: Fri, 28 Apr 2023 18:55:42 +0100
Message-ID: <20230428175543.11902-12-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT021:EE_|SA1PR12MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: e39507f3-398e-404c-afc2-08db481247da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OamGLiBcpppl2eYNyW0nRJ0izW8tJKjPAKcRXc8wXuaaQ+vizWsXGPhaF0m2LqpktaDvVTK2q1TTMgIWRFSElf2LlgQtefKpqjwbu+lleRp9NCr+x6lHNpW8oZ1E2hrmsuTB4jOtUgCZCREEABkCzMJKvQChcSATqP2N4PSvY/mtHHyk2CBn+gCO364xwOFtKadszIQAF3vLxHvIasD5WTnR6FKi8QFFmmkDMZIIBzRH5paabVGhriSQ4QTXp5QhqiolbsZOyQB1UxfOUwOomz9YLRHSd6QTY25UVq/VOj55hZ/icLXP76kDkQNLC91A48hcYswwh6jNIZhw1CkfDZWwr4ssBuAWQX8NrQ5leC4yrFoIq1tgSVtAkiipa5ZGI0zUD47OLrViau/CxaKO+bgdc8Q6neNda6y0yHQGV0UVBSisNpPQs14r0Dfw2nD2Ymkl+wwZeAiVCvt9n6oitTYAqE5Uf6He8pRSIG1YiiucTwv0HA4N6FcxiYxbXKPSnqKFf0hbq7xqp7qHqR/d7SmH+LQFTETMXidb591WT98IvCSfIva2wuEWap+yiuLW5iPI50uGVWDvg2+2onJLCaBJdxAUJt1yiLyJWDp3iJ9BSiBotW/acJl/qUkzvJ3YthhEfTsCV8mktE4r7s1y9hnr4UqXm8TApmXORraOZNX+Jeqt+IQSG+OU/RkKZzIxux2C8NDhGzAFIbqoifdDv4TbjpcWv3CwpJSEbtAUHZs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(40480700001)(7416002)(81166007)(70206006)(6916009)(40460700003)(70586007)(478600001)(8676002)(8936002)(5660300002)(54906003)(4326008)(82740400003)(316002)(356005)(336012)(83380400001)(426003)(6666004)(186003)(2616005)(36860700001)(1076003)(26005)(47076005)(82310400005)(36756003)(86362001)(103116003)(2906002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 17:59:15.4713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e39507f3-398e-404c-afc2-08db481247da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7038

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

v5 - pa_range_info is indexed by system_cpuinfo.mm64.pa_range. ie
when PARange is 0, the PA size is 32, 1 -> 36 and so on. So pa_range_info[] has
been updated accordingly.
For ARM_32 pa_range_info[0] = 0 and pa_range_info[1] = 0 as we do not support
32-bit, 36-bit physical address range yet.

 xen/arch/arm/include/asm/p2m.h |  8 +-------
 xen/arch/arm/p2m.c             | 32 ++++++++++++++++++--------------
 2 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index f67e9ddc72..4ddd4643d7 100644
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
index 418997843d..1fe3cccf46 100644
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
@@ -2265,19 +2255,26 @@ void __init setup_virt_paging(void)
     } pa_range_info[] __initconst = {
         /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
         /*      PA size, t0sz(min), root-order, sl0(max) */
+        [2] = { 40,      24/*24*/,  1,          1 },
+#ifdef CONFIG_ARM_64
         [0] = { 32,      32/*32*/,  0,          1 },
         [1] = { 36,      28/*28*/,  0,          1 },
-        [2] = { 40,      24/*24*/,  1,          1 },
         [3] = { 42,      22/*22*/,  3,          1 },
         [4] = { 44,      20/*20*/,  0,          2 },
         [5] = { 48,      16/*16*/,  0,          2 },
         [6] = { 52,      12/*12*/,  4,          2 },
         [7] = { 0 }  /* Invalid */
+#else
+        [0] = { 0 },  /* Invalid */
+        [1] = { 0 },  /* Invalid */
+        [3] = { 0 }  /* Invalid */
+#endif
     };
 
     unsigned int i;
     unsigned int pa_range = 0x10; /* Larger than any possible value */
 
+#ifdef CONFIG_ARM_64
     /*
      * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
      * with IPA bits == PA bits, compare against "pabits".
@@ -2291,6 +2288,9 @@ void __init setup_virt_paging(void)
      */
     if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
         max_vmid = MAX_VMID_16_BIT;
+#else
+    p2m_ipa_bits = PADDR_BITS;
+#endif
 
     /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
     for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
@@ -2306,24 +2306,28 @@ void __init setup_virt_paging(void)
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


