Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 739F766C251
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478645.741953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQcX-0002XL-KX; Mon, 16 Jan 2023 14:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478645.741953; Mon, 16 Jan 2023 14:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQcX-0002Rt-Fv; Mon, 16 Jan 2023 14:37:57 +0000
Received: by outflank-mailman (input) for mailman id 478645;
 Mon, 16 Jan 2023 14:37:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLMM=5N=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pHQcV-0002Pl-2i
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:37:55 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bd6f224-95ab-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 15:37:53 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHQcU-008oZG-So; Mon, 16 Jan 2023 14:37:55 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 56119300C50;
 Mon, 16 Jan 2023 15:37:39 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id BEB6220D304B0; Mon, 16 Jan 2023 15:37:38 +0100 (CET)
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
X-Inumbo-ID: 5bd6f224-95ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=eW1eJS20PBPNIc/x7hkOEbhV5Z70C96GEP7VlPQr3GE=; b=bkEUaHzN3DU2Ozeq31w4gh/n2o
	R6F441bq+sbQaHOybPyF32cPvwYN0zd7oUr9R4K9RCdt8hDgWzWxaj2YBgmp4DkR9+D8F5Gs4dYOt
	9lUNiL9h6dmbWadpBSYOt2SznC7hv64myxTtyscypeuWaItFMH/MD2H9N+RHOQ0ha2uXGYbfnTpp+
	NghLUZyPGSsWGWKu+nqt7jQ7P4s9CMg2/V9GnkXxMdKljoX9C9dsDu4q8LkBDu52HDGHBkiTsolMw
	vvwHa2GRba1mlCVFQpftSw0QHpUi6oRrEyKnr2j/V09JyB9VCvK9zjxBViUdKEbhTQhWC7ktrQ+hh
	hJ6cgCPA==;
Message-ID: <20230116143645.888786209@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 16 Jan 2023 15:25:39 +0100
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
 mark.rutland@arm.com,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v2 6/7] x86/power: Sprinkle some noinstr
References: <20230116142533.905102512@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Ensure no compiler instrumentation sneaks in while restoring the CPU
state. Specifically we can't handle CALL/RET until GS is restored.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/power/cpu.c |   13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

--- a/arch/x86/power/cpu.c
+++ b/arch/x86/power/cpu.c
@@ -192,7 +192,7 @@ static void fix_processor_context(void)
  * The asm code that gets us here will have restored a usable GDT, although
  * it will be pointing to the wrong alias.
  */
-static void notrace __restore_processor_state(struct saved_context *ctxt)
+static __always_inline void __restore_processor_state(struct saved_context *ctxt)
 {
 	struct cpuinfo_x86 *c;
 
@@ -235,6 +235,13 @@ static void notrace __restore_processor_
 	loadsegment(fs, __KERNEL_PERCPU);
 #endif
 
+	/*
+	 * Definitely wrong, but at this point we should have at least enough
+	 * to do CALL/RET (consider SKL callthunks) and this avoids having
+	 * to deal with the noinstr explosion for now :/
+	 */
+	instrumentation_begin();
+
 	/* Restore the TSS, RO GDT, LDT, and usermode-relevant MSRs. */
 	fix_processor_context();
 
@@ -276,10 +283,12 @@ static void notrace __restore_processor_
 	 * because some of the MSRs are "emulated" in microcode.
 	 */
 	msr_restore_context(ctxt);
+
+	instrumentation_end();
 }
 
 /* Needed by apm.c */
-void notrace restore_processor_state(void)
+void noinstr restore_processor_state(void)
 {
 	__restore_processor_state(&saved_context);
 }



