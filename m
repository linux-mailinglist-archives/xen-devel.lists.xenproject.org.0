Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6654A3B84
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:38:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262570.454930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlX-0007wG-F8; Sun, 30 Jan 2022 23:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262570.454930; Sun, 30 Jan 2022 23:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlW-0007gw-TI; Sun, 30 Jan 2022 23:37:50 +0000
Received: by outflank-mailman (input) for mailman id 262570;
 Sun, 30 Jan 2022 23:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlU-0003lI-5r
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:37:48 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a153b964-8225-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 00:37:47 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id x23so23419905lfc.0
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:47 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:46 -0800 (PST)
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
X-Inumbo-ID: a153b964-8225-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tAbveYQ6Sj9Bc7jSTaK6mqXkvmIczcqPXf0PDpGOqZw=;
        b=QHplLZpG4Vn/qnA5SF9xQFG9TC0Ze8i4Spzrt9m1VH9xTuo4sL+GdKpNLnJA7KOr8X
         Qfc/trGP80uyWOnL6/AW3/9PNKh6sZ4v+/AJr0yDEUAv6gwF+kbxhdx4PyYuQlWkYmBT
         5dcnK+FjbXKDiIkDUIeSgduqdLBtuC8rMXlJOwSh6i5VHZUwrW/dUGAwRrpUn/Af/fxj
         WsMvnRXnP4aQQ0nueTuih5zFAem9IsmzVuE9wBKY5qbRUAnxw1SUKdH9hUrXyM5G4iNf
         Wv3uZZ05umzkgZLlfNoLjxiV+CUOHCuLo8ttBfu5AssPJfG1v91CF2F7LItDTfLU1kFo
         8YCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tAbveYQ6Sj9Bc7jSTaK6mqXkvmIczcqPXf0PDpGOqZw=;
        b=onQC5HUCSwqM0NG0jHGRX8G5mFrxFJMJu/OWho6oo1J4iw6gHHctXonbIAR2Rm/CKv
         m9qVl0dKwyCbISGkbUs0Wuq8ijRU6/gBgrBe+5HQQRpj5K3hPGPH/EpjQiAix3LSd2tQ
         +bEgeHJy7DeklblaY430Qwsf5XJn86Q4K6nEiDlyIElezqNC9xDhIqmBrs6QakXnF45U
         39S8NKPLc2hh09j1TJohUJVR7xuKUeSH6SpPOTtyfJ5OKt9iyuLA0CVzXFQ0ndVfWWzE
         TgOF/uEWSGo15j81V1yP1Ff6UPi4aqwDAmLPhFKiLVpJVzWoZRySTtG5pL0dLggusWL7
         Q2ug==
X-Gm-Message-State: AOAM5315ATwn+a57VuPOba7NCIe43E9903BI+QEA9WcOdzDXqgo13PE8
	svIP0EAnzivy6qC1+nSSJOw=
X-Google-Smtp-Source: ABdhPJwh6ac6/+YvlvcJArSyTbTVyJtyah+mG/ZsA52vJGw4uJf6+kKdZUm5PeIMLD7zMqHGNap5TQ==
X-Received: by 2002:a05:6512:2396:: with SMTP id c22mr12993704lfv.547.1643585867143;
        Sun, 30 Jan 2022 15:37:47 -0800 (PST)
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
Subject: [PATCH v6 12/21] m68k: Switch to new sys-off handler API
Date: Mon, 31 Jan 2022 02:37:09 +0300
Message-Id: <20220130233718.21544-13-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel now supports chained power-off handlers. Use
register_power_off_handler() that registers power-off handlers and
do_kernel_power_off() that invokes chained power-off handlers. Legacy
pm_power_off() will be removed once all drivers will be converted to
the new power-off API.

Normally arch code should adopt only the do_kernel_power_off() at first,
but m68k is a special case because it uses pm_power_off() "inside out",
i.e. pm_power_off() invokes machine_power_off() [in fact it does nothing],
while it's machine_power_off() that should invoke the pm_power_off(), and
thus, we can't convert platforms to the new API separately. There are only
two platforms changed here, so it's not a big deal.

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/m68k/emu/natfeat.c         | 3 ++-
 arch/m68k/include/asm/machdep.h | 1 -
 arch/m68k/kernel/process.c      | 5 ++---
 arch/m68k/kernel/setup_mm.c     | 1 -
 arch/m68k/kernel/setup_no.c     | 1 -
 arch/m68k/mac/config.c          | 4 +++-
 6 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/emu/natfeat.c b/arch/m68k/emu/natfeat.c
index 71b78ecee75c..b19dc00026d9 100644
--- a/arch/m68k/emu/natfeat.c
+++ b/arch/m68k/emu/natfeat.c
@@ -15,6 +15,7 @@
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/reboot.h>
 #include <linux/io.h>
 #include <asm/machdep.h>
 #include <asm/natfeat.h>
@@ -90,5 +91,5 @@ void __init nf_init(void)
 	pr_info("NatFeats found (%s, %lu.%lu)\n", buf, version >> 16,
 		version & 0xffff);
 
-	mach_power_off = nf_poweroff;
+	register_platform_power_off(nf_poweroff);
 }
diff --git a/arch/m68k/include/asm/machdep.h b/arch/m68k/include/asm/machdep.h
index 8fd80ef1b77e..8d8c3ee2069f 100644
--- a/arch/m68k/include/asm/machdep.h
+++ b/arch/m68k/include/asm/machdep.h
@@ -24,7 +24,6 @@ extern int (*mach_get_rtc_pll)(struct rtc_pll_info *);
 extern int (*mach_set_rtc_pll)(struct rtc_pll_info *);
 extern void (*mach_reset)( void );
 extern void (*mach_halt)( void );
-extern void (*mach_power_off)( void );
 extern unsigned long (*mach_hd_init) (unsigned long, unsigned long);
 extern void (*mach_hd_setup)(char *, int *);
 extern void (*mach_heartbeat) (int);
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index a6030dbaa089..e160a7c57bd3 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -67,12 +67,11 @@ void machine_halt(void)
 
 void machine_power_off(void)
 {
-	if (mach_power_off)
-		mach_power_off();
+	do_kernel_power_off();
 	for (;;);
 }
 
-void (*pm_power_off)(void) = machine_power_off;
+void (*pm_power_off)(void);
 EXPORT_SYMBOL(pm_power_off);
 
 void show_regs(struct pt_regs * regs)
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 8f94feed969c..47d55541612f 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -98,7 +98,6 @@ EXPORT_SYMBOL(mach_get_rtc_pll);
 EXPORT_SYMBOL(mach_set_rtc_pll);
 void (*mach_reset)( void );
 void (*mach_halt)( void );
-void (*mach_power_off)( void );
 #ifdef CONFIG_HEARTBEAT
 void (*mach_heartbeat) (int);
 EXPORT_SYMBOL(mach_heartbeat);
diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 5e4104f07a44..00bf82258233 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -55,7 +55,6 @@ int (*mach_hwclk) (int, struct rtc_time*);
 /* machine dependent reboot functions */
 void (*mach_reset)(void);
 void (*mach_halt)(void);
-void (*mach_power_off)(void);
 
 #ifdef CONFIG_M68000
 #if defined(CONFIG_M68328)
diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index 65d124ec80bb..382f656c29ea 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -12,6 +12,7 @@
 
 #include <linux/errno.h>
 #include <linux/module.h>
+#include <linux/reboot.h>
 #include <linux/types.h>
 #include <linux/mm.h>
 #include <linux/tty.h>
@@ -140,7 +141,6 @@ void __init config_mac(void)
 	mach_hwclk = mac_hwclk;
 	mach_reset = mac_reset;
 	mach_halt = mac_poweroff;
-	mach_power_off = mac_poweroff;
 #if IS_ENABLED(CONFIG_INPUT_M68K_BEEP)
 	mach_beep = mac_mksound;
 #endif
@@ -160,6 +160,8 @@ void __init config_mac(void)
 
 	if (macintosh_config->ident == MAC_MODEL_IICI)
 		mach_l2_flush = via_l2_flush;
+
+	register_platform_power_off(mac_poweroff);
 }
 
 
-- 
2.34.1


