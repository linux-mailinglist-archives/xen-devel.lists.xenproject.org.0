Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60CC45F378
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 19:07:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233356.404941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfdC-0006Tb-Sl; Fri, 26 Nov 2021 18:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233356.404941; Fri, 26 Nov 2021 18:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfdC-0006QT-FL; Fri, 26 Nov 2021 18:07:30 +0000
Received: by outflank-mailman (input) for mailman id 233356;
 Fri, 26 Nov 2021 18:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GGcH=QN=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mqfY9-0004LT-Ur
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 18:02:18 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fccb396a-4ee2-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 19:02:15 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id bi37so26094701lfb.5
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 10:02:15 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:14 -0800 (PST)
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
X-Inumbo-ID: fccb396a-4ee2-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NEBfa1fMA+x5w4qEnSCEpCMUhXzxF+K5pq5bQ4oFCgw=;
        b=lRlQ008a+IbsS8DE0TWdHIzAkFXjh3dDHkcfsSNijQLz3glWRPdOXkR406dy436mKR
         swsEMK/HLMriBM+sHUAz18HbxkMhzsa9XYl+oomFF1gq//nss8dqk36V7J+ClG9CaBy2
         WWO0klgFXP29RO1EhtcXcnQ3zoupxyF9h0GmJQW3J91/ZiBM4sbrGAmCBC8U5x3dd9vf
         izOX2LuAARiYC76RMH7ctsrxVJr/V6zidemA6uePTmz62QvyzJ8o7pLoAvFloQYwA0l2
         DNfHUUqAzsU9SV4hQVCTnOjHiCDOJYPH0hjwhTD+pgLvWamNz7onIv5CBzTO4bq19cIl
         BOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NEBfa1fMA+x5w4qEnSCEpCMUhXzxF+K5pq5bQ4oFCgw=;
        b=sIlhjlr++xS4XI7UBvVAeOX7YgHwPuOScPA9CXrLwroskbHEZ7WzXBGkn/d7F5GzWB
         9aapX9D7YDHkrM0nCjkI5UdlZj7RzQI/egLUDdSNILXYXAhmAisiKLOsmQ/nZCeq+I0d
         jsiUkoTzLGN+nPpQpVNEBZanLDusgEZHkfVxhKR0/VWCrY5LnqPDLWPZI9O4jLGPSVmr
         MbTJRGy5q7V1lAQS15Axh7TG28N0ed2BOD43BV+wX/1BnA3hQZR3OJbTDbStE+dkttoY
         LD3eJVsn7ycOAKp6DVYwj2NVeTFpXiT31MTLUGRlK2fQBL56Rj58bgXxJMwvWBfjRhfJ
         RoUA==
X-Gm-Message-State: AOAM532DEH8QA/oZW4U48HzMdU0VSI6ZkqlRqEQ2wLppS/u1rIz/lc6U
	O5ZwNxi6R9btdCYmIvfeUBY=
X-Google-Smtp-Source: ABdhPJzwg6TCeM4olE1bypUFqEyLXP1HDDpp6A34kLIaU1G6qa5YfdfQ014tuBHAOgCpqB1ddH3KBw==
X-Received: by 2002:ac2:5cc8:: with SMTP id f8mr32343763lfq.110.1637949734922;
        Fri, 26 Nov 2021 10:02:14 -0800 (PST)
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
Subject: [PATCH v4 12/25] arm64: Use do_kernel_power_off()
Date: Fri, 26 Nov 2021 21:00:48 +0300
Message-Id: <20211126180101.27818-13-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm64/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index aacf2f5559a8..f8db031afa7d 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -110,8 +110,7 @@ void machine_power_off(void)
 {
 	local_irq_disable();
 	smp_send_stop();
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 /*
-- 
2.33.1


