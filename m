Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C240787B873
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:21:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692897.1080562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOc-00074W-AX; Thu, 14 Mar 2024 07:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692897.1080562; Thu, 14 Mar 2024 07:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfOc-0006za-6U; Thu, 14 Mar 2024 07:20:58 +0000
Received: by outflank-mailman (input) for mailman id 692897;
 Thu, 14 Mar 2024 07:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CDQ4=KU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rkfOa-0005cd-VK
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:20:56 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 658ef96a-e1d3-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 08:20:55 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 271C01F801;
 Thu, 14 Mar 2024 07:20:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CDFCD13977;
 Thu, 14 Mar 2024 07:20:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id EhKxMFal8mVTDgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 14 Mar 2024 07:20:54 +0000
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
X-Inumbo-ID: 658ef96a-e1d3-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZJrib1UGrzmVSpmgprY0xMWihJMCjOR39gpkTSzqsU=;
	b=dpaeFiBTyGzUg2S/xFMG3QJSOPMci0iY/s+TfqbBPwwlVDibOvhTJGjQ20x81ka4Lual9x
	2ZKVnSUWUZbHkmwDP9JoDyIMYXrUJrxq3nrM6DhdvY6XJClNGfRz4mf3gYcgpTj0LfQ1xg
	oPaUuYHRt5oACbrPijI/NYCpHY0ev/U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZJrib1UGrzmVSpmgprY0xMWihJMCjOR39gpkTSzqsU=;
	b=dpaeFiBTyGzUg2S/xFMG3QJSOPMci0iY/s+TfqbBPwwlVDibOvhTJGjQ20x81ka4Lual9x
	2ZKVnSUWUZbHkmwDP9JoDyIMYXrUJrxq3nrM6DhdvY6XJClNGfRz4mf3gYcgpTj0LfQ1xg
	oPaUuYHRt5oACbrPijI/NYCpHY0ev/U=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 04/13] xen/spinlock: add rspin_[un]lock_irq[save|restore]()
Date: Thu, 14 Mar 2024 08:20:20 +0100
Message-Id: <20240314072029.16937-5-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240314072029.16937-1-jgross@suse.com>
References: <20240314072029.16937-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 1.90
X-Spam-Flag: NO

Instead of special casing rspin_lock_irqsave() and
rspin_unlock_irqrestore() for the console lock, add those functions
to spinlock handling and use them where needed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
V5:
- avoid MISRA violation (Julien Grall)
- keep wrapper functions (Jan Beulich)
---
 xen/common/spinlock.c      | 18 +++++++++++++++++-
 xen/drivers/char/console.c |  6 ++----
 xen/include/xen/spinlock.h |  9 +++++++++
 3 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 11e13e1259..5ef0ac7f89 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -475,15 +475,31 @@ void _rspin_lock(rspinlock_t *lock)
     lock->recurse_cnt++;
 }
 
+unsigned long _rspin_lock_irqsave(rspinlock_t *lock)
+{
+    unsigned long flags;
+
+    local_irq_save(flags);
+    _rspin_lock(lock);
+
+    return flags;
+}
+
 void _rspin_unlock(rspinlock_t *lock)
 {
     if ( likely(--lock->recurse_cnt == 0) )
     {
         lock->recurse_cpu = SPINLOCK_NO_CPU;
-        spin_unlock(lock);
+        _spin_unlock(lock);
     }
 }
 
+void _rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags)
+{
+    _rspin_unlock(lock);
+    local_irq_restore(flags);
+}
+
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
 
 struct lock_profile_anc {
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index eca17b55b4..ccd5f8cc14 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1161,16 +1161,14 @@ unsigned long console_lock_recursive_irqsave(void)
 {
     unsigned long flags;
 
-    local_irq_save(flags);
-    rspin_lock(&console_lock);
+    rspin_lock_irqsave(&console_lock, flags);
 
     return flags;
 }
 
 void console_unlock_recursive_irqrestore(unsigned long flags)
 {
-    rspin_unlock(&console_lock);
-    local_irq_restore(flags);
+    rspin_unlock_irqrestore(&console_lock, flags);
 }
 
 void console_force_unlock(void)
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 50f6580f52..afa24c8e29 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -272,7 +272,15 @@ static always_inline void spin_lock_if(bool condition, spinlock_t *l)
  */
 bool _rspin_trylock(rspinlock_t *lock);
 void _rspin_lock(rspinlock_t *lock);
+#define rspin_lock_irqsave(l, f)                                \
+    ({                                                          \
+        BUILD_BUG_ON(sizeof(f) != sizeof(unsigned long));       \
+        ((f) = _rspin_lock_irqsave(l));                         \
+        block_lock_speculation();                               \
+    })
+unsigned long _rspin_lock_irqsave(rspinlock_t *lock);
 void _rspin_unlock(rspinlock_t *lock);
+void _rspin_unlock_irqrestore(rspinlock_t *lock, unsigned long flags);
 
 static always_inline void rspin_lock(rspinlock_t *lock)
 {
@@ -282,5 +290,6 @@ static always_inline void rspin_lock(rspinlock_t *lock)
 
 #define rspin_trylock(l)              lock_evaluate_nospec(_rspin_trylock(l))
 #define rspin_unlock(l)               _rspin_unlock(l)
+#define rspin_unlock_irqrestore(l, f) _rspin_unlock_irqrestore(l, f)
 
 #endif /* __SPINLOCK_H__ */
-- 
2.35.3


