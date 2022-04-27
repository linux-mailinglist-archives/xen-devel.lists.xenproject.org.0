Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA715126D4
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 01:03:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315618.534490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqh2-0001F1-PK; Wed, 27 Apr 2022 23:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315618.534490; Wed, 27 Apr 2022 23:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqh0-0000X1-Lw; Wed, 27 Apr 2022 23:03:30 +0000
Received: by outflank-mailman (input) for mailman id 315618;
 Wed, 27 Apr 2022 22:58:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIOA=VF=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1njqcc-00048k-L0
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 22:58:58 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e790fe4-c67d-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 00:58:58 +0200 (CEST)
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqcO-0002Xa-TN; Thu, 28 Apr 2022 00:58:45 +0200
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
X-Inumbo-ID: 9e790fe4-c67d-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hhYlsUbOeU+dOwRnxPZPUYbOytvtm3s9TOl//oHNJDA=; b=d0jf6vbMLbNOzh0eGG9B6/Px+6
	qkEUtrYepm4ucy/4pLos0iQRqgjXbtzxxFn26kSmjojOKmseLi3xGvVq3y13qqT30NTY0kTvl6DKc
	b6KKl04amU0+oieZ13497T1EMR69awT+qjyjGwR4D5aTKq4vZpRUj+GzWZO2UZDfeYATrEMziknBs
	TEMzSmzx206U+K28hnKwrx3+IjpI8ZztfEqS39tmb441zpVb+KuDwyZTgdwShziC74jYqn49bnQHG
	y/bSqJ0agKp8q0sRXPRW98dnPCHObluazUbKWH8Sqc1S7wQ8dewAG//hvPY5MrIv8zVHDor3/GUxI
	SaUMFP1g==;
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
Subject: [PATCH 30/30] um: Avoid duplicate call to kmsg_dump()
Date: Wed, 27 Apr 2022 19:49:24 -0300
Message-Id: <20220427224924.592546-31-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the panic notifier panic_exit() calls kmsg_dump() and
some console flushing routines - this makes sense since such
panic notifier exits UserMode Linux and never returns.

Happens that after a panic refactor, kmsg_dump() is now always
called *before* the pre_reboot list of panic notifiers, in which
panic_exit() belongs, leading to a double call situation.

This patch changes that by removing such call from the panic
notifier, but leaving the console flushing calls since the
pre_reboot list still runs before console flushing on panic().

Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Richard Weinberger <richard@nod.at>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 arch/um/kernel/um_arch.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index fc6e443299da..651310e3e86f 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -241,7 +241,6 @@ static void __init uml_postsetup(void)
 static int panic_exit(struct notifier_block *self, unsigned long unused1,
 		      void *unused2)
 {
-	kmsg_dump(KMSG_DUMP_PANIC);
 	bust_spinlocks(1);
 	bust_spinlocks(0);
 	uml_exitcode = 1;
-- 
2.36.0


