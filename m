Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D7B4477D8
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 01:58:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222937.385444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjsys-0005wD-Aa; Mon, 08 Nov 2021 00:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222937.385444; Mon, 08 Nov 2021 00:57:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mjsys-0005t1-6P; Mon, 08 Nov 2021 00:57:50 +0000
Received: by outflank-mailman (input) for mailman id 222937;
 Mon, 08 Nov 2021 00:57:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZOPF=P3=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mjspg-0004R0-AV
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 00:48:20 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f1f15de-402d-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 01:48:16 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id p16so32495450lfa.2
 for <xen-devel@lists.xenproject.org>; Sun, 07 Nov 2021 16:48:16 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:48:15 -0800 (PST)
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
X-Inumbo-ID: 8f1f15de-402d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0HObz0L7jYC33/Dxy7x3kt14KoppaRcQ+sU+HcRStgU=;
        b=ZVNAr1U4ql3QetoKQdPWWOYdxSBB0k5djEWleeY+9VSLcYiHnCSkCkIaOl4kqaHShO
         oab4Tmm3bwD0P0vkAzDwXd33MBPBcdebn4RnRlv1JfpXW5azFQJ8VDNmkiaenWK08EOn
         RwVRxb2a8jq1Me5zajmOOnqUKWN+NVp3gIC4vDQvl7X+QS/9Q/6G8PsCj7pFygNZ42G6
         2+Tzi7ka9eoxAdQUiRD+NnUxxBwExid0v7AfOqmbTtknjCEBmTA6xGh62w38gQj+fJ/p
         jOjBMtv9YA3dt8WYnPd7X0Be6DYsLDDoWJqswRWvH4kz+YPHCvK+UcFcEoVWh55qLPDl
         ATPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0HObz0L7jYC33/Dxy7x3kt14KoppaRcQ+sU+HcRStgU=;
        b=EgDJHvw0O1POs+QOiWz+LXnnWGrO+xMXjEQZ82z+P3jMrPZpfCSYZZXBNpOkDhmyT4
         uodCw1vz9ZD8VxvqF01qSeho8tj0nCgzorozBBHEldg8+P/9ndDJ5VJ1d54+9oSkdTB+
         OyAx7k7n3GFlbVkNHhApf041vHmFy0SBh6QBzEqI4EZlQ/rJW0DdNbAMyCGH801AN+Jz
         jhjJNYBhc2fjIaAq3NrsMYixJUAeZsttl6h2j6me3VFbY2ufbLGL+3oZAsEHp4hv4m/L
         DGHxWDDw3abIdRPyv4RwMVFM4tOuy/1rvJeymkfuvcKxH1UF+5JrznSdnb8sc+H24g1q
         FxAA==
X-Gm-Message-State: AOAM533oXZnSdg71uJUzMeZnwlBwvWkC6e4NPqe2ZoiVCnD+RknSgNAj
	uwbaV2D0ODD51ozXbsCuy1A=
X-Google-Smtp-Source: ABdhPJxGJgazXdUgtKIBvIIz/6GDfezGKbWWr8YH8P5/vbQu6B1dGA0GfveTE6FMi6W4ZN9EO5qX9g==
X-Received: by 2002:a05:6512:402a:: with SMTP id br42mr25576250lfb.530.1636332495851;
        Sun, 07 Nov 2021 16:48:15 -0800 (PST)
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
Subject: [PATCH v3 16/25] x86: Use do_kernel_power_off()
Date: Mon,  8 Nov 2021 03:45:15 +0300
Message-Id: <20211108004524.29465-17-digetx@gmail.com>
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
 arch/x86/kernel/reboot.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 0a40df66a40d..cd7d9416d81a 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -747,10 +747,10 @@ static void native_machine_halt(void)
 
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


