Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B661669FE0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 18:18:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477498.740228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGNgY-000411-MX; Fri, 13 Jan 2023 17:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477498.740228; Fri, 13 Jan 2023 17:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGNgY-0003yN-Jk; Fri, 13 Jan 2023 17:17:46 +0000
Received: by outflank-mailman (input) for mailman id 477498;
 Fri, 13 Jan 2023 17:17:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TZVY=5K=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1pGNgW-0003yF-QB
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 17:17:45 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2faede74-9366-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 18:17:41 +0100 (CET)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pGNgZ-006HaL-9N; Fri, 13 Jan 2023 17:17:47 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 80FF7300094;
 Fri, 13 Jan 2023 18:17:32 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 59EA620A72A62; Fri, 13 Jan 2023 18:17:32 +0100 (CET)
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
X-Inumbo-ID: 2faede74-9366-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EDJ4xEF3lLYItJUA9SlN4B6NAGGeDix65KOyh4872KE=; b=aXGlnATjL/pIS/dvAc4QlTkC6n
	98Kga71sLav22h3qllusB8eu2B0ZdlIgpZcdvtKspuKgFQbCbUSVBF4X8qJwLt51fu8xisXhXywWa
	twLWUZjoFoNDX9Ees0xi3v4KhtyssJl04flS52YYf5y7rUuUyrU1GiJfmx+YfQMvbLOLl8Ngq4hfl
	Gm4QGhDNhBkYsb0ocZfuUvta1wC1w+K/gD/h2lN/BnXJXCf6VWmWxO/D7rY41Udntbi3TZupthNkl
	22GSsyOJZyDXLiDsVCH8BGAIXlR7Mc/CEOuAerH/v8gnYftKmtj4kulSxMXdLOU85rp5RmPxEGxh9
	y1vEGrDA==;
Date: Fri, 13 Jan 2023 18:17:32 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, x86@kernel.org,
	Joan Bruguera <joanbrugueram@gmail.com>,
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, mark.rutland@arm.com
Subject: Re: [RFC][PATCH 2/6] x86/power: Inline write_cr[04]()
Message-ID: <Y8GSLDhgMlE96P6+@hirez.programming.kicks-ass.net>
References: <20230112143141.645645775@infradead.org>
 <20230112143825.644480983@infradead.org>
 <Y8FZvLq+MeQ7A+lI@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8FZvLq+MeQ7A+lI@gmail.com>

On Fri, Jan 13, 2023 at 02:16:44PM +0100, Ingo Molnar wrote:
> 
> * Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > Since we can't do CALL/RET until GS is restored and CR[04] pinning is
> > of dubious value in this code path, simply write the stored values.
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  arch/x86/power/cpu.c |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > --- a/arch/x86/power/cpu.c
> > +++ b/arch/x86/power/cpu.c
> > @@ -208,11 +208,11 @@ static void notrace __restore_processor_
> >  #else
> >  /* CONFIG X86_64 */
> >  	native_wrmsrl(MSR_EFER, ctxt->efer);
> > -	native_write_cr4(ctxt->cr4);
> > +	asm volatile("mov %0,%%cr4": "+r" (ctxt->cr4) : : "memory");
> 
> >  #endif
> >  	native_write_cr3(ctxt->cr3);
> >  	native_write_cr2(ctxt->cr2);
> > -	native_write_cr0(ctxt->cr0);
> > +	asm volatile("mov %0,%%cr0": "+r" (ctxt->cr0) : : "memory");
> 
> Yeah, so CR pinning protects against are easily accessible 'gadget' 
> functions that exploits can call to disable HW protection features in the 
> CR register.
> 
> __restore_processor_state() might be such a gadget if an exploit can pass 
> in a well-prepared 'struct saved_context' on the stack.

Given the extent of saved_context, I think it's a total loss. Best we
can do is something like the last patch here that dis-allows indirect
calls of this function entirely (on appropriate builds/hardware).

> Can we set up cr0/cr4 after we have a proper GS, or is that a 
> chicken-and-egg scenario?

Can be done, but given the state we're in, I'd rather have the simplest
possible rules, calling out to functions with dodgy CR[04] is
'suboptimal' as well.

If people really worry about this I suppose we can call the full
native_write_cr4() later to double check the value in the context or
something.

