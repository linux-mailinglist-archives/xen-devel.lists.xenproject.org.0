Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07102EABA0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61947.109318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm8n-00016B-JN; Tue, 05 Jan 2021 13:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61947.109318; Tue, 05 Jan 2021 13:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm8n-00015j-Fm; Tue, 05 Jan 2021 13:12:49 +0000
Received: by outflank-mailman (input) for mailman id 61947;
 Tue, 05 Jan 2021 13:12:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwm8m-00015X-13
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:12:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bedf2ede-ad0b-4576-825b-85acd2643572;
 Tue, 05 Jan 2021 13:12:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0DD73AD0B;
 Tue,  5 Jan 2021 13:12:46 +0000 (UTC)
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
X-Inumbo-ID: bedf2ede-ad0b-4576-825b-85acd2643572
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609852366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SpxX4mM7UaE7DIJT+8KP+Q3gPOhRwR0g9uwFVjsXk70=;
	b=khjXkNwI6PJYcqEEAgnTtfuyU4bQg64gRx9mIqjGtNOzxK5jauiEQr1naFjBQym0DkNabe
	f5L5a/8bK6yl6n8MJfJX8veEnzlIeYcgX0s+0hYqP8Iu30TS/mG8TwhIFjcfL2bXfturYS
	59umq4qyDlKD8nslxj9YRQbZDVEbpIo=
Subject: [PATCH v4 08/10] evtchn: closing of ports doesn't need to hold both
 domains' event locks
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Message-ID: <495496e6-710d-bec0-cbd7-46c78f20fcf0@suse.com>
Date: Tue, 5 Jan 2021 14:12:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The local domain's lock is needed for the port freeing, but for the
remote side the per-channel lock is sufficient. Other logic then needs
rearranging, though, including the early dropping of both locks (and the
remote domain ref) in the ECS_PIRQ and ECS_VIRQ cases.

Note in particular that there is no real race with evtchn_bind_vcpu():
ECS_INTERDOMAIN and ECS_UNBOUND get treated identically there, and
evtchn_close() doesn't care about the notification vCPU ID.

Note also that we can't use double_evtchn_unlock() or
evtchn_write_unlock() when releasing locks to cover for possible races.
See the respective code comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -605,15 +605,15 @@ static long evtchn_bind_pirq(evtchn_bind
 int evtchn_close(struct domain *d1, int port1, bool guest)
 {
     struct domain *d2 = NULL;
-    struct evtchn *chn1 = _evtchn_from_port(d1, port1), *chn2;
+    struct evtchn *chn1 = _evtchn_from_port(d1, port1), *chn2 = NULL;
     long           rc = 0;
 
     if ( !chn1 )
         return -EINVAL;
 
- again:
     write_lock(&d1->event_lock);
 
+ again:
     /* Guest cannot close a Xen-attached event channel. */
     if ( unlikely(consumer_is_xen(chn1)) && guest )
     {
@@ -634,6 +634,22 @@ int evtchn_close(struct domain *d1, int
     case ECS_PIRQ: {
         struct pirq *pirq = pirq_info(d1, chn1->u.pirq.irq);
 
+        /*
+         * We don't require the per-channel lock here, so in case a race
+         * happened on the interdomain path below better release both.
+         */
+        if ( unlikely(chn2) )
+        {
+            /*
+             * See evtchn_write_unlock() vs plain write_unlock() comment in
+             * ECS_INTERDOMAIN handling below.
+             */
+            write_unlock(&chn1->lock);
+            write_unlock(&chn2->lock);
+            put_domain(d2);
+            chn2 = NULL;
+        }
+
         if ( pirq )
         {
             if ( !is_hvm_domain(d1) )
@@ -653,6 +669,22 @@ int evtchn_close(struct domain *d1, int
         struct vcpu *v;
         unsigned long flags;
 
+        /*
+         * The per-channel locks nest inside the vIRQ ones, so we must release
+         * them if a race happened on the interdomain path below.
+         */
+        if ( unlikely(chn2) )
+        {
+            /*
+             * See evtchn_write_unlock() vs plain write_unlock() comment in
+             * ECS_INTERDOMAIN handling below.
+             */
+            write_unlock(&chn1->lock);
+            write_unlock(&chn2->lock);
+            put_domain(d2);
+            chn2 = NULL;
+        }
+
         v = d1->vcpu[virq_is_global(chn1->u.virq) ? 0 : chn1->notify_vcpu_id];
 
         write_lock_irqsave(&v->virq_lock, flags);
@@ -669,63 +701,87 @@ int evtchn_close(struct domain *d1, int
     case ECS_INTERDOMAIN:
         if ( d2 == NULL )
         {
-            d2 = chn1->u.interdomain.remote_dom;
+            evtchn_write_lock(chn1);
 
-            /* If we unlock d1 then we could lose d2. Must get a reference. */
-            if ( unlikely(!get_domain(d2)) )
-                BUG();
-
-            if ( d1 < d2 )
-                write_lock(&d2->event_lock);
-            else if ( d1 != d2 )
-            {
-                write_unlock(&d1->event_lock);
-                write_lock(&d2->event_lock);
-                goto again;
-            }
+            if ( chn1->state == ECS_INTERDOMAIN )
+                d2 = chn1->u.interdomain.remote_dom;
+            else
+                /* See comment further down. */
+                write_unlock(&chn1->lock);
         }
-        else if ( d2 != chn1->u.interdomain.remote_dom )
+
+        if ( d2 != chn1->u.interdomain.remote_dom )
         {
             /*
-             * We can only get here if the port was closed and re-bound after
-             * unlocking d1 but before locking d2 above. We could retry but
-             * it is easier to return the same error as if we had seen the
-             * port in ECS_FREE. It must have passed through that state for
-             * us to end up here, so it's a valid error to return.
+             * We can only get here if the port was closed and re-bound
+             * - before locking chn1 or
+             * - after unlocking chn1 but before locking both channels
+             * above.  We could retry but it is easier to return the same error
+             * as if we had seen the port in ECS_FREE.  It must have passed
+             * through that state for us to end up here, so it's a valid error
+             * to return.
              */
+            if ( d2 && !chn2 )
+                write_unlock(&chn1->lock);
             rc = -EINVAL;
             goto out;
         }
 
-        chn2 = _evtchn_from_port(d2, chn1->u.interdomain.remote_port);
-        BUG_ON(!chn2);
-        BUG_ON(chn2->state != ECS_INTERDOMAIN);
-        BUG_ON(chn2->u.interdomain.remote_dom != d1);
+        if ( !chn2 )
+        {
+            /* If we unlock chn1 then we could lose d2. Must get a reference. */
+            if ( unlikely(!get_domain(d2)) )
+                BUG();
 
-        double_evtchn_lock(chn1, chn2);
+            chn2 = _evtchn_from_port(d2, chn1->u.interdomain.remote_port);
+            BUG_ON(!chn2);
 
-        evtchn_free(d1, chn1);
+            if ( chn1 > chn2 )
+            {
+                /*
+                 * Cannot use evtchn_write_unlock() here, as its assertion
+                 * likely won't hold.  However, a race - as per the comment
+                 * below - indicates a transition through ECS_FREE must
+                 * have occurred, so the assumptions by users of
+                 * evtchn_read_trylock() still hold (i.e. they're similarly
+                 * fine to bail).
+                 */
+                write_unlock(&chn1->lock);
+                double_evtchn_lock(chn2, chn1);
+                goto again;
+            }
+
+            evtchn_write_lock(chn2);
+        }
+
+        BUG_ON(chn2->state != ECS_INTERDOMAIN);
+        BUG_ON(chn2->u.interdomain.remote_dom != d1);
 
         chn2->state = ECS_UNBOUND;
         chn2->u.unbound.remote_domid = d1->domain_id;
 
-        double_evtchn_unlock(chn1, chn2);
-
-        goto out;
+        break;
 
     default:
         BUG();
     }
 
-    evtchn_write_lock(chn1);
+    if ( !chn2 )
+        evtchn_write_lock(chn1);
     evtchn_free(d1, chn1);
-    evtchn_write_unlock(chn1);
+    if ( !chn2 )
+        evtchn_write_unlock(chn1);
 
  out:
-    if ( d2 != NULL )
+    if ( chn2 )
     {
-        if ( d1 != d2 )
-            write_unlock(&d2->event_lock);
+        /*
+         * See evtchn_write_unlock() vs plain write_unlock() comment in
+         * ECS_INTERDOMAIN handling above.  In principle we could use
+         * double_evtchn_unlock() on the ECS_INTERDOMAIN success path.
+         */
+        write_unlock(&chn1->lock);
+        write_unlock(&chn2->lock);
         put_domain(d2);
     }
 


