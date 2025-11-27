Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2263FC8D06D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 08:11:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173464.1498524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOWAA-0000aj-39; Thu, 27 Nov 2025 07:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173464.1498524; Thu, 27 Nov 2025 07:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOWA9-0000Yf-W6; Thu, 27 Nov 2025 07:11:33 +0000
Received: by outflank-mailman (input) for mailman id 1173464;
 Thu, 27 Nov 2025 07:11:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rEk/=6D=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1vOW8w-0004Ta-Qj
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 07:10:18 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [2a07:de40:b251:101:10:150:64:2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20df4e12-cb60-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 08:10:17 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 748E85BCC4;
 Thu, 27 Nov 2025 07:10:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B4313EA63;
 Thu, 27 Nov 2025 07:10:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Jv5CBVn5J2nlXQAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 27 Nov 2025 07:10:17 +0000
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
X-Inumbo-ID: 20df4e12-cb60-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1764227417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZD0gHfZEAZt38+vBUmam6fB85ZjKlj3yVqOSUwfE0Y=;
	b=gWsIkR9Y7z8FVayWaep4mo1zZytSyxXgt93U6ANX/FSM+kmKiHujplZRaytePOGoCIsy2A
	wfCpqyYgzoWf7+1PXp9jKgjYTDtbyNBVfpjKAR32x12s5Q8BhAAIqLNM314ZBfbAoy+WA/
	N+qRNAh+6SCRHPtzLRxjSWYJ4mW7kiI=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1764227417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ZD0gHfZEAZt38+vBUmam6fB85ZjKlj3yVqOSUwfE0Y=;
	b=gWsIkR9Y7z8FVayWaep4mo1zZytSyxXgt93U6ANX/FSM+kmKiHujplZRaytePOGoCIsy2A
	wfCpqyYgzoWf7+1PXp9jKgjYTDtbyNBVfpjKAR32x12s5Q8BhAAIqLNM314ZBfbAoy+WA/
	N+qRNAh+6SCRHPtzLRxjSWYJ4mW7kiI=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 15/21] x86/xen: Drop xen_irq_ops
Date: Thu, 27 Nov 2025 08:08:38 +0100
Message-ID: <20251127070844.21919-16-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127070844.21919-1-jgross@suse.com>
References: <20251127070844.21919-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Level: 
X-Spam-Score: -6.80
X-Spam-Flag: NO

Instead of having a pre-filled array xen_irq_ops for Xen PV paravirt
functions, drop the array and assign each element individually.

This is in preparation of reducing the paravirt include hell by
splitting paravirt.h into multiple more fine grained header files,
which will in turn require to split up the pv_ops vector as well.
Dropping the pre-filled array makes life easier for objtool to
detect missing initializers in multiple pv_ops_ arrays.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- new patch
---
 arch/x86/xen/irq.c    | 20 +++++++-------------
 tools/objtool/check.c |  1 -
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/x86/xen/irq.c b/arch/x86/xen/irq.c
index 39982f955cfe..d8678c3d3971 100644
--- a/arch/x86/xen/irq.c
+++ b/arch/x86/xen/irq.c
@@ -40,20 +40,14 @@ static void xen_halt(void)
 		xen_safe_halt();
 }
 
-static const typeof(pv_ops) xen_irq_ops __initconst = {
-	.irq = {
-		/* Initial interrupt flag handling only called while interrupts off. */
-		.save_fl = __PV_IS_CALLEE_SAVE(paravirt_ret0),
-		.irq_disable = __PV_IS_CALLEE_SAVE(paravirt_nop),
-		.irq_enable = __PV_IS_CALLEE_SAVE(BUG_func),
-
-		.safe_halt = xen_safe_halt,
-		.halt = xen_halt,
-	},
-};
-
 void __init xen_init_irq_ops(void)
 {
-	pv_ops.irq = xen_irq_ops.irq;
+	/* Initial interrupt flag handling only called while interrupts off. */
+	pv_ops.irq.save_fl = __PV_IS_CALLEE_SAVE(paravirt_ret0);
+	pv_ops.irq.irq_disable = __PV_IS_CALLEE_SAVE(paravirt_nop);
+	pv_ops.irq.irq_enable = __PV_IS_CALLEE_SAVE(BUG_func);
+	pv_ops.irq.safe_halt = xen_safe_halt;
+	pv_ops.irq.halt = xen_halt;
+
 	x86_init.irqs.intr_init = xen_init_IRQ;
 }
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 9004fbc06769..3fd551c080ee 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -594,7 +594,6 @@ static int init_pv_ops(struct objtool_file *file)
 	static const char *pv_ops_tables[] = {
 		"pv_ops",
 		"xen_cpu_ops",
-		"xen_irq_ops",
 		"xen_mmu_ops",
 		NULL,
 	};
-- 
2.51.0


