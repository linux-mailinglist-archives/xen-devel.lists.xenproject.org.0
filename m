Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 829FD520883
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 01:33:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324876.547199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noCsU-0000JA-DS; Mon, 09 May 2022 23:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324876.547199; Mon, 09 May 2022 23:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noCsU-0000GF-9L; Mon, 09 May 2022 23:33:22 +0000
Received: by outflank-mailman (input) for mailman id 324876;
 Mon, 09 May 2022 23:33:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s4mp=VR=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1noCsR-0007bw-Rq
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 23:33:19 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6841f3a4-cff0-11ec-a406-831a346695d4;
 Tue, 10 May 2022 01:33:19 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 17BD61F41D8C
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
X-Inumbo-ID: 6841f3a4-cff0-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1652139198;
	bh=95ioqXFiu/sMhB4rC2pN2mOqsgk/IiTVsJJFignNnOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kd6IbYNbTMtYO8XHzDROg022CiuVMjD14vclGIX2y/UPqQJTY83k+AAQHlzWmnvvY
	 DIbOq+AJ+ca0dm9KVPtIZY6LIwJR0dvHVODvj+gWmFv2rrA23tSPFfLb/Ld7WXpuF/
	 H2du8HyPkBmRsP8eQLukPdey+A1NM1blJJ0oKFmsjrsM19cx1w60DHdJiFj+BNJHgA
	 CT2Gw205sJVKh3AqToaLUeLHth6M3pyFt+gPqA8mU19vHxX0uyWcQDKqZ8zNR9Nmqu
	 cRtxZ2gdReA9506AcmJOJiJA6+rn1NttYLHyho2AlivK1XjmQN+dXmlaF9eF72LNY1
	 oD4iLEbpsl5mw==
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
Subject: [PATCH v8 04/27] kernel/reboot: Wrap legacy power-off callbacks into sys-off handlers
Date: Tue, 10 May 2022 02:32:12 +0300
Message-Id: <20220509233235.995021-5-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap legacy power-off callbacks into sys-off handlers in order to
support co-existence of both legacy and new callbacks while we're
in process of upgrading legacy callbacks to the new API.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 kernel/reboot.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 672a658f21ee..2fb0357d9483 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -463,6 +463,47 @@ int devm_register_sys_off_handler(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_register_sys_off_handler);
 
+static int legacy_pm_power_off_prepare(struct sys_off_data *data)
+{
+	if (pm_power_off_prepare)
+		pm_power_off_prepare();
+
+	return NOTIFY_DONE;
+}
+
+static int legacy_pm_power_off(struct sys_off_data *data)
+{
+	if (pm_power_off)
+		pm_power_off();
+
+	return NOTIFY_DONE;
+}
+
+/*
+ * Register sys-off handlers for legacy PM callbacks. This allows legacy
+ * PM callbacks co-exist with the new sys-off API.
+ *
+ * TODO: Remove legacy handlers once all legacy PM users will be switched
+ *       to the sys-off based APIs.
+ */
+static int __init legacy_pm_init(void)
+{
+	register_sys_off_handler(SYS_OFF_MODE_POWER_OFF_PREPARE,
+				 SYS_OFF_PRIO_DEFAULT,
+				 legacy_pm_power_off_prepare, NULL);
+
+	register_sys_off_handler(SYS_OFF_MODE_POWER_OFF, SYS_OFF_PRIO_DEFAULT,
+				 legacy_pm_power_off, NULL);
+
+	return 0;
+}
+core_initcall(legacy_pm_init);
+
+static void do_kernel_power_off_prepare(void)
+{
+	blocking_notifier_call_chain(&power_off_prep_handler_list, 0, NULL);
+}
+
 /**
  *	kernel_power_off - power_off the system
  *
@@ -471,8 +512,7 @@ EXPORT_SYMBOL_GPL(devm_register_sys_off_handler);
 void kernel_power_off(void)
 {
 	kernel_shutdown_prepare(SYSTEM_POWER_OFF);
-	if (pm_power_off_prepare)
-		pm_power_off_prepare();
+	do_kernel_power_off_prepare();
 	migrate_to_reboot_cpu();
 	syscore_shutdown();
 	pr_emerg("Power down\n");
-- 
2.35.1


