Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D4C667727
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 15:40:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476205.738302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyjr-0003Xz-P5; Thu, 12 Jan 2023 14:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476205.738302; Thu, 12 Jan 2023 14:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFyjr-0003T0-J8; Thu, 12 Jan 2023 14:39:31 +0000
Received: by outflank-mailman (input) for mailman id 476205;
 Thu, 12 Jan 2023 14:39:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdGT=5J=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pFyjp-0002av-Ir
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 14:39:29 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7f83730-9286-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 15:39:25 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pFyjS-0040tE-0z; Thu, 12 Jan 2023 14:39:06 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id EA5E2300C50;
 Thu, 12 Jan 2023 15:39:12 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
 id B77922CC949A1; Thu, 12 Jan 2023 15:39:12 +0100 (CET)
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
X-Inumbo-ID: e7f83730-9286-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=+hVGbhW+kq8WeUTnRFVIQ4y6xF6mTUDTY1iojLvcO/Q=; b=VD2YCgkTmE2CQ4Y8uw29qiC2TE
	R80ib0ot/jJ/vDVx1nc81VA/UdFYRNG0RCJX9If+JwIwax/MdSzvs+229sqAm51rlqFP4ZtmBL6KE
	ZGwzJaeaNt97uYlCPg3WWmvJH6/Qc2TRui52REAxdkfvawrPGc1AlBYy8r3QDtkibYhajuP5B7DDl
	e4VUHACu7Phw+gAfdvDwUrseQHxbEogW6ZFrf4DGNzODQW73kd/B4Gn8iBVxRaIIdPZwruHvk8R/J
	U+pz1lXQCECLx95TWt3y1l8JrPMkbqVDOu1nEJOjWfQjLPnHBvOtaLz8Bxx4rBAruF+c4Yb+M8UAF
	+VcR5hIg==;
Message-ID: <20230112143825.644480983@infradead.org>
User-Agent: quilt/0.66
Date: Thu, 12 Jan 2023 15:31:43 +0100
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
Subject: [RFC][PATCH 2/6] x86/power: Inline write_cr[04]()
References: <20230112143141.645645775@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Since we can't do CALL/RET until GS is restored and CR[04] pinning is
of dubious value in this code path, simply write the stored values.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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



