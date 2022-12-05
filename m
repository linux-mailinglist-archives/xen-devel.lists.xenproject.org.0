Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F181642ABE
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:53:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453826.711439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Cqf-0005DP-69; Mon, 05 Dec 2022 14:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453826.711439; Mon, 05 Dec 2022 14:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Cqf-0005AI-2n; Mon, 05 Dec 2022 14:53:37 +0000
Received: by outflank-mailman (input) for mailman id 453826;
 Mon, 05 Dec 2022 14:53:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p2Cqd-0005A2-Jn
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:53:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96eadaad-74ac-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 15:53:34 +0100 (CET)
Received: from CY5PR16CA0003.namprd16.prod.outlook.com (2603:10b6:930:10::7)
 by PH7PR12MB5653.namprd12.prod.outlook.com (2603:10b6:510:132::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Mon, 5 Dec
 2022 14:53:30 +0000
Received: from CY4PEPF0000C969.namprd02.prod.outlook.com
 (2603:10b6:930:10:cafe::b4) by CY5PR16CA0003.outlook.office365.com
 (2603:10b6:930:10::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19 via Frontend
 Transport; Mon, 5 Dec 2022 14:53:30 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C969.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Mon, 5 Dec 2022 14:53:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:29:48 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:29:47 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 07:29:46 -0600
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
X-Inumbo-ID: 96eadaad-74ac-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibNqC8FoPo7rMaFCj9d/D0xnm0rvzJjzhtx/VdM5AJsRntfmyRaYL3l0lqvbHtlf/DW/x/LlAzGzBflmLNK8Z09k0k0OKy2J1FjCXm9H2szuMuZ+LdC2Fj8Mop9hhagFq1tJEMR2QuRp4Zv9piMxV3OUk7U8RXyMAPFeq9BAjTYZ35jc+oUaggdofbe16SYLc4Tkk7zTfHNaJBDCQcR1FWiFJCW+s6H4sowhKDfCXh+/vcIRI/XzfeAijPT+YtAu3V1Ghr7MpMVL0xKjSogjqJkQg9WrCyWN754ljmXAD3mMUjevxxvmTlL3PwvWKgu+2JCltSo/cbSPZREBQZMTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/f6KcnxjmuXzQKyqBzEdB2sXtJfFweqelRMZY8EzeE=;
 b=nIurm1d6qwmxIfuRCQ/BR6fQmtj06FPJILsjE/RONtqspp1xJPrLd0eyAerJSk5hJ0ZJAvAO7+PehIkM+xwsVJRvChUx1j6ayWf1E0z3mFW41Px5/KWwjHXsFhGwJ2tW4PyPCZ3uFh1zNyn0n/5sJhh+9c6yP2pCQKMFR1d3GFZK9QMr5i71LBR74VCFj+qQlxuIzdu2AER5W+Xdo8JEhBxKcfyoPAoLyeWnBOAq7sax/hJbAnAvK2Qt75EDquRzTtmYdB8DYDb4tWH8q1gw9Eli72wGYUe6lwqkaRCoZbeE4AMGl/iiXO8N8o8UIxtuWZG+BHnTIEUGcMsVcRu5vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/f6KcnxjmuXzQKyqBzEdB2sXtJfFweqelRMZY8EzeE=;
 b=IQa83p4DI6R/IvI4IXp399qbFszBd0GvnG/ohFcVk/1mF+RYt/35Uysa0yo6UiRzvaUsWbDxLPqJpLfTy+BC1NRt0usPYvnV4RtKdrDnsRBHe91ce+oUdsmlQ9QnbRe9ixtY+7Vq0D9ZF0WHNcUxivqIh465uaskTlbWaWLSNV0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v5 10/11] xen/Arm: GICv3: Define macros to read/write 64 bit
Date: Mon, 5 Dec 2022 13:26:36 +0000
Message-ID: <20221205132637.26775-11-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C969:EE_|PH7PR12MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: da91b90d-46c1-41ef-78da-08dad6d0791f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OezsHa977F9yKJL3YLSi90ZqxnL3Gh5SMEJs9SMXRWe65O75vkk0zS1KN27zjameRLc6w2vuEYP/N5VDkZD7ijonJSoNdznCEmXTCiWbzy9gfEPfhFrsoO5GFg8BV13zflGyfc49jM86KKPejQ/yQ5sk4vxETJ7YlnTYXPpWO1SIX5+h10ZioXbodVwd9hMMN5bl3sjBI9xDetQDO7Gg2NTSTBMBCoWBhbNLi9C9Sy+Ml5UpIYcAWq7K1XWgIiVt/XgqCxDUrP0yLSHC/XQw+bM0k5dyVlMQCqGgnCbjtM1uBf4eSYUNh3XMPhxEwfUtCF/JRC7uA5ImlhzBJbt7HfSU9fJkcWPx5jOdFN5Q6/Cu3o58me45yWp4KUWVuOJkfqrIeIrpufar9gds3jOOHgKSt28/GxsY4jya//K7hLS3IQX0fR9IF/mzaOPVannFjhlwIKeTnid513joQ3M7NbKkx/cBU62zOnbU8n9yeT9fizP03IDf+4b7tHH1yFFz32RpyQYhzd9TGLssyfkgYZtuCOhHyt44xvgLHLfmkXoH3Dry7srRy/O6xsftXhUdLq6u8d38kqRGA0HwfpWEx26swoD6z8fqy2xjii/HMbPRyhCT9AkyG3efHhDyP4yFAtToJpWp5MN/uYh7N6GbqWMnYse+BRCludFF+vCF5o5S6ljeAGIeBFesIkNAU4bYUQBzG2h5/kHz2n8U5janEKvPNWCOh1CJURKnKVVvzwc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(46966006)(40470700004)(36840700001)(1076003)(336012)(2616005)(54906003)(40460700003)(316002)(6916009)(81166007)(36756003)(103116003)(356005)(86362001)(40480700001)(426003)(82740400003)(83380400001)(82310400005)(5660300002)(186003)(26005)(47076005)(6666004)(36860700001)(2906002)(8936002)(70206006)(41300700001)(4326008)(478600001)(8676002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 14:53:29.9056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da91b90d-46c1-41ef-78da-08dad6d0791f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C969.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5653

On AArch32, ldrd/strd instructions are not atomic when used to access MMIO.
Furthermore, ldrd/strd instructions are not decoded by Arm when running as
a guest to access emulated MMIO region.
Thus, we have defined readq_relaxed_non_atomic()/writeq_relaxed_non_atomic()
which in turn calls readl_relaxed()/writel_relaxed() for the lower and upper
32 bits.
For AArch64, readq_relaxed_non_atomic()/writeq_relaxed_non_atomic() invokes
readq_relaxed()/writeq_relaxed() respectively.
As GICv3 registers (GICD_IROUTER, GICR_TYPER) can be accessed in a non atomic
manner, so we have used readq_relaxed_non_atomic()/readq_relaxed_non_atomic().

However, the following points are noted for the non atomic access :-
1. In gicv3_dist_init(), using non atomic write on GICD_IROUTER is fine as this
gets invoked when interrupts are disabled.
2. In gicv3_populate_rdist(), using non atomic read on GICR_TYPER is fine as
the register is read and the interrupts are disabled as well.
3. In gicv3_irq_set_affinity(), using non atomic write on GICD_IROUTER. This
may be called with interrupts enabled. So, a non-atomic access (on AArch32)
means the GIC will see a transient value when only one of two 32-bit will be
updated. However, only AFF3 is defined in the upper 32 bits and they are 0, so
this will never change.
On AArch64, writeq_relaxed_non_atomic() invokes writeq_relaxed() (which is
atomic), so this problem does not arise.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from :-
v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
2. No need to use le64_to_cpu() as the returned byte order is already in cpu
endianess.

v2 - 1. Replace {read/write}q_relaxed with {read/write}q_relaxed_non_atomic().

v3 - 1. Use inline function definitions for {read/write}q_relaxed_non_atomic().
2. For AArch64, {read/write}q_relaxed_non_atomic() should invoke {read/write}q_relaxed().
Thus, we can avoid any ifdef in gic-v3.c.

v4 - 1. Updated the commit message.

 xen/arch/arm/gic-v3.c               |  6 +++---
 xen/arch/arm/include/asm/arm32/io.h | 20 ++++++++++++++++++++
 xen/arch/arm/include/asm/arm64/io.h |  2 ++
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 6457e7033c..3c5b88148c 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -651,7 +651,7 @@ static void __init gicv3_dist_init(void)
     affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
 
     for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
-        writeq_relaxed(affinity, GICD + GICD_IROUTER + i * 8);
+        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
 }
 
 static int gicv3_enable_redist(void)
@@ -745,7 +745,7 @@ static int __init gicv3_populate_rdist(void)
         }
 
         do {
-            typer = readq_relaxed(ptr + GICR_TYPER);
+            typer = readq_relaxed_non_atomic(ptr + GICR_TYPER);
 
             if ( (typer >> 32) == aff )
             {
@@ -1265,7 +1265,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
     affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
 
     if ( desc->irq >= NR_GIC_LOCAL_IRQS )
-        writeq_relaxed(affinity, (GICD + GICD_IROUTER + desc->irq * 8));
+        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->irq * 8));
 
     spin_unlock(&gicv3.lock);
 }
diff --git a/xen/arch/arm/include/asm/arm32/io.h b/xen/arch/arm/include/asm/arm32/io.h
index 73a879e9fb..782b564809 100644
--- a/xen/arch/arm/include/asm/arm32/io.h
+++ b/xen/arch/arm/include/asm/arm32/io.h
@@ -80,10 +80,30 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
                                         __raw_readw(c)); __r; })
 #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
                                         __raw_readl(c)); __r; })
+/*
+ * ldrd instructions are not decoded by Arm when running as a guest to access
+ * emulated MMIO region. Thus, readq_relaxed_non_atomic() invokes readl_relaxed()
+ * twice to read the lower and upper 32 bits.
+ */
+static inline u64 readq_relaxed_non_atomic(const volatile void __iomem *addr)
+{
+        u64 val = (((u64)readl_relaxed(addr + 4)) << 32) | readl_relaxed(addr);
+        return val;
+}
 
 #define writeb_relaxed(v,c)     __raw_writeb(v,c)
 #define writew_relaxed(v,c)     __raw_writew((__force u16) cpu_to_le16(v),c)
 #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
+/*
+ * strd instructions are not decoded by Arm when running as a guest to access
+ * emulated MMIO region. Thus, writeq_relaxed_non_atomic() invokes writel_relaxed()
+ * twice to write the lower and upper 32 bits.
+ */
+static inline void writeq_relaxed_non_atomic(u64 val, volatile void __iomem *addr)
+{
+        writel_relaxed((u32)val, addr);
+        writel_relaxed((u32)(val >> 32), addr + 4);
+}
 
 #define readb(c)                ({ u8  __v = readb_relaxed(c); __iormb(); __v; })
 #define readw(c)                ({ u16 __v = readw_relaxed(c); __iormb(); __v; })
diff --git a/xen/arch/arm/include/asm/arm64/io.h b/xen/arch/arm/include/asm/arm64/io.h
index 30bfc78d9e..2e2ab24f78 100644
--- a/xen/arch/arm/include/asm/arm64/io.h
+++ b/xen/arch/arm/include/asm/arm64/io.h
@@ -102,11 +102,13 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
 #define readw_relaxed(c)        ({ u16 __v = le16_to_cpu((__force __le16)__raw_readw(c)); __v; })
 #define readl_relaxed(c)        ({ u32 __v = le32_to_cpu((__force __le32)__raw_readl(c)); __v; })
 #define readq_relaxed(c)        ({ u64 __v = le64_to_cpu((__force __le64)__raw_readq(c)); __v; })
+#define readq_relaxed_non_atomic(c)           readq_relaxed(c)
 
 #define writeb_relaxed(v,c)     ((void)__raw_writeb((v),(c)))
 #define writew_relaxed(v,c)     ((void)__raw_writew((__force u16)cpu_to_le16(v),(c)))
 #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
 #define writeq_relaxed(v,c)     ((void)__raw_writeq((__force u64)cpu_to_le64(v),(c)))
+#define writeq_relaxed_non_atomic(v,c)        writeq_relaxed(v,c)
 
 /*
  * I/O memory access primitives. Reads are ordered relative to any
-- 
2.17.1


