Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07054A3B85
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:38:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262578.454959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJle-0001AO-0d; Sun, 30 Jan 2022 23:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262578.454959; Sun, 30 Jan 2022 23:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJld-0000n1-D2; Sun, 30 Jan 2022 23:37:57 +0000
Received: by outflank-mailman (input) for mailman id 262578;
 Sun, 30 Jan 2022 23:37:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlZ-0003lI-Jv
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:37:53 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4a52ba0-8225-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 00:37:53 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id p27so23343385lfa.1
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:53 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:52 -0800 (PST)
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
X-Inumbo-ID: a4a52ba0-8225-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=onbjYH+GRuJ1H+aKPIQ3zfVzcOAEVYGJovL5WFpgYzE=;
        b=UH1XcKU9Gn1SSFj/c6UF13MQ0Jk4L0iTHT84SKL6CKoxP6s+KdtFoXyH/BcfyYDpHy
         loZc76siXQCxc0BEyl6FoScWMfzkuy0+stkGcZcwGW2GEdy+KMmBYv7TWditUzAcwMzy
         Tt6+cvIqwyyrufTRsRpGGLkldJ9LCj0ohCU13mN/KWIDXPq7wGpxAM7zRuw3yc8XG/sX
         kB5V6sSPdbwBeQeNfwWdQOiHlVD0cbXl/3KN+Taw7rwJQ9btmTdGH9V7WkpieowAbyRI
         LCnnw5FiTCZdg9w/dnOXicsOkOVxD4dBkbYZp5w48IHi/dsTV0RcMVW6iF0qd1ahO1Hj
         Vr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=onbjYH+GRuJ1H+aKPIQ3zfVzcOAEVYGJovL5WFpgYzE=;
        b=5W1v7ZZm4R2mvA78rMCzxqhSJ06L7Wlh98JZ4oLjhtjisI5V85pmGA/UVVooG0AYT2
         T24VOEbOeICWZr19LbcHbXE2cn2GZFIdNXgkVhwOxmgQotRt3ymEghk1PFeZiURFteX1
         83WJxoLrmnNfauO12Ks4523+8eIbZx160EkJ73xhStFTWwjdQGQ3hx83g0QH81DWCotJ
         UKyKTL2n9nwYgbwZjpX1F3cJrAXc0tVP5xoAfp3MuFz5uVLDi6Ghsy3xydtF0AUyYciz
         Q6ZvebcZBmh/p21a70O+1GZXIWRiFKEkWErOQRscKzmOITr/FwOxT6vlRFcDfvDZHkXy
         pR7g==
X-Gm-Message-State: AOAM532I/YdTUXDq5p4I8zElkyE58B/OKlZ79hVljx8p/75FyH2OHiAc
	J08vbrXmG9UksVYmWYXxcSg=
X-Google-Smtp-Source: ABdhPJzNx9wknKIs7vHNlQS9Ch9++IYsC8MJz1WUWotZ0fgIzeDZMu0xSzBho+J/7CYm9WmVvjoXbA==
X-Received: by 2002:a05:6512:31cd:: with SMTP id j13mr13576351lfe.369.1643585872718;
        Sun, 30 Jan 2022 15:37:52 -0800 (PST)
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
Subject: [PATCH v6 15/21] ia64: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:12 +0300
Message-Id: <20220130233718.21544-16-digetx@gmail.com>
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
 arch/ia64/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index 834df24a88f1..cee4d7db2143 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/personality.h>
+#include <linux/reboot.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/hotplug.h>
@@ -599,8 +600,7 @@ machine_halt (void)
 void
 machine_power_off (void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 	machine_halt();
 }
 
-- 
2.34.1


