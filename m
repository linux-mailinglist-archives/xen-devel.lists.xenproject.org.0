Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4678A1E0E4C
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 14:21:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdC4y-0004NZ-3G; Mon, 25 May 2020 12:19:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZKA=7H=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jdC4w-0004NU-2f
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 12:19:38 +0000
X-Inumbo-ID: fe9f03a2-9e81-11ea-ae69-bc764e2007e4
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe9f03a2-9e81-11ea-ae69-bc764e2007e4;
 Mon, 25 May 2020 12:19:37 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id j21so20306781ejy.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2020 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dhZgBKYxFLaJ+pXXELZQ9RPmxhzJI8715ah/Xe7Fhk0=;
 b=x7B3DzsJTyorEeWuMx7d0uf3TMhxX051u4zFlkNiQq++F9in9O8JpS5OAmxRUptUeR
 FvDd134b9jGeIegBS6ZQxNvNlbk4gC7KTkAd+nZOmqh07a1GcKh3sJxbxr9A5cPJoP+0
 2F3H9p2H9XovZ25OuhZP5f4ibbMYHuNH5OkRUm+a/hzTgKeqwSKk18YbMYTH/FfJCcNj
 BqjVg4SvFRI29TpcBqmOZgsVQeGNq6XArCI/F5jZe/MvR30AQRdu1ZhTQhYmclDUuflG
 8xjVX889uIElXclE/DOoeRI7JMDJEg8IPUyJM/9ssCBj8xvT7+cG8LIj9CqeGqNj4+Nh
 RFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dhZgBKYxFLaJ+pXXELZQ9RPmxhzJI8715ah/Xe7Fhk0=;
 b=m03kz/xYPpFSlyEoxqZ1u3TNfTxGyQKfd1UBh27BGJHkwrRwkmLALBiW60LoCC6F2I
 cqYnJQ5VVLGig8KbdMqGBGTFSAsfjV6MQIm2sXuC0r+NL4K6ZZCKbmd916xGuSZ8JjD3
 P3jWUJDsdpRW/UqS81f9Jqq1jHv6+NLpRhAtGwq4KYbHUfDe+lbodiCrl/BvrGuvR8wZ
 Y3LA26AwWj75niYHCMEuTTYDmnvZpbzj+xi8y+aFog/7K7bp+vhPNxIc81cdHPZcgV3W
 afXe+olFS92+e1Q2PNfUxhK4J3GNsgOpN7Ez4AU+VvzCN2BuF+EjjiDHA46G7Bs0gQCE
 0AEQ==
X-Gm-Message-State: AOAM531Fs7QDV+Lmf7gR0Wt2l5zslrJlqC1gGWhc7utqhFoJ7cS0F/f6
 bHGD01DSWvosRO4IR2uWhl6cBaqDBh8=
X-Google-Smtp-Source: ABdhPJxydRNilDAnJrFy/jHIdRlFI5Dz3HUT/3FxBRU72+AAQz7z7eYrZsOIiLdY1hknESCkUM2Wsw==
X-Received: by 2002:a17:906:34c5:: with SMTP id
 h5mr9527537ejb.325.1590409173566; 
 Mon, 25 May 2020 05:19:33 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45])
 by smtp.gmail.com with ESMTPSA id dt12sm15746384ejb.102.2020.05.25.05.19.31
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 05:19:32 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id u188so16485225wmu.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2020 05:19:31 -0700 (PDT)
X-Received: by 2002:a1c:acc8:: with SMTP id
 v191mr26548126wme.154.1590409171099; 
 Mon, 25 May 2020 05:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
 <338c26dc-a78a-4519-11f1-1b89bd1cf4db@suse.com>
In-Reply-To: <338c26dc-a78a-4519-11f1-1b89bd1cf4db@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 25 May 2020 06:18:55 -0600
X-Gmail-Original-Message-ID: <CABfawh=WPyW383QAe_JwRC2q8W1zHXcYntjYF-Vog34baQcrfw@mail.gmail.com>
Message-ID: <CABfawh=WPyW383QAe_JwRC2q8W1zHXcYntjYF-Vog34baQcrfw@mail.gmail.com>
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

On Mon, May 25, 2020 at 12:06 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 22.05.2020 18:33, Tamas K Lengyel wrote:
> > When running shallow forks without device models it may be undesirable for Xen
> > to inject interrupts. With Windows forks we have observed the kernel going into
> > infinite loops when trying to process such interrupts, likely because it attempts
> > to interact with devices that are not responding without QEMU running. By
> > disabling interrupt injection the fuzzer can exercise the target code without
> > interference.
> >
> > Forks & memory sharing are only available on Intel CPUs so this only applies
> > to vmx.
>
> Looking at e.g. mem_sharing_control() I can't seem to be able to confirm
> this. Would you mind pointing me at where this restriction is coming from?

Both mem_access and mem_sharing are only implemented for EPT:
http://xenbits.xen.org/hg/xen-unstable.hg/file/5eadf9363c25/xen/arch/x86/mm/p2m-ept.c#l126.

>
> > --- a/xen/arch/x86/hvm/vmx/intr.c
> > +++ b/xen/arch/x86/hvm/vmx/intr.c
> > @@ -256,6 +256,12 @@ void vmx_intr_assist(void)
> >      if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
> >          return;
> >
> > +#ifdef CONFIG_MEM_SHARING
> > +    /* Block event injection for VM fork if requested */
> > +    if ( unlikely(v->domain->arch.hvm.mem_sharing.block_interrupts) )
> > +        return;
> > +#endif
>
> The two earlier returns are temporary as far as the guest is concerned,
> i.e. eventually the interrupt(s) will get delivered. The one you add
> looks as if it is a permanent thing, i.e. interrupt requests will pile
> up and potentially confuse a guest down the road. This _may_ be okay
> for your short-lived-shallow-fork scenario, but then wants at least
> calling out in the public header by a comment (and I think the same
> goes for XENMEM_FORK_WITH_IOMMU_ALLOWED that's already there).

This is indeed only for the short-lived forks, that's why this is an
optional flag that can be enabled when creating forks and it's not on
by default. In that use-case the VM executes for fractions of a second
and we want to only executes very specific code-segments with
absolutely no interference. Interrupts in that case are just a
nuisance that in the best case slow the fuzzing process down but as we
observed in the worst case complete stall it.

>
> > --- a/xen/include/asm-x86/hvm/domain.h
> > +++ b/xen/include/asm-x86/hvm/domain.h
> > @@ -74,6 +74,8 @@ struct mem_sharing_domain
> >       * to resume the search.
> >       */
> >      unsigned long next_shared_gfn_to_relinquish;
> > +
> > +    bool block_interrupts;
> >  };
>
> Please can you avoid unnecessary growth of the structure by inserting
> next to the pre-existing bool rather than at the end?

Sure. Do you want me to resend the patch for that?

Tamas

