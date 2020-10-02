Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2356281D17
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 22:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2337.6938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kORxZ-00029N-OT; Fri, 02 Oct 2020 20:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2337.6938; Fri, 02 Oct 2020 20:47:21 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kORxZ-000290-L5; Fri, 02 Oct 2020 20:47:21 +0000
Received: by outflank-mailman (input) for mailman id 2337;
 Fri, 02 Oct 2020 20:47:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uixu=DJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kORxY-00028v-H2
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 20:47:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4032b295-2c3f-44bd-8209-69b6dbf0e164;
 Fri, 02 Oct 2020 20:47:19 +0000 (UTC)
Received: from localhost.localdomain (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 15CE22065D;
 Fri,  2 Oct 2020 20:47:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uixu=DJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kORxY-00028v-H2
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 20:47:20 +0000
X-Inumbo-ID: 4032b295-2c3f-44bd-8209-69b6dbf0e164
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4032b295-2c3f-44bd-8209-69b6dbf0e164;
	Fri, 02 Oct 2020 20:47:19 +0000 (UTC)
Received: from localhost.localdomain (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 15CE22065D;
	Fri,  2 Oct 2020 20:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601671639;
	bh=rl0lETfRrlGNYieqFPCA3nuFxZ3gGf2in63JNwjOHHs=;
	h=From:To:Cc:Subject:Date:From;
	b=JfK2fsdKKBsNiCygi0gs1TzCiS0zm/EFyg+xVvtY51fzr+gmSEACaKuFdH4tMgk7w
	 /r1fDAkVl5fQPFktMolG86TvtNtK1Iq+KQ/F9dj3FmAxOXw3TiNVITJv16P3lqaVfV
	 DVIonzMmGeD3XFXbO2hQBXFnV+mM/ossv4NZbk1E=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	roman@zededa.com
Subject: [PATCH v2] xen/rpi4: implement watchdog-based reset
Date: Fri,  2 Oct 2020 13:47:17 -0700
Message-Id: <20201002204717.14735-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1

The preferred methord to reboot RPi4 is PSCI. If it is not available,
touching the watchdog is required to be able to reboot the board.

The implementation is based on
drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux v5.9-rc7.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
CC: roman@zededa.com
---
Changes in v2:
- improve commit message
- add Linux baseline to the commit message to be able to do comparisons
- order #includes alphabetically
- fix alignment of #defines values
- printk instead of dprintk for the "Cannot read watchdog register address" message
- uint32_t instead of u32
- newline after void __iomem *base = rpi4_map_watchdog();
---
 xen/arch/arm/platforms/brcm-raspberry-pi.c | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/platforms/brcm-raspberry-pi.c
index f5ae58a7d5..1a51732da5 100644
--- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
+++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
@@ -17,6 +17,10 @@
  * GNU General Public License for more details.
  */
 
+#include <xen/delay.h>
+#include <xen/mm.h>
+#include <xen/vmap.h>
+#include <asm/io.h>
 #include <asm/platform.h>
 
 static const char *const rpi4_dt_compat[] __initconst =
@@ -37,12 +41,69 @@ static const struct dt_device_match rpi4_blacklist_dev[] __initconst =
      * The aux peripheral also shares a page with the aux UART.
      */
     DT_MATCH_COMPATIBLE("brcm,bcm2835-aux"),
+    /* Special device used for rebooting */
+    DT_MATCH_COMPATIBLE("brcm,bcm2835-pm"),
     { /* sentinel */ },
 };
 
+
+#define PM_PASSWORD                 0x5a000000
+#define PM_RSTC                     0x1c
+#define PM_WDOG                     0x24
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
+        printk("Cannot read watchdog register address\n");
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
+    uint32_t val;
+    void __iomem *base = rpi4_map_watchdog();
+
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


