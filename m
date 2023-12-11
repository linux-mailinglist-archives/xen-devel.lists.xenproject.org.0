Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4688480CB54
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:49:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651887.1017735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgeG-0004Jf-BR; Mon, 11 Dec 2023 13:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651887.1017735; Mon, 11 Dec 2023 13:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCgeG-0004Fv-8l; Mon, 11 Dec 2023 13:48:40 +0000
Received: by outflank-mailman (input) for mailman id 651887;
 Mon, 11 Dec 2023 13:48:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g7EY=HW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCgeF-0003yP-B7
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:48:39 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb1afd6d-982b-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 14:48:36 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8FF881FB93;
 Mon, 11 Dec 2023 13:48:35 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 65196138FF;
 Mon, 11 Dec 2023 13:48:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id Cix6FzMTd2WCXAAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 11 Dec 2023 13:48:35 +0000
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
X-Inumbo-ID: fb1afd6d-982b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702302515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tZcEXwjYXRWfbXp2N679W+w4cg8R77K0ZFxZJnPRIZs=;
	b=WRpSXFQ9FVNVwQ4Gv9mzKwHRuP8lYig0iT/QgXwELUy4IRdf75Sws37Kg5l2bzbkbPVfLA
	WMBUxHcJvyApC2z3LkE6QJTd1xyDrLdBc7JD9MDIoIqPJQgeRVnjasIwVDpXg1r1JoWV1p
	sJNI/vj7XrILGeSKQot3aHBi97E+7m8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702302515; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tZcEXwjYXRWfbXp2N679W+w4cg8R77K0ZFxZJnPRIZs=;
	b=WRpSXFQ9FVNVwQ4Gv9mzKwHRuP8lYig0iT/QgXwELUy4IRdf75Sws37Kg5l2bzbkbPVfLA
	WMBUxHcJvyApC2z3LkE6QJTd1xyDrLdBc7JD9MDIoIqPJQgeRVnjasIwVDpXg1r1JoWV1p
	sJNI/vj7XrILGeSKQot3aHBi97E+7m8=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/3] Mini-OS: call event handlers always with interrupts off
Date: Mon, 11 Dec 2023 14:48:25 +0100
Message-Id: <20231211134827.7130-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231211134827.7130-1-jgross@suse.com>
References: <20231211134827.7130-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 3.70
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[5];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

When unmasking an event channel the associated event handler can be
called with interrupts enabled when not running as a PV guest.

This can result in hard to debug races in case e.g. a handler is
registered for multiple events or when the handler is not using a lock
as it assumes to have interrupts disabled.

Instead of using the PV interrupt disabling points just before calling
the handler, do the disabling once at the very start of
force_evtchn_callback().

Replace the evtchn_upcall_mask test in unmask_evtchn() with the more
appropriate irqs_disabled() test.

As a precaution add a test to do_hypervisor_callback() that interrupts
are really disabled and crash in case this is not true.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 hypervisor.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/hypervisor.c b/hypervisor.c
index f2cbbc1c..5309daa3 100644
--- a/hypervisor.c
+++ b/hypervisor.c
@@ -102,6 +102,8 @@ void do_hypervisor_callback(struct pt_regs *regs)
     shared_info_t *s = HYPERVISOR_shared_info;
     vcpu_info_t   *vcpu_info = &s->vcpu_info[cpu];
 
+    BUG_ON(!irqs_disabled());
+
     in_callback = 1;
    
     vcpu_info->evtchn_upcall_pending = 0;
@@ -131,27 +133,19 @@ void do_hypervisor_callback(struct pt_regs *regs)
 
 void force_evtchn_callback(void)
 {
-#ifdef XEN_HAVE_PV_UPCALL_MASK
-    int save;
-#endif
     vcpu_info_t *vcpu;
+    unsigned long flags;
+
+    local_irq_save(flags);
+
     vcpu = &HYPERVISOR_shared_info->vcpu_info[smp_processor_id()];
-#ifdef XEN_HAVE_PV_UPCALL_MASK
-    save = vcpu->evtchn_upcall_mask;
-#endif
 
     while (vcpu->evtchn_upcall_pending) {
-#ifdef XEN_HAVE_PV_UPCALL_MASK
-        vcpu->evtchn_upcall_mask = 1;
-#endif
-        barrier();
         do_hypervisor_callback(NULL);
         barrier();
-#ifdef XEN_HAVE_PV_UPCALL_MASK
-        vcpu->evtchn_upcall_mask = save;
-        barrier();
-#endif
     };
+
+    local_irq_restore(flags);
 }
 
 inline void mask_evtchn(uint32_t port)
@@ -177,9 +171,7 @@ inline void unmask_evtchn(uint32_t port)
               &vcpu_info->evtchn_pending_sel) )
     {
         vcpu_info->evtchn_upcall_pending = 1;
-#ifdef XEN_HAVE_PV_UPCALL_MASK
-        if ( !vcpu_info->evtchn_upcall_mask )
-#endif
+        if ( !irqs_disabled() )
             force_evtchn_callback();
     }
 }
-- 
2.35.3


