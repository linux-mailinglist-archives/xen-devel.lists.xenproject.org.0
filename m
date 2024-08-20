Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07979580E3
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 10:28:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780177.1189797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKDS-0005Iq-A0; Tue, 20 Aug 2024 08:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780177.1189797; Tue, 20 Aug 2024 08:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgKDS-0005Gc-6x; Tue, 20 Aug 2024 08:27:46 +0000
Received: by outflank-mailman (input) for mailman id 780177;
 Tue, 20 Aug 2024 08:27:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M/mv=PT=ti.com=a-singh21@srs-se1.protection.inumbo.net>)
 id 1sgKDQ-0005GW-1X
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 08:27:44 +0000
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10b2b315-5ece-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 10:27:42 +0200 (CEST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47K8RWEF120230;
 Tue, 20 Aug 2024 03:27:32 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47K8RWg1071446
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 20 Aug 2024 03:27:32 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 20
 Aug 2024 03:27:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 20 Aug 2024 03:27:31 -0500
Received: from localhost (nightbug.dhcp.ti.com [10.24.72.75])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47K8RU3m130710;
 Tue, 20 Aug 2024 03:27:31 -0500
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
X-Inumbo-ID: 10b2b315-5ece-11ef-a507-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724142452;
	bh=yIzF3ngTZJQyuB6CBlMow9/583cX6Io7qcEhCzHEFrg=;
	h=From:To:CC:Subject:Date;
	b=f+jt/UTk3iM6OYpx9fxz0nd/JmALR9TcZSJIAE6ezrpbiib44B17pZJ3OVr9q/WXV
	 t1FZdX2v8XSubN4dcizLWf8XGaOM4JyLkHpiGe21st2Qyn++hLWccrN2/PlwCKunRT
	 RbxD4b4QwWXj0ApU6SEdrQOiIpdLvGhK4lejfYNM=
From: Amneesh Singh <a-singh21@ti.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <sstabellini@kernel.org>,
        Amneesh Singh
	<a-singh21@ti.com>
Subject: [PATCH v2] drivers: char: omap-uart: provide a default clock frequency
Date: Tue, 20 Aug 2024 13:52:03 +0530
Message-ID: <20240820082202.326644-1-a-singh21@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Quite a few TI K3 devices do not have clock-frequency specified in their
respective UART nodes. However hard-coding the frequency is not a
solution as the function clock input can differ between SoCs. So, use a
default frequency of 48MHz if the device tree does not specify one.

Signed-off-by: Amneesh Singh <a-singh21@ti.com>
---
 xen/drivers/char/omap-uart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
---
v1: https://lore.kernel.org/all/20240719113313.145587-1-a-singh21@ti.com/T/

v1 -> v2
- Ditch adding a dtuart option
- Use a default value instead

This default is the same one as found in the 8250_omap driver of the
linux tree. Already tested with Xen.

diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
index 1079198..9d3d39c 100644
--- a/xen/drivers/char/omap-uart.c
+++ b/xen/drivers/char/omap-uart.c
@@ -48,6 +48,9 @@
 /* System configuration register */
 #define UART_OMAP_SYSC_DEF_CONF   0x0d   /* autoidle mode, wakeup is enabled */
 
+/* default clock frequency in hz */
+#define UART_OMAP_DEFAULT_CLK_SPEED 48000000
+
 #define omap_read(uart, off)       readl((uart)->regs + ((off) << REG_SHIFT))
 #define omap_write(uart, off, val) writel(val, \
                                           (uart)->regs + ((off) << REG_SHIFT))
@@ -322,8 +325,9 @@ static int __init omap_uart_init(struct dt_device_node *dev,
     res = dt_property_read_u32(dev, "clock-frequency", &clkspec);
     if ( !res )
     {
-        printk("omap-uart: Unable to retrieve the clock frequency\n");
-        return -EINVAL;
+        printk("omap-uart: Unable to retrieve the clock frequency, "
+               "defaulting to %uHz\n", UART_OMAP_DEFAULT_CLK_SPEED);
+        clkspec = UART_OMAP_DEFAULT_CLK_SPEED;
     }
 
     uart->clock_hz = clkspec;
-- 
2.34.1


