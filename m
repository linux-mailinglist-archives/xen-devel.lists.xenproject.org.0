Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B1F471D20
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 22:04:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245692.423882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwW0f-0006gQ-Um; Sun, 12 Dec 2021 21:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245692.423882; Sun, 12 Dec 2021 21:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwW0f-0006dQ-PZ; Sun, 12 Dec 2021 21:03:53 +0000
Received: by outflank-mailman (input) for mailman id 245692;
 Sun, 12 Dec 2021 21:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lDYB=Q5=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mwW0d-0004MP-Kt
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 21:03:51 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01b807c3-5b8f-11ec-bf02-3911bdbc85ab;
 Sun, 12 Dec 2021 22:03:51 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id l7so21133212lja.2
 for <xen-devel@lists.xenproject.org>; Sun, 12 Dec 2021 13:03:51 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:50 -0800 (PST)
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
X-Inumbo-ID: 01b807c3-5b8f-11ec-bf02-3911bdbc85ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NEBfa1fMA+x5w4qEnSCEpCMUhXzxF+K5pq5bQ4oFCgw=;
        b=jKT5aLZfWR0wdy1ZRHa2+F5Hc16ta1np03rkr+cf27BN8zUNhbkEoAuNYpXOIawSIH
         2XymTHuAk1C3VpWmhK4AsE1yb/G2IulrJt3rlG67Vh5DarQrO3/RvtCACcc9q/mrlMzG
         idTBdpttStFv0rFHXoDeMkKrlqiTc6LMJnuQorLtWh4hfdMc2KQqq/SPJGqZAD8cFtP7
         bU0fIoQxCEwyS17dGv1ELgqsYZc+uy4iyxYp9vTtn2S36VrT7egCJ/N2pPTJk/5GCnV0
         wCdVD2AV/3wMZeA5Ef+Z3RwjWWbr7SVUDzZ2VoU/BSE2RRwY2l531P1a/0YVFVmDZNjy
         PILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NEBfa1fMA+x5w4qEnSCEpCMUhXzxF+K5pq5bQ4oFCgw=;
        b=avmYD7YkIW48jocCkFkKaHvgA80USRaiX5ctQKErX/NA1LXHy0o+ARjOb1GoBa7yoR
         H4FG863oXhHylJU2qhDtfkiNXf123EMLFHSV+rMBMy3WDZBHihI/w53z0eDm2eXDUeK9
         GzU8KiL5NRN1WHRvOD6Z+FMxNWT9hwLhclk+7Yn+Z/bxGgLaANmLmjCeg6Y0c/TfOLco
         76O3HMGyoRcCWGtMTTkMjZA9W5qsoH8rAYK1O+K1MvjvXavDtaqjanmN74Inmh+t2lfO
         r7UcP2ERfsHZRpRH6WPYOhU4TB0kWrY+6p/q+k1qSSZHkWaDicxrpYu5fvOVbwZW8JPx
         iLkw==
X-Gm-Message-State: AOAM532mIRKjiYosTl7ouLztwcVJHNiJHGmvFkphZRBYE5YHnh/CJzxH
	fI7o+i6QFTO4yQq3gNSwvww=
X-Google-Smtp-Source: ABdhPJxgpZfqxao+vFSyfTfxI+LCB5noXzLgWBaLJYSm65bPEK2lM39NLgbcPLKrE+YWXn5oNC0cUA==
X-Received: by 2002:a2e:a26a:: with SMTP id k10mr25711010ljm.156.1639343030651;
        Sun, 12 Dec 2021 13:03:50 -0800 (PST)
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
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 08/21] arm64: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:02:56 +0300
Message-Id: <20211212210309.9851-9-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
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


