Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B54940FEC
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 12:49:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767562.1178235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkQ2-0005Ht-8K; Tue, 30 Jul 2024 10:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767562.1178235; Tue, 30 Jul 2024 10:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkQ2-0005GP-5T; Tue, 30 Jul 2024 10:49:26 +0000
Received: by outflank-mailman (input) for mailman id 767562;
 Tue, 30 Jul 2024 10:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/bP=O6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYkQ1-0005GJ-5T
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:49:25 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61eb5507-4e61-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 12:49:24 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-7a1dd2004e1so275241985a.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 03:49:23 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a201bcfbc8sm46803885a.77.2024.07.30.03.49.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 03:49:22 -0700 (PDT)
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
X-Inumbo-ID: 61eb5507-4e61-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722336563; x=1722941363; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OgLCtt5Lvm07HTnzII7Mpc5F8wSjDwMWQlufjHET5h0=;
        b=PBORxhpyC6bwHYyd3LweE+d+OX+jfrhRcFAyaWGO4W9bIiqbP0Emfc0N04QuZNdXQs
         MUGJKBBjw7ynYHc5rDs3x/stlUBWux/rF3i8VMPmsUdFOLbfM1ChYIg31QZNkCisNtYO
         kUxulWCARsBRnzPaZp1Zoy6VJ6a4tiLK+Cgro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722336563; x=1722941363;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OgLCtt5Lvm07HTnzII7Mpc5F8wSjDwMWQlufjHET5h0=;
        b=usjtw0AACp91Tu5usdGYGua66LW93GFu6eYhOiVerNZmI01UZ1c+TCadXN0PVKox1b
         GyLFHei0y/Y6v0vDAbwPbzkjEypC3cL6aEE0olTMrwtAFD4mtRUYfUVc83UP375wqaVg
         SyBpubiUFjceVXg/OkrvOf19JP366Z88hr5PtDeTWhwjgW9SsnMIjxF5zZgMFneECU6y
         yE9FgM5DQx7aVuOyDWiqLboRV1wb6Di6E0a5LHWXAydO0Lht9xKUT0ngFQbDOZSjdo0x
         Nu2LlG8jLOPOgPqRcAMDNVxsUzEDID+fS7feseg+OM5DH58utXaK2jmXuzNNptKCzrFz
         ZO1g==
X-Gm-Message-State: AOJu0YxOafxh6x0vDQwMG8cGnYHjYY/KeobsgIy7KNTNTWvvwWUX1+QP
	BTIiRctIxwkB4Vsl/tCQrkqK1UGdqO+0ESDhRvb5Aldot4qD1IpxNEwjzFGKyk8=
X-Google-Smtp-Source: AGHT+IHQ5gU4H9i2DQyhaaYWH2VkpYp6KqiakEuesWMBOcHl2/dtKLaMqGnuIb0d3Idf0rm9MzrCYQ==
X-Received: by 2002:a05:620a:370b:b0:79e:fc8c:daf1 with SMTP id af79cd13be357-7a1e52475dfmr1367298785a.19.1722336562585;
        Tue, 30 Jul 2024 03:49:22 -0700 (PDT)
Date: Tue, 30 Jul 2024 12:49:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, alejandro.vallejo@cloud.com,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 22/22] x86/mm: zero stack on stack switch or reset
Message-ID: <ZqjFB3U-7l8Nop_u@macbook>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-23-roger.pau@citrix.com>
 <5e600017-e929-4ebf-b620-1e673b06fc1a@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e600017-e929-4ebf-b620-1e673b06fc1a@citrix.com>

On Mon, Jul 29, 2024 at 04:40:24PM +0100, Andrew Cooper wrote:
> On 26/07/2024 4:22 pm, Roger Pau Monne wrote:
> > With the stack mapped on a per-CPU basis there's no risk of other CPUs being
> > able to read the stack contents, but vCPUs running on the current pCPU could
> > read stack rubble from operations of previous vCPUs.
> >
> > The #DF stack is not zeroed because handling of #DF results in a panic.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/include/asm/current.h | 30 +++++++++++++++++++++++++++++-
> >  1 file changed, 29 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
> > index 75b9a341f814..02b4118b03ef 100644
> > --- a/xen/arch/x86/include/asm/current.h
> > +++ b/xen/arch/x86/include/asm/current.h
> > @@ -177,6 +177,14 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
> >  # define SHADOW_STACK_WORK ""
> >  #endif
> >  
> > +#define ZERO_STACK                                              \
> > +    "test %[stk_size], %[stk_size];"                            \
> > +    "jz .L_skip_zeroing.%=;"                                    \
> > +    "std;"                                                      \
> > +    "rep stosb;"                                                \
> > +    "cld;"                                                      \
> > +    ".L_skip_zeroing.%=:"
> > +
> >  #if __GNUC__ >= 9
> >  # define ssaj_has_attr_noreturn(fn) __builtin_has_attribute(fn, __noreturn__)
> >  #else
> > @@ -187,10 +195,24 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
> >  #define switch_stack_and_jump(fn, instr, constr)                        \
> >      ({                                                                  \
> >          unsigned int tmp;                                               \
> > +        bool zero_stack = current->domain->arch.asi;                    \
> >          BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
> > +        ASSERT(IS_ALIGNED((unsigned long)guest_cpu_user_regs() -        \
> > +                          PRIMARY_STACK_SIZE +                          \
> > +                          sizeof(struct cpu_info), PAGE_SIZE));         \
> > +        if ( zero_stack )                                               \
> > +        {                                                               \
> > +            unsigned long stack_top = get_stack_bottom() &              \
> > +                                      ~(STACK_SIZE - 1);                \
> > +                                                                        \
> > +            clear_page((void *)stack_top + IST_MCE * PAGE_SIZE);        \
> > +            clear_page((void *)stack_top + IST_NMI * PAGE_SIZE);        \
> > +            clear_page((void *)stack_top + IST_DB  * PAGE_SIZE);        \
> > +        }                                                               \
> >          __asm__ __volatile__ (                                          \
> >              SHADOW_STACK_WORK                                           \
> >              "mov %[stk], %%rsp;"                                        \
> > +            ZERO_STACK                                                  \
> >              CHECK_FOR_LIVEPATCH_WORK                                    \
> >              instr "[fun]"                                               \
> >              : [val] "=&r" (tmp),                                        \
> > @@ -201,7 +223,13 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
> >                ((PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8),               \
> >                [stack_mask] "i" (STACK_SIZE - 1),                        \
> >                _ASM_BUGFRAME_INFO(BUGFRAME_bug, __LINE__,                \
> > -                                 __FILE__, NULL)                        \
> > +                                 __FILE__, NULL),                       \
> > +              /* For stack zeroing. */                                  \
> > +              "D" ((void *)guest_cpu_user_regs() - 1),                  \
> > +              [stk_size] "c"                                            \
> > +              (zero_stack ? PRIMARY_STACK_SIZE - sizeof(struct cpu_info)\
> > +                          : 0),                                         \
> > +              "a" (0)                                                   \
> >              : "memory" );                                               \
> >          unreachable();                                                  \
> >      })
> 
> This looks very expensive.
> 
> For starters, switch_stack_and_jump() is used twice in a typical context
> switch; once in the schedule tail, and again out of hvm_do_resume().

Right, it's the reset_stack_and_call_ind() at the end of context
switch and then the reset_stack_and_jump() in the HVM tail context
switch handlers.

One option would be to only do the stack zeroing from the
reset_stack_and_call_ind() call in context_switch().

I've got no idea how expensive this is, I might try to run some
benchmarks to get some figures.  I was planning on running two VMs
with 1 vCPU each, both pinned to the same pCPU.

> 
> Furthermore, #MC happen never (to many many significant figures), #DB
> happens never for HVM guests (but does happen for PV), and NMIs are
> either ~never, or 2Hz which is far less often than the 30ms default
> timeslice.
> 
> So, the overwhelming majority of the time, those 3 calls to clear_page()
> will be re-zeroing blocks of zeroes.
> 
> This can probably be avoided by making use of ist_exit (held in %r12) to
> only zero an IST stack when leaving it.  This leaves the IRET frame able
> to be recovered, but with e.g. RFDS, you can do that irrespective, and
> it's not terribly sensitive.

I could look into that, TBH I was bordeline with clearing the IST
stacks, as I wasn't convinced there could be anything sensitive there,
but again couldn't convince myself there's nothing sensitive now,
nor can be in the future.

> What about shadow stacks?  You're not zeroing those, and while they're
> less sensitive than the data stack, there ought to be some reasoning
> about them.

I've assumed that shadow stacks only contained the expected return
addresses, and hence won't be considered sensitive information, but
maybe I was too lax.

An attacker could get execution traces of the previous vCPU, and that
might be useful for some exploits?

Thanks, Roger.

