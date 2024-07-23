Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58D293A458
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 18:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763377.1173652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWIJ4-0004fl-34; Tue, 23 Jul 2024 16:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763377.1173652; Tue, 23 Jul 2024 16:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWIJ4-0004dA-0P; Tue, 23 Jul 2024 16:24:06 +0000
Received: by outflank-mailman (input) for mailman id 763377;
 Tue, 23 Jul 2024 16:24:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ruWa=OX=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sWIJ2-0004cl-Bo
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 16:24:04 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f978ef66-490f-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 18:24:03 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7a9e25008aso99356366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 09:24:03 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a879f155asm132463666b.53.2024.07.23.09.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 09:24:02 -0700 (PDT)
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
X-Inumbo-ID: f978ef66-490f-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721751842; x=1722356642; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3y1JmIxHiw9tNYkIAUSSwewMW38Qeqg+QIPGMeDd3Y=;
        b=MScK0NlqdL68jmoKWTxF0b9bjp+95Jizm8p75Ydp7G6ucTE4Eik1AZR70HFGrxXnu+
         9fesX0MFSqQHqoUceCY5Dwry2ahcw7fglGaHQIYYpZNBbbqi55szkDyqtkzhyhxOY2gU
         AOxMqCNDPq3S+/Z8cqSyAWZxH8oyKv+pkLZ0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721751842; x=1722356642;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z3y1JmIxHiw9tNYkIAUSSwewMW38Qeqg+QIPGMeDd3Y=;
        b=Wh9ZsHJFEM2uilQRhqp8BUkHYscslYLyaH30lDbLO8voONJifYb4b2+D9kd9bU7iDd
         rpFhWHEHOzu+Kq8/S2E4YRrpGGBYqsJ68hfsNeEMK/vExY6dB579Qy0RKCj5969/etOX
         pDictZZv078+E3ALPqKf2zCizSL/w1KE0xv06CNkazQBurc993ikI1FRGmVXeQBNDNG2
         Iq8zfFAGplPjV1pVE/A6Hv8S9sTbHickynwPM8QqGT4RRKaPxzo1sEer3ENn83SfGvak
         t4cklI5gpO/bj6x4IcsYBf1nxMAa5lat+d+xS1psvxMDwf88NZ6HhBN9+ycWPTyTzHwb
         MLbA==
X-Gm-Message-State: AOJu0YyPq6oPLexoRJ33nYgDuRi9JO3gzxOiKvqssWr6KZ/7ChH9Kz+B
	J53ijSJobDBR0DldgV5ASekqRJwBiRf9np1lmRThFNjkOxZhR3FZAXbrfm0F+gA=
X-Google-Smtp-Source: AGHT+IF7ujIJB6O13DFVDaORWiDwA/deMQkahyL1gTfNObLwyMc0o5qCwxQvlVFp82QWmKJ6ALOQmA==
X-Received: by 2002:a17:907:9686:b0:a79:7dc0:4fed with SMTP id a640c23a62f3a-a7aab67bed3mr9358966b.34.1721751842584;
        Tue, 23 Jul 2024 09:24:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jul 2024 17:24:00 +0100
Message-Id: <D2X237Y7T92R.1VVSBS9MCJOFW@cloud.com>
Cc: <xen-devel@lists.xenproject.org>, "Jan Beulich" <jbeulich@suse.com>,
 "Andrew Cooper" <andrew.cooper3@citrix.com>, "Oleksii Kurochko"
 <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH for-4.19] x86/altcall: fix clang code-gen when using
 altcall in loop constructs
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
X-Mailer: aerc 0.17.0
References: <20240723093117.99487-1-roger.pau@citrix.com>
 <D2X13ED477J8.25JRFH9VEW33O@cloud.com> <Zp_VuwxqH3Mii8_W@macbook>
In-Reply-To: <Zp_VuwxqH3Mii8_W@macbook>

On Tue Jul 23, 2024 at 5:09 PM BST, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jul 23, 2024 at 04:37:12PM +0100, Alejandro Vallejo wrote:
> > On Tue Jul 23, 2024 at 10:31 AM BST, Roger Pau Monne wrote:
> > > Clang will generate machine code that only resets the low 8 bits of %=
rdi
> > > between loop calls, leaving the rest of the register possibly contain=
ing
> > > garbage from the use of %rdi inside the called function.  Note also t=
hat clang
> > > doesn't truncate the input parameters at the callee, thus breaking th=
e psABI.
> > >
> > > Fix this by turning the `e` element in the anonymous union into an ar=
ray that
> > > consumes the same space as an unsigned long, as this forces clang to =
reset the
> > > whole %rdi register instead of just the low 8 bits.
> > >
> > > Fixes: 2ce562b2a413 ('x86/altcall: use a union as register type for f=
unction parameters on clang')
> > > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > ---
> > > Adding Oleksii as to whether this could be considered for 4.19: it's =
strictly
> > > limited to clang builds, plus will need to be backported anyway.
> > > ---
> > >  xen/arch/x86/include/asm/alternative.h | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/in=
clude/asm/alternative.h
> > > index 0d3697f1de49..e63b45927643 100644
> > > --- a/xen/arch/x86/include/asm/alternative.h
> > > +++ b/xen/arch/x86/include/asm/alternative.h
> > > @@ -185,10 +185,10 @@ extern void alternative_branches(void);
> > >   */
> > >  #define ALT_CALL_ARG(arg, n)                                        =
    \
> > >      register union {                                                =
    \
> > > -        typeof(arg) e;                                              =
    \
> > > +        typeof(arg) e[sizeof(long) / sizeof(arg)];                  =
    \
> > >          unsigned long r;                                            =
    \
> > >      } a ## n ## _ asm ( ALT_CALL_arg ## n ) =3D {                   =
      \
> > > -        .e =3D ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg);=
 })   \
> > > +        .e[0] =3D ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (ar=
g); })\
> > >      }
> > >  #else
> > >  #define ALT_CALL_ARG(arg, n) \
> >=20
> > Don't we want BUILD_BUG_ON(sizeof(long) % sizeof(arg) =3D=3D 0) instead=
?
>
> I think you meant BUILD_BUG_ON(sizeof(long) % sizeof(arg) !=3D 0)?

Bah, yes. I wrote it as a COMPILE_ASSERT().

>
> > Otherwise
> > odd sizes will cause the wrong union size to prevail, and while I can't=
 see
> > today how those might come to happen there's Murphy's law.
>
> The overall union size would still be fine, because it has the
> unsigned long element, it's just that the array won't cover all the
> space assigned to the long member?

I explained myself poorly. If the current BUILD_BUG_ON() stays as-is that's
right, but...

>
> IOW if sizeof(arg) =3D=3D 7, then we would define an array with only 1
> element, which won't make the size of the union change, but won't
> cover the same space that's used by the long member.

... I thought the point of the patch was to cover the full union with the
array, and not just a subset. My proposed alternative merely tries to ensur=
e
the argument is always a submultiple in size of a long so the array is alwa=
ys a
perfect match.

Though admittedly, it wouldn't be rare for this to be enough to work around=
 the
bug.

>
> However it's not possible for sizeof(arg) > 8 due to the existing
> BUILD_BUG_ON(), so the union can never be bigger than a long.
>
> Thanks, Roger.

Cheers,
Alejandro

