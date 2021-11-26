Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8B445F375
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 19:07:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233343.404907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfd2-0004ne-0o; Fri, 26 Nov 2021 18:07:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233343.404907; Fri, 26 Nov 2021 18:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfd1-0004hy-Sx; Fri, 26 Nov 2021 18:07:19 +0000
Received: by outflank-mailman (input) for mailman id 233343;
 Fri, 26 Nov 2021 18:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GGcH=QN=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mqfYa-0004Lf-2n
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 18:02:44 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d8a5d8d-4ee3-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 19:02:43 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id u3so26102402lfl.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 10:02:43 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:41 -0800 (PST)
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
X-Inumbo-ID: 0d8a5d8d-4ee3-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rkacp5n+z0D4++qm+Vz/WWDd0s3O3Dw6o+6i9hrIfWs=;
        b=gVRV9emu6sYX58bEEaqERVRKC91eScCKmIAjLX2VmwN0wa1+mK+MpGIyKqyjDVneT0
         8ByU8moWOxhGAZOqRsNrdfzw/WHiCdrjwDYBaylzPmQEZMm8NiqCeJ8AQeEgHT7S/aVY
         CCO/A1GW+2nvOq93OXzPg0KzCTaviylHUl0tq5vTPSN+US3W8qjKLJ1EvDiDdm2L16dZ
         LSCkAwWoIiRdWow4JUO8O6gemuLNa95U07IhIAStt4dCUOYKJkkjImr2UVsfDPgLpNiT
         j9ujQpxiayn2r2/kqDdIgM9E0hJRJ2fNIAdbLnOzVNs30eC36+Q6ixCPCRXcFB3MODk8
         4bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rkacp5n+z0D4++qm+Vz/WWDd0s3O3Dw6o+6i9hrIfWs=;
        b=SCuw2lTqbB70x7c8PDmZGWY+M9zqkheuy9herbc9ZdkDyksZVo2ipzXmpe6k4rlzvG
         MjAI0s2vDbxU9AtGALr+k44b2NytzIO8kVrmFIzy/0i1sKi1WbJp93mayWLdGW9G/VDp
         9Ac0wW7+fg2YB0yGEczOlHpM+7YSB4oC3O6P4KQWiWCzGwU2Hp9xSjS9GXaAHsutbjna
         ygjY70tUee79fPPMQYXh3zlNkKkVklc/YMHQK16GlEfHjS0NafJUT++XIgH+CNg0CdCZ
         cLH38v8KUrF68uEOjKhgf5oOnK4XJHSpp/Hnb+gMtohqiSjci6dui8N+2P07izci0F29
         YpJw==
X-Gm-Message-State: AOAM530ZmZd4AOwxJDkduQPOrXqZ3WJn4rMecCuP43lPXrTVR+OJh5g3
	JBW8pzNeDa8UcQqFOzbAAmM=
X-Google-Smtp-Source: ABdhPJw9MgRdDicBI5Wn+wcNNayaaGrQ2l/CdlCTBQ9OL1cXXIqajfZf9e0vPeOiFVQvkoIkt+lx2w==
X-Received: by 2002:a05:6512:1324:: with SMTP id x36mr31672997lfu.141.1637949761995;
        Fri, 26 Nov 2021 10:02:41 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Joshua Thompson <funaho@jurai.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sebastian Reichel <sre@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
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
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee.jones@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	alankao@andestech.com,
	"K . C . Kuen-Chern Lin" <kclin@andestech.com>
Cc: linux-arm-kernel@lists.infradead.org,
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
	linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 24/25] regulator: pfuze100: Use devm_register_sys_off_handler()
Date: Fri, 26 Nov 2021 21:01:00 +0300
Message-Id: <20211126180101.27818-25-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_register_sys_off_handler() that replaces global
pm_power_off_prepare variable and allows to register multiple
power-off handlers.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/pfuze100-regulator.c | 38 ++++++++++----------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index d60d7d1b7fa2..2eca8d43a097 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -10,6 +10,7 @@
 #include <linux/of_device.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/pfuze100.h>
@@ -76,6 +77,7 @@ struct pfuze_chip {
 	struct pfuze_regulator regulator_descs[PFUZE100_MAX_REGULATOR];
 	struct regulator_dev *regulators[PFUZE100_MAX_REGULATOR];
 	struct pfuze_regulator *pfuze_regulators;
+	struct sys_off_handler sys_off;
 };
 
 static const int pfuze100_swbst[] = {
@@ -569,10 +571,10 @@ static inline struct device_node *match_of_node(int index)
 	return pfuze_matches[index].of_node;
 }
 
-static struct pfuze_chip *syspm_pfuze_chip;
-
-static void pfuze_power_off_prepare(void)
+static void pfuze_power_off_prepare(struct power_off_prep_data *data)
 {
+	struct pfuze_chip *syspm_pfuze_chip = data->cb_data;
+
 	dev_info(syspm_pfuze_chip->dev, "Configure standby mode for power off");
 
 	/* Switch from default mode: APS/APS to APS/Off */
@@ -611,24 +613,23 @@ static void pfuze_power_off_prepare(void)
 
 static int pfuze_power_off_prepare_init(struct pfuze_chip *pfuze_chip)
 {
+	int err;
+
 	if (pfuze_chip->chip_id != PFUZE100) {
 		dev_warn(pfuze_chip->dev, "Requested pm_power_off_prepare handler for not supported chip\n");
 		return -ENODEV;
 	}
 
-	if (pm_power_off_prepare) {
-		dev_warn(pfuze_chip->dev, "pm_power_off_prepare is already registered.\n");
-		return -EBUSY;
-	}
+	pfuze_chip->sys_off.power_off_prepare_cb = pfuze_power_off_prepare;
+	pfuze_chip->sys_off.cb_data = pfuze_chip;
 
-	if (syspm_pfuze_chip) {
-		dev_warn(pfuze_chip->dev, "syspm_pfuze_chip is already set.\n");
-		return -EBUSY;
+	err = devm_register_sys_off_handler(pfuze_chip->dev, &pfuze_chip->sys_off);
+	if (err) {
+		dev_err(pfuze_chip->dev,
+			"failed to register sys-off handler: %d\n", err);
+		return err;
 	}
 
-	syspm_pfuze_chip = pfuze_chip;
-	pm_power_off_prepare = pfuze_power_off_prepare;
-
 	return 0;
 }
 
@@ -837,23 +838,12 @@ static int pfuze100_regulator_probe(struct i2c_client *client,
 	return 0;
 }
 
-static int pfuze100_regulator_remove(struct i2c_client *client)
-{
-	if (syspm_pfuze_chip) {
-		syspm_pfuze_chip = NULL;
-		pm_power_off_prepare = NULL;
-	}
-
-	return 0;
-}
-
 static struct i2c_driver pfuze_driver = {
 	.driver = {
 		.name = "pfuze100-regulator",
 		.of_match_table = pfuze_dt_ids,
 	},
 	.probe = pfuze100_regulator_probe,
-	.remove = pfuze100_regulator_remove,
 };
 module_i2c_driver(pfuze_driver);
 
-- 
2.33.1


