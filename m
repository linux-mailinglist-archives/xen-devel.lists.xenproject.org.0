Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1BFAAE0BF
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 15:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978562.1365315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCepb-0006dJ-Lg; Wed, 07 May 2025 13:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978562.1365315; Wed, 07 May 2025 13:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCepb-0006ah-J7; Wed, 07 May 2025 13:29:03 +0000
Received: by outflank-mailman (input) for mailman id 978562;
 Wed, 07 May 2025 13:29:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m17E=XX=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uCepa-0006ab-Cv
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 13:29:02 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c4cf5d0-2b47-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 15:29:01 +0200 (CEST)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-601a8b6c133so505815eaf.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 06:29:01 -0700 (PDT)
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
X-Inumbo-ID: 3c4cf5d0-2b47-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746624540; x=1747229340; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07TUMPgaM14DSDMu/4lHBTiHAaMECtwkVV8+0qNHetE=;
        b=hknMqDDhGsOqjNbBc8c53Ya0bQceZGXs86eazGxQQoAronMg4wki9IKEjUOybxbqzz
         E5dJs4j36Wa9Jiuxbf0ACMNUy+1oYIEyUrneACGOmQ/BG1+yNOJkJzPXscERvNkyovxl
         //wo36h8+/vrbQ6dxqSx2ojDiDyskM8betu4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624540; x=1747229340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07TUMPgaM14DSDMu/4lHBTiHAaMECtwkVV8+0qNHetE=;
        b=Couac4u/8onwGlirYHkvctqJMuFvCoxX9Vjjncyf8qDvrH3TGFfSrMOYqyvlEJ871f
         wMbzqW8SuIvc8F02uUS2wgIWzpVm0xefr2B9koU8xx+DPBZHxBeoaX20w2neeIUH74D1
         4Hd7RdxmxYM4LxshVX6QPMCdwULwE/ZuXdYO4H/027Wvwfg3JAI23zpgnk/ltB9JEunQ
         jFFQMy/QN/Z89DDOK209aYSk2qH070rlbUVXedaN7Wqx+1/IT7kJRxdqBLWRLwZwLU9N
         HRJ3tRbvhFSBKoQ3+06FIB9ALEgMBB+XYTD0scCw8VWxytvn54ZN3zGsuIsws/73UkO7
         eSRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZKAU47oWUaxJzAfc7GK495O1CNAHT4OCZfipK60eXtSeEetfsKNEW3Brr/nIb7DMVxkMVRxVn+D4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfiWw3aUtkQJT3XjOAOjHwbUGUHAmTMCKkSQDUD4mcr8QBtFXY
	PF62i/CjaYC6rY7BqL0qtubbiHV1Kv52ulrZB+TxBGw5uW2P+wXpak5Bdj5KnvLBkX33azBRt1D
	wS3HTubF+Gu1h9KePqPIkn3tV+K42yntdgNW9Pg==
X-Gm-Gg: ASbGncvpoYGuhnU79w/GtweXDsu/smcU3VA9+5qly1GcYL0NAz+n//uDCqLU9l1uTsr
	AVj1xChHVdapFTBVsTBSTCNOebpNsjtQ7NsgcA9o4tY/LiSWbQjBhrNtcCBbvvedTsvDzFKC96b
	eYnGmwr3hghKi9D2zRihXXtl9U0+1405IN
X-Google-Smtp-Source: AGHT+IHVyy07eeqOAOpvnaxG3XjvSYlxj6V9DZTvhA5SckZglosrdlC8RHS5CM6SrFGoEMk+A4rKb5rDXqGilT3vodM=
X-Received: by 2002:a4a:ca18:0:b0:607:de46:fa94 with SMTP id
 006d021491bc7-60828322836mr2397008eaf.4.1746624539704; Wed, 07 May 2025
 06:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250506162449.1676405-1-kevin.lampis@cloud.com> <cf3e9dbf-7ea7-4b33-a4be-14cb5dac0ebc@citrix.com>
In-Reply-To: <cf3e9dbf-7ea7-4b33-a4be-14cb5dac0ebc@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 7 May 2025 14:28:48 +0100
X-Gm-Features: ATxdqUHseC44rgafBnlr6a_7ETNqkIKHRdbSIoVdG-gc2aoYeku4DtYcNIv0MhA
Message-ID: <CACHz=Ziq9ZCS8F0L=AAmJWm+=2OTbzCNHc8MenbF3ZrQ18W7gg@mail.gmail.com>
Subject: Re: [PATCH 2/4] efi: Add a function to check if Secure Boot mode is enabled
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Lampis <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org, 
	Ross Lagerwall <ross.lagerwall@citrix.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 5:56=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> CC'ing the EFI maintainers.
>
> On 06/05/2025 5:24 pm, Kevin Lampis wrote:
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index e39fbc3529..7c528cd5dd 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -870,6 +870,27 @@ static void __init pre_parse(const struct file *fi=
le)
> >                     " last line will be ignored.\r\n");
> >  }
> >
> > +static void __init init_secure_boot_mode(void)
> > +{
> > +    EFI_STATUS status;
> > +    EFI_GUID gv_uuid =3D EFI_GLOBAL_VARIABLE;
> > +    uint8_t data =3D 0;
> > +    UINTN size =3D sizeof(data);
> > +    UINT32 attr =3D 0;
>
> Newline between variables and code please.
>
> > +    status =3D efi_rs->GetVariable((CHAR16 *)L"SecureBoot", &gv_uuid, =
&attr,
> > +                                 &size, &data);
> > +
> > +    if ( status =3D=3D EFI_NOT_FOUND ||
> > +         (status =3D=3D EFI_SUCCESS &&
> > +          attr =3D=3D (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_=
RUNTIME_ACCESS) &&
> > +          size =3D=3D 1 && data =3D=3D 0) )
> > +        /* Platform does not support Secure Boot or it's disabled. */
> > +        efi_secure_boot =3D false;
> > +    else
> > +        /* Everything else play it safe and assume enabled. */
> > +        efi_secure_boot =3D true;
> > +}
>
> I'm not sure this logic does what you want when a weird answer comes
> back from GetVariable().
>
> Also, you can't have this be a common function, yet ...
>
> > diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
> > index 7e1fce291d..b63d21f16c 100644
> > --- a/xen/common/efi/runtime.c
> > +++ b/xen/common/efi/runtime.c
> > @@ -40,6 +40,9 @@ void efi_rs_leave(struct efi_rs_state *state);
> >  unsigned int __read_mostly efi_num_ct;
> >  const EFI_CONFIGURATION_TABLE *__read_mostly efi_ct;
> >
> > +#if defined(CONFIG_X86) && !defined(CONFIG_PV_SHIM)
> > +bool __ro_after_init efi_secure_boot;
> > +#endif
>
> ... this variable exist only on x86.
>

On a more high level. Is secure boot specific to x86? I think it's
generic so it should be compiled also for ARM or any EFI enabled
architectures.

> Also, why adjust it for PV shim?  None of this is even compiled for PV sh=
im.
>
> ~Andrew
>

Frediano

