Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC2C7F1243
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 12:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636648.992328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52d1-0000PF-Qs; Mon, 20 Nov 2023 11:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636648.992328; Mon, 20 Nov 2023 11:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52d1-0000La-Mp; Mon, 20 Nov 2023 11:39:47 +0000
Received: by outflank-mailman (input) for mailman id 636648;
 Mon, 20 Nov 2023 11:39:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WPLm=HB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r52cz-0004F8-KD
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 11:39:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80769206-8799-11ee-98df-6d05b1d4d9a1;
 Mon, 20 Nov 2023 12:39:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D120D21904;
 Mon, 20 Nov 2023 11:39:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7B54713499;
 Mon, 20 Nov 2023 11:39:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UCfJHIBFW2VGPgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Nov 2023 11:39:44 +0000
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
X-Inumbo-ID: 80769206-8799-11ee-98df-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700480384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+flDa3QzRsLPq+/48lq4lck4jmCIJAz+WNkz+xc0Qc=;
	b=eJkmQIWq9/8AJdat3kFBJcE73XFskS0n6ZIDobSaIunrzRjhNgdsjl+jbnjcEMyl8OqaF6
	en2oq8uNDA/5xn7qDhyTNgkNOcY0KAh/j1mDT8ExZKbHsD7xKLmpUqUqOr4YU2OPaBbsCa
	hCK0hIzIEgQNTeN96rKfQjqJafajUF0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com,
	Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 10/13] xen/spinlock: add missing rspin_is_locked() and rspin_barrier()
Date: Mon, 20 Nov 2023 12:38:39 +0100
Message-Id: <20231120113842.5897-11-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231120113842.5897-1-jgross@suse.com>
References: <20231120113842.5897-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[11];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Add rspin_is_locked() and rspin_barrier() in order to prepare differing
spinlock_t and rspinlock_t types.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- partially carved out from V1 patch, partially new
---
 xen/arch/x86/mm/p2m-pod.c     |  2 +-
 xen/common/domain.c           |  2 +-
 xen/common/page_alloc.c       |  2 +-
 xen/common/spinlock.c         | 17 +++++++++++++++++
 xen/drivers/char/console.c    |  4 ++--
 xen/drivers/passthrough/pci.c |  2 +-
 xen/include/xen/spinlock.h    |  2 ++
 7 files changed, 25 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 5361c2c5b1..ad49c64ead 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -385,7 +385,7 @@ int p2m_pod_empty_cache(struct domain *d)
 
     /* After this barrier no new PoD activities can happen. */
     BUG_ON(!d->is_dying);
-    spin_barrier(&p2m->pod.lock.lock);
+    rspin_barrier(&p2m->pod.lock.lock);
 
     lock_page_alloc(p2m);
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 604f70ff5a..17da8e0746 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -974,7 +974,7 @@ int domain_kill(struct domain *d)
     case DOMDYING_alive:
         domain_pause(d);
         d->is_dying = DOMDYING_dying;
-        spin_barrier(&d->domain_lock);
+        rspin_barrier(&d->domain_lock);
         argo_destroy(d);
         vnuma_destroy(d->vnuma);
         domain_set_outstanding_pages(d, 0);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index a25c00a7d4..14010b6fa5 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -476,7 +476,7 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
 {
     long dom_before, dom_after, dom_claimed, sys_before, sys_after;
 
-    ASSERT(spin_is_locked(&d->page_alloc_lock));
+    ASSERT(rspin_is_locked(&d->page_alloc_lock));
     d->tot_pages += pages;
 
     /*
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 8b991cf385..8bb6691b14 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -458,6 +458,23 @@ void _spin_barrier(spinlock_t *lock)
     spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
 }
 
+int rspin_is_locked(const rspinlock_t *lock)
+{
+    /*
+     * Recursive locks may be locked by another CPU, yet we return
+     * "false" here, making this function suitable only for use in
+     * ASSERT()s and alike.
+     */
+    return lock->recurse_cpu == SPINLOCK_NO_CPU
+           ? spin_is_locked_common(&lock->tickets)
+           : lock->recurse_cpu == smp_processor_id();
+}
+
+void rspin_barrier(rspinlock_t *lock)
+{
+    spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
+}
+
 int rspin_trylock(rspinlock_t *lock)
 {
     unsigned int cpu = smp_processor_id();
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index c5609f32b5..a1aca2b60b 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -328,7 +328,7 @@ static void cf_check do_dec_thresh(unsigned char key, struct cpu_user_regs *regs
 
 static void conring_puts(const char *str, size_t len)
 {
-    ASSERT(spin_is_locked(&console_lock));
+    ASSERT(rspin_is_locked(&console_lock));
 
     while ( len-- )
         conring[CONRING_IDX_MASK(conringp++)] = *str++;
@@ -766,7 +766,7 @@ static void __putstr(const char *str)
 {
     size_t len = strlen(str);
 
-    ASSERT(spin_is_locked(&console_lock));
+    ASSERT(rspin_is_locked(&console_lock));
 
     console_serial_puts(str, len);
     video_puts(str, len);
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 22342f07ac..f55c1a5cf4 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -64,7 +64,7 @@ void pcidevs_unlock(void)
 
 bool pcidevs_locked(void)
 {
-    return !!spin_is_locked(&_pcidevs_lock);
+    return rspin_is_locked(&_pcidevs_lock);
 }
 
 static struct radix_tree_root pci_segments;
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index ccb1cafa5f..fb6ca1949a 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -239,6 +239,8 @@ void rspin_lock(rspinlock_t *lock);
 unsigned long __rspin_lock_irqsave(rspinlock_t *lock);
 void rspin_unlock(rspinlock_t *lock);
 void rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
+int rspin_is_locked(const rspinlock_t *lock);
+void rspin_barrier(rspinlock_t *lock);
 
 #define spin_lock(l)                  _spin_lock(l)
 #define spin_lock_cb(l, c, d)         _spin_lock_cb(l, c, d)
-- 
2.35.3


