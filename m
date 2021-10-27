Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D35C43D5AD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:28:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217294.377365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqSt-0004Cl-Ls; Wed, 27 Oct 2021 21:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217294.377365; Wed, 27 Oct 2021 21:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqSs-0003sc-Sx; Wed, 27 Oct 2021 21:28:06 +0000
Received: by outflank-mailman (input) for mailman id 217294;
 Wed, 27 Oct 2021 21:28:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqLW-0000sJ-CQ
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:20:30 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86a69c89-a557-4740-824b-69dfcad5c2ab;
 Wed, 27 Oct 2021 21:18:44 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id l13so8991340lfg.6
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:44 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:42 -0700 (PDT)
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
X-Inumbo-ID: 86a69c89-a557-4740-824b-69dfcad5c2ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C0CUDQ/mpKr8nQVI8ALn1ZNGlMYg+VmEWd/lyCBC2+I=;
        b=Z3brf9Hxnc2b6ua3/QaRBg13ceKk9pypP3vq3e3axfEBPvBW41vI/qfBl8+BwawzwO
         NlHu2lL93XTrvXoS8prTqJO+oc3t3LVioKZpz1/2twqHxmO2Rep4n956JPepAb55tnvu
         Yq8u1nymmyHqcHNTOwToESfBr2ALI5JLRcu8Vew43TUipSvAyYGlhtxcdEE10JjxQ8L7
         CgvM26J/cz900816o54jCXMSmEWOFUvtpqIxxDad09smC+hGdBM0SBN82Upy8AJEypnh
         RA0SpOKKidR5e2HsVPYqqyxDECtb4bl9tRIXX4QIA46Li7tlvPD9rk0WAJDNE7RcwF/Y
         YL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C0CUDQ/mpKr8nQVI8ALn1ZNGlMYg+VmEWd/lyCBC2+I=;
        b=QYZHkayd1rU4KUiFbHPPi7aR8O2qeW/LVfrCQJUYnt5HStEqeB4cg1UyF+ntyiDSbR
         jaIhcVRzEnHzAmiXgs7z8+SdkQZtI+tggiZaPAByC+woMHrPOMvpxICkR07c0xdj39jO
         a2YuBoUt7OStOf4xYlYP4478ZMpXsBWhjhQTlgQ52lWhTmQqLqmFOmQiGWa9aVgXVC3w
         ZuSpHDgU/bh+Vm/rX3duBTih7fO2AFJ8IUAbmo0ybvN0cyZph/NyQe00ob6A85X+nqDr
         arbtgiLmI7wMMjQsrNAFV254AWJnBSwmuBY7VkPl064RVEkRy3ipEfuRpiTLvCi0w5Je
         vN+Q==
X-Gm-Message-State: AOAM5315Xdz3q2hAqaORyn7zn0EdN/AegwxiVJYasd95BRO0OuLhlDun
	HoBA0WoC3QUdfPNktT2YM1g=
X-Google-Smtp-Source: ABdhPJw9ag+XL4jMbHM8NK1hhlQp61Q60DmRHFpovh5w79ZSq7lT/XD7C7FFPkBUSvk0m7mbQoA/BQ==
X-Received: by 2002:a05:6512:31a:: with SMTP id t26mr125024lfp.280.1635369523122;
        Wed, 27 Oct 2021 14:18:43 -0700 (PDT)
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
Subject: [PATCH v2 27/45] mfd: ntxec: Use devm_register_power_handler()
Date: Thu, 28 Oct 2021 00:16:57 +0300
Message-Id: <20211027211715.12671-28-digetx@gmail.com>
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
 drivers/mfd/ntxec.c | 50 ++++++++++-----------------------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/mfd/ntxec.c b/drivers/mfd/ntxec.c
index b711e73eedcb..fd6410cbe153 100644
--- a/drivers/mfd/ntxec.c
+++ b/drivers/mfd/ntxec.c
@@ -32,12 +32,11 @@
 #define NTXEC_POWERKEEP_VALUE	0x0800
 #define NTXEC_RESET_VALUE	0xff00
 
-static struct i2c_client *poweroff_restart_client;
-
-static void ntxec_poweroff(void)
+static void ntxec_poweroff(struct power_off_data *data)
 {
 	int res;
 	u8 buf[3] = { NTXEC_REG_POWEROFF };
+	struct i2c_client *poweroff_restart_client = data->cb_data;
 	struct i2c_msg msgs[] = {
 		{
 			.addr = poweroff_restart_client->addr,
@@ -62,8 +61,7 @@ static void ntxec_poweroff(void)
 	msleep(5000);
 }
 
-static int ntxec_restart(struct notifier_block *nb,
-			 unsigned long action, void *data)
+static void ntxec_restart(struct restart_data *data)
 {
 	int res;
 	u8 buf[3] = { NTXEC_REG_RESET };
@@ -72,6 +70,7 @@ static int ntxec_restart(struct notifier_block *nb,
 	 * it causes an I2C error. (The reset handler in the downstream driver
 	 * does send the full two-byte value, but doesn't check the result).
 	 */
+	struct i2c_client *poweroff_restart_client = data->cb_data;
 	struct i2c_msg msgs[] = {
 		{
 			.addr = poweroff_restart_client->addr,
@@ -87,13 +86,11 @@ static int ntxec_restart(struct notifier_block *nb,
 	if (res < 0)
 		dev_warn(&poweroff_restart_client->dev,
 			 "Failed to restart (err = %d)\n", res);
-
-	return NOTIFY_DONE;
 }
 
-static struct notifier_block ntxec_restart_handler = {
-	.notifier_call = ntxec_restart,
-	.priority = 128,
+static struct power_handler ntxec_power_handler = {
+	.restart_cb = ntxec_restart,
+	.power_off_cb = ntxec_poweroff,
 };
 
 static int regmap_ignore_write(void *context,
@@ -208,25 +205,12 @@ static int ntxec_probe(struct i2c_client *client)
 		if (res < 0)
 			return res;
 
-		if (poweroff_restart_client)
-			/*
-			 * Another instance of the driver already took
-			 * poweroff/restart duties.
-			 */
-			dev_err(ec->dev, "poweroff_restart_client already assigned\n");
-		else
-			poweroff_restart_client = client;
-
-		if (pm_power_off)
-			/* Another driver already registered a poweroff handler. */
-			dev_err(ec->dev, "pm_power_off already assigned\n");
-		else
-			pm_power_off = ntxec_poweroff;
-
-		res = register_restart_handler(&ntxec_restart_handler);
+		ntxec_power_handler.cb_data = client;
+
+		res = devm_register_power_handler(ec->dev, &ntxec_power_handler);
 		if (res)
 			dev_err(ec->dev,
-				"Failed to register restart handler: %d\n", res);
+				"Failed to register power handler: %d\n", res);
 	}
 
 	i2c_set_clientdata(client, ec);
@@ -239,17 +223,6 @@ static int ntxec_probe(struct i2c_client *client)
 	return res;
 }
 
-static int ntxec_remove(struct i2c_client *client)
-{
-	if (client == poweroff_restart_client) {
-		poweroff_restart_client = NULL;
-		pm_power_off = NULL;
-		unregister_restart_handler(&ntxec_restart_handler);
-	}
-
-	return 0;
-}
-
 static const struct of_device_id of_ntxec_match_table[] = {
 	{ .compatible = "netronix,ntxec", },
 	{}
@@ -262,7 +235,6 @@ static struct i2c_driver ntxec_driver = {
 		.of_match_table = of_ntxec_match_table,
 	},
 	.probe_new = ntxec_probe,
-	.remove = ntxec_remove,
 };
 module_i2c_driver(ntxec_driver);
 
-- 
2.33.1


