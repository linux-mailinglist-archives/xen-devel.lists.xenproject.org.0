Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D44C956B12
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2024 14:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.779656.1189363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1i4-0007Ev-FU; Mon, 19 Aug 2024 12:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 779656.1189363; Mon, 19 Aug 2024 12:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sg1i4-0007Cn-Cr; Mon, 19 Aug 2024 12:42:08 +0000
Received: by outflank-mailman (input) for mailman id 779656;
 Mon, 19 Aug 2024 12:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lvcB=PS=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sg1i3-0007Ch-7C
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2024 12:42:07 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 701ef715-5e28-11ef-8776-851b0ebba9a2;
 Mon, 19 Aug 2024 14:42:05 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5daa683b298so1556931eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Aug 2024 05:42:05 -0700 (PDT)
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
X-Inumbo-ID: 701ef715-5e28-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724071324; x=1724676124; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+tVf2xNy46et3wHL5+BrHtoU+KgaWimtz25H6SKN7Y=;
        b=PVIQO3qDITeYSEgRR5hTMiksmxuiEA2G+9mda1uYRRlAYmxg7Ib8yFTZa2LK3ze8QH
         fz0ACqq50+bAUK49R43/74ix/go1vMUYYhhqydgNtKJb/XNhFIQhGEs40Equ1XIY4Xp8
         6zwSBBEztoxmgpJA+zofxfe5uP4vla5FiDOSk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724071324; x=1724676124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+tVf2xNy46et3wHL5+BrHtoU+KgaWimtz25H6SKN7Y=;
        b=EG/bx1SJPWte1gXTKJodxkxE8RyUdj4UDXRWtvDaOnjAKaG0NqWGE/hRTHpnuat2Ff
         SqFJ1fzvzZa2/+CxOWQEUNugcmjcb1tJUpIr0X1U8xLtMwBf1FmBC3EZEkR4Ur7+3i8D
         CLZ5ccgrGN5PmoKAJ+x/QlJuO7KclcZrQWnBozDgUiZDFutOBcfJm7as6/cueGwjoqPe
         iiRNTdy5ZckzYOnC/AvjKWb6ELFOSTw300EFsW8Odtoil/E41atdFFVJHX9YExR+BFI1
         skPvMJlkZNKm13VgITRJYzyPwB+J5f1JsRkt88HLqpYHnutpSxWQryxIeAOZdBRuuq1l
         Mlvg==
X-Forwarded-Encrypted: i=1; AJvYcCWKrOVYFwmaE47Z3rSP+rNEWS6bKl7h9HEHSG+wpbJdO6Hmky/4bdbDNnp06d3A3i9GVo1+NTC9imlfEN/v5ERm0Sc1cXQsWJztT8g12G0=
X-Gm-Message-State: AOJu0YxPJsRhxTBbFckfsqQqqhyXBshJg17Z5jYeRAyj3qiV3tZG41XR
	WioRPSqNcwL3lc+q2FrdLBzJ+eSZqDIIo9tSog6gBDjiULw6UZHKk3+f8vdG9mzxrCcM3nKX38z
	Z6Bc9TamdQdUplXcQzAj0/i65yKFGur9lRf6HOQ==
X-Google-Smtp-Source: AGHT+IEJkhikn9bllTx1OHSe2+paqM+zmUfKdra8px2l9L7rEGliKfaFj2k2yTEmgbbkzYXHgzatlitAZrTie4s+iA4=
X-Received: by 2002:a05:6820:168a:b0:5c6:9320:53a3 with SMTP id
 006d021491bc7-5da9800e818mr11887488eaf.4.1724071323721; Mon, 19 Aug 2024
 05:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240819110729.205707-1-frediano.ziglio@cloud.com> <271cf485-c03a-4592-a1fb-d6d201fbe74b@suse.com>
In-Reply-To: <271cf485-c03a-4592-a1fb-d6d201fbe74b@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 19 Aug 2024 13:41:52 +0100
Message-ID: <CACHz=ZiyjvFhTseesKYVhjc5nYx1c6O_BCiYqoC3BBmuOgkFFA@mail.gmail.com>
Subject: Re: [PATCH] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 12:35=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 19.08.2024 13:07, Frediano Ziglio wrote:
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -287,19 +287,36 @@ static bool __init match_guid(const EFI_GUID *gui=
d1, const EFI_GUID *guid2)
> >  /* generic routine for printing error messages */
> >  static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode=
)
> >  {
> > -    static const CHAR16* const ErrCodeToStr[] __initconstrel =3D {
> > -        [~EFI_ERROR_MASK & EFI_NOT_FOUND]           =3D L"Not found",
> > -        [~EFI_ERROR_MASK & EFI_NO_MEDIA]            =3D L"The device h=
as no media",
> > -        [~EFI_ERROR_MASK & EFI_MEDIA_CHANGED]       =3D L"Media change=
d",
> > -        [~EFI_ERROR_MASK & EFI_DEVICE_ERROR]        =3D L"Device error=
",
> > -        [~EFI_ERROR_MASK & EFI_VOLUME_CORRUPTED]    =3D L"Volume corru=
pted",
> > -        [~EFI_ERROR_MASK & EFI_ACCESS_DENIED]       =3D L"Access denie=
d",
> > -        [~EFI_ERROR_MASK & EFI_OUT_OF_RESOURCES]    =3D L"Out of resou=
rces",
> > -        [~EFI_ERROR_MASK & EFI_VOLUME_FULL]         =3D L"Volume is fu=
ll",
> > -        [~EFI_ERROR_MASK & EFI_SECURITY_VIOLATION]  =3D L"Security vio=
lation",
> > -        [~EFI_ERROR_MASK & EFI_CRC_ERROR]           =3D L"CRC error",
> > -        [~EFI_ERROR_MASK & EFI_COMPROMISED_DATA]    =3D L"Compromised =
data",
> > -        [~EFI_ERROR_MASK & EFI_BUFFER_TOO_SMALL]    =3D L"Buffer too s=
mall",
> > +#define ERROR_MESSAGE_LIST \
> > +    ERROR_MESSAGE(EFI_NOT_FOUND, "Not found") \
> > +    ERROR_MESSAGE(EFI_NO_MEDIA, "The device has no media") \
> > +    ERROR_MESSAGE(EFI_MEDIA_CHANGED, "Media changed") \
> > +    ERROR_MESSAGE(EFI_DEVICE_ERROR, "Device error") \
> > +    ERROR_MESSAGE(EFI_VOLUME_CORRUPTED, "Volume corrupted") \
> > +    ERROR_MESSAGE(EFI_ACCESS_DENIED, "Access denied") \
> > +    ERROR_MESSAGE(EFI_OUT_OF_RESOURCES, "Out of resources") \
> > +    ERROR_MESSAGE(EFI_VOLUME_FULL, "Volume is full") \
> > +    ERROR_MESSAGE(EFI_SECURITY_VIOLATION, "Security violation") \
> > +    ERROR_MESSAGE(EFI_CRC_ERROR, "CRC error") \
> > +    ERROR_MESSAGE(EFI_COMPROMISED_DATA, "Compromised data") \
> > +    ERROR_MESSAGE(EFI_BUFFER_TOO_SMALL, "Buffer too small")
> > +
> > +    static const struct ErrorStrings {
>
> __initconst?
>

It's below, attached to the variable, it cannot be attached to a
structure declaration.

> > +        CHAR16 start;
> > +#undef ERROR_MESSAGE
> > +#define ERROR_MESSAGE(code, str) CHAR16 msg_ ## code[sizeof(str)];
> > +        ERROR_MESSAGE_LIST
> > +    } ErrorStrings __initconst =3D {

Here it is.

> > +        0
> > +#undef ERROR_MESSAGE
> > +#define ERROR_MESSAGE(code, str) , L ## str
> > +        ERROR_MESSAGE_LIST
> > +    };
> > +    static const uint16_t ErrCodeToStr[] __initconst =3D {
> > +#undef ERROR_MESSAGE
> > +#define ERROR_MESSAGE(code, str) \
> > +        [~EFI_ERROR_MASK & code] =3D offsetof(struct ErrorStrings, msg=
_ ## code),
> > +        ERROR_MESSAGE_LIST
> >      };
> >      EFI_STATUS ErrIdx =3D ErrCode & ~EFI_ERROR_MASK;
> >
> > @@ -308,7 +325,7 @@ static void __init PrintErrMesg(const CHAR16 *mesg,=
 EFI_STATUS ErrCode)
> >      PrintErr(L": ");
> >
> >      if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
> > -        mesg =3D ErrCodeToStr[ErrIdx];
> > +        mesg =3D (CHAR16*) ((char*) &ErrorStrings + ErrCodeToStr[ErrId=
x]);
>
> Please never cast away const. Also (nit) please put the blanks at the rig=
ht
> places. Finally instead of casting to char * (something string-like)
> intermediately, perhaps better cast to void *? Taken together
>
>         mesg =3D (const CHAR16 *)((const void *)&ErrorStrings + ErrCodeTo=
Str[ErrIdx]);
>

Done, less portable but it's not portable code.

> (which looks like it'll then also need line-wrapping).
>
> Further please add an appropriate Fixes: tag.
>

Done

> Jan

Frediano

