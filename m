Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C76E4A3B7C
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:38:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262571.454944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJla-0000He-Ue; Sun, 30 Jan 2022 23:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262571.454944; Sun, 30 Jan 2022 23:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJla-0008UH-3C; Sun, 30 Jan 2022 23:37:54 +0000
Received: by outflank-mailman (input) for mailman id 262571;
 Sun, 30 Jan 2022 23:37:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlV-0003l1-UB
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:37:50 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a26588e3-8225-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 00:37:49 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id z4so23316721lft.3
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:49 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:48 -0800 (PST)
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
X-Inumbo-ID: a26588e3-8225-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lR6BHFjgwiTI/QHx3OYkgrWFcCc5NqsF2rCbYvrczTw=;
        b=OduVSYhLRySW+3FGo+lYc9j4W9HkKmk+97wWY4/PKlxzrnNEGe7IOz6y/PV9uhmuYH
         VbBEW+nYBK2ziWW+TStoU9eZ6gL1PkjuI1ofbTH8+TOQptRYgjmefIFtU0D9AU9yECTE
         wqIQ28X1CWgvtGBdcQInk87pjgtwqDDaYuXcwwDPa/0zDV3/S4ib2HIps9cfr/6meMoa
         dpisZE6WgAIokqI2Ya3EMFRoo30TdvDDOXKmVm0bWzDf4eWjjHx8blQrZkXRZ4mmvZbY
         iP42tSCk0c1besP2SMC/I2M1UFGm2YmtIyiDwWlnaIJMOhQK/UVloZGfKEkbhIA5KUcX
         lOLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lR6BHFjgwiTI/QHx3OYkgrWFcCc5NqsF2rCbYvrczTw=;
        b=yG1z8kdqPBmfq6i0fFP3ZDyg4oY5Z/TwEbW1bW3gfY7NYNDBKa5l2T3P1ZflR+F93Z
         5PagfZCL2p2wQtPBJRI++QB6BOcIyU2d2k8I6Yz2M/RRU5U5zy7ag+7yliaTyYz8hHas
         UHCnFVKQNIIQKeGpehlNCmEHVydnds26JXec/BpCc5sXU+WAOs9OLYOFRaoHf6pz76Ax
         jFt4jBjiST650cMOKDG0bJIxYeYVl4G3I2HFSMQmlOJhOdofvK2CBVtlavdXmwAeRwjB
         162wK1a0IzGjdRN/dwFP8XqNR2jbRB2FUV/YflUCFSIiJst+3WpAdajDtD6JuNpRys3v
         UGyQ==
X-Gm-Message-State: AOAM5308ICYicrufOfZAZMhVMLU+Pwmlir+x1mDRjheR/iN/c2SsOVg1
	mT5xwVs/WlISg6qASSVn5T4=
X-Google-Smtp-Source: ABdhPJwExHziyQ0kLCJityRURMH34UMkV5DKgCH9gkjn+41CqzmGp3rGiEZyC8GTneOx2JMjWbTdbQ==
X-Received: by 2002:a05:6512:3e11:: with SMTP id i17mr13690035lfv.305.1643585868954;
        Sun, 30 Jan 2022 15:37:48 -0800 (PST)
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
Subject: [PATCH v6 13/21] sh: Use do_kernel_power_off()
Date: Mon, 31 Jan 2022 02:37:10 +0300
Message-Id: <20220130233718.21544-14-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kernel now supports chained power-off handlers. Use do_kernel_power_off()
that invokes chained power-off handlers. It also invokes legacy
pm_power_off() for now, which will be removed once all drivers will
be converted to the new power-off API.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/sh/kernel/reboot.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/sh/kernel/reboot.c b/arch/sh/kernel/reboot.c
index 5c33f036418b..e8eeedc9b182 100644
--- a/arch/sh/kernel/reboot.c
+++ b/arch/sh/kernel/reboot.c
@@ -46,8 +46,7 @@ static void native_machine_shutdown(void)
 
 static void native_machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_kernel_power_off();
 }
 
 static void native_machine_halt(void)
-- 
2.34.1


