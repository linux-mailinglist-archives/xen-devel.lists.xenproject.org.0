Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3562AFE391
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 11:08:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037925.1410427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQm7-00006f-A7; Wed, 09 Jul 2025 09:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037925.1410427; Wed, 09 Jul 2025 09:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZQm7-0008Va-6i; Wed, 09 Jul 2025 09:07:35 +0000
Received: by outflank-mailman (input) for mailman id 1037925;
 Wed, 09 Jul 2025 09:07:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sLDI=ZW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uZQm5-0008VU-SP
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 09:07:33 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22b56fc2-5ca4-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 11:07:28 +0200 (CEST)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-2e999729ccbso3540742fac.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Jul 2025 02:07:28 -0700 (PDT)
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
X-Inumbo-ID: 22b56fc2-5ca4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1752052047; x=1752656847; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QkX0NB0Tw/rgC2KTsMzY77sQDxi0tuzCXOHGYxOyew=;
        b=VBCLNcYDAmJdXjJ3PkCwACQ0iOM4A9XV6tvQG7UFRhtcNCEMvoWUSx9B0Qsyyk/Gxy
         9dBedT+nxFR2LD4HgGgYwKug4oG3cTS4owYS+cykC+R2b6dDX27tOUp+vQ1YOLbXROQf
         6fp9R44aYynqqY283kVkFJbj8CjdPHCCg2JnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752052047; x=1752656847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5QkX0NB0Tw/rgC2KTsMzY77sQDxi0tuzCXOHGYxOyew=;
        b=Qz8KiFyAdHrhepC8GPEgfIft+08KvepzSKP8a8Gq1WZLKwjghwLlGHUk9+BmlfoFWl
         FyI0Ywp+itJNfaU8zjtBFp37e9VbBN600IGdYIsS26FkReA0eFszHEsaOPaeXUBfE93U
         LVHG0Yp3/tgA2q3t9FuAKCEvtmo6XdyLIHZRncUMwglZSkCrJG+3Hr0CNGDUywPcoEqv
         AsUDMvhYd9LJyF71mBKY0G+hB9tKcG35tk58w05zV2eOVLnHowfJk3dPHinZOMx1LcqM
         yRoii6bMBvOkUgbVYo6XGyS5Pq9bDjXMxmO7wzC3DW6PL2mKHB01HviG+REfWk24YiBM
         ICuA==
X-Forwarded-Encrypted: i=1; AJvYcCWB9GaGb07goWT8J773wsZIlm2LUZ7i2UBZ5e/WoD+RmmS9FPOrn6ISA+aM0Io6aP/jwGwEVzhGH0E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwF9Ok6hMWG2QEgr5gDAWmfa/xZQ2TlO1ciYIzz8R83zhe0SiLL
	iTGl1dogM49KpPayoGLgR02MU3nHVm/wjzHa1g9kBCPNu+xDdDP4M1qL85jjBYlnUnrYsrG106N
	v3gnk+EmPIiJ5wG1MNvUynSFoC96HBnvD/LumeDEIyA==
X-Gm-Gg: ASbGnctRM0lCGY9/qUDixdSsTJvuWB3G03AkpE+pDgzFabfimzJ118+cbG/a5W7kfAN
	jJIIhUnRC+S+QTNjkdDxAnpojqWPPXr68oGtMgR1FZjvqKHAJoa4R4fpMq8NS6jSVDlZ3qLH/eF
	iK+e0eY7WpgTNc0i5DpZoRTGxmJsVYpqa2MpJUmVnG4A==
X-Google-Smtp-Source: AGHT+IFYGQ+SokfW2njx3WZzVofV838aPHi5JlaBjEKM6tKOlxjS11QQG9VnPew2hfa60QFSOMlU5Mmy39JkwihFoHY=
X-Received: by 2002:a05:6808:4fe9:b0:40b:555b:9024 with SMTP id
 5614622812f47-412bafdb458mr1065030b6e.17.1752052046856; Wed, 09 Jul 2025
 02:07:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250708135701.119601-1-frediano.ziglio@cloud.com> <662366f6-7442-4b36-81a6-90ddcad6e59d@suse.com>
In-Reply-To: <662366f6-7442-4b36-81a6-90ddcad6e59d@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 9 Jul 2025 10:07:15 +0100
X-Gm-Features: Ac12FXzCWX3tcoedRGS7XT8WoqPPPmFC1I7aZip8gXKMb2UtMQtKrRQ60owBCy4
Message-ID: <CACHz=ZjgqBDKt=8xO1-BW-HzJ1W=_ogA4zdMaSK7P34YNT0HfQ@mail.gmail.com>
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 4:41=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 08.07.2025 15:56, Frediano Ziglio wrote:
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
>
> Have you convinced yourself that your change isn't a workaround for a
> bug elsewhere? You said you repro-ed with grub's chainloader, but that
> doesn't imply things are being got correct there. I can certainly
> accept that I may have screwed up back then. But I'd like to understand
> what the mistake was, and so far I don't see any. As before, being
> passed just "-- a b c" looks like a bug in the code generating the
> command line.
>

The only reason I put the "Fixes" comments it's that you always asked
me to do so. From what you wrote it looks like you are taking it
personally. I don't care much why there is the bug or when it was
introduced, I found a crash in Xen and I want to fix it. Marek in
another comment said Xen should not crash that way. IMO even if the
bug turns out to be outside Xen and GRUB should always provide
something as argv[0] Xen is failing validating the input received and
good software should properly validate inputs.
From a discussion in XenDevel chat Antony pointed out the script at
https://xenbits.xen.org/gitweb/?p=3Dosstest.git;a=3Dblob;f=3Doverlay-bookwo=
rm/etc/grub.d/20_linux_xen;h=3D8559352563d9a2466670661671f306659ace2590;hb=
=3DHEAD#l259.
On line 160 you can see

 ${xen_loader}   ${rel_xen_dirname}/${xen_basename} placeholder
${xen_args} \${xen_rm_opts}

that is a dummy "placeholder" argument is added to replace the
argv[0]. In other words, possibly removing this "issue" from GRUB will
now cause regressions.

> > @@ -429,7 +430,7 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
> >          prev_sep =3D cur_sep;
> >      }
> >      if ( argv )
> > -        *argv =3D NULL;
> > +        argv[argc] =3D NULL;
>
> Strictly speaking the need for this sentinel now disappears, doesn't it?

"argc" and "argv" are usually the command line parameters in a C
program. "argv" is a NULL terminated array so why avoid this coherency
from C?

> As does ...
>
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
>
> ... the need for
>
>             if ( !ptr )
>                 break;

It does not hurt and apparently for EFI_LOAD_OPTION we fill argv[0]
with a NULL instead of an empty or dummy string so I would keep this
test anyway.

>
> just out of context here?
>
> Jan

Frediano

