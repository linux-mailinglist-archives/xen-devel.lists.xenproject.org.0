Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165707C8334
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 12:36:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616412.958403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFWd-00030s-5p; Fri, 13 Oct 2023 10:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616412.958403; Fri, 13 Oct 2023 10:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrFWd-0002tN-1x; Fri, 13 Oct 2023 10:36:11 +0000
Received: by outflank-mailman (input) for mailman id 616412;
 Fri, 13 Oct 2023 10:36:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U36v=F3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qrFWc-0002pr-4j
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 10:36:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51c8b73c-69b4-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 12:36:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1396F219DC;
 Fri, 13 Oct 2023 10:36:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BDBDE138EF;
 Fri, 13 Oct 2023 10:36:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BTUYLZcdKWUdNgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Oct 2023 10:36:07 +0000
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
X-Inumbo-ID: 51c8b73c-69b4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697193368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FH84hSjIS+ofUGFtDCVLLQDs+m1Iz62wX5oKrJ5EKyc=;
	b=U+Dpm1Dlslsrqrt5EefX3q0KZ9i3CLHjJcz/u07kTRC3jbU/O+mwr8M81yZBsiXFbwff01
	NGMkr2ZBS6BFKm1hweZ2zg0CAG+qwJFgGanE2QoHBcejiOu5TEmMhjiV87C5LGrQ6V22kb
	vNUUdpOXAmp4SRqBEVUf7wOfpJFqrvU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 06/13] xen/spinlock: add rspin_[un]lock_irq[save|restore]()
Date: Fri, 13 Oct 2023 11:42:17 +0200
Message-Id: <20231013094224.7060-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231013094224.7060-1-jgross@suse.com>
References: <20231013094224.7060-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.10
X-Spamd-Result: default: False [-6.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Instead of special casing rspin_lock_irqsave() and
rspin_unlock_irqrestore() for the console lock, add those functions
to spinlock handling and use them where needed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/arch/x86/traps.c       | 14 ++++++++------
 xen/common/spinlock.c      | 16 ++++++++++++++++
 xen/drivers/char/console.c | 18 +-----------------
 xen/include/xen/console.h  |  5 +++--
 xen/include/xen/spinlock.h |  7 +++++++
 5 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index e1356f696a..f72769e79b 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -647,13 +647,15 @@ void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs)
 void show_execution_state(const struct cpu_user_regs *regs)
 {
     /* Prevent interleaving of output. */
-    unsigned long flags = console_lock_recursive_irqsave();
+    unsigned long flags;
+
+    rspin_lock_irqsave(&console_lock, flags);
 
     show_registers(regs);
     show_code(regs);
     show_stack(regs);
 
-    console_unlock_recursive_irqrestore(flags);
+    rspin_unlock_irqrestore(&console_lock, flags);
 }
 
 void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs)
@@ -663,7 +665,7 @@ void cf_check show_execution_state_nonconst(struct cpu_user_regs *regs)
 
 void vcpu_show_execution_state(struct vcpu *v)
 {
-    unsigned long flags = 0;
+    unsigned long flags;
 
     if ( test_bit(_VPF_down, &v->pause_flags) )
     {
@@ -698,7 +700,7 @@ void vcpu_show_execution_state(struct vcpu *v)
 #endif
 
     /* Prevent interleaving of output. */
-    flags = console_lock_recursive_irqsave();
+    rspin_lock_irqsave(&console_lock, flags);
 
     vcpu_show_registers(v);
 
@@ -708,7 +710,7 @@ void vcpu_show_execution_state(struct vcpu *v)
          * Stop interleaving prevention: The necessary P2M lookups involve
          * locking, which has to occur with IRQs enabled.
          */
-        console_unlock_recursive_irqrestore(flags);
+        rspin_unlock_irqrestore(&console_lock, flags);
 
         show_hvm_stack(v, &v->arch.user_regs);
     }
@@ -717,7 +719,7 @@ void vcpu_show_execution_state(struct vcpu *v)
         if ( guest_kernel_mode(v, &v->arch.user_regs) )
             show_guest_stack(v, &v->arch.user_regs);
 
-        console_unlock_recursive_irqrestore(flags);
+        rspin_unlock_irqrestore(&console_lock, flags);
     }
 
 #ifdef CONFIG_HVM
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 58d19ea12c..3b1d1fd8d5 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -475,6 +475,16 @@ void rspin_lock(rspinlock_t *lock)
     lock->recurse_cnt++;
 }
 
+unsigned long __rspin_lock_irqsave(rspinlock_t *lock)
+{
+    unsigned long flags;
+
+    local_irq_save(flags);
+    rspin_lock(lock);
+
+    return flags;
+}
+
 void rspin_unlock(rspinlock_t *lock)
 {
     if ( likely(--lock->recurse_cnt == 0) )
@@ -484,6 +494,12 @@ void rspin_unlock(rspinlock_t *lock)
     }
 }
 
+void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags)
+{
+    rspin_unlock(lock);
+    local_irq_restore(flags);
+}
+
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
 
 struct lock_profile_anc {
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 394c01d097..360c2afbf3 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -120,7 +120,7 @@ static int __read_mostly sercon_handle = -1;
 int8_t __read_mostly opt_console_xen; /* console=xen */
 #endif
 
-static DEFINE_RSPINLOCK(console_lock);
+DEFINE_RSPINLOCK(console_lock);
 
 /*
  * To control the amount of printing, thresholds are added.
@@ -1149,22 +1149,6 @@ void console_end_log_everything(void)
     atomic_dec(&print_everything);
 }
 
-unsigned long console_lock_recursive_irqsave(void)
-{
-    unsigned long flags;
-
-    local_irq_save(flags);
-    rspin_lock(&console_lock);
-
-    return flags;
-}
-
-void console_unlock_recursive_irqrestore(unsigned long flags)
-{
-    rspin_unlock(&console_lock);
-    local_irq_restore(flags);
-}
-
 void console_force_unlock(void)
 {
     watchdog_disable();
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index ab5c30c0da..dff0096b27 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -8,8 +8,11 @@
 #define __CONSOLE_H__
 
 #include <xen/inttypes.h>
+#include <xen/spinlock.h>
 #include <public/xen.h>
 
+extern rspinlock_t console_lock;
+
 struct xen_sysctl_readconsole;
 long read_console_ring(struct xen_sysctl_readconsole *op);
 
@@ -20,8 +23,6 @@ void console_init_postirq(void);
 void console_endboot(void);
 int console_has(const char *device);
 
-unsigned long console_lock_recursive_irqsave(void);
-void console_unlock_recursive_irqrestore(unsigned long flags);
 void console_force_unlock(void);
 
 void console_start_sync(void);
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index c99ee52458..53f0f72ac4 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -218,7 +218,14 @@ void _spin_barrier(spinlock_t *lock);
  */
 int rspin_trylock(rspinlock_t *lock);
 void rspin_lock(rspinlock_t *lock);
+#define rspin_lock_irqsave(l, f)                                \
+    ({                                                          \
+        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
+        ((f) = __rspin_lock_irqsave(l));                        \
+    })
+unsigned long __rspin_lock_irqsave(rspinlock_t *lock);
 void rspin_unlock(rspinlock_t *lock);
+void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
 
 #define spin_lock(l)                  _spin_lock(l)
 #define spin_lock_cb(l, c, d)         _spin_lock_cb(l, c, d)
-- 
2.35.3


