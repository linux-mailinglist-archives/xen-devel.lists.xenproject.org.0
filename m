Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101084FCE93
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 07:12:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303297.517526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ne8or-0008D7-6X; Tue, 12 Apr 2022 05:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303297.517526; Tue, 12 Apr 2022 05:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ne8oq-0007yW-Dd; Tue, 12 Apr 2022 05:12:00 +0000
Received: by outflank-mailman (input) for mailman id 303297;
 Mon, 11 Apr 2022 23:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9GfR=UV=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1ne3d3-0006oE-6I
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 23:39:29 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0d64cc9-b9f0-11ec-a405-831a346695d4;
 Tue, 12 Apr 2022 01:39:28 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 4951B1F43AED
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
X-Inumbo-ID: a0d64cc9-b9f0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1649720368;
	bh=OM3Edh5ei8PPhfOzgq1DQOJZnmNFXz0QDZstiZwMgss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eR1V7YO4JiaZSZMv3eZYlIpEUuUXjf21t+dvWtRjQf6T5Gxu1B6+nqlmc3aIC8C1u
	 FTuhGsjmx3UOLCwau+wmuP7tVw92HREgB4lUkQAIF7SuLhUnddwvPIECdC6PNwUpQv
	 yOYER5E9xlmRzW6LvzA5fm7uQg9QcsDjzpsRSlw+PtUEF+Rt/pbWBDvnfy/My61fny
	 k7p7330Nf8JbpcM8NVf/iD54I18oOGaYH3oXM0vVb2DCV8HdIzp3CrK/TPOz76BB0r
	 TCV55Kh/0CrBvHEwPXUdTDUgVuVkScp+Ntja5VWo+K8YlzCu+ZmIKHO6ha1kFwr5j/
	 QT0evUqt+/l5A==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee.jones@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
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
Subject: [PATCH v7 08/20] arm64: Use do_kernel_power_off()
Date: Tue, 12 Apr 2022 02:38:20 +0300
Message-Id: <20220411233832.391817-9-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 arch/arm64/kernel/process.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 7fa97df55e3a..26d1b0a4329a 100644
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
2.35.1


