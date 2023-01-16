Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEA466C256
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:38:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478651.742024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQce-0004KB-Ak; Mon, 16 Jan 2023 14:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478651.742024; Mon, 16 Jan 2023 14:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQce-0004Dw-6O; Mon, 16 Jan 2023 14:38:04 +0000
Received: by outflank-mailman (input) for mailman id 478651;
 Mon, 16 Jan 2023 14:38:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jLMM=5N=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pHQcb-0002Pk-D9
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:38:01 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f817ab7-95ab-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 15:37:59 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pHQc7-005csw-18; Mon, 16 Jan 2023 14:37:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DE246300652;
 Mon, 16 Jan 2023 15:37:38 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id B311720EF0A20; Mon, 16 Jan 2023 15:37:38 +0100 (CET)
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
X-Inumbo-ID: 5f817ab7-95ab-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=ts2f9zMhByBtAAtY3UBCAh5kpNSswewgiYAUfY8HRdU=; b=aGBhaLZsy7tRmU8DfE6K+TDDO0
	vuZ+yzEJlLmyIkJpKj5j6TVZcKHJw7LV5zhoweNmIAXEhyqNbDctZ6rxIemADC20CHJlks7N8JIx+
	K5F4VyyMc1wR1Ib2pi1CQk44Pzj8XTpGUHCP4oZt5ZuUo1cEJm9pBXD/3o3j4D+/yj051n7fxMsXX
	9AcOJ4ti/xsLZ0KgZKwSKrmlvgRdCt+MP/E3zPoSa5b3jgTI5IW4LJAlgGIKa96qCBr3IpBr3kI5N
	Tg9J6WHAyn2j5+4GcLAyMQZQrgoS+GXww4z8hdfHou6kXyg3O02NeUUJTaNy52X7cIFx8XWm84+1+
	NZWTDZ8g==;
Message-ID: <20230116143645.708895882@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 16 Jan 2023 15:25:36 +0100
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
Subject: [PATCH v2 3/7] x86/power: De-paravirt restore_processor_state()
References: <20230116142533.905102512@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Since Xen PV doesn't use restore_processor_state(), and we're going to
have to avoid CALL/RET until at least GS is restored, de-paravirt the
easy bits.

Fixes: e81dc127ef69 ("x86/callthunks: Add call patching for call depth tracking")
Reported-by: Joan Bruguera <joanbrugueram@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/power/cpu.c |   24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

--- a/arch/x86/power/cpu.c
+++ b/arch/x86/power/cpu.c
@@ -197,25 +197,25 @@ static void notrace __restore_processor_
 	struct cpuinfo_x86 *c;
 
 	if (ctxt->misc_enable_saved)
-		wrmsrl(MSR_IA32_MISC_ENABLE, ctxt->misc_enable);
+		native_wrmsrl(MSR_IA32_MISC_ENABLE, ctxt->misc_enable);
 	/*
 	 * control registers
 	 */
 	/* cr4 was introduced in the Pentium CPU */
 #ifdef CONFIG_X86_32
 	if (ctxt->cr4)
-		__write_cr4(ctxt->cr4);
+		native_write_cr4(ctxt->cr4);
 #else
 /* CONFIG X86_64 */
-	wrmsrl(MSR_EFER, ctxt->efer);
-	__write_cr4(ctxt->cr4);
+	native_wrmsrl(MSR_EFER, ctxt->efer);
+	native_write_cr4(ctxt->cr4);
 #endif
-	write_cr3(ctxt->cr3);
-	write_cr2(ctxt->cr2);
-	write_cr0(ctxt->cr0);
+	native_write_cr3(ctxt->cr3);
+	native_write_cr2(ctxt->cr2);
+	native_write_cr0(ctxt->cr0);
 
 	/* Restore the IDT. */
-	load_idt(&ctxt->idt);
+	native_load_idt(&ctxt->idt);
 
 	/*
 	 * Just in case the asm code got us here with the SS, DS, or ES
@@ -230,7 +230,7 @@ static void notrace __restore_processor_
 	 * handlers or in complicated helpers like load_gs_index().
 	 */
 #ifdef CONFIG_X86_64
-	wrmsrl(MSR_GS_BASE, ctxt->kernelmode_gs_base);
+	native_wrmsrl(MSR_GS_BASE, ctxt->kernelmode_gs_base);
 #else
 	loadsegment(fs, __KERNEL_PERCPU);
 #endif
@@ -246,15 +246,15 @@ static void notrace __restore_processor_
 	loadsegment(ds, ctxt->es);
 	loadsegment(es, ctxt->es);
 	loadsegment(fs, ctxt->fs);
-	load_gs_index(ctxt->gs);
+	native_load_gs_index(ctxt->gs);
 
 	/*
 	 * Restore FSBASE and GSBASE after restoring the selectors, since
 	 * restoring the selectors clobbers the bases.  Keep in mind
 	 * that MSR_KERNEL_GS_BASE is horribly misnamed.
 	 */
-	wrmsrl(MSR_FS_BASE, ctxt->fs_base);
-	wrmsrl(MSR_KERNEL_GS_BASE, ctxt->usermode_gs_base);
+	native_wrmsrl(MSR_FS_BASE, ctxt->fs_base);
+	native_wrmsrl(MSR_KERNEL_GS_BASE, ctxt->usermode_gs_base);
 #else
 	loadsegment(gs, ctxt->gs);
 #endif



