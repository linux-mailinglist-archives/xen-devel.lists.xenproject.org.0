Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3580E816
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:47:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652844.1018899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzMX-00071q-Vl; Tue, 12 Dec 2023 09:47:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652844.1018899; Tue, 12 Dec 2023 09:47:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzMX-0006zC-Sl; Tue, 12 Dec 2023 09:47:37 +0000
Received: by outflank-mailman (input) for mailman id 652844;
 Tue, 12 Dec 2023 09:47:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCzMW-0006i7-2M
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:47:36 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79a74d82-98d3-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 10:47:34 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DA0CD224B1;
 Tue, 12 Dec 2023 09:47:33 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B9D7139E9;
 Tue, 12 Dec 2023 09:47:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id T+u/JDUseGWqfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 09:47:33 +0000
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
X-Inumbo-ID: 79a74d82-98d3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=05RrYMir4dujTWuikdK7at9dlF2CXR4dNylFaQEqncE=;
	b=Z/Oh8sjoUCM+8LRc8Dz3gUmr/TTBPaIRau3PfRqWgYATUg++NkN3Hhe9fo7EYWgnDpgCiZ
	3bdmEwcJDALmZGPLgk5OdZhwHfFm61MpBkwSE/j5C4skVytVKBNBbY0qVtWou4Hud8JBDS
	4rnbwgL+Kr+pJPA0xlR4NL9+DCscMDA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=05RrYMir4dujTWuikdK7at9dlF2CXR4dNylFaQEqncE=;
	b=Z5evBUhm1k8ym4FmZnajKtUQVssPQvL1NyssaSen+JthhgCQX4chO4KU+jZ2RsgZkvP4Qe
	t8p96/3q00v6+/12nkUgHZGNB6rEGQGkk5sETYrn8cCLyaEC4Pb7vhqpKvNkkaQb1oEOFB
	VI0JGhwLTMcYXtezGYrx53qKCIfUiCc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>
Subject: [PATCH v4 01/12] xen/spinlock: reduce lock profile ifdefs
Date: Tue, 12 Dec 2023 10:47:14 +0100
Message-Id: <20231212094725.22184-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231212094725.22184-1-jgross@suse.com>
References: <20231212094725.22184-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 3.70
X-Spam-Flag: NO
X-Spam-Level: ****
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.90 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 4.90

With some small adjustments to the LOCK_PROFILE_* macros some #ifdefs
can be dropped from spinlock.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
V2:
- new patch
V3:
- add variable name to macros parameter (Jan Beulich)
V4:
- fix coding style issue (Alejandro Vallejo)
---
 xen/common/spinlock.c | 49 +++++++++++++++++++------------------------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index d5fa400b78..09028af864 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -267,25 +267,28 @@ void spin_debug_disable(void)
         lock->profile->time_hold += NOW() - lock->profile->time_locked;      \
         lock->profile->lock_cnt++;                                           \
     }
-#define LOCK_PROFILE_VAR    s_time_t block = 0
-#define LOCK_PROFILE_BLOCK  block = block ? : NOW();
-#define LOCK_PROFILE_GOT                                                     \
+#define LOCK_PROFILE_VAR(var, val)    s_time_t var = (val)
+#define LOCK_PROFILE_BLOCK(var)       var = var ? : NOW()
+#define LOCK_PROFILE_BLKACC(tst, val)                                        \
+    if ( tst )                                                               \
+    {                                                                        \
+        lock->profile->time_block += lock->profile->time_locked - (val);     \
+        lock->profile->block_cnt++;                                          \
+    }
+#define LOCK_PROFILE_GOT(val)                                                \
     if ( lock->profile )                                                     \
     {                                                                        \
         lock->profile->time_locked = NOW();                                  \
-        if ( block )                                                         \
-        {                                                                    \
-            lock->profile->time_block += lock->profile->time_locked - block; \
-            lock->profile->block_cnt++;                                      \
-        }                                                                    \
+        LOCK_PROFILE_BLKACC(val, val);                                       \
     }
 
 #else
 
 #define LOCK_PROFILE_REL
-#define LOCK_PROFILE_VAR
-#define LOCK_PROFILE_BLOCK
-#define LOCK_PROFILE_GOT
+#define LOCK_PROFILE_VAR(var, val)
+#define LOCK_PROFILE_BLOCK(var)
+#define LOCK_PROFILE_BLKACC(tst, val)
+#define LOCK_PROFILE_GOT(val)
 
 #endif
 
@@ -308,7 +311,7 @@ static void always_inline spin_lock_common(spinlock_t *lock,
                                            void (*cb)(void *data), void *data)
 {
     spinlock_tickets_t tickets = SPINLOCK_TICKET_INC;
-    LOCK_PROFILE_VAR;
+    LOCK_PROFILE_VAR(block, 0);
 
     check_lock(&lock->debug, false);
     preempt_disable();
@@ -316,14 +319,14 @@ static void always_inline spin_lock_common(spinlock_t *lock,
                                            tickets.head_tail);
     while ( tickets.tail != observe_head(&lock->tickets) )
     {
-        LOCK_PROFILE_BLOCK;
+        LOCK_PROFILE_BLOCK(block);
         if ( cb )
             cb(data);
         arch_lock_relax();
     }
     arch_lock_acquire_barrier();
     got_lock(&lock->debug);
-    LOCK_PROFILE_GOT;
+    LOCK_PROFILE_GOT(block);
 }
 
 void _spin_lock(spinlock_t *lock)
@@ -411,19 +414,15 @@ int _spin_trylock(spinlock_t *lock)
      * arch_lock_acquire_barrier().
      */
     got_lock(&lock->debug);
-#ifdef CONFIG_DEBUG_LOCK_PROFILE
-    if ( lock->profile )
-        lock->profile->time_locked = NOW();
-#endif
+    LOCK_PROFILE_GOT(0);
+
     return 1;
 }
 
 void _spin_barrier(spinlock_t *lock)
 {
     spinlock_tickets_t sample;
-#ifdef CONFIG_DEBUG_LOCK_PROFILE
-    s_time_t block = NOW();
-#endif
+    LOCK_PROFILE_VAR(block, NOW());
 
     check_barrier(&lock->debug);
     smp_mb();
@@ -432,13 +431,7 @@ void _spin_barrier(spinlock_t *lock)
     {
         while ( observe_head(&lock->tickets) == sample.head )
             arch_lock_relax();
-#ifdef CONFIG_DEBUG_LOCK_PROFILE
-        if ( lock->profile )
-        {
-            lock->profile->time_block += NOW() - block;
-            lock->profile->block_cnt++;
-        }
-#endif
+        LOCK_PROFILE_BLKACC(lock->profile, block);
     }
     smp_mb();
 }
-- 
2.35.3


