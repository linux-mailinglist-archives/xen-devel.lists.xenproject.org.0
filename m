Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECDEAFB7F4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 17:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035690.1408042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYo8A-00087s-24; Mon, 07 Jul 2025 15:51:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035690.1408042; Mon, 07 Jul 2025 15:51:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYo89-00084z-Ug; Mon, 07 Jul 2025 15:51:45 +0000
Received: by outflank-mailman (input) for mailman id 1035690;
 Mon, 07 Jul 2025 15:51:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lsf8=ZU=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uYo88-00084t-Cy
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 15:51:44 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 470424ce-5b4a-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 17:51:43 +0200 (CEST)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-60d6303a11eso1875117eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 08:51:43 -0700 (PDT)
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
X-Inumbo-ID: 470424ce-5b4a-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1751903502; x=1752508302; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2AzS3p+TVCrtwVhVF4t8C/bzNah/yYGRJDILS1c/rw=;
        b=KK9eCtSxfCFBGB2LK27GsKpp7lm2vffeo2tqmrHupO8Oci2ug9XtQFAPw0XsmI0SCj
         6bmP9923PW5h26YuT0JofXpANn7iPLpz3Cs01YUgInXxrUv37Wm01tLUCveCvu/6G8uq
         7+OIyPc+6HJybGI4OdiX6GJeORNlB673IIcJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751903502; x=1752508302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2AzS3p+TVCrtwVhVF4t8C/bzNah/yYGRJDILS1c/rw=;
        b=G5VxJ10VLcXRz/69Yo/56GhVgRBpz3kPjk5dTtASlh7oc7A/2sV6snMQg+Hj3/aR+Y
         SWHyP7ZXKm6YH3zr/SuRpabHbR85HNVQyg35mhRrpJD8mEb3YqCCur0AigrWTkLG0B4S
         4It5hA464zwx7feKrEIWtBFNspwIWggT5DbdmQO7js8ppYPDDXG76xbSQxec4qPiNqOa
         cKhbo3s8kkEI+rfv6kPNMGdeXBU+I4XPhPWT4spOXo3kqBN8bdZOUF4w2mUjNWAgR9t9
         o1CwergLo2cPLjD2PIAb9PZxGBAAjzImrPApmv4NlbknMyQTZEBuA2JmjnbkAp4L8F+f
         QbZw==
X-Forwarded-Encrypted: i=1; AJvYcCWy7h5CnwgprVtqX06TNh5Bc7M+CAlP1ABPibWeP/tBlEWYuvX2Fuhw/yopFYTio2OJLkg31YC/T5g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxqmaEzOUQTkg1Go+YoyHHhSBUECyhYT5wvLM1YjRh7fd2UQK3p
	cnJ4HYhdVYhi3NDatXYIxs5/kx5vJbe/z0O3cWe6OirFPcLkah0lsveyaZZvf3qvFI61OlZfN4r
	f0ycMRYQvxdC8otOvtxB5/0oihXQsgwDJkPkk+8maDq2kfXbgyoQpwdOK9g==
X-Gm-Gg: ASbGncvjH9OdEtuGItX7ZfBzVwFX60tVFUrE+q911PXv99Q2tCSSoK1HMLJx/QVnQhR
	XLw+JPAdG9ZoF3gKj879TF2URx1hny+r4/Q90PNEEZApkZfXzNRCNMKVCZW/oBxGlXiA9HURffN
	7m02c368aZhp8x4bLCvx3hpehZtjp/J3CuMEj5b9AoKQ==
X-Google-Smtp-Source: AGHT+IGwSumGpVqBqt5+T81ho2pnB+eSYFb/l+1iIH81VjyH2gKtGHtQrm6Rpet+lfPnEADaWw1phBHiSIorSr04zEc=
X-Received: by 2002:a05:6808:2202:b0:40b:3644:7489 with SMTP id
 5614622812f47-40d2cc3fdbcmr5088190b6e.18.1751903501843; Mon, 07 Jul 2025
 08:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250707151122.292272-1-frediano.ziglio@cloud.com> <ab5d830a-8b59-46d6-9e97-12b351bcf221@suse.com>
In-Reply-To: <ab5d830a-8b59-46d6-9e97-12b351bcf221@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 7 Jul 2025 16:51:30 +0100
X-Gm-Features: Ac12FXzJU5wYqo-RUb6WScBIus_3rlvYimwQc2dg3cCFY4gWKgqAMrl6nnRJm1k
Message-ID: <CACHz=ZiiO4KwSPitaE261oBucAuZkHr3ugp+mCYhCnSbN8FyAw@mail.gmail.com>
Subject: Re: [PATCH] xen/efi: Fix crash with initial empty EFI options
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 4:42=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 07.07.2025 17:11, Frediano Ziglio wrote:
> > EFI code path split options from EFI LoadOptions fields in 2
> > pieces, first EFI options, second Xen options.
> > "get_argv" function is called first to get the number of arguments
> > in the LoadOptions, second, after allocating enough space, to
> > fill some "argc"/"argv" variable. However the first parsing could
> > be different from second as second is able to detect "--" argument
> > separator. So it was possible that "argc" was bigger that the "argv"
> > array leading to potential buffer overflows, in particular
> > a string like "-- a b c" would lead to buffer overflow in "argv"
> > resulting in crashes.
> > Using EFI shell is possible to pass any kind of string in
> > LoadOptions.
> >
> > Fixes: 201f261e859e ("EFI: move x86 boot/runtime code to common/efi")
>
> This only moves the function, but doesn't really introduce any issue afai=
cs.
>

Okay, I'll follow the rename

> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -345,6 +345,7 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
> >                                      VOID *data, UINTN size, UINTN *off=
set,
> >                                      CHAR16 **options)
> >  {
> > +    CHAR16 **const orig_argv =3D argv;
> >      CHAR16 *ptr =3D (CHAR16 *)(argv + argc + 1), *prev =3D NULL, *cmdl=
ine =3D NULL;
> >      bool prev_sep =3D true;
> >
> > @@ -384,7 +385,7 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
> >                  {
> >                      cmdline =3D data + *offset;
> >                      /* Cater for the image name as first component. */
> > -                    ++argc;
> > +                    ++argv;
>
> We're on the argc =3D=3D 0 and argv =3D=3D NULL path here. Incrementing N=
ULL is UB,
> if I'm not mistaken.
>

Not as far as I know. Why? Some systems even can use NULL pointers as
valid, like mmap.

> > @@ -402,7 +403,7 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
> >          {
> >              if ( cur_sep )
> >                  ++ptr;
> > -            else if ( argv )
> > +            else if ( orig_argv )
> >              {
> >                  *ptr =3D *cmdline;
> >                  *++ptr =3D 0;
> > @@ -410,8 +411,8 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
> >          }
> >          else if ( !cur_sep )
> >          {
> > -            if ( !argv )
> > -                ++argc;
> > +            if ( !orig_argv )
> > +                ++argv;
> >              else if ( prev && wstrcmp(prev, L"--") =3D=3D 0 )
> >              {
> >                  --argv;
>
> As per this, it looks like that on the 1st pass we may indeed overcount
> arguments. But ...
>

I can use again argc if you prefer, not strong about it.

> > @@ -428,9 +429,9 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
> >          }
> >          prev_sep =3D cur_sep;
> >      }
> > -    if ( argv )
> > +    if ( orig_argv )
> >          *argv =3D NULL;
> > -    return argc;
> > +    return argv - orig_argv;
> >  }
> >
> >  static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE=
 *loaded_image,
> > @@ -1348,8 +1349,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE =
ImageHandle,
> >                                    (argc + 1) * sizeof(*argv) +
> >                                        loaded_image->LoadOptionsSize,
> >                                    (void **)&argv) =3D=3D EFI_SUCCESS )
> > -            get_argv(argc, argv, loaded_image->LoadOptions,
> > -                     loaded_image->LoadOptionsSize, &offset, &options)=
;
> > +            argc =3D get_argv(argc, argv, loaded_image->LoadOptions,
> > +                            loaded_image->LoadOptionsSize, &offset, &o=
ptions);
>
> ... wouldn't this change alone cure that problem? And even that I don't
> follow. Below here we have
>
>         for ( i =3D 1; i < argc; ++i )
>         {
>             CHAR16 *ptr =3D argv[i];
>
>             if ( !ptr )
>                 break;
>
> and the 2nd pass of get_argv() properly terminates the (possibly too larg=
e)
> array with a NULL sentinel. So I wonder what it is that I'm overlooking a=
nd
> that is broken.
>
> Jan

I realized that because I got a crash, not just by looking at the code.

The string was something like "-- a b c d":
- the first get_argv call produces a 5 argc;
- you allocate space for 6 pointers and length of the entire string to copy=
;
- the parser writes a single pointer in argv and returns still 5 as argc;
- returned argc is ignored;
- code "for (i =3D 1; i < argc; ++i)" starts accessing argv[1] which is
not initialized, in case of garbage you dereference garbage.

Frediano

