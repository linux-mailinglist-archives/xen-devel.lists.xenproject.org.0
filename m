Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A77AD447D6A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 11:13:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223175.385769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1ds-0001Fm-VG; Mon, 08 Nov 2021 10:12:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223175.385769; Mon, 08 Nov 2021 10:12:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1ds-0001Da-QK; Mon, 08 Nov 2021 10:12:44 +0000
Received: by outflank-mailman (input) for mailman id 223175;
 Mon, 08 Nov 2021 10:12:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uasK=P3=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1mk1dr-0000dK-0y
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 10:12:43 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68c7ac1a-407c-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 11:12:42 +0100 (CET)
Received: from zn.tnic (p200300ec2f33110088892b77bd117736.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:8889:2b77:bd11:7736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 97BC51EC0535;
 Mon,  8 Nov 2021 11:12:41 +0100 (CET)
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
X-Inumbo-ID: 68c7ac1a-407c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1636366361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSl40zXDlt+0/rSkoDA+/axSBICuEw4xrW9t+JeAzRg=;
	b=O9utTH7kzvF0ogbSAjrVux8Q2NyGvuXt2DXX+lXMfGwQDD5NsnAlA7vS1HO+tdNI+F2ntn
	CZwfQStJuxv3i5Q66Ie7iUHTOBEhoA6pq6felnVAUxHBDq6LlMPMTRyA2hQo7p+FfRiqlX
	omkNlvF2ej63UhZNrO1CmPB0HckLABU=
From: Borislav Petkov <bp@alien8.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Ayush Sawal <ayush.sawal@chelsio.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rohit Maheshwari <rohitm@chelsio.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
	alsa-devel@alsa-project.org,
	bcm-kernel-feedback-list@broadcom.com,
	intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-remoteproc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	netdev@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	rcu@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v0 42/42] notifier: Return an error when callback is already registered
Date: Mon,  8 Nov 2021 11:11:57 +0100
Message-Id: <20211108101157.15189-43-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Borislav Petkov <bp@suse.de>

The notifier registration routine doesn't return a proper error value
when a callback has already been registered, leading people to track
whether that registration has happened at the call site:

  https://lore.kernel.org/amd-gfx/20210512013058.6827-1-mukul.joshi@amd.com/

Which is unnecessary.

Return -EEXIST to signal that case so that callers can act accordingly.
Enforce callers to check the return value, leading to loud screaming
during build:

  arch/x86/kernel/cpu/mce/core.c: In function ‘mce_register_decode_chain’:
  arch/x86/kernel/cpu/mce/core.c:167:2: error: ignoring return value of \
   ‘blocking_notifier_chain_register’, declared with attribute warn_unused_result [-Werror=unused-result]
    blocking_notifier_chain_register(&x86_mce_decoder_chain, nb);
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Drop the WARN too, while at it.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Ayush Sawal <ayush.sawal@chelsio.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rohit Maheshwari <rohitm@chelsio.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Vinay Kumar Yadav <vinay.yadav@chelsio.com>
Cc: alsa-devel@alsa-project.org
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-edac@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-hyperv@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-leds@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-usb@vger.kernel.org
Cc: linux-xtensa@linux-xtensa.org
Cc: netdev@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net
Cc: rcu@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: x86@kernel.org
Cc: xen-devel@lists.xenproject.org
---
 include/linux/notifier.h |  8 ++++----
 kernel/notifier.c        | 36 +++++++++++++++++++-----------------
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 87069b8459af..45cc5a8d0fd8 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -141,13 +141,13 @@ extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
 
 #ifdef __KERNEL__
 
-extern int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
+extern int __must_check atomic_notifier_chain_register(struct atomic_notifier_head *nh,
 		struct notifier_block *nb);
-extern int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
+extern int __must_check blocking_notifier_chain_register(struct blocking_notifier_head *nh,
 		struct notifier_block *nb);
-extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
+extern int __must_check raw_notifier_chain_register(struct raw_notifier_head *nh,
 		struct notifier_block *nb);
-extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
+extern int __must_check srcu_notifier_chain_register(struct srcu_notifier_head *nh,
 		struct notifier_block *nb);
 
 extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
diff --git a/kernel/notifier.c b/kernel/notifier.c
index b8251dc0bc0f..451ef3f73ad2 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -20,13 +20,11 @@ BLOCKING_NOTIFIER_HEAD(reboot_notifier_list);
  */
 
 static int notifier_chain_register(struct notifier_block **nl,
-		struct notifier_block *n)
+				   struct notifier_block *n)
 {
 	while ((*nl) != NULL) {
-		if (unlikely((*nl) == n)) {
-			WARN(1, "double register detected");
-			return 0;
-		}
+		if (unlikely((*nl) == n))
+			return -EEXIST;
 		if (n->priority > (*nl)->priority)
 			break;
 		nl = &((*nl)->next);
@@ -134,10 +132,11 @@ static int notifier_call_chain_robust(struct notifier_block **nl,
  *
  *	Adds a notifier to an atomic notifier chain.
  *
- *	Currently always returns zero.
+ *	Returns 0 on success, %-EEXIST on error.
  */
-int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
-		struct notifier_block *n)
+int __must_check
+atomic_notifier_chain_register(struct atomic_notifier_head *nh,
+			       struct notifier_block *n)
 {
 	unsigned long flags;
 	int ret;
@@ -216,10 +215,11 @@ NOKPROBE_SYMBOL(atomic_notifier_call_chain);
  *	Adds a notifier to a blocking notifier chain.
  *	Must be called in process context.
  *
- *	Currently always returns zero.
+ *	Returns 0 on success, %-EEXIST on error.
  */
-int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
-		struct notifier_block *n)
+int __must_check
+blocking_notifier_chain_register(struct blocking_notifier_head *nh,
+				 struct notifier_block *n)
 {
 	int ret;
 
@@ -335,10 +335,11 @@ EXPORT_SYMBOL_GPL(blocking_notifier_call_chain);
  *	Adds a notifier to a raw notifier chain.
  *	All locking must be provided by the caller.
  *
- *	Currently always returns zero.
+ *	Returns 0 on success, %-EEXIST on error.
  */
-int raw_notifier_chain_register(struct raw_notifier_head *nh,
-		struct notifier_block *n)
+int __must_check
+raw_notifier_chain_register(struct raw_notifier_head *nh,
+			    struct notifier_block *n)
 {
 	return notifier_chain_register(&nh->head, n);
 }
@@ -406,10 +407,11 @@ EXPORT_SYMBOL_GPL(raw_notifier_call_chain);
  *	Adds a notifier to an SRCU notifier chain.
  *	Must be called in process context.
  *
- *	Currently always returns zero.
+ *	Returns 0 on success, %-EEXIST on error.
  */
-int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
-		struct notifier_block *n)
+int __must_check
+srcu_notifier_chain_register(struct srcu_notifier_head *nh,
+			     struct notifier_block *n)
 {
 	int ret;
 
-- 
2.29.2


