Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7282A93D6E3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 18:27:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765683.1176340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXNlf-0001QQ-GV; Fri, 26 Jul 2024 16:26:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765683.1176340; Fri, 26 Jul 2024 16:26:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXNlf-0001Nl-DG; Fri, 26 Jul 2024 16:26:07 +0000
Received: by outflank-mailman (input) for mailman id 765683;
 Fri, 26 Jul 2024 16:26:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8ZK=O2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sXNle-0001Nf-3B
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 16:26:06 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf236d53-4b6b-11ef-bc00-fd08da9f4363;
 Fri, 26 Jul 2024 18:26:01 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a7a9a369055so201938666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 09:26:01 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acad91005sm193463566b.173.2024.07.26.09.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 09:26:00 -0700 (PDT)
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
X-Inumbo-ID: bf236d53-4b6b-11ef-bc00-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722011161; x=1722615961; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YlGYXb7vpgE153wxJcUKemLIuYFS/C4BxEM1AQOl8rI=;
        b=XPu5sO25kfQLAKeiqfTO8Cjz/+hjJssmE8s6faUix8Rw2yCSGxeLE9vefSZd+693l0
         78ZVYWp8j1WGYLDnrtqiiFWi0/Mvf/0lWbHC+bxs9ruG5R51RkCIrSHjOYokvYRVYgv1
         DAeMN7h7wX9P76VxBQiuzVEFcrUMbIAlzaOw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722011161; x=1722615961;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YlGYXb7vpgE153wxJcUKemLIuYFS/C4BxEM1AQOl8rI=;
        b=k6RJ5BN4bl3CSNsdE2cxmdXz+5B8xgEo9gu4DjZ7nvTkJOxz5pu1kpwioQD8SF9tZP
         qKdTRO9G8ZJn4PJITWSE2sH7cctzuBOg/tga7yK3NRuycUVPVAehHNb6my0mTTtoBkZd
         f05JFUKVuiBZSw+RBgGOd0Kx/090s0vHMe6lZlEim44BubvPP+ZXlW8XOjYTlINsq0vn
         pof8D6G1V9T6PDulTXz06X+sRLl+urTPnTZOqsMt9n8/Q7OQmWnB3famSiHco+6n3EQP
         jQcLPDBIC5GsNpqbp5cD1r5VtMmKNxCYADsKTEH6BgMDSf/qlqXiUVQ8T2tT9Dq6n8X4
         /LWg==
X-Forwarded-Encrypted: i=1; AJvYcCXpktXGW90YflIcrrxdh7wxqG2Regy7CpKGwltkWgZ514zT6l4zUsO+nl7dWfntlvV1WtRyfxt8khFij8zhUQ4Xx6ucyp+uqkNRTHYzgB8=
X-Gm-Message-State: AOJu0Yyf+hev+xEnQpdcPZuiz6mzzypu1HMGpM0cRTmVtmdPKZGI06F+
	gnRyHkWrFA4Phi/LYPfrfj4/JZl856BMK6cYMt0yGxRryEkRc355L+7S74MXKb3BBDwnqFQfhs+
	pyq4=
X-Google-Smtp-Source: AGHT+IHwu4GZE1g+GQ/O/7EBDDYdZOWkGfJOmxAxidHBgWVaOYRM9eaEY2OMzyd5+7KItSHVG0cstA==
X-Received: by 2002:a17:907:6d01:b0:a7a:a06b:eec3 with SMTP id a640c23a62f3a-a7d3ff9ed50mr1933366b.23.1722011160676;
        Fri, 26 Jul 2024 09:26:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jul 2024 17:25:58 +0100
Message-Id: <D2ZM0D609TOQ.2GQQWR1QALUPA@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
X-Mailer: aerc 0.17.0
References: <20240725105634.16825-1-roger.pau@citrix.com>
 <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com> <ZqJnPvL1ilDDzM9V@macbook>
 <a638b0e1-07a3-495c-b3b9-e450a50f9429@suse.com> <ZqNQwM3U8S5q-kg5@macbook>
 <0f6b446a-0dda-4e59-807b-c0c0bcdf78bf@suse.com> <ZqNVs97wexqd5trA@macbook>
 <4e2117f9-2a68-4032-9d1a-09965f97085f@suse.com>
 <D2ZJA8MODIO2.9JHFXZO8LW7Z@cloud.com>
 <D2ZJFUKTDIAL.2OE4EHLK6GGIB@cloud.com> <ZqO-RFZHdCrIuRok@macbook>
In-Reply-To: <ZqO-RFZHdCrIuRok@macbook>

On Fri Jul 26, 2024 at 4:18 PM BST, Roger Pau Monn=C3=A9 wrote:
> On Fri, Jul 26, 2024 at 03:25:08PM +0100, Alejandro Vallejo wrote:
> > On Fri Jul 26, 2024 at 3:17 PM BST, Alejandro Vallejo wrote:
> > > On Fri Jul 26, 2024 at 9:05 AM BST, Jan Beulich wrote:
> > > > On 26.07.2024 09:52, Roger Pau Monn=C3=A9 wrote:
> > > > > On Fri, Jul 26, 2024 at 09:36:15AM +0200, Jan Beulich wrote:
> > > > >> On 26.07.2024 09:31, Roger Pau Monn=C3=A9 wrote:
> > > > >>> On Thu, Jul 25, 2024 at 05:00:22PM +0200, Jan Beulich wrote:
> > > > >>>> On 25.07.2024 16:54, Roger Pau Monn=C3=A9 wrote:
> > > > >>>>> On Thu, Jul 25, 2024 at 03:18:29PM +0200, Jan Beulich wrote:
> > > > >>>>>> On 25.07.2024 12:56, Roger Pau Monne wrote:
> > > > >>>>>>> --- a/xen/arch/x86/include/asm/alternative.h
> > > > >>>>>>> +++ b/xen/arch/x86/include/asm/alternative.h
> > > > >>>>>>> @@ -184,11 +184,11 @@ extern void alternative_branches(void=
);
> > > > >>>>>>>   * https://github.com/llvm/llvm-project/issues/82598
> > > > >>>>>>>   */
> > > > >>>>>>>  #define ALT_CALL_ARG(arg, n)                              =
              \
> > > > >>>>>>> -    register union {                                      =
              \
> > > > >>>>>>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];        =
              \
> > > > >>>>>>> -        unsigned long r;                                  =
              \
> > > > >>>>>>> +    register struct {                                     =
              \
> > > > >>>>>>> +        typeof(arg) e;                                    =
              \
> > > > >>>>>>> +        char pad[sizeof(void *) - sizeof(arg)];           =
              \
> > > > >>>>>>
> > > > >>>>>> One thing that occurred to me only after our discussion, and=
 I then forgot
> > > > >>>>>> to mention this before you would send a patch: What if sizeo=
f(void *) =3D=3D
> > > > >>>>>> sizeof(arg)? Zero-sized arrays are explicitly something we'r=
e trying to
> > > > >>>>>> get rid of.
> > > > >>>>>
> > > > >>>>> I wondered about this, but I though it was only [] that we we=
re trying
> > > > >>>>> to get rid of, not [0].
> > > > >>>>
> > > > >>>> Sadly (here) it's actually the other way around, aiui.
> > > > >>>
> > > > >>> The only other option I have in mind is using an oversized arra=
y on
> > > > >>> the union, like:
> > > > >>>
> > > > >>> #define ALT_CALL_ARG(arg, n)                                   =
         \
> > > > >>>     union {                                                    =
         \
> > > > >>>         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof=
(arg)];  \
> > > > >>>         unsigned long r;                                       =
         \
> > > > >>>     } a ## n ## __  =3D {                                      =
           \
> > > > >>>         .e[0] =3D ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *))=
; (arg); })\
> > > > >>>     };                                                         =
         \
> > > > >>>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n =
) =3D      \
> > > > >>>         a ## n ## __.r
> > > > >>
> > > > >> Yet that's likely awful code-gen wise?
> > > > >=20
> > > > > Seems OK: https://godbolt.org/z/nsdo5Gs8W
> > > >
> > > > In which case why not go this route. If the compiler is doing fine =
with
> > > > that, maybe the array dimension expression could be further simplif=
ied,
> > > > accepting yet more over-sizing? Like "sizeof(void *) / sizeof (arg)=
 + 1"
> > > > or even simply "sizeof(void *)"? Suitably commented of course ...
> > > >
> > > > >> For the time being, can we perhaps
> > > > >> just tighten the BUILD_BUG_ON(), as iirc Alejandro had suggested=
?
> > > > >=20
> > > > > My main concern with tightening the BUILD_BUG_ON() is that then I
> > > > > would also like to do so for the GCC one, so that build fails
> > > > > uniformly.
> > > >
> > > > If we were to take that route, then yes, probably should constrain =
both
> > > > (with a suitable comment on the gcc one).
> > > >
> > > > Jan
> > >
> > > Yet another way would be to have an intermediate `long` to cast onto.=
 Compilers
> > > will optimise away the copy. It ignores the different-type aliasing r=
ules in
> > > the C spec, so there's an assumption that we have -fno-strict-aliasin=
g. But I
> > > belive we do? Otherwise it should pretty much work on anything.
> > >
> > > ```
> > >   #define ALT_CALL_ARG(arg, n)                                       =
       \
> > >       unsigned long __tmp =3D 0;                                     =
         \
> > >       *(typeof(arg) *)&__tmp =3D                                     =
         \
> > >           ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })   =
       \
> > >       register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =
=3D __tmp; \
> > > ```
> > >
> > > fwiw, clang18 emits identical code compared with the previous godbolt=
 link.
> > >
> > > Link: https://godbolt.org/z/facd1M9xa
> > >
> > > Cheers,
> > > Alejandro
> >=20
> > Bah. s/b/__tmp/ in line15. Same output though, so the point still stand=
s.
>
> Had to adjust it to:
>
> #define ALT_CALL_ARG(arg, n)                                             =
 \
>     unsigned long a ## n ## __ =3D 0;                                    =
   \
>     *(typeof(arg) *)&a ## n ## __ =3D                                    =
   \
>         ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); });        =
 \
>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =3D a ##=
 n ## __
>
> So that tmp__ is not defined multiple times for repeated
> ALT_CALL_ARG() usages.
>
> Already tried something like this in the past, but it mixes code with
> declarations, and that's forbidden in the current C standard that Xen
> uses:
>
> ./arch/x86/include/asm/hvm/hvm.h:665:5: error: mixing declarations and co=
de is incompatible with standards before C99 [-Werror,-Wdeclaration-after-s=
tatement]
>
> The `*(typeof(arg) *)&__tmp =3D ...` line is considered code, and is
> followed by further declarations.  Even if we moved both declarations
> ahead of the assigns it would still complain when multiple
> ALT_CALL_ARG() instances are used in the same altcall block.
>
> Thanks, Roger.

That _was_ forbidden in C89, but it has been allowed since. We have a warni=
ng
enabled to cause it to fail even if we always use C99-compatible compilers.=
 I
think we should change that.

Regardless, I think it can be worked around. This compiles (otherwise
untested):

#define ALT_CALL_ARG(arg, n)
    register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =3D ({   \
        unsigned long tmp =3D 0;                                          \
        *(typeof(arg) *)&a ## n ## __ =3D (arg);                          \
        BUILD_BUG_ON(sizeof(arg) > sizeof(void *));                     \
        tmp;                                                            \
    })

That said, if the oversized temp union works, I'm fine with that too.

Cheers,
Alejandro

