Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A53066E523
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 18:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479666.743691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1R-00022z-SH; Tue, 17 Jan 2023 17:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479666.743691; Tue, 17 Jan 2023 17:45:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHq1R-00020h-Mk; Tue, 17 Jan 2023 17:45:21 +0000
Received: by outflank-mailman (input) for mailman id 479666;
 Tue, 17 Jan 2023 17:45:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8eG=5O=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pHq1P-0000oY-8T
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 17:45:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2eb7650-968e-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 18:45:16 +0100 (CET)
Received: from BN9PR03CA0672.namprd03.prod.outlook.com (2603:10b6:408:10e::17)
 by PH0PR12MB8007.namprd12.prod.outlook.com (2603:10b6:510:28e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 17:45:13 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10e:cafe::d8) by BN9PR03CA0672.outlook.office365.com
 (2603:10b6:408:10e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 17:45:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 17:45:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:12 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 11:45:12 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 11:45:11 -0600
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
X-Inumbo-ID: b2eb7650-968e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbOU5Rq4WHqPNSlkBUth/U0nSMphkHQ8KaWJnpvBAGneHIBMeSsfaxkgfGN8IvjFHjV02wel4XEuPfdRMqegsShr6504eB+XoHcbxjN4G0+uo0f4DawrqnwPVHVe8XzHnkq7iQVa92vuE/TK5P5U/qt84HART7S04fPhrkNx0oGlZJkPs8R0Bw9FhFW6tjQPT8gkpPT2R0Oac2bsn0fQU/iUn6Ye+oPJLdzr2eGxxWW3jTfs+mboRvu2cCRNIz80lz54Nctz7B6Ij3Q33JwoF0q/k8vuWOv8tqdMR0/No8aveluX7EJFo4Inksv2FlPaf/t8UXEMB3JYQhFOu/9UBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D93ZyLBoRJyeXnXktUxKPuF+KODu71JUMQB/vCvmEr0=;
 b=GYm8Z2JYfLk7aX1pp7x364LcTgv4H+kH4FtMudBkp/OTmBlfTdzmoCMdemaKLamr2BjbcSWd9DoHfMgqnKaoCW9DS/HxKnlZdkDYCLA4ishvAmdw3jr9We54ABXcvTcGdK/d7x1M2zu+iYtKMaC1SaMtNOgd+WfDufvZwi5Lanj+HVFfwRQNkVUAzvSAaLBsJMBD4l7ipbb0NOtmQjdkJg5pDMGfArF+zbleU7FM0Wtfhu4y3oavh0Y8Ox+PmXNeiFCVatFVkls4UD050xCA2CP4jqPnLM2QAj42VrpUfpT9CBYaGG+k/f7JyprCWF/rMYSqtzBMkxVYuAyG3WhYtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D93ZyLBoRJyeXnXktUxKPuF+KODu71JUMQB/vCvmEr0=;
 b=xk/3wIcN6Bk2fhiazUkYrqkYd+jALndxbPIrEJyRFsXi0Ue/NP7nc+loUmuD/XMocIRVkD7gvtqUqXMLy4Ms+BMh8yUkkoFQ7BC7c1fLdLoBEPoDfDMzvtxvzADO80auBBZ9MpbrPry88ooBv0H9aawojCt4F3OxSN6cHH9vGqg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for address/size
Date: Tue, 17 Jan 2023 17:43:52 +0000
Message-ID: <20230117174358.15344-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT056:EE_|PH0PR12MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: f020d4bf-5c91-4f3f-1acc-08daf8b295d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mdJ9QSuJ8SY/fOMmssbsX+zSr5IbL7yMtPV6ML9NALHO3QoLCdZN4a2UjX75/uF7txKdxlTll5XyqCv9oW/QYMtsj76M20XRGde8ODETIfPhFRYHjOQk02FOqlR5VUDAOjxehvwek3m9lD4oRezThVqxXsFY423vcpI0lTc9+eIQbTc7Nyadn/2C9FhENLOe6XfBw27LmWRhPwV1Xn1XVHPyLBTOv+JeaIKkD3LtU0LwFXMmpazFsRi/DoqgISno+5/2wFcLvB2Kr1c4fpvvtbNFLLGEhP3TjnCKCJjEd9xQb6v2v/3zUD6hwsX6Sqb3e6iihHWYNVlp+Wi03M0BXUEGQjZvtDTQzvSvzREeQLrPexkKXYiNlUO2WF6A03PXqmTMOkN3guRaHY1WZO0pDeZvqpErOvXZAvsRRioC3X1nkoC2GXHy9TWrZ3mY7+kjMNromqwq16f4aPFq1Vzt89Yt03QpJ8MRwkfgKkorcdSBDhFZx2r0udsIrY+lKXljvoJIGaivzABNLkEIrkujQuvBG973Vyvz3tkQGb3ttf3NDLrrn79gdFtLLFQlANYaVB1KdIDxi7tNwtFsuYScYr4m8uAi6RT7eMvB2QvwRNYCCfs7MBnFJk0F45NNpiQ/XHlCLO1Xo++PX30iInadoaBmi+Cphw0+0RPfbLpAfGI+LdiHn+/ZMJmmRe9mcWmZmtUuHmM2j6BG8BAR8VURibKgxEgkbocBhl5/M4BAXM4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(2906002)(26005)(4326008)(103116003)(6916009)(36756003)(8676002)(40460700003)(70586007)(70206006)(82310400005)(41300700001)(186003)(36860700001)(1076003)(6666004)(2616005)(83380400001)(47076005)(336012)(426003)(86362001)(316002)(40480700001)(54906003)(356005)(81166007)(82740400003)(478600001)(8936002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 17:45:12.7188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f020d4bf-5c91-4f3f-1acc-08daf8b295d0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8007

One should now be able to use 'paddr_t' to represent address and size.
Consequently, one should use 'PRIpaddr' as a format specifier for paddr_t.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from -

v1 - 1. Rebased the patch.

 xen/arch/arm/domain_build.c        |  9 +++++----
 xen/arch/arm/gic-v3.c              |  2 +-
 xen/arch/arm/platforms/exynos5.c   | 26 +++++++++++++-------------
 xen/drivers/char/exynos4210-uart.c |  2 +-
 xen/drivers/char/ns16550.c         |  8 ++++----
 xen/drivers/char/omap-uart.c       |  2 +-
 xen/drivers/char/pl011.c           |  4 ++--
 xen/drivers/char/scif-uart.c       |  2 +-
 xen/drivers/passthrough/arm/smmu.c |  6 +++---
 9 files changed, 31 insertions(+), 30 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 72b9afbb4c..cf8ae37a14 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1666,7 +1666,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     dt_for_each_device_node( dt_host, np )
     {
         unsigned int naddr;
-        u64 addr, size;
+        paddr_t addr, size;
 
         naddr = dt_number_of_address(np);
 
@@ -2445,7 +2445,7 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
     unsigned int naddr;
     unsigned int i;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
     bool own_device = !dt_device_for_passthrough(dev);
     /*
      * We want to avoid mapping the MMIO in dom0 for the following cases:
@@ -2941,9 +2941,10 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
         if ( res )
         {
             printk(XENLOG_ERR "Unable to permit to dom%d access to"
-                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
+                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
                    kinfo->d->domain_id,
-                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
+                   (paddr_t) (mstart & PAGE_MASK),
+                   (paddr_t) (PAGE_ALIGN(mstart + size) - 1));
             return res;
         }
 
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index bb59ea94cd..391dfa53d7 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1393,7 +1393,7 @@ static void __init gicv3_dt_init(void)
 
     for ( i = 0; i < gicv3.rdist_count; i++ )
     {
-        uint64_t rdist_base, rdist_size;
+        paddr_t rdist_base, rdist_size;
 
         res = dt_device_get_address(node, 1 + i, &rdist_base, &rdist_size);
         if ( res )
diff --git a/xen/arch/arm/platforms/exynos5.c b/xen/arch/arm/platforms/exynos5.c
index 6560507092..f79fad9957 100644
--- a/xen/arch/arm/platforms/exynos5.c
+++ b/xen/arch/arm/platforms/exynos5.c
@@ -42,8 +42,8 @@ static int exynos5_init_time(void)
     void __iomem *mct;
     int rc;
     struct dt_device_node *node;
-    u64 mct_base_addr;
-    u64 size;
+    paddr_t mct_base_addr;
+    paddr_t size;
 
     node = dt_find_compatible_node(NULL, NULL, "samsung,exynos4210-mct");
     if ( !node )
@@ -59,7 +59,7 @@ static int exynos5_init_time(void)
         return -ENXIO;
     }
 
-    dprintk(XENLOG_INFO, "mct_base_addr: %016llx size: %016llx\n",
+    dprintk(XENLOG_INFO, "mct_base_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"\n",
             mct_base_addr, size);
 
     mct = ioremap_nocache(mct_base_addr, size);
@@ -97,9 +97,9 @@ static int __init exynos5_smp_init(void)
     struct dt_device_node *node;
     void __iomem *sysram;
     char *compatible;
-    u64 sysram_addr;
-    u64 size;
-    u64 sysram_offset;
+    paddr_t sysram_addr;
+    paddr_t size;
+    paddr_t sysram_offset;
     int rc;
 
     node = dt_find_compatible_node(NULL, NULL, "samsung,secure-firmware");
@@ -131,7 +131,7 @@ static int __init exynos5_smp_init(void)
         dprintk(XENLOG_ERR, "Error in %s\n", compatible);
         return -ENXIO;
     }
-    dprintk(XENLOG_INFO, "sysram_addr: %016llx size: %016llx offset: %016llx\n",
+    dprintk(XENLOG_INFO,"sysram_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"offset: 0x%"PRIpaddr"\n",
             sysram_addr, size, sysram_offset);
 
     sysram = ioremap_nocache(sysram_addr, size);
@@ -189,7 +189,7 @@ static int exynos5_cpu_power_up(void __iomem *power, int cpu)
     return 0;
 }
 
-static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
+static int exynos5_get_pmu_baseandsize(paddr_t *power_base_addr, paddr_t *size)
 {
     struct dt_device_node *node;
     int rc;
@@ -215,7 +215,7 @@ static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
         return -ENXIO;
     }
 
-    dprintk(XENLOG_DEBUG, "power_base_addr: %016llx size: %016llx\n",
+    dprintk(XENLOG_DEBUG, "power_base_addr: 0x%"PRIpaddr" size: 0x%"PRIpaddr"\n",
             *power_base_addr, *size);
 
     return 0;
@@ -223,8 +223,8 @@ static int exynos5_get_pmu_baseandsize(u64 *power_base_addr, u64 *size)
 
 static int exynos5_cpu_up(int cpu)
 {
-    u64 power_base_addr;
-    u64 size;
+    paddr_t power_base_addr;
+    paddr_t size;
     void __iomem *power;
     int rc;
 
@@ -256,8 +256,8 @@ static int exynos5_cpu_up(int cpu)
 
 static void exynos5_reset(void)
 {
-    u64 power_base_addr;
-    u64 size;
+    paddr_t power_base_addr;
+    paddr_t size;
     void __iomem *pmu;
     int rc;
 
diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos4210-uart.c
index 43aaf02e18..32cc8c78b5 100644
--- a/xen/drivers/char/exynos4210-uart.c
+++ b/xen/drivers/char/exynos4210-uart.c
@@ -303,7 +303,7 @@ static int __init exynos4210_uart_init(struct dt_device_node *dev,
     const char *config = data;
     struct exynos4210_uart *uart;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 58d0ccd889..8ef895a2bb 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -42,8 +42,8 @@
 
 static struct ns16550 {
     int baud, clock_hz, data_bits, parity, stop_bits, fifo_size, irq;
-    u64 io_base;   /* I/O port or memory-mapped I/O address. */
-    u64 io_size;
+    paddr_t io_base;   /* I/O port or memory-mapped I/O address. */
+    paddr_t io_size;
     int reg_shift; /* Bits to shift register offset by */
     int reg_width; /* Size of access to use, the registers
                     * themselves are still bytes */
@@ -1166,7 +1166,7 @@ static const struct ns16550_config __initconst uart_config[] =
 static int __init
 pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
 {
-    u64 orig_base = uart->io_base;
+    paddr_t orig_base = uart->io_base;
     unsigned int b, d, f, nextf, i;
 
     /* NB. Start at bus 1 to avoid AMT: a plug-in card cannot be on bus 0. */
@@ -1259,7 +1259,7 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_amt, unsigned int idx)
                     else
                         size = len & PCI_BASE_ADDRESS_MEM_MASK;
 
-                    uart->io_base = ((u64)bar_64 << 32) |
+                    uart->io_base = (paddr_t) ((u64)bar_64 << 32) |
                                     (bar & PCI_BASE_ADDRESS_MEM_MASK);
                 }
                 /* IO based */
diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
index d6a5d59aa2..3b53e1909a 100644
--- a/xen/drivers/char/omap-uart.c
+++ b/xen/drivers/char/omap-uart.c
@@ -324,7 +324,7 @@ static int __init omap_uart_init(struct dt_device_node *dev,
     struct omap_uart *uart;
     u32 clkspec;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index be67242bc0..256ec11e3f 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -222,7 +222,7 @@ static struct uart_driver __read_mostly pl011_driver = {
     .vuart_info   = pl011_vuart,
 };
 
-static int __init pl011_uart_init(int irq, u64 addr, u64 size, bool sbsa)
+static int __init pl011_uart_init(int irq, paddr_t addr, paddr_t size, bool sbsa)
 {
     struct pl011 *uart;
 
@@ -258,7 +258,7 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
 {
     const char *config = data;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
     {
diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index 2fccafe340..b425881d06 100644
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -311,7 +311,7 @@ static int __init scif_uart_init(struct dt_device_node *dev,
     const char *config = data;
     struct scif_uart *uart;
     int res;
-    u64 addr, size;
+    paddr_t addr, size;
 
     if ( strcmp(config, "") )
         printk("WARNING: UART configuration is not supported\n");
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 0a514821b3..490d253d44 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -73,8 +73,8 @@
 /* Xen: Helpers to get device MMIO and IRQs */
 struct resource
 {
-	u64 addr;
-	u64 size;
+	paddr_t addr;
+	paddr_t size;
 	unsigned int type;
 };
 
@@ -169,7 +169,7 @@ static void __iomem *devm_ioremap_resource(struct device *dev,
 	ptr = ioremap_nocache(res->addr, res->size);
 	if (!ptr) {
 		dev_err(dev,
-			"ioremap failed (addr 0x%"PRIx64" size 0x%"PRIx64")\n",
+			"ioremap failed (addr 0x%"PRIpaddr" size 0x%"PRIpaddr")\n",
 			res->addr, res->size);
 		return ERR_PTR(-ENOMEM);
 	}
-- 
2.17.1


