Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C66943D5A2
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217283.377304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqSg-0001UN-N1; Wed, 27 Oct 2021 21:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217283.377304; Wed, 27 Oct 2021 21:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqSg-0001G3-92; Wed, 27 Oct 2021 21:27:54 +0000
Received: by outflank-mailman (input) for mailman id 217283;
 Wed, 27 Oct 2021 21:27:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqLC-0000sJ-Bf
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:20:10 +0000
Received: from mail-lj1-x229.google.com (unknown [2a00:1450:4864:20::229])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3b334e6-cd33-456a-ab3a-269c6b97cb7a;
 Wed, 27 Oct 2021 21:18:38 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id d23so5638600ljj.10
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:38 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:37 -0700 (PDT)
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
X-Inumbo-ID: e3b334e6-cd33-456a-ab3a-269c6b97cb7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RsN03A/v4Sm7hW8tBAQNfAIwim2Ix+phU87uldQTcUU=;
        b=aSBcb4MObsGcKwVtxhkQi6r6MrllJ5Wvhx4AXr7+3ZZIOmNeNayjB4H7wS3yJIQaI0
         vfLkw8dEY0bAB5FpyHupYLxHHW8temP9OImGFFR4LDmE7/mvPRk5uTYf1q52vThLv1Ot
         CBrv1hpmeU5p/gGow8523dqz9J8N1faFeN/IXFxxWyp7mhT8fq2Z7acBEZ06y9nx6CF2
         oI6Bf+jKcKCu1O6+i0B6l4EesA9cDqHIJQrezIg8dnd+TlutJ/VurnoBCjdUW8FVuBfF
         rgIrNrWNCUTYVjuoeGUx+HMg9DODFrvmZsdKkZzK15Dx1U5yq0D3h61n1EAZrJfufwr8
         qWRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RsN03A/v4Sm7hW8tBAQNfAIwim2Ix+phU87uldQTcUU=;
        b=OHfHyq85RsRt/yzp0dtbFhmdlQQbtE9RDQFutPsx65jgZ3GCcOnJLc9G/gfVhNzWGD
         OoKDcdqKybndotrveSIVAMk6C+dJqNKtIPiTX5s3YOvHsyaYuLFIkic6c4re2CeNWPE1
         kekf3suRqBASTL+apcpeV32KNtPDi87fHSr2Dmb7ohS0gAe/+SznOjfuXDU/eBIZmCPC
         sJZvIzTLPFU42/BPqAhHOQ9Lz0IeHz0kZVVgdCHTETalKIaFs5+ZZoRu0PBFZCU2Gtj+
         Q3Fori8AmaIAcY2PtRWt9p0cFzsc1KDKDWiP+piIz5imLoK9Tbywr3SHIZ2+4w3DLuXS
         u7Bw==
X-Gm-Message-State: AOAM533haRxmYCqMCQCg0OtJokdBKv2hU4J3jVErmuPcxivSt/74OUQl
	gPwtdGX50V65VjQocRonLs4=
X-Google-Smtp-Source: ABdhPJwvRw65HVRl6UYG4kSDngjOw+VDWoznyGC0SQFAdeVNXxGihIuJGUkpMtbqNUFYMuUZsUPclw==
X-Received: by 2002:a2e:3e08:: with SMTP id l8mr351596lja.194.1635369517590;
        Wed, 27 Oct 2021 14:18:37 -0700 (PDT)
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
Subject: [PATCH v2 24/45] regulator: pfuze100: Use devm_register_power_handler()
Date: Thu, 28 Oct 2021 00:16:54 +0300
Message-Id: <20211027211715.12671-25-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_register_power_handler() that replaces global pm_power_off_prepare
variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/regulator/pfuze100-regulator.c | 39 ++++++++++----------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index d60d7d1b7fa2..73d5baf9d3ea 100644
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
+	struct power_handler power_handler;
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
@@ -611,24 +613,24 @@ static void pfuze_power_off_prepare(void)
 
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
+	pfuze_chip->power_handler.power_off_prepare_cb = pfuze_power_off_prepare;
+	pfuze_chip->power_handler.cb_data = pfuze_chip;
 
-	if (syspm_pfuze_chip) {
-		dev_warn(pfuze_chip->dev, "syspm_pfuze_chip is already set.\n");
-		return -EBUSY;
+	err = devm_register_power_handler(pfuze_chip->dev,
+					  &pfuze_chip->power_handler);
+	if (err) {
+		dev_err(pfuze_chip->dev,
+			"failed to register power handler: %d\n", err);
+		return err;
 	}
 
-	syspm_pfuze_chip = pfuze_chip;
-	pm_power_off_prepare = pfuze_power_off_prepare;
-
 	return 0;
 }
 
@@ -837,23 +839,12 @@ static int pfuze100_regulator_probe(struct i2c_client *client,
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


