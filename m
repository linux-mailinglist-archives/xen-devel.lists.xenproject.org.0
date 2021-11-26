Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8D245F374
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 19:07:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233341.404890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfcy-00049g-KY; Fri, 26 Nov 2021 18:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233341.404890; Fri, 26 Nov 2021 18:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfcy-00045Y-Fd; Fri, 26 Nov 2021 18:07:16 +0000
Received: by outflank-mailman (input) for mailman id 233341;
 Fri, 26 Nov 2021 18:07:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GGcH=QN=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mqfYP-0004Lf-Qk
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 18:02:33 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 077bc6f9-4ee3-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 19:02:33 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id n12so26162119lfe.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 10:02:33 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:32 -0800 (PST)
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
X-Inumbo-ID: 077bc6f9-4ee3-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cc0IUGWHitJ0Cooyguk/vAdy9iAEtCRPuqNtfJHYmrA=;
        b=GYYw3XMX/4oqqfMN49I7CBBHFIpykntLblQl6g9KPyyCsudCNhMfwTnZL18wVQGQi4
         JuhpEycJ1R88pC/ZLM88sOilV25zrVbfh9eT9x5USudfIexBhI6hy6Vx+A4a4Oa7fUWM
         rJkHayh/u+8c0l4YkcoGl8kn2pAMWdXo1sxJvkNyjmGPQXIKKWAIYtGbr1J00yZ6UtgH
         Axc5wn/b/4iVF7UlO3tGJrtaG0NHnfrf2k5HFK1Jjx22qcNwH4sd9Rhks9JdQva78gS7
         1ZQlCef4sjICrp3ly5mWdogj0g50NCv3ORIDZTMJuIahq/+/0RewMoPQtmti46/fM1AW
         Wteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cc0IUGWHitJ0Cooyguk/vAdy9iAEtCRPuqNtfJHYmrA=;
        b=ikb1BJJD1rw2ERPxe4oxURMZkTQ0c/eRRR2HBoZfpR4g33atyiU6qlt1nrgGRcv8si
         29Soqg0dvzcd9tsI7Iis2gTc5kKjTbOuApk04sLlqvuWG1tFATn9n/J7n1T9VpekiopI
         /1nxaffWscao67diIQIx8mjo+Ofgrku2PLBJCRdHxVHNJLYYSWUD5ZnPuI/SmZbeTg6n
         r3hVwv+vyoDcc9NlUETPs3/HeGyFKcHhAhyjOBanTjipTrM3GS+j3TC1cMf40cvNSlbq
         6ZfOi5DZ6MZqOJPvMs+7gPuAgVO7Ho+7jfof3mmHHf5YndPFAn2L9Vl91bKxLZkJjDbp
         edcw==
X-Gm-Message-State: AOAM531B9pLCNSHjSe2TScJWKsfFMaEOZNvV4LdoE9wBi/pq0+m12GBF
	/rYQ9yOxF93B5S+Vvrrv2eY=
X-Google-Smtp-Source: ABdhPJzQm6cGwJJjdj6PgfKdyO+WkT/LoUXVJp2PXtkWbzQaFwuQrSy4drr2rOfF/i9aKZ1mtOq8lg==
X-Received: by 2002:a05:6512:3a91:: with SMTP id q17mr30543722lfu.425.1637949752903;
        Fri, 26 Nov 2021 10:02:32 -0800 (PST)
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
Subject: [PATCH v4 20/25] mips: Use do_kernel_power_off()
Date: Fri, 26 Nov 2021 21:00:56 +0300
Message-Id: <20211126180101.27818-21-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/mips/kernel/reset.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/mips/kernel/reset.c b/arch/mips/kernel/reset.c
index 6288780b779e..e7ce07b3e79b 100644
--- a/arch/mips/kernel/reset.c
+++ b/arch/mips/kernel/reset.c
@@ -114,8 +114,7 @@ void machine_halt(void)
 
 void machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 
 #ifdef CONFIG_SMP
 	preempt_disable();
-- 
2.33.1


