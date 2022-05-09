Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2728520885
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 01:33:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324881.547211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noCsX-0000gQ-QJ; Mon, 09 May 2022 23:33:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324881.547211; Mon, 09 May 2022 23:33:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noCsX-0000dK-L4; Mon, 09 May 2022 23:33:25 +0000
Received: by outflank-mailman (input) for mailman id 324881;
 Mon, 09 May 2022 23:33:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s4mp=VR=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1noCsV-0007bw-Sw
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 23:33:23 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a98b542-cff0-11ec-a406-831a346695d4;
 Tue, 10 May 2022 01:33:23 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 0842C1F41E8A
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
X-Inumbo-ID: 6a98b542-cff0-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1652139202;
	bh=8Fx2NXCMOUBUfmtFhnG6e+1bhUvia7Lkro+EJHtjozI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RryRpTBWSvFrqD7A7EctZOMN6tE1a1/5heQcWEPcVbcoeASmRzyrn+watrDphnz1q
	 gr0qo93ZE/53tbomd6WV1UoDxm182gd/Hwbei2xLmUuosOcOg00u121ZZYdCv5U0Ec
	 ADOyWCsjg1iIXn/9D6iPK+ueBrwxIG/eVse+9TJHcuDRFcjJUAqLMIwnYbPaNy2viZ
	 LcZ/hWkRfc3wjZpKDS3wxSoVKAByM9jcjXSEITcDoaj2VrvHgo3EaXqnrqMzZkrxws
	 AbnZOxmEdJ1KPvFAifSKgdx2cTW2g9ZZvBuT5AlXPNuvg1BMexEMF47dJ+tuFKEEYa
	 aihfJhaIo/8qw==
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
Subject: [PATCH v8 05/27] kernel/reboot: Add do_kernel_power_off()
Date: Tue, 10 May 2022 02:32:13 +0300
Message-Id: <20220509233235.995021-6-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add do_kernel_power_off() helper that will remove open-coded pm_power_off
invocations from the architecture code. This is the first step on the way
to remove the global pm_power_off variable, which will allow us to
implement consistent power-off chaining support.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 include/linux/reboot.h |  2 ++
 kernel/reboot.c        | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index 05981ef079d8..6b951d68c0c7 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -63,6 +63,8 @@ extern void machine_shutdown(void);
 struct pt_regs;
 extern void machine_crash_shutdown(struct pt_regs *);
 
+void do_kernel_power_off(void);
+
 /*
  * sys-off handler API.
  */
diff --git a/kernel/reboot.c b/kernel/reboot.c
index 2fb0357d9483..9afa99a32d62 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -504,6 +504,19 @@ static void do_kernel_power_off_prepare(void)
 	blocking_notifier_call_chain(&power_off_prep_handler_list, 0, NULL);
 }
 
+/**
+ *	do_kernel_power_off - Execute kernel power-off handler call chain
+ *
+ *	Expected to be called as last step of the power-off sequence.
+ *
+ *	Powers off the system immediately if a power-off handler function has
+ *	been registered. Otherwise does nothing.
+ */
+void do_kernel_power_off(void)
+{
+	atomic_notifier_call_chain(&power_off_handler_list, 0, NULL);
+}
+
 /**
  *	kernel_power_off - power_off the system
  *
-- 
2.35.1


