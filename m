Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A06443D5A0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217278.377278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqSe-0000rQ-JQ; Wed, 27 Oct 2021 21:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217278.377278; Wed, 27 Oct 2021 21:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqSe-0000jW-5U; Wed, 27 Oct 2021 21:27:52 +0000
Received: by outflank-mailman (input) for mailman id 217278;
 Wed, 27 Oct 2021 21:27:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqNS-0000sJ-FF
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:22:30 +0000
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75304b2b-e4b2-4f61-96e2-041fe02a1904;
 Wed, 27 Oct 2021 21:19:08 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id i26so5091804ljg.7
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:19:08 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:19:06 -0700 (PDT)
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
X-Inumbo-ID: 75304b2b-e4b2-4f61-96e2-041fe02a1904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IyeKRcg+jY+d7mV074g++I9amtFxwmtCwLh3hlXwjuE=;
        b=QnkHqeqzRHJ5AsPp67EWmABUOzsGTZSEBDGiay4nrsnQYbRzqAwsk2Smx/z5LQ/pzF
         rdPrmuGWIQsGZY0bghrDq1od6/1Zl94Y7Qb1GFsmOOrt3AmEW7aEpgHOlwWIuWg9pF6h
         Oq2ibAnCelRGtOXc03WYR55PI40ZligMz8SFKQbuKJzels1J9jjvQqZYNvv/xzelX9Df
         3ooSIaYPCZ69IQLFRxzA4xs/vR6PqnP/beBugw1fOkkPovapvfxOsncNdJLVW4zeoK8b
         skyzHaRP9ZlGt9pP4tePYITTWnPX31LYoVXuqb9igbxjWGO6dkZHNW0xRIrqWzuV8p7l
         c4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IyeKRcg+jY+d7mV074g++I9amtFxwmtCwLh3hlXwjuE=;
        b=yskBtUYTkO7vMc3nH96aWtDfWa/j2vhawnvPdCDsnad9aYEb2lFjMe4J3ITK2IC90U
         1Ygw3EfOcJFkfPOCXgbV5JHjXhEzY3rPQV6tRDaoGiqqZrTfTS3TKlHVttkgfwWUeA8H
         nFO9t21dbUy/S5ih6+SPhyk0FCv9JhNA24fnivHd+cmjDQ2IdYlOYQKs/o+ASPWVSNvA
         fjgXZZT8PRCoVnrZn7H9+VmyVBt7v14+t38l+KK4rUjtDuSCdAj5oyD5aP7AzHDBlq8e
         44DBwxJqFqxquWt06I0QT9vdtL3ajfBPO2bz1FdwjDLZDJ5hVceeUWhi95z8sbBWCRyv
         Hm2A==
X-Gm-Message-State: AOAM533CLgVHPhUSs2arwTkSYcJ5jFPVw/1L6BhxPYZZlcXbMERj6nOb
	ExUo7bkPlSpOtCdvtHbR3so=
X-Google-Smtp-Source: ABdhPJy4ahVYxTGf2Y3bPKsNGZG7BdaFjyQVV1JaKCPUvFr94r9L7duD8TnIWNPTqCXGHbJewLuL1g==
X-Received: by 2002:a05:651c:1256:: with SMTP id h22mr358353ljh.348.1635369547137;
        Wed, 27 Oct 2021 14:19:07 -0700 (PDT)
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
Subject: [PATCH v2 40/45] mfd: twl4030: Use devm_register_trivial_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:10 +0300
Message-Id: <20211027211715.12671-41-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_register_trivial_power_off_handler() that replaces global
pm_power_off variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/twl4030-power.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/twl4030-power.c b/drivers/mfd/twl4030-power.c
index 6b36932263ba..72df4735d628 100644
--- a/drivers/mfd/twl4030-power.c
+++ b/drivers/mfd/twl4030-power.c
@@ -29,6 +29,7 @@
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/reboot.h>
 
 #include <asm/mach-types.h>
 
@@ -923,7 +924,7 @@ static int twl4030_power_probe(struct platform_device *pdev)
 	}
 
 	/* Board has to be wired properly to use this feature */
-	if (twl4030_power_use_poweroff(pdata, node) && !pm_power_off) {
+	if (twl4030_power_use_poweroff(pdata, node)) {
 		/* Default for SEQ_OFFSYNC is set, lets ensure this */
 		err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &val,
 				      TWL4030_PM_MASTER_CFG_P123_TRANSITION);
@@ -939,7 +940,12 @@ static int twl4030_power_probe(struct platform_device *pdev)
 			}
 		}
 
-		pm_power_off = twl4030_power_off;
+		err = devm_register_trivial_power_off_handler(&pdev->dev,
+							      twl4030_power_off);
+		if (err) {
+			dev_err(&pdev->dev, "Failed to register power-off handler\n");
+			goto relock;
+		}
 	}
 
 relock:
-- 
2.33.1


