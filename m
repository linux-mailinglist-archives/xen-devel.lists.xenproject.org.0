Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA32305559
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 09:15:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75791.136552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4fz0-0005YF-7j; Wed, 27 Jan 2021 08:15:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75791.136552; Wed, 27 Jan 2021 08:15:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4fz0-0005Xq-4b; Wed, 27 Jan 2021 08:15:22 +0000
Received: by outflank-mailman (input) for mailman id 75791;
 Wed, 27 Jan 2021 08:15:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4fyz-0005Xl-4N
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 08:15:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f85644b1-0360-4f28-9457-ad7b2787e0ed;
 Wed, 27 Jan 2021 08:15:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43194AD7F;
 Wed, 27 Jan 2021 08:15:14 +0000 (UTC)
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
X-Inumbo-ID: f85644b1-0360-4f28-9457-ad7b2787e0ed
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611735314; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJW/wMgZhZCk29BDYV5bG2rGCyC3dQXKAGN0v9QFQbc=;
	b=VFe0AdolORphdj2WdblAICjqD6xElm2R1NQ3LEbQViI+r2yTQc4XnoOqviH/NWHNnieA+Q
	oXbnWohNP3DiPk56WFzLNwhUnmoaYP7oFM7MRWxzVCMkADVwC05+1CzVcwvO0a337xo943
	7HyOUTGPTjCXaMisdwWeTwFk6olNLRk=
Subject: [PATCH v5 1/6] evtchn: use per-channel lock where possible
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
Message-ID: <081b2253-e445-4242-3f0c-0f2912412d43@suse.com>
Date: Wed, 27 Jan 2021 09:15:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Neither evtchn_status() nor domain_dump_evtchn_info() nor
flask_get_peer_sid() need to hold the per-domain lock - they all only
read a single channel's state (at a time, in the dump case).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -974,15 +974,16 @@ int evtchn_status(evtchn_status_t *statu
     if ( d == NULL )
         return -ESRCH;
 
-    spin_lock(&d->event_lock);
-
     if ( !port_is_valid(d, port) )
     {
-        rc = -EINVAL;
-        goto out;
+        rcu_unlock_domain(d);
+        return -EINVAL;
     }
 
     chn = evtchn_from_port(d, port);
+
+    evtchn_read_lock(chn);
+
     if ( consumer_is_xen(chn) )
     {
         rc = -EACCES;
@@ -1027,7 +1028,7 @@ int evtchn_status(evtchn_status_t *statu
     status->vcpu = chn->notify_vcpu_id;
 
  out:
-    spin_unlock(&d->event_lock);
+    evtchn_read_unlock(chn);
     rcu_unlock_domain(d);
 
     return rc;
@@ -1582,22 +1583,32 @@ void evtchn_move_pirqs(struct vcpu *v)
 static void domain_dump_evtchn_info(struct domain *d)
 {
     unsigned int port;
-    int irq;
 
     printk("Event channel information for domain %d:\n"
            "Polling vCPUs: {%*pbl}\n"
            "    port [p/m/s]\n", d->domain_id, d->max_vcpus, d->poll_mask);
 
-    spin_lock(&d->event_lock);
-
     for ( port = 1; port_is_valid(d, port); ++port )
     {
-        const struct evtchn *chn;
+        struct evtchn *chn;
         char *ssid;
 
+        if ( !(port & 0x3f) )
+            process_pending_softirqs();
+
         chn = evtchn_from_port(d, port);
+
+        if ( !evtchn_read_trylock(chn) )
+        {
+            printk("    %4u in flux\n", port);
+            continue;
+        }
+
         if ( chn->state == ECS_FREE )
+        {
+            evtchn_read_unlock(chn);
             continue;
+        }
 
         printk("    %4u [%d/%d/",
                port,
@@ -1607,26 +1618,49 @@ static void domain_dump_evtchn_info(stru
         printk("]: s=%d n=%d x=%d",
                chn->state, chn->notify_vcpu_id, chn->xen_consumer);
 
+        ssid = xsm_show_security_evtchn(d, chn);
+
         switch ( chn->state )
         {
         case ECS_UNBOUND:
             printk(" d=%d", chn->u.unbound.remote_domid);
             break;
+
         case ECS_INTERDOMAIN:
             printk(" d=%d p=%d",
                    chn->u.interdomain.remote_dom->domain_id,
                    chn->u.interdomain.remote_port);
             break;
-        case ECS_PIRQ:
-            irq = domain_pirq_to_irq(d, chn->u.pirq.irq);
-            printk(" p=%d i=%d", chn->u.pirq.irq, irq);
+
+        case ECS_PIRQ: {
+            unsigned int pirq = chn->u.pirq.irq;
+
+            /*
+             * The per-channel locks nest inside the per-domain one, so we
+             * can't acquire the latter without first letting go of the former.
+             */
+            evtchn_read_unlock(chn);
+            chn = NULL;
+            if ( spin_trylock(&d->event_lock) )
+            {
+                int irq = domain_pirq_to_irq(d, pirq);
+
+                spin_unlock(&d->event_lock);
+                printk(" p=%u i=%d", pirq, irq);
+            }
+            else
+                printk(" p=%u i=?", pirq);
             break;
+        }
+
         case ECS_VIRQ:
             printk(" v=%d", chn->u.virq);
             break;
         }
 
-        ssid = xsm_show_security_evtchn(d, chn);
+        if ( chn )
+            evtchn_read_unlock(chn);
+
         if (ssid) {
             printk(" Z=%s\n", ssid);
             xfree(ssid);
@@ -1634,8 +1668,6 @@ static void domain_dump_evtchn_info(stru
             printk("\n");
         }
     }
-
-    spin_unlock(&d->event_lock);
 }
 
 static void dump_evtchn_info(unsigned char key)
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -555,12 +555,13 @@ static int flask_get_peer_sid(struct xen
     struct evtchn *chn;
     struct domain_security_struct *dsec;
 
-    spin_lock(&d->event_lock);
-
     if ( !port_is_valid(d, arg->evtchn) )
-        goto out;
+        return -EINVAL;
 
     chn = evtchn_from_port(d, arg->evtchn);
+
+    evtchn_read_lock(chn);
+
     if ( chn->state != ECS_INTERDOMAIN )
         goto out;
 
@@ -573,7 +574,7 @@ static int flask_get_peer_sid(struct xen
     rv = 0;
 
  out:
-    spin_unlock(&d->event_lock);
+    evtchn_read_unlock(chn);
     return rv;
 }
 


