Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7507A1ED8AA
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 00:32:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgbvU-0006hC-GA; Wed, 03 Jun 2020 22:32:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0WRj=7Q=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jgbvT-0006h7-1j
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 22:31:59 +0000
X-Inumbo-ID: 092b3416-a5ea-11ea-81bc-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 092b3416-a5ea-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 22:31:58 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B954F2067B;
 Wed,  3 Jun 2020 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591223518;
 bh=y0pwcX6CXfJoRYSOzlsliNS8HcDu032oeBcqYJ8YDtg=;
 h=From:To:Cc:Subject:Date:From;
 b=Twr04paC3T7wh/8UQkngPzj2fBcGsMrA0yjHW6GpY1X0O340Ms5VtN0WgInBTuZtw
 X4FOAYf/+EyibX0EXZsJ4qKvGzC9ACNfyp/mgXoo5k9AT18Ed0iBLn5ojOdXCyn+ez
 3zLEBDh7vgrLLVPd1tUJdcY86TBV6aFrDrYsFBlQ=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien@xen.org
Subject: [PATCH] xen/rpi4: implement watchdog-based reset
Date: Wed,  3 Jun 2020 15:31:56 -0700
Message-Id: <20200603223156.12767-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: cminyard@mvista.com, tamas@tklengyel.com, roman@zededa.com,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Touching the watchdog is required to be able to reboot the board.

The implementation is based on
drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/platforms/brcm-raspberry-pi.c | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c
index f5ae58a7d5..0214ae2b3c 100644
--- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
+++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
@@ -18,6 +18,10 @@
  */
 
 #include <asm/platform.h>
+#include <xen/delay.h>
+#include <xen/mm.h>
+#include <xen/vmap.h>
+#include <asm/io.h>
 
 static const char *const rpi4_dt_compat[] __initconst =
 {
@@ -37,12 +41,68 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
      * The aux peripheral also shares a page with the aux UART.
      */
     DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
+    /* Special device used for rebooting */
+    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
     { /* sentinel */ },
 };
 
+
+#define PM_PASSWORD         0x5a000000
+#define PM_RSTC             0x1c
+#define PM_WDOG             0x24
+#define PM_RSTC_WRCFG_FULL_RESET    0x00000020
+#define PM_RSTC_WRCFG_CLR           0xffffffcf
+
+static void __iomem *rpi4_map_watchdog(void)
+{
+    void __iomem *base;
+    struct dt_device_node *node;
+    paddr_t start, len;
+    int ret;
+
+    node = dt_find_compatible_node(NULL, NULL, "brcm,bcm2835-pm");
+    if ( !node )
+        return NULL;
+
+    ret = dt_device_get_address(node, 0, &start, &len);
+    if ( ret )
+    {
+        dprintk(XENLOG_ERR, "Cannot read watchdog register address\n");
+        return NULL;
+    }
+
+    base = ioremap_nocache(start & PAGE_MASK, PAGE_SIZE);
+    if ( !base )
+    {
+        dprintk(XENLOG_ERR, "Unable to map watchdog register!\n");
+        return NULL;
+    }
+
+    return base;
+}
+
+static void rpi4_reset(void)
+{
+    u32 val;
+    void __iomem *base = rpi4_map_watchdog();
+    if ( !base )
+        return;
+
+    /* use a timeout of 10 ticks (~150us) */
+    writel(10 | PM_PASSWORD, base + PM_WDOG);
+    val = readl(base + PM_RSTC);
+    val &= PM_RSTC_WRCFG_CLR;
+    val |= PM_PASSWORD | PM_RSTC_WRCFG_FULL_RESET;
+    writel(val, base + PM_RSTC);
+
+    /* No sleeping, possibly atomic. */
+    mdelay(1);
+}
+
 PLATFORM_START(rpi4, "Raspberry Pi 4")
     .compatible     = rpi4_dt_compat,
     .blacklist_dev  = rpi4_blacklist_dev,
+    .reset = rpi4_reset,
     .dma_bitsize    = 30,
 PLATFORM_END
 
-- 
2.17.1


