Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAD845F35E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 19:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233316.404824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfY6-0007fq-Ms; Fri, 26 Nov 2021 18:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233316.404824; Fri, 26 Nov 2021 18:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfY6-0007ZJ-8g; Fri, 26 Nov 2021 18:02:14 +0000
Received: by outflank-mailman (input) for mailman id 233316;
 Fri, 26 Nov 2021 18:02:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GGcH=QN=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mqfY3-0004LT-Tl
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 18:02:12 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa645829-4ee2-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 19:02:11 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id l22so26084911lfg.7
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 10:02:11 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:10 -0800 (PST)
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
X-Inumbo-ID: fa645829-4ee2-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WLlXRmIj/zMVA0EiitKjc0V06oQPoMgvuV0WtFcoWEk=;
        b=dwQkjQc8XJ9Zv7re/xh1WQ2UESbNnOIjv44tV2yYkTMSfE9Pw4ixbam1sYNjgU1ziC
         YsjSnbkQEYOmSOD/fv2OcaoktyLva3BRmUT1f1EHzpHOs1H4O5FRr9HjwLwmIJ0kwol4
         En1ylnQpmG3ktfI1Fg/Q/EuJpzuzjUdYaT7dPWgdOpPbhofgmKEPmXbgYeO1l98bR8OD
         7+AULvyVTAbuaPQqm0dZB4n1ycZXUvc6CpxX2dZaHQaHbP8ogu2BN4iuPHoYBKRTBq6b
         tgYxssEnkU5biyG5fZrNPOs0vGjei7DrFVluWj41isSbTpsczS+9OOm9yoDDpdejZQ4Y
         d6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WLlXRmIj/zMVA0EiitKjc0V06oQPoMgvuV0WtFcoWEk=;
        b=OclzEaLfp/cH5LYxIDyHcrFnWjuckpzN9uQRDoD0/CriTCsbzMLi3Q0Awrs0Mqn7Tq
         0fDJGpA717s6OabnbAIIAg8YZmOli59r9hWHEMkpZkaBqzbL/i0SFESgCwlxrzuLIKlL
         1aCXUundbsvXh5t4l3RiXi19g5uylW9PBo5NnqIiS/Q+GvGX6ecNroyUpZd0iMo59oiO
         VTFzst063eQ8/oh/i3diRwVIyM+io0YbbSoPQ1AGCDyn6byZHzZrP3tBjWbXegaUEe3f
         /lE+myByJsuEwxvUhYn/ZXXhrdvkhogBeFWf1VxweHDtfhNtTtiWyVlT35XAqrXIoJGP
         86hQ==
X-Gm-Message-State: AOAM531AFlXSplKNcdn7HUhT/43829D6Hs/dVDRIWgQr8j7JCU1X0vZs
	UKIOskoKE9UsBMyqqNh8KlU=
X-Google-Smtp-Source: ABdhPJxQTNSOwCEIeWTILMI5rMPmmxh09mM/FdZM/5H+6ue5hatuq9sGyT0G3QPFh5axuTAZ8BDbdg==
X-Received: by 2002:a05:6512:3456:: with SMTP id j22mr31418434lfr.89.1637949730890;
        Fri, 26 Nov 2021 10:02:10 -0800 (PST)
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
Subject: [PATCH v4 10/25] csky: Use do_kernel_power_off()
Date: Fri, 26 Nov 2021 21:00:46 +0300
Message-Id: <20211126180101.27818-11-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/csky/kernel/power.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/csky/kernel/power.c b/arch/csky/kernel/power.c
index 923ee4e381b8..86ee202906f8 100644
--- a/arch/csky/kernel/power.c
+++ b/arch/csky/kernel/power.c
@@ -9,16 +9,14 @@ EXPORT_SYMBOL(pm_power_off);
 void machine_power_off(void)
 {
 	local_irq_disable();
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 	asm volatile ("bkpt");
 }
 
 void machine_halt(void)
 {
 	local_irq_disable();
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 	asm volatile ("bkpt");
 }
 
-- 
2.33.1


