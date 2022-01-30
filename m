Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3F84A3BEA
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:48:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262650.455002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJvB-000730-Sh; Sun, 30 Jan 2022 23:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262650.455002; Sun, 30 Jan 2022 23:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJvB-00070n-PN; Sun, 30 Jan 2022 23:47:49 +0000
Received: by outflank-mailman (input) for mailman id 262650;
 Sun, 30 Jan 2022 23:47:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlb-0003l1-Dh
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:37:55 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5b16696-8225-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 00:37:54 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id x23so23420327lfc.0
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:54 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:54 -0800 (PST)
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
X-Inumbo-ID: a5b16696-8225-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wIfZ+CakpfzF/ji3grllPcoAe/10yjc1ewRUofBsGOM=;
        b=A13Wbd19LUDerIcNp/bwkNjnM7R44S+FNahenjlu62KKeZzOwn22X46AmnbpRRHSD6
         ++VeiYi+w5973OIjqsKBoqpWZd1tNrsstlD+OK5Nb2BIn3qQuUxHMsdUL9LOLlnC2oh9
         3QYxZJ6Rvcj4kbBtFo+GSvpPb2P4Us99EVxpEAj6NeCn9wQxCxqcvyPU6/Tn7QITtakm
         /V8zmLAMP0Zz48vMEXqiIlcDRfQmJ+d8Go+JSVClm5dRCb8xO1gx+MaZWCx1Y3YgBNEK
         BDZgHhW3BSNpzM/0TkvVs4HG5kI01iX7LNugVEJmEF9vWL8OTabOwQyDCncuLuPplJj0
         eXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wIfZ+CakpfzF/ji3grllPcoAe/10yjc1ewRUofBsGOM=;
        b=FFtYVxzd22ueZB5PcoS0wEcgenjva/Q9fbfO9nbmGExGXX1BC47oLXoyl2Qb01XEX3
         ApuXjSSbaaR/65leZQ4LoJ8abx6KclblHGXAH7MwkKbbBuQr/Ey8r5szNwkqpA+Hxh/H
         p4sB4FtJa4R6lsxhpbyOQdprk7XfEvngO8FmSGa+w7yfbA3EZsW/wbzOfu4hSse5CIqW
         GzYJLFZfzZOQSOjjbcnfH7iIoI4BWkqT0v97GG2ZLVBSUhozRmI08h+K3ChHU/Jd7u0n
         ufsCs5mxi9M4xIQSMWGVrROad9LsvsokyS/456Mma4H72/5B3KQboBaPq6Uz4rZW9vvd
         BPjw==
X-Gm-Message-State: AOAM5316JBKlufr//YOeAJqJ/vLSO+HleSwXA1gfC8JJKV+wJIhOs2J8
	yF5l9SS2lhQphsFi/YJ+jkQ=
X-Google-Smtp-Source: ABdhPJyeM0zHMQgSAKLIY1pkC0yU7P3sq8yPWGFis8laCOZJiGOjvUQ29pFsEShO7sH0bxipvLhl6g==
X-Received: by 2002:a05:6512:c09:: with SMTP id z9mr13566872lfu.147.1643585874478;
        Sun, 30 Jan 2022 15:37:54 -0800 (PST)
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
Subject: [PATCH v6 16/21] mips: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:13 +0300
Message-Id: <20220130233718.21544-17-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
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
2.34.1


