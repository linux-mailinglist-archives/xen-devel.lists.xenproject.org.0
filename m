Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BF257A6AA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 20:43:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370968.602875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDsBe-00078a-1m; Tue, 19 Jul 2022 18:43:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370968.602875; Tue, 19 Jul 2022 18:43:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDsBd-00075h-U8; Tue, 19 Jul 2022 18:43:13 +0000
Received: by outflank-mailman (input) for mailman id 370968;
 Tue, 19 Jul 2022 18:43:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0N8=XY=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1oDsBc-00075b-VS
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 18:43:13 +0000
Received: from MTA-09-3.privateemail.com (mta-09-3.privateemail.com
 [68.65.122.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a273327d-0792-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 20:43:10 +0200 (CEST)
Received: from mta-09.privateemail.com (localhost [127.0.0.1])
 by mta-09.privateemail.com (Postfix) with ESMTP id 5791B18000A4
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 14:43:08 -0400 (EDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by mta-09.privateemail.com (Postfix) with ESMTPA id 3283518000A6
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 14:43:08 -0400 (EDT)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-31e560aa854so38642057b3.6
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jul 2022 11:43:08 -0700 (PDT)
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
X-Inumbo-ID: a273327d-0792-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1658256188;
	bh=zim6bjKcQIBAxytpk4m+vm66PngIMHcON1LKe382tuw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=yO3tdMpM6eQaAMVTs0bBMGiuWEaY3kBxs7lg/jtYIEjP8aEW/luW7gVC/YoQrEJ1A
	 Uwv5ud8eOZZx5HN/gnazlzwWZUSjLG712vPfsB+SIFvEsirBpmBbTYQq32ZAChuRir
	 RI6fNw9F1HIots62OUb4xGEqMwxZHW+iIJ/Pwmuh/vmyKHwrjaiXr1w4iJo9aEvRbq
	 OoXYvwaOmN2ymSROjxihTPgIINVXgArjv7qHr+6J590QNAsuT5VI8oqK26S1L5MEcd
	 Isi4nw4Pg5i5Xi/SwIKoHW0vhH3BQ/vTJC9L+y3zMXhdR8IJlqKQ5zJKXxtKX1cKVX
	 8dgSHtkKRVu2g==
X-Gm-Message-State: AJIora9ArUDvU6AtuO8M6+3FhGjfL7Gt00N4oQGTZeiG8gOulN69dr3Z
	N+wWU83lTQYIVbMob5yRz3+lBVpqThNcjef3tuc=
X-Google-Smtp-Source: AGRyM1swyhWp/jAbgPVFNX2VOWUKcc6aZHi3qgbh7bhkPnOgjYLrcTtxmQj9KJni7UoTHZNofx6r1SbKZjay1jQ61HM=
X-Received: by 2002:a81:7b8b:0:b0:31d:17d1:4666 with SMTP id
 w133-20020a817b8b000000b0031d17d14666mr37482218ywc.269.1658256187344; Tue, 19
 Jul 2022 11:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <4f3ff38d8226d10dab3440f020c9ba7f07cab1fd.1658250756.git.tamas.lengyel@intel.com>
 <c88916a1-21fa-7a27-f984-d40bbaa688dd@citrix.com>
In-Reply-To: <c88916a1-21fa-7a27-f984-d40bbaa688dd@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 19 Jul 2022 14:42:30 -0400
X-Gmail-Original-Message-ID: <CABfawhn3H2sC51nq_MGKQuxPYDqm8jmUmuFeHwGYX6BN6RD0_Q@mail.gmail.com>
Message-ID: <CABfawhn3H2sC51nq_MGKQuxPYDqm8jmUmuFeHwGYX6BN6RD0_Q@mail.gmail.com>
Subject: Re: [PATCH] xen/mem_sharing: support forks with active vPMU state
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Jul 19, 2022 at 2:23 PM Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>
> On 19/07/2022 18:18, Tamas K Lengyel wrote:
> > diff --git a/xen/arch/x86/cpu/vpmu.c b/xen/arch/x86/cpu/vpmu.c
> > index d2c03a1104..2b5d64a60d 100644
> > --- a/xen/arch/x86/cpu/vpmu.c
> > +++ b/xen/arch/x86/cpu/vpmu.c
> > @@ -529,6 +529,16 @@ void vpmu_initialise(struct vcpu *v)
> >          put_vpmu(v);
> >  }
> >
> > +void vpmu_allocate_context(struct vcpu *v)
> > +{
> > +    struct vpmu_struct *vpmu = vcpu_vpmu(v);
> > +
> > +    if ( vpmu_is_set(vpmu, VPMU_CONTEXT_ALLOCATED) )
> > +        return;
> > +
> > +    alternative_call(vpmu_ops.allocate_context, v);
>
> You need to fill in an AMD pointer, or make this conditional.
>
> All alternatives have NULL pointers turned into UDs.
>
> Should be a two-liner on the AMD side.

There is no AMD caller to this so I'll just make it conditional to
ensure it's non-NULL.

>
> > diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
> > index 8612f46973..31dc0ee14b 100644
> > --- a/xen/arch/x86/cpu/vpmu_intel.c
> > +++ b/xen/arch/x86/cpu/vpmu_intel.c
> >  static int core2_vpmu_verify(struct vcpu *v)
> > @@ -474,7 +485,11 @@ static int core2_vpmu_alloc_resource(struct vcpu *v)
> >                                      sizeof(uint64_t) * fixed_pmc_cnt;
> >
> >      vpmu->context = core2_vpmu_cxt;
> > +    vpmu->context_size = sizeof(struct xen_pmu_intel_ctxt) +
> > +                         fixed_pmc_cnt * sizeof(uint64_t) +
> > +                         arch_pmc_cnt * sizeof(struct xen_pmu_cntr_pair);
>
> This wants deduplicating with the earlier calculation, surely?

Sure.

>
> >      vpmu->priv_context = p;
> > +    vpmu->priv_context_size = sizeof(uint64_t);
> >
> >      if ( !has_vlapic(v->domain) )
> >      {
> > @@ -882,6 +897,7 @@ static int cf_check vmx_vpmu_initialise(struct vcpu *v)
> >
> >  static const struct arch_vpmu_ops __initconst_cf_clobber core2_vpmu_ops = {
> >      .initialise = vmx_vpmu_initialise,
> > +    .allocate_context = core2_vpmu_alloc_resource,
>
> core2_vpmu_alloc_resource() needs to gain a cf_check to not explode on
> TGL/SPR.
>
> >      .do_wrmsr = core2_vpmu_do_wrmsr,
> >      .do_rdmsr = core2_vpmu_do_rdmsr,
> >      .do_interrupt = core2_vpmu_do_interrupt,
> > diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
> > index e5709bd44a..14d0939247 100644
> > --- a/xen/arch/x86/include/asm/vpmu.h
> > +++ b/xen/arch/x86/include/asm/vpmu.h
> > @@ -106,8 +109,10 @@ void vpmu_lvtpc_update(uint32_t val);
> >  int vpmu_do_msr(unsigned int msr, uint64_t *msr_content, bool is_write);
> >  void vpmu_do_interrupt(struct cpu_user_regs *regs);
> >  void vpmu_initialise(struct vcpu *v);
> > +void vpmu_allocate_context(struct vcpu *v);
> >  void vpmu_destroy(struct vcpu *v);
> >  void vpmu_save(struct vcpu *v);
> > +void vpmu_save_force(void *arg);
>
> Needs the cf_check to compile.
>
> >  int vpmu_load(struct vcpu *v, bool_t from_guest);
> >  void vpmu_dump(struct vcpu *v);
> >
> > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> > index 8f9d9ed9a9..39cd03abf7 100644
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1653,6 +1653,50 @@ static void copy_vcpu_nonreg_state(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> >      hvm_set_nonreg_state(cd_vcpu, &nrs);
> >  }
> >
> > +static int copy_vpmu(struct vcpu *d_vcpu, struct vcpu *cd_vcpu)
> > +{
> > +    struct vpmu_struct *d_vpmu = vcpu_vpmu(d_vcpu);
> > +    struct vpmu_struct *cd_vpmu = vcpu_vpmu(cd_vcpu);
> > +
> > +    if ( !vpmu_are_all_set(d_vpmu, VPMU_INITIALIZED | VPMU_CONTEXT_ALLOCATED) )
> > +        return 0;
> > +    if ( !vpmu_is_set(cd_vpmu, VPMU_CONTEXT_ALLOCATED) )
> > +    {
> > +        vpmu_allocate_context(cd_vcpu);
> > +        if ( !vpmu_is_set(cd_vpmu, VPMU_CONTEXT_ALLOCATED) )
> > +            return -ENOMEM;
>
> vpmu_allocate_context() already checks VPMU_CONTEXT_ALLOCATED.  But
> isn't the double check here redundant?

True, I could drop the top level check here.

>
> The subsequent check looks like you want to pass the hook's return value
> up through vpmu_allocate_context().
>
> (And if you feel like turning it from bool-as-int to something more
> sane, say -errno, that would also be great.)

Yea, I wanted to avoid having to rework the currently backwards
meaning of the returned int values of vpmu functions. So that's why I
double check the allocation worked instead. If I do what you recommend
it would be the only vpmu function that doesn't return void and the
only callback that returns error codes instead of boolean
success/failure. I rather keep the code self-consistent in vpmu and
just live with this arguably kinda odd looking logic here.

Tamas

