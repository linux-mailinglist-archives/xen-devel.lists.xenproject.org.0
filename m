Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A39937745
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2024 13:43:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761021.1170996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUm0r-0005pT-PV; Fri, 19 Jul 2024 11:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761021.1170996; Fri, 19 Jul 2024 11:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUm0r-0005nx-Md; Fri, 19 Jul 2024 11:43:01 +0000
Received: by outflank-mailman (input) for mailman id 761021;
 Fri, 19 Jul 2024 11:33:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9oqQ=OT=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sUlrd-0004gF-1D
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2024 11:33:29 +0000
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6295d89-45c2-11ef-bbfd-fd08da9f4363;
 Fri, 19 Jul 2024 13:33:27 +0200 (CEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46JBXONI100164
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2024 06:33:24 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46JBXO81041731
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jul 2024 06:33:24 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 Jul 2024 06:33:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 Jul 2024 06:33:24 -0500
Received: from localhost (nightbug.dhcp.ti.com [10.24.68.87])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46JBXNJL076804;
 Fri, 19 Jul 2024 06:33:24 -0500
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
X-Inumbo-ID: b6295d89-45c2-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721388805;
	bh=L0bRkCPaGDdgFautpIKHYtZ+R9TkSjccH9W/hhznknM=;
	h=From:To:CC:Subject:Date;
	b=K2QLL3gq0XHLIkiyVcKKJ01FPJOJ/UkBn2LFSbTE2I2m6GtJbJFhduwFZZW2CR7uk
	 4sS3QXLXTbUMxGIrOkLZXX3a9qQgVeMm1jSgzFunZru/qLBkuowoEsn6sbYWYQJG4+
	 FfIsGxuEY7q3eqwbRfZhC1s5Rbdw58SzluLiFyn8=
From: Amneesh Singh <a-singh21@ti.com>
To: <xen-devel@lists.xenproject.org>
CC: Amneesh Singh <a-singh21@ti.com>
Subject: [PATCH] drivers: char: omap-uart: add "clock-hz" option
Date: Fri, 19 Jul 2024 17:03:13 +0530
Message-ID: <20240719113313.145587-1-a-singh21@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Quite a few TI K3 devices do not have clock-frequency specified in their
respective UART nodes. However hard-coding the frequency is not a
solution as the function clock input can differ between SoCs. So,
similar to com1/com2, let the user pass the frequency as a dtuart option
via the bootargs. If not specified it will fallback to the same DT
parsing as before. For example, dtuart=serial2:clock-hz=48000000 can be
a valid bootarg.

Signed-off-by: Amneesh Singh <a-singh21@ti.com>
---
 xen/drivers/char/omap-uart.c | 62 +++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
index 1079198..660c486 100644
--- a/xen/drivers/char/omap-uart.c
+++ b/xen/drivers/char/omap-uart.c
@@ -305,33 +305,71 @@ static struct uart_driver __read_mostly omap_uart_driver = {
     .vuart_info = omap_vuart_info,
 };
 
+static void __init omap_uart_parse_config(struct omap_uart *uart,
+                                         const char *config) {
+
+    char options[256];
+    char *value, *start = options;
+
+    if ( !strcmp(config, "") )
+        return;
+
+    strlcpy(options, config, ARRAY_SIZE(options));
+
+    while (start != NULL)
+    {
+        char *name;
+
+        /* Parse next name-value pair. */
+        value = strsep(&start, ",");
+        name = strsep(&value, "=");
+
+        if ( !strcmp(name, "clock-hz") )
+            uart->clock_hz = simple_strtoul(value, NULL, 0);
+        else
+            printk("WARNING: UART configuration option %s is not supported\n",
+                   name);
+
+    }
+}
+
 static int __init omap_uart_init(struct dt_device_node *dev,
                                  const void *data)
 {
     const char *config = data;
     struct omap_uart *uart;
-    u32 clkspec;
     int res;
     paddr_t addr, size;
 
-    if ( strcmp(config, "") )
-        printk("WARNING: UART configuration is not supported\n");
-
     uart = &omap_com;
 
-    res = dt_property_read_u32(dev, "clock-frequency", &clkspec);
-    if ( !res )
-    {
-        printk("omap-uart: Unable to retrieve the clock frequency\n");
-        return -EINVAL;
-    }
-
-    uart->clock_hz = clkspec;
+    /* Default configuration. */
+    uart->clock_hz = 0;
     uart->baud = 115200;
     uart->data_bits = 8;
     uart->parity = UART_PARITY_NONE;
     uart->stop_bits = 1;
 
+    /*
+     * Parse dtuart options.
+     * Valid options:
+     *   - clock-hz
+     */
+    omap_uart_parse_config(uart, config);
+
+    /* If clock-hz is missing. */
+    if ( uart->clock_hz == 0 )
+    {
+        u32 clkspec;
+        res = dt_property_read_u32(dev, "clock-frequency", &clkspec);
+        if ( !res )
+        {
+            printk("omap-uart: Unable to retrieve the clock frequency\n");
+            return -EINVAL;
+        }
+        uart->clock_hz = clkspec;
+    }
+
     res = dt_device_get_paddr(dev, 0, &addr, &size);
     if ( res )
     {
-- 
2.34.1


