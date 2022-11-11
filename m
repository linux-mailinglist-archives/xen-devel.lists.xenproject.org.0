Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443CF625CF6
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442611.696973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUyM-0006ME-8k; Fri, 11 Nov 2022 14:25:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442611.696973; Fri, 11 Nov 2022 14:25:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUyM-0006JT-5B; Fri, 11 Nov 2022 14:25:34 +0000
Received: by outflank-mailman (input) for mailman id 442611;
 Fri, 11 Nov 2022 14:25:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otUrb-0006iO-Ut
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:18:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9c8a642-61cb-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 15:18:35 +0100 (CET)
Received: from BN9PR03CA0666.namprd03.prod.outlook.com (2603:10b6:408:10e::11)
 by DS0PR12MB6533.namprd12.prod.outlook.com (2603:10b6:8:c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 14:18:31 +0000
Received: from BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::25) by BN9PR03CA0666.outlook.office365.com
 (2603:10b6:408:10e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Fri, 11 Nov 2022 14:18:31 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT031.mail.protection.outlook.com (10.13.177.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:18:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:18:31 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:18:31 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 11 Nov 2022 08:18:29 -0600
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
X-Inumbo-ID: b9c8a642-61cb-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8N+/7J6PtYsQ7nQ8SIKMSDRIvLGgTAlvWhZCOfvgLlSYBn6PjGaadupH7W+XJXkIuxyElxp2LVNsPOEIM4FY7IlJXakcfveOUWYSqXWukmXCgbr/SRhTyFaPbo2qsLCxS3LXOBCMHMvuW6DF5G4Vi/qWs9IoBIQzsXyLip6HvE6x2h64lR2mpPCl6WF8hwT2X6ja1T/w2Ah68TQd7WTiWiRGU4YTXj7Zd9RPppLNbJqXXY7c+2krKrmmre1h/2asMHCrRUO7CVrDjLB9kfgs4TUjNhdyhP4MGEjeYs1dRVA5AjyRbQG5e/eZpvvoW9qg4Q6BNSyXr4nT1m4Np+ZIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCUBl3NeZdaqie+yGuXB6G+9OD+z9IExC+PESznGZWc=;
 b=aX0ucPRRZT0OlD7JqH1MCOmACymYYRWqRJHlRrSmfw5KwdjJ1q63r2yC+Agm9UVMRS2g0E3nTVC5YEyd8e6WCCsKG6ayJzPQ5LXeG7B3XjmfcE9HS3BZyGy6exaJfKc9ZtO23BYZaEwz5+YdI60H44j31It9yJYzbWFbyz5vG131gCsIYLP1TiVP+XB0g/YCCubqlXUgbLzsEbXqK9GVfSNdHnxdMRjCvOcX+g9lXgC6LfNNW5qlWJQL3zN9IYhJPaMkXte5FnTAObluwzLKy9KGpRh8+5i1n068wxIVtLD6lef9f/lIL5w6qpZ5zQg7QKIIsD6X4VY5lqylqna/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCUBl3NeZdaqie+yGuXB6G+9OD+z9IExC+PESznGZWc=;
 b=IzP5t8nU6b3ywdKAjRpN/RNVsh8sr46Mv7JUqrEOtz6vz2QXiXlgeOyk7wtshhTH13hc+h/NURloj7pbtgm5qlQugCFRtKurUp5U1i5qj7I1IGvJooTpmchzYf7G0b4sbGQFpUOMbd0S5vNB5/5RCi8h0+Zb5uvW16WQjBtPXY4=
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
Subject: [XEN v3 11/12] xen/Arm: GICv3: Define macros to read/write 64 bit
Date: Fri, 11 Nov 2022 14:17:38 +0000
Message-ID: <20221111141739.2872-12-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT031:EE_|DS0PR12MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc6be3e-67fd-4adb-65b9-08dac3ef9c89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LHZcWIeBuwwmekOZdYAda5ghfomTC6sxjuyLA455dMXwtkHp0WZv6nQhMB2cLidFUL5vufaGrUYR/d8JWhfRhN4G/8OCBqo1fMxcSbYv1oVYI6jLXY2MQKVBX7Jds7V5Kfjc5fP1u0VpXLriK++ioe7C/QWwHJOg1se0ZmDXsH46n09FQtXcBNnKzVgLMaaD0o7/SdaN4Or1BgFE/L9jROeyWyKxOJio4rnAj00nWm7krui0gQA85hexdFB0SV8TPrn5OTCxpi09zUWQ2n47b7+FlshAwpC+XHU4tbwl9mD+eQOuAfe85YFaYgw1vpPfiFlIcXbNk8iChvv41dZYZ68rqInUDjCplkrqmr+WeGylSUamRucFs1MEnjuJtkUnzWYRP1qaNz2fPPiXZu0h7yaNub4mIeE0hXIfyEUtcS0JADEidUAJdx0pYjFDHJT7j0NfXHN/I4ThWzF9ZLkKVaIIGPndU2K2UuwLJ1KNOnyG5QxQnmPpsxR6HkW5idVx5NAWpAJSYEpxpfJwsdu5BngmgR+uIgzeYccaQVcPZ8wbKD0JqmynWCOef7N4KTJZBsNvwf7cQ7UhNQmV6s1fr1o4QW6tCngHvGH+MkQtRflRg9ELar6W5K8C1VuuZxeM6Nkd9zwuhN2R4vrn0hsJ1n8kD3iY9Lgibti77MQEPBciKqbibsutSG58HpzXy/yDAKnRybUNpnR5VNtwTrnPT6NLkBRDCabBv8BcsVvt4AbvxMauo4dPWrBsB3JahXqlt3jrCbWNtXvtoGaMAfX+FeVO0GgfafNkVk5XSV5Cy8RhYIvPzcuDFHpA8F+clR6N
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(70586007)(86362001)(6666004)(478600001)(336012)(8676002)(6916009)(41300700001)(316002)(40460700003)(26005)(5660300002)(103116003)(1076003)(70206006)(2616005)(4326008)(36756003)(186003)(2906002)(83380400001)(82740400003)(82310400005)(47076005)(426003)(8936002)(54906003)(40480700001)(36860700001)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:18:31.6728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc6be3e-67fd-4adb-65b9-08dac3ef9c89
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6533

On AArch32, ldrd/strd instructions are not atomic when used to access MMIO.
Furthermore, ldrd/strd instructions are not decoded by Arm when running as
a guest to access emulated MMIO region.
Thus, we have defined readq_relaxed_non_atomic()/writeq_relaxed_non_atomic()
which in turn calls readl_relaxed()/writel_relaxed() for the lower and upper
32 bits.
As GICv3 registers (GICD_IROUTER, GICR_TYPER) can be accessed in a non atomic
fashion, so we have used {read/write}q_relaxed_non_atomic() on Arm32.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from :-
v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
2. No need to use le64_to_cpu() as the returned byte order is already in cpu
endianess.

v2 - 1. Replace {read/write}q_relaxed with {read/write}q_relaxed_non_atomic().

 xen/arch/arm/gic-v3.c               | 12 ++++++++++++
 xen/arch/arm/include/asm/arm32/io.h |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 6457e7033c..a5bc549765 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -651,7 +651,11 @@ static void __init gicv3_dist_init(void)
     affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
 
     for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
+#ifdef CONFIG_ARM_32
+        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);
+#else
         writeq_relaxed(affinity, GICD + GICD_IROUTER + i * 8);
+#endif
 }
 
 static int gicv3_enable_redist(void)
@@ -745,7 +749,11 @@ static int __init gicv3_populate_rdist(void)
         }
 
         do {
+#ifdef CONFIG_ARM_32
+            typer = readq_relaxed_non_atomic(ptr + GICR_TYPER);
+#else
             typer = readq_relaxed(ptr + GICR_TYPER);
+#endif
 
             if ( (typer >> 32) == aff )
             {
@@ -1265,7 +1273,11 @@ static void gicv3_irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
     affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
 
     if ( desc->irq >= NR_GIC_LOCAL_IRQS )
+#ifdef CONFIG_ARM_32
+        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->irq * 8));
+#else
         writeq_relaxed(affinity, (GICD + GICD_IROUTER + desc->irq * 8));
+#endif
 
     spin_unlock(&gicv3.lock);
 }
diff --git a/xen/arch/arm/include/asm/arm32/io.h b/xen/arch/arm/include/asm/arm32/io.h
index 73a879e9fb..4ddfbea5c2 100644
--- a/xen/arch/arm/include/asm/arm32/io.h
+++ b/xen/arch/arm/include/asm/arm32/io.h
@@ -80,17 +80,26 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
                                         __raw_readw(c)); __r; })
 #define readl_relaxed(c) ({ u32 __r = le32_to_cpu((__force __le32) \
                                         __raw_readl(c)); __r; })
+#define readq_relaxed_non_atomic(c) \
+                         ({ u64 __r = (((u64)readl_relaxed((c) + 4)) << 32) | \
+                                             readl_relaxed(c); __r; })
 
 #define writeb_relaxed(v,c)     __raw_writeb(v,c)
 #define writew_relaxed(v,c)     __raw_writew((__force u16) cpu_to_le16(v),c)
 #define writel_relaxed(v,c)     __raw_writel((__force u32) cpu_to_le32(v),c)
+#define writeq_relaxed_non_atomic(v,c) \
+                                ({ writel_relaxed((u32)v, c); \
+                                   writel_relaxed((u32)((v) >> 32), (c) + 4); })
 
 #define readb(c)                ({ u8  __v = readb_relaxed(c); __iormb(); __v; })
 #define readw(c)                ({ u16 __v = readw_relaxed(c); __iormb(); __v; })
 #define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(); __v; })
+#define readq(c)                ({ u64 __v = readq_relaxed_non_atomic(c); \
+                                             __iormb(); __v; })
 
 #define writeb(v,c)             ({ __iowmb(); writeb_relaxed(v,c); })
 #define writew(v,c)             ({ __iowmb(); writew_relaxed(v,c); })
 #define writel(v,c)             ({ __iowmb(); writel_relaxed(v,c); })
+#define writeq(v,c)             ({ __iowmb(); writeq_relaxed_non_atomic(v,c); })
 
 #endif /* _ARM_ARM32_IO_H */
-- 
2.17.1


