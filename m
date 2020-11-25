Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4C42C3E72
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 11:51:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37537.69969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khsOa-0007D9-A5; Wed, 25 Nov 2020 10:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37537.69969; Wed, 25 Nov 2020 10:51:32 +0000
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
	id 1khsOa-0007CQ-5r; Wed, 25 Nov 2020 10:51:32 +0000
Received: by outflank-mailman (input) for mailman id 37537;
 Wed, 25 Nov 2020 10:51:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khsOY-00078P-Nr
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 10:51:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15b0d67e-5c71-4322-8fde-7569aaecc862;
 Wed, 25 Nov 2020 10:51:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76C72AC75;
 Wed, 25 Nov 2020 10:51:24 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khsOY-00078P-Nr
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 10:51:30 +0000
X-Inumbo-ID: 15b0d67e-5c71-4322-8fde-7569aaecc862
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 15b0d67e-5c71-4322-8fde-7569aaecc862;
	Wed, 25 Nov 2020 10:51:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606301484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Eg0Mg6cy2GDmCEZCPsyzzLpzDv8NGg/SYGtCOknElU=;
	b=cgFuGboLJhsfeevFj/HKdsBzy4EggHI0/RUa/dgCg+KFK0vTqHrgDpzoutlWcCrpc52wp8
	aDaFoZI1wZG6f/t9tuXiLtoikpkuLPJcHJgpgSeMuEYNkdT3tageJPoaRJO41RLawcQKag
	5ddCqdgXX4vlvvOgkDefvEZeCNoc7CU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 76C72AC75;
	Wed, 25 Nov 2020 10:51:24 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v8 1/3] xen/events: modify struct evtchn layout
Date: Wed, 25 Nov 2020 11:51:20 +0100
Message-Id: <20201125105122.3650-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201125105122.3650-1-jgross@suse.com>
References: <20201125105122.3650-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to avoid latent races when updating an event channel put
xen_consumer and pending fields in different bytes. This is no problem
right now, but especially the pending indicator isn't used only when
initializing an event channel (unlike xen_consumer), so any future
addition to this byte would need to be done with a potential race kept
in mind.

At the same time move some other fields around to have less implicit
paddings and to keep related fields more closely together.

Finally switch struct evtchn to no longer use fixed sized types where
not needed.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V7:
- new patch

V8:
- retain xen_consumer to be a bitfield (Jan Beulich)
- switch to non fixed sizes types

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/event_fifo.c |  4 ++--
 xen/include/xen/sched.h | 34 ++++++++++++++++++----------------
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/xen/common/event_fifo.c b/xen/common/event_fifo.c
index 79090c04ca..f39e61105f 100644
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -200,7 +200,7 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
      */
     if ( unlikely(!word) )
     {
-        evtchn->pending = 1;
+        evtchn->pending = true;
         return;
     }
 
@@ -535,7 +535,7 @@ static void setup_ports(struct domain *d, unsigned int prev_evtchns)
         evtchn = evtchn_from_port(d, port);
 
         if ( guest_test_bit(d, port, &shared_info(d, evtchn_pending)) )
-            evtchn->pending = 1;
+            evtchn->pending = true;
 
         evtchn_fifo_set_priority(d, evtchn, EVTCHN_FIFO_PRIORITY_DEFAULT);
     }
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index a345cc01f8..7afbae7dd1 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -93,31 +93,33 @@ struct evtchn
 #define ECS_PIRQ         4 /* Channel is bound to a physical IRQ line.       */
 #define ECS_VIRQ         5 /* Channel is bound to a virtual IRQ line.        */
 #define ECS_IPI          6 /* Channel is bound to a virtual IPI line.        */
-    u8  state;             /* ECS_* */
-    u8  xen_consumer:XEN_CONSUMER_BITS; /* Consumer in Xen if nonzero */
-    u8  pending:1;
-    u16 notify_vcpu_id;    /* VCPU for local delivery notification */
-    u32 port;
+    unsigned char state;   /* ECS_* */
+#ifndef NDEBUG
+    unsigned char old_state; /* State when taking lock in write mode. */
+#endif
+    unsigned char xen_consumer:XEN_CONSUMER_BITS; /* Consumer in Xen if != 0 */
+    unsigned int port;
     union {
         struct {
             domid_t remote_domid;
-        } unbound;     /* state == ECS_UNBOUND */
+        } unbound;          /* state == ECS_UNBOUND */
         struct {
             evtchn_port_t  remote_port;
             struct domain *remote_dom;
-        } interdomain; /* state == ECS_INTERDOMAIN */
+        } interdomain;      /* state == ECS_INTERDOMAIN */
         struct {
-            u32            irq;
+            unsigned int   irq;
             evtchn_port_t  next_port;
             evtchn_port_t  prev_port;
-        } pirq;        /* state == ECS_PIRQ */
-        u16 virq;      /* state == ECS_VIRQ */
+        } pirq;             /* state == ECS_PIRQ */
+        unsigned int virq;  /* state == ECS_VIRQ */
     } u;
-    u8 priority;
-#ifndef NDEBUG
-    u8 old_state;      /* State when taking lock in write mode. */
-#endif
-    u32 fifo_lastq;    /* Data for fifo events identifying last queue. */
+
+    bool pending;                  /* FIFO event channels only. */
+    unsigned char priority;        /* FIFO event channels only. */
+    unsigned short notify_vcpu_id; /* VCPU for local delivery notification */
+    uint32_t fifo_lastq;           /* Data for identifying last queue. */
+
 #ifdef CONFIG_XSM
     union {
 #ifdef XSM_NEED_GENERIC_EVTCHN_SSID
@@ -133,7 +135,7 @@ struct evtchn
          * allocations, and on 64-bit platforms with only FLASK enabled,
          * reduces the size of struct evtchn.
          */
-        u32 flask_sid;
+        uint32_t flask_sid;
 #endif
     } ssid;
 #endif
-- 
2.26.2


