Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7FF43D5AF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217311.377402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqT2-0006Er-Tm; Wed, 27 Oct 2021 21:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217311.377402; Wed, 27 Oct 2021 21:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqT2-00062N-9W; Wed, 27 Oct 2021 21:28:16 +0000
Received: by outflank-mailman (input) for mailman id 217311;
 Wed, 27 Oct 2021 21:28:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqM0-0000sJ-D6
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:21:00 +0000
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9672a8f3-3b40-45f5-bd54-2ef11c63971a;
 Wed, 27 Oct 2021 21:18:53 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bq11so8957029lfb.10
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:53 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:52 -0700 (PDT)
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
X-Inumbo-ID: 9672a8f3-3b40-45f5-bd54-2ef11c63971a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3tizDJEeWC2iLbZdJm6My4oRtC+CKaYmiKRSIM6veO0=;
        b=P2SMTBdUazDV2Wnt33aO9FM2Ioz84SezmWonZoC9di4gBNxmpSDTZT6tEbAs+vJh3H
         Fl3mZiziafsNnSwbT1iMyr0r9bKbxSiHP3xJiOBIo4ewxSS3FiLigSFoEgJOcOsMECFU
         Ealy6ndYpUfciCkbDSvwvbDJBaKQyOcr0jiZpeL2e0iKkV4AQLDVCHRPOCPCDpkazzgq
         BERHUZw176GWVNNNOqpmpYaLAn7f4joDeIeKRo11vDGHWht2ujkzv0CrGvSNdzJe9tR3
         GFiFAzCfeg61A5JBu27BdMdrz99RW2oVhEudj/a2XZux9KH22qJjawF87cCiFM6fKipn
         F+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3tizDJEeWC2iLbZdJm6My4oRtC+CKaYmiKRSIM6veO0=;
        b=WKuF3f5jMtIPIfAp9WX/XWuZm0OkzVRuQ8n1SSOmvmAYeqHB8/JVNlgutqTd7ao/I/
         4sLUvoS8w+lUoXpHkxG4Km/HbvH2AYth1+56pNotULysNpLyFJMblvJjt9o148NCRFY3
         jh2rh7iLolIwrxXjQEgDgTUgZKu/0XzQ3h0f5bD2Nm1hOJMu8GDzbx+T5qx2s0cJ71I+
         jDRTZQ2bEqrbchtaSwBuGxqFymxnuuEFz3egntDoXUyAco0BAk4VIvt6z4PzIugTJSde
         LmmV62eUjqGp27fMVlGPjJ0o/+Kow+WlYMx/f3zSmjAXfBuO7q+22MM2FAT84BaorbK2
         JFoA==
X-Gm-Message-State: AOAM532rBXGmjDWEC0Jx6V9lAx3yhBc7WLLK2Nl1UFLIVJ0YrQD9X+ak
	zAQFJA6Ii4n6j21/IFoiNIo=
X-Google-Smtp-Source: ABdhPJw7dGE4iKe+cyeyTSJFUn+l5q/Abxrr3B6KYrOVBl1p66aP04j6vH2fcBbUhHRs8nFJgDlWqw==
X-Received: by 2002:a05:6512:1095:: with SMTP id j21mr134174lfg.274.1635369532441;
        Wed, 27 Oct 2021 14:18:52 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lee Jones <lee.jones@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Joshua Thompson <funaho@jurai.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Nick Hu <nickhu@andestech.com>,
	Greentime Hu <green.hu@gmail.com>,
	Vincent Chen <deanbo422@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Pavel Machek <pavel@ucw.cz>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	linux-omap@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 32/45] mfd: retu: Use devm_register_simple_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:02 +0300
Message-Id: <20211027211715.12671-33-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_register_simple_power_off_handler() that replaces global
pm_power_off variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/retu-mfd.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/mfd/retu-mfd.c b/drivers/mfd/retu-mfd.c
index c748fd29a220..d18f05c1f095 100644
--- a/drivers/mfd/retu-mfd.c
+++ b/drivers/mfd/retu-mfd.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/retu.h>
@@ -81,9 +82,6 @@ static struct regmap_irq_chip retu_irq_chip = {
 	.ack_base	= RETU_REG_IDR,
 };
 
-/* Retu device registered for the power off. */
-static struct retu_dev *retu_pm_power_off;
-
 static const struct resource tahvo_usb_res[] = {
 	{
 		.name	= "tahvo-usb",
@@ -165,12 +163,12 @@ int retu_write(struct retu_dev *rdev, u8 reg, u16 data)
 }
 EXPORT_SYMBOL_GPL(retu_write);
 
-static void retu_power_off(void)
+static void retu_power_off(void *data)
 {
-	struct retu_dev *rdev = retu_pm_power_off;
+	struct retu_dev *rdev = data;
 	int reg;
 
-	mutex_lock(&retu_pm_power_off->mutex);
+	mutex_lock(&rdev->mutex);
 
 	/* Ignore power button state */
 	regmap_read(rdev->regmap, RETU_REG_CC1, &reg);
@@ -183,7 +181,7 @@ static void retu_power_off(void)
 	for (;;)
 		cpu_relax();
 
-	mutex_unlock(&retu_pm_power_off->mutex);
+	mutex_unlock(&rdev->mutex);
 }
 
 static int retu_regmap_read(void *context, const void *reg, size_t reg_size,
@@ -261,6 +259,17 @@ static int retu_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 		 (ret & RETU_REG_ASICR_VILMA) ? rdat->companion_name : "",
 		 (ret >> 4) & 0x7, ret & 0xf);
 
+	if (i2c->addr == 1) {
+		ret = devm_register_simple_power_off_handler(&i2c->dev,
+							     retu_power_off,
+							     rdev);
+		if (ret) {
+			dev_err(rdev->dev,
+				"could not register power-off handler: %d\n", ret);
+			return ret;
+		}
+	}
+
 	/* Mask all interrupts. */
 	ret = retu_write(rdev, rdat->irq_chip->mask_base, 0xffff);
 	if (ret < 0)
@@ -279,10 +288,6 @@ static int retu_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
 		return ret;
 	}
 
-	if (i2c->addr == 1 && !pm_power_off) {
-		retu_pm_power_off = rdev;
-		pm_power_off	  = retu_power_off;
-	}
 
 	return 0;
 }
@@ -291,10 +296,6 @@ static int retu_remove(struct i2c_client *i2c)
 {
 	struct retu_dev *rdev = i2c_get_clientdata(i2c);
 
-	if (retu_pm_power_off == rdev) {
-		pm_power_off	  = NULL;
-		retu_pm_power_off = NULL;
-	}
 	mfd_remove_devices(rdev->dev);
 	regmap_del_irq_chip(i2c->irq, rdev->irq_data);
 
-- 
2.33.1


