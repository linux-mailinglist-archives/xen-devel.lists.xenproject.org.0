Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMYpAWCZ/WkJgQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 10:05:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D0F4F3794
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 10:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303272.1576738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLGD2-0005h9-JZ; Fri, 08 May 2026 08:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303272.1576738; Fri, 08 May 2026 08:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLGD2-0005eb-Gr; Fri, 08 May 2026 08:05:20 +0000
Received: by outflank-mailman (input) for mailman id 1303272;
 Fri, 08 May 2026 08:05:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wLGD1-0005eV-1p
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 08:05:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLGCy-00DZG1-T9
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 10:05:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 69fd993d-bab6-0a2a0a5309dd-0a2a4509afb0-4
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 10:05:18 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 69fd993e-2497-0a2a45090019-c387df83b228-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 10:05:18 +0200
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A41BF5C480;
 Fri,  8 May 2026 08:05:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32B27593A7;
 Fri,  8 May 2026 08:05:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oHwnCz2Z/WlsPwAAD6G6ig
 (envelope-from <jgross@suse.com>); Fri, 08 May 2026 08:05:17 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1778227517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zin7zp/9oBAHtr4qfaN5VFN9hhxtKHeI7hC3NPeLalg=;
	b=cQUcQv7a3lNGXcjekKFXsChUBFrlQ7V8GcZILNGJXroQuGu8Uc9zLmO3xF/IYkxLmIGOsU
	3Ua2wlHDk3UA0TMOxVJADwq+mwMIAiHXGu/pTbcvENmhIXRNMTJJzedX3hfiz6MA62M6K4
	h3wKKxjV/nSnHAbaPrSRFH6tShevb/w=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=cQUcQv7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1778227517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=zin7zp/9oBAHtr4qfaN5VFN9hhxtKHeI7hC3NPeLalg=;
	b=cQUcQv7a3lNGXcjekKFXsChUBFrlQ7V8GcZILNGJXroQuGu8Uc9zLmO3xF/IYkxLmIGOsU
	3Ua2wlHDk3UA0TMOxVJADwq+mwMIAiHXGu/pTbcvENmhIXRNMTJJzedX3hfiz6MA62M6K4
	h3wKKxjV/nSnHAbaPrSRFH6tShevb/w=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-mm@kvack.org
Cc: kevin.brodsky@arm.com,
	mmarek@invisiblethingslab.com,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] x86/xen: Fix lazy mmu handling across context switch
Date: Fri,  8 May 2026 10:05:14 +0200
Message-ID: <20260508080514.454607-1-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -3.01
X-purgate-ID: tlsNG-bad1c0/1778227518-37175A53-532E17D9/0/0
X-purgate-type: clean
X-purgate-size: 3371
X-Rspamd-Queue-Id: 67D0F4F3794
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-mm@kvack.org,m:kevin.brodsky@arm.com,m:mmarek@invisiblethingslab.com,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:ljs@kernel.org,m:liam@infradead.org,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Action: no action

The recent rework of mmu lazy mode has resulted in problems when
running as a Xen PV guest. Enabling lazy mmu mode for the new context
during context switch is done from the arch_end_context_switch() hook,
but when calling this hook current hasn't been changed yet, so the
lazy mmu mode state of the wrong task is modified.

Additionally it is much cleaner to use lazy_mmu_mode_pause() and
lazy_mmu_mode_resume() in the Xen context switch hooks, as it avoids
conditionals in those hooks.

In order not having to add another hook to be called after switching
current, modify lazy_mmu_mode_resume() to use a new sub-function which
takes a task pointer as parameter. This new sub-function can then be
used in the xen_end_context_switch() hook.

Fixes: 291b3abed657 ("x86/xen: use lazy_mmu_state when context-switching")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/enlighten_pv.c |  7 ++-----
 include/linux/pgtable.h     | 33 ++++++++++++++++++++++++---------
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index ed2d7a3756ce..67bb6bf6d240 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -424,9 +424,7 @@ static void xen_start_context_switch(struct task_struct *prev)
 {
 	BUG_ON(preemptible());
 
-	if (this_cpu_read(xen_lazy_mode) == XEN_LAZY_MMU) {
-		arch_leave_lazy_mmu_mode();
-	}
+	lazy_mmu_mode_pause();
 	enter_lazy(XEN_LAZY_CPU);
 }
 
@@ -436,8 +434,7 @@ static void xen_end_context_switch(struct task_struct *next)
 
 	xen_mc_flush();
 	leave_lazy(XEN_LAZY_CPU);
-	if (__task_lazy_mmu_mode_active(next))
-		arch_enter_lazy_mmu_mode();
+	lazy_mmu_mode_resume_task(next);
 }
 
 static unsigned long xen_store_tr(void)
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index cdd68ed3ae1a..83a099bf2038 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -326,6 +326,28 @@ static inline void lazy_mmu_mode_pause(void)
 		arch_leave_lazy_mmu_mode();
 }
 
+/**
+ * lazy_mmu_mode_resume_task() - Resume the lazy MMU mode for a specific task.
+ *
+ * Like lazy_mmu_mode_resume() below, but with a task specified.
+ * Must be called only by lazy_mmu_mode_resume() or during context switch.
+ * Must never be called in interrupt context.
+ *
+ * Must match a call to lazy_mmu_mode_pause().
+ *
+ * Has no effect if called:
+ * - While paused (inside another pause()/resume() pair)
+ */
+static inline void lazy_mmu_mode_resume_task(struct task_struct *task)
+{
+	struct lazy_mmu_state *state = &task->lazy_mmu_state;
+
+	VM_WARN_ON_ONCE(state->pause_count == 0);
+
+	if (--state->pause_count == 0 && state->enable_count > 0)
+		arch_enter_lazy_mmu_mode();
+}
+
 /**
  * lazy_mmu_mode_resume() - Resume the lazy MMU mode.
  *
@@ -341,15 +363,8 @@ static inline void lazy_mmu_mode_pause(void)
  */
 static inline void lazy_mmu_mode_resume(void)
 {
-	struct lazy_mmu_state *state = &current->lazy_mmu_state;
-
-	if (in_interrupt())
-		return;
-
-	VM_WARN_ON_ONCE(state->pause_count == 0);
-
-	if (--state->pause_count == 0 && state->enable_count > 0)
-		arch_enter_lazy_mmu_mode();
+	if (!in_interrupt())
+		lazy_mmu_mode_resume_task(current);
 }
 #else
 static inline void lazy_mmu_mode_enable(void) {}
-- 
2.54.0


