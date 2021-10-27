Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDBE43D5BF
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217366.377525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqTa-0004QD-Aa; Wed, 27 Oct 2021 21:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217366.377525; Wed, 27 Oct 2021 21:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqTZ-00044A-8u; Wed, 27 Oct 2021 21:28:49 +0000
Received: by outflank-mailman (input) for mailman id 217366;
 Wed, 27 Oct 2021 21:28:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqMU-0000sJ-Dm
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:21:30 +0000
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f281c280-7e2c-4b52-8649-7ff7b12073ce;
 Wed, 27 Oct 2021 21:19:00 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bi35so8960334lfb.9
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:19:00 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:59 -0700 (PDT)
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
X-Inumbo-ID: f281c280-7e2c-4b52-8649-7ff7b12073ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/EvvYGeTVCQImKsIJ5eG/5fF3PWyG/w2giRYqfawyD8=;
        b=WISWhItqSg2B7RF+VMq4lOAEaPJboj2meAQ+IB5/V1NHbNJFBmj5XS0xlb4zCXSKCT
         6NsXWHZYq9LRGS+jBn6SfWgsJR2EyLsQBWeeDJtEZfPXB1ZJ5N3cxcINwqw5WxZcKDSN
         DIvIUkbk9mQPYxMXhFN2I7TObVzLJ8eVxU8hzEXgYSzj8Cm7i8BXlPfHwlq3yNPgneQb
         CHkJFZxdfY5RLlI3BGfXo88fraOgWdNEzamQkJbIJD18e+/pItOdQTQl7YVu3LpCjfDV
         vOVdkFjMAfH4ytXgGRWsun/uVtAnjn/uKIwgKMmU3X2UQuuCd1+gugzIIN8JE0FZ4XsA
         8FgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/EvvYGeTVCQImKsIJ5eG/5fF3PWyG/w2giRYqfawyD8=;
        b=U+exVGjIuZrTZvaorfdlm/oyMq/hAou4g7Vw/VviOIsVhOIHQaH7ZsgzcBUs7BDYjA
         xraSSIeYu8vLir9B69E23edFmqksnkzkDjlj0XX9iP/YQjAQsOqBvPE2H0o4GgtlRZWU
         hNb8Vt0pzE/X4FnG6j1bTSaVkkiaPKZy4XStEshgOR5EVDgbiCYau9+cgT96W8kxvvjh
         Jes/wNAAN6xcwNzNW7NF/R1UoYY+g3+1Tetx6QyDld+fZiZBt8XbGVa6aKBwJ2veesUB
         ejKBdjDxK1tTRYWB6HttVhUmGEiggrsbBMFOpESh0/WytCeQjzfCZBdMqOkMt4a2eBrR
         KceQ==
X-Gm-Message-State: AOAM533mQDpK4i0E42aqLHLCnefrjicLGCp8rNX3Nr7Sip/m3X9UaPTm
	hees8pr1YHC7aEumg+rfsP4=
X-Google-Smtp-Source: ABdhPJxRCjxAoGlWdRIW6Oj8xz2ri71YJVQnEgFasE3kMNBOfZWQ65DiEYFCvQ3qjpKPcAaJZhmXrA==
X-Received: by 2002:ac2:4c08:: with SMTP id t8mr95028lfq.281.1635369539813;
        Wed, 27 Oct 2021 14:18:59 -0700 (PDT)
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
Subject: [PATCH v2 36/45] mfd: tps6586x: Use devm_register_simple_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:06 +0300
Message-Id: <20211027211715.12671-37-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_register_simple_power_off_handler() that replaces global
pm_power_off variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/tps6586x.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/tps6586x.c b/drivers/mfd/tps6586x.c
index c9303d3d6602..9033ed936d1e 100644
--- a/drivers/mfd/tps6586x.c
+++ b/drivers/mfd/tps6586x.c
@@ -22,6 +22,7 @@
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
 
@@ -461,9 +462,10 @@ static const struct regmap_config tps6586x_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
-static struct device *tps6586x_dev;
-static void tps6586x_power_off(void)
+static void tps6586x_power_off(void *data)
 {
+	struct device *tps6586x_dev = data;
+
 	if (tps6586x_clr_bits(tps6586x_dev, TPS6586X_SUPPLYENE, EXITSLREQ_BIT))
 		return;
 
@@ -540,6 +542,16 @@ static int tps6586x_i2c_probe(struct i2c_client *client,
 		return ret;
 	}
 
+	if (pdata->pm_off) {
+		ret = devm_register_simple_power_off_handler(&client->dev,
+							     tps6586x_power_off,
+							     &client->dev);
+		if (ret) {
+			dev_err(&client->dev,
+				"failed to register power-off handler: %d\n", ret);
+			return ret;
+		}
+	}
 
 	if (client->irq) {
 		ret = tps6586x_irq_init(tps6586x, client->irq,
@@ -564,11 +576,6 @@ static int tps6586x_i2c_probe(struct i2c_client *client,
 		goto err_add_devs;
 	}
 
-	if (pdata->pm_off && !pm_power_off) {
-		tps6586x_dev = &client->dev;
-		pm_power_off = tps6586x_power_off;
-	}
-
 	return 0;
 
 err_add_devs:
-- 
2.33.1


