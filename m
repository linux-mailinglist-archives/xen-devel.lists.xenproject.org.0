Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A37B293E4B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 16:10:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9661.25409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUsL6-0001qu-I6; Tue, 20 Oct 2020 14:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9661.25409; Tue, 20 Oct 2020 14:10:12 +0000
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
	id 1kUsL6-0001qV-E2; Tue, 20 Oct 2020 14:10:12 +0000
Received: by outflank-mailman (input) for mailman id 9661;
 Tue, 20 Oct 2020 14:10:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUsL5-0001qB-4T
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:10:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee25d3e3-9aa1-48b8-ba7d-0f64b2da3bad;
 Tue, 20 Oct 2020 14:10:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 763AEAC6A;
 Tue, 20 Oct 2020 14:10:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUsL5-0001qB-4T
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 14:10:11 +0000
X-Inumbo-ID: ee25d3e3-9aa1-48b8-ba7d-0f64b2da3bad
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ee25d3e3-9aa1-48b8-ba7d-0f64b2da3bad;
	Tue, 20 Oct 2020 14:10:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603203009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iO8TnTaJzqrD1+b+3oC7Ha3LDiV5w9SikaRO6jqv6D8=;
	b=m+cpOEI8+QL1qSwSA+pUH3g+065t4UMNLiXsXQZfVsSuQPB2/p5GPg3eh0uDqLpgKt0qrn
	8prfLLpi5eJrPMxWw3O7z004Ix+Z1IN3GVfGuePr0NWjK3iHNDBRa3pRsPCFcY2lMExyQM
	sa6IlUfPwkFIllZyYWME4leEOkDm8cQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 763AEAC6A;
	Tue, 20 Oct 2020 14:10:09 +0000 (UTC)
Subject: [PATCH v2 5/8] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Message-ID: <53eb30ca-9b3f-0ef4-bc90-e1c196b716b3@suse.com>
Date: Tue, 20 Oct 2020 16:10:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The per-vCPU virq_lock, which is being held anyway, together with there
not being any call to evtchn_port_set_pending() when v->virq_to_evtchn[]
is zero, provide sufficient guarantees. Undo the lock addition done for
XSA-343 (commit e045199c7c9c "evtchn: address races with
evtchn_reset()"). Update the description next to struct evtchn_port_ops
accordingly.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -794,7 +794,6 @@ void send_guest_vcpu_virq(struct vcpu *v
     unsigned long flags;
     int port;
     struct domain *d;
-    struct evtchn *chn;
 
     ASSERT(!virq_is_global(virq));
 
@@ -805,10 +804,7 @@ void send_guest_vcpu_virq(struct vcpu *v
         goto out;
 
     d = v->domain;
-    chn = evtchn_from_port(d, port);
-    spin_lock(&chn->lock);
-    evtchn_port_set_pending(d, v->vcpu_id, chn);
-    spin_unlock(&chn->lock);
+    evtchn_port_set_pending(d, v->vcpu_id, evtchn_from_port(d, port));
 
  out:
     spin_unlock_irqrestore(&v->virq_lock, flags);
@@ -837,9 +833,7 @@ void send_guest_global_virq(struct domai
         goto out;
 
     chn = evtchn_from_port(d, port);
-    spin_lock(&chn->lock);
     evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
-    spin_unlock(&chn->lock);
 
  out:
     spin_unlock_irqrestore(&v->virq_lock, flags);
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -177,9 +177,16 @@ int evtchn_reset(struct domain *d, bool
  * Low-level event channel port ops.
  *
  * All hooks have to be called with a lock held which prevents the channel
- * from changing state. This may be the domain event lock, the per-channel
- * lock, or in the case of sending interdomain events also the other side's
- * per-channel lock. Exceptions apply in certain cases for the PV shim.
+ * from changing state. This may be
+ * - the domain event lock,
+ * - the per-channel lock,
+ * - in the case of sending interdomain events the other side's per-channel
+ *   lock,
+ * - in the case of sending non-global vIRQ-s the per-vCPU virq_lock (in
+ *   combination with the ordering enforced through how the vCPU's
+ *   virq_to_evtchn[] gets updated),
+ * - in the case of sending global vIRQ-s vCPU 0's virq_lock.
+ * Exceptions apply in certain cases for the PV shim.
  */
 struct evtchn_port_ops {
     void (*init)(struct domain *d, struct evtchn *evtchn);


