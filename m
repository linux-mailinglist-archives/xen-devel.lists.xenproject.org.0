Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA11F66C252
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:38:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478647.741980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQca-0003By-4n; Mon, 16 Jan 2023 14:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478647.741980; Mon, 16 Jan 2023 14:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQca-0003A4-1I; Mon, 16 Jan 2023 14:38:00 +0000
Received: by outflank-mailman (input) for mailman id 478647;
 Mon, 16 Jan 2023 14:37:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLMM=5N=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pHQcY-0002Pl-BF
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:37:58 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e68e912-95ab-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 15:37:57 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHQcT-008oZ6-SE; Mon, 16 Jan 2023 14:37:54 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E016530073F;
 Mon, 16 Jan 2023 15:37:38 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id B816220B75F29; Mon, 16 Jan 2023 15:37:38 +0100 (CET)
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
X-Inumbo-ID: 5e68e912-95ab-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=dtG3CCLzMA0i0qOsNCGAACCWIWjzH+RX76nYJr/7nUg=; b=mNSQfQeUAAjFw9ESss496f+Z7Q
	u0TgyafjRhE1gQwftI2iBVWQ3NaSLG34VdbAWazXouiYsRdKyzqy1wML0X2573JOCsV/N0PK5k2F2
	TPov7/LEGoLwGuZcybAwU9tHaa3wffyOD9zxSarAfZ29Q4WErfXs+qrs4jgpQMpEdyO9/ORvp95nX
	EjaMEymmS+cwIurns0c3wEq3uE17tL2K8Hwq/Ex3y3gpAT4bxe9pp5k86FtmXoW5UtC3/6pfTmVtZ
	8qPTNYgKrdqtoTo1pP63NdYMrqwT3UhPTSsaXrAPfezN6rdi70FJ8sxMqiPPuMxRvDSFpPFtdzk0Q
	gXratnhg==;
Message-ID: <20230116143645.768035056@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 16 Jan 2023 15:25:37 +0100
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
Subject: [PATCH v2 4/7] x86/power: Inline write_cr[04]()
References: <20230116142533.905102512@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Since we can't do CALL/RET until GS is restored and CR[04] pinning is
of dubious value in this code path, simply write the stored values.

Fixes: e81dc127ef69 ("x86/callthunks: Add call patching for call depth tracking")
Reported-by: Joan Bruguera <joanbrugueram@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 arch/x86/power/cpu.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/x86/power/cpu.c
+++ b/arch/x86/power/cpu.c
@@ -208,11 +208,11 @@ static void notrace __restore_processor_
 #else
 /* CONFIG X86_64 */
 	native_wrmsrl(MSR_EFER, ctxt->efer);
-	native_write_cr4(ctxt->cr4);
+	asm volatile("mov %0,%%cr4": "+r" (ctxt->cr4) : : "memory");
 #endif
 	native_write_cr3(ctxt->cr3);
 	native_write_cr2(ctxt->cr2);
-	native_write_cr0(ctxt->cr0);
+	asm volatile("mov %0,%%cr0": "+r" (ctxt->cr0) : : "memory");
 
 	/* Restore the IDT. */
 	native_load_idt(&ctxt->idt);



