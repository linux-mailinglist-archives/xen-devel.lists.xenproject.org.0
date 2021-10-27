Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AC943D3FC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217214.377129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJ7-0001AF-EV; Wed, 27 Oct 2021 21:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217214.377129; Wed, 27 Oct 2021 21:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJ7-00018T-AQ; Wed, 27 Oct 2021 21:18:01 +0000
Received: by outflank-mailman (input) for mailman id 217214;
 Wed, 27 Oct 2021 21:18:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqJ6-0000sJ-8E
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:18:00 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bce1809a-144c-4b61-baea-055b3065fd00;
 Wed, 27 Oct 2021 21:17:55 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id l13so8987907lfg.6
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:17:55 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:17:54 -0700 (PDT)
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
X-Inumbo-ID: bce1809a-144c-4b61-baea-055b3065fd00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wTvK5kO0FUcGnxCyVmK+GKrZNfPhZFNt57h0QWat/qo=;
        b=ZqOcoukrajwjG0ttfhDDamRtFbZgEiaFrpLAXOR7yQBANjFcnFFXOdYomTLQXBItFZ
         6fsN0Gio8AJkokF0BnxXjlaJgq1CP0FdapZULDkVLC880wSvbduG3ij7wOgm65yyZHfb
         /MEYtYvu3WnHHl8p/60KRwD6dDnaqpWEGWZELHlL42ECg0BG3xSUbLaFXBGJ8l5anvCb
         nmVZ+GAgVHAauuOzz3lnhLFItX2Cbpx7VOJRMQdOkh5vDNRTVY6CLlgAa8SfZ45DmHqN
         vHhGZ7nhCEzJCcCT39f5nwGqOjoorbJierMaHF5OrWAM3eykGjghB0x8WQgbnqhmKJ6c
         aKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wTvK5kO0FUcGnxCyVmK+GKrZNfPhZFNt57h0QWat/qo=;
        b=MIyTjnIccPfpARTs5S90w7eSfTcVG97Wl1FCYn1foRqK1bM3rJxz8MNBBFJt5qIOFz
         JvNNj8UN3W57LU5sLm6RaT7n2+khgZ7SoylSHQWk/5TkEqKxPR+hZbFn+7OIuUkcaRmE
         uB0BL9uBmZzMY+aAbUljOB46JF0TaDhdfb7eT/VqlYCnVuq5IG3l20zr7maxOVSqQU/+
         ymr5GstanfdYpB3AD3SJnD57nZipAL/lQLeHdkVNH9sQIcG3Izeg8CcO63srO4t2OiGb
         /ECsspTdje2lLOidOQCRglJ313Zk4UYMhpGkWOSPWEh3ELzEpBqD7cugUh7b2q9Fettd
         nf6w==
X-Gm-Message-State: AOAM530/VMHBivxVEjajZTXAgviYAAmdkRbZon9ycXjEytv44oN+bTaR
	OHoJeYkbl9dDgLPyqEyHN48=
X-Google-Smtp-Source: ABdhPJwuKOrqeex0uVzCe5G2iTS4vzkdpHKtiR+d5t3erf2uXeC/mCcisVEMxQQhKVgKCWNS6EmCsw==
X-Received: by 2002:a05:6512:38d0:: with SMTP id p16mr80629lft.483.1635369474451;
        Wed, 27 Oct 2021 14:17:54 -0700 (PDT)
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
Subject: [PATCH v2 01/45] notifier: Remove extern annotation from function prototypes
Date: Thu, 28 Oct 2021 00:16:31 +0300
Message-Id: <20211027211715.12671-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to annotate function prototypes with 'extern', it makes
code less readable. Remove unnecessary annotations from <notifier.h>.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 87069b8459af..4b80a815b666 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -90,7 +90,7 @@ struct srcu_notifier_head {
 	} while (0)
 
 /* srcu_notifier_heads must be cleaned up dynamically */
-extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
+void srcu_init_notifier_head(struct srcu_notifier_head *nh);
 #define srcu_cleanup_notifier_head(name)	\
 		cleanup_srcu_struct(&(name)->srcu);
 
@@ -141,36 +141,36 @@ extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
 
 #ifdef __KERNEL__
 
-extern int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
+int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
 		struct notifier_block *nb);
-extern int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
+int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
 		struct notifier_block *nb);
-extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
+int raw_notifier_chain_register(struct raw_notifier_head *nh,
 		struct notifier_block *nb);
-extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
+int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
 		struct notifier_block *nb);
 
-extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
+int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
 		struct notifier_block *nb);
-extern int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
+int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
 		struct notifier_block *nb);
-extern int raw_notifier_chain_unregister(struct raw_notifier_head *nh,
+int raw_notifier_chain_unregister(struct raw_notifier_head *nh,
 		struct notifier_block *nb);
-extern int srcu_notifier_chain_unregister(struct srcu_notifier_head *nh,
+int srcu_notifier_chain_unregister(struct srcu_notifier_head *nh,
 		struct notifier_block *nb);
 
-extern int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
+int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
 		unsigned long val, void *v);
-extern int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
+int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
 		unsigned long val, void *v);
-extern int raw_notifier_call_chain(struct raw_notifier_head *nh,
+int raw_notifier_call_chain(struct raw_notifier_head *nh,
 		unsigned long val, void *v);
-extern int srcu_notifier_call_chain(struct srcu_notifier_head *nh,
+int srcu_notifier_call_chain(struct srcu_notifier_head *nh,
 		unsigned long val, void *v);
 
-extern int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh,
+int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh,
 		unsigned long val_up, unsigned long val_down, void *v);
-extern int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
+int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 		unsigned long val_up, unsigned long val_down, void *v);
 
 #define NOTIFY_DONE		0x0000		/* Don't care */
-- 
2.33.1


