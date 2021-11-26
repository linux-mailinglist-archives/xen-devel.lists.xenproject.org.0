Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C57745F35C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 19:02:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233311.404787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfXx-00069h-7e; Fri, 26 Nov 2021 18:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233311.404787; Fri, 26 Nov 2021 18:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfXx-00065j-2q; Fri, 26 Nov 2021 18:02:05 +0000
Received: by outflank-mailman (input) for mailman id 233311;
 Fri, 26 Nov 2021 18:02:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GGcH=QN=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mqfXv-0004Lf-DH
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 18:02:03 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5564549-4ee2-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 19:02:02 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id bu18so26238871lfb.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 10:02:02 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:02:02 -0800 (PST)
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
X-Inumbo-ID: f5564549-4ee2-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=idp+KUM0Lads56hMjVdKoUEucrYOLC8M0llXkHYfiR0=;
        b=q2+3D7luLbLFGQf0rLpPcuWTJ51luwk4E0BLwdexAsMfEPwQ+vkLaGFyWTazwTiBO3
         /31kHhpvsxvbKpD6AoRLviAKAyfSlaZuuBZ4G5+V4OQzeOPzvvdnKmespVy/IqSeX7hO
         YTpSNWUfBdkYMm9sefGyGdAIypO41Y86jqoXG+FM5ZKY1SqW/Wp0Kge+e08k/V8NPYuz
         YtC36m0FSAgcE4CC4jRft7WGjfF+hcgDrvOqUW7oFxpYyW5LwR3hKV2jrTJdfRtBiX7E
         qc34DpRilSgV0iEhvXRNTWvVGUy3qFfYDOeUaBdaf+MPIjTcw1RGSJKn81/KWfdsBdx+
         55DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=idp+KUM0Lads56hMjVdKoUEucrYOLC8M0llXkHYfiR0=;
        b=SXNV+aGBQVxWopMbgF7SlK7bZc83IV5ji8+KsJ7VdfjgBnAQ41ZEBUaEbHK3Y441hG
         H8jhrMZ22Aaay1yYHIbc3RLOf1f6XFgC+FZ3jRQQmHwrMIaWtv0b5y96VESCKs6SEnY9
         NZwtmZP4suj+CRAWZevEhyugzEsuiqWqxlOMC2B7po9Pykpm/N1nwZkbzYUoJuIGsDSv
         /CiFoV9msDsIlrrglq9ma6NjBZEqQ2AyCiKSL7+pymdUjpskVlGEBERS45WT1MWTXYfY
         3aUPpKEG/lutIwL3FKOHNycAyx6zLcdgeCVLMC0l4Y9d7Or1jqQtY0mAQh3R15q6a5sP
         kIxg==
X-Gm-Message-State: AOAM531mMZJaHqYbnDRy/FvfrkmO5dIDejh95A2szPphWBJZwikfLK/b
	5ihabKaUVlupP3Fm5REuzLE=
X-Google-Smtp-Source: ABdhPJyszCqoy2c22hJd1AwW3euuk/YQIYMf48+wUhpEids7tlSfZnt+31CbA93lLkfEy/WCRFUCww==
X-Received: by 2002:ac2:4423:: with SMTP id w3mr31717979lfl.385.1637949722516;
        Fri, 26 Nov 2021 10:02:02 -0800 (PST)
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
Subject: [PATCH v4 06/25] reboot: Warn if unregister_restart_handler() fails
Date: Fri, 26 Nov 2021 21:00:42 +0300
Message-Id: <20211126180101.27818-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Emit warning if unregister_restart_handler() fails since it never should
fail. This will ease further API development by catching mistakes early.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index e6659ae329f1..f0e7b9c13f6b 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -210,7 +210,7 @@ EXPORT_SYMBOL(register_restart_handler);
  */
 int unregister_restart_handler(struct notifier_block *nb)
 {
-	return atomic_notifier_chain_unregister(&restart_handler_list, nb);
+	return WARN_ON(atomic_notifier_chain_unregister(&restart_handler_list, nb));
 }
 EXPORT_SYMBOL(unregister_restart_handler);
 
-- 
2.33.1


