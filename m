Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D642843D3F1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Oct 2021 23:18:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217216.377150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJH-0001sB-7e; Wed, 27 Oct 2021 21:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217216.377150; Wed, 27 Oct 2021 21:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfqJH-0001po-3o; Wed, 27 Oct 2021 21:18:11 +0000
Received: by outflank-mailman (input) for mailman id 217216;
 Wed, 27 Oct 2021 21:18:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nMly=PP=gmail.com=digetx@srs-us1.protection.inumbo.net>)
 id 1mfqJG-0000sJ-8f
 for xen-devel@lists.xenproject.org; Wed, 27 Oct 2021 21:18:10 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92f7f69c-ba4d-45e9-915e-e2b0259386cd;
 Wed, 27 Oct 2021 21:17:59 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id bq11so8953119lfb.10
 for <xen-devel@lists.xenproject.org>; Wed, 27 Oct 2021 14:17:59 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:17:57 -0700 (PDT)
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
X-Inumbo-ID: 92f7f69c-ba4d-45e9-915e-e2b0259386cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gfPQe0zgS4I4UWFZNFBbY1KeZFawP+pEpuBLVF6wdKM=;
        b=IF53pE4MG8dtqJfDztqJu8/A7a/y14/j36v2nKdiMw6iu4DWmrRW8MOeE8LURQLXaK
         Ga0+xYwPRFyxojC/znNrOvpLGs+k6KHlhVWadULFKWtX+mXFusF6mHh4CLs+vcnkJVbI
         sCT8nKeVlZGK2TnNZ10Uo/TFQPsaFWopDEGJma2V9OokstL1aGUJunbAvrHKFFxOtEwg
         lD8/h9mw7UJrhz8Lza29Xoci0CHBwnwZJdD56IRSRRGiIs4vKcta6w27872hpSmyCu02
         ZBL1gjD87s9mbzpJUGm1Sbte3r8qhTN12pgeySe/LAcZyKJ0wXtrJhOtFLQB3UvQJ2Q1
         ctBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gfPQe0zgS4I4UWFZNFBbY1KeZFawP+pEpuBLVF6wdKM=;
        b=64LdfLFdyNs9FIPPEP7qdkbVqEL93mZAkB9Tc8XfpIuWXw+Lydsq4mT3ttKfHdDIAY
         66A3gSoTk3+P98ft+5eBhowddOwiahM8qwr0wjdftq6FuH6fLEBy+o2f+jFI4RyY7g5H
         Jucn37Aj6V5gTLwWHr6XASacoboBrnxJ5iNQlUf1pLqEdhGHLvaJ7Z1bydOGpCx53D/m
         E96VXOb2jM7emsXlvF+T/fsjexp6Hn1/7TcfpmqihZE6Vg5JmF13rbIpCkzkycKi05kw
         kYoMYxO8s+bimz5v0gs+WsuWiJO2bQI6lJ9CbMMN7saWgR/pHM72MiogG5k2d7pLVGJ3
         zMTQ==
X-Gm-Message-State: AOAM531v933gp1gYyJVSW4wA4r336AucWFC+dISX9Z3ldhyRuHtaH12k
	akfYXo7Z0oWrtaMVrTVna5o=
X-Google-Smtp-Source: ABdhPJxkIyEtMiQViKWR5fwy6fiT3tpzf12+F4/RJZJ4BQVHBt5yXcPBTwu2lq74yYNLjaS3GsmWQQ==
X-Received: by 2002:a05:6512:1095:: with SMTP id j21mr130850lfg.274.1635369478293;
        Wed, 27 Oct 2021 14:17:58 -0700 (PDT)
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
Subject: [PATCH v2 03/45] notifier: Add atomic/blocking_notifier_has_unique_priority()
Date: Thu, 28 Oct 2021 00:16:33 +0300
Message-Id: <20211027211715.12671-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add atomic/blocking_notifier_has_unique_priority() helpers which return
true if given handler has unique priority.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  5 +++
 kernel/notifier.c        | 74 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 054271e9cb20..b782ce100022 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -175,6 +175,11 @@ int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 
 bool blocking_notifier_call_chain_empty(struct blocking_notifier_head *nh);
 
+bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
+		struct notifier_block *nb);
+bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
+		struct notifier_block *nb);
+
 #define NOTIFY_DONE		0x0000		/* Don't care */
 #define NOTIFY_OK		0x0001		/* Suits me */
 #define NOTIFY_STOP_MASK	0x8000		/* Don't call further */
diff --git a/kernel/notifier.c b/kernel/notifier.c
index 1f7ba8988b90..cf0e1c4bd364 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -203,6 +203,40 @@ int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
 EXPORT_SYMBOL_GPL(atomic_notifier_call_chain);
 NOKPROBE_SYMBOL(atomic_notifier_call_chain);
 
+/**
+ *	atomic_notifier_has_unique_priority - Checks whether notifier's priority is unique
+ *	@nh: Pointer to head of the atomic notifier chain
+ *	@n: Entry in notifier chain to check
+ *
+ *	Checks whether there is another notifier in the chain with the same priority.
+ *	Must be called in process context.
+ *
+ *	Returns true if priority is unique, false otherwise.
+ */
+bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
+		struct notifier_block *n)
+{
+	struct notifier_block **nl = &nh->head;
+	unsigned long flags;
+	bool ret = true;
+
+	spin_lock_irqsave(&nh->lock, flags);
+
+	while ((*nl) != NULL && (*nl)->priority >= n->priority) {
+		if ((*nl)->priority == n->priority && (*nl) != n) {
+			ret = false;
+			break;
+		}
+
+		nl = &((*nl)->next);
+	}
+
+	spin_unlock_irqrestore(&nh->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(atomic_notifier_has_unique_priority);
+
 /*
  *	Blocking notifier chain routines.  All access to the chain is
  *	synchronized by an rwsem.
@@ -336,6 +370,46 @@ bool blocking_notifier_call_chain_empty(struct blocking_notifier_head *nh)
 }
 EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_empty);
 
+/**
+ *	blocking_notifier_has_unique_priority - Checks whether notifier's priority is unique
+ *	@nh: Pointer to head of the blocking notifier chain
+ *	@n: Entry in notifier chain to check
+ *
+ *	Checks whether there is another notifier in the chain with the same priority.
+ *	Must be called in process context.
+ *
+ *	Returns true if priority is unique, false otherwise.
+ */
+bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
+		struct notifier_block *n)
+{
+	struct notifier_block **nl = &nh->head;
+	bool ret = true;
+
+	/*
+	 * This code gets used during boot-up, when task switching is
+	 * not yet working and interrupts must remain disabled.  At
+	 * such times we must not call down_write().
+	 */
+	if (system_state != SYSTEM_BOOTING)
+		down_write(&nh->rwsem);
+
+	while ((*nl) != NULL && (*nl)->priority >= n->priority) {
+		if ((*nl)->priority == n->priority && (*nl) != n) {
+			ret = false;
+			break;
+		}
+
+		nl = &((*nl)->next);
+	}
+
+	if (system_state != SYSTEM_BOOTING)
+		up_write(&nh->rwsem);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(blocking_notifier_has_unique_priority);
+
 /*
  *	Raw notifier chain routines.  There is no protection;
  *	the caller must provide it.  Use at your own risk!
-- 
2.33.1


