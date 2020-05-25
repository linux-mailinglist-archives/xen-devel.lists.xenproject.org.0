Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05FA1E0E8C
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 14:39:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdCN7-00067W-Mv; Mon, 25 May 2020 12:38:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZKA=7H=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jdCN6-00067R-50
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 12:38:24 +0000
X-Inumbo-ID: 9ef58310-9e84-11ea-b9cf-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ef58310-9e84-11ea-b9cf-bc764e2007e4;
 Mon, 25 May 2020 12:38:23 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e10so14905350edq.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2020 05:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UDnWw0ElEdYX87EaI0aeQxvrrFALObdoslB3urYMcgw=;
 b=pNE8FmMfkJsqyqLvG4l9RAWZ7JADihHzgoyKL3TLhsXkKJZV/YwbQTaew2A/Vg4/ww
 BVIdrsRvyWH5/31cRIQ04ImH4eHtUkzqxQmw6knwQd0BFiwvhOg/+2PWz/Nunp5qVJX4
 VtKbbouHJAlO69GHMSOPxuml2tLqx6FxUtS2gUpM47hOpA7NtaYKgurIjXFL6PWrYra1
 zmwS80/bHU3VRMgD2ahqzOhiQAFty45ldSud2q8voqJWC7LmCIYrwqiDINlPyESFpzU6
 X+v50Z4TK5ANi4jBKHzCqDaxXOa1Ys7SMc2mfObDyFjAi4Lz2RyC+t6uPIxPwZtxjuXA
 80Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UDnWw0ElEdYX87EaI0aeQxvrrFALObdoslB3urYMcgw=;
 b=MdPPju2D7SuGsE+XdYm/qvOrNvxrX6vxllnZhOfgq6CPKdn8neG9ToMWJSU5VsIv/N
 aj+Xhh0ameMbYq62J+TfEXtF+poUyFGgpZvRsIs/rkcurZlIQlrBz+N6P0Pi96MAMTqc
 RtrGVZ4zTK3BRWNTxU+XWZryNdLf7O0qAlbE/bbryg8c9MfZ6dxw0dL6+hervfPMS9H1
 qZqLMdRHRSXYy8bD6WCI2LPDDxV/y1IAu85WkJM/HaGlQC0SVvHFjCQn6F0JYLnGzabT
 a6g33RnaUOSIEJVP5Cuwza4p0ZdDQqon2oLzk2KPjDv9UHpRlu95c+qKP8wXkfnUuxX6
 iHFw==
X-Gm-Message-State: AOAM532elsbzkkiTTc4XIYw0/bav1k1auj9qyIj1gzo4vKIXbgmkslQ5
 oksbL9uDdXScWgU7Hdh2hGtYzfVv5e8=
X-Google-Smtp-Source: ABdhPJxkU63lIA3reQoJNTrQDy4Ax+OXyuYpsktoHa0cwISg2xLybbHAFV3xK8vhagcgu+RNiwOD0w==
X-Received: by 2002:a05:6402:8c1:: with SMTP id
 d1mr15157207edz.265.1590410302058; 
 Mon, 25 May 2020 05:38:22 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47])
 by smtp.gmail.com with ESMTPSA id k90sm15553076edc.2.2020.05.25.05.38.20
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 05:38:20 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id x14so11572447wrp.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2020 05:38:20 -0700 (PDT)
X-Received: by 2002:a5d:61d0:: with SMTP id q16mr536273wrv.182.1590410300269; 
 Mon, 25 May 2020 05:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
 <338c26dc-a78a-4519-11f1-1b89bd1cf4db@suse.com>
 <CABfawh=WPyW383QAe_JwRC2q8W1zHXcYntjYF-Vog34baQcrfw@mail.gmail.com>
In-Reply-To: <CABfawh=WPyW383QAe_JwRC2q8W1zHXcYntjYF-Vog34baQcrfw@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 25 May 2020 06:37:44 -0600
X-Gmail-Original-Message-ID: <CABfawh=A3ZO-9jEiVYg72fHvZRqWzC5j8WsW6L2V7x9_tVKuPA@mail.gmail.com>
Message-ID: <CABfawh=A3ZO-9jEiVYg72fHvZRqWzC5j8WsW6L2V7x9_tVKuPA@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 1/2] x86/mem_sharing: block interrupt
 injection for forks
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 25, 2020 at 6:18 AM Tamas K Lengyel <tamas@tklengyel.com> wrote:
>
> On Mon, May 25, 2020 at 12:06 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 22.05.2020 18:33, Tamas K Lengyel wrote:
> > > When running shallow forks without device models it may be undesirable for Xen
> > > to inject interrupts. With Windows forks we have observed the kernel going into
> > > infinite loops when trying to process such interrupts, likely because it attempts
> > > to interact with devices that are not responding without QEMU running. By
> > > disabling interrupt injection the fuzzer can exercise the target code without
> > > interference.
> > >
> > > Forks & memory sharing are only available on Intel CPUs so this only applies
> > > to vmx.
> >
> > Looking at e.g. mem_sharing_control() I can't seem to be able to confirm
> > this. Would you mind pointing me at where this restriction is coming from?
>
> Both mem_access and mem_sharing are only implemented for EPT:
> http://xenbits.xen.org/hg/xen-unstable.hg/file/5eadf9363c25/xen/arch/x86/mm/p2m-ept.c#l126.
>
> >
> > > --- a/xen/arch/x86/hvm/vmx/intr.c
> > > +++ b/xen/arch/x86/hvm/vmx/intr.c
> > > @@ -256,6 +256,12 @@ void vmx_intr_assist(void)
> > >      if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
> > >          return;
> > >
> > > +#ifdef CONFIG_MEM_SHARING
> > > +    /* Block event injection for VM fork if requested */
> > > +    if ( unlikely(v->domain->arch.hvm.mem_sharing.block_interrupts) )
> > > +        return;
> > > +#endif
> >
> > The two earlier returns are temporary as far as the guest is concerned,
> > i.e. eventually the interrupt(s) will get delivered. The one you add
> > looks as if it is a permanent thing, i.e. interrupt requests will pile
> > up and potentially confuse a guest down the road. This _may_ be okay
> > for your short-lived-shallow-fork scenario, but then wants at least
> > calling out in the public header by a comment (and I think the same
> > goes for XENMEM_FORK_WITH_IOMMU_ALLOWED that's already there).
>
> This is indeed only for the short-lived forks, that's why this is an
> optional flag that can be enabled when creating forks and it's not on
> by default. In that use-case the VM executes for fractions of a second
> and we want to only executes very specific code-segments with
> absolutely no interference. Interrupts in that case are just a
> nuisance that in the best case slow the fuzzing process down but as we
> observed in the worst case complete stall it.
>
> >
> > > --- a/xen/include/asm-x86/hvm/domain.h
> > > +++ b/xen/include/asm-x86/hvm/domain.h
> > > @@ -74,6 +74,8 @@ struct mem_sharing_domain
> > >       * to resume the search.
> > >       */
> > >      unsigned long next_shared_gfn_to_relinquish;
> > > +
> > > +    bool block_interrupts;
> > >  };
> >
> > Please can you avoid unnecessary growth of the structure by inserting
> > next to the pre-existing bool rather than at the end?
>
> Sure. Do you want me to resend the patch for that?

I'll just resend it anyway with the requested comments in the public header.

Tamas

