Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639543D5B3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:28:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217337.377418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqTD-00085K-V7; Wed, 27 Oct 2021 21:28:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217337.377418; Wed, 27 Oct 2021 21:28:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqTD-0007zK-Oi; Wed, 27 Oct 2021 21:28:27 +0000
Received: by outflank-mailman (input) for mailman id 217337;
 Wed, 27 Oct 2021 21:28:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqNI-0000sJ-F3
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:22:20 +0000
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fd14165-1c51-4e97-b6e8-86c09a0d6493;
 Wed, 27 Oct 2021 21:19:06 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id q16so7020585ljg.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:19:06 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:19:05 -0700 (PDT)
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
X-Inumbo-ID: 3fd14165-1c51-4e97-b6e8-86c09a0d6493
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3OlHSqJ+90NzTUoF0ScIJd6Gu2h2samNuNJcsiL1Jk8=;
        b=TlGsLZtcrVzUb7sAOhif3p7pVw8LafC2xLy1EDPy1NIwJl5MQQvmHy2JQZYszcOE8Z
         bpdCDmyEM5D03Couzbs3VVZUIdamWSCPF0yzl5vvizBqtDssLI1790jRM+TPIcawNrlD
         8STEeq0OEOHvy2rX7OXiOWUq9V+Wbq3xZg3vhjF/dealnvdRkEuGDx5b0mmtoBXsa4Tg
         7gFUHQvvLRw3QjAUV5dCuqij4emeiEy4r7tFICkEZrQaaXXABdfN2M8h/mxrxQbImqYG
         GaGzMOCXHjG+QuAc4Dq0gK0PotuHucIYhVqvi35iVuJc+hGZhg1h00rdw0kra8k/EpLO
         luJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3OlHSqJ+90NzTUoF0ScIJd6Gu2h2samNuNJcsiL1Jk8=;
        b=BN39/gDvZoVTgRGs+6aS1GMtwC3mp+mHjKiuRx0k01hIFramQi8QPCaokCyA+gk8D3
         8p0O873nUDe6e60YTN4GO08B3izGzxbSbivg5p7TqUU5MCG1E0FNVJxY2E0PZd0O2CND
         bCILcLm4o72t8GnE+BsAjr1Oewzm/msueKLh2A4oQX4KnCSslYwyduGHJsqvBx6WZdAi
         dD/u7EWuSJDZNlnpwkns+YGcuNT3CasS2um8Z42A45RjQXXryR1NnPKaw5zWCUdI5AMW
         Wwv0BVwh4o7s0HLnDI+ZjGZDobN0SikzfOUaVIlX/GMGILB2koBfnkcT605E5bmHu4bK
         w88g==
X-Gm-Message-State: AOAM531NpLun6zaWfxagMpY5KG9iXCQr7gfeenakzmKV6mK20aFmRJat
	yP4mNPwMpMCZlPb4bdRnM2M=
X-Google-Smtp-Source: ABdhPJzDbMhKltt/cJ4cLHVC7lvSJKFFWBp4i2pL/KBXA4D8sI4Ihh3wNKVdm9xKvnEcHeY8d+ELCw==
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr336408ljl.522.1635369545290;
        Wed, 27 Oct 2021 14:19:05 -0700 (PDT)
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
Subject: [PATCH v2 39/45] mfd: dm355evm_msp: Use devm_register_trivial_power_off_handler()
Date: Thu, 28 Oct 2021 00:17:09 +0300
Message-Id: <20211027211715.12671-40-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use devm_register_trivial_power_off_handler() that replaces global
pm_power_off variable and allows to register multiple power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/mfd/dm355evm_msp.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
index 54fb6cbd2aa0..5ee830f65589 100644
--- a/drivers/mfd/dm355evm_msp.c
+++ b/drivers/mfd/dm355evm_msp.c
@@ -8,6 +8,7 @@
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/reboot.h>
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/err.h>
@@ -375,11 +376,10 @@ static void dm355evm_power_off(void)
 	dm355evm_command(MSP_COMMAND_POWEROFF);
 }
 
-static int dm355evm_msp_remove(struct i2c_client *client)
+static void dm355evm_msp_remove(void *data)
 {
-	pm_power_off = NULL;
+	/* FIXME remove children ... */
 	msp430 = NULL;
-	return 0;
 }
 
 static int
@@ -392,6 +392,11 @@ dm355evm_msp_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return -EBUSY;
 	msp430 = client;
 
+	status = devm_add_action_or_reset(&client->dev, dm355evm_msp_remove,
+					  NULL);
+	if (status < 0)
+		goto fail;
+
 	/* display revision status; doubles as sanity check */
 	status = dm355evm_msp_read(DM355EVM_MSP_FIRMREV);
 	if (status < 0)
@@ -416,13 +421,15 @@ dm355evm_msp_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		goto fail;
 
 	/* PM hookup */
-	pm_power_off = dm355evm_power_off;
+	status = devm_register_trivial_power_off_handler(&client->dev,
+							 dm355evm_power_off);
+	if (status)
+		dev_err(&client->dev, "failed to register power-off handler: %d",
+			status);
 
 	return 0;
 
 fail:
-	/* FIXME remove children ... */
-	dm355evm_msp_remove(client);
 	return status;
 }
 
@@ -436,7 +443,6 @@ static struct i2c_driver dm355evm_msp_driver = {
 	.driver.name	= "dm355evm_msp",
 	.id_table	= dm355evm_msp_ids,
 	.probe		= dm355evm_msp_probe,
-	.remove		= dm355evm_msp_remove,
 };
 
 static int __init dm355evm_msp_init(void)
-- 
2.33.1


