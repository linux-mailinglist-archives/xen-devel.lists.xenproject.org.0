Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AEAA4A3B7D
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 00:38:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262557.454825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlE-0004J7-At; Sun, 30 Jan 2022 23:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262557.454825; Sun, 30 Jan 2022 23:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEJlE-0004H2-7W; Sun, 30 Jan 2022 23:37:32 +0000
Received: by outflank-mailman (input) for mailman id 262557;
 Sun, 30 Jan 2022 23:37:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=imrt=SO=gmail.com=digetx@srs-se1.protection.inumbo.net>)
 id 1nEJlC-0003l1-8r
 for xen-devel@lists.xenproject.org; Sun, 30 Jan 2022 23:37:30 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 968408d4-8225-11ec-8f75-fffcc8bd4f1a;
 Mon, 31 Jan 2022 00:37:29 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id x23so23419004lfc.0
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jan 2022 15:37:29 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id a24sm1262950ljp.112.2022.01.30.15.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:37:28 -0800 (PST)
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
X-Inumbo-ID: 968408d4-8225-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=abZuVOnKYJAOti8qIudzltr7GQTBeB9LiERH+rgMBF4=;
        b=p0RaoTyud6v2TpDuA71R51f3ompbP9DRaCJYPeyLts5rHK9ixyqkUUhLaSJgb2r2Bg
         2TTG5yphU072WSUMSAx/Z+kedFFVoyzjVzcSIYIUbH1Yygh8uhixqRaJerJ4N4thXRrQ
         oujlk5kkszBM8GgYOLJuChJo6KFJbDZwMBSQdgvwviExvuANo3f0HA/iWpifG7cGjO9P
         b27LiqDaZyav/RPf+JoXyPtERudU0yiqx/A+AO0NhKUrQUUb079dd3JY2rcLq6SyDepk
         dR2VkwBl97GbYrFjbl4KaoSrBe6E7PpqgsF7oDcCPQvs2XTA7ek0i6MDjXu+YxCSo722
         08Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=abZuVOnKYJAOti8qIudzltr7GQTBeB9LiERH+rgMBF4=;
        b=Oqp+o/Hqu+qpEaTcas3LENrT0p3zSOeR1ul1Bz4ZvbmNWTbgGSsXvdQo8f/yz8r7/t
         PEW/kc0vO1YBXOQqeoBWRP2dGdhHu3S2KMshYCVycgJsIwP+UXj2z4+VbGeYxKEnT8FC
         05FVe0e0MC4gcDR+9isypjh8bBbLhizXaszakGIQYEnEjOtwKKE6QmS51KZKkjJMQ7wj
         41XKG4KsfqfwUOkiQOJaB367J/KhsTwiY6thhiWF/ljOvyb8nwVGXkkXLxYNGGg6TqTT
         FlwUvEv52lVT4NDEd4xHdrBpIB271HQEymPa7WvzIwMwfMgyCKTSqmf6wa7b8GOn9Ea+
         XZVw==
X-Gm-Message-State: AOAM532W9fL8XZ99xeVeDMRipSzZt4Xme7V+iE2ir0dh4eSTMsTWrPDJ
	mLZjme+f4R9DFl1ZtoIMI0E=
X-Google-Smtp-Source: ABdhPJwoSJ34ynL6g6uCWlwcTzESsIxMTUNdOjTg1GYgEDzDCVzjTtPXpJhMlyQWeh/100C0s5LuvA==
X-Received: by 2002:ac2:554a:: with SMTP id l10mr13295710lfk.534.1643585848967;
        Sun, 30 Jan 2022 15:37:28 -0800 (PST)
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
Subject: [PATCH v6 02/21] notifier: Add atomic/blocking_notifier_chain_register_unique_prio()
Date: Mon, 31 Jan 2022 02:36:59 +0300
Message-Id: <20220130233718.21544-3-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130233718.21544-1-digetx@gmail.com>
References: <20220130233718.21544-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add variant of atomic/blocking_notifier_chain_register() functions that
doesn't allow to register notifier using a duplicated priority. The -EBUSY
error code is returned in this case by the new API functions.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h |  5 +++
 kernel/notifier.c        | 88 +++++++++++++++++++++++++++++++---------
 2 files changed, 74 insertions(+), 19 deletions(-)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index d4717bc0ab85..ccce26197dd2 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -150,6 +150,11 @@ extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
 extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
 		struct notifier_block *nb);
 
+extern int atomic_notifier_chain_register_unique_prio(
+		struct atomic_notifier_head *nh, struct notifier_block *nb);
+extern int blocking_notifier_chain_register_unique_prio(
+		struct blocking_notifier_head *nh, struct notifier_block *nb);
+
 extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
 		struct notifier_block *nb);
 extern int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
diff --git a/kernel/notifier.c b/kernel/notifier.c
index 4ed6bda8f127..4fc32b1e6cbb 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -20,7 +20,8 @@ BLOCKING_NOTIFIER_HEAD(reboot_notifier_list);
  */
 
 static int notifier_chain_register(struct notifier_block **nl,
-				   struct notifier_block *n)
+				   struct notifier_block *n,
+				   bool unique_priority)
 {
 	while ((*nl) != NULL) {
 		if (unlikely((*nl) == n)) {
@@ -30,6 +31,8 @@ static int notifier_chain_register(struct notifier_block **nl,
 		}
 		if (n->priority > (*nl)->priority)
 			break;
+		if (n->priority == (*nl)->priority && unique_priority)
+			return -EBUSY;
 		nl = &((*nl)->next);
 	}
 	n->next = *nl;
@@ -144,12 +147,35 @@ int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
 	int ret;
 
 	spin_lock_irqsave(&nh->lock, flags);
-	ret = notifier_chain_register(&nh->head, n);
+	ret = notifier_chain_register(&nh->head, n, false);
 	spin_unlock_irqrestore(&nh->lock, flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(atomic_notifier_chain_register);
 
+/**
+ *	atomic_notifier_chain_register_unique_prio - Add notifier to an atomic notifier chain
+ *	@nh: Pointer to head of the atomic notifier chain
+ *	@n: New entry in notifier chain
+ *
+ *	Adds a notifier to an atomic notifier chain if there is no other
+ *	notifier registered using the same priority.
+ *
+ *	Returns 0 on success, %-EEXIST or %-EBUSY on error.
+ */
+int atomic_notifier_chain_register_unique_prio(struct atomic_notifier_head *nh,
+					       struct notifier_block *n)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&nh->lock, flags);
+	ret = notifier_chain_register(&nh->head, n, true);
+	spin_unlock_irqrestore(&nh->lock, flags);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(atomic_notifier_chain_register_unique_prio);
+
 /**
  *	atomic_notifier_chain_unregister - Remove notifier from an atomic notifier chain
  *	@nh: Pointer to head of the atomic notifier chain
@@ -209,18 +235,9 @@ NOKPROBE_SYMBOL(atomic_notifier_call_chain);
  *	synchronized by an rwsem.
  */
 
-/**
- *	blocking_notifier_chain_register - Add notifier to a blocking notifier chain
- *	@nh: Pointer to head of the blocking notifier chain
- *	@n: New entry in notifier chain
- *
- *	Adds a notifier to a blocking notifier chain.
- *	Must be called in process context.
- *
- *	Returns 0 on success, %-EEXIST on error.
- */
-int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
-		struct notifier_block *n)
+static int __blocking_notifier_chain_register(struct blocking_notifier_head *nh,
+					      struct notifier_block *n,
+					      bool unique_priority)
 {
 	int ret;
 
@@ -230,15 +247,48 @@ int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
 	 * such times we must not call down_write().
 	 */
 	if (unlikely(system_state == SYSTEM_BOOTING))
-		return notifier_chain_register(&nh->head, n);
+		return notifier_chain_register(&nh->head, n, unique_priority);
 
 	down_write(&nh->rwsem);
-	ret = notifier_chain_register(&nh->head, n);
+	ret = notifier_chain_register(&nh->head, n, unique_priority);
 	up_write(&nh->rwsem);
 	return ret;
 }
+
+/**
+ *	blocking_notifier_chain_register - Add notifier to a blocking notifier chain
+ *	@nh: Pointer to head of the blocking notifier chain
+ *	@n: New entry in notifier chain
+ *
+ *	Adds a notifier to a blocking notifier chain.
+ *	Must be called in process context.
+ *
+ *	Returns 0 on success, %-EEXIST on error.
+ */
+int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
+		struct notifier_block *n)
+{
+	return __blocking_notifier_chain_register(nh, n, false);
+}
 EXPORT_SYMBOL_GPL(blocking_notifier_chain_register);
 
+/**
+ *	blocking_notifier_chain_register_unique_prio - Add notifier to a blocking notifier chain
+ *	@nh: Pointer to head of the blocking notifier chain
+ *	@n: New entry in notifier chain
+ *
+ *	Adds a notifier to an blocking notifier chain if there is no other
+ *	notifier registered using the same priority.
+ *
+ *	Returns 0 on success, %-EEXIST or %-EBUSY on error.
+ */
+int blocking_notifier_chain_register_unique_prio(struct blocking_notifier_head *nh,
+						 struct notifier_block *n)
+{
+	return __blocking_notifier_chain_register(nh, n, true);
+}
+EXPORT_SYMBOL_GPL(blocking_notifier_chain_register_unique_prio);
+
 /**
  *	blocking_notifier_chain_unregister - Remove notifier from a blocking notifier chain
  *	@nh: Pointer to head of the blocking notifier chain
@@ -354,7 +404,7 @@ bool blocking_notifier_call_chain_is_empty(struct blocking_notifier_head *nh)
 int raw_notifier_chain_register(struct raw_notifier_head *nh,
 		struct notifier_block *n)
 {
-	return notifier_chain_register(&nh->head, n);
+	return notifier_chain_register(&nh->head, n, false);
 }
 EXPORT_SYMBOL_GPL(raw_notifier_chain_register);
 
@@ -433,10 +483,10 @@ int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
 	 * such times we must not call mutex_lock().
 	 */
 	if (unlikely(system_state == SYSTEM_BOOTING))
-		return notifier_chain_register(&nh->head, n);
+		return notifier_chain_register(&nh->head, n, false);
 
 	mutex_lock(&nh->mutex);
-	ret = notifier_chain_register(&nh->head, n);
+	ret = notifier_chain_register(&nh->head, n, false);
 	mutex_unlock(&nh->mutex);
 	return ret;
 }
-- 
2.34.1


