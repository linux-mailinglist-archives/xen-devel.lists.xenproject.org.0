Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FDA7F1274
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 12:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636665.992348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52nO-0005an-7w; Mon, 20 Nov 2023 11:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636665.992348; Mon, 20 Nov 2023 11:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r52nO-0005YZ-5F; Mon, 20 Nov 2023 11:50:30 +0000
Received: by outflank-mailman (input) for mailman id 636665;
 Mon, 20 Nov 2023 11:50:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WPLm=HB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r52dH-0005BS-NS
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 11:40:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a94e2d8-8799-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 12:40:02 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C56DB1F88F;
 Mon, 20 Nov 2023 11:40:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87AE013499;
 Mon, 20 Nov 2023 11:40:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AMDPH5FFW2VjPgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Nov 2023 11:40:01 +0000
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
X-Inumbo-ID: 8a94e2d8-8799-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1700480401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rw7Gb45k+0Tw/rqvtRymDJIDNLAU0w1SxzFCo0/jXk0=;
	b=N4fjsFBMmrqOh5LPVFIQnooQ7trltB/VW/g0mSZhPRFaYQnZe5k6aRH3mPHUzRd1ySn8Hp
	wFRqhkMpkYlZive3CAfgqm4U5QXHbopTmMuuNrIbVRsCwwXJAkXChN9FY1T/V+lbAp+TuO
	hZ4wuXMc1d3LNnPX3rla7iZhXwaGGGY=
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
Subject: [PATCH v3 13/13] xen/spinlock: support higher number of cpus
Date: Mon, 20 Nov 2023 12:38:42 +0100
Message-Id: <20231120113842.5897-14-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231120113842.5897-1-jgross@suse.com>
References: <20231120113842.5897-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
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
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[99.99%]
X-Spam-Flag: NO

Allow 16 bits per cpu number, which is the limit imposed by
spinlock_tickets_t.

This will allow up to 65535 cpus, while increasing only the size of
recursive spinlocks in debug builds from 8 to 12 bytes.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/spinlock.c      |  1 +
 xen/include/xen/spinlock.h | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 43c876b64a..8faf7864ed 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -481,6 +481,7 @@ int rspin_trylock(rspinlock_t *lock)
 
     /* Don't allow overflow of recurse_cpu field. */
     BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
+    BUILD_BUG_ON(SPINLOCK_CPU_BITS > sizeof(lock->recurse_cpu) * 8);
     BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
 
     check_lock(&lock->debug, true);
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index e4f2e36e4f..ea88f3ad75 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -7,16 +7,16 @@
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
@@ -210,10 +210,10 @@ typedef struct spinlock {
 
 typedef struct rspinlock {
     spinlock_tickets_t tickets;
-    uint16_t recurse_cpu:SPINLOCK_CPU_BITS;
+    uint16_t recurse_cpu;
 #define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
-#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
-    uint16_t recurse_cnt:SPINLOCK_RECURSE_BITS;
+#define SPINLOCK_RECURSE_BITS  8
+    uint8_t recurse_cnt;
 #define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
     union lock_debug debug;
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
-- 
2.35.3


