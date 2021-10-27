Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBD843D5B0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:28:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217301.377387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqSz-0005WT-Vg; Wed, 27 Oct 2021 21:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217301.377387; Wed, 27 Oct 2021 21:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqSz-0005If-4c; Wed, 27 Oct 2021 21:28:13 +0000
Received: by outflank-mailman (input) for mailman id 217301;
 Wed, 27 Oct 2021 21:28:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqMP-0000sJ-Dd
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:21:25 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed9f40e7-2116-4b6d-ad37-3eab09f39abc;
 Wed, 27 Oct 2021 21:18:58 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id bp15so9015747lfb.4
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:58 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:57 -0700 (PDT)
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
X-Inumbo-ID: ed9f40e7-2116-4b6d-ad37-3eab09f39abc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Hqy/1scbv2xgSJ+Pfjnwd9vR5EU0n/d3WfB2tugTgE=;
        b=fdXEajT5ReWU0k76RL+UMQexWX6+dI9dqZX5MdJXsVZcuokskYVO71+oKjzDY4A2wc
         hJ1YtaH4eNeZaWabxSPD6IdHvppV9tDUjSfbiCZ9pzJbnyd1ILGvgPlaBo02Y2jjZnzD
         JbO/7oiPSFxLAQwFLHGGO2Gfwy8dZZlQdidry7vBInQu2wS67Np/bBN1rUC/SIaULQAp
         mZSgP8kJbrDoclvDh2sRCaJ+wiPArCAPZMKwm6/7+fwfn1T4SmuQIaJDkhw4NUU2izwl
         4ikxIWp8MhgEKidppyJcozjOV5jYdL31Pn9EYMxWJrcs7VGZ0QCvDnuFIw51Kr2focF2
         kW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Hqy/1scbv2xgSJ+Pfjnwd9vR5EU0n/d3WfB2tugTgE=;
        b=I5kACTmRG3JXiYMQEH1UugQcBwvTXlF1XclwGQBRTjvuJaE0IxJJwOWY/DxLZCTp9L
         +JFN6Y64/SnZohMczrBKTUbhipu/mO8zH13VmfBpVU9M9yEvMYEnKHKE5BMSeLC+Bc9P
         d5aQPCM93zwqCgRAR9rfKSRn/YWKAolcBCOtz4XZ6P0HQinSGybdt3mW1qIoaTjabBv8
         oHREsBzclOFRJGvczhT1yK6Fd/8YpHK+BEuH1dNIRAvKVOLkK/uQXEGoU5eyyZCiQRGe
         J72MoujsJVmYKq45CRzfJo2LukPQYj3Ki8AN72lDhFRTVlSIJ6SquICz9I/K+tZzqERA
         gnFw==
X-Gm-Message-State: AOAM5330ZC1+DL/qhfcxPA91rYSj0jeo7o3+ZhzlY0Cjlf2JudUXDye2
	laUjQDMBgyLf4MFUgGJrcMQ=
X-Google-Smtp-Source: ABdhPJxErOfbgWaHoJDyROU+wtxCyzAJwEEk/21TSkl3Wl7+6OTCwc5MbFi2KTtZM0ExVMRMX2XJDw==
X-Received: by 2002:a05:6512:344a:: with SMTP id j10mr78084lfr.653.1635369538003;
        Wed, 27 Oct 2021 14:18:58 -0700 (PDT)
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
Subject: [PATCH v2 35/45] mfd: max8907: Use devm_register_simple_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:05 +0300
Message-Id: <20211027211715.12671-36-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_register_simple_power_off_handler() that replaces global
pm_power_off variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/max8907.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 41f566e6a096..58699510311b 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
@@ -174,9 +175,10 @@ static const struct regmap_irq_chip max8907_rtc_irq_chip = {
 	.num_irqs = ARRAY_SIZE(max8907_rtc_irqs),
 };
 
-static struct max8907 *max8907_pm_off;
-static void max8907_power_off(void)
+static void max8907_power_off(void *data)
 {
+	struct max8907 *max8907_pm_off = data;
+
 	regmap_update_bits(max8907_pm_off->regmap_gen, MAX8907_REG_RESET_CNFG,
 			MAX8907_MASK_POWER_OFF, MAX8907_MASK_POWER_OFF);
 }
@@ -214,6 +216,17 @@ static int max8907_i2c_probe(struct i2c_client *i2c,
 		goto err_regmap_gen;
 	}
 
+	if (pm_off) {
+		ret = devm_register_simple_power_off_handler(&i2c->dev,
+							     max8907_power_off,
+							     max8907);
+		if (ret) {
+			dev_err(&i2c->dev,
+				"failed to register power-off handler: %d\n", ret);
+			return ret;
+		}
+	}
+
 	max8907->i2c_rtc = i2c_new_dummy_device(i2c->adapter, MAX8907_RTC_I2C_ADDR);
 	if (IS_ERR(max8907->i2c_rtc)) {
 		ret = PTR_ERR(max8907->i2c_rtc);
@@ -260,11 +273,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c,
 		goto err_add_devices;
 	}
 
-	if (pm_off && !pm_power_off) {
-		max8907_pm_off = max8907;
-		pm_power_off = max8907_power_off;
-	}
-
 	return 0;
 
 err_add_devices:
-- 
2.33.1


