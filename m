Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2950239F336
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 12:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138387.256189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqYes-0006qL-IA; Tue, 08 Jun 2021 10:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138387.256189; Tue, 08 Jun 2021 10:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqYes-0006oS-EO; Tue, 08 Jun 2021 10:08:30 +0000
Received: by outflank-mailman (input) for mailman id 138387;
 Tue, 08 Jun 2021 10:08:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lqYer-0006oM-Nm
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 10:08:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lqYeq-0005AG-GO; Tue, 08 Jun 2021 10:08:28 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lqYeq-00027X-6a; Tue, 08 Jun 2021 10:08:28 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=WWx1c4xCo/kN7OvGQUgBOy+jKZqydcCPkw/e/l7Xqec=; b=6TXhwZyRyHMEsBiAemv6XBy1g5
	v/xZ+oR3a4SaNDkSLlSMYHVeDF+kBz9eezBhEOQakZsace3vmHiXNloc7Zk9BMhY6aEjdrfZfj8yr
	ImUr4HhBl7lgcw1h0dHAxxUqCgIYhIrdQ9DLqw03yDh+qEK1AAqq07pkv/S/sTBhu+t8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen/grant-table: Simplify the update to the per-vCPU maptrack freelist
Date: Tue,  8 Jun 2021 11:08:24 +0100
Message-Id: <20210608100824.25141-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Since XSA-228 (commit 02cbeeb62075 "gnttab: split maptrack lock
to make it fulfill its purpose again"), v->maptrack_head,
v->maptrack_tail and the content of the freelist are accessed with
the lock v->maptrack_freelist_lock held.

Therefore it is not necessary to update the fields using cmpxchg()
and also read them atomically.

Note that there are two cases where v->maptrack_tail is accessed without
the lock. They both happen in get_maptrack_handle() when initializing
the free list of the current vCPU. Therefore there is no possible race.

The code is now reworked to remove any use of cmpxch() and read_atomic()
when accessing the fields v->maptrack_{head, tail} as wel as the
freelist.

Take the opportunity to add a comment on top of the lock definition
and explain what it protects.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

    Changes in v2:
        - Fix typoes
        - Update the commit message
        - Don't use interchangeably MAPTRACK_TAIL and
        INVALID_MAPTRACK_HANDLE
---
 xen/common/grant_table.c | 66 ++++++++++++++++------------------------
 xen/include/xen/sched.h  |  8 ++++-
 2 files changed, 34 insertions(+), 40 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ab30e2e8cfb6..fab77ab9ccb8 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -543,33 +543,27 @@ double_gt_unlock(struct grant_table *lgt, struct grant_table *rgt)
 static inline grant_handle_t
 _get_maptrack_handle(struct grant_table *t, struct vcpu *v)
 {
-    unsigned int head, next, prev_head;
+    unsigned int head, next;
 
     spin_lock(&v->maptrack_freelist_lock);
 
-    do {
-        /* No maptrack pages allocated for this VCPU yet? */
-        head = read_atomic(&v->maptrack_head);
-        if ( unlikely(head == MAPTRACK_TAIL) )
-        {
-            spin_unlock(&v->maptrack_freelist_lock);
-            return INVALID_MAPTRACK_HANDLE;
-        }
-
-        /*
-         * Always keep one entry in the free list to make it easier to
-         * add free entries to the tail.
-         */
-        next = read_atomic(&maptrack_entry(t, head).ref);
-        if ( unlikely(next == MAPTRACK_TAIL) )
-        {
-            spin_unlock(&v->maptrack_freelist_lock);
-            return INVALID_MAPTRACK_HANDLE;
-        }
+    /* No maptrack pages allocated for this VCPU yet? */
+    head = v->maptrack_head;
+    if ( unlikely(head == MAPTRACK_TAIL) )
+    {
+        spin_unlock(&v->maptrack_freelist_lock);
+        return INVALID_MAPTRACK_HANDLE;
+    }
 
-        prev_head = head;
-        head = cmpxchg(&v->maptrack_head, prev_head, next);
-    } while ( head != prev_head );
+    /*
+     * Always keep one entry in the free list to make it easier to
+     * add free entries to the tail.
+     */
+    next = maptrack_entry(t, head).ref;
+    if ( unlikely(next == MAPTRACK_TAIL) )
+        head = INVALID_MAPTRACK_HANDLE;
+    else
+        v->maptrack_head = next;
 
     spin_unlock(&v->maptrack_freelist_lock);
 
@@ -623,7 +617,7 @@ put_maptrack_handle(
 {
     struct domain *currd = current->domain;
     struct vcpu *v;
-    unsigned int prev_tail, cur_tail;
+    unsigned int tail;
 
     /* 1. Set entry to be a tail. */
     maptrack_entry(t, handle).ref = MAPTRACK_TAIL;
@@ -633,14 +627,11 @@ put_maptrack_handle(
 
     spin_lock(&v->maptrack_freelist_lock);
 
-    cur_tail = read_atomic(&v->maptrack_tail);
-    do {
-        prev_tail = cur_tail;
-        cur_tail = cmpxchg(&v->maptrack_tail, prev_tail, handle);
-    } while ( cur_tail != prev_tail );
+    tail = v->maptrack_tail;
+    v->maptrack_tail = handle;
 
     /* 3. Update the old tail entry to point to the new entry. */
-    write_atomic(&maptrack_entry(t, prev_tail).ref, handle);
+    maptrack_entry(t, tail).ref = handle;
 
     spin_unlock(&v->maptrack_freelist_lock);
 }
@@ -650,7 +641,7 @@ get_maptrack_handle(
     struct grant_table *lgt)
 {
     struct vcpu          *curr = current;
-    unsigned int          i, head;
+    unsigned int          i;
     grant_handle_t        handle;
     struct grant_mapping *new_mt = NULL;
 
@@ -686,7 +677,7 @@ get_maptrack_handle(
             maptrack_entry(lgt, handle).ref = MAPTRACK_TAIL;
             curr->maptrack_tail = handle;
             if ( curr->maptrack_head == MAPTRACK_TAIL )
-                write_atomic(&curr->maptrack_head, handle);
+                curr->maptrack_head = handle;
             spin_unlock(&curr->maptrack_freelist_lock);
         }
         return steal_maptrack_handle(lgt, curr);
@@ -707,7 +698,7 @@ get_maptrack_handle(
         new_mt[i].vcpu = curr->vcpu_id;
     }
 
-    /* Set tail directly if this is the first page for this VCPU. */
+    /* Set tail directly if this is the first page for the local vCPU. */
     if ( curr->maptrack_tail == MAPTRACK_TAIL )
         curr->maptrack_tail = handle + MAPTRACK_PER_PAGE - 1;
 
@@ -716,13 +707,10 @@ get_maptrack_handle(
     lgt->maptrack_limit += MAPTRACK_PER_PAGE;
 
     spin_unlock(&lgt->maptrack_lock);
-    spin_lock(&curr->maptrack_freelist_lock);
-
-    do {
-        new_mt[i - 1].ref = read_atomic(&curr->maptrack_head);
-        head = cmpxchg(&curr->maptrack_head, new_mt[i - 1].ref, handle + 1);
-    } while ( head != new_mt[i - 1].ref );
 
+    spin_lock(&curr->maptrack_freelist_lock);
+    new_mt[i - 1].ref = curr->maptrack_head;
+    curr->maptrack_head = handle + 1;
     spin_unlock(&curr->maptrack_freelist_lock);
 
     return handle;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 3982167144c6..6c52ba2af019 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -255,7 +255,13 @@ struct vcpu
     /* VCPU paused by system controller. */
     int              controller_pause_count;
 
-    /* Grant table map tracking. */
+    /*
+     * Grant table map tracking. The lock maptrack_freelist_lock
+     * protects to:
+     *  - The entries in the freelist
+     *  - maptrack_head
+     *  - maptrack_tail
+     */
     spinlock_t       maptrack_freelist_lock;
     unsigned int     maptrack_head;
     unsigned int     maptrack_tail;
-- 
2.17.1


