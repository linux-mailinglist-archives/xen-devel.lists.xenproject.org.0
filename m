Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4037937201F
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121799.229710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lddss-0003wf-5C; Mon, 03 May 2021 19:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121799.229710; Mon, 03 May 2021 19:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lddss-0003wG-1y; Mon, 03 May 2021 19:05:34 +0000
Received: by outflank-mailman (input) for mailman id 121799;
 Mon, 03 May 2021 19:05:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D+pa=J6=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1lddsq-0003wB-Sl
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:05:33 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24b006c1-b8d1-4e9f-8574-c9e3865d71f5;
 Mon, 03 May 2021 19:05:31 +0000 (UTC)
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
X-Inumbo-ID: 24b006c1-b8d1-4e9f-8574-c9e3865d71f5
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1620068730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FLkve6HXLfgxpJAWW6er1tQK1qnNOtpub3goAX+TdbM=;
	b=r7T+1fS30pNUclSzvMNOId4Jc7ooI632oXoL+wBdH+efvKIyRgBV0QZHYfOBmZnYGuNGcV
	5U7ghgY6ShUSSX3nHIErQsr2UuP7dkwCXL55R4aXlU7ioqtUFsRpa89B63egHbiXRwP0IL
	sMdxQGpp5Xvp+a3O7/M81oE1aTtxmt520+GQS889a8UQhpEFALt5qWyM1/WlcTnEakkjc3
	3BfrS9syoDXogzgl0bBuzQPR8vlDeoWuIrzFrROO3rwKpGRz4JYIc10uCvO3a64e73KTt7
	EkAPlic1cFpwT5pV+b2xkced1EVqatU/4DpvaQlRBQbdRS03ncx6MAizauB9sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1620068730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FLkve6HXLfgxpJAWW6er1tQK1qnNOtpub3goAX+TdbM=;
	b=uD1KjZuTN8voYLmc+tVb3tu8d2nRizEfGUX5ZzhqdF060ShxUwNwzIyqHVUSEuiKrn0AO5
	2P8oP1s8gcjL/IAw==
To: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Cc: Lai Jiangshan <laijs@linux.alibaba.com>, Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Steven Rostedt <rostedt@goodmis.org>, Andi Kleen <ak@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Uros Bizjak <ubizjak@gmail.com>, Maxim Levitsky <mlevitsk@redhat.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Alexandre Chartre <alexandre.chartre@oracle.com>, Joerg Roedel <jroedel@suse.de>, Jian Cai <caij2003@gmail.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/4] x86/xen/entry: Rename xenpv_exc_nmi to noist_exc_nmi
In-Reply-To: <20210426230949.3561-2-jiangshanlai@gmail.com>
References: <20210426230949.3561-1-jiangshanlai@gmail.com> <20210426230949.3561-2-jiangshanlai@gmail.com>
Date: Mon, 03 May 2021 21:05:29 +0200
Message-ID: <87r1ind4ee.ffs@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 27 2021 at 07:09, Lai Jiangshan wrote:
> From: Lai Jiangshan <laijs@linux.alibaba.com>
>
> There is no any functionality change intended.  Just rename it and
> move it to arch/x86/kernel/nmi.c so that we can resue it later in
> next patch for early NMI and kvm.

'Reuse it later' is not really a proper explanation why this change it
necessary.

Also this can be simplified by using aliasing which keeps the name
spaces intact.

Thanks,

        tglx
---       

--- a/arch/x86/include/asm/idtentry.h
+++ b/arch/x86/include/asm/idtentry.h
@@ -135,6 +135,9 @@ static __always_inline void __##func(str
 #define DEFINE_IDTENTRY_RAW(func)					\
 __visible noinstr void func(struct pt_regs *regs)
 
+#define DEFINE_IDTENTRY_RAW_ALIAS(alias, func)				\
+__visible noinstr void func(struct pt_regs *regs) __alias(alias)
+
 /**
  * DECLARE_IDTENTRY_RAW_ERRORCODE - Declare functions for raw IDT entry points
  *				    Error code pushed by hardware
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -524,6 +524,8 @@ DEFINE_IDTENTRY_RAW(exc_nmi)
 		mds_user_clear_cpu_buffers();
 }
 
+DEFINE_IDTENTRY_RAW_ALIAS(exc_nmi, xenpv_exc_nmi);
+
 void stop_nmi(void)
 {
 	ignore_nmis++;
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -565,12 +565,6 @@ static void xen_write_ldt_entry(struct d
 
 void noist_exc_debug(struct pt_regs *regs);
 
-DEFINE_IDTENTRY_RAW(xenpv_exc_nmi)
-{
-	/* On Xen PV, NMI doesn't use IST.  The C part is the same as native. */
-	exc_nmi(regs);
-}
-
 DEFINE_IDTENTRY_RAW_ERRORCODE(xenpv_exc_double_fault)
 {
 	/* On Xen PV, DF doesn't use IST.  The C part is the same as native. */

