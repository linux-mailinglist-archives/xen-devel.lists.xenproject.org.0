Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3476E87B878
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 08:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692910.1080612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfPG-0001Xx-Pn; Thu, 14 Mar 2024 07:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692910.1080612; Thu, 14 Mar 2024 07:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkfPG-0001VO-MQ; Thu, 14 Mar 2024 07:21:38 +0000
Received: by outflank-mailman (input) for mailman id 692910;
 Thu, 14 Mar 2024 07:21:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CDQ4=KU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rkfPF-0005rB-08
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 07:21:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d5675c0-e1d3-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 08:21:35 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 101F41F79B;
 Thu, 14 Mar 2024 07:21:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C38D513977;
 Thu, 14 Mar 2024 07:21:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id L25ELn6l8mV/DgAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 14 Mar 2024 07:21:34 +0000
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
X-Inumbo-ID: 7d5675c0-e1d3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVUg9sUvshZn0hcfy+zcEBYHChto2sM8ej1C5kH/2gA=;
	b=bCTeyhrUUqc9JD5BDVIVsaj3drWovyp3NBzB06q9GTGxzwLgDmX2VQaefJXGE/31hJSHo4
	poM0XP+Ato6d3pg2Tn6TFGmEEYiO5fewWFNDLf5jkjfaiublYF5jZ89DSzqrU9ynQAkyY/
	kDVyy2aKqlzsey9cnGYU0o0T1QkP/rQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1710400895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lVUg9sUvshZn0hcfy+zcEBYHChto2sM8ej1C5kH/2gA=;
	b=bCTeyhrUUqc9JD5BDVIVsaj3drWovyp3NBzB06q9GTGxzwLgDmX2VQaefJXGE/31hJSHo4
	poM0XP+Ato6d3pg2Tn6TFGmEEYiO5fewWFNDLf5jkjfaiublYF5jZ89DSzqrU9ynQAkyY/
	kDVyy2aKqlzsey9cnGYU0o0T1QkP/rQ=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 11/13] xen/spinlock: support higher number of cpus
Date: Thu, 14 Mar 2024 08:20:27 +0100
Message-Id: <20240314072029.16937-12-jgross@suse.com>
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
---
 xen/common/spinlock.c      |  2 ++
 xen/include/xen/spinlock.h | 20 ++++++++++----------
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index b28239f74d..5be48be082 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -481,7 +481,9 @@ bool _rspin_trylock(rspinlock_t *lock)
 
     /* Don't allow overflow of recurse_cpu field. */
     BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
+    BUILD_BUG_ON(SPINLOCK_CPU_BITS > sizeof(lock->recurse_cpu) * 8);
     BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
+    BUILD_BUG_ON(SPINLOCK_MAX_RECURSE > ((1u << SPINLOCK_RECURSE_BITS) - 1));
 
     check_lock(&lock->debug, true);
 
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 1b50a7e6a0..984da6d4c9 100644
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
+        uint32_t cpu:SPINLOCK_CPU_BITS;
+#define LOCK_DEBUG_PAD_BITS (30 - SPINLOCK_CPU_BITS)
+        uint32_t :LOCK_DEBUG_PAD_BITS;
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


