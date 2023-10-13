Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DB47C8261
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 11:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616352.958305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrEgu-0001Eb-O8; Fri, 13 Oct 2023 09:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616352.958305; Fri, 13 Oct 2023 09:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrEgu-0001BS-KW; Fri, 13 Oct 2023 09:42:44 +0000
Received: by outflank-mailman (input) for mailman id 616352;
 Fri, 13 Oct 2023 09:42:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U36v=F3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qrEgt-0000dZ-8d
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 09:42:43 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da52b1ae-69ac-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 11:42:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CE48B1F37E;
 Fri, 13 Oct 2023 09:42:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 62DFA1358F;
 Fri, 13 Oct 2023 09:42:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1I36FRARKWUdGwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 13 Oct 2023 09:42:40 +0000
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
X-Inumbo-ID: da52b1ae-69ac-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1697190160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MR7QmStWD8Elo6plqpOeW5HwQHeIeJeRpjezDM3S/I0=;
	b=JN4F3INRRukTHkmhALR7+LOwqirJcDKSwG9WHSgfNUxGkNGlZGBc7yKIfWZwo5SKvEl4Xz
	ghd9vPG6qFq1vrCRZAAOoyv3/mL9F/KWKW/SndF9mvdrZWL108QvncDkCg/MAuDx2lfN3i
	rYub1bMSY87ltXXrFd9QTZDeCYG2olY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: javi.merino@cloud.com,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 02/13] xen/spinlock: reduce lock profile ifdefs
Date: Fri, 13 Oct 2023 11:42:13 +0200
Message-Id: <20231013094224.7060-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231013094224.7060-1-jgross@suse.com>
References: <20231013094224.7060-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.34
X-Spamd-Result: default: False [-3.34 / 50.00];
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
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.24)[72.94%]
X-Spam-Flag: NO

With some small adjustments to the LOCK_PROFILE_* macros some #ifdefs
can be dropped from spinlock.c.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 xen/common/spinlock.c | 45 ++++++++++++++++++-------------------------
 1 file changed, 19 insertions(+), 26 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 202c707540..4878a01302 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -267,25 +267,28 @@ void spin_debug_disable(void)
         lock->profile->time_hold += NOW() - lock->profile->time_locked;      \
         lock->profile->lock_cnt++;                                           \
     }
-#define LOCK_PROFILE_VAR    s_time_t block = 0
-#define LOCK_PROFILE_BLOCK  block = block ? : NOW();
-#define LOCK_PROFILE_GOT                                                     \
+#define LOCK_PROFILE_VAR(val)    s_time_t block = (val)
+#define LOCK_PROFILE_BLOCK  block = block ? : NOW()
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
+#define LOCK_PROFILE_VAR(val)
 #define LOCK_PROFILE_BLOCK
-#define LOCK_PROFILE_GOT
+#define LOCK_PROFILE_BLKACC(tst, val)
+#define LOCK_PROFILE_GOT(val)
 
 #endif
 
@@ -308,7 +311,7 @@ static void always_inline spin_lock_common(spinlock_t *lock,
                                            void (*cb)(void *), void *data)
 {
     spinlock_tickets_t tickets = SPINLOCK_TICKET_INC;
-    LOCK_PROFILE_VAR;
+    LOCK_PROFILE_VAR(0);
 
     check_lock(&lock->debug, false);
     preempt_disable();
@@ -323,7 +326,7 @@ static void always_inline spin_lock_common(spinlock_t *lock,
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
+    LOCK_PROFILE_VAR(NOW());
 
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


