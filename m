Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE94B43D406
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:18:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217228.377195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJb-00044o-M6; Wed, 27 Oct 2021 21:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217228.377195; Wed, 27 Oct 2021 21:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJb-00041E-HK; Wed, 27 Oct 2021 21:18:31 +0000
Received: by outflank-mailman (input) for mailman id 217228;
 Wed, 27 Oct 2021 21:18:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqJa-0000sJ-92
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:18:30 +0000
Received: from mail-lj1-x22f.google.com (unknown [2a00:1450:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f7f8704-d885-405c-9c50-3b01bfd973f5;
 Wed, 27 Oct 2021 21:18:06 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id n7so6988482ljp.5
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:06 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:05 -0700 (PDT)
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
X-Inumbo-ID: 9f7f8704-d885-405c-9c50-3b01bfd973f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YMqE3plwxFsGF2jAAFpub/HIgtQoag7R/7s0kLQElmo=;
        b=FUIf1ArHmNaCMJZ4bSQxWbL5JCSm2CJKzXGlBqJrWaAR8tSPTufWS8xOyLSwSu1PM5
         2liVJ/5r60CrtJJr5DfBlw1KykabxABPWMHDsuYjgXtr14EcQg2JUBTjbQBqUDOiqreb
         QGWgVclCqks9knb00wTu5MnkQu4fzkoUJI9+ACesDxpbb8YGJKMHlYbydkINuBcjzEjx
         IFIHDVdQgtIeC1A4mREDvIovPg1tG0nOTZB7ncUf8fLjV8foPKyZUn+53/McMAaFU2Ip
         XymrGCj037mcVReap7wcm8US/GqkUtNAHHKTZ6VwLbtZ8u26dh3C526wfrT0Bgbs2S/w
         m+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YMqE3plwxFsGF2jAAFpub/HIgtQoag7R/7s0kLQElmo=;
        b=agydHyY3LtTwXzA4hAoSA7OCZXDaF4mqDR8dRXHztPFIo8PCdiPJhpL9vXlzY4HQMK
         hRdKi+cdnWzAnpr6obM3m5OSv0/Bfdu6bK+1F77eFZGKsFnrx/zKV+PoViPGNMMNa9Yw
         6TgbES9p4XDwrYMF53H1R9e6f69wtBMyIYNmLqaJfwHP5UW0Nz0MP9FpPwjQX1Pe7Lrg
         4UEcDjKPCzF+gom6GE2jaSliMvQkk4EuZBPfUobzRxvRsDhVCfNgZrPdKqxnUrKXZVn3
         7uuhKJdEAantDviyVOdnM/nlquzDIKFoQbGw+xP80YYTAOh6ZbtzOt7eGpihjDtosA2f
         0qzA==
X-Gm-Message-State: AOAM531mZGPuHLVrhRYoZ3Cr2K/ovUhQx0vnGMFbZMmeNliaFe9QGePW
	AiqQArBoqyrgoGdg/iaevvM=
X-Google-Smtp-Source: ABdhPJwf9klS71294z2BVTXZCugJ9JFGgS+3s6bIBq/C8DIXy9Ezc+U1oWDuHg++RtezU/Ib7TxqLQ==
X-Received: by 2002:a2e:2f19:: with SMTP id v25mr310304ljv.281.1635369485711;
        Wed, 27 Oct 2021 14:18:05 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Lee Jones <lee.jones@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
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
	Len Brown <lenb@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Pavel Machek <pavel@ucw.cz>,
	linux-arm-kernel@lists.infradead.org,
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
	linux-omap@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 07/45] reboot: Remove extern annotation from function prototypes
Date: Thu, 28 Oct 2021 00:16:37 +0300
Message-Id: <20211027211715.12671-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to annotate function prototypes with 'extern', it makes
code less readable. Remove unnecessary annotations from <reboot.h>.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/reboot.h | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index 7c288013a3ca..b7fa25726323 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -40,36 +40,36 @@ extern int reboot_cpu;
 extern int reboot_force;
 
 
-extern int register_reboot_notifier(struct notifier_block *);
-extern int unregister_reboot_notifier(struct notifier_block *);
+int register_reboot_notifier(struct notifier_block *);
+int unregister_reboot_notifier(struct notifier_block *);
 
-extern int devm_register_reboot_notifier(struct device *, struct notifier_block *);
+int devm_register_reboot_notifier(struct device *, struct notifier_block *);
 
-extern int register_restart_handler(struct notifier_block *);
-extern int unregister_restart_handler(struct notifier_block *);
-extern void do_kernel_restart(char *cmd);
+int register_restart_handler(struct notifier_block *);
+int unregister_restart_handler(struct notifier_block *);
+void do_kernel_restart(char *cmd);
 
 /*
  * Architecture-specific implementations of sys_reboot commands.
  */
 
-extern void migrate_to_reboot_cpu(void);
-extern void machine_restart(char *cmd);
-extern void machine_halt(void);
-extern void machine_power_off(void);
+void migrate_to_reboot_cpu(void);
+void machine_restart(char *cmd);
+void machine_halt(void);
+void machine_power_off(void);
 
-extern void machine_shutdown(void);
+void machine_shutdown(void);
 struct pt_regs;
-extern void machine_crash_shutdown(struct pt_regs *);
+void machine_crash_shutdown(struct pt_regs *);
 
 /*
  * Architecture independent implementations of sys_reboot commands.
  */
 
-extern void kernel_restart_prepare(char *cmd);
-extern void kernel_restart(char *cmd);
-extern void kernel_halt(void);
-extern void kernel_power_off(void);
+void kernel_restart_prepare(char *cmd);
+void kernel_restart(char *cmd);
+void kernel_halt(void);
+void kernel_power_off(void);
 
 extern int C_A_D; /* for sysctl */
 void ctrl_alt_del(void);
@@ -77,15 +77,15 @@ void ctrl_alt_del(void);
 #define POWEROFF_CMD_PATH_LEN	256
 extern char poweroff_cmd[POWEROFF_CMD_PATH_LEN];
 
-extern void orderly_poweroff(bool force);
-extern void orderly_reboot(void);
+void orderly_poweroff(bool force);
+void orderly_reboot(void);
 void hw_protection_shutdown(const char *reason, int ms_until_forced);
 
 /*
  * Emergency restart, callable from an interrupt handler.
  */
 
-extern void emergency_restart(void);
+void emergency_restart(void);
 #include <asm/emergency-restart.h>
 
 #endif /* _LINUX_REBOOT_H */
-- 
2.33.1


