Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A6545F354
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 19:02:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233312.404798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfXz-0006WG-LH; Fri, 26 Nov 2021 18:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233312.404798; Fri, 26 Nov 2021 18:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfXz-0006T9-GG; Fri, 26 Nov 2021 18:02:07 +0000
Received: by outflank-mailman (input) for mailman id 233312;
 Fri, 26 Nov 2021 18:02:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GGcH=QN=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mqfXx-0004LT-Ly
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 18:02:05 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f69c965b-4ee2-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 19:02:05 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id e11so20148302ljo.13
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 10:02:04 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:04 -0800 (PST)
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
X-Inumbo-ID: f69c965b-4ee2-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YMqE3plwxFsGF2jAAFpub/HIgtQoag7R/7s0kLQElmo=;
        b=hNDiDyK0mXFGn4DxizRDTh848JRSUoRpy2BGku+puCZb4ybkLBVQYxsigPgsX8oTYo
         6uGIJxTr27Sr/5uMIfvDrPYcj5JZCK4JVm0hmsmagDb+4g/16Qb2Lml6lDE5kEYxSTqN
         1cZzQ5YrCG/5jHmOAHWFPzd6RK6Nxwzyc+2hsTlnygT/PBOMYmYfgTBreyJX/cM8e8Ri
         XH/uWJcEe4LPCRWWl546Fte/fnOxNdqhmyH7lhZm2kP9gpSFr43Ku3Kops2TSD2lJLii
         3tQMh9H3YmdwyreB+CGFvAehWfGPKgIyfGRW4a8rgOWMZfouUk4VEJQah1A9TCWCHZqH
         suDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YMqE3plwxFsGF2jAAFpub/HIgtQoag7R/7s0kLQElmo=;
        b=Mp65sHvsVD+rFGPHfZ1/tpi6quuK4dblanyFkm/TIPXk55VegAgxAcBCu4nByUzErf
         M2k3FSMb4ZzUVVed5248R9p2wdO4TbRLbF84h5Bvp4NBeO+U2VaZon4/yBdSyeE/RpeJ
         waJQlGV1EnqFIxRTvC9JLfY0zBb3QhxQJkWL/a/fRFnC3TtkXOSebZYoN4Fyh2/DrtPS
         GCS9dNsyHXGgFLy1ls3Wze419rYxd5P++cu4LWme6uXe9yKRBmdpmueC+gH+N2wjVbMe
         U99AfYe1Z3R/7IqjfFK/f2tRfwlycesmZVUjk1e7kb2jkAeiqPEtc/Fkaxn9r1Tg1c01
         7l6A==
X-Gm-Message-State: AOAM531TAAGVIF+sPG5ZYWAwgkAfsY0gjSEesuqUYOHClWXr1YaMous/
	83jhBBiWmxjk/bNJP9N/YDk=
X-Google-Smtp-Source: ABdhPJyb8kz1UEvDCKCp+BiDo+e8J/+zE/2jFszIocFNHpuea9i2+EEWlZYq05sNitfJ0uIdOtFxwg==
X-Received: by 2002:a05:651c:b12:: with SMTP id b18mr33869925ljr.306.1637949724600;
        Fri, 26 Nov 2021 10:02:04 -0800 (PST)
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
Subject: [PATCH v4 07/25] reboot: Remove extern annotation from function prototypes
Date: Fri, 26 Nov 2021 21:00:43 +0300
Message-Id: <20211126180101.27818-8-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
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


