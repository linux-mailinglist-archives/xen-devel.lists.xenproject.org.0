Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20234A3B80
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:38:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262561.454870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlL-0005VH-8L; Sun, 30 Jan 2022 23:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262561.454870; Sun, 30 Jan 2022 23:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlK-0005P3-U2; Sun, 30 Jan 2022 23:37:38 +0000
Received: by outflank-mailman (input) for mailman id 262561;
 Sun, 30 Jan 2022 23:37:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlJ-0003l1-6m
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:37:37 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ad34a60-8225-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 00:37:36 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id p27so23342514lfa.1
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:36 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:35 -0800 (PST)
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
X-Inumbo-ID: 9ad34a60-8225-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1ZrDgi56okXdj0bmuwFyDd+PCBPMTNLxDRZAmCQiy7Q=;
        b=c3NtOsqbA47a1sJX+GEy+0rTmzy10+oHXKnLf++rqhzO+HkV5EX5GbmXX0syutXx6R
         46cFfpCzhcPa31L6Xgo37w0ud+s6MmIVbyT0zR8tDah7CqXCEteg4iWk/eRCwba6mO4V
         8W4zc+2KzJhcjNF1j1wVUUcXHT6ObiOakX5p2KYvUVsZQRY7Y82Y6MKvBpcRryxOInUF
         RxKVqw9v4fGeVOkmtCX3EyiW/0qXGxVzl0X9GRONS3eJ/CiP8qRj0ZyFLbrruPRrmWMZ
         iKAyqg4ppe9pVvVxKhsjy91ldTFtuqlW7PzcwXhnonKoFQRzsPVvvJpThza+ddSLXVij
         QBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ZrDgi56okXdj0bmuwFyDd+PCBPMTNLxDRZAmCQiy7Q=;
        b=U2Y6hWm7nFoJ/5FBFP1459i/75cjeMsgFMyntsdEp0Mckb22abs1BC6CXGmhdc5XBY
         TxBQXWIbNd/3X92Hia0DRJjkR3zcpI266rwfMEAz3UTd6dIGhdqPrB2pIRRbkGzzA94h
         7tNRoQTGNu0v3Q0jqLuSQsEuCaFBLnow8t16eXfqYyVpCC63DXF5k3w+9fhFoBAYEMAg
         dqbfy+FK+uKoIDSnPt0Kw2UZFaOHlEL6Z5bcE60djfGtm+2rjNqc+gVcWtAeHaQFWtfU
         sWgU9kjKRqz0jMrxw48OTZ10aeXfOMIbq9B4Gr0U//Is0Ko8/lBkGYxP9VtNv7Wmh2af
         HLOQ==
X-Gm-Message-State: AOAM531yzyXiMy+GTsx3Bcr+AhBkx1zRIgliDudREopmw0lFO8hAOorx
	2gLbO3TuDPJFOT4CtAX6WbU=
X-Google-Smtp-Source: ABdhPJwjH2OF/Lh8B3AhmAwBhRKlkrWOfnqlna+Zr9L+uqZhDMGJf1wpdqmmSlpmTjq1hjKH+//r2w==
X-Received: by 2002:a05:6512:1082:: with SMTP id j2mr7550090lfg.371.1643585856261;
        Sun, 30 Jan 2022 15:37:36 -0800 (PST)
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
Subject: [PATCH v6 06/21] csky: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:03 +0300
Message-Id: <20220130233718.21544-7-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
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
2.34.1


