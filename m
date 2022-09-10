Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 398195B4763
	for <lists+xen-devel@lfdr.de>; Sat, 10 Sep 2022 17:50:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404810.647431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX2kP-0005YP-EZ; Sat, 10 Sep 2022 15:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404810.647431; Sat, 10 Sep 2022 15:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX2kP-0005VU-BI; Sat, 10 Sep 2022 15:50:21 +0000
Received: by outflank-mailman (input) for mailman id 404810;
 Sat, 10 Sep 2022 15:50:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oX2kO-0004BJ-As
 for xen-devel@lists.xenproject.org; Sat, 10 Sep 2022 15:50:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4598fd20-3120-11ed-9760-273f2230c3a0;
 Sat, 10 Sep 2022 17:50:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 64A0621B67;
 Sat, 10 Sep 2022 15:50:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2835C13441;
 Sat, 10 Sep 2022 15:50:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SHyYCDuyHGNqZAAAMHmgww
 (envelope-from <jgross@suse.com>); Sat, 10 Sep 2022 15:50:19 +0000
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
X-Inumbo-ID: 4598fd20-3120-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662825019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HT/7IdQpKAQmA1bHFNkUTH+SSUmzVBMKCGG4nyC9O9s=;
	b=jz/mSRYOdzK5Rz8l4vKVkSxHUEgyJJvXeZvo62ktJg4xGVarCKlv5fs43igPIMlKhkKYCr
	8MseAgKGswoK1fuT9PgS92W0QgQC1NGthqZiTkx3WHw8Yl6ac6z144K0Jc47QEnUE3iVGm
	XqM4wRxsVcicQV2bue67pHS947cm5hU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 3/3] xen/spinlock: support higher number of cpus
Date: Sat, 10 Sep 2022 17:49:59 +0200
Message-Id: <20220910154959.15971-4-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220910154959.15971-1-jgross@suse.com>
References: <20220910154959.15971-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no real reason why the cpu fields of struct spinlock should
be limited to 12 bits, now that there is a 2 byte padding hole after
those fields.

Make the related structures a little bit larger allowing 16 bits per
cpu number, which is the limit imposed by spinlock_tickets_t.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/spinlock.c      |  1 +
 xen/include/xen/spinlock.h | 18 +++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index a48ed17ac6..5509e4b79a 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -303,6 +303,7 @@ int _spin_trylock_recursive(struct spinlock_recursive *lock)
 
     /* Don't allow overflow of recurse_cpu field. */
     BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
+    BUILD_BUG_ON(SPINLOCK_CPU_BITS > sizeof(lock->recurse_cpu) * 8);
     BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
 
     check_lock(&lock->lock.debug, true);
diff --git a/xen/include/xen/spinlock.h b/xen/include/xen/spinlock.h
index d0cfb4c524..e157b12f6e 100644
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -6,16 +6,16 @@
 #include <asm/spinlock.h>
 #include <asm/types.h>
 
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
@@ -173,10 +173,10 @@ typedef struct spinlock {
 
 struct spinlock_recursive {
     struct spinlock lock;
-    u16 recurse_cpu:SPINLOCK_CPU_BITS;
+    uint16_t recurse_cpu;
 #define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
-#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
-    u16 recurse_cnt:SPINLOCK_RECURSE_BITS;
+#define SPINLOCK_RECURSE_BITS  8
+    uint8_t recurse_cnt;
 #define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
 };
 
-- 
2.35.3


