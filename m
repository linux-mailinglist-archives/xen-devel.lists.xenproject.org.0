Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECD3391B92
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 17:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132585.247250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvM6-0005id-Ku; Wed, 26 May 2021 15:21:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132585.247250; Wed, 26 May 2021 15:21:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llvM6-0005gL-HJ; Wed, 26 May 2021 15:21:58 +0000
Received: by outflank-mailman (input) for mailman id 132585;
 Wed, 26 May 2021 15:21:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1llvM4-0005gF-OE
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 15:21:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llvM3-0003If-DI; Wed, 26 May 2021 15:21:55 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llvM3-0007BA-35; Wed, 26 May 2021 15:21:55 +0000
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
	bh=XvU7hL8A7BFnf31pviCOOpiMF+qB2m6rDh46Ok3wsJo=; b=3+v4T6D+gP2+nw816+kx9jh4TN
	7K+wQC9h9gK0jw/WTB5Sm7/Yf2q6OnDMjdOVPtDO6DCbdxMk34NwqjSwaxovN49mp0HjAAhmxbJNb
	YOqTOCDCsLD/emnZygeOBYiD7vpvehHLCpF7dPfopCmVssXTrFtjoMLdk2pvjhUMCOU0=;
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
Subject: [PATCH] xen/grant-table: Simplify the update to the per-vCPU maptrack freelist
Date: Wed, 26 May 2021 16:21:52 +0100
Message-Id: <20210526152152.26251-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Since XSA-288 (commit 02cbeeb62075 "gnttab: split maptrack lock to make
it fulfill its purpose again"), v->maptrack_head and v->maptrack_tail
are with the lock v->maptrack_freelist_lock held.

Therefore it is not necessary to update the fields using cmpxchg()
and also read them atomically.

Note that there are two cases where v->maptrack_tail is accessed without
the lock. They both happen _get_maptrack_handle() when the current vCPU
list is empty. Therefore there is no possible race.

The code is now reworked to remove any use of cmpxch() and read_atomic()
when accessing the fields v->maptrack_{head, tail}.

Take the opportunity to add a comment on top of the lock definition
and explain what it protects.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

I am not sure whether we should try to protect the remaining unprotected
access with the lock or maybe add a comment?
---
 xen/common/grant_table.c | 60 +++++++++++++++-------------------------
 xen/include/xen/sched.h  |  5 +++-
 2 files changed, 27 insertions(+), 38 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ab30e2e8cfb6..cac9d1d73446 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -543,34 +543,26 @@ double_gt_unlock(struct grant_table *lgt, struct grant_table *rgt)
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
+        goto out;
 
-        prev_head = head;
-        head = cmpxchg(&v->maptrack_head, prev_head, next);
-    } while ( head != prev_head );
+    /*
+     * Always keep one entry in the free list to make it easier to
+     * add free entries to the tail.
+     */
+    next = read_atomic(&maptrack_entry(t, head).ref);
+    if ( unlikely(next == MAPTRACK_TAIL) )
+        head = MAPTRACK_TAIL;
+    else
+        v->maptrack_head = next;
 
+out:
     spin_unlock(&v->maptrack_freelist_lock);
 
     return head;
@@ -623,7 +615,7 @@ put_maptrack_handle(
 {
     struct domain *currd = current->domain;
     struct vcpu *v;
-    unsigned int prev_tail, cur_tail;
+    unsigned int prev_tail;
 
     /* 1. Set entry to be a tail. */
     maptrack_entry(t, handle).ref = MAPTRACK_TAIL;
@@ -633,11 +625,8 @@ put_maptrack_handle(
 
     spin_lock(&v->maptrack_freelist_lock);
 
-    cur_tail = read_atomic(&v->maptrack_tail);
-    do {
-        prev_tail = cur_tail;
-        cur_tail = cmpxchg(&v->maptrack_tail, prev_tail, handle);
-    } while ( cur_tail != prev_tail );
+    prev_tail = v->maptrack_tail;
+    v->maptrack_tail = handle;
 
     /* 3. Update the old tail entry to point to the new entry. */
     write_atomic(&maptrack_entry(t, prev_tail).ref, handle);
@@ -650,7 +639,7 @@ get_maptrack_handle(
     struct grant_table *lgt)
 {
     struct vcpu          *curr = current;
-    unsigned int          i, head;
+    unsigned int          i;
     grant_handle_t        handle;
     struct grant_mapping *new_mt = NULL;
 
@@ -686,7 +675,7 @@ get_maptrack_handle(
             maptrack_entry(lgt, handle).ref = MAPTRACK_TAIL;
             curr->maptrack_tail = handle;
             if ( curr->maptrack_head == MAPTRACK_TAIL )
-                write_atomic(&curr->maptrack_head, handle);
+                curr->maptrack_head = handle;
             spin_unlock(&curr->maptrack_freelist_lock);
         }
         return steal_maptrack_handle(lgt, curr);
@@ -716,13 +705,10 @@ get_maptrack_handle(
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
index 3982167144c6..bd1cb08266d8 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -255,7 +255,10 @@ struct vcpu
     /* VCPU paused by system controller. */
     int              controller_pause_count;
 
-    /* Grant table map tracking. */
+    /*
+     * Grant table map tracking. The lock maptrack_freelist_lock protect
+     * the access to maptrack_head and maptrack_tail.
+     */
     spinlock_t       maptrack_freelist_lock;
     unsigned int     maptrack_head;
     unsigned int     maptrack_tail;
-- 
2.17.1


