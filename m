Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D81D66C254
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478644.741946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQcX-0002Rs-A9; Mon, 16 Jan 2023 14:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478644.741946; Mon, 16 Jan 2023 14:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQcX-0002Pw-75; Mon, 16 Jan 2023 14:37:57 +0000
Received: by outflank-mailman (input) for mailman id 478644;
 Mon, 16 Jan 2023 14:37:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLMM=5N=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pHQcU-0002Pk-77
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:37:54 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59b18eec-95ab-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 15:37:51 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHQcT-008oZ7-Sz; Mon, 16 Jan 2023 14:37:54 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E3A5C3007DA;
 Mon, 16 Jan 2023 15:37:38 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id AF96620306BCC; Mon, 16 Jan 2023 15:37:38 +0100 (CET)
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
X-Inumbo-ID: 59b18eec-95ab-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=/Xw5T+5vUqgsMfvHO/2XJeMLoksLNzw5fViFdsAKWFI=; b=Eq3y0scguUgdkMj79Zzk6GCrvF
	hQAhEQP/E7cAerOW9szVqcnkFmKfzWUaiZxup/I+SMwXzVRopqfn4zPHPbmkQufcFo19M0uELMYv/
	kYPxOMfLbqjIwv9QIGVc5oiVosXskQwBXNQfwBy/jDHeBBuxrkRaeFIhaA+Tm2XLDqfwvxvnRyH0O
	rvOYW2PlqyMs+3qT9hF1XykM1+ON8wTIDA4x8JJJGyRjveBRsW6uZuMNrQ9P/htuomhOyIDx2ZWUH
	ITNdFmVF/slE93TC/wZdRxX36dsgHyfS5wX7wOPPamJ7fIEFgb5fD7j0P6Cn79iKWZ/XYGoYdt6+A
	rE5ri56A==;
Message-ID: <20230116143645.649204101@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 16 Jan 2023 15:25:35 +0100
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
Subject: [PATCH v2 2/7] x86/boot: Delay sev_verify_cbit() a bit
References: <20230116142533.905102512@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Per the comment it is important to call sev_verify_cbit() before the
first RET instruction, this means we can delay calling this until more
of the CPU state is set up, specifically delay this until GS is
'sane' such that per-cpu variables work.

Fixes: e81dc127ef69 ("x86/callthunks: Add call patching for call depth tracking")
Reported-by: Joan Bruguera <joanbrugueram@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/kernel/head_64.S |   26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -185,19 +185,6 @@ SYM_CODE_START(secondary_startup_64)
 	addq	phys_base(%rip), %rax
 
 	/*
-	 * For SEV guests: Verify that the C-bit is correct. A malicious
-	 * hypervisor could lie about the C-bit position to perform a ROP
-	 * attack on the guest by writing to the unencrypted stack and wait for
-	 * the next RET instruction.
-	 * %rsi carries pointer to realmode data and is callee-clobbered. Save
-	 * and restore it.
-	 */
-	pushq	%rsi
-	movq	%rax, %rdi
-	call	sev_verify_cbit
-	popq	%rsi
-
-	/*
 	 * Switch to new page-table
 	 *
 	 * For the boot CPU this switches to early_top_pgt which still has the
@@ -265,6 +252,19 @@ SYM_CODE_START(secondary_startup_64)
 	 */
 	movq initial_stack(%rip), %rsp
 
+	/*
+	 * For SEV guests: Verify that the C-bit is correct. A malicious
+	 * hypervisor could lie about the C-bit position to perform a ROP
+	 * attack on the guest by writing to the unencrypted stack and wait for
+	 * the next RET instruction.
+	 * %rsi carries pointer to realmode data and is callee-clobbered. Save
+	 * and restore it.
+	 */
+	pushq	%rsi
+	movq	%rax, %rdi
+	call	sev_verify_cbit
+	popq	%rsi
+
 	/* Setup and Load IDT */
 	pushq	%rsi
 	call	early_setup_idt



