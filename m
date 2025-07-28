Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C52B13922
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:40:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061269.1426790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLH8-0004Js-6p; Mon, 28 Jul 2025 10:40:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061269.1426790; Mon, 28 Jul 2025 10:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLH8-0004HC-3c; Mon, 28 Jul 2025 10:40:10 +0000
Received: by outflank-mailman (input) for mailman id 1061269;
 Mon, 28 Jul 2025 10:40:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRgz=2J=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ugLH6-0004Cx-Ih
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:40:08 +0000
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [2607:f8b0:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 399fc014-6b9f-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 12:40:06 +0200 (CEST)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-41baecbdd33so2358731b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:40:06 -0700 (PDT)
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
X-Inumbo-ID: 399fc014-6b9f-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753699205; x=1754304005; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPcs8pJgXC/EMxr/bA3TtJfSx63P2rJA0+faK79qbsI=;
        b=ELUWJCAUQ/nqQ8pHDonZbrEcRZ0SIYc47rUFF6kyMDpRgXMGtFeujFvyJpWWid5hao
         QJDiV6NBq7uScz0yHmxdDHrd4Z6j7JT7KuYL7tFe+ee5DGlR2Ujy/Rk8cal2iusaJv/v
         2zBg1wOr7SwzglQfOH5E4SupU5+akpJMntGOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753699205; x=1754304005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPcs8pJgXC/EMxr/bA3TtJfSx63P2rJA0+faK79qbsI=;
        b=X43IiLYmxC2Ydb3posNp+WmvB3Vwag9zug76hmJ9hLzLwqVc4YW3Gh4IlrEpzcfP3H
         N1Pj3Ax8Tlz+W8ST3WNGBNadpMy7wEkFufDB4+NBR5Gd8bQa9Z3ADEQqhPslUiREwCb0
         T3UsfWIbskt4vABTS9mfXzLBq+6rQumRjiOeq4ne8o1GZh1qPG+e6j7qm5wvBsMpMS5C
         57Oy+kt596Wb/EFJKfvpwCjlP+I+v0z97TzrNFT77ZdpQ9rzPb5D9YLYfYLgXIrBXrvx
         fIJABlLdAScYMIdLn0ql+bunnbBT6R2G0V34bPqKrCziei+9QH/8N8xwUFj+leolhgqF
         lbKg==
X-Gm-Message-State: AOJu0YwLGhTStKuOQ8/kxkp1DxNF5OZqErU6dBgfCEVRXbvui+T2Todn
	wjKSRc+orcNkyTIpNnSoqaHQN8ZDfwa2k8Mrdm7DMcRIOH1lek+cPJgXq3Ib0ikO0P3OavczNra
	7Qs0hEBgXdN5VVjZ2fcifFxTjixVOsmDeUOLfY7iR4r0i+DpZuKaf/Bs=
X-Gm-Gg: ASbGncsGfDGUnD+VxAioWrMCi0lWuz/nEVESyainBAcF+FiKdEJVAgREGixkLR/WNxa
	su54MSVdbcHWouHTGdCYtCUCIk9nCCoQGTbJOVIx0bOviWTJkLvNHCVJomUPqzp1ry4OItonCRx
	INd6bhy4y/0TkUF+Y/G6S0GnWhjEXW0ezKUeyH1wJw0r57k4LwkC5St1lAvXpSdRWs94vRXVpS6
	jaKeQ==
X-Google-Smtp-Source: AGHT+IF6xcWsbk7zhgGhw+MJwndsTqcGsqy/b7W5Z9a9G6M1UQ5QzdPmQGW1mJzjtsV48KrLflSw911UkWmvHQEBq0g=
X-Received: by 2002:a05:6808:14d5:b0:420:c2cc:ab97 with SMTP id
 5614622812f47-42bba0ed57emr7479137b6e.19.1753699205109; Mon, 28 Jul 2025
 03:40:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250708135701.119601-1-frediano.ziglio@cloud.com>
In-Reply-To: <20250708135701.119601-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 28 Jul 2025 11:39:54 +0100
X-Gm-Features: Ac12FXzS_xZXZiI6TsN_V1VbMFRjwFQrQvMuWIjFxvhloTVtIBnMNYCSGNuAQIs
Message-ID: <CACHz=Zj1n1=azmve2QZT4W7O_dcZqZY0M1GBnkTKfDzZrsGqhg@mail.gmail.com>
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Tue, Jul 8, 2025 at 2:57=E2=80=AFPM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> EFI code path split options from EFI LoadOptions fields in 2
> pieces, first EFI options, second Xen options.
> "get_argv" function is called first to get the number of arguments
> in the LoadOptions, second, after allocating enough space, to
> fill some "argc"/"argv" variable. However the first parsing could
> be different from second as second is able to detect "--" argument
> separator. So it was possible that "argc" was bigger that the "argv"
> array leading to potential buffer overflows, in particular
> a string like "-- a b c" would lead to buffer overflow in "argv"
> resulting in crashes.
> Using EFI shell is possible to pass any kind of string in
> LoadOptions.
>
> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - use argc to make code more clear;
> - fix commit reference;
> - improve commit message.
> ---
>  xen/common/efi/boot.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 9306dc8953..385292ad4e 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -350,10 +350,11 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
>
>      if ( argc )
>      {
> +        argc =3D 0;
>          cmdline =3D data + *offset;
>          /* EFI_LOAD_OPTION does not supply an image name as first compon=
ent. */
>          if ( *offset )
> -            *argv++ =3D NULL;
> +            argv[argc++] =3D NULL;
>      }
>      else if ( size > sizeof(*cmdline) && !(size % sizeof(*cmdline)) &&
>                (wmemchr(data, 0, size / sizeof(*cmdline)) =3D=3D
> @@ -414,14 +415,14 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
>                  ++argc;
>              else if ( prev && wstrcmp(prev, L"--") =3D=3D 0 )
>              {
> -                --argv;
> +                --argc;
>                  if ( options )
>                      *options =3D cmdline;
>                  break;
>              }
>              else
>              {
> -                *argv++ =3D prev =3D ptr;
> +                argv[argc++] =3D prev =3D ptr;
>                  *ptr =3D *cmdline;
>                  *++ptr =3D 0;
>              }
> @@ -429,7 +430,7 @@ static unsigned int __init get_argv(unsigned int argc=
, CHAR16 **argv,
>          prev_sep =3D cur_sep;
>      }
>      if ( argv )
> -        *argv =3D NULL;
> +        argv[argc] =3D NULL;
>      return argc;
>  }
>
> @@ -1348,8 +1349,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>                                    (argc + 1) * sizeof(*argv) +
>                                        loaded_image->LoadOptionsSize,
>                                    (void **)&argv) =3D=3D EFI_SUCCESS )
> -            get_argv(argc, argv, loaded_image->LoadOptions,
> -                     loaded_image->LoadOptionsSize, &offset, &options);
> +            argc =3D get_argv(argc, argv, loaded_image->LoadOptions,
> +                            loaded_image->LoadOptionsSize, &offset, &opt=
ions);
>          else
>              argc =3D 0;
>          for ( i =3D 1; i < argc; ++i )
> --
> 2.43.0
>

