Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B93725A5F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544581.850501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pSU-0000XF-N8; Wed, 07 Jun 2023 09:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544581.850501; Wed, 07 Jun 2023 09:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pSU-0000SD-Hq; Wed, 07 Jun 2023 09:28:02 +0000
Received: by outflank-mailman (input) for mailman id 544581;
 Wed, 07 Jun 2023 09:28:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A2EA=B3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q6pSS-00089h-JL
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:28:00 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 956ecfd6-0515-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 11:27:56 +0200 (CEST)
Received: from BN0PR10CA0025.namprd10.prod.outlook.com (2603:10b6:408:143::22)
 by SA1PR12MB8597.namprd12.prod.outlook.com (2603:10b6:806:251::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Wed, 7 Jun
 2023 09:27:53 +0000
Received: from BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:143:cafe::c) by BN0PR10CA0025.outlook.office365.com
 (2603:10b6:408:143::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Wed, 7 Jun 2023 09:27:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT020.mail.protection.outlook.com (10.13.176.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.23 via Frontend Transport; Wed, 7 Jun 2023 09:27:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 04:27:50 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 7 Jun 2023 04:27:49 -0500
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
X-Inumbo-ID: 956ecfd6-0515-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5NxaWmhfcIBjwqdl2ZCR8gdUbJQ1d0kZbg1HfIYiV1O28f8uXe3NT3detUltOiHAf3dT+osibjO+XIe/ejs+UVjFlIIhRq+9b8C/eWMwh5s8shiNgxzlgzrjAOseaWGrEK+o2jthjMGJ7g+POPh0Fem0VX06ZTXFR27nWmJ2u+mMBxcRZbcy3aI1iEx89RzourLBIqd7NUoykgPUb6nUAXsHqOHhfGTn/G4GcpQ+U4Erp60Hpv6ETOL707DzrWS6c0yEU72ssRJdSWu0gdoiRz/m946twkJW3Q2MwgkmuutuJ8XHf3Mpsy8ysbtj1JkMkyfPRdCGfZUDe2bGL7r/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCI9MwarsbRlj2FJ9hBho2GnuBuTU9RG25ioTaHG3ao=;
 b=SPHBuI9u3zdrWmfrZBT2sqAh38updItX+sdSX6yQzqlc+ud1RHUn16y3HYrvbY9hc9Pzu8PF4jr6sNRvEC261reWNV7Jomm4Tf2ErbY1AVzOzr4qaGusnHe70MnlF022v4U3RGet7ZCGKHC2EoYg0KKmddfhPTGgQE8MYE9Hmizl0+xRcYqT4vlO/xTAo8EZTvlTWebTG5f0DHkwXJZfRjrS0pU+8jYZ2dU071HfSIrSw9DdehBLlUCA/Drwf9QkIbOie8gbRW0Uea/z7Gx47+h0KbGSqebATug1Ab3HrzMEcFIlYx63CNbUC00pl9i6YFvb9t3HyUsABi+q6oDHfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SCI9MwarsbRlj2FJ9hBho2GnuBuTU9RG25ioTaHG3ao=;
 b=HnOMR4yPVJKKaKpTYp8eaUCROER4ZnkkiXd1ElazADmvP6lHUTnIp0S+lwj9ls4pujd6tgemDNxdkU3cbJAgGyvGYJga62wnUJfpYF+dw+XPkPUO6Epi73gqUtmmH8FLqdNrYD530nQmEV/2uNBTtigqwHsLVndXav36zmdS6dM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/4] xen/arm: pl011: Use correct accessors
Date: Wed, 7 Jun 2023 11:27:26 +0200
Message-ID: <20230607092727.19654-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607092727.19654-1-michal.orzel@amd.com>
References: <20230607092727.19654-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT020:EE_|SA1PR12MB8597:EE_
X-MS-Office365-Filtering-Correlation-Id: b9949e3a-1cb8-468d-c34f-08db6739780e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VEq5zneSHZgdJSAFFcnj+rIwQNozBtJj1PF9x31nRpnLIJmmu6BzOy5hBoEhhwMqzcWW3rgqBHTlHwn/fpwK5zuTn7mzsQFChxFijR9tAYRGZEgBWFDrMfFvq1J0DYyDgDtgag4J434blmqVstuA1RyDPF1VMEovLqqO63wxyhsGQF3EBAsI9EnvtzT2eFhrNLAyilmVTngVpZUfflH/x59pWyA5PNL0xO2GlS2Clhbhbo9z+LCkFiXlJRhkR2KM+0tpt4SbEc+slI9lYQvr0onVN4384/7v2PYRhINNdns9zEU6zp6MEttZJmbkwayXkwpzccR67CMpOHv2bwaFtJOQ9Aev9r1hs3l9iKF77iMoonV1+TdPJOL+lWr660g/zSybdUFNo3C+8rkz6JznhwBbB6T9ity2yUNjCqcV6xv65OPuRM8fX3CaA6wHSBtS5FE/6XTpC6xJKcftMYZ5pQ2uv2yv8CyQBwaaPnYHgq4LXFmXiXegGvHQVG4fWX6rhXjh/BklXNINre09Q0xLLG3z/wF3pVVw17OIL+3NGalXkEhjWX08aem+rCDbjXSWb6VyEo3Eil1j999UHwSswIgQOXi8ACFZCNBjs/dln1viLVPnHd1RHUAqDegSgIE42PnVQ3o1XOdJ/sajAl0M43vwaVjT7bUryhdd5XnSK+KjzCziRFw4MOlNKwHm0p2I6XQFtgk4VrARMwQyhKKi3V1jfZrNkfnCE0QH7PgZ8jZF3/vNcYJy+jcZVvPeqnlK89BDeJ5nJ0chGpiftVxi6g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(316002)(40460700003)(41300700001)(426003)(336012)(2616005)(83380400001)(86362001)(82310400005)(36860700001)(47076005)(186003)(44832011)(1076003)(26005)(2906002)(81166007)(356005)(82740400003)(40480700001)(5660300002)(36756003)(8676002)(8936002)(70206006)(70586007)(54906003)(478600001)(4326008)(6916009)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:27:52.7618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9949e3a-1cb8-468d-c34f-08db6739780e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8597

At the moment, we use 32-bit only accessors (i.e. readl/writel) to match
the SBSA v2.x requirement. This should not be the default case for normal
PL011 where accesses shall be 8/16-bit (max register size is 16-bit).
There are however implementations of this UART that can only handle 32-bit
MMIO. This is advertised by dt property "reg-io-width" set to 4.

Introduce new struct pl011 member mmio32 and replace pl011_{read/write}
macros with static inline helpers that use 32-bit or 16-bit accessors
(largest-common not to end up using different ones depending on the actual
register size) according to mmio32 value. By default this property is set
to false, unless:
 - reg-io-width is specified with value 4,
 - SBSA UART is in use.

For now, no changes done for ACPI due to lack of testing possibilities
(i.e. current behavior maintained resulting in 32-bit accesses).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/char/pl011.c | 53 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index 052a6512515c..403b1ac06551 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -41,6 +41,7 @@ static struct pl011 {
     /* unsigned int timeout_ms; */
     /* bool_t probing, intr_works; */
     bool sbsa;  /* ARM SBSA generic interface */
+    bool mmio32; /* 32-bit only MMIO */
 } pl011_com = {0};
 
 /* These parity settings can be ORed directly into the LCR. */
@@ -50,9 +51,30 @@ static struct pl011 {
 #define PARITY_MARK  (PEN|SPS)
 #define PARITY_SPACE (PEN|EPS|SPS)
 
-/* SBSA v2.x document requires, all reads/writes must be 32-bit accesses */
-#define pl011_read(uart, off)           readl((uart)->regs + (off))
-#define pl011_write(uart, off,val)      writel((val), (uart)->regs + (off))
+/*
+ * By default, PL011 accesses shall be done using 8/16-bit accessors to
+ * support legacy devices that cannot cope with 32-bit. On the other hand,
+ * there are implementations of PL011 that can only handle 32-bit MMIO. Also,
+ * SBSA v2.x requires 32-bit accesses. Note that for default case, we use
+ * largest-common accessors (i.e. 16-bit) not to end up using different ones
+ * depending on the actual register size.
+ */
+static inline void
+pl011_write(struct pl011 *uart, unsigned int offset, unsigned int val)
+{
+    if ( uart->mmio32 )
+        writel(val, uart->regs + offset);
+    else
+        writew(val, uart->regs + offset);
+}
+
+static inline unsigned int pl011_read(struct pl011 *uart, unsigned int offset)
+{
+    if ( uart->mmio32 )
+        return readl(uart->regs + offset);
+
+    return readw(uart->regs + offset);
+}
 
 static unsigned int pl011_intr_status(struct pl011 *uart)
 {
@@ -222,7 +244,8 @@ static struct uart_driver __read_mostly pl011_driver = {
     .vuart_info   = pl011_vuart,
 };
 
-static int __init pl011_uart_init(int irq, paddr_t addr, paddr_t size, bool sbsa)
+static int __init
+pl011_uart_init(int irq, paddr_t addr, paddr_t size, bool sbsa, bool mmio32)
 {
     struct pl011 *uart;
 
@@ -233,6 +256,9 @@ static int __init pl011_uart_init(int irq, paddr_t addr, paddr_t size, bool sbsa
     uart->stop_bits = 1;
     uart->sbsa      = sbsa;
 
+    /* Set 32-bit MMIO also for SBSA since v2.x requires it */
+    uart->mmio32 = (mmio32 || sbsa);
+
     uart->regs = ioremap_nocache(addr, size);
     if ( !uart->regs )
     {
@@ -259,6 +285,8 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
     const char *config = data;
     int res;
     paddr_t addr, size;
+    uint32_t io_width;
+    bool mmio32 = false;
 
     if ( strcmp(config, "") )
     {
@@ -280,7 +308,19 @@ static int __init pl011_dt_uart_init(struct dt_device_node *dev,
         return -EINVAL;
     }
 
-    res = pl011_uart_init(res, addr, size, false);
+    /* See linux Documentation/devicetree/bindings/serial/pl011.yaml */
+    if ( dt_property_read_u32(dev, "reg-io-width", &io_width) )
+    {
+        if ( io_width == 4 )
+            mmio32 = true;
+        else if ( io_width != 1 )
+        {
+            printk("pl011: Unsupported reg-io-width (%"PRIu32")\n", io_width);
+            return -EINVAL;
+        }
+    }
+
+    res = pl011_uart_init(res, addr, size, false, mmio32);
     if ( res < 0 )
     {
         printk("pl011: Unable to initialize\n");
@@ -328,8 +368,9 @@ static int __init pl011_acpi_uart_init(const void *data)
     /* trigger/polarity information is not available in spcr */
     irq_set_type(spcr->interrupt, IRQ_TYPE_LEVEL_HIGH);
 
+    /* TODO - mmio32 proper handling (for now set to true) */
     res = pl011_uart_init(spcr->interrupt, spcr->serial_port.address,
-                          PAGE_SIZE, sbsa);
+                          PAGE_SIZE, sbsa, true);
     if ( res < 0 )
     {
         printk("pl011: Unable to initialize\n");
-- 
2.25.1


