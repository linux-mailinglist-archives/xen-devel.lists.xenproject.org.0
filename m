Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16F43D5B9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217350.377466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqTN-0001Wt-2K; Wed, 27 Oct 2021 21:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217350.377466; Wed, 27 Oct 2021 21:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqTM-0001M3-7a; Wed, 27 Oct 2021 21:28:36 +0000
Received: by outflank-mailman (input) for mailman id 217350;
 Wed, 27 Oct 2021 21:28:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqLv-0000sJ-D2
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:20:55 +0000
Received: from mail-lf1-x132.google.com (unknown [2a00:1450:4864:20::132])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 765197f5-6d84-42ba-939a-91f43f9d5d2b;
 Wed, 27 Oct 2021 21:18:51 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bi35so8959697lfb.9
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:51 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:50 -0700 (PDT)
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
X-Inumbo-ID: 765197f5-6d84-42ba-939a-91f43f9d5d2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MQWhTF0wBI+IugzPE3ghLHT129hypIGKpejDwrM3hyE=;
        b=RZvyurGZNweTiQS39Ean2OjgLccYrK032pC/dpD5TIetEdWActoZDZ0pbxUwZ65EB3
         f6HHqHOjaIJRkLRbNXFH+a9dD2g5xu+MxS8srOD+UoT89FXGbOpnIpBzsogwI4SrHnvI
         Xp4OXB4rFx2UJNCOe+1ontZRmKhqDl18fc0h55fLU7qhbVovqyZfQtN1oE2ZBblN4A6p
         LG+FlNBhlZ+ejJ/tR/o9Ca2I3+iU/ni7hPa9YCzdcCgi2bkMHewfSz0zfMDsoGnOZiG5
         WYH0N8y7+ABYK8jopd3eQsXttqeRRQN+xpWJ5QIjK2cUfd8tbZPE8negDAsL0a+gaJ2V
         fJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MQWhTF0wBI+IugzPE3ghLHT129hypIGKpejDwrM3hyE=;
        b=TrWHUXfnUy4TAP/21iJjmHLf5D1rssfNba3HCQtdgoa5UnY5Gi69Peuh2LaeSC+HEg
         GplshlLQwjhwi+JFPFZxZbD10p0ScPYIeMDnqQRZAK25R+CLzpOZl5y/xSZ+frcY/I9s
         PbMxWxRFTQiNpT/87xIN5ChognVwVms5Q2P8G/xhi7xQ/n072b//jy7Dfvmk4Wj1IsL8
         0hyhAhYaiiXjbDJo4p2V0b5t36wk3xBay4WEPAAR4Em4Vjo+wL3PeOr2Ypjop/r6DCB6
         hjGzu96SPJs7tUvc9OZ4qPQze0lNQ/58+FbKNRuGJai3ux1t8cbIIW8d2gFs652OrqTk
         uR5Q==
X-Gm-Message-State: AOAM533Zd8U4h9uqqxFDJ/+xq9vNGZY9tzp3qtR+BJ8GRFZAm6rKXpzL
	Rj+mKIBS1lrrF0u1roulv7M=
X-Google-Smtp-Source: ABdhPJyooWx5IN/z+hq1uWs5thGA811Cpi77JA6dUlt/XGnE5KIxJDhql9o1FzopBJlB1UrwswiMLg==
X-Received: by 2002:a05:6512:3f04:: with SMTP id y4mr131405lfa.180.1635369530580;
        Wed, 27 Oct 2021 14:18:50 -0700 (PDT)
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
Subject: [PATCH v2 31/45] mfd: axp20x: Use register_simple_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:01 +0300
Message-Id: <20211027211715.12671-32-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use register_simple_power_off_handler() that replaces global pm_power_off
variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/axp20x.c       | 22 +++++++++++-----------
 include/linux/mfd/axp20x.h |  1 +
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 8161a5dc68e8..db31fdb169e4 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -24,6 +24,7 @@
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -823,9 +824,10 @@ static const struct mfd_cell axp813_cells[] = {
 	},
 };
 
-static struct axp20x_dev *axp20x_pm_power_off;
-static void axp20x_power_off(void)
+static void axp20x_power_off(void *data)
 {
+	struct axp20x_dev *axp20x_pm_power_off = data;
+
 	if (axp20x_pm_power_off->variant == AXP288_ID)
 		return;
 
@@ -1000,10 +1002,12 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
 		return ret;
 	}
 
-	if (!pm_power_off) {
-		axp20x_pm_power_off = axp20x;
-		pm_power_off = axp20x_power_off;
-	}
+	axp20x->power_handler =
+		register_simple_power_off_handler(axp20x_power_off, axp20x);
+
+	if (IS_ERR(axp20x->power_handler))
+		dev_err(axp20x->dev, "failed to register power-off handler: %pe",
+			axp20x->power_handler);
 
 	dev_info(axp20x->dev, "AXP20X driver loaded\n");
 
@@ -1013,11 +1017,7 @@ EXPORT_SYMBOL(axp20x_device_probe);
 
 void axp20x_device_remove(struct axp20x_dev *axp20x)
 {
-	if (axp20x == axp20x_pm_power_off) {
-		axp20x_pm_power_off = NULL;
-		pm_power_off = NULL;
-	}
-
+	unregister_simple_power_off_handler(axp20x->power_handler);
 	mfd_remove_devices(axp20x->dev);
 	regmap_del_irq_chip(axp20x->irq, axp20x->regmap_irqc);
 }
diff --git a/include/linux/mfd/axp20x.h b/include/linux/mfd/axp20x.h
index 9ab0e2fca7ea..49319a0ac369 100644
--- a/include/linux/mfd/axp20x.h
+++ b/include/linux/mfd/axp20x.h
@@ -643,6 +643,7 @@ struct axp20x_dev {
 	const struct mfd_cell           *cells;
 	const struct regmap_config	*regmap_cfg;
 	const struct regmap_irq_chip	*regmap_irq_chip;
+	struct power_handler		*power_handler;
 };
 
 /* generic helper function for reading 9-16 bit wide regs */
-- 
2.33.1


