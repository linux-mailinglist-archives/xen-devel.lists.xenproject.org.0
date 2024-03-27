Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6203488E8A1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 16:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698608.1090541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV7N-0001Qg-6I; Wed, 27 Mar 2024 15:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698608.1090541; Wed, 27 Mar 2024 15:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpV7N-0001OE-3Z; Wed, 27 Mar 2024 15:23:09 +0000
Received: by outflank-mailman (input) for mailman id 698608;
 Wed, 27 Mar 2024 15:23:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rpV7K-0007Qx-V9
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 15:23:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9177cc7-ec4d-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 16:23:06 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0E8FD20CDD;
 Wed, 27 Mar 2024 15:23:06 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C747A13215;
 Wed, 27 Mar 2024 15:23:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id qHk9L9k5BGZafgAAn2gu4w
 (envelope-from <jgross@suse.com>); Wed, 27 Mar 2024 15:23:05 +0000
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
X-Inumbo-ID: e9177cc7-ec4d-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BqLZjhhBHT3mnXz0DltiWo9mb+SXQAswcBtFsIHNjqU=;
	b=eCXUM4ctFmRMh/J+LAGK+4e1y6KxkqEmjC1ysplW7YQaysPSYjXGtyhqKUD1gvSekLojS1
	0OBAg7wu6A+GkGTa26PDu6zJer/uDcsAX2adBHRNJGOXA1RrDK6pZ16WetQp//PapgewKy
	0O83/8aW6LWvhU/Wi0CV0c7dPXKkSJc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1711552986; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BqLZjhhBHT3mnXz0DltiWo9mb+SXQAswcBtFsIHNjqU=;
	b=eCXUM4ctFmRMh/J+LAGK+4e1y6KxkqEmjC1ysplW7YQaysPSYjXGtyhqKUD1gvSekLojS1
	0OBAg7wu6A+GkGTa26PDu6zJer/uDcsAX2adBHRNJGOXA1RrDK6pZ16WetQp//PapgewKy
	0O83/8aW6LWvhU/Wi0CV0c7dPXKkSJc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 6/8] xen/spinlock: support higher number of cpus
Date: Wed, 27 Mar 2024 16:22:27 +0100
Message-Id: <20240327152229.25847-7-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240327152229.25847-1-jgross@suse.com>
References: <20240327152229.25847-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Level: ***
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Flag: NO

Allow 16 bits per cpu number, which is the limit imposed by
spinlock_tickets_t.

This will allow up to 65535 cpus, while increasing only the size of
recursive spinlocks in debug builds from 8 to 12 bytes.

The current Xen limit of 4095 cpus is imposed by SPINLOCK_CPU_BITS
being 12. There are machines available with more cpus than the current
Xen limit, so it makes sense to have the possibility to use more cpus.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V5:
- keep previous recursion limit (Julien Grall)
V6:
- use unsigned int instead of uint32_t (Jan Beulich)
---
 xen/common/spinlock.c      |  2 ++
 xen/include/xen/spinlock.h | 20 ++++++++++----------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 7ccb725171..5aa9ba6188 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -485,7 +485,9 @@ bool _rspin_trylock(rspinlock_t *lock)
 
     /* Don't allow overflow of recurse_cpu field. */
     BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
+    BUILD_BUG_ON(SPINLOCK_CPU_BITS > sizeof(lock->recurse_cpu) * 8);
     BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
+    BUILD_BUG_ON(SPINLOCK_MAX_RECURSE > ((1u << SPINLOCK_RECURSE_BITS) - 1));
 
     check_lock(&lock->debug, true);
 
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 3a4092626c..db00a24646 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -8,16 +8,16 @@
 #include <asm/system.h>
 #include <asm/spinlock.h>
 
-#define SPINLOCK_CPU_BITS  12
+#define SPINLOCK_CPU_BITS  16
 
 #ifdef CONFIG_DEBUG_LOCKS
 union lock_debug {
-    uint16_t val;
-#define LOCK_DEBUG_INITVAL 0xffff
+    uint32_t val;
+#define LOCK_DEBUG_INITVAL 0xffffffff
     struct {
-        uint16_t cpu:SPINLOCK_CPU_BITS;
-#define LOCK_DEBUG_PAD_BITS (14 - SPINLOCK_CPU_BITS)
-        uint16_t :LOCK_DEBUG_PAD_BITS;
+        unsigned int cpu:SPINLOCK_CPU_BITS;
+#define LOCK_DEBUG_PAD_BITS (30 - SPINLOCK_CPU_BITS)
+        unsigned int :LOCK_DEBUG_PAD_BITS;
         bool irq_safe:1;
         bool unseen:1;
     };
@@ -211,11 +211,11 @@ typedef struct spinlock {
 
 typedef struct rspinlock {
     spinlock_tickets_t tickets;
-    uint16_t recurse_cpu:SPINLOCK_CPU_BITS;
+    uint16_t recurse_cpu;
 #define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
-#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
-    uint16_t recurse_cnt:SPINLOCK_RECURSE_BITS;
-#define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
+#define SPINLOCK_RECURSE_BITS  8
+    uint8_t recurse_cnt;
+#define SPINLOCK_MAX_RECURSE   15
     union lock_debug debug;
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
     struct lock_profile *profile;
-- 
2.35.3


