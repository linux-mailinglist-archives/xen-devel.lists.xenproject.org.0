Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3985E2A5F30
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 09:16:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18837.43878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaDxY-0000Vo-IN; Wed, 04 Nov 2020 08:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18837.43878; Wed, 04 Nov 2020 08:16:00 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaDxY-0000V1-Dw; Wed, 04 Nov 2020 08:16:00 +0000
Received: by outflank-mailman (input) for mailman id 18837;
 Wed, 04 Nov 2020 08:15:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kaDxW-0000Pk-Vc
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:15:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b17a3e08-d071-4107-9a9a-62c7dbc0f131;
 Wed, 04 Nov 2020 08:15:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7FB21AC23;
 Wed,  4 Nov 2020 08:15:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2Coh=EK=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kaDxW-0000Pk-Vc
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 08:15:59 +0000
X-Inumbo-ID: b17a3e08-d071-4107-9a9a-62c7dbc0f131
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id b17a3e08-d071-4107-9a9a-62c7dbc0f131;
	Wed, 04 Nov 2020 08:15:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604477751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SMWFDeqyO4Bqdr2XBTO3XuyCVTVJJjcu3BY2gEaI7+0=;
	b=dQMJ2oPyWtwflpsHfulQPgBtMzNX2MQIF21kPA26/35M0xKeNVqjfq6c1xWMK+m7FDKPmO
	zTkXnEpzbTzej/zjlWVmri5+f9+2ho75oKOVO5iLV2UpYlv0DIsdpbOhc4fbUE+C2eYeKV
	FCc72zmaABiCECj/knpDXrloiKhgKD0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7FB21AC23;
	Wed,  4 Nov 2020 08:15:51 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/3] xen/spinlocks: spin_trylock with interrupts off is always fine
Date: Wed,  4 Nov 2020 09:15:47 +0100
Message-Id: <20201104081549.3712-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201104081549.3712-1-jgross@suse.com>
References: <20201104081549.3712-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Even if a spinlock was taken with interrupts on before calling
spin_trylock() with interrupts off is fine, as it can't block.

Add a bool parameter "try" to check_lock() for handling this case.

Remove the call of check_lock() from _spin_is_locked(), as it really
serves no purpose and it can even lead to false crashes, e.g. when
a lock was taken correctly with interrupts enabled and the call of
_spin_is_locked() happened with interrupts off. In case the lock is
taken with wrong interrupt flags this will be catched when taking
the lock.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- corrected comment (Jan Beulich)
---
 xen/common/spinlock.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index ce3106e2d3..b4aaf6bce6 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -13,7 +13,7 @@
 
 static atomic_t spin_debug __read_mostly = ATOMIC_INIT(0);
 
-static void check_lock(union lock_debug *debug)
+static void check_lock(union lock_debug *debug, bool try)
 {
     bool irq_safe = !local_irq_is_enabled();
 
@@ -42,7 +42,13 @@ static void check_lock(union lock_debug *debug)
      * 
      * To guard against this subtle bug we latch the IRQ safety of every
      * spinlock in the system, on first use.
+     *
+     * A spin_trylock() with interrupts off is always fine, as this can't
+     * block and above deadlock scenario doesn't apply.
      */
+    if ( try && irq_safe )
+        return;
+
     if ( unlikely(debug->irq_safe != irq_safe) )
     {
         union lock_debug seen, new = { 0 };
@@ -102,7 +108,7 @@ void spin_debug_disable(void)
 
 #else /* CONFIG_DEBUG_LOCKS */
 
-#define check_lock(l) ((void)0)
+#define check_lock(l, t) ((void)0)
 #define check_barrier(l) ((void)0)
 #define got_lock(l) ((void)0)
 #define rel_lock(l) ((void)0)
@@ -159,7 +165,7 @@ void inline _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
     spinlock_tickets_t tickets = SPINLOCK_TICKET_INC;
     LOCK_PROFILE_VAR;
 
-    check_lock(&lock->debug);
+    check_lock(&lock->debug, false);
     preempt_disable();
     tickets.head_tail = arch_fetch_and_add(&lock->tickets.head_tail,
                                            tickets.head_tail);
@@ -220,8 +226,6 @@ void _spin_unlock_irqrestore(spinlock_t *lock, unsigned long flags)
 
 int _spin_is_locked(spinlock_t *lock)
 {
-    check_lock(&lock->debug);
-
     /*
      * Recursive locks may be locked by another CPU, yet we return
      * "false" here, making this function suitable only for use in
@@ -236,7 +240,7 @@ int _spin_trylock(spinlock_t *lock)
 {
     spinlock_tickets_t old, new;
 
-    check_lock(&lock->debug);
+    check_lock(&lock->debug, true);
     old = observe_lock(&lock->tickets);
     if ( old.head != old.tail )
         return 0;
@@ -294,7 +298,7 @@ int _spin_trylock_recursive(spinlock_t *lock)
     BUILD_BUG_ON(NR_CPUS > SPINLOCK_NO_CPU);
     BUILD_BUG_ON(SPINLOCK_RECURSE_BITS < 3);
 
-    check_lock(&lock->debug);
+    check_lock(&lock->debug, true);
 
     if ( likely(lock->recurse_cpu != cpu) )
     {
-- 
2.26.2


