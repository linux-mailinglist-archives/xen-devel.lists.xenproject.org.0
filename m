Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E979ACAC3
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 15:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824607.1238771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3b84-00071Y-9t; Wed, 23 Oct 2024 13:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824607.1238771; Wed, 23 Oct 2024 13:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3b84-0006yS-6r; Wed, 23 Oct 2024 13:10:24 +0000
Received: by outflank-mailman (input) for mailman id 824607;
 Wed, 23 Oct 2024 13:10:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W0hE=RT=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1t3b82-0006Ra-2K
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 13:10:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2779cc7c-9140-11ef-99a3-01e77a169b0f;
 Wed, 23 Oct 2024 15:10:20 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A1E6D1FDA3;
 Wed, 23 Oct 2024 13:10:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6BC0613A63;
 Wed, 23 Oct 2024 13:10:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HKDkGLv1GGfGdwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 23 Oct 2024 13:10:19 +0000
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
X-Inumbo-ID: 2779cc7c-9140-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729689019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i3xMtPXgKn6GG8oVuMqyejq+21hcqPaJBGgXHENl+cw=;
	b=PaOzNzSZcG26XL9qxihvCawE2U283fnLlqlhDp0dF1PsI/69+igiohrJUAXLahinNr43hC
	YbnnVwBxmuClh1LiFklCmovZLDe6IfTgv5r29F1ShW+ZF6cL800yYg+wA/fADwV+xwokbC
	D2+eJB+unAz2x4HiLr1jk8Z9pBuY5QE=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1729689019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i3xMtPXgKn6GG8oVuMqyejq+21hcqPaJBGgXHENl+cw=;
	b=PaOzNzSZcG26XL9qxihvCawE2U283fnLlqlhDp0dF1PsI/69+igiohrJUAXLahinNr43hC
	YbnnVwBxmuClh1LiFklCmovZLDe6IfTgv5r29F1ShW+ZF6cL800yYg+wA/fADwV+xwokbC
	D2+eJB+unAz2x4HiLr1jk8Z9pBuY5QE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/6] xen: add bitmap to indicate per-domain state changes
Date: Wed, 23 Oct 2024 15:10:01 +0200
Message-ID: <20241023131005.32144-3-jgross@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023131005.32144-1-jgross@suse.com>
References: <20241023131005.32144-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Add a bitmap with one bit per possible domid indicating the respective
domain has changed its state (created, deleted, dying, crashed,
shutdown).

Registering the VIRQ_DOM_EXC event will result in setting the bits for
all existing domains and resetting all other bits.

Resetting a bit will be done in a future patch.

This information is needed for Xenstore to keep track of all domains.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/domain.c        | 21 +++++++++++++++++++++
 xen/common/event_channel.c |  2 ++
 xen/include/xen/sched.h    |  2 ++
 3 files changed, 25 insertions(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 3948640fb0..61b7899cb8 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -138,6 +138,22 @@ bool __read_mostly vmtrace_available;
 
 bool __read_mostly vpmu_is_available;
 
+static DECLARE_BITMAP(dom_state_changed, DOMID_MASK + 1);
+
+void domain_reset_states(void)
+{
+    struct domain *d;
+
+    bitmap_zero(dom_state_changed, DOMID_MASK + 1);
+
+    rcu_read_lock(&domlist_read_lock);
+
+    for_each_domain ( d )
+        set_bit(d->domain_id, dom_state_changed);
+
+    rcu_read_unlock(&domlist_read_lock);
+}
+
 static void __domain_finalise_shutdown(struct domain *d)
 {
     struct vcpu *v;
@@ -152,6 +168,7 @@ static void __domain_finalise_shutdown(struct domain *d)
             return;
 
     d->is_shut_down = 1;
+    set_bit(d->domain_id, dom_state_changed);
     if ( (d->shutdown_code == SHUTDOWN_suspend) && d->suspend_evtchn )
         evtchn_send(d, d->suspend_evtchn);
     else
@@ -832,6 +849,7 @@ struct domain *domain_create(domid_t domid,
      */
     domlist_insert(d);
 
+    set_bit(d->domain_id, dom_state_changed);
     memcpy(d->handle, config->handle, sizeof(d->handle));
 
     return d;
@@ -1097,6 +1115,7 @@ int domain_kill(struct domain *d)
         /* Mem event cleanup has to go here because the rings 
          * have to be put before we call put_domain. */
         vm_event_cleanup(d);
+        set_bit(d->domain_id, dom_state_changed);
         put_domain(d);
         send_global_virq(VIRQ_DOM_EXC);
         /* fallthrough */
@@ -1286,6 +1305,8 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
 
     xfree(d->vcpu);
 
+    set_bit(d->domain_id, dom_state_changed);
+
     _domain_destroy(d);
 
     send_global_virq(VIRQ_DOM_EXC);
diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index 8db2ca4ba2..9b87d29968 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -1296,6 +1296,8 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         rc = evtchn_bind_virq(&bind_virq, 0);
         if ( !rc && __copy_to_guest(arg, &bind_virq, 1) )
             rc = -EFAULT; /* Cleaning up here would be a mess! */
+        if ( !rc && bind_virq.virq == VIRQ_DOM_EXC )
+            domain_reset_states();
         break;
     }
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1dd8a425f9..667863263d 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -800,6 +800,8 @@ void domain_resume(struct domain *d);
 
 int domain_soft_reset(struct domain *d, bool resuming);
 
+void domain_reset_states(void);
+
 int vcpu_start_shutdown_deferral(struct vcpu *v);
 void vcpu_end_shutdown_deferral(struct vcpu *v);
 
-- 
2.43.0


