Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB243D5B5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217342.377433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqTH-0000KQ-Tr; Wed, 27 Oct 2021 21:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217342.377433; Wed, 27 Oct 2021 21:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqTH-0000Em-Iz; Wed, 27 Oct 2021 21:28:31 +0000
Received: by outflank-mailman (input) for mailman id 217342;
 Wed, 27 Oct 2021 21:28:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqKY-0000sJ-AS
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:19:30 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f389b0c-6a35-4f94-9ef8-4b8e581c515e;
 Wed, 27 Oct 2021 21:18:29 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id u21so8956897lff.8
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:29 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:28 -0700 (PDT)
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
X-Inumbo-ID: 9f389b0c-6a35-4f94-9ef8-4b8e581c515e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=032w538UVpeATjNmIAIpxMVbSRQ+KkFSikcjH52Go7E=;
        b=i8kSi+aWSekhMHl+RIohvB2J9+GhXDqC8y87gHZKIo3HgrCgrxAFgJBJNd643IAUw8
         g9MSIRkc2bpIwozO+KBB9OaCJ9xgY87SwdOaEqBvwzFZ8T3iGC1OLWPTCXnsFCHj5/5U
         sps32PSa8KExjTmWa9ZRL9t+O9qr0b8kzTl0fgjkERRFIi+xDfIxjTflHCHCDk5rZ0mt
         zfhXGA8+rDpphj6+WcqiIpDWahpS8la7wRdBB0/XTYtTbOXFjjBe+uIATNvGTQr/gKbD
         b/xTsJZdL1e/rQ412ul4+9vATu7deYBtZoT3x3kO5sbA1sdcdzRIoZ4KvX2dngppNAWQ
         v1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=032w538UVpeATjNmIAIpxMVbSRQ+KkFSikcjH52Go7E=;
        b=bw3fD/MMX27aKYnvSDOUOSLRmXplsrMnpZlahUi3WGGS0jwoa55B0M1BapMn+pcDyM
         f4FJ23U90tsl7C+uEIzLp5B8bmeVU30sXo/FKon/Ycd6C2WHO57HNbmD4p3axFuKRUsI
         bjyR0Eh4aoyrULyIreR7Uz0nFwnvltN5R8k0A7aqODcm1Qou/v3MuIkgLHjR1ZJvs0hh
         j4WIjJ2dp1QGko0fH3Kng/gbbnrxY6eY+7bAae/Us4QW8dVn+6uFLi6IGY0TgZT69g1e
         AOYyDK+m0KFwhCnxxnCFxPjn5hopliaSSXwnsUfMdmFZrJA1GAPHdP6yJVxdYFAi2dCH
         Mb5A==
X-Gm-Message-State: AOAM533CiNkFN3jGqSiTv1+o2H95SBi17uQwPDb8KmVwvjXVFdPDs083
	yce+SSwUSTA6mH/BPbiH7lE=
X-Google-Smtp-Source: ABdhPJxRtK/tJ0GqKzVRuD4r9yGdXpMq7YD+HTcHjRYwt7Ifx6KwMehlmhPixjH5hNZN4Zb5ESKkAg==
X-Received: by 2002:a05:6512:1316:: with SMTP id x22mr96787lfu.291.1635369508415;
        Wed, 27 Oct 2021 14:18:28 -0700 (PDT)
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
Subject: [PATCH v2 19/45] sh: Use do_kernel_power_off()
Date: Thu, 28 Oct 2021 00:16:49 +0300
Message-Id: <20211027211715.12671-20-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
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
2.33.1


