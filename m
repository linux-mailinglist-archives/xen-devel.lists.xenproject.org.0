Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B929471D2C
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 22:04:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245693.423893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwW0i-000747-F2; Sun, 12 Dec 2021 21:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245693.423893; Sun, 12 Dec 2021 21:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwW0i-00070o-54; Sun, 12 Dec 2021 21:03:56 +0000
Received: by outflank-mailman (input) for mailman id 245693;
 Sun, 12 Dec 2021 21:03:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lDYB=Q5=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mwW0f-0004MP-Kq
 for xen-devel@lists.xenproject.org; Sun, 12 Dec 2021 21:03:53 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02e62403-5b8f-11ec-bf02-3911bdbc85ab;
 Sun, 12 Dec 2021 22:03:53 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id u22so21070826lju.7
 for <xen-devel@lists.xenproject.org>; Sun, 12 Dec 2021 13:03:53 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:52 -0800 (PST)
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
X-Inumbo-ID: 02e62403-5b8f-11ec-bf02-3911bdbc85ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qRRUcggihxuvvuxXR8avhK/eModbACqCMIG7s3bijm0=;
        b=cwgMkLRmIC5Jc7bTumRtZfdR/utOuYZMGz1d8ygkTHHtVzgzo42XHF3MxCIlHJHEyT
         C7LdLWylZ0pNaMDQhDT13J5l+njgSg9TNbzeMmfiPFReiWjuLN3BPKhAAriju1eHl9cw
         v0xZYrbokM5iV9yDxCHW4tROVpkV6lIWT7CatJGFsO5P7KMEX+3KZoYfdE3quHDnbdkY
         jpj2wUw+3g4R/1VtteNb23NQNkNZ2V1/PAhs7heDgq209kuV3pPkDwgZ1aWLoWFqzEEX
         OFHc08yxalGQachdnm1D3b45tSRQQlH3u/KkV4GShGX8mzd5qIB7iZpCyJ01mJBdqNcV
         pVRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qRRUcggihxuvvuxXR8avhK/eModbACqCMIG7s3bijm0=;
        b=7teO0EzxwUwkcGe2WDaYCrZtCaXjBP2J7yvtumDkJly1x1WSeqALz+DPPO+NYlBkFo
         SEdRW8iQCtzObEiDLjMo3XxR2s5G4bD8A4tb6J3my0ujPM3OusK0xTHItSFUZSU6Gap0
         NUp/RHQMNBtAo11M2Zw0DxBPkDNAoiHwK4wVL/61nHqzw3Oj3Rq8eQNXpiaN6k6Pjoqw
         O2P+iCcg241LaevvSFeq6oZsgSc+58PwmUpvdeUbasoxTMWmQ2ngfTXOBuW+JwBrN8Se
         bdk+/w2QyFWv1/yIuE5Ro9k8IecfuoK722CP03D+Jpqh5obGAqLKMBrbbg8EGm4Y08qY
         Mh2A==
X-Gm-Message-State: AOAM531e3E4FwF7hmjrAwGk3ujXlZhRmqnjvIBZtQijwv1HQUHsKIDMx
	rE+jwcEK3ayN0t6UJJbvOAI=
X-Google-Smtp-Source: ABdhPJwkugCxrPdxtc+DUdPqlE8VTgsZlj2PXoqJkSrC88l4/tv/AsdhkMaJuxd6V34n0G6eKbJ/hw==
X-Received: by 2002:a05:651c:1790:: with SMTP id bn16mr25960176ljb.475.1639343032645;
        Sun, 12 Dec 2021 13:03:52 -0800 (PST)
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
Subject: [PATCH v5 09/21] parisc: Use do_kernel_power_off()
Date: Mon, 13 Dec 2021 00:02:57 +0300
Message-Id: <20211212210309.9851-10-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
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


