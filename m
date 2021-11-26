Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F5745F357
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 19:02:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233308.404754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfXq-0005Bz-W9; Fri, 26 Nov 2021 18:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233308.404754; Fri, 26 Nov 2021 18:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqfXq-00059q-RL; Fri, 26 Nov 2021 18:01:58 +0000
Received: by outflank-mailman (input) for mailman id 233308;
 Fri, 26 Nov 2021 18:01:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GGcH=QN=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1mqfXp-0004LT-4Q
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 18:01:57 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f17e9ae7-4ee2-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 19:01:56 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id c32so26150356lfv.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Nov 2021 10:01:56 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id i32sm553831lfv.295.2021.11.26.10.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 10:01:55 -0800 (PST)
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
X-Inumbo-ID: f17e9ae7-4ee2-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hKe22x9bX8JCg83Zw5KeGH71BwPAfgMBPhF5RAtnzGg=;
        b=b2ZfJiMeqx8AeLNXyztIQbqzNlGBVbhad44TGqM7lHiw/fjxif6gU0gZoYYArSlKqo
         EeAwZj+BCdzu3uIIM/smFVDttYIEyo/Z4cQTphN83yvq86PvnU0W4Ie+2AQfRx3m6El9
         ezh/1hh7/6Ybscv4tcBLpgDBuHeraJRPSdMAVRwkC5F75rh6n2MHscxaOB/rlIJUGpHn
         JYFzCa+B1QR2KMEZvRV/l+C8C5tLmBjWELwgqyH4k7ET0Q1PJi6aubc/gMu03uwbYwz0
         9IzBTEPDl6TbzF28FQAcA3Viml2my3zBgMjGFEkpGjjrauzxX9PSIX9E5Ca5qAHE77RJ
         Cyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hKe22x9bX8JCg83Zw5KeGH71BwPAfgMBPhF5RAtnzGg=;
        b=S8zX51IeS5DqCnnxsLxu7RlLr6mcnKzTVY0dGs3YKHaabxVvmpco6sHAK7QT3x2ea6
         122i+AXbWGKAW0IPMmlGmICpWSWD55h2JCqYVtGgWza/aMiQJ/aIho/zM8KV0aiCFiwd
         G6MRnvN2fkP27AFcrLnS5CD1uZXH0v4vuO2TUUdf4Ll1G0ZI1TzSGJAiQhCx9tZ+48ZG
         9kDmcos8UqSvMihwTxxuwOJZKRg/MTjqEnLGdmybf5jAN3xsEeKm1f3CbNjaZ2aNCkoa
         xTTu7lavM6pzFXvgSUQze4J/XT0lKM9pxmYUetlcPMC3jXwCjhbPP98ZT50dPhMzwHcD
         gXKw==
X-Gm-Message-State: AOAM530JUZClx4xGxJYrK50MPwekRREe28oraoG9EM/7pPfG900+WhXz
	Jn30IpHVVEZSA8hhwn31U24=
X-Google-Smtp-Source: ABdhPJxizgxN6H8utklWV5PP7BDnBAFFswn6Wu2IY4jESwUo2k1vRD/GT6BFqxqb00p7BIY/tAXbNQ==
X-Received: by 2002:a05:6512:3192:: with SMTP id i18mr30735000lfe.205.1637949715998;
        Fri, 26 Nov 2021 10:01:55 -0800 (PST)
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
Subject: [PATCH v4 03/25] notifier: Add atomic/blocking_notifier_has_unique_priority()
Date: Fri, 26 Nov 2021 21:00:39 +0300
Message-Id: <20211126180101.27818-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126180101.27818-1-digetx@gmail.com>
References: <20211126180101.27818-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add atomic/blocking_notifier_has_unique_priority() helpers which return
true if given handler has unique priority.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  5 +++
 kernel/notifier.c        | 69 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 924c9d7c8e73..2c4036f225e1 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -175,6 +175,11 @@ int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 
 bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh);
 
+bool atomic_notifier_has_unique_priority(struct atomic_notifier_head *nh,
+		struct notifier_block *nb);
+bool blocking_notifier_has_unique_priority(struct blocking_notifier_head *nh,
+		struct notifier_block *nb);
+
 #define NOTIFY_DONE		0x0000		/* Don't care */
 #define NOTIFY_OK		0x0001		/* Suits me */
 #define NOTIFY_STOP_MASK	0x8000		/* Don't call further */
diff --git a/kernel/notifier.c b/kernel/notifier.c
index b20cb7b9b1f0..7a325b742104 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -122,6 +122,19 @@ static int notifier_call_chain_robust(struct notifier_block **nl,
 	return ret;
 }
 
+static int notifier_has_unique_priority(struct notifier_block **nl,
+					struct notifier_block *n)
+{
+	while (*nl && (*nl)->priority >= n->priority) {
+		if ((*nl)->priority == n->priority && *nl != n)
+			return false;
+
+		nl = &((*nl)->next);
+	}
+
+	return true;
+}
+
 /*
  *	Atomic notifier chain routines.  Registration and unregistration
  *	use a spinlock, and call_chain is synchronized by RCU (no locks).
@@ -203,6 +216,30 @@ int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
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
+	unsigned long flags;
+	bool ret;
+
+	spin_lock_irqsave(&nh->lock, flags);
+	ret = notifier_has_unique_priority(&nh->head, n);
+	spin_unlock_irqrestore(&nh->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(atomic_notifier_has_unique_priority);
+
 /*
  *	Blocking notifier chain routines.  All access to the chain is
  *	synchronized by an rwsem.
@@ -336,6 +373,38 @@ bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
 }
 EXPORT_SYMBOL_GPL(blocking_notifier_call_chain_is_empty);
 
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
+	bool ret;
+
+	/*
+	 * This code gets used during boot-up, when task switching is
+	 * not yet working and interrupts must remain disabled. At such
+	 * times we must not call down_read().
+	 */
+	if (system_state != SYSTEM_BOOTING)
+		down_read(&nh->rwsem);
+
+	ret = notifier_has_unique_priority(&nh->head, n);
+
+	if (system_state != SYSTEM_BOOTING)
+		up_read(&nh->rwsem);
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


