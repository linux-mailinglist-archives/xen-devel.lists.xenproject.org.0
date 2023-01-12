Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4999E66771E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 15:40:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476204.738279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyjq-0002wR-Fq; Thu, 12 Jan 2023 14:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476204.738279; Thu, 12 Jan 2023 14:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyjq-0002nW-AY; Thu, 12 Jan 2023 14:39:30 +0000
Received: by outflank-mailman (input) for mailman id 476204;
 Thu, 12 Jan 2023 14:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdGT=5J=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pFyjo-0002av-UJ
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 14:39:28 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e881a6da-9286-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 15:39:24 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pFyjo-0057zn-9C; Thu, 12 Jan 2023 14:39:28 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 6E776300AFB;
 Thu, 12 Jan 2023 15:39:13 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id CB2472CC949B7; Thu, 12 Jan 2023 15:39:12 +0100 (CET)
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
X-Inumbo-ID: e881a6da-9286-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=LNbZyqdS6MCOXN5DhvrakKEz6kKRrs7/+Ia2/9U4HAc=; b=G5AA9h/yH9+nJcJaV99Ad2Ey8F
	k5XWYtZamnH9v88AQNk//cUWHI313YsUcDWkBRHwsEnZ3YwO8uX31UVbbHNGiSckhXek4//+Wnz8l
	sFL6gBapz0F4s5kPWpNrhL2lnWrU7jUGCNGjtvEK9GN2wjN3Qp6ppjE4WmTl7v9s6AsO4FwK2CMiy
	BksgEqIsTHg+IvsVuWE/RCyauvJNvXu9ihIdqTkl7iNXaBSeD4jwxobQPOMLpk/dWsh0TlC086R3I
	6S5sM/g0/l5h+kcMN6smqUUGVPcaJ0N69KsfH2p+TSKM/cDaDIhyRd6fHrKzfHFtn9N3WXaseHucg
	0YtdygGg==;
Message-ID: <20230112143825.881829388@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 15:31:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org,
 Joan Bruguera <joanbrugueram@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 Juergen Gross <jgross@suse.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Kees Cook <keescook@chromium.org>,
 mark.rutland@arm.com
Subject: [RFC][PATCH 6/6] x86/power: Seal restore_processor_state()
References: <20230112143141.645645775@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Disallow indirect branches to restore_processor_state().

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/include/asm/suspend_64.h |    4 ++++
 arch/x86/power/cpu.c              |    2 +-
 arch/x86/power/hibernate_asm_64.S |    4 ++++
 include/linux/suspend.h           |    4 ++++
 4 files changed, 13 insertions(+), 1 deletion(-)

--- a/arch/x86/include/asm/suspend_64.h
+++ b/arch/x86/include/asm/suspend_64.h
@@ -9,6 +9,7 @@
 
 #include <asm/desc.h>
 #include <asm/fpu/api.h>
+#include <asm/ibt.h>
 
 /*
  * Image of the saved processor state, used by the low level ACPI suspend to
@@ -61,4 +62,7 @@ struct saved_context {
 extern char core_restore_code[];
 extern char restore_registers[];
 
+#define restore_processor_state restore_processor_state
+extern __noendbr void restore_processor_state(void);
+
 #endif /* _ASM_X86_SUSPEND_64_H */
--- a/arch/x86/power/cpu.c
+++ b/arch/x86/power/cpu.c
@@ -288,7 +288,7 @@ static __always_inline void __restore_pr
 }
 
 /* Needed by apm.c */
-void noinstr restore_processor_state(void)
+void __noendbr noinstr restore_processor_state(void)
 {
 	__restore_processor_state(&saved_context);
 }
--- a/arch/x86/power/hibernate_asm_64.S
+++ b/arch/x86/power/hibernate_asm_64.S
@@ -23,6 +23,10 @@
 #include <asm/frame.h>
 #include <asm/nospec-branch.h>
 
+.pushsection .discard.noendbr
+.quad	restore_processor_state
+.popsection
+
 	 /* code below belongs to the image kernel */
 	.align PAGE_SIZE
 SYM_FUNC_START(restore_registers)
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -9,6 +9,7 @@
 #include <linux/mm.h>
 #include <linux/freezer.h>
 #include <asm/errno.h>
+#include <asm/suspend.h>
 
 #ifdef CONFIG_VT
 extern void pm_set_vt_switch(int);
@@ -483,7 +484,10 @@ extern struct mutex system_transition_mu
 
 #ifdef CONFIG_PM_SLEEP
 void save_processor_state(void);
+
+#ifndef restore_processor_state
 void restore_processor_state(void);
+#endif
 
 /* kernel/power/main.c */
 extern int register_pm_notifier(struct notifier_block *nb);



