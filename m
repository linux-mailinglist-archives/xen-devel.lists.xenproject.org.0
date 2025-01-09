Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A15A07EE3
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 18:39:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869049.1280560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVwUr-0006LF-FP; Thu, 09 Jan 2025 17:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869049.1280560; Thu, 09 Jan 2025 17:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVwUr-0006Iw-CG; Thu, 09 Jan 2025 17:39:05 +0000
Received: by outflank-mailman (input) for mailman id 869049;
 Thu, 09 Jan 2025 17:39:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wq9x=UB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVwUq-0006I8-D7
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 17:39:04 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e09c4c7-ceb0-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 18:39:03 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5d8c1950da7so1909538a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 09:39:03 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c3fccsm784206a12.21.2025.01.09.09.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 09:39:02 -0800 (PST)
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
X-Inumbo-ID: 9e09c4c7-ceb0-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736444343; x=1737049143; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JywzAdE153bhRxUOUqrnlFE1jMhv4h4kJaSzC2+0ptE=;
        b=sZs8YHPKjzzaDBxIrsW/g1OgLb2vKDawJ5G2735Wmx9JGgv+SK2P3cK9Kiwyvh+pkF
         IDVUM+jnRwKrm0FWI7ITxrd69QxFL1DofXwua3pnpUimOZDhh/L1vsvBn8LQMQUOG4Vd
         aYVbtO5nhRwwgdIANMOcCVkc4jnaODn1LukhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736444343; x=1737049143;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JywzAdE153bhRxUOUqrnlFE1jMhv4h4kJaSzC2+0ptE=;
        b=mUjSjonbQl7HKA0damkRLq68zDS0DUn251/jRq+lRkVUWpMVLS3iDxQ3YuftB2dlEV
         q1zToIAhbuwkiL6/jsE/CIdJRuMDAcRcFDDYgPILmQGuxAbju85mmD4sYe2TElExHVIC
         tSVwJh2xOzjS30LN1FqYUuOl8O6B5VEkrWRBwnM+QAriTwMJJfAnLkCIUwajH0G6Pgg2
         tkDzKnjoVwzZARdoOXmV8gP5xDpZEU8KsTb0p69uLhwiYt6EfQQBB/w/odPuODQTq24e
         AceHVKLE9mH98VT7bCmEACp9c+oeP4CHldnr9I0xhRohTrWZ/iCn9fEyleoDO+MihvKu
         cB4w==
X-Gm-Message-State: AOJu0YwXFzMGMmkj3VEYf6EwBejXjjkOpAClFd32J4yWlkLwWdhycuMG
	GeqCEGpzdfB99P1XFVG14JqH/bRuNJr/Avj02J6PadRZwQhv56ZDgsAEoDYMHn8p9rT4sdIZ2g6
	V
X-Gm-Gg: ASbGncuU6TxhiQJNDzbsEEIqSUCOWzupJ4v8dBG7+megM5YFkhu+ZxEDBSuo5GBszNs
	fPuTURdHA6idx5vAPDXJNLlgkSMrhWEbMzSCbR3pCf1Xosvvpcx0yANOgrGk0+oT8OpcAGEYdPl
	zgZmLMW5OIeUQ/dglmtOaUcz09MSejXXC8yUagG7uI9Sg2UKAB7qeLsSB85qyrgmEAbkf0MHo3t
	grCfM/yEtv2Wh1C5CAHnohvM6gTglqyv0RZVTwb2Px4InMVMOsYDRHCH8PrSgRkh2Y=
X-Google-Smtp-Source: AGHT+IHLtagGuUDLtnzPNVr6lmDNNFShks4lLDJJsPK1kaVKwe0q6t8NWsFfCbbtJwjpLXYhrLKQ4A==
X-Received: by 2002:a05:6402:2790:b0:5d4:5e4:1555 with SMTP id 4fb4d7f45d1cf-5d972e148dbmr7183201a12.19.1736444342707;
        Thu, 09 Jan 2025 09:39:02 -0800 (PST)
Date: Thu, 9 Jan 2025 18:39:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 02/18] x86/domain: limit window where curr_vcpu !=
 current on context switch
Message-ID: <Z4AJtZhIrRK4vQoe@macbook.local>
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-3-roger.pau@citrix.com>
 <D6WTZES0WLY8.3QDZ5BCM7CEIX@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D6WTZES0WLY8.3QDZ5BCM7CEIX@cloud.com>

On Wed, Jan 08, 2025 at 04:26:46PM +0000, Alejandro Vallejo wrote:
> This is a net gain even without ASI. Having "current" hold the previous vCPU on
> __context_switch() makes it _a lot_ easier to follow the lazy switch path.
> 
> On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> > On x86 Xen will perform lazy context switches to the idle vCPU, where the
> > previously running vCPU context is not overwritten, and only current is updated
> > to point to the idle vCPU.  The state is then disjunct between current and
> > curr_vcpu: current points to the idle vCPU, while curr_vcpu points to the vCPU
> > whose context is loaded on the pCPU.
> >
> > While on that lazy context switched state, certain calls (like
> > map_domain_page()) will trigger a full synchronization of the pCPU state by
> > forcing a context switch.  Note however how calling any of such functions
> > inside the context switch code itself is very likely to trigger an infinite
> > recursion loop.
> >
> > Attempt to limit the window where curr_vcpu != current in the context switch
> > code, as to prevent and infinite recursion loop around sync_local_execstate().
> >
> > This is required for using map_domain_page() in the vCPU context switch code,
> > otherwise using map_domain_page() in that context ends up in a recursive
> > sync_local_execstate() loop:
> >
> > map_domain_page() -> sync_local_execstate() -> map_domain_page() -> ...
> 
> More generally, it's worth mentioning that we want to establish an invariant
> between a per-cpu variable (curr_vcpu) and the currently running page tables.
> That way it can be used as discriminant to know which are the currently active
> per-vCPU mappings.

You kind of already do this by checking curr_vcpu, as with this
changes there's still a window where the vCPU is lazy context
switched, and hence current != curr_vcpu (and curr_vcpu should signal
what page-tables are loaded).

The main point apart from more accurate signaling of the loaded
page-tables is to avoid infinite recursion if sync_local_execstate()
is called inside the context switch path.

> That's essential for implementing FPU hiding as proposed here:
> 
>   https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.vallejo@cloud.com/
> 
> A shorter form of that should probably be mentioned also...
> 
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - New in this version.
> > ---
> >  xen/arch/x86/domain.c | 58 +++++++++++++++++++++++++++++++++++--------
> >  xen/arch/x86/traps.c  |  2 --
> >  2 files changed, 48 insertions(+), 12 deletions(-)
> >
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 78a13e6812c9..1f680bf176ee 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -1982,16 +1982,16 @@ static void load_default_gdt(unsigned int cpu)
> >      per_cpu(full_gdt_loaded, cpu) = false;
> >  }
> >  
> > -static void __context_switch(void)
> > +static void __context_switch(struct vcpu *n)
> >  {
> >      struct cpu_user_regs *stack_regs = guest_cpu_user_regs();
> >      unsigned int          cpu = smp_processor_id();
> >      struct vcpu          *p = per_cpu(curr_vcpu, cpu);
> > -    struct vcpu          *n = current;
> >      struct domain        *pd = p->domain, *nd = n->domain;
> >  
> >      ASSERT(p != n);
> >      ASSERT(!vcpu_cpu_dirty(n));
> > +    ASSERT(p == current);
> >  
> >      if ( !is_idle_domain(pd) )
> >      {
> > @@ -2036,6 +2036,18 @@ static void __context_switch(void)
> >  
> >      write_ptbase(n);
> >  
> > +    /*
> > +     * It's relevant to set both current and curr_vcpu back-to-back, to avoid a
> > +     * window where calls to mapcache_current_vcpu() during the context switch
> > +     * could trigger a recursive loop.
> > +     *
> > +     * Do the current switch immediately after switching to the new guest
> > +     * page-tables, so that current is (almost) always in sync with the
> > +     * currently loaded page-tables.
> > +     */
> > +    set_current(n);
> > +    per_cpu(curr_vcpu, cpu) = n;
> 
> ... here. So we're not tempted to move these 2 far off from write_ptbase().

I think the "Do the current switch immediately after switching to the
new guest page-tables" sentence already signals that it's important to
keep the setting of current and curr_vcpu as close to the
write_ptbase() call as possible, but I'm open to suggestions for
better wording.

> > +
> >  #ifdef CONFIG_PV
> >      /* Prefetch the VMCB if we expect to use it later in the context switch */
> >      if ( using_svm() && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
> > @@ -2048,8 +2060,6 @@ static void __context_switch(void)
> >      if ( pd != nd )
> >          cpumask_clear_cpu(cpu, pd->dirty_cpumask);
> >      write_atomic(&p->dirty_cpu, VCPU_CPU_CLEAN);
> > -
> > -    per_cpu(curr_vcpu, cpu) = n;
> >  }
> >  
> >  void context_switch(struct vcpu *prev, struct vcpu *next)
> > @@ -2081,16 +2091,36 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
> >  
> >      local_irq_disable();
> >  
> > -    set_current(next);
> > -
> >      if ( (per_cpu(curr_vcpu, cpu) == next) ||
> >           (is_idle_domain(nextd) && cpu_online(cpu)) )
> >      {
> > +        /*
> > +         * Lazy context switch to the idle vCPU, set current == idle.  Full
> > +         * context switch happens if/when sync_local_execstate() is called.
> > +         */
> > +        set_current(next);
> >          local_irq_enable();
> >      }
> >      else
> >      {
> > -        __context_switch();
> > +        /*
> > +         * curr_vcpu will always point to the currently loaded vCPU context, as
> 
> nit: s/will always point/always points/ ? It's an inconditional invariant,
> after all.

Sure.

Thanks, Roger.

