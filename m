Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A70B27E4B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 12:33:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083253.1442881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrjz-00015d-2B; Fri, 15 Aug 2025 10:32:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083253.1442881; Fri, 15 Aug 2025 10:32:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrjy-00012X-Uj; Fri, 15 Aug 2025 10:32:54 +0000
Received: by outflank-mailman (input) for mailman id 1083253;
 Fri, 15 Aug 2025 10:32:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RDBg=23=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1umrjw-000128-AI
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 10:32:52 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 319e1d9f-79c3-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 12:32:51 +0200 (CEST)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-30cce58bb89so1690020fac.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 03:32:51 -0700 (PDT)
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
X-Inumbo-ID: 319e1d9f-79c3-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1755253970; x=1755858770; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIis+tELiFMThSIqBI+16VMGt7tO48JAPZ3VKq3sYRw=;
        b=Fn9GZOZ+dN0eWbTOTtDZBsn2xXQ9Z/NxYHX3Ky9IeHWUS38MlUsFZlh3cFsx7msbpN
         ObnwV7j+DU+rYOhnoL96yutTk0oLzD3Ziw5Z//6tY0ej5Fjs/Qd1waTqZEfI5QWAKikr
         MU71sjnCLfMbWXi2Ly/9ye4Co9JmppmNK5ghw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755253970; x=1755858770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIis+tELiFMThSIqBI+16VMGt7tO48JAPZ3VKq3sYRw=;
        b=kcV3t9Xj/0KNesSYSYgM1QedVgEF6pUs65POE/c/8js2qwmvwyiWo72GsRbAXUI8+5
         pcbBlk+7H8rk+xRAa8PfaOcWrbhdKKx041AsQPocJ4DqMmQgkBRYF2vB6Uen/MoaG5Re
         0bEcQkNDHjjh01huR7gOWiqSkhSrbaQkdb9E6axsu/gB/KhAtI2CPmToowGvHzSbXW9l
         68zXlGbjRGOYVA07bZOrLWlgu4XoQrLw805VtQgRjogQ+UWgUhl4M02hFeWFmzdU0bBx
         TmjnBTRBUlGFpsWflYrWr/EXSndMuQqybCZQa6g0b93AVrM4SvOpL9IITFIYJPc8LWqw
         KbDg==
X-Gm-Message-State: AOJu0YxLhjKr2FQZ1doAV+eqqc9sUMn+PkUe1IB65Cly2USW1ZEtZenX
	PFUn93QiAdgKywdx99OFTxV9WO3GYByBY4ZHQhuZato6trT6V3zvSwSSAnDLMZT3n6vr3yfhcfV
	VUdPaFkDPL0xHO1CpkWlvhrn/pMVOG9NEiCBwj18VNBo3JRaKGLdsG3U=
X-Gm-Gg: ASbGncsiaqnZFBAHx+6JlYTt4lf/LMTGhbLfpBV7kzvA0ZpZnlpBHUJRqnEdpKDRXvP
	6Qd1E2djq2upRWrrURQa9aGfkF2zELkZ73XwNYd4NeNfnVbfJ8Kmb1s+BoC5mAd3oabhTOoTl5c
	yiDk0W68dw6DoApFK74OVQrc1mWPouE18v12XW+UfjXryD7jVdzy/fmUO4Deki5uqR7h+y0gP9+
	gRyoQ==
X-Google-Smtp-Source: AGHT+IHshQcpdjY0o1B6PLdYwN+FJ3+bqRiUyEUW+o03QwRRTRLLgeDrw+jrmwaz40U6mndZXNxGExOI9HU1PAE+m14=
X-Received: by 2002:a05:6808:4fdf:b0:426:8e44:33f5 with SMTP id
 5614622812f47-435ec2e49a0mr666438b6e.0.1755253969886; Fri, 15 Aug 2025
 03:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250708135701.119601-1-frediano.ziglio@cloud.com> <CACHz=Zj1n1=azmve2QZT4W7O_dcZqZY0M1GBnkTKfDzZrsGqhg@mail.gmail.com>
In-Reply-To: <CACHz=Zj1n1=azmve2QZT4W7O_dcZqZY0M1GBnkTKfDzZrsGqhg@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 15 Aug 2025 11:32:38 +0100
X-Gm-Features: Ac12FXwmWgKjg7zYa89DJ8qYhgfHwn9vBaEoOYkj88-lx1Jhu2n-AOOpjS5zSnM
Message-ID: <CACHz=Zi1e7NiPZ-E+arBziz3XpBu-Ynm80QKZS5TP3KVpJDHhg@mail.gmail.com>
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Mon, Jul 28, 2025 at 11:39=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> ping
>
> On Tue, Jul 8, 2025 at 2:57=E2=80=AFPM Frediano Ziglio
> <frediano.ziglio@cloud.com> wrote:
> >
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
> > Fixes: bf6501a62e80 ("x86-64: EFI boot code")
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> > Changes since v1:
> > - use argc to make code more clear;
> > - fix commit reference;
> > - improve commit message.
> > ---
> >  xen/common/efi/boot.c | 13 +++++++------
> >  1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index 9306dc8953..385292ad4e 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -350,10 +350,11 @@ static unsigned int __init get_argv(unsigned int =
argc, CHAR16 **argv,
> >
> >      if ( argc )
> >      {
> > +        argc =3D 0;
> >          cmdline =3D data + *offset;
> >          /* EFI_LOAD_OPTION does not supply an image name as first comp=
onent. */
> >          if ( *offset )
> > -            *argv++ =3D NULL;
> > +            argv[argc++] =3D NULL;
> >      }
> >      else if ( size > sizeof(*cmdline) && !(size % sizeof(*cmdline)) &&
> >                (wmemchr(data, 0, size / sizeof(*cmdline)) =3D=3D
> > @@ -414,14 +415,14 @@ static unsigned int __init get_argv(unsigned int =
argc, CHAR16 **argv,
> >                  ++argc;
> >              else if ( prev && wstrcmp(prev, L"--") =3D=3D 0 )
> >              {
> > -                --argv;
> > +                --argc;
> >                  if ( options )
> >                      *options =3D cmdline;
> >                  break;
> >              }
> >              else
> >              {
> > -                *argv++ =3D prev =3D ptr;
> > +                argv[argc++] =3D prev =3D ptr;
> >                  *ptr =3D *cmdline;
> >                  *++ptr =3D 0;
> >              }
> > @@ -429,7 +430,7 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
> >          prev_sep =3D cur_sep;
> >      }
> >      if ( argv )
> > -        *argv =3D NULL;
> > +        argv[argc] =3D NULL;
> >      return argc;
> >  }
> >
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
> >          else
> >              argc =3D 0;
> >          for ( i =3D 1; i < argc; ++i )
> > --
> > 2.43.0
> >

