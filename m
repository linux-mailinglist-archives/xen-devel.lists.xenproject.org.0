Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6529280E836
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652875.1018999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzPf-0005m1-Hz; Tue, 12 Dec 2023 09:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652875.1018999; Tue, 12 Dec 2023 09:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCzPf-0005js-F8; Tue, 12 Dec 2023 09:50:51 +0000
Received: by outflank-mailman (input) for mailman id 652875;
 Tue, 12 Dec 2023 09:50:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCzNV-0006i7-SG
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:48:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e84002a-98d3-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 10:48:36 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BE2EB1F74C;
 Tue, 12 Dec 2023 09:48:35 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 83F73139E9;
 Tue, 12 Dec 2023 09:48:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id gFz5HnMseGUAfwAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 09:48:35 +0000
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
X-Inumbo-ID: 9e84002a-98d3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o0uw0mmQZTxGdRt6ID2VqCT2e47nRjokh0HeNjme8pc=;
	b=GpYCzSlzf8uUWHp752gL4WHDqkywen/2Pq2rJqzgYiipkl4dTnvAsaSDdEVjDuCqWYYy1q
	kW5XhUATQEYwlYlnXiAYeEKuPjY1tuLtavOZ1L6rSBht0XhK4NgBRn9AfnKMf0aYk61XY/
	vHGIjVYXyUTBZGiCXC/zDnG9GWdWoyo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702374515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o0uw0mmQZTxGdRt6ID2VqCT2e47nRjokh0HeNjme8pc=;
	b=GpYCzSlzf8uUWHp752gL4WHDqkywen/2Pq2rJqzgYiipkl4dTnvAsaSDdEVjDuCqWYYy1q
	kW5XhUATQEYwlYlnXiAYeEKuPjY1tuLtavOZ1L6rSBht0XhK4NgBRn9AfnKMf0aYk61XY/
	vHGIjVYXyUTBZGiCXC/zDnG9GWdWoyo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 12/12] xen/spinlock: support higher number of cpus
Date: Tue, 12 Dec 2023 10:47:25 +0100
Message-Id: <20231212094725.22184-13-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231212094725.22184-1-jgross@suse.com>
References: <20231212094725.22184-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***************
X-Spam-Flag: YES
X-Spam-Score: 15.00
X-Spam-Level: 
X-Spamd-Bar: /
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=GpYCzSlz;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [0.99 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 DWL_DNSWL_BLOCKED(0.00)[suse.com:dkim];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[8];
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
X-Spam-Score: 0.99
X-Rspamd-Queue-Id: BE2EB1F74C
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
index 296bcf33e6..ae7c7c2086 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -481,6 +481,7 @@ int rspin_trylock(rspinlock_t *lock)
 
     /* Don't allow overflow of recurse_cpu field. */
     BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
+    BUILD_BUG_ON(SPINLOCK_CPU_BITS > sizeof(lock->recurse_cpu) * 8);
     BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
 
     check_lock(&lock->debug, true);
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index 87946965b2..d720778cc1 100644
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


