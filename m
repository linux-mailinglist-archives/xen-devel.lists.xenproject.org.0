Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA95C5126D3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 01:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315616.534476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqgz-0000Xm-O2; Wed, 27 Apr 2022 23:03:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315616.534476; Wed, 27 Apr 2022 23:03:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqgy-0008Oq-5q; Wed, 27 Apr 2022 23:03:28 +0000
Received: by outflank-mailman (input) for mailman id 315616;
 Wed, 27 Apr 2022 22:58:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIOA=VF=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1njqcQ-00048k-TI
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 22:58:46 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9737c674-c67d-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 00:58:45 +0200 (CEST)
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqcA-0002Wy-Ov; Thu, 28 Apr 2022 00:58:31 +0200
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
X-Inumbo-ID: 9737c674-c67d-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1b6nDa/yJFcG5pUH/mG+iUzFXWwemhBkCT22/YaOiO0=; b=IjS2asgso9SNyNWZZrj9YMv/6F
	3eZOrVvzgLxKKIoWELAWIZ9Y/f7MmYlHtb0XsZyDOudfDUF9WfHu+qH6xY14Mwj7EyQY5AwmQNe6v
	QY9uiwZxhZ2WIvN3bSO5hXV0+d77+K43N8ixpf942Orfv5mroywKkDY+GQFZJrgwqxcot4GD1q5St
	xIFh8Z0iJkBMhioashEH7Fwugdlgq5hENhZTnH6U/1cjnuHRdJ6m3FerTWr+GWqdP086mvnqcs/YS
	tVMBMJxDz0U3rAU8T7vP+Z25rbMa7jiyVQO7/s07AaONn+Kin25YyTFL/3tub+/wmWut7UZN8xzJW
	BauGVfjA==;
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
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paul Mackerras <paulus@samba.org>
Subject: [PATCH 29/30] powerpc: ps3, pseries: Avoid duplicate call to kmsg_dump() on panic
Date: Wed, 27 Apr 2022 19:49:23 -0300
Message-Id: <20220427224924.592546-30-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently both pseries and ps3 are platforms that define special
panic notifiers that run as callbacks inside powerpc generic panic
notifier. In both cases kmsg_dump() is called, and the reason seems
to be that both of these callbacks aims to effectively stop the
machine, so nothing would execute after that - hence, both force
a series of console flushing related operations, after calling
the kmsg dumpers.

Happens that recently the panic path was refactored, and now
kmsg_dump() is *certainly* called before the pre_reboot panic
notifiers, category in which both pseries/ps3 callbacks belong.
In other words: kmsg_dump() will execute twice in both platforms,
on panic path.

This patch prevents that by disabling the kmsg_dump() for both
platform's notifiers. But worth to notice that PowerNV still
has a legit use for executing kmsg_dump() in its unrecoverable
error path, so we rely in parameter passing to differentiate
both cases. Also, since the pre_reboot notifiers still run
earlier than console flushing routines, we kept that for
both pseries and ps3 platforms, only skipping kmsg_dump().

Fixes: 35adacd6fc48 ("powerpc/pseries, ps3: panic flush kernel messages before halting system")
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---

We'd like to thanks specially the MiniCloud infrastructure [0] maintainers,
that allow us to test PowerPC code in a very complete, functional and FREE
environment.

[0] https://openpower.ic.unicamp.br/minicloud

 arch/powerpc/include/asm/bug.h         | 2 +-
 arch/powerpc/kernel/traps.c            | 6 ++++--
 arch/powerpc/platforms/powernv/opal.c  | 2 +-
 arch/powerpc/platforms/ps3/setup.c     | 2 +-
 arch/powerpc/platforms/pseries/setup.c | 2 +-
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index ecbae1832de3..49e5f6f86869 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -166,7 +166,7 @@ extern void die(const char *, struct pt_regs *, long);
 void die_mce(const char *str, struct pt_regs *regs, long err);
 extern bool die_will_crash(void);
 extern void panic_flush_kmsg_start(void);
-extern void panic_flush_kmsg_end(void);
+extern void panic_flush_kmsg_end(bool dump);
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index a08bb7cefdc5..837a5ed98d62 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -169,9 +169,11 @@ extern void panic_flush_kmsg_start(void)
 	bust_spinlocks(1);
 }
 
-extern void panic_flush_kmsg_end(void)
+extern void panic_flush_kmsg_end(bool dump)
 {
-	kmsg_dump(KMSG_DUMP_PANIC);
+	if (dump)
+		kmsg_dump(KMSG_DUMP_PANIC);
+
 	bust_spinlocks(0);
 	debug_locks_off();
 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 55a8fbfdb5b2..d172ceedece2 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -641,7 +641,7 @@ void __noreturn pnv_platform_error_reboot(struct pt_regs *regs, const char *msg)
 		show_regs(regs);
 	smp_send_stop();
 
-	panic_flush_kmsg_end();
+	panic_flush_kmsg_end(true);
 
 	/*
 	 * Don't bother to shut things down because this will
diff --git a/arch/powerpc/platforms/ps3/setup.c b/arch/powerpc/platforms/ps3/setup.c
index 3de9145c20bc..7cb78e508fb3 100644
--- a/arch/powerpc/platforms/ps3/setup.c
+++ b/arch/powerpc/platforms/ps3/setup.c
@@ -102,7 +102,7 @@ static void ps3_panic(char *str)
 	printk("   System does not reboot automatically.\n");
 	printk("   Please press POWER button.\n");
 	printk("\n");
-	panic_flush_kmsg_end();
+	panic_flush_kmsg_end(false);
 
 	while(1)
 		lv1_pause(1);
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 955ff8aa1644..d6eea473eafd 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -856,7 +856,7 @@ static void __init pSeries_setup_arch(void)
 
 static void pseries_panic(char *str)
 {
-	panic_flush_kmsg_end();
+	panic_flush_kmsg_end(false);
 	rtas_os_term(str);
 }
 
-- 
2.36.0


