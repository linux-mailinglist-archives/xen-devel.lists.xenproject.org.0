Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DC343D3F7
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217223.377184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJX-0003Ut-Ek; Wed, 27 Oct 2021 21:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217223.377184; Wed, 27 Oct 2021 21:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJX-0003Sa-7U; Wed, 27 Oct 2021 21:18:27 +0000
Received: by outflank-mailman (input) for mailman id 217223;
 Wed, 27 Oct 2021 21:18:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqJV-0000sJ-8v
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:18:25 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed0e3168-9c8e-4547-b3ab-80654ef25559;
 Wed, 27 Oct 2021 21:18:04 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id f3so803673lfu.12
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:18:04 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:18:03 -0700 (PDT)
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
X-Inumbo-ID: ed0e3168-9c8e-4547-b3ab-80654ef25559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iOJthmuPEC7IB5L8OM1uajmE3s/Ei+DiZXNIsEtdoSk=;
        b=M6DsUnX+Dqnnl5/0WkKsChXFOe/dRyATOHCL/N/d/DYRaMuFNhNXN2y8l/5KKDdvO8
         HePUBv3ijZ6wA1hQMS8r/8Dy8p8fDstfsgPNvYzogEnoiN08aVSWSCzuevGifeB4Cbsl
         JU+F7xYiyB1f3JwKGti4sTNyf7tgTKcPyJdN2KeBPBno+Y11B21cmAzeN1UTCPeELLZl
         qo9vl+NLInil/J95xFZK38OdgQBYthlLceqQb/6Zg0gcqPneeFesfA544/Mc5a4V8TTa
         vBfOArxwV6NLDS9FtxVb4oHCbiHa9QgKi34nHbfFFiWQfKG+GQY4kpTfJykuXmLPssEZ
         NnyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iOJthmuPEC7IB5L8OM1uajmE3s/Ei+DiZXNIsEtdoSk=;
        b=v2Wu1pBzcuimhXiQpobWtfPQk1jmkCVHOFitT/T+vNyNgxEblaa05wvJxqwIEACx/c
         kWCPNkiUfpofFZ8AzXxfF1h9GgiZwIlHx7woH8y3b5mwakOLaOGgNgeifd1j4xjcqjyU
         hFi3faP/fl4NGm7Rb/HtWWZDIwHQ9ZGX60IUclnmsKfivqGZuRP42PdUaNZp3Um51oK4
         tqYBUM+C7Rwy+y2w4KBtvNyxLLfHCYi3r4SnU5FFrmtPSdnl1SQ0OvA8fYqrvCl0hd7g
         5Oy24C6s7ppuP/UNcg6a6zQdAhuPicPDZMfegF3KA14DpFoietjAM59eHz4+AQgTysZh
         WuGg==
X-Gm-Message-State: AOAM532sWDDIKQt36CQ3TnAQ6ct21G3ht4iBnLlolyOyxUdF36n54XjA
	TwnCkHeHtO//ZgXQlW5pYas=
X-Google-Smtp-Source: ABdhPJySbOm+27yOjORJjCzB1RrKvb62o79gukvdjDZzwYphfPzvlvqWgT3cY5UK3KGllNbg7CmL+w==
X-Received: by 2002:a05:6512:344a:: with SMTP id j10mr74981lfr.653.1635369483872;
        Wed, 27 Oct 2021 14:18:03 -0700 (PDT)
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
Subject: [PATCH v2 06/45] reboot: Warn if unregister_restart_handler() fails
Date: Thu, 28 Oct 2021 00:16:36 +0300
Message-Id: <20211027211715.12671-7-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Emit warning if unregister_restart_handler() fails since it never should
fail. This will ease further API development by catching mistakes early.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index d39e599c3c99..291d44082f42 100644
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


