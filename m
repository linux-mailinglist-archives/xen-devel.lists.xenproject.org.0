Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 069A14477E2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 01:58:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222994.385542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjszl-0002c6-EH; Mon, 08 Nov 2021 00:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222994.385542; Mon, 08 Nov 2021 00:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjszl-0002YD-Aj; Mon, 08 Nov 2021 00:58:45 +0000
Received: by outflank-mailman (input) for mailman id 222994;
 Mon, 08 Nov 2021 00:58:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZOPF=P3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mjspe-0004MH-Gf
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 00:48:18 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 902ea2b5-402d-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 01:48:17 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id b40so3077220lfv.10
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 16:48:17 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:48:17 -0800 (PST)
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
X-Inumbo-ID: 902ea2b5-402d-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jIixMSKlDuHM/ROsyXYWDI0GhGtBfDPAGuo/NFEP3H8=;
        b=hSCECj6oief95mUKAFt1aYs1z2BhI3PyCJpHbMUlNZ/M49sY1G7gzTeEyttE60gMak
         BF+5uDSKoSn4CaOELlWWJK6Z03Rk6y4HTwrmSVMcH4REAv0cUqJCMn3qEJCUcKMx0Yg2
         hZUAWfnWhmv0u8d55RvvttbeCJzqzTllkqZ8sZrYO0dyywzXm1H9T9B85gH//tK7VGaP
         LSTKHt3pU1K6UjbgljgztfzIXizYQhXuqyNy4a5wOAJ6zgoCDgTzWA5VXtRTbqr75uP5
         JNN1xexiLEoZfDmssN9kF5V9y9vHzkvg7OruyPjb23gGAachOOiZE7sCXiHSj3rLrdzh
         uUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jIixMSKlDuHM/ROsyXYWDI0GhGtBfDPAGuo/NFEP3H8=;
        b=5pBAbBaBDu3OcL/PxG0gSgHVEeb+1LWXqKZVergoSqjHqTAfJeacj0n0vW45/OrFYG
         e0FNNXbqk5wZ5kOSzOYzh41z7FXS1mjTWeTIgExm0wwnalkQdLN/Gme2dSF35he3dwfi
         v7SvA9VZNazdBlEo/X1LCkaIOJx8scoE+gXMIlBsaIV3M7LgHhjkVOpuxqG5RcD8Esy5
         0ThmfHI5Y9ONtndiA/Xkh7h20IccgicIc5EkQkINiZm4kcVLvCDoER2GadxAr4gmActE
         KlwFwHhUpiGQNCFqGp7AqxfG8JJeNLWdtVvHrwitX9cpJghsAHdqpSVuu43TqnZYLwQA
         OBaA==
X-Gm-Message-State: AOAM5311B1FZ2UW/rcBIIjXTqfr+zHuqGlaeuHWeyPKIfVDoj0PRj5Ca
	obKgnvjoOepEv6Bv+neTl/Y=
X-Google-Smtp-Source: ABdhPJzYDrvoemDzHy5lRXulk7VBYq7aeBqM7UdlzGSCmj4dbWeKpvaVLmRfE93Wr+MuGPe+b8E4Uw==
X-Received: by 2002:ac2:4e13:: with SMTP id e19mr3337438lfr.561.1636332497640;
        Sun, 07 Nov 2021 16:48:17 -0800 (PST)
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
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
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
	linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 17/25] ia64: Use do_kernel_power_off()
Date: Mon,  8 Nov 2021 03:45:16 +0300
Message-Id: <20211108004524.29465-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
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
2.33.1


