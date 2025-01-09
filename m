Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 661F4A07ED2
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 18:34:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869040.1280549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVwPj-0003wy-Sg; Thu, 09 Jan 2025 17:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869040.1280549; Thu, 09 Jan 2025 17:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVwPj-0003uL-Pm; Thu, 09 Jan 2025 17:33:47 +0000
Received: by outflank-mailman (input) for mailman id 869040;
 Thu, 09 Jan 2025 17:33:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wq9x=UB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVwPi-0003uF-5Z
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 17:33:46 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e027a893-ceaf-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 18:33:44 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d7e527becaso1775663a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 09:33:44 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d99046dbe0sm763662a12.64.2025.01.09.09.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 09:33:43 -0800 (PST)
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
X-Inumbo-ID: e027a893-ceaf-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736444024; x=1737048824; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JzKhBI1cXTVoa2sd7mMp06AWWNZGyM+8VilnqPMT/Co=;
        b=rSAh/eV+SI4uKM0S9yaVXIZgPwPsHBWVuLTTFHHGZNv7OY3OFoYQsMz8OX6rDWJkKc
         814iHMaquY/7+tz5/lIQfmric3CmP6rE7G36ZdB1MFFn4ZhHnzFhCKg+soL9lEIgcxZY
         z+/aS+m7vrPX9I5QcEYUDZA1qnszmK63r47Ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736444024; x=1737048824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JzKhBI1cXTVoa2sd7mMp06AWWNZGyM+8VilnqPMT/Co=;
        b=psHQhi4iz3uosRiyglwY6KypU94bzk2V73VZ9Bfx0SGgP7MHpOSrmWFu0cASoQgsoA
         GwddisW2sewhEWuY5909Cnt5+K8Nk4lAWcW4nDsxOucDzAGSP6prmkzYNUjGw1bI52i7
         M0mhCS6jTCXf+/VWoS7ygtPWvPO8z74GSzzGozdsGi93HKjzcAZi8l8wejQ++QueWYTK
         lPlbXKe/NUqkhKcKk6wkXjYIecR1pL08+lAodx+jtmiJJwsfbAIPSEPG6zLOCp/Bv/yQ
         xdCFbjiQ4RC5h0aqIhOkFoTzYjnVwNCSiGy55lIqE0ilHbLUYeODwQVUk7fsmS6bCdMO
         6yeg==
X-Forwarded-Encrypted: i=1; AJvYcCUhrjAykdhETFYWkCKc/rkYVJAeUIYuSaj8dGBWud7AtqUf5d4XhhWQWAgugt0TmKQyUokBgyPd8ys=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwAcdetttsgxmtwTsHL4WQIk+JIpXvOJy16oVlIpunDSMAsgAmr
	gu4URu+09wHZXLMo85JX+RciL1VpaXQEbiu4EclxqyeBMi/izMdkM8bSVUQK0j4=
X-Gm-Gg: ASbGncttKBMKwACxjGSW2ks0P8m39saa5aGGBIdnf1QZA11CvxipUIx3yRMoPuv8xsB
	YOsXOY2zKyf4SpI5319Pe4NIUTBsqAwfp+aX4cy7fQX+2RmMN2JilBoDPDXRxNpR4IYODMN4gCM
	w1g7T6EmIOBF/LziHYlaS8PXUotLMLURpsCZtmwzGmKUPllgy70IMziIpu4rJrMx6fdD3ko3esp
	cseTjClV2KAZDfkB8itjKMLBhh7tnWxZjvcnm0kIzkyWOgmR76OYVEkAO7yULNRehA=
X-Google-Smtp-Source: AGHT+IG632Ne3S+9lQD60z67EMLW4FmqW81RFNEMU7s1mI5XDYP6woETVH2JPOa3se1waIp0qiWkRg==
X-Received: by 2002:a05:6402:400a:b0:5d2:7199:ac2 with SMTP id 4fb4d7f45d1cf-5d972e00032mr17291084a12.2.1736444024071;
        Thu, 09 Jan 2025 09:33:44 -0800 (PST)
Date: Thu, 9 Jan 2025 18:33:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 02/18] x86/domain: limit window where curr_vcpu !=
 current on context switch
Message-ID: <Z4AIdlx7uWcS3cOP@macbook.local>
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-3-roger.pau@citrix.com>
 <46cb0ee0-ea9f-4515-abac-058a9aa846e4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <46cb0ee0-ea9f-4515-abac-058a9aa846e4@suse.com>

On Thu, Jan 09, 2025 at 09:59:58AM +0100, Jan Beulich wrote:
> On 08.01.2025 15:26, Roger Pau Monne wrote:
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
> 
> Question is whether it's a good idea in the first place to start using
> map_domain_page() from the context switch path. Surely there are possible
> alternatives.

It seemed more natural rather the introducing yet something new to use
in the context switch path.  I'm happy to hear recommendations, but
overall introducing yet another interface to map stuff just for the
context switch path seems worse than extending an existing interface
to work in that context.

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
> The latter paragraph of the comment states something that so far wasn't intended,
> and imo also shouldn't be going forward. It's curr_vcpu which wants to be in sync
> with the loaded page tables. (Whether pulling ahead its updating is okay is a
> separate question. All of these actions used to be be very carefully placed they
> way they are. Which isn't to say that I can exclude things having gone stale ...)

I've noticed this was all quite carefully placed.  I've also attempted
to take care with the changes I've done here (and tested them
extensively).

> And yes, that has always meant that mapcache_current_vcpu()'s condition for
> calling sync_local_execstate() was building upon the fact that it won't be called
> from context switching contexts.
> 
> Did you consider updating that condition (evaluating curr_cpu) instead?

We cannot safely use map_domain_page() if current != curr_vcpu,
because at any point (as a result of an interrupt) a call to
sync_local_execstate(), and thus remove the mappings created by
map_domain_page() as a result of performing a full context switch to
the idle vCPU (and the idle vCPU page tables).

> 
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
> 
> The comment is misleading as far as the first half of the if() condition goes:
> No further switching is going to happen in that case, aiui.

Right, I should clarify that comment: this is either a lazy context
switch, or the return from a lazy state to the previously running
vCPU.

> >      }
> >      else
> >      {
> > -        __context_switch();
> > +        /*
> > +         * curr_vcpu will always point to the currently loaded vCPU context, as
> > +         * it's not updated when doing a lazy switch to the idle vCPU.
> > +         */
> > +        struct vcpu *prev_ctx = per_cpu(curr_vcpu, cpu);
> > +
> > +        if ( prev_ctx != current )
> > +        {
> > +            /*
> > +             * Doing a full context switch to a non-idle vCPU from a lazy
> > +             * context switched state.  Adjust current to point to the
> > +             * currently loaded vCPU context.
> > +             */
> > +            ASSERT(current == idle_vcpu[cpu]);
> > +            ASSERT(!is_idle_vcpu(next));
> > +            set_current(prev_ctx);
> 
> This feels wrong, as in "current" then not representing what it should represent,
> for a certain time window. I may be dense, but neither comment not description
> clarify to me why this might be needed. I can see that it's needed to please the
> ASSERT() you add to __context_switch(), yet then I might ask why that assertion
> is put there.

This is done so that when calling __context_switch() current ==
curr_vcpu, and map_domain_page() can be used without getting into an
infinite sync_local_execstate() recursion loop.

> 
> > +        }
> > +        __context_switch(next);
> >  
> >          /* Re-enable interrupts before restoring state which may fault. */
> >          local_irq_enable();
> > @@ -2156,15 +2186,23 @@ int __sync_local_execstate(void)
> >  {
> >      unsigned long flags;
> >      int switch_required;
> > +    unsigned int cpu = smp_processor_id();
> > +    struct vcpu *p;
> >  
> >      local_irq_save(flags);
> >  
> > -    switch_required = (this_cpu(curr_vcpu) != current);
> > +    p = per_cpu(curr_vcpu, cpu);
> > +    switch_required = (p != current);
> >  
> >      if ( switch_required )
> >      {
> > -        ASSERT(current == idle_vcpu[smp_processor_id()]);
> > -        __context_switch();
> > +        ASSERT(current == idle_vcpu[cpu]);
> > +        /*
> > +         * Restore current to the previously running vCPU, __context_switch()
> > +         * will update current together with curr_vcpu.
> > +         */
> > +        set_current(p);
> 
> Similarly here.

Same reason, so that when calling __context_switch() current ==
curr_vcpu and map_domain_page() can be used (and in general
sync_local_execstate() becomes a no-op because a switch is already in
process.)

> 
> > +        __context_switch(idle_vcpu[cpu]);
> >      }
> >  
> >      local_irq_restore(flags);
> > --- a/xen/arch/x86/traps.c
> > +++ b/xen/arch/x86/traps.c
> > @@ -2232,8 +2232,6 @@ void __init trap_init(void)
> >  
> >  void activate_debugregs(const struct vcpu *curr)
> >  {
> > -    ASSERT(curr == current);
> > -
> >      write_debugreg(0, curr->arch.dr[0]);
> >      write_debugreg(1, curr->arch.dr[1]);
> >      write_debugreg(2, curr->arch.dr[2]);
> 
> Why would this assertion go away? If it suddenly triggers, the parameter name
> would now end up being wrong.

Well, at the point where activate_debugregs() gets called (in
paravirt_ctxt_switch_to()), current == previous as a result of this
change, so the assert is no longer true on purpose on that call
path.

Thanks, Roger.

