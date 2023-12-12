Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB17A80E81F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652860.1018980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzNH-0002TN-OG; Tue, 12 Dec 2023 09:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652860.1018980; Tue, 12 Dec 2023 09:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzNH-0002Qs-KD; Tue, 12 Dec 2023 09:48:23 +0000
Received: by outflank-mailman (input) for mailman id 652860;
 Tue, 12 Dec 2023 09:48:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCzNF-0006i7-DE
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:48:21 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 948b53c6-98d3-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 10:48:19 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 06E76224B1;
 Tue, 12 Dec 2023 09:48:19 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B6EEE139E9;
 Tue, 12 Dec 2023 09:48:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 4pZtK2IseGXqfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 09:48:18 +0000
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
X-Inumbo-ID: 948b53c6-98d3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GeHSgUQmT5Ki5ph3MFsQ59wc1zBmxDp8n3ZyP6ZPgHs=;
	b=Cmfoz7I/V4oW5S7TltXIHoolTK9kmfZrWSj1gNeUqmiJhRSeYYD4q9XbZ8mn4MGXwSaR75
	5hOTo8mahHvw7kcZO+SNWB7LdjR2W7lYbEJpMH0YtxQ9Y3gv6X8vMJD0Jwzoqwcc+gj/u5
	ExsNZ9HYTM8mKNGN2aIvxV1Ia1VHv1Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GeHSgUQmT5Ki5ph3MFsQ59wc1zBmxDp8n3ZyP6ZPgHs=;
	b=Cmfoz7I/V4oW5S7TltXIHoolTK9kmfZrWSj1gNeUqmiJhRSeYYD4q9XbZ8mn4MGXwSaR75
	5hOTo8mahHvw7kcZO+SNWB7LdjR2W7lYbEJpMH0YtxQ9Y3gv6X8vMJD0Jwzoqwcc+gj/u5
	ExsNZ9HYTM8mKNGN2aIvxV1Ia1VHv1Q=
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
Subject: [PATCH v4 09/12] xen/spinlock: add missing rspin_is_locked() and rspin_barrier()
Date: Tue, 12 Dec 2023 10:47:22 +0100
Message-Id: <20231212094725.22184-10-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231212094725.22184-1-jgross@suse.com>
References: <20231212094725.22184-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 18.90
X-Spam-Flag: YES
X-Spam-Level: ******
X-Spamd-Bar: ++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="Cmfoz7I/";
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [6.09 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 6.09
X-Rspamd-Queue-Id: 06E76224B1
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
index 61a91f5a94..40d3b25d25 100644
--- a/xen/arch/x86/mm/p2m-pod.c
+++ b/xen/arch/x86/mm/p2m-pod.c
@@ -385,7 +385,7 @@ int p2m_pod_empty_cache(struct domain *d)
 
     /* After this barrier no new PoD activities can happen. */
     BUG_ON(!d->is_dying);
-    spin_barrier(&p2m->pod.lock.lock);
+    rspin_barrier(&p2m->pod.lock.lock);
 
     lock_page_alloc(p2m);
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index dc97755391..198cb36878 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -982,7 +982,7 @@ int domain_kill(struct domain *d)
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
index 31d12b1006..91e325f3fe 100644
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
index 8d05c57f69..e6502641eb 100644
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
index 41444f8e2e..94f52b7acc 100644
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
index d6f4b66613..e63db4eb4c 100644
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


