Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 229BE471D26
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 22:04:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245702.423949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwW0u-0001Sc-Bu; Sun, 12 Dec 2021 21:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245702.423949; Sun, 12 Dec 2021 21:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwW0u-0001Qu-40; Sun, 12 Dec 2021 21:04:08 +0000
Received: by outflank-mailman (input) for mailman id 245702;
 Sun, 12 Dec 2021 21:04:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lDYB=Q5=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mwW0r-0004BS-Ri
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 21:04:05 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08ed80b2-5b8f-11ec-a74f-db008197e53d;
 Sun, 12 Dec 2021 22:04:03 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id l7so21133590lja.2
 for <xen-devel@lists.xenproject.org>; Sun, 12 Dec 2021 13:04:03 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:04:02 -0800 (PST)
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
X-Inumbo-ID: 08ed80b2-5b8f-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fPDqjeCYEjf+DN+kHXgg7jNjsfy3nUCqOTZJ2Nh3G0E=;
        b=TVIdD68VWfHsQ5jfaqSICSZ1qOhZrUFA9mWdz6ePQHL1xqpH2YdGrbEBaLFkC7gIb8
         G5GVUsLpR7P9l8w4HUpnC9ENPDSIvCHlKYXxYDYBXpjfkLcAfFSnbF/TqDYZgNg+yp5d
         Pc9NdSlFwAt6HBoJA0bEg6oNgazZ4MeI6QmLhlMAROr2y9LwyzEcdRy2/Nl8fcUK+gJw
         4Z7GIu+SBSKJVBNrWt7sUDuuqAeIyNHaS//f1hsWBDWkktlu2hisD12FQFYSkR29TAJT
         LH1R9Pot7fCnjrbI8+c1sLGDG1QxcUxmHT1viqhxlbpmcYRwfmC1bTbrrOdOZDH6A81E
         Mb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fPDqjeCYEjf+DN+kHXgg7jNjsfy3nUCqOTZJ2Nh3G0E=;
        b=EozWdn/V8uZD09Am5sFoAxTpYuQhwgEnz0zl3o4HUoi6mDdb60/QUhJpnXTNiA5qNO
         bpRe1B1ncOJAwlca2V4hsugLOKlh9PrjhaT8+svFjdHYcXoZE9tNb3J99fu+WdVfqz99
         ZHRA9yVhRE0jCbaEZ+X+Re+KBPoFmlDWXuDOTb6/GHHjD7criBZUOWnThsqxhDYLuauG
         uY3kLKyiPq6pEf8OeOvAMyGmVOPRPM33Jg28cmX+VzvZsnJEZmyz8OiXYO/VWzXtzp9V
         Kjnd3c9+3za9VK6m1qFppbb5TOkUMF4kI+qQxZ5iWjQ+PvOwaYdfayLng4PeLQlCvDgO
         XNDA==
X-Gm-Message-State: AOAM531Qi/+ia+LHYnnHq2TmGEDEQtiWSkIWV5btZ33JiTNyA/2Exibb
	+SQ2XLuf7GIvF5nA6b9UKYQ=
X-Google-Smtp-Source: ABdhPJxIWfLkEULnkeRFIBU63iisgF81a9TeLyav941iTQFUBwsy8Hw5dIc9QJtmQkp/rhphX9SNLQ==
X-Received: by 2002:a2e:9698:: with SMTP id q24mr26147048lji.246.1639343042868;
        Sun, 12 Dec 2021 13:04:02 -0800 (PST)
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
Subject: [PATCH v5 14/21] x86: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:03:02 +0300
Message-Id: <20211212210309.9851-15-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/x86/kernel/reboot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index fa700b46588e..c3636ea4aa71 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -739,10 +739,10 @@ static void native_machine_halt(void)
 
 static void native_machine_power_off(void)
 {
-	if (pm_power_off) {
+	if (kernel_can_power_off()) {
 		if (!reboot_force)
 			machine_shutdown();
-		pm_power_off();
+		do_kernel_power_off();
 	}
 	/* A fallback in case there is no PM info available */
 	tboot_shutdown(TB_SHUTDOWN_HALT);
-- 
2.33.1


