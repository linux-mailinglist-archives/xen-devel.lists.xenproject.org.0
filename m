Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB514A3B73
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:38:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262563.454894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlQ-0006K0-8I; Sun, 30 Jan 2022 23:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262563.454894; Sun, 30 Jan 2022 23:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlP-0006F3-So; Sun, 30 Jan 2022 23:37:43 +0000
Received: by outflank-mailman (input) for mailman id 262563;
 Sun, 30 Jan 2022 23:37:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlN-0003lI-Bn
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:37:41 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cfdc69c-8225-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 00:37:40 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id z4so23316240lft.3
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:40 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:39 -0800 (PST)
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
X-Inumbo-ID: 9cfdc69c-8225-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y24DENQRtEKdQppbGIKyd5oN0ftjyxygovRkGgk1ggI=;
        b=iye0IDf8S26dwLx295PYKApjfR1uhOWkwFRwEuTaz7HfVp5gNRTd7PsGZcdNXus2j5
         KC4hfRnns4Q3gDw6FYYl2hiGD9zyQ++BtQsUN5sSEIWlqdWsG1HgjgoDbwION7zck9/B
         S8MhYR0qnGU76YGP6zQCb71/H90UqaQBgBJGYf9Z6F3zA18hOB/JJMmd+MfBgMIf44bI
         sMILvpsYiXOPyNn3wn8H/3IuNgSMTY5MBK2vT4Gl2WvXF7Wqy+10WxR4R+u39c/0cwYM
         yj8NA83EDXhIuKdSCp9nssU1hiFyiw4wPTkhvi9jW5WvzZ+itFPqw8PQ5rG3RKpTYBTp
         Kbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y24DENQRtEKdQppbGIKyd5oN0ftjyxygovRkGgk1ggI=;
        b=FRyHIBGX28MvUHi9LU8lGh6UeBaPp8pa6R3CrAkBnUttPvTL8/dwrS67RVIEY9x+Eo
         /Dpeg8BZAAYVy7/Eq2UFc6DIbZ/xivGJRAdLz1UGm5T9ZG19e6QwxWqTtY1aP0wXJIoe
         +W8yLePRf99zS4pwBGbWmDei6CWBpVgiOpV3udp+a3saXkugtfW6qI+5Srr1q4EQdKHQ
         CBUdqon8V0VG+SLHvAPsGrtwUX20/t5movK59NDTbuhLExoR6MpxDe5KM2c9LnbabU1e
         IimK8jfOyRi1TW43yHeygaA+o9pIidkXKturxgGwRv9aoxJSShJp7m6vY6z+Rq3eti3M
         KIjw==
X-Gm-Message-State: AOAM531UR9URCMqDhjrcrMpS8uK82zB776pwSfmPxJ/Yb2COq68eFO4U
	xkoDjaKUWHhin+wwYIVXHNU=
X-Google-Smtp-Source: ABdhPJwUMukTmRLWxE4WTMsRGXBxMbLNoOfsYOAYvD7oQJog5SiqqQ5VNyGL25QpTozq+s6lOQk2Yw==
X-Received: by 2002:ac2:5186:: with SMTP id u6mr14721765lfi.519.1643585859891;
        Sun, 30 Jan 2022 15:37:39 -0800 (PST)
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
Subject: [PATCH v6 08/21] arm64: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:05 +0300
Message-Id: <20220130233718.21544-9-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
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
index 5369e649fa79..6816a23bacc2 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -111,8 +111,7 @@ void machine_power_off(void)
 {
 	local_irq_disable();
 	smp_send_stop();
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 /*
-- 
2.34.1


