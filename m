Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 529BE87B877
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:21:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692906.1080602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOz-0000ZK-Il; Thu, 14 Mar 2024 07:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692906.1080602; Thu, 14 Mar 2024 07:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOz-0000WC-E8; Thu, 14 Mar 2024 07:21:21 +0000
Received: by outflank-mailman (input) for mailman id 692906;
 Thu, 14 Mar 2024 07:21:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CDQ4=KU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rkfOy-0005rB-8A
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:21:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 734e3892-e1d3-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 08:21:18 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2476C21CCF;
 Thu, 14 Mar 2024 07:21:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C8A2913977;
 Thu, 14 Mar 2024 07:21:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2JR4L22l8mVvDgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 14 Mar 2024 07:21:17 +0000
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
X-Inumbo-ID: 734e3892-e1d3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyZIS9vv4iGwmrp5sN5jilaqDKgUnxECEpqJeS43geA=;
	b=eFNSh6Vj+J1kybS3kei57Vr1fHut95++7ADIWA23bgHGVVPcmsc3eYzRgBgOWZwWiCUhSQ
	28fMMQh3jvUeQY/iUoS5SP5KvHaUfpE4wW1n7fYR/zlSBkfSGqjN66hY5/Q5tLB0SINp3A
	C9nV+ap17jwMvMWmZ6lEDuIrkZbBgMQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400878; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RyZIS9vv4iGwmrp5sN5jilaqDKgUnxECEpqJeS43geA=;
	b=eFNSh6Vj+J1kybS3kei57Vr1fHut95++7ADIWA23bgHGVVPcmsc3eYzRgBgOWZwWiCUhSQ
	28fMMQh3jvUeQY/iUoS5SP5KvHaUfpE4wW1n7fYR/zlSBkfSGqjN66hY5/Q5tLB0SINp3A
	C9nV+ap17jwMvMWmZ6lEDuIrkZbBgMQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v5 08/13] xen/spinlock: add missing rspin_is_locked() and rspin_barrier()
Date: Thu, 14 Mar 2024 08:20:24 +0100
Message-Id: <20240314072029.16937-9-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240314072029.16937-1-jgross@suse.com>
References: <20240314072029.16937-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=eFNSh6Vj
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:106:10:150:64:167:received];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 2476C21CCF
X-Spam-Flag: NO

Add rspin_is_locked() and rspin_barrier() in order to prepare differing
spinlock_t and rspinlock_t types.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- partially carved out from V1 patch, partially new
V5:
- let rspin_is_locked() return bool (Jan Beulich)
---
 xen/arch/x86/mm/p2m-pod.c     |  2 +-
 xen/common/domain.c           |  2 +-
 xen/common/page_alloc.c       |  2 +-
 xen/common/spinlock.c         | 26 ++++++++++++++++++--------
 xen/drivers/char/console.c    |  4 ++--
 xen/drivers/passthrough/pci.c |  2 +-
 xen/include/xen/spinlock.h    |  4 ++++
 7 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
index 515a8c98a5..ae5dcb1870 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -374,7 +374,7 @@ int p2m_pod_empty_cache(struct domain *d)
 
     /* After this barrier no new PoD activities can happen. */
     BUG_ON(!d->is_dying);
-    spin_barrier(&p2m->pod.lock.lock);
+    rspin_barrier(&p2m->pod.lock.lock);
 
     lock_page_alloc(p2m);
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8e0109c590..2d7c69e6d2 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -983,7 +983,7 @@ int domain_kill(struct domain *d)
     case DOMDYING_alive:
         domain_pause(d);
         d->is_dying = DOMDYING_dying;
-        spin_barrier(&d->domain_lock);
+        rspin_barrier(&d->domain_lock);
         argo_destroy(d);
         vnuma_destroy(d->vnuma);
         domain_set_outstanding_pages(d, 0);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 20238015ed..83d1715e25 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -475,7 +475,7 @@ unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
 {
     long dom_before, dom_after, dom_claimed, sys_before, sys_after;
 
-    ASSERT(spin_is_locked(&d->page_alloc_lock));
+    ASSERT(rspin_is_locked(&d->page_alloc_lock));
     d->tot_pages += pages;
 
     /*
diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 648393d95f..c3f2f9b209 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -395,14 +395,7 @@ static bool always_inline spin_is_locked_common(const spinlock_tickets_t *t)
 
 int _spin_is_locked(const spinlock_t *lock)
 {
-    /*
-     * Recursive locks may be locked by another CPU, yet we return
-     * "false" here, making this function suitable only for use in
-     * ASSERT()s and alike.
-     */
-    return lock->recurse_cpu == SPINLOCK_NO_CPU
-           ? spin_is_locked_common(&lock->tickets)
-           : lock->recurse_cpu == smp_processor_id();
+    return spin_is_locked_common(&lock->tickets);
 }
 
 static bool always_inline spin_trylock_common(spinlock_tickets_t *t,
@@ -465,6 +458,23 @@ void _spin_barrier(spinlock_t *lock)
     spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
 }
 
+bool _rspin_is_locked(const rspinlock_t *lock)
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
+void _rspin_barrier(rspinlock_t *lock)
+{
+    spin_barrier_common(&lock->tickets, &lock->debug, LOCK_PROFILE_PAR);
+}
+
 bool _rspin_trylock(rspinlock_t *lock)
 {
     unsigned int cpu = smp_processor_id();
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 22f50fc617..d5e6aacc27 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -327,7 +327,7 @@ static void cf_check do_dec_thresh(unsigned char key, bool unused)
 
 static void conring_puts(const char *str, size_t len)
 {
-    ASSERT(spin_is_locked(&console_lock));
+    ASSERT(rspin_is_locked(&console_lock));
 
     while ( len-- )
         conring[CONRING_IDX_MASK(conringp++)] = *str++;
@@ -765,7 +765,7 @@ static void __putstr(const char *str)
 {
     size_t len = strlen(str);
 
-    ASSERT(spin_is_locked(&console_lock));
+    ASSERT(rspin_is_locked(&console_lock));
 
     console_serial_puts(str, len);
     video_puts(str, len);
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 4fcc7e2cde..5a446d3dce 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -65,7 +65,7 @@ void pcidevs_unlock(void)
 
 bool pcidevs_locked(void)
 {
-    return !!spin_is_locked(&_pcidevs_lock);
+    return rspin_is_locked(&_pcidevs_lock);
 }
 
 static struct radix_tree_root pci_segments;
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 5b20b11db6..7dd11faab3 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -297,6 +297,8 @@ void _rspin_lock(rspinlock_t *lock);
 unsigned long _rspin_lock_irqsave(rspinlock_t *lock);
 void _rspin_unlock(rspinlock_t *lock);
 void _rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
+bool _rspin_is_locked(const rspinlock_t *lock);
+void _rspin_barrier(rspinlock_t *lock);
 
 static always_inline void rspin_lock(rspinlock_t *lock)
 {
@@ -307,6 +309,8 @@ static always_inline void rspin_lock(rspinlock_t *lock)
 #define rspin_trylock(l)              lock_evaluate_nospec(_rspin_trylock(l))
 #define rspin_unlock(l)               _rspin_unlock(l)
 #define rspin_unlock_irqrestore(l, f) _rspin_unlock_irqrestore(l, f)
+#define rspin_barrier(l)              _rspin_barrier(l)
+#define rspin_is_locked(l)            _rspin_is_locked(l)
 
 #define nrspin_trylock(l)    spin_trylock(l)
 #define nrspin_lock(l)       spin_lock(l)
-- 
2.35.3


