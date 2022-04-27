Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C015126C5
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 01:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315586.534318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqgU-000169-TY; Wed, 27 Apr 2022 23:02:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315586.534318; Wed, 27 Apr 2022 23:02:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqgS-0000Yc-TI; Wed, 27 Apr 2022 23:02:56 +0000
Received: by outflank-mailman (input) for mailman id 315586;
 Wed, 27 Apr 2022 22:53:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIOA=VF=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1njqXS-0003q5-2S
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 22:53:38 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df5f574c-c67c-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 00:53:37 +0200 (CEST)
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqXD-0002EK-E5; Thu, 28 Apr 2022 00:53:24 +0200
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
X-Inumbo-ID: df5f574c-c67c-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mOzFWStqo1l1SFAwioSEW9cov+DtDc5WSMbZaYL5OFk=; b=jORyziNh7Mp7CJnb2ldBvIVUYT
	miqK/KwxTCDE0PrnGOVoO5V4xtjW+TEXZOKHxzyxZAzEuCslLE//gxMpeQbei+ydr8zg3pnWZUWxE
	L40pn68w+NUbAHLuqvLt2UI0hgcbpQZODu83KlzMI8qRKWoyX30oYob/b9pQLrf+6HFREi99ePbwb
	zW4TblodvYrIgJCYkkWUlwk3Cl/V3uSBOUWLD/GIZmkaB62kyu6wuslAaH0LxO2Qqyrw8rvwJQSXp
	vohmbyikfHUVSRBgOx4Bv9HUeJbAvmB/X4rw1kDURxjWp8eCgUztnLBZm1GN+7lilt+TPvGD7Gymp
	FQwd7uqA==;
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
	will@kernel.org
Subject: [PATCH 14/30] panic: Properly identify the panic event to the notifiers' callbacks
Date: Wed, 27 Apr 2022 19:49:08 -0300
Message-Id: <20220427224924.592546-15-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The notifiers infrastructure provides a way to pass an "id" to the
callbacks to determine what kind of event happened, i.e., what is
the reason behind they getting called.

The panic notifier currently pass 0, but this is soon to be
used in a multi-targeted notifier, so let's pass a meaningful
"id" over there.

Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 include/linux/panic_notifier.h | 5 +++++
 kernel/panic.c                 | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
index 41e32483d7a7..07dced83a783 100644
--- a/include/linux/panic_notifier.h
+++ b/include/linux/panic_notifier.h
@@ -9,4 +9,9 @@ extern struct atomic_notifier_head panic_notifier_list;
 
 extern bool crash_kexec_post_notifiers;
 
+enum panic_notifier_val {
+	PANIC_UNUSED,
+	PANIC_NOTIFIER = 0xDEAD,
+};
+
 #endif	/* _LINUX_PANIC_NOTIFIERS_H */
diff --git a/kernel/panic.c b/kernel/panic.c
index eb4dfb932c85..523bc9ccd0e9 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -287,7 +287,7 @@ void panic(const char *fmt, ...)
 	 * Run any panic handlers, including those that might need to
 	 * add information to the kmsg dump output.
 	 */
-	atomic_notifier_call_chain(&panic_notifier_list, 0, buf);
+	atomic_notifier_call_chain(&panic_notifier_list, PANIC_NOTIFIER, buf);
 
 	panic_print_sys_info(false);
 
-- 
2.36.0


