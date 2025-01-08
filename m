Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15ADA061D7
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 17:27:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867667.1279233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVYtR-000305-OD; Wed, 08 Jan 2025 16:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867667.1279233; Wed, 08 Jan 2025 16:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVYtR-0002xM-Ks; Wed, 08 Jan 2025 16:26:53 +0000
Received: by outflank-mailman (input) for mailman id 867667;
 Wed, 08 Jan 2025 16:26:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HyFE=UA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tVYtQ-0002xG-Ds
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 16:26:52 +0000
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ccf4edf-cddd-11ef-a0df-8be0dac302b0;
 Wed, 08 Jan 2025 17:26:50 +0100 (CET)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so198297566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 08:26:50 -0800 (PST)
Received: from localhost ([66.81.170.107]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f06c7c2sm2538861566b.188.2025.01.08.08.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 08:26:49 -0800 (PST)
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
X-Inumbo-ID: 5ccf4edf-cddd-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736353609; x=1736958409; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qVzn0z445RQS5gwGXwSCuVuf/09zUIYv/O1e8RORDQ=;
        b=B29XS5Wn4wk/nsZhifzoOUYH/07nMPICfWt5P1a2abH50heEWYs5B6DgfAE+PiJ3W0
         AsthmKvXhk7AOKGyI0qh08k104QwmQvU0vTMpswDWFMwaxcXd1bM8HjxxrbBlVMbXXK2
         zZUfgJADAig6VaR975mKTGOs5RsYWFBSsGlA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736353609; x=1736958409;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9qVzn0z445RQS5gwGXwSCuVuf/09zUIYv/O1e8RORDQ=;
        b=nGDLAPJlcxzgEMkG5fIIyzpylHw7JvqM/io99IjqkNP48YbRlaRobhA9cRIQmwqv3K
         PUSTfEqTKm7JfRdkVs1I8gjQ3IWUNypPUeZLsXmTsUwdW9lYKBxgw0n61p4yWnF/vPob
         ydNHDR+mKBADVAwuANjtshT7Ntsqdw+wmoqPcPBOAnWa3Ch5paw21ZqxgVWrboagrWhV
         6wj6LWeR3SaLC+6Jw5frdlUgkhZiJSBOaoM8LplUQ9Y8+3Km60BDQKfI6Y4ZuYFuGBb1
         uiMvi+S/HqBaBZBcwcaBJmR1DhAVShuMxW9cSKjRLK6g1ooUsqFU2RGibwiN3O0xDaSy
         d1rg==
X-Forwarded-Encrypted: i=1; AJvYcCU1t4qa6D0YI7sJdESiV3UOa0ANpB+3h+jAaQvj4AjtJZKAFWw3/aQ2jdQXCnyOr4EFhVkVZBmfw1w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyGl3So+BJE+e7kaBcHMjGtrJvuJGI1JF5TsFGEue5H2qpblGtF
	iwM3UjzPmgUZ+ebY1R/BfApnR72kaW532y7f/JrQ/wQEC4tK/7P7qdfCOHyoZbY=
X-Gm-Gg: ASbGncvI25tshA+KnR/u4m8ByhQDQzJgCfqHGzfE1wXjso/FgyqG93rxFt0jJpXXgWK
	bMhyzProsc4nQoKqyBCfYgMH06Jp7vPUjL8HysL47KhocMOXNuBsf8FMitLGQhe86IX5Uj86PkN
	Ox3NlZ9LQpJD3+2uv8bqo9Ic6TFOnmq/5qvVkzxeHt5lfLnLrWImUo2ss2EAsEPgPCHIdJhztJj
	O/p4ssTSJFneZHKvUndMpqEmvEzs8NMp7Kst0c2d/S9JkA1zRfetMkmCXZoomk=
X-Google-Smtp-Source: AGHT+IGeyzSl67XwMVKT2w8uqO00FNXE5fclltvJae3ciHJwU9FDedpvpzQ/ttHCVXzK+6GVdbXElA==
X-Received: by 2002:a17:907:6e8a:b0:aa6:50ee:d44c with SMTP id a640c23a62f3a-ab2a7a1164fmr282616566b.15.1736353609475;
        Wed, 08 Jan 2025 08:26:49 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jan 2025 16:26:46 +0000
Message-Id: <D6WTZES0WLY8.3QDZ5BCM7CEIX@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 02/18] x86/domain: limit window where curr_vcpu !=
 current on context switch
X-Mailer: aerc 0.18.2
References: <20250108142659.99490-1-roger.pau@citrix.com>
 <20250108142659.99490-3-roger.pau@citrix.com>
In-Reply-To: <20250108142659.99490-3-roger.pau@citrix.com>

This is a net gain even without ASI. Having "current" hold the previous vCP=
U on
__context_switch() makes it _a lot_ easier to follow the lazy switch path.

On Wed Jan 8, 2025 at 2:26 PM GMT, Roger Pau Monne wrote:
> On x86 Xen will perform lazy context switches to the idle vCPU, where the
> previously running vCPU context is not overwritten, and only current is u=
pdated
> to point to the idle vCPU.  The state is then disjunct between current an=
d
> curr_vcpu: current points to the idle vCPU, while curr_vcpu points to the=
 vCPU
> whose context is loaded on the pCPU.
>
> While on that lazy context switched state, certain calls (like
> map_domain_page()) will trigger a full synchronization of the pCPU state =
by
> forcing a context switch.  Note however how calling any of such functions
> inside the context switch code itself is very likely to trigger an infini=
te
> recursion loop.
>
> Attempt to limit the window where curr_vcpu !=3D current in the context s=
witch
> code, as to prevent and infinite recursion loop around sync_local_execsta=
te().
>
> This is required for using map_domain_page() in the vCPU context switch c=
ode,
> otherwise using map_domain_page() in that context ends up in a recursive
> sync_local_execstate() loop:
>
> map_domain_page() -> sync_local_execstate() -> map_domain_page() -> ...

More generally, it's worth mentioning that we want to establish an invarian=
t
between a per-cpu variable (curr_vcpu) and the currently running page table=
s.
That way it can be used as discriminant to know which are the currently act=
ive
per-vCPU mappings.

That's essential for implementing FPU hiding as proposed here:

  https://lore.kernel.org/xen-devel/20241105143310.28301-1-alejandro.vallej=
o@cloud.com/

A shorter form of that should probably be mentioned also...

>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - New in this version.
> ---
>  xen/arch/x86/domain.c | 58 +++++++++++++++++++++++++++++++++++--------
>  xen/arch/x86/traps.c  |  2 --
>  2 files changed, 48 insertions(+), 12 deletions(-)
>
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 78a13e6812c9..1f680bf176ee 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1982,16 +1982,16 @@ static void load_default_gdt(unsigned int cpu)
>      per_cpu(full_gdt_loaded, cpu) =3D false;
>  }
> =20
> -static void __context_switch(void)
> +static void __context_switch(struct vcpu *n)
>  {
>      struct cpu_user_regs *stack_regs =3D guest_cpu_user_regs();
>      unsigned int          cpu =3D smp_processor_id();
>      struct vcpu          *p =3D per_cpu(curr_vcpu, cpu);
> -    struct vcpu          *n =3D current;
>      struct domain        *pd =3D p->domain, *nd =3D n->domain;
> =20
>      ASSERT(p !=3D n);
>      ASSERT(!vcpu_cpu_dirty(n));
> +    ASSERT(p =3D=3D current);
> =20
>      if ( !is_idle_domain(pd) )
>      {
> @@ -2036,6 +2036,18 @@ static void __context_switch(void)
> =20
>      write_ptbase(n);
> =20
> +    /*
> +     * It's relevant to set both current and curr_vcpu back-to-back, to =
avoid a
> +     * window where calls to mapcache_current_vcpu() during the context =
switch
> +     * could trigger a recursive loop.
> +     *
> +     * Do the current switch immediately after switching to the new gues=
t
> +     * page-tables, so that current is (almost) always in sync with the
> +     * currently loaded page-tables.
> +     */
> +    set_current(n);
> +    per_cpu(curr_vcpu, cpu) =3D n;

... here. So we're not tempted to move these 2 far off from write_ptbase().

> +
>  #ifdef CONFIG_PV
>      /* Prefetch the VMCB if we expect to use it later in the context swi=
tch */
>      if ( using_svm() && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
> @@ -2048,8 +2060,6 @@ static void __context_switch(void)
>      if ( pd !=3D nd )
>          cpumask_clear_cpu(cpu, pd->dirty_cpumask);
>      write_atomic(&p->dirty_cpu, VCPU_CPU_CLEAN);
> -
> -    per_cpu(curr_vcpu, cpu) =3D n;
>  }
> =20
>  void context_switch(struct vcpu *prev, struct vcpu *next)
> @@ -2081,16 +2091,36 @@ void context_switch(struct vcpu *prev, struct vcp=
u *next)
> =20
>      local_irq_disable();
> =20
> -    set_current(next);
> -
>      if ( (per_cpu(curr_vcpu, cpu) =3D=3D next) ||
>           (is_idle_domain(nextd) && cpu_online(cpu)) )
>      {
> +        /*
> +         * Lazy context switch to the idle vCPU, set current =3D=3D idle=
.  Full
> +         * context switch happens if/when sync_local_execstate() is call=
ed.
> +         */
> +        set_current(next);
>          local_irq_enable();
>      }
>      else
>      {
> -        __context_switch();
> +        /*
> +         * curr_vcpu will always point to the currently loaded vCPU cont=
ext, as

nit: s/will always point/always points/ ? It's an inconditional invariant,
after all.

> +         * it's not updated when doing a lazy switch to the idle vCPU.
> +         */
> +        struct vcpu *prev_ctx =3D per_cpu(curr_vcpu, cpu);
> +
> +        if ( prev_ctx !=3D current )
> +        {
> +            /*
> +             * Doing a full context switch to a non-idle vCPU from a laz=
y
> +             * context switched state.  Adjust current to point to the
> +             * currently loaded vCPU context.
> +             */
> +            ASSERT(current =3D=3D idle_vcpu[cpu]);
> +            ASSERT(!is_idle_vcpu(next));
> +            set_current(prev_ctx);
> +        }
> +        __context_switch(next);
> =20
>          /* Re-enable interrupts before restoring state which may fault. =
*/
>          local_irq_enable();
> @@ -2156,15 +2186,23 @@ int __sync_local_execstate(void)
>  {
>      unsigned long flags;
>      int switch_required;
> +    unsigned int cpu =3D smp_processor_id();
> +    struct vcpu *p;
> =20
>      local_irq_save(flags);
> =20
> -    switch_required =3D (this_cpu(curr_vcpu) !=3D current);
> +    p =3D per_cpu(curr_vcpu, cpu);
> +    switch_required =3D (p !=3D current);
> =20
>      if ( switch_required )
>      {
> -        ASSERT(current =3D=3D idle_vcpu[smp_processor_id()]);
> -        __context_switch();
> +        ASSERT(current =3D=3D idle_vcpu[cpu]);
> +        /*
> +         * Restore current to the previously running vCPU, __context_swi=
tch()
> +         * will update current together with curr_vcpu.
> +         */
> +        set_current(p);
> +        __context_switch(idle_vcpu[cpu]);
>      }
> =20
>      local_irq_restore(flags);
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 87b30ce4df2a..487b8c5a78c5 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -2232,8 +2232,6 @@ void __init trap_init(void)
> =20
>  void activate_debugregs(const struct vcpu *curr)
>  {
> -    ASSERT(curr =3D=3D current);
> -
>      write_debugreg(0, curr->arch.dr[0]);
>      write_debugreg(1, curr->arch.dr[1]);
>      write_debugreg(2, curr->arch.dr[2]);

Cheers,
Alejandro

