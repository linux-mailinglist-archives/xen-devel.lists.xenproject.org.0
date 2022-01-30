Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2A4A3B71
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:38:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262566.454921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlV-0007Qw-Ay; Sun, 30 Jan 2022 23:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262566.454921; Sun, 30 Jan 2022 23:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlU-0007Hj-TY; Sun, 30 Jan 2022 23:37:48 +0000
Received: by outflank-mailman (input) for mailman id 262566;
 Sun, 30 Jan 2022 23:37:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlS-0003lI-8Q
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:37:46 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0408308-8225-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 00:37:45 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id a28so23276021lfl.7
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:45 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:44 -0800 (PST)
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
X-Inumbo-ID: a0408308-8225-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EOoRrU+XNCvH4y2De/y0/3nvouQcv+AIk9CqttDCqGU=;
        b=Xenhc8uEX5pndBJlaDWs7DZMq++uCKYCaPhTRn+v8Pl6kdDQBiq3K+xk68g+lJ4bfb
         xZ0s68SQJzgN7roWd+Sm2QhFGePj8q4/xhI0aeufWhORrHMmrI9Me+kOtUbih63bZtb6
         0ONUKG+oe3tUPDlqh+XwtnfSXapDSUNhobEfHkXXD2jWYeC/eLrTsR82DtHf6HHPZ3Ti
         T856rZoGRovN/ZZzwL74avJYGt+XINSCwpiKRk5t0Q88fCFTaGgu6LEev5sylA8ww9qW
         bEbiz2YJdBL1j7FCE0FI146AM6wMNEQmt3CI8lSlsxZpxhGAK8uAOhBigDyDJ64IQ5ph
         fLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EOoRrU+XNCvH4y2De/y0/3nvouQcv+AIk9CqttDCqGU=;
        b=uJ20D408iTyWB9b7587pu6litePrpoC4Ie6j+I+V9lay4O+0JaX/vzHNCZVychCDVN
         DQrPT+lNamoDuYszgQ9BLMefXQtqYF2nvDGF4pnin3+zxtwucZGM8VUyNJSPEeD3fOSF
         hI6jTWNw23znh9ETUxGlZQUd7sF1GAZXDuGmNKRp09aO8vBgcJ2zGI3GEaEoKXxZ2vzH
         x/SqQfPY41ybAmQ7HqkQhGPHf0LYqihnHPPixh/pUyOH5C9F/1fRfcKvm8z6KJp7olht
         co1B6XFMZZ9Bt3W4G6ML1QDuV9bQNNA9D4eNkxeiN2ouOHisnhJLrsvoh74vo/Exqgby
         2eCQ==
X-Gm-Message-State: AOAM532Ft7EjldE7XjweegkO2RtAm8dJOaOznRt3Kxjb7VMMR2ZCZCSD
	4AciUDOqxWsaWkqN5yoTt7o=
X-Google-Smtp-Source: ABdhPJwHvsxF1vvJkDiGpTgqSXjFtQ+p50F4FDOHob5db5lzmW0uNoHuWaSIs7Seja+8JuHVDBb7qw==
X-Received: by 2002:ac2:5333:: with SMTP id f19mr13304920lfh.451.1643585865359;
        Sun, 30 Jan 2022 15:37:45 -0800 (PST)
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
	"K . C . Kuen-Chern Lin" <kclin@andestech.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v6 11/21] powerpc: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:08 +0300
Message-Id: <20220130233718.21544-12-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/powerpc/kernel/setup-common.c | 4 +---
 arch/powerpc/xmon/xmon.c           | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index f8da937df918..8158e940db81 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -161,9 +161,7 @@ void machine_restart(char *cmd)
 void machine_power_off(void)
 {
 	machine_shutdown();
-	if (pm_power_off)
-		pm_power_off();
-
+	do_kernel_power_off();
 	smp_send_stop();
 	machine_hang();
 }
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index fd72753e8ad5..c916bf250796 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1243,8 +1243,7 @@ static void bootcmds(void)
 	} else if (cmd == 'h') {
 		ppc_md.halt();
 	} else if (cmd == 'p') {
-		if (pm_power_off)
-			pm_power_off();
+		do_kernel_power_off();
 	}
 }
 
-- 
2.34.1


