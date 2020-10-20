Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219DA293E63
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 16:13:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9675.25445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUsOW-0002P2-NJ; Tue, 20 Oct 2020 14:13:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9675.25445; Tue, 20 Oct 2020 14:13:44 +0000
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
	id 1kUsOW-0002Od-Jy; Tue, 20 Oct 2020 14:13:44 +0000
Received: by outflank-mailman (input) for mailman id 9675;
 Tue, 20 Oct 2020 14:13:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUsOU-0002OV-Vx
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:13:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6f4aeb2-f601-4a71-b4be-12c05831e4f9;
 Tue, 20 Oct 2020 14:13:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7BE94AF72;
 Tue, 20 Oct 2020 14:13:41 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUsOU-0002OV-Vx
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:13:43 +0000
X-Inumbo-ID: f6f4aeb2-f601-4a71-b4be-12c05831e4f9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f6f4aeb2-f601-4a71-b4be-12c05831e4f9;
	Tue, 20 Oct 2020 14:13:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603203221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zoh/7Mty3v+n/dVbOdwhyCYcVSC+WmCqXrglut1Q6/8=;
	b=p4jvDGv3U00P7Soo1kqzkIqdMYRpUWl8spkt+u1lNH5V7V7JIhsCJ3/TZttd8JzUChuUao
	x8ZUDHGoKSl705K4LE9nPyTZvPL1wKeffrIMt+nsc38VoGb0NKkQCVZ1ug101RpGndhTIC
	KHfE4gE92/RlzDdq7+3O4mif5goXtlA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7BE94AF72;
	Tue, 20 Oct 2020 14:13:41 +0000 (UTC)
Subject: [PATCH RFC v2 8/8] evtchn: don't call Xen consumer callback with
 per-channel lock held
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Message-ID: <247f0d77-9447-47d0-4fa6-8e17b3e6a6de@suse.com>
Date: Tue, 20 Oct 2020 16:13:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While there don't look to be any problems with this right now, the lock
order implications from holding the lock can be very difficult to follow
(and may be easy to violate unknowingly). The present callbacks don't
(and no such callback should) have any need for the lock to be held.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TODO: vm_event_disable() frees the structures used by respective
      callbacks - need to either use call_rcu() for freeing, or maintain
      a count of in-progress calls, for evtchn_close() to wait to drop
      to zero before dropping the lock / returning.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -763,9 +763,18 @@ int evtchn_send(struct domain *ld, unsig
         rport = lchn->u.interdomain.remote_port;
         rchn  = evtchn_from_port(rd, rport);
         if ( consumer_is_xen(rchn) )
-            xen_notification_fn(rchn)(rd->vcpu[rchn->notify_vcpu_id], rport);
-        else
-            evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
+        {
+            /* Don't keep holding the lock for the call below. */
+            xen_event_channel_notification_t fn = xen_notification_fn(rchn);
+            struct vcpu *rv = rd->vcpu[rchn->notify_vcpu_id];
+
+            rcu_lock_domain(rd);
+            spin_unlock_irqrestore(&lchn->lock, flags);
+            fn(rv, rport);
+            rcu_unlock_domain(rd);
+            return 0;
+        }
+        evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
         break;
     case ECS_IPI:
         evtchn_port_set_pending(ld, lchn->notify_vcpu_id, lchn);


