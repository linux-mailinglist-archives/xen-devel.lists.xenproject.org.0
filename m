Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1F74A3B7B
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:38:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262574.454950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlc-0000f9-Ey; Sun, 30 Jan 2022 23:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262574.454950; Sun, 30 Jan 2022 23:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlb-0000HL-GP; Sun, 30 Jan 2022 23:37:55 +0000
Received: by outflank-mailman (input) for mailman id 262574;
 Sun, 30 Jan 2022 23:37:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlX-0003lI-Ja
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:37:51 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a370fe18-8225-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 00:37:51 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id u14so23250964lfo.11
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:50 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:50 -0800 (PST)
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
X-Inumbo-ID: a370fe18-8225-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qHFCRJN9BVY8RauX1oKR/zvQzYk8hOXc8BKode7q7dE=;
        b=YRe+4ENn+xLHydu0qjVK8NSLNEa98MBt5tDc08FixS3wAMtLqAIaFtklni0+X5AStQ
         NWa/KRzoUn8+IVpsHAm/xOs3k+cj+LL2OhKl5gVUEFkp5ndqFg9Q7IDP7ikRXZxwNK+4
         SbLkN6wlP8yDXzq0kfXqbvVsy1Hp18D+sINvf4RsWjU2CJLvpbxk+Pf4y4Di+ROI2ccO
         YZHUhr0Z8uHoIysiX6fudWOQ4mPt5OAElluDMzBTS4VC1jyp+W5tjIzGJQ2uBLL5DStr
         tO2S0szt+wkyquwgkXuRB6clwJUeXCGMkJhIWs2QZ///pnQ6oMEGbscGlCpylcxuYJ5J
         9wBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qHFCRJN9BVY8RauX1oKR/zvQzYk8hOXc8BKode7q7dE=;
        b=g9xDNGoCRas5IKAHaH7I8vkAhppsGFa1KK0u68qJOkCg3O/7hwIL99vXSjPI4bXdXI
         oI9Fv0U+ateJlIsrG9yhIFsrjvtvc8CHUM+oUvvkbiS579sfWFmMVR2QIXtCJ6uYRdBh
         QSpt9ncCCIvBwqFoeLuzCAuAJsG4uBKPNjBNZr23j6vIcT3kjt5IicrcKCf+5M6jBq26
         0U7VlHuowxAHZFJdXcmILHMTD9A0p81Eb1bIunuo/jKvLwahe5bsG1brtDC9q66ghlPX
         eEvnhlGXYapq14oeNi3+J9tClIyG7aHnRHy44NjE1WRnu/Sh31Q5w7gArBMoMi9GXWt9
         NTUA==
X-Gm-Message-State: AOAM533KOugW4qVjLJI+IN1x+Iazgeu83k/XEANqW7L7jlhZppEgFi/4
	RrqoJJWOPLRIN3ZHIEvzXfY=
X-Google-Smtp-Source: ABdhPJykkAmU8QPmCYCQWolQuhTlQmgl/dllVJKfSuOOVtywU8GyeEW3uMb4RjUXLkfRs/7Y/PbgFw==
X-Received: by 2002:a19:6a12:: with SMTP id u18mr13556400lfu.348.1643585870718;
        Sun, 30 Jan 2022 15:37:50 -0800 (PST)
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
Subject: [PATCH v6 14/21] x86: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:11 +0300
Message-Id: <20220130233718.21544-15-digetx@gmail.com>
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
2.34.1


