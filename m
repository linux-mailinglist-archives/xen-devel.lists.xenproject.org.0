Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1262845F35B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 19:02:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233315.404820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfY6-0007Zp-0F; Fri, 26 Nov 2021 18:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233315.404820; Fri, 26 Nov 2021 18:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfY5-0007SE-MS; Fri, 26 Nov 2021 18:02:13 +0000
Received: by outflank-mailman (input) for mailman id 233315;
 Fri, 26 Nov 2021 18:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GGcH=QN=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mqfY3-0004Lf-4E
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 18:02:11 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9f32316-4ee2-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 19:02:10 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id j18so7034708ljc.12
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 10:02:10 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:08 -0800 (PST)
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
X-Inumbo-ID: f9f32316-4ee2-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4G0wXMIRKtQjgiQjhPPTWIJTonbxBMvj833mzQfGVdU=;
        b=Q7bS5Bcds94ZCTDJZ73tKxITpYV8Kav4ePR+HRo9YdxSWek6px4wRJdgcPmS5hk/Rr
         VPvNAMuE26rR2wieWZvoqh2JqGKS7hi+wU3x2h17uhsQmowPgLITYDnbrjG1GwGkvefd
         hHxk6lkApAV38Oi8vIzUQfEJ8wFoDrL8RwZq4qDk19AhYWVm238iVmmmVO7DlbUJ33tI
         BLX+/0wZLAv6GevVfNs/5TC56F1I6JNn+sAhx6wYa6M2qI3hZxBZFaK0EH29RxIb8wYE
         l0fPT66HRS9VmV580SbvW1FY/SVTqBcYuvfEtu2otEWz3FsM+lLxfdinbLZf9OO11+V4
         J1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4G0wXMIRKtQjgiQjhPPTWIJTonbxBMvj833mzQfGVdU=;
        b=FnGp41PaI7Lm6f3n8t1AeIsV1hV7wxpbb70MY4igvfoOijWEM1ncDfY3ik53otGq9h
         PI98gbb3Bj2bxdJOAaXPHU6eIiu0PtdsdrHSB5lce+FL1BCXD185ISNtEQyoe5TrAIy2
         1xtv6JuOTdnHdYb6klV0y0ZBk9XhvfkRwIrwlgJKxDQEDrYT9Sn+9MgvhfuYymP/7RtE
         p38BD5uRyoFFCFIN4EDKV0qWbV4+RIT6dldw1xI8ANWKpgegYuar87uWRId25PjKE1wy
         WNtiJGuRJqEywVXaxBT8HtCxSFlKdvVEoV5Ojn96vHEDPn6lDu5zyVKtLsPjQUYpZc+y
         QGEw==
X-Gm-Message-State: AOAM532UzSv+uRq0lXB48TcMdhFECR2GMU8MKNDIb/S4OlUZ2SmRp4Cu
	qSjlXXWGJ16WVPIFLp1kXxQ=
X-Google-Smtp-Source: ABdhPJw++X7mxtdOavKH8Ip6GlDs2g7F+GbwMx/tI9yDFlFB9AlrVDhMOYYWaSu8ROQpefmcYFa9fg==
X-Received: by 2002:a2e:858f:: with SMTP id b15mr33453590lji.177.1637949728768;
        Fri, 26 Nov 2021 10:02:08 -0800 (PST)
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
Subject: [PATCH v4 09/25] ARM: Use do_kernel_power_off()
Date: Fri, 26 Nov 2021 21:00:45 +0300
Message-Id: <20211126180101.27818-10-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/kernel/reboot.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/kernel/reboot.c b/arch/arm/kernel/reboot.c
index 3044fcb8d073..2cb943422554 100644
--- a/arch/arm/kernel/reboot.c
+++ b/arch/arm/kernel/reboot.c
@@ -116,9 +116,7 @@ void machine_power_off(void)
 {
 	local_irq_disable();
 	smp_send_stop();
-
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 /*
-- 
2.33.1


