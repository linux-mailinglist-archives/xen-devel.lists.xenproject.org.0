Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097F889827D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 09:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700712.1094283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHt7-0006lr-K0; Thu, 04 Apr 2024 07:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700712.1094283; Thu, 04 Apr 2024 07:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsHt7-0006kV-Gd; Thu, 04 Apr 2024 07:51:57 +0000
Received: by outflank-mailman (input) for mailman id 700712;
 Thu, 04 Apr 2024 07:51:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OVy+=LJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rsHt5-0006V3-H7
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 07:51:55 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33951777-f258-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 09:51:54 +0200 (CEST)
Received: from BYAPR02CA0013.namprd02.prod.outlook.com (2603:10b6:a02:ee::26)
 by CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 07:51:50 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::c7) by BYAPR02CA0013.outlook.office365.com
 (2603:10b6:a02:ee::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Thu, 4 Apr 2024 07:51:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 4 Apr 2024 07:51:49 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 4 Apr
 2024 02:51:48 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35
 via Frontend Transport; Thu, 4 Apr 2024 02:51:47 -0500
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
X-Inumbo-ID: 33951777-f258-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bd9854KvNq4S3uQ8+2ks2kiI+T1QakE4UjO6MyWdByl8vZPjuCSu+9W5ZrKpnCgQig/wWcYfGd/bRK4sKKqYAH3WAK9IHjzpQQ/jz09fkxrGyVQfRhW1mhhup/KKJB39OPccE+SGZzktQcGzhYflFNwET17Ab179viif3qKutVwqiy/o+oQ81v3yqbvz8ALS3T3nwWi7Kpvmh4GUC5V9Zj1Q1eob0amx8zMdY8H9jL3VgQRBoFyWttgQglvD7d/YqIngqMonGv5A5w4cSaP3O3HACke5fM3LHq9kdsaWLTGEnMcxt6w5kgJFDuNiCQi1xvpEfrEoD4RUnrwtHCkcnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YgJMInRV9+naJSvwvbifqXD4WV1M7F+04rZI69ZOn8=;
 b=by3dWBn+MgArNyZzfMIDrc3ABuF2ZkmTwtQG0d5UTIwiVwl58NA9jh+Jn9sxA0e25bQk7HwA4rECyiJUJHBbcW+yUTsuLza7YclRRDV/GS00reACBGsPTREVLLaK6sGhD/5cVre7eYTJtjeM7dklpCHCbkCbAwyBYElT4OUerc8NkH3HGsMZIhgcXO3/RtCXVda+Urh+H6S9Al9GDh/uEjMsMYaFNX8q8MVb2fkFgLkLpJLLia8HekF+mFSki+0DSPS0Dj7cksqXlqvbKPruzqrEwuGRLDCJ1EwJrryX6i9R3f8xIG8pPCwGDw1COjT8/WM0hjFp9Z2Z9uPWVlZEew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YgJMInRV9+naJSvwvbifqXD4WV1M7F+04rZI69ZOn8=;
 b=0huK5KSRU5+iR4Eq05envINpSTw5G0sAmQCkXe4akmi356KW/RsJr5aN/USNu36L2/MVsGOVLGcr69ofTWmdrw19Q0fRJLjcecEFifaWu8QGT+1msthJWx2Z8TbN0okGF60SI5lhoCqPwYUMlXW/ZYvAumunO4ZvrM7sftL9zKQ=
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
Subject: [PATCH 1/2] drivers: char: Drop useless suspend/resume stubs in Arm drivers
Date: Thu, 4 Apr 2024 09:51:42 +0200
Message-ID: <20240404075143.25304-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240404075143.25304-1-michal.orzel@amd.com>
References: <20240404075143.25304-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|CY8PR12MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: f601df77-d6ba-4b62-0b93-08dc547c15d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l2LXKuPZzeuJ+SSEo88tob8b8PJuuR25wmvOFHwZR+V4l3y6OKNHmNGikDT4dcTEZpQa/3lwewaILYIXQPeZxCbQwdWjANRc+9d8czpRlsd7uT5tN3mzw9Ro+9V7seHYV53DNdGdwqgTvGv3CNEHUWlJF+6u14c8g1TBdb6JsN7LRYBNhVwTFKZCfc8TXLqN/piPTaqZuuKLw5e5ISpHlT9tEQtfh2BmIJGlWWepw/lexE+GGLxBT481QQr0rN+BvzBKNd5Akt3JCk7X6wUB92XK2qZUjOwI9MWqpkK6MmgcSOEJ7+4zVRVrsFvA4rUy5J7D7m8jMgPESO8KKwiQfaMrfvuo6/ELae+cLvFmOAUtwhfsmrjLT51hfox57Gvbgfl8KKqv0vwIMZoXdExty+Zlcm4Z9lChFOri8nzqMxQ32rnchiZUlGvFjmYnuDa8RsDhjNgAc7XtV/IML5XI43dHInd52D+LqQM8L2Vgr/848L34qUofceg72gx2dECIJChCzdC7k4iu10s0ZZw1Z0ZWFYMdKAjlnJVqpHaLrxC0OemmQL92Qg0rwgduNPLutbcsQCBM2V3hiD3AZ93LAX/lbXcOr+Xkg8GSu3zaYP1bz77R5icvpxKKpw2BEe9l5TceNU8REgM6VnHCLqQE7cHhfPdQ0fbfYZL3bZUrv1ixIgJQMC3gtPdQLERan8sUL178oSVtd1dugy33di4usvTFMidoTyONazCdb1ZRjeEzPpXt//NL4x5yZun6SJnq
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 07:51:49.5539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f601df77-d6ba-4b62-0b93-08dc547c15d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7290

On Arm we don't use console_{suspend,resume} and the corresponding
stubs in serial drivers are being redundantly copied whenever a new
driver is added. Drop them as well as useless .endboot = NULL assignment.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/char/cadence-uart.c    | 13 -------------
 xen/drivers/char/exynos4210-uart.c | 13 -------------
 xen/drivers/char/imx-lpuart.c      | 13 -------------
 xen/drivers/char/meson-uart.c      | 13 -------------
 xen/drivers/char/mvebu-uart.c      | 13 -------------
 xen/drivers/char/omap-uart.c       | 13 -------------
 xen/drivers/char/pl011.c           | 13 -------------
 xen/drivers/char/scif-uart.c       | 13 -------------
 8 files changed, 104 deletions(-)

diff --git a/xen/drivers/char/cadence-uart.c b/xen/drivers/char/cadence-uart.c
index 3618fa88d868..b2f379833f02 100644
--- a/xen/drivers/char/cadence-uart.c
+++ b/xen/drivers/char/cadence-uart.c
@@ -90,16 +90,6 @@ static void __init cuart_init_postirq(struct serial_port *port)
     cuart_write(uart, R_UART_IER, UART_SR_INTR_RTRIG);
 }
 
-static void cuart_suspend(struct serial_port *port)
-{
-    BUG();
-}
-
-static void cuart_resume(struct serial_port *port)
-{
-    BUG();
-}
-
 static int cuart_tx_ready(struct serial_port *port)
 {
     struct cuart *uart = port->uart;
@@ -143,9 +133,6 @@ static const struct vuart_info *cuart_vuart(struct serial_port *port)
 static struct uart_driver __read_mostly cuart_driver = {
     .init_preirq  = cuart_init_preirq,
     .init_postirq = cuart_init_postirq,
-    .endboot      = NULL,
-    .suspend      = cuart_suspend,
-    .resume       = cuart_resume,
     .tx_ready     = cuart_tx_ready,
     .putc         = cuart_putc,
     .getc         = cuart_getc,
diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos4210-uart.c
index b29fd75c5a1c..58901df554cb 100644
--- a/xen/drivers/char/exynos4210-uart.c
+++ b/xen/drivers/char/exynos4210-uart.c
@@ -212,16 +212,6 @@ static void __init exynos4210_uart_init_postirq(struct serial_port *port)
     exynos4210_write(uart, UMCON, exynos4210_read(uart, UMCON) | UMCON_INT_EN);
 }
 
-static void exynos4210_uart_suspend(struct serial_port *port)
-{
-    BUG(); // XXX
-}
-
-static void exynos4210_uart_resume(struct serial_port *port)
-{
-    BUG(); // XXX
-}
-
 static int exynos4210_uart_tx_ready(struct serial_port *port)
 {
     struct exynos4210_uart *uart = port->uart;
@@ -286,9 +276,6 @@ static const struct vuart_info *exynos4210_vuart_info(struct serial_port *port)
 static struct uart_driver __read_mostly exynos4210_uart_driver = {
     .init_preirq  = exynos4210_uart_init_preirq,
     .init_postirq = exynos4210_uart_init_postirq,
-    .endboot      = NULL,
-    .suspend      = exynos4210_uart_suspend,
-    .resume       = exynos4210_uart_resume,
     .tx_ready     = exynos4210_uart_tx_ready,
     .putc         = exynos4210_uart_putc,
     .getc         = exynos4210_uart_getc,
diff --git a/xen/drivers/char/imx-lpuart.c b/xen/drivers/char/imx-lpuart.c
index 522680a25cec..faf4693b66e1 100644
--- a/xen/drivers/char/imx-lpuart.c
+++ b/xen/drivers/char/imx-lpuart.c
@@ -101,16 +101,6 @@ static void __init imx_lpuart_init_postirq(struct serial_port *port)
     imx_lpuart_write(uart, UARTCTRL, temp);
 }
 
-static void imx_lpuart_suspend(struct serial_port *port)
-{
-    BUG();
-}
-
-static void imx_lpuart_resume(struct serial_port *port)
-{
-    BUG();
-}
-
 static int imx_lpuart_tx_ready(struct serial_port *port)
 {
     struct imx_lpuart *uart = port->uart;
@@ -185,9 +175,6 @@ static void imx_lpuart_stop_tx(struct serial_port *port)
 static struct uart_driver __read_mostly imx_lpuart_driver = {
     .init_preirq = imx_lpuart_init_preirq,
     .init_postirq = imx_lpuart_init_postirq,
-    .endboot = NULL,
-    .suspend = imx_lpuart_suspend,
-    .resume = imx_lpuart_resume,
     .tx_ready = imx_lpuart_tx_ready,
     .putc = imx_lpuart_putc,
     .getc = imx_lpuart_getc,
diff --git a/xen/drivers/char/meson-uart.c b/xen/drivers/char/meson-uart.c
index 694381986d07..407a276085b7 100644
--- a/xen/drivers/char/meson-uart.c
+++ b/xen/drivers/char/meson-uart.c
@@ -116,16 +116,6 @@ static void __init meson_uart_init_postirq(struct serial_port *port)
             (AML_UART_RX_INT_EN | AML_UART_TX_INT_EN));
 }
 
-static void meson_uart_suspend(struct serial_port *port)
-{
-    BUG();
-}
-
-static void meson_uart_resume(struct serial_port *port)
-{
-    BUG();
-}
-
 static void meson_uart_putc(struct serial_port *port, char c)
 {
     struct meson_uart *uart = port->uart;
@@ -191,9 +181,6 @@ static int meson_uart_tx_ready(struct serial_port *port)
 static struct uart_driver __read_mostly meson_uart_driver = {
     .init_preirq  = meson_uart_init_preirq,
     .init_postirq = meson_uart_init_postirq,
-    .endboot      = NULL,
-    .suspend      = meson_uart_suspend,
-    .resume       = meson_uart_resume,
     .putc         = meson_uart_putc,
     .getc         = meson_uart_getc,
     .tx_ready     = meson_uart_tx_ready,
diff --git a/xen/drivers/char/mvebu-uart.c b/xen/drivers/char/mvebu-uart.c
index 1913fe8b5f91..db2418576ca5 100644
--- a/xen/drivers/char/mvebu-uart.c
+++ b/xen/drivers/char/mvebu-uart.c
@@ -125,16 +125,6 @@ static void __init mvebu3700_uart_init_postirq(struct serial_port *port)
     mvebu3700_write(uart, UART_CTRL_REG, reg);
 }
 
-static void mvebu3700_uart_suspend(struct serial_port *port)
-{
-    BUG();
-}
-
-static void mvebu3700_uart_resume(struct serial_port *port)
-{
-    BUG();
-}
-
 static void mvebu3700_uart_putc(struct serial_port *port, char c)
 {
     struct mvebu3700_uart *uart = port->uart;
@@ -213,9 +203,6 @@ static int mvebu3700_uart_tx_ready(struct serial_port *port)
 static struct uart_driver __read_mostly mvebu3700_uart_driver = {
     .init_preirq  = mvebu3700_uart_init_preirq,
     .init_postirq = mvebu3700_uart_init_postirq,
-    .endboot      = NULL,
-    .suspend      = mvebu3700_uart_suspend,
-    .resume       = mvebu3700_uart_resume,
     .putc         = mvebu3700_uart_putc,
     .getc         = mvebu3700_uart_getc,
     .tx_ready     = mvebu3700_uart_tx_ready,
diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
index e4f5be22894b..f4368c158c06 100644
--- a/xen/drivers/char/omap-uart.c
+++ b/xen/drivers/char/omap-uart.c
@@ -242,16 +242,6 @@ static void __init omap_uart_init_postirq(struct serial_port *port)
     omap_write(uart, UART_IER, UART_IER_ERDAI|UART_IER_ETHREI|UART_IER_ELSI);
 }
 
-static void omap_uart_suspend(struct serial_port *port)
-{
-    BUG();
-}
-
-static void omap_uart_resume(struct serial_port *port)
-{
-    BUG();
-}
-
 static int omap_uart_tx_ready(struct serial_port *port)
 {
     struct omap_uart *uart = port->uart;
@@ -307,9 +297,6 @@ static const struct vuart_info *omap_vuart_info(struct serial_port *port)
 static struct uart_driver __read_mostly omap_uart_driver = {
     .init_preirq = omap_uart_init_preirq,
     .init_postirq = omap_uart_init_postirq,
-    .endboot = NULL,
-    .suspend = omap_uart_suspend,
-    .resume = omap_uart_resume,
     .tx_ready = omap_uart_tx_ready,
     .putc = omap_uart_putc,
     .getc = omap_uart_getc,
diff --git a/xen/drivers/char/pl011.c b/xen/drivers/char/pl011.c
index 7260a988ca65..5f9913367d51 100644
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -166,16 +166,6 @@ static void __init pl011_init_postirq(struct serial_port *port)
     pl011_write(uart, IMSC, RTI|OEI|BEI|PEI|FEI|TXI|RXI);
 }
 
-static void pl011_suspend(struct serial_port *port)
-{
-    BUG(); // XXX
-}
-
-static void pl011_resume(struct serial_port *port)
-{
-    BUG(); // XXX
-}
-
 static int pl011_tx_ready(struct serial_port *port)
 {
     struct pl011 *uart = port->uart;
@@ -232,9 +222,6 @@ static void pl011_tx_start(struct serial_port *port)
 static struct uart_driver __read_mostly pl011_driver = {
     .init_preirq  = pl011_init_preirq,
     .init_postirq = pl011_init_postirq,
-    .endboot      = NULL,
-    .suspend      = pl011_suspend,
-    .resume       = pl011_resume,
     .tx_ready     = pl011_tx_ready,
     .putc         = pl011_putc,
     .getc         = pl011_getc,
diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index b7f86f882c85..757793ca4588 100644
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -195,16 +195,6 @@ static void __init scif_uart_init_postirq(struct serial_port *port)
                 params->irq_flags);
 }
 
-static void scif_uart_suspend(struct serial_port *port)
-{
-    BUG();
-}
-
-static void scif_uart_resume(struct serial_port *port)
-{
-    BUG();
-}
-
 static int scif_uart_tx_ready(struct serial_port *port)
 {
     struct scif_uart *uart = port->uart;
@@ -284,9 +274,6 @@ static void scif_uart_stop_tx(struct serial_port *port)
 static struct uart_driver __read_mostly scif_uart_driver = {
     .init_preirq  = scif_uart_init_preirq,
     .init_postirq = scif_uart_init_postirq,
-    .endboot      = NULL,
-    .suspend      = scif_uart_suspend,
-    .resume       = scif_uart_resume,
     .tx_ready     = scif_uart_tx_ready,
     .putc         = scif_uart_putc,
     .getc         = scif_uart_getc,
-- 
2.25.1


