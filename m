Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6264C44770E
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 01:48:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222890.385416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjspc-0000ZF-44; Mon, 08 Nov 2021 00:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222890.385416; Mon, 08 Nov 2021 00:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjspb-0000FA-0D; Mon, 08 Nov 2021 00:48:15 +0000
Received: by outflank-mailman (input) for mailman id 222890;
 Mon, 08 Nov 2021 00:48:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZOPF=P3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mjspX-0004R0-CH
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 00:48:11 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bf55857-402d-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 01:48:10 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id e9so5703750ljl.5
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 16:48:10 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:48:10 -0800 (PST)
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
X-Inumbo-ID: 8bf55857-402d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qRRUcggihxuvvuxXR8avhK/eModbACqCMIG7s3bijm0=;
        b=KBhPxSaW9lrnwg/ZeqJS2nu0HdKIoak3A7KEcWoxjZ8ZDLYfXwp1aXhrc8oCufl4X9
         MKLsob6NFLsKmC3aak9WZhqpQvEY4rFz6TP5tCGr2UIze2Tsvqt8QYHF9D+yEMaBHVPm
         WBhljEA9GFAvFym8H3desu0Q0Qf41WaNht0kxdCTsPansaa3e36GY/Lm0YlrziYL6KTb
         2Adk6zJSc93DD9T+BiQ9AEP3Q9XzvbblhJVfx1e1iiRtap7ytYjo7dpjC41oxn8g8q8v
         R3FH/69p8KJwif6y9Y/ENfpHxQH9zh/vXioHmNWUl3BVDks73jxZaW9geoZzhNoBNZfA
         CVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qRRUcggihxuvvuxXR8avhK/eModbACqCMIG7s3bijm0=;
        b=XZE5BNZcL44xodxTuUfYyqCfpE0jnJQjahGGjv6CbHIZP4CGRz7hAHc7Ge7gOl4mC1
         SvwRok0RUtTtY8ZNMdJTRLmaPUfqoN4wuXxLwXzn3JjMo3CW8DjANP67EagrUAS2xeXt
         HUMHKu8PSYXL949Wu6HQK5XDxRedHmdAs/WFmBuMRxVWGSMGqf5YGlhKXF1InT1othiE
         NrF6bKyku3CXPog6MZ/XpAqALVQh7UKf1P7trIQClzIYrZAAXCz8OfWKghx4MFz43d/A
         aNBhyApu5RB6DmWD5EnbJekpxbmviZvKW+C4Qqtstw7uhBuLsKulRwD0dPjlvqxtGHdz
         Yh+g==
X-Gm-Message-State: AOAM533fVRPLBHlPzccEgj5HnSLpnlQCrHSMehdKnoec+M+IML6KhIS0
	oO+d+qC3U90Rvdst7JjM/zw=
X-Google-Smtp-Source: ABdhPJyfH7OANNMfjdVl1/BvZl9WPVHDE8Bg86gEBvgA8TNGSwiw/Je54t6L5Ttvpi+gyGASQBIYuw==
X-Received: by 2002:a2e:a54b:: with SMTP id e11mr55909067ljn.157.1636332490552;
        Sun, 07 Nov 2021 16:48:10 -0800 (PST)
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
Subject: [PATCH v3 13/25] parisc: Use do_kernel_power_off()
Date: Mon,  8 Nov 2021 03:45:12 +0300
Message-Id: <20211108004524.29465-14-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Acked-by: Helge Deller <deller@gmx.de> # parisc
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/parisc/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index ea3d83b6fb62..928201b1f58f 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -26,6 +26,7 @@
 #include <linux/module.h>
 #include <linux/personality.h>
 #include <linux/ptrace.h>
+#include <linux/reboot.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task.h>
@@ -114,8 +115,7 @@ void machine_power_off(void)
 	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_SHUTDOWN);
 
 	/* ipmi_poweroff may have been installed. */
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 		
 	/* It seems we have no way to power the system off via
 	 * software. The user has to press the button himself. */
-- 
2.33.1


