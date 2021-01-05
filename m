Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E74C32EAB8C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:10:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61928.109258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm6b-0000Ur-Ti; Tue, 05 Jan 2021 13:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61928.109258; Tue, 05 Jan 2021 13:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwm6b-0000UO-QJ; Tue, 05 Jan 2021 13:10:33 +0000
Received: by outflank-mailman (input) for mailman id 61928;
 Tue, 05 Jan 2021 13:10:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwm6Z-0000U1-Qe
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:10:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3209bdae-e740-48d3-b719-00c39f9615a1;
 Tue, 05 Jan 2021 13:10:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4F225AD0B;
 Tue,  5 Jan 2021 13:10:30 +0000 (UTC)
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
X-Inumbo-ID: 3209bdae-e740-48d3-b719-00c39f9615a1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609852230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7KEt2eAO57gYDz6fS7ggu7fXlsDVJkSylqA5Z3JwCgE=;
	b=FFUJ5TkCbnI0z71f1760x4zuhufDBpcOZnCjYbLmr5BmYIvYAFXysYJ4yGdwie1lDHAH0K
	QxEn69BaYE3d38JypCFBDR0bfxL2iY8lVV1XEXlrK+5CtIjfKh22Eq9r8Ub0cEfMf63r4X
	xeKxzqrJtL3wQRV8XcxDCN6MFSew4fY=
Subject: [PATCH v4 04/10] evtchn: don't call Xen consumer callback with
 per-channel lock held
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Message-ID: <e0179c46-face-4c64-9aeb-186be65ab77b@suse.com>
Date: Tue, 5 Jan 2021 14:10:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <cf0a1c24-0146-1017-7310-9536f2ed0ad1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While there don't look to be any problems with this right now, the lock
order implications from holding the lock can be very difficult to follow
(and may be easy to violate unknowingly). The present callbacks don't
(and no such callback should) have any need for the lock to be held.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Go back to v2.
v3: Drain callbacks before proceeding with closing. Re-base.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -767,9 +767,18 @@ int evtchn_send(struct domain *ld, unsig
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
+            evtchn_read_unlock(lchn);
+            fn(rv, rport);
+            rcu_unlock_domain(rd);
+            return 0;
+        }
+        evtchn_port_set_pending(rd, rchn->notify_vcpu_id, rchn);
         break;
     case ECS_IPI:
         evtchn_port_set_pending(ld, lchn->notify_vcpu_id, lchn);


