Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E220ACE3D7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 19:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005791.1385173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMs9H-00069X-O6; Wed, 04 Jun 2025 17:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005791.1385173; Wed, 04 Jun 2025 17:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMs9H-00067E-Kw; Wed, 04 Jun 2025 17:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1005791;
 Wed, 04 Jun 2025 17:43:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eifV=YT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uMs9F-0005sE-UU
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 17:43:33 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2412::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e694e76-416b-11f0-a300-13f23c93f187;
 Wed, 04 Jun 2025 19:43:33 +0200 (CEST)
Received: from SJ0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:a03:33e::11)
 by CY3PR12MB9654.namprd12.prod.outlook.com (2603:10b6:930:ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 17:43:29 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::e4) by SJ0PR03CA0036.outlook.office365.com
 (2603:10b6:a03:33e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 4 Jun 2025 17:43:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Wed, 4 Jun 2025 17:43:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 12:43:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Jun
 2025 12:43:27 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 4 Jun 2025 12:43:26 -0500
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
X-Inumbo-ID: 6e694e76-416b-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSvUND22+qfx6ALYMGRDOttp8LIF4MLG2jr0A0BDJH5OU/5dj/0zg8o78FhGSSvIrMyoWI1eq7RTo9DxZwsKooJEjExk8NU6QMowZh4U1sgnxLTVngbtWUui1/v4J5P8S+H52Yfdhj1BZaAS3OsJ68b58aULoEedqGzUSWRrAeL+dTnIZaRNQpBYc3x2gHDoXgmgl5/py2zWXYG6TGz9VoREV0k2chmi2nf1EjfV6/VBCFWcs2KK3aiIa3ZqhfNGFE/AuBfv4/lJ6d8I1lwaP1uNOzK6x0KL8qaNJ+K4ph9i+VVTgPa+mhYT8PEJqNI6yU021BhYuhX8eNzkDhwOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWnqUpJPAtydCWvyxSfMnnr9qFnPiUp527yPVVPPBQ0=;
 b=IR5mlJDtXIpv8Q7VqUH4DmAzaoML38rXK6U+u4PftMVgnfOa9eTyNZ6Kh72trcHTqROmjYphTL5X1W1yMMzmskH3UCnM11IjRAp/vb62/Q3Ty15HKsw6/IzDbOuODZUD8yvWNce5h1l2tH5xrU+vimFX1PkjatXqah2OELyapLIx1wZyblSWIbb5mPsY+m3Gc+zcJLLX0OLoa/1tONOYwcw3mokfWt6aoWhyw2CE37lGuLpSqEukp0S7Pe3ZPfOclHVyrcMNquUa+rxBm2QBCEEB+mtgvGlAFSLvwHZueL04aMrooAA2nfX2GvPeQ2Krc1NevHqCtmKMnmZnUtxkhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWnqUpJPAtydCWvyxSfMnnr9qFnPiUp527yPVVPPBQ0=;
 b=XD+tYhaSQuvL64GMDBzS3ncc0S+pQvwFCkFli1+rgqiz+mu+SM8kbvdnseLOJMsFEOIcXf6lHzDoGfy0AaOZ9l/KKDI2CQfLolimVljjwLBqVXvXzzXLWX75jpDfLaVm8iM3SNIQzVFDpp6SC7WQMGsViFLi0yu/9nHeLc5HPWQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 2/3] arm/mpu: Provide and populate MPU C data structures
Date: Wed, 4 Jun 2025 18:43:10 +0100
Message-ID: <20250604174311.754899-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|CY3PR12MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dcee06d-0e5c-4b2f-8496-08dda38f50ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OzNTRaEhXNZKAefPWDRhRLLDkl+pLNLzM9E8vvZSIjlFW4D3VBqr4+P7aK9y?=
 =?us-ascii?Q?bzVJxA8whYyMBFfJTwMdUB33HvofiAZ88OVZKXmZJSXTU+qutyDQCwcdnh7f?=
 =?us-ascii?Q?1zKvkTe65cQPkauiB5ek6jg0NIQ3KvRJo2Hhs/B57b1jXZVNg/g6n+RpRZbY?=
 =?us-ascii?Q?0hIBhwxjN0S8YmQ0YO1Wkd9OX5/DDmIIA2N854eKFzOp8hEfXzZAzpr9Z/Ke?=
 =?us-ascii?Q?4ieE2UMKVwVhKyyVpQoDcEWJh3DnYkqZy55siA/m1FQxMSWyUN2uOS+uJXLG?=
 =?us-ascii?Q?TXcd2Zwn76VGU67ncdPs4SnTEGRuTcukVKSWUwrozFXm0+RS0wpuzLGzS7Hz?=
 =?us-ascii?Q?Fkz0Yvo5jA31ABY/7RR9Oy4vZkW2wR/za2uikOlh28tP3MdK29RbtFIy76zy?=
 =?us-ascii?Q?oBbpX+oA0bS1qo5YVk3Xb2apUITFO7vsDWt/gUCcxI4zJuiF4Z31VfSY1dUf?=
 =?us-ascii?Q?RZMFcscc0ZvqCsommsvLZAi07kGqNNyiI3kQKxcckjl+bhfs2N0l8ozbqKAl?=
 =?us-ascii?Q?9N9mUXQmuHbke/ls2X6sxEIkQfqGwGjQDTJ/e0SIo5Sz2NjfQoV6qG8fstQi?=
 =?us-ascii?Q?3iDCTZUm1St7mqTZYYqQqe9yqR798vmnpgMTfleQpIWb314m7rE+ryTwdZkA?=
 =?us-ascii?Q?CwNVN8S+mGTK9DKBz5PUO77KJUU8rud5aMLbyJeysB6D72SqdJmqtiHaiZin?=
 =?us-ascii?Q?vU6RtkYqgpg89p9rsV6w1M69PMt3i+Pek2yqIHqUl2G6tFNI4/CPwUeJlVqA?=
 =?us-ascii?Q?nJtu40qB5Wx2ZFIq/oeRlI1gT7FHu/a9O8KHt28RKbXlBxGqKQWoHroN3dJv?=
 =?us-ascii?Q?qfVdzs6lMw5j8VhAI0mQgMxbvacH55GX0qC0I5khJODZkYASyBK/RHgwvNo6?=
 =?us-ascii?Q?u9FweFzfDSdi+YR8TFyXxYldoJmRo6Kn1Wsh59dLgVt+hEr5y5LLtRxukF3R?=
 =?us-ascii?Q?2iDNklrn5TRe22zltP6qMEeXSCzxhvr+UtZsPn5QgWxrZIHc8JgPRXO+hXOj?=
 =?us-ascii?Q?rYlwZVkysmvtcF6CD8fd8T6P4eG1TlP+VcH8yhgE8LlL/W6I/7AGsa8xDxnx?=
 =?us-ascii?Q?IS1XoiVZQAkSvl0lJc8lDgderIU/wS7VFUqZtQ4Bj1SQJNHYKGKayEutHPs8?=
 =?us-ascii?Q?XKGDZfj+DlOuP0tO3vd2CeaD0wWU7IkydZ+7eyAafqeNlHZlV7EsihgzULDP?=
 =?us-ascii?Q?5ij3Q7uoSRLDFQ6gNmV0LktHAYj4ZbEDvpBSxQdhtHTfuziVx2k/V2Flr5lw?=
 =?us-ascii?Q?MQ869j78x0UlKsVnLhHZlDI7Xb9RGtOtZwfBc0HqhrUU9ymYxt/VRP7NiiyT?=
 =?us-ascii?Q?ZwOVeMQBidheUcaDbFCHADB02SSAKtb0hf5oB4vhj0hQ5XIUJm2dYOQQeokn?=
 =?us-ascii?Q?oCcK+9u4nvydyJmnWndtKFTrFVVzZCA87+7FKiK6y6dJuJW3/iRStg4pCH3j?=
 =?us-ascii?Q?J+/uYDzLZXTcvgR3/zWaHO0cENyL9EAPPKCggRAOF0W4JXWeI0rjkl4r4Wjl?=
 =?us-ascii?Q?XoYINkZltqYBDMb6mWfGBL8LZTPJQnkbWjNS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 17:43:28.4076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dcee06d-0e5c-4b2f-8496-08dda38f50ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9654

Do the arm32 equivalent initialization for commit id ca5df936c4.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/arm32/asm-offsets.c         |  6 +++
 xen/arch/arm/arm32/mpu/head.S            | 57 ++++++++++++++++++++++++
 xen/arch/arm/include/asm/mpu/regions.inc |  8 +++-
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
index 8bbb0f938e..c203ce269d 100644
--- a/xen/arch/arm/arm32/asm-offsets.c
+++ b/xen/arch/arm/arm32/asm-offsets.c
@@ -75,6 +75,12 @@ void __dummy__(void)
 
    OFFSET(INITINFO_stack, struct init_info, stack);
    BLANK();
+
+#ifdef CONFIG_MPU
+   DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
+   DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
+   BLANK();
+#endif
 }
 
 /*
diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
index b2c5245e51..1f9eec6e68 100644
--- a/xen/arch/arm/arm32/mpu/head.S
+++ b/xen/arch/arm/arm32/mpu/head.S
@@ -10,6 +10,38 @@
 #include <asm/mpu/regions.inc>
 #include <asm/page.h>
 
+/*
+ * dcache_line_size - get the minimum D-cache line size from the CTR register.
+ */
+    .macro  dcache_line_size, reg, tmp1, tmp2
+    mrc CP32(\reg, CTR)           // read CTR
+    ubfx   \tmp1, \reg, #16, #4   // Extract DminLine (bits 19:16) into tmp1
+    mov    \tmp2, #1
+    lsl    \tmp2, \tmp2, \tmp1    // tmp2 = 2^DminLine
+    lsl    \tmp2, \tmp2, #2       // tmp2 = 4 * 2^DminLine = cache line size in bytes
+    .endm
+
+/*
+ * __invalidate_dcache_area(addr, size)
+ *
+ * Ensure that the data held in the cache for the buffer is invalidated.
+ *
+ * - addr - start address of the buffer
+ * - size - size of the buffer
+ */
+FUNC(__invalidate_dcache_area)
+    dcache_line_size r2, r3, r4
+    add   r1, r0, r1
+    sub   r4, r2, #1
+    bic   r0, r0, r4
+1:  mcr   CP32(r0, DCIMVAC)     /* invalidate D line / unified line */
+    add   r0, r0, r2
+    cmp   r0, r1
+    blo   1b
+    dsb   sy
+    ret
+END(__invalidate_dcache_area)
+
 /*
  * Set up the memory attribute type tables and enable EL2 MPU and data cache.
  * If the Background region is enabled, then the MPU uses the default memory
@@ -49,6 +81,10 @@ FUNC(enable_boot_cpu_mm)
     mrc   CP32(r5, MPUIR_EL2)
     and   r5, r5, #NUM_MPU_REGIONS_MASK
 
+    ldr   r0, =max_mpu_regions
+    str   r5, [r0]
+    mcr   CP32(r0, DCIMVAC) /* Invalidate cache for max_mpu_regions addr */
+
     /* x0: region sel */
     mov   r0, #0
     /* Xen text section. */
@@ -83,6 +119,27 @@ FUNC(enable_boot_cpu_mm)
     prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
 #endif
 
+zero_mpu:
+    /* Reset remaining MPU regions */
+    cmp   r0, r5
+    beq   out_zero_mpu
+    mov   r1, #0
+    mov   r2, #1
+    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prlar=REGION_DISABLED_PRLAR
+    b     zero_mpu
+
+out_zero_mpu:
+    /* Invalidate data cache for MPU data structures */
+    mov r5, lr
+    ldr r0, =xen_mpumap_mask
+    mov r1, #XEN_MPUMAP_MASK_sizeof
+    bl __invalidate_dcache_area
+
+    ldr r0, =xen_mpumap
+    mov r1, #XEN_MPUMAP_sizeof
+    bl __invalidate_dcache_area
+    mov lr, r5
+
     b    enable_mpu
 END(enable_boot_cpu_mm)
 
diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
index 6b8c233e6c..943bcda346 100644
--- a/xen/arch/arm/include/asm/mpu/regions.inc
+++ b/xen/arch/arm/include/asm/mpu/regions.inc
@@ -24,7 +24,13 @@
 #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
 
 .macro store_pair reg1, reg2, dst
-    .word 0xe7f000f0                    /* unimplemented */
+    str \reg1, [\dst]
+    add \dst, \dst, #4
+    str \reg2, [\dst]
+.endm
+
+.macro invalidate_dcache_one reg
+    mcr CP32(\reg, DCIMVAC)
 .endm
 
 #endif
-- 
2.25.1


