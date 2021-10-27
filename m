Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C5E43D3F0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217218.377173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJS-0002x8-1d; Wed, 27 Oct 2021 21:18:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217218.377173; Wed, 27 Oct 2021 21:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJR-0002tQ-PZ; Wed, 27 Oct 2021 21:18:21 +0000
Received: by outflank-mailman (input) for mailman id 217218;
 Wed, 27 Oct 2021 21:18:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqJQ-0000sJ-8j
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:18:20 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e7b98de-8165-4f45-971f-8de142cf3589;
 Wed, 27 Oct 2021 21:18:03 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bp15so9011871lfb.4
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:03 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:01 -0700 (PDT)
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
X-Inumbo-ID: 2e7b98de-8165-4f45-971f-8de142cf3589
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O+IvQoJf2OjzCPAk90L+IlIvsTQGqRsS8A3mVG9thss=;
        b=BbS8+/zxVJ00rr3ixtYTd3bTdxqjkUjnBr55DaOxzJArvyNX4521PAqPigYX/BjB1N
         aGylVDFiYrs5wRaWuZx6L52it/PPywema7yDnahBHenwiuFnc4S3m//ivsOGtXuUlPNB
         ubXOhenNVEu1KXB2mXMptIWVwaeJRf3hxW3c8R68HPPg3pjoH3MM7xhUxuphpty83aFx
         DGHamMHIXY7/zgP3wsKkRhZ7yEHgmahY/byikn8BiZjEw2DWUQkjcB5nYo+Xgh+eH8p4
         oVpJycq4ZWi1GYj36y1/HBYlXfcjUxN5WpbpwFTT0cF/PRko7dGul5P66XpFeKCAINSY
         8XVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O+IvQoJf2OjzCPAk90L+IlIvsTQGqRsS8A3mVG9thss=;
        b=UrfxMbjD6aQoXDBgVtOUbnWc7vAvnH2w3/rUs7LcfMphW1ZXGXJyq9lh1MVz6uVbqk
         SGlM5lcxzse7UHKOMm1smaDj1Mmy0ii9G+lGn3AcanYrIEwnI+Dx4DL3ec3JfKiuGThH
         dFdt+0Syw8B2psNEoijmQwaXBomClChOXwE/vbU8k2Zz/ZMOLo4uQ71HM0DwbTwTlkls
         nd1hH9CoAST9DZT0M+0DLvJmmPNlPndJWSwj9L+rWm/zBJ+mddO9vjXWbmV4rXx8DLXH
         7c1EmoE/gRR9iaZ8M7Nu6sCUIE99+CVu7luE27o6kuFUtRCUsUdu950raQWn/TMZWWGK
         2hLQ==
X-Gm-Message-State: AOAM531ZoPascVNJv1Xnz4IO88Octe6frNZVLO+3PmAk/2JUHFPWsjyw
	3nGTLCCQPJFVES/oEGPZAOo=
X-Google-Smtp-Source: ABdhPJxyJaCNELbykyJ8mI+u0lU4wtjMFWua0Lm4EEmjlSiKb32hiTjDEQ+OHhGC/feOlGuy6qCfSA==
X-Received: by 2002:ac2:4285:: with SMTP id m5mr140041lfh.86.1635369481970;
        Wed, 27 Oct 2021 14:18:01 -0700 (PDT)
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
Subject: [PATCH v2 05/45] reboot: Warn if restart handler has duplicated priority
Date: Thu, 28 Oct 2021 00:16:35 +0300
Message-Id: <20211027211715.12671-6-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sanity check which ensures that there are no two restart handlers
registered with the same priority. Normally it's a direct sign of a
problem if two handlers use the same priority.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index efb40d095d1e..d39e599c3c99 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -182,7 +182,20 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
  */
 int register_restart_handler(struct notifier_block *nb)
 {
-	return atomic_notifier_chain_register(&restart_handler_list, nb);
+	int ret;
+
+	ret = atomic_notifier_chain_register(&restart_handler_list, nb);
+	if (ret)
+		return ret;
+
+	/*
+	 * Handler must have unique priority. Otherwise invocation order is
+	 * determined by the registration order, which is presumed to be
+	 * unreliable.
+	 */
+	WARN_ON(!atomic_notifier_has_unique_priority(&restart_handler_list, nb));
+
+	return 0;
 }
 EXPORT_SYMBOL(register_restart_handler);
 
-- 
2.33.1


