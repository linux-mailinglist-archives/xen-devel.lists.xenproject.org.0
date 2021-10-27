Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D643D5C3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217381.377556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqTi-0006Qb-D5; Wed, 27 Oct 2021 21:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217381.377556; Wed, 27 Oct 2021 21:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqTi-0006H9-3r; Wed, 27 Oct 2021 21:28:58 +0000
Received: by outflank-mailman (input) for mailman id 217381;
 Wed, 27 Oct 2021 21:28:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqMK-0000sJ-DQ
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:21:20 +0000
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7da57f3f-7eb8-46f0-ab3f-75a2e3b9b760;
 Wed, 27 Oct 2021 21:18:57 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id u5so6967447ljo.8
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:57 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:55 -0700 (PDT)
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
X-Inumbo-ID: 7da57f3f-7eb8-46f0-ab3f-75a2e3b9b760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J0jiL1GV/+pRa/Pi8omBJ059E/kI2yC/kBEGzY3TRbg=;
        b=FJbtoAu7rbq7E5RaKvepyk9plUf7jLnT+ML08UZjLgFiOZ5VaykzHp5Ff2lObAbFB8
         5GZGzZ57ZApIGsXSOF6gLQA97YsI0ZAQ/ZGu34m5aZxcCPPjtIEcQp67CojYOup39/Xv
         xsYx/9Bl6pD+/d5Egre5OsJvj19u3KKVwrkexlOW8n23RNvDolWdvTv8CSXdsnambAlA
         jmNsfq7r35M1wkX74Jgv3A3xCPTBUP4sDGuQeSw9FU1X/TxBftWhWMRe81zJ6SuXHAM8
         TvqOPVU0PykNu+1EXPWfVa52MP/IYJ4S57Q0SiUIct4v8BdbY1Ush4O+dDWBQRJUzf+C
         FQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J0jiL1GV/+pRa/Pi8omBJ059E/kI2yC/kBEGzY3TRbg=;
        b=dHcADv7uU+wNiNSiWnlJL7NX6jn65nJijzmlWEvvgGnBUh+NUbR4Vdy26OE6JOw+64
         J7Z3xIydOzcWbjHCn6ZJa4NOqOIyiobMyPlvAfT4997NFcrma2Peo+dG9uKnhGVvNdEP
         Akmx4Qay1ptUH4FakaQM3X0n0xxscirrXeMs+kTOrzc6diA5Bz+bA43bTP8+Gxr8619f
         Eulg9j6dn4YOg3qgtAabiMvTN6sJbya2Cas02nf/3nnQfYdWM2Ks0HPC8xsrZkUJrH2L
         WjqBZm5ZY0m6HlMBw6yvS4StIgVe9HybzSeAlb1tvCFMfDnuFgqNSauYsCAUia/GqVi5
         9Rhg==
X-Gm-Message-State: AOAM533gbJOWrxW48lXYAoodtvfh9O8C/IZ+t1V8hzh8f8UAEJyORn14
	q8la2lWLKEnCZjW4fd4lltI=
X-Google-Smtp-Source: ABdhPJwO9DbKrxmMzwfiSQzUITuZHuDXfhRgNgPDDhUghYThRMLe5cQOKy/B7VPBX8OP8l5Jmu7iAw==
X-Received: by 2002:a2e:8097:: with SMTP id i23mr314285ljg.287.1635369536096;
        Wed, 27 Oct 2021 14:18:56 -0700 (PDT)
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
Subject: [PATCH v2 34/45] mfd: palmas: Use devm_register_simple_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:04 +0300
Message-Id: <20211027211715.12671-35-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_register_simple_power_off_handler() that replaces global
pm_power_off variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/palmas.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/palmas.c b/drivers/mfd/palmas.c
index f5b3fa973b13..c7d4d48d2fda 100644
--- a/drivers/mfd/palmas.c
+++ b/drivers/mfd/palmas.c
@@ -14,6 +14,7 @@
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/err.h>
 #include <linux/mfd/core.h>
@@ -420,12 +421,12 @@ static void palmas_dt_to_pdata(struct i2c_client *i2c,
 			"ti,system-power-controller");
 }
 
-static struct palmas *palmas_dev;
-static void palmas_power_off(void)
+static void palmas_power_off(void *data)
 {
 	unsigned int addr;
 	int ret, slave;
 	u8 powerhold_mask;
+	struct palmas *palmas_dev = data;
 	struct device_node *np = palmas_dev->dev->of_node;
 
 	if (of_property_read_bool(np, "ti,palmas-override-powerhold")) {
@@ -680,12 +681,16 @@ static int palmas_i2c_probe(struct i2c_client *i2c,
 	 */
 	if (node) {
 		ret = devm_of_platform_populate(&i2c->dev);
-		if (ret < 0) {
+		if (ret < 0)
+			goto err_irq;
+	}
+
+	if (pdata->pm_off) {
+		ret = devm_register_simple_power_off_handler(&i2c->dev,
+							     palmas_power_off,
+							     palmas);
+		if (ret)
 			goto err_irq;
-		} else if (pdata->pm_off && !pm_power_off) {
-			palmas_dev = palmas;
-			pm_power_off = palmas_power_off;
-		}
 	}
 
 	return ret;
@@ -712,11 +717,6 @@ static int palmas_i2c_remove(struct i2c_client *i2c)
 			i2c_unregister_device(palmas->i2c_clients[i]);
 	}
 
-	if (palmas == palmas_dev) {
-		pm_power_off = NULL;
-		palmas_dev = NULL;
-	}
-
 	return 0;
 }
 
-- 
2.33.1


