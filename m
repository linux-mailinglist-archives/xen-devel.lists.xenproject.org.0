Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 745AE2C0A6B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:28:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34282.65213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBtH-0007cV-Sh; Mon, 23 Nov 2020 13:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34282.65213; Mon, 23 Nov 2020 13:28:23 +0000
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
	id 1khBtH-0007c4-P8; Mon, 23 Nov 2020 13:28:23 +0000
Received: by outflank-mailman (input) for mailman id 34282;
 Mon, 23 Nov 2020 13:28:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBtH-0007bu-10
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:28:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4042d843-f1e3-460f-8058-9a1bce6b1987;
 Mon, 23 Nov 2020 13:28:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9301EAC2E;
 Mon, 23 Nov 2020 13:28:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBtH-0007bu-10
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:28:23 +0000
X-Inumbo-ID: 4042d843-f1e3-460f-8058-9a1bce6b1987
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4042d843-f1e3-460f-8058-9a1bce6b1987;
	Mon, 23 Nov 2020 13:28:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606138101; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iIpBVVXINJLxyaNZ9rqCJ2+moiWnSKhQgi3f+gHmkr8=;
	b=EgFofeHvZq1Fx66zNAN6E4Q4VugkMnnfcWFLj8KxcOTmhCeOukza8WnCGFLzVnKTFcm/ir
	zAEEJF6COD36UNpZwf58ys3aWyZ9/KswF/a4pii1PwWvM20Qm0dvqAHlcuRxBNbCEvUHdT
	+3Akux17DQg3KI22vTYdsBRKKcrarW0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9301EAC2E;
	Mon, 23 Nov 2020 13:28:21 +0000 (UTC)
Subject: [PATCH v3 2/5] evtchn: avoid access tearing for ->virq_to_evtchn[]
 accesses
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
Message-ID: <ce6ce543-d57a-4111-2e66-871c4f4633a8@suse.com>
Date: Mon, 23 Nov 2020 14:28:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Use {read,write}_atomic() to exclude any eventualities, in particular
observing that accesses aren't all happening under a consistent lock.

Requested-by: Julien Grall <julien@xen.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -446,7 +446,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t
 
     spin_lock(&d->event_lock);
 
-    if ( v->virq_to_evtchn[virq] != 0 )
+    if ( read_atomic(&v->virq_to_evtchn[virq]) )
         ERROR_EXIT(-EEXIST);
 
     if ( port != 0 )
@@ -474,7 +474,8 @@ int evtchn_bind_virq(evtchn_bind_virq_t
 
     evtchn_write_unlock(chn);
 
-    v->virq_to_evtchn[virq] = bind->port = port;
+    bind->port = port;
+    write_atomic(&v->virq_to_evtchn[virq], port);
 
  out:
     spin_unlock(&d->event_lock);
@@ -660,9 +661,9 @@ int evtchn_close(struct domain *d1, int
     case ECS_VIRQ:
         for_each_vcpu ( d1, v )
         {
-            if ( v->virq_to_evtchn[chn1->u.virq] != port1 )
+            if ( read_atomic(&v->virq_to_evtchn[chn1->u.virq]) != port1 )
                 continue;
-            v->virq_to_evtchn[chn1->u.virq] = 0;
+            write_atomic(&v->virq_to_evtchn[chn1->u.virq], 0);
             spin_barrier(&v->virq_lock);
         }
         break;
@@ -801,7 +802,7 @@ bool evtchn_virq_enabled(const struct vc
     if ( virq_is_global(virq) && v->vcpu_id )
         v = domain_vcpu(v->domain, 0);
 
-    return v->virq_to_evtchn[virq];
+    return read_atomic(&v->virq_to_evtchn[virq]);
 }
 
 void send_guest_vcpu_virq(struct vcpu *v, uint32_t virq)
@@ -814,7 +815,7 @@ void send_guest_vcpu_virq(struct vcpu *v
 
     spin_lock_irqsave(&v->virq_lock, flags);
 
-    port = v->virq_to_evtchn[virq];
+    port = read_atomic(&v->virq_to_evtchn[virq]);
     if ( unlikely(port == 0) )
         goto out;
 
@@ -843,7 +844,7 @@ void send_guest_global_virq(struct domai
 
     spin_lock_irqsave(&v->virq_lock, flags);
 
-    port = v->virq_to_evtchn[virq];
+    port = read_atomic(&v->virq_to_evtchn[virq]);
     if ( unlikely(port == 0) )
         goto out;
 


