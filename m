Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BDA45F373
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 19:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233340.404886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfcy-00046I-DV; Fri, 26 Nov 2021 18:07:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233340.404886; Fri, 26 Nov 2021 18:07:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfcy-00042r-6M; Fri, 26 Nov 2021 18:07:16 +0000
Received: by outflank-mailman (input) for mailman id 233340;
 Fri, 26 Nov 2021 18:07:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GGcH=QN=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mqfYC-0004LT-8j
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 18:02:20 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff557cce-4ee2-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 19:02:19 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id 207so20177850ljf.10
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 10:02:19 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:18 -0800 (PST)
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
X-Inumbo-ID: ff557cce-4ee2-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cQhCUMmxREqlb3fYFdUNP+80Jr1xwOUlupNd5E99mX4=;
        b=iJedDqBmhe3+60jiATM7eoXnQMEolWhm1QV+PRtSvFQT1XQ5mcMSJ4SbbE7J6fhvtw
         VH/PZa1wZwSWHs33Y/6nAuLNnbDCHXNpD6aQoyfIZCZ2XMBam1grhl0wuHW/5yhdfH30
         KiN8EvZnlo5gV1MVEqlZkSUCt0WOr9CtN6icR3uiXanS114nv6/nF+zlN43mnzmy3llc
         ohdo9Z3rua0Sa4TQlEEOe0yQW25sVwndRUvmhHAO8CXp3nhrBzc6CAxuW3di0hnLxbsi
         rrHpvmlKGY4sMYtvd2+oJRIzegBMKEp8SKSQwBwHWbPTyfn/AE/HmcsgS7He03Kr5FVt
         zegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cQhCUMmxREqlb3fYFdUNP+80Jr1xwOUlupNd5E99mX4=;
        b=NdMnwqOaaL20BCpQsopzDgwOQRMQlkeFwkH2LZPJP2Fk/Gkprv63RKZ+YzxxuNsB79
         LWTrKIpZtxFd/sppmEfbtbhFaO8nJE9kFsTiX6qcFdC1Uz8gHBbDr+v2bHGC0F8EoXZA
         yvBeV48FBULHDPebK43OdbYufUZMOVQU2VgyclEfNaYm3e0AB+Xo6kMwT/vj7dgS0FlU
         EQ8+qBjlXIy8KNk6n9o9QYx1Yp+O/NR3UnMsSymYYRVVtbFXixsVdRHzDj7WoOxarqTu
         kjk3GLQn1gXOCXccIW7p7fs81XmMwU56K0+Z5JwRJaqi37j3yTX54DEhmMwc6UmjoEEo
         iXgQ==
X-Gm-Message-State: AOAM530z9gk+oXCiJ+hBH+pctEY6KnlgwexAsQNaq2++f30Guciz6NXc
	ZZxONUDJeRKM0eAmmR00y4U=
X-Google-Smtp-Source: ABdhPJzLA9Z8G9nq11XvR1DefFsoLdvZVIBJZngCYUnkQI+xNdPv3SMCQJctE1SNfGefKSxAA3JkZQ==
X-Received: by 2002:a2e:8807:: with SMTP id x7mr32119061ljh.490.1637949739271;
        Fri, 26 Nov 2021 10:02:19 -0800 (PST)
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
	"K . C . Kuen-Chern Lin" <kclin@andestech.com>
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
Subject: [PATCH v4 14/25] xen/x86: Use do_kernel_power_off()
Date: Fri, 26 Nov 2021 21:00:50 +0300
Message-Id: <20211126180101.27818-15-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Acked-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/x86/xen/enlighten_pv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 5004feb16783..527fa545eb1f 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -31,6 +31,7 @@
 #include <linux/gfp.h>
 #include <linux/edd.h>
 #include <linux/objtool.h>
+#include <linux/reboot.h>
 
 #include <xen/xen.h>
 #include <xen/events.h>
@@ -1068,8 +1069,7 @@ static void xen_machine_halt(void)
 
 static void xen_machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 	xen_reboot(SHUTDOWN_poweroff);
 }
 
-- 
2.33.1


