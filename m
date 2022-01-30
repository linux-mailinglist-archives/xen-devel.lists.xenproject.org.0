Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1855E4A3BED
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:49:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262676.455034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJwG-0000C1-SZ; Sun, 30 Jan 2022 23:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262676.455034; Sun, 30 Jan 2022 23:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJwG-00009G-PB; Sun, 30 Jan 2022 23:48:56 +0000
Received: by outflank-mailman (input) for mailman id 262676;
 Sun, 30 Jan 2022 23:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlg-0003lI-R7
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:38:00 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8e75404-8225-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 00:38:00 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id e9so17133354ljq.1
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:38:00 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:59 -0800 (PST)
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
X-Inumbo-ID: a8e75404-8225-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Fjun7H7HFd6eJVLuHg+U86J15PDVhx/hGCMSiPgf2P0=;
        b=dd2fzDC5TDl8KpWUh0gU7+/JjGrL9a19MSGIOALm5z7fXs5VXHit+rqxXTBnz43EEy
         6bAuu4TW+sayWblmW8KdfTygyhCSzYvoS93Z1gI42rqbvA3DwMo07+1y2fEK2Sdi+dYK
         sDP0y+AYT+lJyA1SE0LAK8MGBAbFccq0iNsI8MFwHrM4VDudz2gSr9hVrcXqatHOdkrN
         1PfcjftqYULiK+vhkvAQxqJqQERFYAQADXPAeAOnfrVl+/hqqAaB3aFTvjRxQxWLKkrn
         UW62fbZN1kM7Fr/Abhtj4Byx5IJSmwGLhZ3+a2bcHkPKFWrQslOrFdx+rzve0FEyiDp5
         +e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fjun7H7HFd6eJVLuHg+U86J15PDVhx/hGCMSiPgf2P0=;
        b=GzyF+MHAylz6aPfYbVmKWtuNmCE0h/Y7/v3E56fKSuABNZ4Kpo4Wj3+XA+RD52ONxM
         4Bzna1pXvv307e3w5fQYvoMaHIg8miMcxko+bE4H0JJpo32Ui5l6YgxDSlb64l38uACX
         jin/BjQeVLPUp+sbcFTH8hX55ZbRy/nqtGkjY936X+FmPNGcvXvxVBVOt4/uIN+lr+8l
         PhWzkJfGzZ3DHXqLTxPJlzbzDmz8r5k/ja3DX6/Ohy/lX2dJ226/AOc1BLJo52+79Vvy
         vt+PP47LTalXSo1nXtIdODKTBMpp2J2KBfHG86e1cR6cnIakbMhhrzvw1KMKl2VJL9Xn
         dVlw==
X-Gm-Message-State: AOAM532tFW15SX0HEV8YfH4Va5IsmBmQsUYWCmOHNTHD6uIQdwhtU7tx
	3ZoifyvYzrplg6l+b+VZ+ic=
X-Google-Smtp-Source: ABdhPJztEpqDu7c0duU4BlEMnF97NCTUImWX4xTUQenIAQJSUD2GpIv4OSVa9Xt8JSMsGNu6LN6TTQ==
X-Received: by 2002:a2e:5858:: with SMTP id x24mr11923571ljd.519.1643585879834;
        Sun, 30 Jan 2022 15:37:59 -0800 (PST)
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
Subject: [PATCH v6 19/21] ACPI: power: Switch to sys-off handler API
Date: Mon, 31 Jan 2022 02:37:16 +0300
Message-Id: <20220130233718.21544-20-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to sys-off API that replaces legacy pm_power_off callbacks.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/acpi/sleep.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index a60ff5dfed3a..e27ac5b4645b 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -47,19 +47,11 @@ static void acpi_sleep_tts_switch(u32 acpi_state)
 	}
 }
 
-static int tts_notify_reboot(struct notifier_block *this,
-			unsigned long code, void *x)
+static void tts_reboot_prepare(struct reboot_prep_data *data)
 {
 	acpi_sleep_tts_switch(ACPI_STATE_S5);
-	return NOTIFY_DONE;
 }
 
-static struct notifier_block tts_notifier = {
-	.notifier_call	= tts_notify_reboot,
-	.next		= NULL,
-	.priority	= 0,
-};
-
 static int acpi_sleep_prepare(u32 acpi_state)
 {
 #ifdef CONFIG_ACPI_SLEEP
@@ -1031,7 +1023,7 @@ static void acpi_sleep_hibernate_setup(void)
 static inline void acpi_sleep_hibernate_setup(void) {}
 #endif /* !CONFIG_HIBERNATION */
 
-static void acpi_power_off_prepare(void)
+static void acpi_power_off_prepare(struct power_off_prep_data *data)
 {
 	/* Prepare to power off the system */
 	acpi_sleep_prepare(ACPI_STATE_S5);
@@ -1039,7 +1031,7 @@ static void acpi_power_off_prepare(void)
 	acpi_os_wait_events_complete();
 }
 
-static void acpi_power_off(void)
+static void acpi_power_off(struct power_off_data *data)
 {
 	/* acpi_sleep_prepare(ACPI_STATE_S5) should have already been called */
 	pr_debug("%s called\n", __func__);
@@ -1047,6 +1039,11 @@ static void acpi_power_off(void)
 	acpi_enter_sleep_state(ACPI_STATE_S5);
 }
 
+static struct sys_off_handler acpi_sys_off_handler = {
+	.power_off_priority = POWEROFF_PRIO_FIRMWARE,
+	.reboot_prepare_cb = tts_reboot_prepare,
+};
+
 int __init acpi_sleep_init(void)
 {
 	char supported[ACPI_S_STATE_COUNT * 3 + 1];
@@ -1063,8 +1060,8 @@ int __init acpi_sleep_init(void)
 
 	if (acpi_sleep_state_supported(ACPI_STATE_S5)) {
 		sleep_states[ACPI_STATE_S5] = 1;
-		pm_power_off_prepare = acpi_power_off_prepare;
-		pm_power_off = acpi_power_off;
+		acpi_sys_off_handler.power_off_cb = acpi_power_off;
+		acpi_sys_off_handler.power_off_prepare_cb = acpi_power_off_prepare;
 	} else {
 		acpi_no_s5 = true;
 	}
@@ -1080,6 +1077,6 @@ int __init acpi_sleep_init(void)
 	 * Register the tts_notifier to reboot notifier list so that the _TTS
 	 * object can also be evaluated when the system enters S5.
 	 */
-	register_reboot_notifier(&tts_notifier);
+	register_sys_off_handler(&acpi_sys_off_handler);
 	return 0;
 }
-- 
2.34.1


