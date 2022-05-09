Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7668D520882
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 01:33:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.324874.547178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noCsL-0007ym-Mt; Mon, 09 May 2022 23:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 324874.547178; Mon, 09 May 2022 23:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noCsL-0007wM-IJ; Mon, 09 May 2022 23:33:13 +0000
Received: by outflank-mailman (input) for mailman id 324874;
 Mon, 09 May 2022 23:33:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s4mp=VR=collabora.com=dmitry.osipenko@srs-se1.protection.inumbo.net>)
 id 1noCsK-0007Pf-7l
 for xen-devel@lists.xenproject.org; Mon, 09 May 2022 23:33:12 +0000
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63937d67-cff0-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 01:33:11 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id 3E0D01F41C11
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
X-Inumbo-ID: 63937d67-cff0-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1652139191;
	bh=lukCDvlh+VQrMdDntGqnw63sEvxpUquxvKx6zCB6dFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E6Htd2NUIVyNQjm3zjNspKkqxKR6i+iW9w4XOpsS37hUGOUw3VGPJrC2rx39+Tvjo
	 ocX71hfI+QjZ1lP5+X1LQsBmPL7dlCcXv+9SS+Q5TjrCltdIh3RX5eeIHiXvwmIHOF
	 Kulj0kJ1lapR0UDvwLlgi7z12iGZUG5kArtm4alE5b6tURKwWMHCIIuDOdtxMBBqfN
	 uPcI4HMaMJSb1mmQeveHzBRcA1W+g1oEcT8ghi9sEibaTcITp0l5yKtDFG6Z0k8iC2
	 z8WaqKpN987G8alEhWQWRlQTun+nTX2I87+5WJt9cIsDvplddvAA31I22KuGrIBoCV
	 U5x0xoyuIdD+g==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee.jones@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
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
Subject: [PATCH v8 02/27] notifier: Add blocking/atomic_notifier_chain_register_unique_prio()
Date: Tue, 10 May 2022 02:32:10 +0300
Message-Id: <20220509233235.995021-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
References: <20220509233235.995021-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add variant of blocking/atomic_notifier_chain_register() functions that
allow registration of a notifier only if it has unique priority, otherwise
-EBUSY error code is returned by the new functions.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 include/linux/notifier.h |  5 +++
 kernel/notifier.c        | 88 +++++++++++++++++++++++++++++++---------
 2 files changed, 74 insertions(+), 19 deletions(-)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 95e2440037de..aef88c2d1173 100644
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
index aaf5b56452a6..684fe04f5f70 100644
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
@@ -222,18 +248,9 @@ bool atomic_notifier_call_chain_is_empty(struct atomic_notifier_head *nh)
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
 
@@ -243,15 +260,48 @@ int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
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
@@ -354,7 +404,7 @@ EXPORT_SYMBOL_GPL(blocking_notifier_call_chain);
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
2.35.1


