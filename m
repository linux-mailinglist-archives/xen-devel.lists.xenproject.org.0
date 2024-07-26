Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE91593D706
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 18:38:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765706.1176370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXNxS-0006IT-4B; Fri, 26 Jul 2024 16:38:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765706.1176370; Fri, 26 Jul 2024 16:38:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXNxS-0006Go-02; Fri, 26 Jul 2024 16:38:18 +0000
Received: by outflank-mailman (input) for mailman id 765706;
 Fri, 26 Jul 2024 16:38:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8ZK=O2=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sXNxQ-0006Gi-Rc
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 16:38:16 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 742b7324-4b6d-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 18:38:14 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a7aac70e30dso214587066b.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 09:38:14 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acadb9a12sm192388766b.213.2024.07.26.09.38.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jul 2024 09:38:13 -0700 (PDT)
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
X-Inumbo-ID: 742b7324-4b6d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1722011894; x=1722616694; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zi+M0YEVtCCHMFjKcPbyYYrYm9tsXvtltG/eXyPt5n4=;
        b=Ckd4TnBLjfoLwKedS9jJNFf/jfsZzEbea0lj/Tkqy/pGkuTZ3En3BMP/dl0gSGyxGL
         PtjKYoyzKJxmdWsVm5xmGCDSZDsaAKjQ+CTOa/K6JIDe8gF5HeoXXLTNNb1T+k7pfGid
         LDMqgywNRbOmCdwUXgeNxMy+TO8vt2jz5CIbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722011894; x=1722616694;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zi+M0YEVtCCHMFjKcPbyYYrYm9tsXvtltG/eXyPt5n4=;
        b=qMoEL8ilckxtbdIw89qJtnnmWcZIGvm7GseSyzSUMj19yjqAIi4mWv/cN2nnEmgiuR
         fwTDCD3R3RmKWGkVFyb7OvUdjkZ9mlT0pGRYmfvV5QhCOFRIGOv3GpEbMTqtbogKVoSS
         ADeYNgjB7CDUk85RaLhvNW99+/l6VWSiop0Qgw905ooxMrCrI5u0ao8g/WJIqgNRYeD0
         0oItGmL3tGJJEUDlt/4GsF2RCzEHhG46tRhHnuxwOKIP7pfoe1A86eL7dLCq3jxIkMcU
         Y/ZxLnu6fWxuGyiBpzY3lQPOiqBlb1DwlJU5yIUK7APMq+ikteGIZTUF3IsPejGVSRXB
         5ZLw==
X-Forwarded-Encrypted: i=1; AJvYcCVyEGVq1qL1sUzVO6PJNBNtcWp86A3QQz8UN0ObHrsaQ6+FEyXE3pZHkhOIT2c1+I1bdr8lR8ZSFAhbHLhdIYIUhIlbVLC+bcLlzapGQE4=
X-Gm-Message-State: AOJu0YzkkiKZz9nx0VP9V91A141egsqEdZr3CQJSXCASOhZLRY+Pkgrt
	NqYcAvNYmX6NgQWz0HhdrYrhVImHsu2hiNuCqaLr/ihEpt2wctu27he8FI3LBis=
X-Google-Smtp-Source: AGHT+IGaUtFwDAYURq8uP70AoSPPUBSlCFdX484s3r5HOvNPlFhcPFAo7tibYJy2ok8yGeJ6A8kaGQ==
X-Received: by 2002:a17:907:97d0:b0:a6f:c9c6:7219 with SMTP id a640c23a62f3a-a7d400dbfefmr3537166b.47.1722011893798;
        Fri, 26 Jul 2024 09:38:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jul 2024 17:38:11 +0100
Message-Id: <D2ZM9PYSGG06.3ENIG6XVJLMFL@cloud.com>
To: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.17.0
References: <20240725105634.16825-1-roger.pau@citrix.com>
 <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com> <ZqJnPvL1ilDDzM9V@macbook>
 <a638b0e1-07a3-495c-b3b9-e450a50f9429@suse.com> <ZqNQwM3U8S5q-kg5@macbook>
 <0f6b446a-0dda-4e59-807b-c0c0bcdf78bf@suse.com> <ZqNVs97wexqd5trA@macbook>
 <4e2117f9-2a68-4032-9d1a-09965f97085f@suse.com>
 <D2ZJA8MODIO2.9JHFXZO8LW7Z@cloud.com>
 <D2ZJFUKTDIAL.2OE4EHLK6GGIB@cloud.com> <ZqO-RFZHdCrIuRok@macbook>
 <D2ZM0D609TOQ.2GQQWR1QALUPA@cloud.com>
In-Reply-To: <D2ZM0D609TOQ.2GQQWR1QALUPA@cloud.com>

On Fri Jul 26, 2024 at 5:25 PM BST, Alejandro Vallejo wrote:
> On Fri Jul 26, 2024 at 4:18 PM BST, Roger Pau Monn=C3=A9 wrote:
> > On Fri, Jul 26, 2024 at 03:25:08PM +0100, Alejandro Vallejo wrote:
> > > On Fri Jul 26, 2024 at 3:17 PM BST, Alejandro Vallejo wrote:
> > > > On Fri Jul 26, 2024 at 9:05 AM BST, Jan Beulich wrote:
> > > > > On 26.07.2024 09:52, Roger Pau Monn=C3=A9 wrote:
> > > > > > On Fri, Jul 26, 2024 at 09:36:15AM +0200, Jan Beulich wrote:
> > > > > >> On 26.07.2024 09:31, Roger Pau Monn=C3=A9 wrote:
> > > > > >>> On Thu, Jul 25, 2024 at 05:00:22PM +0200, Jan Beulich wrote:
> > > > > >>>> On 25.07.2024 16:54, Roger Pau Monn=C3=A9 wrote:
> > > > > >>>>> On Thu, Jul 25, 2024 at 03:18:29PM +0200, Jan Beulich wrote=
:
> > > > > >>>>>> On 25.07.2024 12:56, Roger Pau Monne wrote:
> > > > > >>>>>>> --- a/xen/arch/x86/include/asm/alternative.h
> > > > > >>>>>>> +++ b/xen/arch/x86/include/asm/alternative.h
> > > > > >>>>>>> @@ -184,11 +184,11 @@ extern void alternative_branches(vo=
id);
> > > > > >>>>>>>   * https://github.com/llvm/llvm-project/issues/82598
> > > > > >>>>>>>   */
> > > > > >>>>>>>  #define ALT_CALL_ARG(arg, n)                            =
                \
> > > > > >>>>>>> -    register union {                                    =
                \
> > > > > >>>>>>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];      =
                \
> > > > > >>>>>>> -        unsigned long r;                                =
                \
> > > > > >>>>>>> +    register struct {                                   =
                \
> > > > > >>>>>>> +        typeof(arg) e;                                  =
                \
> > > > > >>>>>>> +        char pad[sizeof(void *) - sizeof(arg)];         =
                \
> > > > > >>>>>>
> > > > > >>>>>> One thing that occurred to me only after our discussion, a=
nd I then forgot
> > > > > >>>>>> to mention this before you would send a patch: What if siz=
eof(void *) =3D=3D
> > > > > >>>>>> sizeof(arg)? Zero-sized arrays are explicitly something we=
're trying to
> > > > > >>>>>> get rid of.
> > > > > >>>>>
> > > > > >>>>> I wondered about this, but I though it was only [] that we =
were trying
> > > > > >>>>> to get rid of, not [0].
> > > > > >>>>
> > > > > >>>> Sadly (here) it's actually the other way around, aiui.
> > > > > >>>
> > > > > >>> The only other option I have in mind is using an oversized ar=
ray on
> > > > > >>> the union, like:
> > > > > >>>
> > > > > >>> #define ALT_CALL_ARG(arg, n)                                 =
           \
> > > > > >>>     union {                                                  =
           \
> > > > > >>>         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / size=
of(arg)];  \
> > > > > >>>         unsigned long r;                                     =
           \
> > > > > >>>     } a ## n ## __  =3D {                                    =
             \
> > > > > >>>         .e[0] =3D ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *=
)); (arg); })\
> > > > > >>>     };                                                       =
           \
> > > > > >>>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## =
n ) =3D      \
> > > > > >>>         a ## n ## __.r
> > > > > >>
> > > > > >> Yet that's likely awful code-gen wise?
> > > > > >=20
> > > > > > Seems OK: https://godbolt.org/z/nsdo5Gs8W
> > > > >
> > > > > In which case why not go this route. If the compiler is doing fin=
e with
> > > > > that, maybe the array dimension expression could be further simpl=
ified,
> > > > > accepting yet more over-sizing? Like "sizeof(void *) / sizeof (ar=
g) + 1"
> > > > > or even simply "sizeof(void *)"? Suitably commented of course ...
> > > > >
> > > > > >> For the time being, can we perhaps
> > > > > >> just tighten the BUILD_BUG_ON(), as iirc Alejandro had suggest=
ed?
> > > > > >=20
> > > > > > My main concern with tightening the BUILD_BUG_ON() is that then=
 I
> > > > > > would also like to do so for the GCC one, so that build fails
> > > > > > uniformly.
> > > > >
> > > > > If we were to take that route, then yes, probably should constrai=
n both
> > > > > (with a suitable comment on the gcc one).
> > > > >
> > > > > Jan
> > > >
> > > > Yet another way would be to have an intermediate `long` to cast ont=
o. Compilers
> > > > will optimise away the copy. It ignores the different-type aliasing=
 rules in
> > > > the C spec, so there's an assumption that we have -fno-strict-alias=
ing. But I
> > > > belive we do? Otherwise it should pretty much work on anything.
> > > >
> > > > ```
> > > >   #define ALT_CALL_ARG(arg, n)                                     =
         \
> > > >       unsigned long __tmp =3D 0;                                   =
           \
> > > >       *(typeof(arg) *)&__tmp =3D                                   =
           \
> > > >           ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); }) =
         \
> > > >       register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =
=3D __tmp; \
> > > > ```
> > > >
> > > > fwiw, clang18 emits identical code compared with the previous godbo=
lt link.
> > > >
> > > > Link: https://godbolt.org/z/facd1M9xa
> > > >
> > > > Cheers,
> > > > Alejandro
> > >=20
> > > Bah. s/b/__tmp/ in line15. Same output though, so the point still sta=
nds.
> >
> > Had to adjust it to:
> >
> > #define ALT_CALL_ARG(arg, n)                                           =
   \
> >     unsigned long a ## n ## __ =3D 0;                                  =
     \
> >     *(typeof(arg) *)&a ## n ## __ =3D                                  =
     \
> >         ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); });      =
   \
> >     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =3D a =
## n ## __
> >
> > So that tmp__ is not defined multiple times for repeated
> > ALT_CALL_ARG() usages.
> >
> > Already tried something like this in the past, but it mixes code with
> > declarations, and that's forbidden in the current C standard that Xen
> > uses:
> >
> > ./arch/x86/include/asm/hvm/hvm.h:665:5: error: mixing declarations and =
code is incompatible with standards before C99 [-Werror,-Wdeclaration-after=
-statement]
> >
> > The `*(typeof(arg) *)&__tmp =3D ...` line is considered code, and is
> > followed by further declarations.  Even if we moved both declarations
> > ahead of the assigns it would still complain when multiple
> > ALT_CALL_ARG() instances are used in the same altcall block.
> >
> > Thanks, Roger.
>
> That _was_ forbidden in C89, but it has been allowed since. We have a war=
ning
> enabled to cause it to fail even if we always use C99-compatible compiler=
s. I
> think we should change that.
>
> Regardless, I think it can be worked around. This compiles (otherwise
> untested):
>
> #define ALT_CALL_ARG(arg, n)
>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =3D ({  =
 \
>         unsigned long tmp =3D 0;                                         =
 \
>         *(typeof(arg) *)&a ## n ## __ =3D (arg);                         =
 \
>         BUILD_BUG_ON(sizeof(arg) > sizeof(void *));                     \
>         tmp;                                                            \
>     })
>
> That said, if the oversized temp union works, I'm fine with that too.
>
> Cheers,
> Alejandro

Sigh... I'm going at 1 mistake per email today. I meant:

#define ALT_CALL_ARG(arg, n)
     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =3D ({   =
\
         unsigned long tmp =3D 0;                                          =
\
         *(typeof(arg) *)&tmp =3D (arg);                                   =
\
         BUILD_BUG_ON(sizeof(arg) > sizeof(void *));                     \
         tmp;                                                            \
     })

Cheers,
Alejandro

