Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEE7471D2B
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 22:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245690.423861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwW0c-0005yE-4o; Sun, 12 Dec 2021 21:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245690.423861; Sun, 12 Dec 2021 21:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwW0b-0005vB-V8; Sun, 12 Dec 2021 21:03:49 +0000
Received: by outflank-mailman (input) for mailman id 245690;
 Sun, 12 Dec 2021 21:03:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lDYB=Q5=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mwW0Z-0004BS-Mp
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 21:03:47 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff3e195b-5b8e-11ec-a74f-db008197e53d;
 Sun, 12 Dec 2021 22:03:47 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id u22so21070641lju.7
 for <xen-devel@lists.xenproject.org>; Sun, 12 Dec 2021 13:03:47 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:46 -0800 (PST)
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
X-Inumbo-ID: ff3e195b-5b8e-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WLlXRmIj/zMVA0EiitKjc0V06oQPoMgvuV0WtFcoWEk=;
        b=Z9frmqTKg5aoS2PU9i7y55F1Fktg58Vk2dW1KbQjX3M9u/eaFeNaZynJ32r52oBsf/
         P9f28j0C1WiUodwIjr6XbJsThvC5MCwPgOI/+5M/0VrXYfVzLWQeaRXWUSfPZb+I2BSI
         BQPFKoBwRVjbyBL2TND78RdUJQyDLS7Pkm0fODoqLqGIlWJGn8+AfpkS3xhzwQqXsYu+
         5Y85pgu/pjYqmqy25ZvgQq8EW9Jv0u/pC5H+pGq+qKilGUXE9mzv0sr4iNh3LtrbFN9z
         ktmDNa2rZciKvQCLgGh4sd5oSXRV7GuSIk+wrmiOWBZtTjqy61YULWuD5yCzVtaU2XTm
         +s7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WLlXRmIj/zMVA0EiitKjc0V06oQPoMgvuV0WtFcoWEk=;
        b=6VY30nqwbk8dGT/cz7tEzVM4rPSSdMyXcMRxF9DiIVvOOOYw+yDa91m0DswWVnU4Cr
         TMy/uTUJHZAn6kfZsX5i8Ba/X0vQPnlJeDTLXSzYhpjI7btygaYPnxskYA+JWioCMTKK
         ULRZ2COqGvItE3cDMgZBXNHcaJnEqY75EN98lWcf5bXciz461zGwwXbYuBk+bBktcS+X
         SaJ+++xoeRa23tS7xZWL7fRImfeqW00SFDffqOKSefiYeJWDc/mjnyROq6FG5asWhtZg
         XDny/wazwD4oSVXymJ16mXjKabSlX8Czn4mLHbnjSpUJ+kgrrwsAGSL8HVX7U03x0XIg
         Fa4w==
X-Gm-Message-State: AOAM533Lto77tVUXtnmXfLIz8HuOa1Qx9C/IfI7l3n5mESiwZ9l7KGLh
	JQhKdn/WPf3obTZJUl6NC+Y=
X-Google-Smtp-Source: ABdhPJyn4bB+L+dbSeB8tkaNaTLuP+spDExh0AO3PYQ44Uwwg2wXZuKvjQXzPiXg+PdVnR/cyixvqQ==
X-Received: by 2002:a2e:9dcf:: with SMTP id x15mr26933582ljj.432.1639343026612;
        Sun, 12 Dec 2021 13:03:46 -0800 (PST)
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
Subject: [PATCH v5 06/21] csky: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:02:54 +0300
Message-Id: <20211212210309.9851-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
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


