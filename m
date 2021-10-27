Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEB243D5B8
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:28:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217349.377458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqTL-0001JR-SO; Wed, 27 Oct 2021 21:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217349.377458; Wed, 27 Oct 2021 21:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqTL-00015O-6i; Wed, 27 Oct 2021 21:28:35 +0000
Received: by outflank-mailman (input) for mailman id 217349;
 Wed, 27 Oct 2021 21:28:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqKs-0000sJ-B1
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:19:50 +0000
Received: from mail-lf1-x129.google.com (unknown [2a00:1450:4864:20::129])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd7093c0-ce60-4352-a841-5e64a19135f8;
 Wed, 27 Oct 2021 21:18:34 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bq11so8955702lfb.10
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:34 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:33 -0700 (PDT)
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
X-Inumbo-ID: dd7093c0-ce60-4352-a841-5e64a19135f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4OWbCpLiTrW70NMTPpPUNVkhVF3RKPzG5GTofMVph+0=;
        b=nyjF7CMTiXZTknDCkjxSlwBlmez3wFeA+zehsvTRn8HWRCKWBbu+VeqUVL44ms69wV
         nnBlf5yP21RTavxXaqxcjkZ3KCf591eZC6XUlLgNrDZoqwAeG0e8waWDmBuDqGJPa/ia
         TWGnRhqwCJRO6ZHGrxxDEuuBCRuC8gitnwXoBy6yPn2yaI52p7BdBoMEudji1fyrvZ7s
         jQQkx67Vh3JRx01BzNxvLauTbUeZkFSOIEd8jQMxIMky+FUXABFowKrpCYCop+RjKrYK
         44VAj9OlGjdC9id5DEzvny9pb4y7eTDKQL+s4i3zBATQTR5zvjDC+NzhG9GB4CVWfx2z
         vHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4OWbCpLiTrW70NMTPpPUNVkhVF3RKPzG5GTofMVph+0=;
        b=yAUNVwKW7EnBX8Z9BTD4hyfSHPCeqfPmkkQmdhKYGYzDVYOSqkVvXiKL4AIwEyk/rV
         PvNzbVrVETplO1Hboup8cptVlK4GPnVn+F47GwzObpPyTM/304RrK0b7XbB3J33za9N+
         hsJ0lpsNw9exaFzRC75n5qlQVjtwhX+2e9NhNeJw1JahiKaS29mVWB+TS2aI0sufSd2b
         r5N2BlQxuKTXAMMDts/jsH9+l/mevP9ICm8y/r8X3wcQD+SIE5yw7Uebml7/IYE49EDa
         jkIg0Dcf7PpZdW5jn+KWgpt38tRTJtLR0AscuWy4YG0bzepbJxEdGC9de1sYQ1qatKZ8
         NuLA==
X-Gm-Message-State: AOAM531AsjhwQq/wiXqKwW+G5Bc/I8EqN0EE3xVSnddS2tHDTQXooLFd
	hhEXFD3LNx8DQ4NfXpzBuJ4=
X-Google-Smtp-Source: ABdhPJy61JBdPHWehe+0JZDFDtaEYRkwyYUuH0JZUFf3l53X5Ds5OQvvxR8PRHj15LQUp0FSRiIF9w==
X-Received: by 2002:ac2:53a5:: with SMTP id j5mr141454lfh.130.1635369513848;
        Wed, 27 Oct 2021 14:18:33 -0700 (PDT)
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
Subject: [PATCH v2 22/45] memory: emif: Use kernel_can_power_off()
Date: Thu, 28 Oct 2021 00:16:52 +0300
Message-Id: <20211027211715.12671-23-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace legacy pm_power_off with kernel_can_power_off() helper that
is aware about chained power-off handlers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/emif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 762d0c0f0716..cab10d5274a0 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -630,7 +630,7 @@ static irqreturn_t emif_threaded_isr(int irq, void *dev_id)
 		dev_emerg(emif->dev, "SDRAM temperature exceeds operating limit.. Needs shut down!!!\n");
 
 		/* If we have Power OFF ability, use it, else try restarting */
-		if (pm_power_off) {
+		if (kernel_can_power_off()) {
 			kernel_power_off();
 		} else {
 			WARN(1, "FIXME: NO pm_power_off!!! trying restart\n");
-- 
2.33.1


