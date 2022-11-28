Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C0663AD29
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 17:00:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449037.705699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgYX-00029u-5B; Mon, 28 Nov 2022 16:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449037.705699; Mon, 28 Nov 2022 16:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgYX-00026R-1g; Mon, 28 Nov 2022 16:00:29 +0000
Received: by outflank-mailman (input) for mailman id 449037;
 Mon, 28 Nov 2022 16:00:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozgWM-00040T-6l
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:58:14 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75c23569-6f35-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 16:58:13 +0100 (CET)
Received: from DS7PR03CA0259.namprd03.prod.outlook.com (2603:10b6:5:3b3::24)
 by MW4PR12MB6875.namprd12.prod.outlook.com (2603:10b6:303:209::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 15:58:09 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::db) by DS7PR03CA0259.outlook.office365.com
 (2603:10b6:5:3b3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Mon, 28 Nov 2022 15:58:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.21 via Frontend Transport; Mon, 28 Nov 2022 15:58:09 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:58:08 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 07:57:51 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 28 Nov 2022 09:57:50 -0600
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
X-Inumbo-ID: 75c23569-6f35-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9T7F/LPlkDIczrp4r1Twm2rL8KTGKdaDFmpb0xF+rvZ99oNzq5jDtNop41T71tOSoDHenxZY+psqjqxqTiTFlFY4YkbUHclqJTwHHnq5ZPSxcIMcnLsP0byAlEZMbyrYWPVRBjzmTDyGuqTm8zPgNo3Q4aASPBokWjxfFGdH2DM3aHDnEFDsugFo3DDmrC2PsN6fGQt1E3VwaAgDC4LliYJhhJC60F8sFARb7hxDYhYq8rW6M4okwDh7wnGyd7leSxJmAPaKcXo/BvCmTeWh+q5rrqKJ9TquF2ag19BqaBVGcLNib+PGzpOREbF4DM0m3KPrafOIVf7NGOzw4890g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emU0se7BL8VL+/8A4ZCKzlHP38dBgxnJ4wo1YN4RDW0=;
 b=Zlz+1hQAClhKGtHM5C2H5548SmvYKr2+ewwC+3D9EuFVgmjiZ5LCzp8JCV+RAawoxNfDff+1/deZGXLJTIXpTP6wuBgw5/oi0uy/9T//2gIAlbWFMshvHWp1y3VuculwRZ/GlYqdy9d2mFWsCTxjqMY5BeAAGdlT5Jc2IZQXyAk66kfUuN4qF5yAAjg/+h1cvOpNpm7OwRTw2Cmu3mJEnxjnvdhvDtbkBa3zafpkV6F5KiKR/oDRNxz6pyz1tRlbWm9ysqFpzTe4gAQy1F4jQ8sfyr6pwApMa8lk+jVUwVGAvzfuf2aEtPUS6mHis2oH8Ot2P4tTZk6Zg5eqaBD9qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emU0se7BL8VL+/8A4ZCKzlHP38dBgxnJ4wo1YN4RDW0=;
 b=CJJzdqGbc/Xm0bWnGq9EbL/einXisqvImRDQ06/C17HhTkhmpG8Wr7iDYAIkd+4gU/KgW/AT+X165IE1wJUsRz3tN3Era9BhOSqv2Z34vwhQ4tbeEKnUefNTNVBN69YhlVwDINVNqPpj+UfXLIWuxPhbn/1j2F1L2j8wybMNN/0=
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
Subject: [XEN v4 10/11] xen/Arm: GICv3: Define macros to read/write 64 bit
Date: Mon, 28 Nov 2022 15:56:48 +0000
Message-ID: <20221128155649.31386-11-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|MW4PR12MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5bff14-7f5c-48a2-f3e6-08dad1595883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DKXfLxXkqbF0CyPyN0I7j0KzRM0AB8MPdalhWzqhtMCdfjGFWlB1OBz9v12B8eEtlga58RVd6H+TnhPZJWZCLewMF90uRuFPJIrW64Vy/8rFj2tKRvHsnAhow/hLo3SLhvziHfCyEZ49uFgOH4JQchwA53ByT11rfHn+SM7KXWJDLpWz0GL8VFfoB834I3n7XN0AX98UQbW8EFy2KnQpDW1Yme9wVP02N4efozl47/C62fWySjYRZt7JX1rYEr8UIyMPK8msX9TjQnFd0hyL/sW8xbCYVo6fdPPLQCOub93h/LuvK4yWu/MpksvX4RhZ0oZhEeyZVHFGJEYXEiptIR1Hs2rEkWJM3bmqYbwrq7Ox3lzglD7E9tmn+a78dCjV8elMOjpR4VgPln+6kHzGbuV2Tx66kzCupaIQ3xrs2AZ92GWOK9uDP3roMZLdahBR1n2m4v0MR7DSneZvR7svFgZ9tiuorH/srT3z4y1XQdQrakTNYY8RfrqPuCfBubU8B/pjKyhvK03OPLrgKhInIvAslf9DDx99PJMqUn4/D76Ol9LiOGtKA0DZ141gvtVVf9YKabFYkQY1gk+c73NW4abFnKMYvbCmdx3KZ6I66uiESgnQ2QXh/cph//lMEcZ78hVhCX0RoJD8C0qEsDXSN9VnZxJGZMP/Zf0lxpXdqgo9EM5PBFQqce/0BkEcl5Ss1073Qnsi+eRAXImA9/1uz6ukCJZUd41F885uaIZQuXw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(2906002)(8936002)(36860700001)(82740400003)(70206006)(40480700001)(8676002)(40460700003)(4326008)(103116003)(86362001)(36756003)(81166007)(186003)(82310400005)(316002)(336012)(426003)(356005)(1076003)(5660300002)(83380400001)(54906003)(6916009)(41300700001)(47076005)(26005)(70586007)(2616005)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:58:09.2902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5bff14-7f5c-48a2-f3e6-08dad1595883
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6875

On AArch32, ldrd/strd instructions are not atomic when used to access MMIO.
Furthermore, ldrd/strd instructions are not decoded by Arm when running as
a guest to access emulated MMIO region.
Thus, we have defined readq_relaxed_non_atomic()/writeq_relaxed_non_atomic()
which in turn calls readl_relaxed()/writel_relaxed() for the lower and upper
32 bits.
For AArch64, readq_relaxed_non_atomic()/writeq_relaxed_non_atomic() invokes
readq_relaxed()/writeq_relaxed() respectively.
As GICv3 registers (GICD_IROUTER, GICR_TYPER) can be accessed in a non atomic
manner, so we have used readq_relaxed_non_atomic()/writeq_relaxed_non_atomic().

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
+#define readq_relaxed_non_atomic(c)           readq_relaxed((c))
 
 #define writeb_relaxed(v,c)     ((void)__raw_writeb((v),(c)))
 #define writew_relaxed(v,c)     ((void)__raw_writew((__force u16)cpu_to_le16(v),(c)))
 #define writel_relaxed(v,c)     ((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
 #define writeq_relaxed(v,c)     ((void)__raw_writeq((__force u64)cpu_to_le64(v),(c)))
+#define writeq_relaxed_non_atomic(v,c)        writeq_relaxed((v),(c))
 
 /*
  * I/O memory access primitives. Reads are ordered relative to any
-- 
2.17.1


