Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBC04A3BE9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:47:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262633.454991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJui-0006Nc-Lu; Sun, 30 Jan 2022 23:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262633.454991; Sun, 30 Jan 2022 23:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJui-0006Le-HG; Sun, 30 Jan 2022 23:47:20 +0000
Received: by outflank-mailman (input) for mailman id 262633;
 Sun, 30 Jan 2022 23:47:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJle-0003lI-Kq
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:37:58 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6bd6c44-8225-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 00:37:56 +0100 (CET)
Received: by mail-lf1-x136.google.com with SMTP id b9so23275705lfq.6
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:56 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:55 -0800 (PST)
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
X-Inumbo-ID: a6bd6c44-8225-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=69wNajrm4+G/M74hrnrqfe/8gDIP1KRo4GBjc3qiBlE=;
        b=eADmGdhywqGHgBNSOTg6DDqxchm8B8ixUxTFBRIurSpOjI9zmNGmnnTl7ImQhqB8Ei
         0mWnD7TAo0wSYeOZ937uVVcmUSkjlnYWZ7M+/JM6Dh7lyKqqc2++u6LI+atIfPTN5ays
         s+ktDvb2sLXt8MKBHLK9lwAFupFTVgxMIzESdB4QojqTGIkGjlXlLAoIu5tRpwgO0yvf
         ryjVbvaJTv11mzbS9UuOXGg5YPShB0ncAu5hIuMku9PpTrfxOLc753LOzzY0nXEsJ4s1
         aTORw1Zo0yFFM9ZCzLTV1LBU1iplcGdbnitByV0PuagiZ7HTypKyLYaRcYB4LG2Z4YgC
         xHEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=69wNajrm4+G/M74hrnrqfe/8gDIP1KRo4GBjc3qiBlE=;
        b=HzZeuwn+p98+Mf6CK+TqYjROm5y9dQC39mQaU0XR8U7RKZDwd6SEkgQftDlKDqFB/K
         OFT94WtVLGBWdqiDO4GG2J/VIb8m0wNZnHhFUx8ri/vXhStj9giUgB2oav3cINax2qx+
         JnARZ6JKVUiVv3qapXMvOtAIXYiqcaZmhvSRXMAzOKQvdTILlSRXu/nzCc+yY4Hb6tkQ
         XGfGC17auaA809bcY5ASiiHHPsGJ/3RYMt7L6ZRIMuCxI1cFeu5WohEyBdoLPGDmlX54
         U4f8MJVEUN6WvnTZyhrfm6dYG2JbnBBFxHG7Z5MHSQwElB312jtvoJSwP5VxhgpQ2Fya
         R7zQ==
X-Gm-Message-State: AOAM5329CeRywX79KvQdqxBRNUUwqnpLR4gawV337vViDSHtPkgK6JaL
	ODtAU7FboRdUQyIX3+X0Rk4=
X-Google-Smtp-Source: ABdhPJwNSyf/5qJrwp6Ej2liXxYcZa6QcRMNedNFLOrkN6ogQ1iJOFH/fhB+J9LuMCwJeeOYVcQcPA==
X-Received: by 2002:a19:f806:: with SMTP id a6mr13933723lff.592.1643585876243;
        Sun, 30 Jan 2022 15:37:56 -0800 (PST)
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
Subject: [PATCH v6 17/21] nds32: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:14 +0300
Message-Id: <20220130233718.21544-18-digetx@gmail.com>
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
 arch/nds32/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/nds32/kernel/process.c b/arch/nds32/kernel/process.c
index 49fab9e39cbf..0936dcd7db1b 100644
--- a/arch/nds32/kernel/process.c
+++ b/arch/nds32/kernel/process.c
@@ -54,8 +54,7 @@ EXPORT_SYMBOL(machine_halt);
 
 void machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 EXPORT_SYMBOL(machine_power_off);
-- 
2.34.1


