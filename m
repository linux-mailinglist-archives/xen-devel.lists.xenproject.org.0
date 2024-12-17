Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFA29F4D85
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 15:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859211.1271355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNYT5-0004Z2-FP; Tue, 17 Dec 2024 14:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859211.1271355; Tue, 17 Dec 2024 14:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNYT5-0004X8-Bf; Tue, 17 Dec 2024 14:22:35 +0000
Received: by outflank-mailman (input) for mailman id 859211;
 Tue, 17 Dec 2024 14:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Iy1x=TK=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tNYT4-0004FJ-DB
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 14:22:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b261a84-bc82-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 15:22:33 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9B7A211ED;
 Tue, 17 Dec 2024 14:22:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 86CC913AD8;
 Tue, 17 Dec 2024 14:22:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2S8JHyiJYWdeDgAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 17 Dec 2024 14:22:32 +0000
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
X-Inumbo-ID: 5b261a84-bc82-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734445353; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F439o4t2R3fnvlqguzaWDYG4TZOg2B8z0xYoJ3vcrPg=;
	b=WnI73Ul/HoxG5Q1fonTYeU/l/NiKSkDwQVJCE0ncwldXg4Qsjg3IEwFMo98bcr5YBdKcQQ
	DatJ4wCr3ubmaS0ExCoUk5lBqUXDl4Tp3FNDEpShAmR731Iq09ep5FTtY1Bd/yjb/eSM+t
	V37JjpfpNjS2/LML1dmfhtkTBkAaL5c=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1734445352; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F439o4t2R3fnvlqguzaWDYG4TZOg2B8z0xYoJ3vcrPg=;
	b=Qp3tRs2AA6G7R6XJcKmSGTPbVWITPk1X9pzefWrCqMyzlhXEhQvNkvKmuZiCLLGBdp5wQF
	/yl+A20RTeCEnZfLE4QyQZqI2LafuxCQxMnpXAuaTWg11oCFy9qBJBB7xArI9IpmT0U44u
	5wreJswpXt5FXHH8W02sOHHQTz3kISE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 2/5] xen: add bitmap to indicate per-domain state changes
Date: Tue, 17 Dec 2024 15:22:15 +0100
Message-ID: <20241217142218.24129-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217142218.24129-1-jgross@suse.com>
References: <20241217142218.24129-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Add a bitmap with one bit per possible domid indicating the respective
domain has changed its state (created, deleted, dying, crashed,
shutdown).

Registering the VIRQ_DOM_EXC event will result in setting the bits for
all existing domains and resetting all other bits.

As the usage of this bitmap is tightly coupled with the VIRQ_DOM_EXC
event, it is meant to be used only by a single consumer in the system,
just like the VIRQ_DOM_EXC event.

Resetting a bit will be done in a future patch.

This information is needed for Xenstore to keep track of all domains.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- use DOMID_FIRST_RESERVED instead of DOMID_MASK + 1 (Jan Beulich)
- use const (Jan Beulich)
- move call of domain_reset_states() into evtchn_bind_virq() (Jan Beulich)
- dynamically allocate dom_state_changed bitmap (Jan Beulich)
V3:
- use xvzalloc_array() (Jan Beulich)
- don't rename existing label (Jan Beulich)
V4:
- add __read_mostly (Jan Beulich)
- use __set_biz() (Jan Beulich)
- fix error handling in evtchn_bind_virq() (Jan Beulich)
V5:
- domain_init_states() may be called only if evtchn_bind_virq() has been
  called validly (Jan Beulich)
---
 xen/common/domain.c        | 60 ++++++++++++++++++++++++++++++++++++++
 xen/common/event_channel.c | 16 ++++++++++
 xen/include/xen/sched.h    |  3 ++
 3 files changed, 79 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index e33a0a5a21..87633b1f7b 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -34,6 +34,7 @@
 #include <xen/xenoprof.h>
 #include <xen/irq.h>
 #include <xen/argo.h>
+#include <xen/xvmalloc.h>
 #include <asm/p2m.h>
 #include <asm/processor.h>
 #include <public/sched.h>
@@ -138,6 +139,60 @@ bool __read_mostly vmtrace_available;
 
 bool __read_mostly vpmu_is_available;
 
+static DEFINE_SPINLOCK(dom_state_changed_lock);
+static unsigned long *__read_mostly dom_state_changed;
+
+int domain_init_states(void)
+{
+    const struct domain *d;
+    int rc = -ENOMEM;
+
+    spin_lock(&dom_state_changed_lock);
+
+    if ( dom_state_changed )
+        bitmap_zero(dom_state_changed, DOMID_FIRST_RESERVED);
+    else
+    {
+        dom_state_changed = xvzalloc_array(unsigned long,
+                                           BITS_TO_LONGS(DOMID_FIRST_RESERVED));
+        if ( !dom_state_changed )
+            goto unlock;
+    }
+
+    rcu_read_lock(&domlist_read_lock);
+
+    for_each_domain ( d )
+        __set_bit(d->domain_id, dom_state_changed);
+
+    rcu_read_unlock(&domlist_read_lock);
+
+    rc = 0;
+
+ unlock:
+    spin_unlock(&dom_state_changed_lock);
+
+    return rc;
+}
+
+void domain_deinit_states(void)
+{
+    spin_lock(&dom_state_changed_lock);
+
+    XVFREE(dom_state_changed);
+
+    spin_unlock(&dom_state_changed_lock);
+}
+
+static void domain_changed_state(const struct domain *d)
+{
+    spin_lock(&dom_state_changed_lock);
+
+    if ( dom_state_changed )
+        __set_bit(d->domain_id, dom_state_changed);
+
+    spin_unlock(&dom_state_changed_lock);
+}
+
 static void __domain_finalise_shutdown(struct domain *d)
 {
     struct vcpu *v;
@@ -152,6 +207,7 @@ static void __domain_finalise_shutdown(struct domain *d)
             return;
 
     d->is_shut_down = 1;
+    domain_changed_state(d);
     if ( (d->shutdown_code == SHUTDOWN_suspend) && d->suspend_evtchn )
         evtchn_send(d, d->suspend_evtchn);
     else
@@ -839,6 +895,7 @@ struct domain *domain_create(domid_t domid,
      */
     domlist_insert(d);
 
+    domain_changed_state(d);
     memcpy(d->handle, config->handle, sizeof(d->handle));
 
     return d;
@@ -1104,6 +1161,7 @@ int domain_kill(struct domain *d)
         /* Mem event cleanup has to go here because the rings 
          * have to be put before we call put_domain. */
         vm_event_cleanup(d);
+        domain_changed_state(d);
         put_domain(d);
         send_global_virq(VIRQ_DOM_EXC);
         /* fallthrough */
@@ -1293,6 +1351,8 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
 
     xfree(d->vcpu);
 
+    domain_changed_state(d);
+
     _domain_destroy(d);
 
     send_global_virq(VIRQ_DOM_EXC);
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 8db2ca4ba2..aa947efba7 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -469,6 +469,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
     struct domain *d = current->domain;
     int            virq = bind->virq, vcpu = bind->vcpu;
     int            rc = 0;
+    bool           deinit_if_err = false;
 
     if ( (virq < 0) || (virq >= ARRAY_SIZE(v->virq_to_evtchn)) )
         return -EINVAL;
@@ -494,6 +495,15 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
         goto out;
     }
 
+    if ( virq == VIRQ_DOM_EXC )
+    {
+        rc = domain_init_states();
+        if ( rc )
+            goto out;
+
+        deinit_if_err = true;
+    }
+
     port = rc = evtchn_get_port(d, port);
     if ( rc < 0 )
     {
@@ -527,6 +537,9 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
  out:
     write_unlock(&d->event_lock);
 
+    if ( rc && deinit_if_err )
+        domain_deinit_states();
+
     return rc;
 }
 
@@ -730,6 +743,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
         struct vcpu *v;
         unsigned long flags;
 
+        if ( chn1->u.virq == VIRQ_DOM_EXC )
+            domain_deinit_states();
+
         v = d1->vcpu[virq_is_global(chn1->u.virq) ? 0 : chn1->notify_vcpu_id];
 
         write_lock_irqsave(&v->virq_lock, flags);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 711668e028..16684bbaf9 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -800,6 +800,9 @@ void domain_resume(struct domain *d);
 
 int domain_soft_reset(struct domain *d, bool resuming);
 
+int domain_init_states(void);
+void domain_deinit_states(void);
+
 int vcpu_start_shutdown_deferral(struct vcpu *v);
 void vcpu_end_shutdown_deferral(struct vcpu *v);
 
-- 
2.43.0


