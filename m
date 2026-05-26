Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MNdDmu3FWrKYQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 17:08:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D48365D854B
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2026 17:08:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1320020.1587440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRtO5-0007AH-Kr; Tue, 26 May 2026 15:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1320020.1587440; Tue, 26 May 2026 15:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRtO5-00077w-H0; Tue, 26 May 2026 15:08:09 +0000
Received: by outflank-mailman (input) for mailman id 1320020;
 Tue, 26 May 2026 15:08:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgross@suse.com>) id 1wRtO4-00077i-E2
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 15:08:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRtO3-00BHE7-Pz
 for xen-devel@lists.xenproject.org; Tue, 26 May 2026 17:08:07 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgross@suse.com>)
 id 6a15b750-2eae-0a2a0a5409dd-0a2a4505aa02-14
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:08:07 +0200
Received: from [195.135.223.131] (helo=smtp-out2.suse.de)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgross@suse.com>)
 id 6a15b757-aaa8-0a2a45050019-c387df83a5f8-3
 for <xen-devel@lists.xenproject.org>; Tue, 26 May 2026 17:08:07 +0200
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3348767479;
 Tue, 26 May 2026 15:08:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D79085A280;
 Tue, 26 May 2026 15:08:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id fIlCM1a3FWqUVQAAD6G6ig
 (envelope-from <jgross@suse.com>); Tue, 26 May 2026 15:08:06 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"; dkim=pass header.s=susede1 header.d=suse.com header.i="@suse.com" header.h="From:Date:Message-ID:To:Cc:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1779808087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zqSqltL1GnVn7PKoSl94YXnAsN5DYo+RIglrQTaw6ZE=;
	b=IhRRJLg1s5P5gbD17rJX9mZp818QbdvrFXhyx343oE+IaY0Kh+yGSPyqhhevxSLMM9kMpW
	xtcnReEWjm/8c1ay8xDj7uC+n3hhkvcCe5rSHQ151k0Qtc23cNKrxsvH+aYeIB3X9PRiY5
	6dAf2+JidkGM8r4dXSxeKh8mWnX64GU=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1779808087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zqSqltL1GnVn7PKoSl94YXnAsN5DYo+RIglrQTaw6ZE=;
	b=IhRRJLg1s5P5gbD17rJX9mZp818QbdvrFXhyx343oE+IaY0Kh+yGSPyqhhevxSLMM9kMpW
	xtcnReEWjm/8c1ay8xDj7uC+n3hhkvcCe5rSHQ151k0Qtc23cNKrxsvH+aYeIB3X9PRiY5
	6dAf2+JidkGM8r4dXSxeKh8mWnX64GU=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/5] x86/xen: Drop lazy mode from trace entries
Date: Tue, 26 May 2026 17:05:10 +0200
Message-ID: <20260526150514.129330-2-jgross@suse.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526150514.129330-1-jgross@suse.com>
References: <20260526150514.129330-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Score: -2.79
X-Spam-Flag: NO
X-purgate-ID: tlsNG-c201ff/1779808087-D877A443-962DE9F9/0/0
X-purgate-type: clean
X-purgate-size: 2996
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:x86@kernel.org,m:linux-trace-kernel@vger.kernel.org,m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgross@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: D48365D854B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Drop the lazy mode (cpu or mmu) from the xen_mc_batch and xen_mc_issue
trace entries.

This is done in preparation of removing the xen_lazy_mode percpu
variable.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/xen-ops.h     | 11 +++++++----
 include/trace/events/xen.h | 33 +++++++++++++++++++--------------
 2 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/arch/x86/xen/xen-ops.h b/arch/x86/xen/xen-ops.h
index 6808010ac379..dc892f421f25 100644
--- a/arch/x86/xen/xen-ops.h
+++ b/arch/x86/xen/xen-ops.h
@@ -98,7 +98,7 @@ static inline void xen_mc_batch(void)
 
 	/* need to disable interrupts until this entry is complete */
 	local_irq_save(flags);
-	trace_xen_mc_batch(xen_get_lazy_mode());
+	trace_xen_mc_batch(flags);
 	__this_cpu_write(xen_mc_irq_flags, flags);
 }
 
@@ -114,13 +114,16 @@ void xen_mc_flush(void);
 /* Issue a multicall if we're not in a lazy mode */
 static inline void xen_mc_issue(unsigned mode)
 {
-	trace_xen_mc_issue(mode);
+	bool flush = !(xen_get_lazy_mode() & mode);
+	unsigned long flags = this_cpu_read(xen_mc_irq_flags);
 
-	if ((xen_get_lazy_mode() & mode) == 0)
+	trace_xen_mc_issue(flush, flags);
+
+	if (flush)
 		xen_mc_flush();
 
 	/* restore flags saved in xen_mc_batch */
-	local_irq_restore(this_cpu_read(xen_mc_irq_flags));
+	local_irq_restore(flags);
 }
 
 /* Set up a callback to be called when the current batch is flushed */
diff --git a/include/trace/events/xen.h b/include/trace/events/xen.h
index e3f139f0bc78..ad384969e2cb 100644
--- a/include/trace/events/xen.h
+++ b/include/trace/events/xen.h
@@ -12,24 +12,29 @@
 struct multicall_entry;
 
 /* Multicalls */
-DECLARE_EVENT_CLASS(xen_mc__batch,
-	    TP_PROTO(enum xen_lazy_mode mode),
-	    TP_ARGS(mode),
+TRACE_EVENT(xen_mc_batch,
+	    TP_PROTO(unsigned long flags),
+	    TP_ARGS(flags),
 	    TP_STRUCT__entry(
-		    __field(enum xen_lazy_mode, mode)
+		    __field(unsigned long, flags)
 		    ),
-	    TP_fast_assign(__entry->mode = mode),
-	    TP_printk("start batch LAZY_%s",
-		      (__entry->mode == XEN_LAZY_MMU) ? "MMU" :
-		      (__entry->mode == XEN_LAZY_CPU) ? "CPU" : "NONE")
+	    TP_fast_assign(__entry->flags = flags),
+	    TP_printk("start batch lazy flags %lx", __entry->flags)
 	);
-#define DEFINE_XEN_MC_BATCH(name)			\
-	DEFINE_EVENT(xen_mc__batch, name,		\
-		TP_PROTO(enum xen_lazy_mode mode),	\
-		     TP_ARGS(mode))
 
-DEFINE_XEN_MC_BATCH(xen_mc_batch);
-DEFINE_XEN_MC_BATCH(xen_mc_issue);
+TRACE_EVENT(xen_mc_issue,
+	    TP_PROTO(bool flush, unsigned long flags),
+	    TP_ARGS(flush, flags),
+	    TP_STRUCT__entry(
+		    __field(unsigned long, flags)
+		    __field(bool, flush)
+		    ),
+	    TP_fast_assign(__entry->flush = flush;
+			   __entry->flags = flags;
+		    ),
+	    TP_printk("flush: %s, flags %lx",
+		      __entry->flush ? "yes" : "no", __entry->flags)
+	);
 
 TRACE_DEFINE_SIZEOF(ulong);
 
-- 
2.54.0


