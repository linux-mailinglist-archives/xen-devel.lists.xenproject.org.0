Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B415126B5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 01:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315580.534285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqgM-00088C-P1; Wed, 27 Apr 2022 23:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315580.534285; Wed, 27 Apr 2022 23:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqgL-0007il-PH; Wed, 27 Apr 2022 23:02:49 +0000
Received: by outflank-mailman (input) for mailman id 315580;
 Wed, 27 Apr 2022 22:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIOA=VF=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1njqWj-0003q5-IE
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 22:52:53 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4d6ec14-c67c-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 00:52:52 +0200 (CEST)
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqWU-0002B5-Ub; Thu, 28 Apr 2022 00:52:40 +0200
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
X-Inumbo-ID: c4d6ec14-c67c-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bCeC+folLkdyk3b6apumHxcRwMBwOys8pMRPpqSclew=; b=TqPRVvgSfmMVR610uLcwg2vC34
	pLIumny6UC9NAVKrJeC8kjbMxl/tivBCI9wjj++xXokR3qbvfCHXTOfrOaZezN2wYfsTeWwS7JgiC
	ST58COWgOj0NVLj/RM40gpf1tYeZ+3Akn0o3OOB9wnVZqXRK498bYXNcV51purgIjJ73eodK18ucj
	+Iyv87VDCsJruNsaOWJAaGmlYU1Av1XSojv9QPvuFZsys/hw7VJ6aN2N3d0SlURJabJe1PgCqptXF
	Xo2aIypAELGn+aiNCAnoOIj6PgcxN1C5aslHAtr3OG/wMakbb0/ORKtlMkkFaGzr7X86jahmQbl4p
	VjCzjD3g==;
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: akpm@linux-foundation.org,
	bhe@redhat.com,
	pmladek@suse.com,
	kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	coresight@lists.linaro.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-xtensa@linux-xtensa.org,
	netdev@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	rcu@vger.kernel.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org,
	kernel-dev@igalia.com,
	gpiccoli@igalia.com,
	kernel@gpiccoli.net,
	halves@canonical.com,
	fabiomirmar@gmail.com,
	alejandro.j.jimenez@oracle.com,
	andriy.shevchenko@linux.intel.com,
	arnd@arndb.de,
	bp@alien8.de,
	corbet@lwn.net,
	d.hatayama@jp.fujitsu.com,
	dave.hansen@linux.intel.com,
	dyoung@redhat.com,
	feng.tang@intel.com,
	gregkh@linuxfoundation.org,
	mikelley@microsoft.com,
	hidehiro.kawai.ez@hitachi.com,
	jgross@suse.com,
	john.ogness@linutronix.de,
	keescook@chromium.org,
	luto@kernel.org,
	mhiramat@kernel.org,
	mingo@redhat.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	stern@rowland.harvard.edu,
	tglx@linutronix.de,
	vgoyal@redhat.com,
	vkuznets@redhat.com,
	will@kernel.org,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 11/30] um: Improve panic notifiers consistency and ordering
Date: Wed, 27 Apr 2022 19:49:05 -0300
Message-Id: <20220427224924.592546-12-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the panic notifiers from user mode linux don't follow
the convention for most of the other notifiers present in the
kernel (indentation, priority setting, numeric return).
More important, the priorities could be improved, since it's a
special case (userspace), hence we could run the notifiers earlier;
user mode linux shouldn't care much with other panic notifiers but
the ordering among the mconsole and arch notifier is important,
given that the arch one effectively triggers a core dump.

This patch fixes that by running the mconsole notifier as the first
panic notifier, followed by the architecture one (that coredumps).
Also, we remove a useless header inclusion.

Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Richard Weinberger <richard@nod.at>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 arch/um/drivers/mconsole_kern.c | 8 +++-----
 arch/um/kernel/um_arch.c        | 8 ++++----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/um/drivers/mconsole_kern.c b/arch/um/drivers/mconsole_kern.c
index 8ca67a692683..2ea0421bcc3f 100644
--- a/arch/um/drivers/mconsole_kern.c
+++ b/arch/um/drivers/mconsole_kern.c
@@ -11,7 +11,6 @@
 #include <linux/list.h>
 #include <linux/mm.h>
 #include <linux/module.h>
-#include <linux/notifier.h>
 #include <linux/panic_notifier.h>
 #include <linux/reboot.h>
 #include <linux/sched/debug.h>
@@ -846,13 +845,12 @@ static int notify_panic(struct notifier_block *self, unsigned long unused1,
 
 	mconsole_notify(notify_socket, MCONSOLE_PANIC, message,
 			strlen(message) + 1);
-	return 0;
+	return NOTIFY_DONE;
 }
 
 static struct notifier_block panic_exit_notifier = {
-	.notifier_call 		= notify_panic,
-	.next 			= NULL,
-	.priority 		= 1
+	.notifier_call	= notify_panic,
+	.priority	= INT_MAX, /* run as soon as possible */
 };
 
 static int add_notifier(void)
diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index 0760e24f2eba..4485b1a7c8e4 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -246,13 +246,13 @@ static int panic_exit(struct notifier_block *self, unsigned long unused1,
 	bust_spinlocks(0);
 	uml_exitcode = 1;
 	os_dump_core();
-	return 0;
+
+	return NOTIFY_DONE;
 }
 
 static struct notifier_block panic_exit_notifier = {
-	.notifier_call 		= panic_exit,
-	.next 			= NULL,
-	.priority 		= 0
+	.notifier_call	= panic_exit,
+	.priority	= INT_MAX - 1, /* run as 2nd notifier, won't return */
 };
 
 void uml_finishsetup(void)
-- 
2.36.0


