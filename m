Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A426E2C0A6A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:28:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34279.65200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBsz-0007Vz-Ie; Mon, 23 Nov 2020 13:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34279.65200; Mon, 23 Nov 2020 13:28:05 +0000
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
	id 1khBsz-0007Va-Er; Mon, 23 Nov 2020 13:28:05 +0000
Received: by outflank-mailman (input) for mailman id 34279;
 Mon, 23 Nov 2020 13:28:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBsx-0007VT-8a
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:28:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 382e91eb-a16f-4163-8d26-460ff8fdb498;
 Mon, 23 Nov 2020 13:28:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75DD1ABCE;
 Mon, 23 Nov 2020 13:28:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBsx-0007VT-8a
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:28:03 +0000
X-Inumbo-ID: 382e91eb-a16f-4163-8d26-460ff8fdb498
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 382e91eb-a16f-4163-8d26-460ff8fdb498;
	Mon, 23 Nov 2020 13:28:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606138081; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wx22CUcVcpFAZagcGFpuRTrgWXF49Q2PbjSMmqNqzXk=;
	b=u36KuH/KcLIsybJGTvI1VETWVGHZMWqssoCH7PVsnAJFYaYQYvB9OT9Ubm/Y9HLyEUZFQG
	9exaNxmqNQ1bQcraK2BBsoxqaG3FPMLqWQ4vFjZ4SW1h2wghx93moXxYLepTpcT4+VE5oZ
	0Zb5zf7mAwu6f0mi6zfJQB1yHR5l5Cs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 75DD1ABCE;
	Mon, 23 Nov 2020 13:28:01 +0000 (UTC)
Subject: [PATCH v3 1/5] evtchn: drop acquiring of per-channel lock from
 send_guest_{global,vcpu}_virq()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
Message-ID: <d709a9c3-dbe2-65c6-2c2f-6a12f486335d@suse.com>
Date: Mon, 23 Nov 2020 14:28:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
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
v3: Re-base.
v2: New.

--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -809,7 +809,6 @@ void send_guest_vcpu_virq(struct vcpu *v
     unsigned long flags;
     int port;
     struct domain *d;
-    struct evtchn *chn;
 
     ASSERT(!virq_is_global(virq));
 
@@ -820,12 +819,7 @@ void send_guest_vcpu_virq(struct vcpu *v
         goto out;
 
     d = v->domain;
-    chn = evtchn_from_port(d, port);
-    if ( evtchn_read_trylock(chn) )
-    {
-        evtchn_port_set_pending(d, v->vcpu_id, chn);
-        evtchn_read_unlock(chn);
-    }
+    evtchn_port_set_pending(d, v->vcpu_id, evtchn_from_port(d, port));
 
  out:
     spin_unlock_irqrestore(&v->virq_lock, flags);
@@ -854,11 +848,7 @@ void send_guest_global_virq(struct domai
         goto out;
 
     chn = evtchn_from_port(d, port);
-    if ( evtchn_read_trylock(chn) )
-    {
-        evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
-        evtchn_read_unlock(chn);
-    }
+    evtchn_port_set_pending(d, chn->notify_vcpu_id, chn);
 
  out:
     spin_unlock_irqrestore(&v->virq_lock, flags);
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -192,9 +192,16 @@ int evtchn_reset(struct domain *d, bool
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


