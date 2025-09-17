Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2C6B804D2
	for <lists+xen-devel@lfdr.de>; Wed, 17 Sep 2025 16:56:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1125304.1467326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uytZx-0008My-W2; Wed, 17 Sep 2025 14:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1125304.1467326; Wed, 17 Sep 2025 14:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uytZx-0008L9-ST; Wed, 17 Sep 2025 14:56:17 +0000
Received: by outflank-mailman (input) for mailman id 1125304;
 Wed, 17 Sep 2025 14:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Fd1X=34=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1uytXf-0004jI-Qw
 for xen-devel@lists.xenproject.org; Wed, 17 Sep 2025 14:53:55 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21b76108-93d6-11f0-9d13-b5c5bf9af7f9;
 Wed, 17 Sep 2025 16:53:54 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E77C3383C;
 Wed, 17 Sep 2025 14:53:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 349C61368D;
 Wed, 17 Sep 2025 14:53:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oFNnC4LLymhwEwAAD6G6ig
 (envelope-from <jgross@suse.com>); Wed, 17 Sep 2025 14:53:54 +0000
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
X-Inumbo-ID: 21b76108-93d6-11f0-9d13-b5c5bf9af7f9
Authentication-Results: smtp-out1.suse.de;
	none
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
Subject: [PATCH v2 15/21] x86/xen: Drop xen_irq_ops
Date: Wed, 17 Sep 2025 16:52:14 +0200
Message-ID: <20250917145220.31064-16-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917145220.31064-1-jgross@suse.com>
References: <20250917145220.31064-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)]
X-Rspamd-Queue-Id: 8E77C3383C
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00

Instead of having a pre-filled array xen_irq_ops for Xen PV paravirt
functions, drop the array and assign each element individually.

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
index d14f20ef1db1..14ae91cc246a 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -593,7 +593,6 @@ static int init_pv_ops(struct objtool_file *file)
 	static const char *pv_ops_tables[] = {
 		"pv_ops",
 		"xen_cpu_ops",
-		"xen_irq_ops",
 		"xen_mmu_ops",
 		NULL,
 	};
-- 
2.51.0


