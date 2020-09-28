Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C9027AC4F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 12:57:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMqqG-0004Le-6W; Mon, 28 Sep 2020 10:57:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMqqE-0004LL-Nc
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 10:57:10 +0000
X-Inumbo-ID: cafb11e5-e6f6-47d6-9e94-9fe138bc1c27
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cafb11e5-e6f6-47d6-9e94-9fe138bc1c27;
 Mon, 28 Sep 2020 10:57:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601290629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oeCJCQsWUnJ0xjjxNtZRmFI9KK964X3ka2Xyj60DtEQ=;
 b=bnti2IOtyM2W4WfYf/Prhu45p6nr9u8vrTkjwV+0qMWV+UF24V2gFejm1p5coOhMYc2GlY
 oZfJ0YtwbDGj2471BPS7ETTlBtfblEp+RNmAsrouBQaOb4aGgSlY5v+LYyLvjsH67xAtrz
 jIaf+nJEqYkOP9vJJ8hfmx3wZZNIePM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 229ADACAC;
 Mon, 28 Sep 2020 10:57:09 +0000 (UTC)
Subject: [PATCH 03/12] evtchn: don't call Xen consumer callback with
 per-channel lock held
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Message-ID: <1bf3959d-c097-f8ef-cce4-3a325d0984c4@suse.com>
Date: Mon, 28 Sep 2020 12:57:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While there don't look to be any problems with this right now, the lock
order implications from holding the lock can be very difficult to follow
(and may be easy to violate unknowingly). The present callbacks don't
(and no such callback should) have any need for the lock to be held.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -746,9 +746,18 @@ int evtchn_send(struct domain *ld, unsig
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


