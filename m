Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C0E43D5AC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217291.377352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqSq-0003WI-5j; Wed, 27 Oct 2021 21:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217291.377352; Wed, 27 Oct 2021 21:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqSp-0003PH-OA; Wed, 27 Oct 2021 21:28:03 +0000
Received: by outflank-mailman (input) for mailman id 217291;
 Wed, 27 Oct 2021 21:28:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqLg-0000sJ-Cm
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:20:40 +0000
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a30c3a8-3914-4552-9591-340833ae07dc;
 Wed, 27 Oct 2021 21:18:45 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id k13so6922068ljj.12
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:45 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:44 -0700 (PDT)
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
X-Inumbo-ID: 2a30c3a8-3914-4552-9591-340833ae07dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XVkgO3q8+3iXvnI8C7YHW1hpsebxqvqNvVwPho8vSws=;
        b=JvBjth71MhsyIm0JdpPylPRsS4KUFW6BneSIAqxDXDzbFjW9Bt93MWfm5UnDUVT+LY
         PN2DoVOg4LkGHqR46okUaH0xtknlZuN7sz1m2rXWFP+8ycrv0mDE2+lXOLhNQyopT3Vb
         C9HJqmEvn5NNTeFE+Yqt8PhYhqF5nNL7X6uD9nn3NzyyFpNh4ofur6IOki9Q5zCOptdK
         PNXfyjJD/8x2BE3QO9lZ5RaDpWCetJjHnzeJvzuWrsMKLwqp5dFqdwNw5X1p5tIb9H77
         X9gwILOKempj602Hj9wd8g1ui3+PA2eteBB91Roi8uzQIKwV7mQ4s5O8fFD8fUrtUyG6
         Kjfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XVkgO3q8+3iXvnI8C7YHW1hpsebxqvqNvVwPho8vSws=;
        b=Cv6uTIRUoRiNxUDYded0HSpKvlZPwGeb2gPoFy0B36ap8b767QFpNMBV3eQwfBlSQu
         YbuJgQ5blV6EV/LFQB4WxtL4goTzHhJN5L3zeKyCh/gZOnbWW3/03T24r4b2O3YuAl3d
         lu4C+bCFb0/+merDn1ZnM0tMC0lZO20loeqvgHd22ZLe86HlyaEkBVLx01yZvjIScBwG
         smxWdTRQjkalmg7AGdlb6w1SYvEwlVUlZJCIHpwf0urSSQ5K+IjgJSSnEjJhPKY3xh1A
         1fXA7GDMzn2lCQ6SOpgzt5P5L7h0un+MUx0J6TZTgNzBt9PLu86Ubxi/NKQUeyk5htiC
         OLzw==
X-Gm-Message-State: AOAM533V+wAfoJO5TwDZNOi1ZykbfglfosZqd2HY5ujTzdI+krnVL4+8
	0OuMOVx4vbuZT7+WtpfjWVo=
X-Google-Smtp-Source: ABdhPJyyXdjb3N9Ed9Jr705ZzPzIsFRHZUJ+KOYE2dHtjD39JQsr/OWSSeXdN0P7Zob21uOYhbWDdA==
X-Received: by 2002:a2e:9b55:: with SMTP id o21mr306486ljj.141.1635369524980;
        Wed, 27 Oct 2021 14:18:44 -0700 (PDT)
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
Subject: [PATCH v2 28/45] mfd: rn5t618: Use devm_register_power_handler()
Date: Thu, 28 Oct 2021 00:16:58 +0300
Message-Id: <20211027211715.12671-29-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_register_power_handler() that replaces global pm_power_off
variable and allows to register multiple power-off handlers. It also
provides restart-handler support, i.e. all in one API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/rn5t618.c | 56 ++++++++++++++++---------------------------
 1 file changed, 21 insertions(+), 35 deletions(-)

diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
index 384acb459427..12d7b2339bbe 100644
--- a/drivers/mfd/rn5t618.c
+++ b/drivers/mfd/rn5t618.c
@@ -84,9 +84,6 @@ static const struct regmap_irq_chip rc5t619_irq_chip = {
 	.mask_invert = true,
 };
 
-static struct i2c_client *rn5t618_pm_power_off;
-static struct notifier_block rn5t618_restart_handler;
-
 static int rn5t618_irq_init(struct rn5t618 *rn5t618)
 {
 	const struct regmap_irq_chip *irq_chip = NULL;
@@ -115,7 +112,9 @@ static int rn5t618_irq_init(struct rn5t618 *rn5t618)
 	return ret;
 }
 
-static void rn5t618_trigger_poweroff_sequence(bool repower)
+static void
+rn5t618_trigger_poweroff_sequence(struct i2c_client *rn5t618_pm_power_off,
+				  bool repower)
 {
 	int ret;
 
@@ -151,25 +150,31 @@ static void rn5t618_trigger_poweroff_sequence(bool repower)
 	dev_alert(&rn5t618_pm_power_off->dev, "Failed to shutdown (err = %d)\n", ret);
 }
 
-static void rn5t618_power_off(void)
+static void rn5t618_power_off(struct power_off_data *data)
 {
-	rn5t618_trigger_poweroff_sequence(false);
+	struct i2c_client *client = data->cb_data;
+
+	rn5t618_trigger_poweroff_sequence(client, false);
 }
 
-static int rn5t618_restart(struct notifier_block *this,
-			    unsigned long mode, void *cmd)
+static void rn5t618_restart(struct restart_data *data)
 {
-	rn5t618_trigger_poweroff_sequence(true);
+	struct i2c_client *client = data->cb_data;
+
+	rn5t618_trigger_poweroff_sequence(client, true);
 
 	/*
 	 * Re-power factor detection on PMIC side is not instant. 1ms
 	 * proved to be enough time until reset takes effect.
 	 */
 	mdelay(1);
-
-	return NOTIFY_DONE;
 }
 
+static struct power_handler rn5t618_power_handler = {
+	.restart_cb = rn5t618_restart,
+	.restart_priority = RESTART_PRIO_HIGH,
+};
+
 static const struct of_device_id rn5t618_of_match[] = {
 	{ .compatible = "ricoh,rn5t567", .data = (void *)RN5T567 },
 	{ .compatible = "ricoh,rn5t618", .data = (void *)RN5T618 },
@@ -221,38 +226,20 @@ static int rn5t618_i2c_probe(struct i2c_client *i2c)
 		return ret;
 	}
 
-	rn5t618_pm_power_off = i2c;
-	if (of_device_is_system_power_controller(i2c->dev.of_node)) {
-		if (!pm_power_off)
-			pm_power_off = rn5t618_power_off;
-		else
-			dev_warn(&i2c->dev, "Poweroff callback already assigned\n");
-	}
+	if (of_device_is_system_power_controller(i2c->dev.of_node))
+		rn5t618_power_handler.power_off_cb = rn5t618_power_off;
 
-	rn5t618_restart_handler.notifier_call = rn5t618_restart;
-	rn5t618_restart_handler.priority = 192;
+	rn5t618_power_handler.cb_data = i2c;
 
-	ret = register_restart_handler(&rn5t618_restart_handler);
+	ret = devm_register_power_handler(&i2c->dev, &rn5t618_power_handler);
 	if (ret) {
-		dev_err(&i2c->dev, "cannot register restart handler, %d\n", ret);
+		dev_err(&i2c->dev, "failed to register power handler: %d\n", ret);
 		return ret;
 	}
 
 	return rn5t618_irq_init(priv);
 }
 
-static int rn5t618_i2c_remove(struct i2c_client *i2c)
-{
-	if (i2c == rn5t618_pm_power_off) {
-		rn5t618_pm_power_off = NULL;
-		pm_power_off = NULL;
-	}
-
-	unregister_restart_handler(&rn5t618_restart_handler);
-
-	return 0;
-}
-
 static int __maybe_unused rn5t618_i2c_suspend(struct device *dev)
 {
 	struct rn5t618 *priv = dev_get_drvdata(dev);
@@ -284,7 +271,6 @@ static struct i2c_driver rn5t618_i2c_driver = {
 		.pm = &rn5t618_i2c_dev_pm_ops,
 	},
 	.probe_new = rn5t618_i2c_probe,
-	.remove = rn5t618_i2c_remove,
 };
 
 module_i2c_driver(rn5t618_i2c_driver);
-- 
2.33.1


