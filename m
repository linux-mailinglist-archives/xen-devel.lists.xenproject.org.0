Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 625EEA2704A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 12:34:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881275.1291428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHCI-0002Fu-Uw; Tue, 04 Feb 2025 11:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881275.1291428; Tue, 04 Feb 2025 11:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHCI-0002DZ-RG; Tue, 04 Feb 2025 11:34:30 +0000
Received: by outflank-mailman (input) for mailman id 881275;
 Tue, 04 Feb 2025 11:34:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ljwx=U3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1tfHCH-0001ti-A8
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 11:34:29 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe684848-e2eb-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 12:34:28 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 509871F365;
 Tue,  4 Feb 2025 11:34:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EFF1C1393E;
 Tue,  4 Feb 2025 11:34:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jFznOEP7oWe1LAAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 04 Feb 2025 11:34:27 +0000
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
X-Inumbo-ID: fe684848-e2eb-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738668868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCI0yUfpglI1FkeTVvT0RLHqgSFXKRTCwCcslT6+VHs=;
	b=mPFYROWFexCzpuBHQO/4cTuT7ZRs+3YgBNaOXbb7sK1RgZTOMzaR9ewSAJTqeyNc8gyQae
	XQM6bfWU5ou5LH+nfY1zQT4uuwPw0jR73yzOps0zrxI6zsGwOvFMCwtdtc1Mf2zQJST704
	Xzc4tWcBXNr49mzMmpEk31xnzgXDO8Q=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=mPFYROWF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1738668868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCI0yUfpglI1FkeTVvT0RLHqgSFXKRTCwCcslT6+VHs=;
	b=mPFYROWFexCzpuBHQO/4cTuT7ZRs+3YgBNaOXbb7sK1RgZTOMzaR9ewSAJTqeyNc8gyQae
	XQM6bfWU5ou5LH+nfY1zQT4uuwPw0jR73yzOps0zrxI6zsGwOvFMCwtdtc1Mf2zQJST704
	Xzc4tWcBXNr49mzMmpEk31xnzgXDO8Q=
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
Subject: [PATCH v8 3/9] xen: add bitmap to indicate per-domain state changes
Date: Tue,  4 Feb 2025 12:34:01 +0100
Message-ID: <20250204113407.16839-4-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250204113407.16839-1-jgross@suse.com>
References: <20250204113407.16839-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 509871F365
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO

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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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
- use __set_bit() (Jan Beulich)
- fix error handling in evtchn_bind_virq() (Jan Beulich)
V5:
- domain_init_states() may be called only if evtchn_bind_virq() has been
  called validly (Jan Beulich)
V6:
- guard dom_state_changed bitmap with d->event_lock (Jan Beulich)
V7:
- still use __set_bit() at one place (Jan Beulich)
- use rw_is_write_locked_by_me() (Jan Beulich)
---
 xen/common/domain.c        | 51 ++++++++++++++++++++++++++++++++++++++
 xen/common/event_channel.c | 31 +++++++++++++++++++++++
 xen/include/xen/event.h    |  4 +++
 xen/include/xen/sched.h    |  3 +++
 4 files changed, 89 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 0c4cc77111..1c1d6da885 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -35,6 +35,7 @@
 #include <xen/irq.h>
 #include <xen/argo.h>
 #include <xen/llc-coloring.h>
+#include <xen/xvmalloc.h>
 #include <asm/p2m.h>
 #include <asm/processor.h>
 #include <public/sched.h>
@@ -139,6 +140,51 @@ bool __read_mostly vmtrace_available;
 
 bool __read_mostly vpmu_is_available;
 
+static unsigned long *__read_mostly dom_state_changed;
+
+int domain_init_states(void)
+{
+    const struct domain *d;
+
+    ASSERT(!dom_state_changed);
+    ASSERT(rw_is_write_locked_by_me(&current->domain->event_lock));
+
+    dom_state_changed = xvzalloc_array(unsigned long,
+                                       BITS_TO_LONGS(DOMID_FIRST_RESERVED));
+    if ( !dom_state_changed )
+        return -ENOMEM;
+
+    rcu_read_lock(&domlist_read_lock);
+
+    for_each_domain ( d )
+        __set_bit(d->domain_id, dom_state_changed);
+
+    rcu_read_unlock(&domlist_read_lock);
+
+    return 0;
+}
+
+void domain_deinit_states(const struct domain *d)
+{
+    ASSERT(rw_is_write_locked_by_me(&d->event_lock));
+
+    XVFREE(dom_state_changed);
+}
+
+static void domain_changed_state(const struct domain *d)
+{
+    struct domain *hdl;
+
+    hdl = lock_dom_exc_handler();
+    if ( unlikely(!hdl) )
+        return;
+
+    if ( dom_state_changed )
+        set_bit(d->domain_id, dom_state_changed);
+
+    unlock_dom_exc_handler(hdl);
+}
+
 static void __domain_finalise_shutdown(struct domain *d)
 {
     struct vcpu *v;
@@ -153,6 +199,7 @@ static void __domain_finalise_shutdown(struct domain *d)
             return;
 
     d->is_shut_down = 1;
+    domain_changed_state(d);
     if ( (d->shutdown_code == SHUTDOWN_suspend) && d->suspend_evtchn )
         evtchn_send(d, d->suspend_evtchn);
     else
@@ -840,6 +887,7 @@ struct domain *domain_create(domid_t domid,
      */
     domlist_insert(d);
 
+    domain_changed_state(d);
     memcpy(d->handle, config->handle, sizeof(d->handle));
 
     return d;
@@ -1105,6 +1153,7 @@ int domain_kill(struct domain *d)
         /* Mem event cleanup has to go here because the rings 
          * have to be put before we call put_domain. */
         vm_event_cleanup(d);
+        domain_changed_state(d);
         put_domain(d);
         send_global_virq(VIRQ_DOM_EXC);
         /* fallthrough */
@@ -1294,6 +1343,8 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
 
     xfree(d->vcpu);
 
+    domain_changed_state(d);
+
     _domain_destroy(d);
 
     send_global_virq(VIRQ_DOM_EXC);
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 4dba59efa2..4ee6b6b4ce 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -509,10 +509,18 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
         goto out;
     }
 
+    if ( virq == VIRQ_DOM_EXC )
+    {
+        rc = domain_init_states();
+        if ( rc )
+            goto out;
+    }
+
     port = rc = evtchn_get_port(d, port);
     if ( rc < 0 )
     {
         gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
+        domain_deinit_states(d);
         goto out;
     }
 
@@ -745,6 +753,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
         struct vcpu *v;
         unsigned long flags;
 
+        if ( chn1->u.virq == VIRQ_DOM_EXC )
+            domain_deinit_states(d1);
+
         v = d1->vcpu[virq_is_global(chn1->u.virq) ? 0 : chn1->notify_vcpu_id];
 
         write_lock_irqsave(&v->virq_lock, flags);
@@ -1075,6 +1086,26 @@ static void clear_global_virq_handlers(struct domain *d)
     }
 }
 
+struct domain *lock_dom_exc_handler(void)
+{
+    struct domain *d;
+
+    d = get_global_virq_handler(VIRQ_DOM_EXC);
+    if ( unlikely(!get_domain(d)) )
+        return NULL;
+
+    read_lock(&d->event_lock);
+
+    return d;
+}
+
+void unlock_dom_exc_handler(struct domain *d)
+{
+    read_unlock(&d->event_lock);
+
+    put_domain(d);
+}
+
 int evtchn_status(evtchn_status_t *status)
 {
     struct domain   *d;
diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
index 48b79f3d62..5c0ba90c9f 100644
--- a/xen/include/xen/event.h
+++ b/xen/include/xen/event.h
@@ -100,6 +100,10 @@ bool evtchn_virq_enabled(const struct vcpu *v, unsigned int virq);
 /* Notify remote end of a Xen-attached event channel.*/
 void notify_via_xen_event_channel(struct domain *ld, int lport);
 
+/* Lock/unlock of VIRQ_DOM_EXC associated data (read_lock(d->event_lock)). */
+struct domain *lock_dom_exc_handler(void);
+void unlock_dom_exc_handler(struct domain *d);
+
 /*
  * Internal event channel object storage.
  *
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 037c83fda2..9d9b89ec27 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -805,6 +805,9 @@ void domain_resume(struct domain *d);
 
 int domain_soft_reset(struct domain *d, bool resuming);
 
+int domain_init_states(void);
+void domain_deinit_states(const struct domain *d);
+
 int vcpu_start_shutdown_deferral(struct vcpu *v);
 void vcpu_end_shutdown_deferral(struct vcpu *v);
 
-- 
2.43.0


