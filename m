Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE8E2EAB89
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61918.109222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm5A-0007pb-Or; Tue, 05 Jan 2021 13:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61918.109222; Tue, 05 Jan 2021 13:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm5A-0007ot-Ko; Tue, 05 Jan 2021 13:09:04 +0000
Received: by outflank-mailman (input) for mailman id 61918;
 Tue, 05 Jan 2021 13:09:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwm59-0007oo-3v
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:09:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c64e7731-4547-412b-8b8e-636dbcfdc028;
 Tue, 05 Jan 2021 13:09:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5641DAD19;
 Tue,  5 Jan 2021 13:09:01 +0000 (UTC)
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
X-Inumbo-ID: c64e7731-4547-412b-8b8e-636dbcfdc028
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609852141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yMZvz5Gxp0c7q1LbaBOtpEcti2EjPHh4ZP85frCbNn0=;
	b=Q3tyEQOjMfSYiZzgdiCwysTMW4ZLSrpzMqWkKX7+zUeM4dfI34EX4rGlBtfodpPxHBriNN
	K5fDJPVbsQWVXQ4JTE/Ae5J1bXuS+CYvdehJagpVg6R1ordX4+Mh3zQr6Ad1b5NO9SrH8C
	uc0bDUFzqmBvRfXOSokavZltx1Gvo58=
Subject: [PATCH v4 01/10] evtchn: use per-channel lock where possible
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Message-ID: <e03cb246-c08b-5977-9137-a38974364445@suse.com>
Date: Tue, 5 Jan 2021 14:09:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
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
@@ -968,15 +968,16 @@ int evtchn_status(evtchn_status_t *statu
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
@@ -1021,7 +1022,7 @@ int evtchn_status(evtchn_status_t *statu
     status->vcpu = chn->notify_vcpu_id;
 
  out:
-    spin_unlock(&d->event_lock);
+    evtchn_read_unlock(chn);
     rcu_unlock_domain(d);
 
     return rc;
@@ -1576,22 +1577,32 @@ void evtchn_move_pirqs(struct vcpu *v)
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
@@ -1601,26 +1612,49 @@ static void domain_dump_evtchn_info(stru
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
@@ -1628,8 +1662,6 @@ static void domain_dump_evtchn_info(stru
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
 


