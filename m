Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D30ACA6A987
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:18:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922504.1326410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHfD-00076e-OS; Thu, 20 Mar 2025 15:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922504.1326410; Thu, 20 Mar 2025 15:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHfD-00074R-LM; Thu, 20 Mar 2025 15:18:31 +0000
Received: by outflank-mailman (input) for mailman id 922504;
 Thu, 20 Mar 2025 15:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51pQ=WH=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tvHfB-00074J-O4
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:18:29 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 937964f3-059e-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 16:18:28 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e61375c108so1252372a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:18:28 -0700 (PDT)
Received: from localhost ([46.149.103.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e816ad3909sm10432334a12.56.2025.03.20.08.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 08:18:27 -0700 (PDT)
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
X-Inumbo-ID: 937964f3-059e-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742483908; x=1743088708; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SD96jxNXAQO0g9kZUha17xBFzZOHRjY92/yOwnciPso=;
        b=JxXUU7CGHiLUQShtokIDGdJM3zanIw8JHMjETNb/Gh4QlUB+Ua5dNm8LYmcbV/2LYk
         0KowCRGlmu0TZGmzsgFKhd5+yiw9pavc/tK6vxxNjQBfg11Jff8uCYKe/KFVL1CdzY3Y
         NMzOEYqDQqeZ5t2oB+fLVAGb6DZVBkUhUwcuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742483908; x=1743088708;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SD96jxNXAQO0g9kZUha17xBFzZOHRjY92/yOwnciPso=;
        b=KGB/nxELJeYt0qTOcmZj7ymQhz7PXBmKWIUFUNWdlw6oJ3NO6pGYywHc3c5SdSTfu9
         ImnFQHyDGksgQRpZ0P8tS21sUCQK6Ykc13J1dDAfrHCgzQAvL5LQG7aF3Ix9eM+1ep2Q
         V3Ble611PYCd/THt47PEbD0FVN3MMuMHqP+43F5Msv/ID9KWmck6TuHc8okMD/bu6JuB
         q5BhBbr1/3FOG2ANtPphq0ALmfm4H7KhvYDqOxYSAero/WJWuw/tICr943KokeXBrxjB
         M5DyYpfX49hxld9c0luN0cnXP0RkMKFgiG7HHD4z3iMSuDjrbTePmI9x9ZwT+I9ISAyB
         ie1g==
X-Gm-Message-State: AOJu0YxNxDcxkUQBr8UmeJ/cwsMPIq2JyeJFyJoDDYcHGeWHy8OUujCU
	FxCaUNDC22sNmLfWVJlbJ8y52ipnGI854rBhfoTrRw/e5mKdSmBZvN75gOLDZgwUeIroRqc7lTw
	r
X-Gm-Gg: ASbGncu6xZ9WUfDyPwHr0jYkn5j6mYTpZRqn/zQIOVct162/1886iKPSOnSEs7hmPxe
	NPtyJV2NJ3NeA6RuZssde/cW7aD3r0XX9zhdAzAy72GvPubinLGpuMCSJuO0gvG1iTW9UocL9y2
	ev1LfPtaMQteip5Crha3n1retwEa/2FHMA0+DZjtFZHwevL+89ILozrSbgcm94gtbYj5UsLYhDl
	pwZ5krGWVlhRdfaAJaTBHHTTrOTHl/EB+8cdal9tiBsIApydPdbrsLZahprwYFYjpgieYSTsyyY
	kzKDYCed6zFKKEYWJSe/q0uS8q5jNZfOs+1DclZ2W3pTLa68RU0=
X-Google-Smtp-Source: AGHT+IGRjCGpf4EV6MW02FOczrhMFhUvPnbmuJwfVZScirflPMTkke+10A3wYQcxzX+KCbgcbY6Q3A==
X-Received: by 2002:a05:6402:4025:b0:5eb:ca97:4565 with SMTP id 4fb4d7f45d1cf-5ebca97456emr392510a12.19.1742483907932;
        Thu, 20 Mar 2025 08:18:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Mar 2025 15:18:26 +0000
Message-Id: <D8L6ZRL4CIUK.FGKVDP8TJAGU@cloud.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>, "Jan Beulich"
 <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v1] x86: make Viridian support optional
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Sergiy Kibrik" <sergiy_kibrik@epam.com>
X-Mailer: aerc 0.18.2
References: <20250317071919.3766976-1-Sergiy_Kibrik@epam.com>
 <CAFi36o263XOQbTpSGDcM3PmpY+MwodHi1tOXDp3W60N0n9b9YA@mail.gmail.com>
 <93e98ebb-4679-4c34-a5af-f105e89c7304@epam.com>
In-Reply-To: <93e98ebb-4679-4c34-a5af-f105e89c7304@epam.com>

On Thu Mar 20, 2025 at 9:39 AM GMT, Sergiy Kibrik wrote:
> hi Alejandro,
>
> 17.03.25 11:19, Alejandro Vallejo:
> [..]
> >      =C2=A0endif
> >=20
> >     +config HVM_VIRIDIAN
> >     +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool "Viridian enlightenments support" =
if EXPERT
> >     +=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on HVM
> >     +=C2=A0 =C2=A0 =C2=A0 =C2=A0default y
> >     +
> >=20
> >=20
> >=20
> > I don't see why this should be gated by EXPERT, provided a
> > suitable (now absent) help message was to exist explaining
> > what it does in plain simple words.
>
> The option is intended primarily for fine-tuned systems optimized for=20
> particular platform and mode of operation. As for generic systems (e.g.=
=20
> distributions) whey wouldn't want to disable it anyway.



> >=20
> > For the title, I'd say it needs to properly state it refers to
> > enlightenments for guests, rather than enlightenments for
> > Xen itself when running under Hyper-V. As it is, it sounds
> > ambiguous (Maybe "Hyper-V enlighnments for guests"?).
> >
>
> Agree, "Hyper-V enlighnments for guests" is better title.
> As for help message, would the one below be sufficient?:
>
>   help
>     Support optimizations for Hyper-V guests such as faster hypercalls,
>     efficient timer and interrupt handling, and enhanced paravirtualized
>     I/O. This is to improve performance and compatibility of Windows VMs.
>
>     If unsure, say Y.

Sounds good enough to me.

>
>
> > On a personal nitpicky preference note, I'd say HVM_VIRIDIAN sounds
> > rather redundant, and I think just VIRIDIAN works just as well
> > while being shorter.
> >
>
> this is rather to highlight the fact that the code is part of HVM=20
> support, a bit of self-documenting
>
> [..]

That's fair enough.

> >     diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h
> >     b/xen/arch/x86/include/asm/hvm/vcpu.h
> >     index 196fed6d5d..bac35ec47a 100644
> >     --- a/xen/arch/x86/include/asm/hvm/vcpu.h
> >     +++ b/xen/arch/x86/include/asm/hvm/vcpu.h
> >     @@ -171,8 +171,9 @@ struct hvm_vcpu {
> >=20
> >      =C2=A0 =C2=A0 =C2=A0/* Pending hw/sw interrupt (.vector =3D -1 mea=
ns nothing
> >     pending). */
> >      =C2=A0 =C2=A0 =C2=A0struct x86_event=C2=A0 =C2=A0 =C2=A0inject_eve=
nt;
> >     -
> >     +#ifdef CONFIG_HVM_VIRIDIAN
> >      =C2=A0 =C2=A0 =C2=A0struct viridian_vcpu *viridian;
> >     +#endif
> >      =C2=A0};
> >=20
> >      =C2=A0#endif /* __ASM_X86_HVM_VCPU_H__ */
> >=20
> >=20
> > nit: I suspect the code would be far less cluttered with "if=20
> > viridian..." if the
> > init/deinit/etc functions had dummy versions of those functions when
> > !HVM_VIRIDIAN in the header.
> >=20
>
> as Jan explained some time ago [1] it's preferable to compile as much as=
=20
> possible in all build configuration. Besides most of calls to viridian=20
> code are already guarded by is_viridian_domain() & not actually require=
=20
> stubs.
>
>   -Sergiy
>
> [1]=20
> https://lore.kernel.org/xen-devel/36708a3f-2664-4b04-9f5d-f115d362d100@su=
se.com/

That answer seems to state a preference for...

    if ( foo_enabled() )
        rc =3D foo();

... against...

    #ifdef CONFIG_FOO
    rc =3D foo();
    #endif

... where foo() in the header looks like...

    #ifdef CONFIG_FOO
    int foo(void);
    #else /* CONFIG_FOO */
    static inline int foo(void)
    {
        return /*some-error*/;
    }
    #endif /* CONFIG_FOO */

But that's not what's going on here, I think? I didn't initially notice the
subtlety of the change. On more careful look, it seems to rely on the compi=
ler
doing dead-code-elimination. The functions missing in the linking stage don=
't
cause a compile-time error because the conditionals are completely gone by
then. Neat as it is, it sounds a bit fragile. Can we really rely on this
behaviour not changing? Furthermore, does MISRA have views about having dea=
d
code calls to unimplemented functions?

If dummy functions are warranted, my point stands. Why not make them return
"0", rather than some errno to avoid the conditionals to begin with? If the=
y
aren't, then I'm just making a racket over nothing and feel free to ignore =
me
:)

FTAOD, this is more of a question to the maintainers than anything else. Is
exploiting dead-code elimination in order to avoid dummy functions somethin=
g we
want to do moving forward?

Cheers,
Alejandro

