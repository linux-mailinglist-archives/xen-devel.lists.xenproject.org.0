Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2953988E8A4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 16:23:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698613.1090551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV7R-0001pe-F2; Wed, 27 Mar 2024 15:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698613.1090551; Wed, 27 Mar 2024 15:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV7R-0001ng-B9; Wed, 27 Mar 2024 15:23:13 +0000
Received: by outflank-mailman (input) for mailman id 698613;
 Wed, 27 Mar 2024 15:23:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rpV7Q-0007Qx-PB
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 15:23:12 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec779207-ec4d-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 16:23:12 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A84AC38B63;
 Wed, 27 Mar 2024 15:23:11 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6FBC813215;
 Wed, 27 Mar 2024 15:23:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id +KvmGd85BGaWfgAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 27 Mar 2024 15:23:11 +0000
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
X-Inumbo-ID: ec779207-ec4d-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oXjtiiPFLzYFznlWn/C8ZCBcRUde7S7BFmz8pb92S3c=;
	b=YFINieC/XziGqNKvYCJxQsWesX9OVovupGp2FPfPA9gmhSpr5N84y4kzTsF4iZbAptFuUZ
	xtciKUEtp8KiqhKSYoUn+5m9GIXPXHJHy5ymQYP7rr5g4qPH1mOjC2UQu4MCS24jiPq5Ev
	HOHWXU2XLs9a1zTsQX62+JfG6jEJQ5c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552991; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oXjtiiPFLzYFznlWn/C8ZCBcRUde7S7BFmz8pb92S3c=;
	b=YFINieC/XziGqNKvYCJxQsWesX9OVovupGp2FPfPA9gmhSpr5N84y4kzTsF4iZbAptFuUZ
	xtciKUEtp8KiqhKSYoUn+5m9GIXPXHJHy5ymQYP7rr5g4qPH1mOjC2UQu4MCS24jiPq5Ev
	HOHWXU2XLs9a1zTsQX62+JfG6jEJQ5c=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 7/8] xen/rwlock: raise the number of possible cpus
Date: Wed, 27 Mar 2024 16:22:28 +0100
Message-Id: <20240327152229.25847-8-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240327152229.25847-1-jgross@suse.com>
References: <20240327152229.25847-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 1.49
X-Spam-Flag: NO
X-Spamd-Bar: +
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b="YFINieC/"
X-Spamd-Result: default: False [1.49 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DWL_DNSWL_MED(-2.00)[suse.com:dkim];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	 RCVD_TLS_ALL(0.00)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Spam-Level: *
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A84AC38B63

The rwlock handling is limiting the number of cpus to 4095 today. The
main reason is the use of the atomic_t data type for the main lock
handling, which needs 2 bits for the locking state (writer waiting or
write locked), 12 bits for the id of a possible writer, and a 12 bit
counter for readers. The limit isn't 4096 due to an off by one sanity
check.

The atomic_t data type is 32 bits wide, so in theory 15 bits for the
writer's cpu id and 15 bits for the reader count seem to be fine, but
via read_trylock() more readers than cpus are possible.

This means that it is possible to raise the number of cpus to 16384
without changing the rwlock_t data structure. In order to avoid the
reader count wrapping to zero, don't let read_trylock() succeed in case
the highest bit of the reader's count is set already. This leaves enough
headroom for non-recursive readers to enter without risking a wrap.

While at it calculate _QW_CPUMASK and _QR_SHIFT from _QW_SHIFT and
add a sanity check for not overflowing the atomic_t data type.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V5:
- new patch
V6:
- add comment to _can_read_lock() (Jan Beulich)
---
 xen/include/xen/rwlock.h | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/xen/include/xen/rwlock.h b/xen/include/xen/rwlock.h
index 65d88b0ef4..232782801d 100644
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -23,12 +23,12 @@ typedef struct {
 #define rwlock_init(l) (*(l) = (rwlock_t)RW_LOCK_UNLOCKED)
 
 /* Writer states & reader shift and bias. */
-#define    _QW_CPUMASK  0xfffU             /* Writer CPU mask */
-#define    _QW_SHIFT    12                 /* Writer flags shift */
-#define    _QW_WAITING  (1U << _QW_SHIFT)  /* A writer is waiting */
-#define    _QW_LOCKED   (3U << _QW_SHIFT)  /* A writer holds the lock */
-#define    _QW_WMASK    (3U << _QW_SHIFT)  /* Writer mask */
-#define    _QR_SHIFT    14                 /* Reader count shift */
+#define    _QW_SHIFT    14                      /* Writer flags shift */
+#define    _QW_CPUMASK  ((1U << _QW_SHIFT) - 1) /* Writer CPU mask */
+#define    _QW_WAITING  (1U << _QW_SHIFT)       /* A writer is waiting */
+#define    _QW_LOCKED   (3U << _QW_SHIFT)       /* A writer holds the lock */
+#define    _QW_WMASK    (3U << _QW_SHIFT)       /* Writer mask */
+#define    _QR_SHIFT    (_QW_SHIFT + 2)         /* Reader count shift */
 #define    _QR_BIAS     (1U << _QR_SHIFT)
 
 void queue_read_lock_slowpath(rwlock_t *lock);
@@ -36,14 +36,21 @@ void queue_write_lock_slowpath(rwlock_t *lock);
 
 static inline bool _is_write_locked_by_me(unsigned int cnts)
 {
-    BUILD_BUG_ON(_QW_CPUMASK < NR_CPUS);
+    BUILD_BUG_ON((_QW_CPUMASK + 1) < NR_CPUS);
+    BUILD_BUG_ON(NR_CPUS * _QR_BIAS > INT_MAX);
     return (cnts & _QW_WMASK) == _QW_LOCKED &&
            (cnts & _QW_CPUMASK) == smp_processor_id();
 }
 
 static inline bool _can_read_lock(unsigned int cnts)
 {
-    return !(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts);
+    /*
+     * If write locked by the caller, no other readers are possible.
+     * Not allowing the lock holder to read_lock() another 32768 times ought
+     * to be fine.
+     */
+    return cnts <= INT_MAX &&
+           (!(cnts & _QW_WMASK) || _is_write_locked_by_me(cnts));
 }
 
 /*
-- 
2.35.3


