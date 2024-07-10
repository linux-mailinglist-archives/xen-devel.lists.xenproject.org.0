Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2539492D001
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 13:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756799.1165547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRV50-0004yC-1b; Wed, 10 Jul 2024 11:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756799.1165547; Wed, 10 Jul 2024 11:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRV4z-0004wC-UM; Wed, 10 Jul 2024 11:01:45 +0000
Received: by outflank-mailman (input) for mailman id 756799;
 Wed, 10 Jul 2024 11:01:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pAY=OK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sRV4y-0004w6-Hi
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 11:01:44 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cab62e07-3eab-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 13:01:43 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A953021BB7;
 Wed, 10 Jul 2024 11:01:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28E201369A;
 Wed, 10 Jul 2024 11:01:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5GKDCBZqjmYbdwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 10 Jul 2024 11:01:42 +0000
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
X-Inumbo-ID: cab62e07-3eab-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1720609302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ltOTFVyo5Uy/X1RTKFluQ2RUhWSohIyrX25ZCB/KpNE=;
	b=sdQ92WiqNXgpT5tzis+FpuQEk0LBdUw6aNmj4gQ10TlzwkR+qnyOjBEX/qlQOxDBb0iKr1
	vy9lHeVcK9GhczwP+i+OKlemk4D/11MwIJLAG0Gj8b1bXp+gfDKYvUWhZ3Nwcp8UN+RXtt
	ZJrnKD6uclL6CKlyFCscNkDJ3WfcfXo=
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=sdQ92Wiq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1720609302; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=ltOTFVyo5Uy/X1RTKFluQ2RUhWSohIyrX25ZCB/KpNE=;
	b=sdQ92WiqNXgpT5tzis+FpuQEk0LBdUw6aNmj4gQ10TlzwkR+qnyOjBEX/qlQOxDBb0iKr1
	vy9lHeVcK9GhczwP+i+OKlemk4D/11MwIJLAG0Gj8b1bXp+gfDKYvUWhZ3Nwcp8UN+RXtt
	ZJrnKD6uclL6CKlyFCscNkDJ3WfcfXo=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-doc@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] x86/xen: remove deprecated xen_nopvspin boot parameter
Date: Wed, 10 Jul 2024 13:01:39 +0200
Message-ID: <20240710110139.22300-1-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.com:+];
	FREEMAIL_CC(0.00)[suse.com,lwn.net,oracle.com,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,kernel.org,gmail.com,lists.xenproject.org];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A953021BB7
X-Spam-Flag: NO
X-Spam-Score: -1.51
X-Spam-Level: 

The xen_nopvspin boot parameter is deprecated since 2019. nopvspin
can be used instead.

Remove the xen_nopvspin boot parameter and replace the xen_pvspin
variable use cases with nopvspin.

This requires to move the nopvspin variable out of the .initdata
section, as it needs to be accessed for cpuhotplug, too.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .../admin-guide/kernel-parameters.txt         |  5 -----
 arch/x86/xen/spinlock.c                       | 20 +++++--------------
 kernel/locking/qspinlock.c                    |  2 +-
 3 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b33d048e01d8..2074ba03f2e3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7439,11 +7439,6 @@
 			access functions when running as Xen PV guest. The
 			default value is controlled by CONFIG_XEN_PV_MSR_SAFE.
 
-	xen_nopvspin	[X86,XEN,EARLY]
-			Disables the qspinlock slowpath using Xen PV optimizations.
-			This parameter is obsoleted by "nopvspin" parameter, which
-			has equivalent effect for XEN platform.
-
 	xen_nopv	[X86]
 			Disables the PV optimizations forcing the HVM guest to
 			run as generic HVM guest with no PV drivers.
diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
index 5c6fc16e4b92..8e4efe0fb6f9 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -18,7 +18,6 @@
 static DEFINE_PER_CPU(int, lock_kicker_irq) = -1;
 static DEFINE_PER_CPU(char *, irq_name);
 static DEFINE_PER_CPU(atomic_t, xen_qlock_wait_nest);
-static bool xen_pvspin = true;
 
 static void xen_qlock_kick(int cpu)
 {
@@ -68,7 +67,7 @@ void xen_init_lock_cpu(int cpu)
 	int irq;
 	char *name;
 
-	if (!xen_pvspin)
+	if (nopvspin)
 		return;
 
 	WARN(per_cpu(lock_kicker_irq, cpu) >= 0, "spinlock on CPU%d exists on IRQ%d!\n",
@@ -95,7 +94,7 @@ void xen_uninit_lock_cpu(int cpu)
 {
 	int irq;
 
-	if (!xen_pvspin)
+	if (nopvspin)
 		return;
 
 	kfree(per_cpu(irq_name, cpu));
@@ -125,10 +124,10 @@ PV_CALLEE_SAVE_REGS_THUNK(xen_vcpu_stolen);
 void __init xen_init_spinlocks(void)
 {
 	/*  Don't need to use pvqspinlock code if there is only 1 vCPU. */
-	if (num_possible_cpus() == 1 || nopvspin)
-		xen_pvspin = false;
+	if (num_possible_cpus() == 1)
+		nopvspin = true;
 
-	if (!xen_pvspin) {
+	if (nopvspin) {
 		printk(KERN_DEBUG "xen: PV spinlocks disabled\n");
 		static_branch_disable(&virt_spin_lock_key);
 		return;
@@ -143,12 +142,3 @@ void __init xen_init_spinlocks(void)
 	pv_ops.lock.kick = xen_qlock_kick;
 	pv_ops.lock.vcpu_is_preempted = PV_CALLEE_SAVE(xen_vcpu_stolen);
 }
-
-static __init int xen_parse_nopvspin(char *arg)
-{
-	pr_notice("\"xen_nopvspin\" is deprecated, please use \"nopvspin\" instead\n");
-	xen_pvspin = false;
-	return 0;
-}
-early_param("xen_nopvspin", xen_parse_nopvspin);
-
diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
index 1df5fef8a656..7d96bed718e4 100644
--- a/kernel/locking/qspinlock.c
+++ b/kernel/locking/qspinlock.c
@@ -583,7 +583,7 @@ EXPORT_SYMBOL(queued_spin_lock_slowpath);
 #include "qspinlock_paravirt.h"
 #include "qspinlock.c"
 
-bool nopvspin __initdata;
+bool nopvspin;
 static __init int parse_nopvspin(char *arg)
 {
 	nopvspin = true;
-- 
2.43.0


