Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD66AAEA18B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 16:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026585.1401755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo2g-00051o-Eg; Thu, 26 Jun 2025 14:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026585.1401755; Thu, 26 Jun 2025 14:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUo2g-00050N-Bf; Thu, 26 Jun 2025 14:57:34 +0000
Received: by outflank-mailman (input) for mailman id 1026585;
 Thu, 26 Jun 2025 14:57:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kW9B=ZJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUo2f-00050H-K3
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 14:57:33 +0000
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e178e475-529d-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 16:57:30 +0200 (CEST)
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-40abe6f8f08so783794b6e.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 07:57:30 -0700 (PDT)
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
X-Inumbo-ID: e178e475-529d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750949849; x=1751554649; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UxNtejzHt6apB6xUG64xQhpByahe+qgV8NS6kBpydc=;
        b=eRk/8ciB3jyPuvjyyprU0EOJ2Sbbr1ZyRgO+iuE2hjPGsmBYewoWWlHuBP2KA6x0MW
         M/+oJ18rAZKZQ3h+LBlcCAJwg+ifV9seyDeaa9DCS6Zcq6twRfnZeGhjRG/8IycuWrRh
         /Y/FIFHuiM0tTDr3dK+j1quidfqIroBlXk4X4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750949849; x=1751554649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UxNtejzHt6apB6xUG64xQhpByahe+qgV8NS6kBpydc=;
        b=absVl2GYLXw1S4SfI0ND9Wc0rtJSrWfCLCspPBQhSOXebKh9WTwwe3gfEP8RzxUHcE
         hOK6LWOztIX5GwjBo60TxzBMpGkqid4pRshI3HIYsRRnYVEVwM7TtTvz8ruHspAO8TtB
         jWDyP0Pbwn7RKGIjEFQaT+0XoGNAvbCeHCW9+8NGfk2VLFvvaF8qVlu0409C2U84QgZW
         ds0DqkpoHuIH0TU+LabNETubnFYTFXKnVn5LRLa59dHlPDqejl2azJmn17LB9A6SnbaZ
         nyzMg6Czhua7rK1SzGGtX2UH0wCMoOR9rC0IwdyVSuaF4FLYNLZ3bGFVefPrTALKg6FV
         LeVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy/RZVSYweUJ7g3MVmQLScLFde0VVG6KSTlrPFY+4DVsK3TZKQeVREN/5b/QqiALJ+N/D88gCRqNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw42T/M97TtPs5crlU1qiJwS89Inh+SABbgY9KQECA0Kp4iONCo
	Y2U3ueLtYWosNiRty8hEeasWBl+L3shwsqoTIYiSwxaKanWHCCrRDPeNgMlchu5y9jf79NU5/si
	tBuqXkygKB+OCkUUAAnNtkLZN3WaYOb2l3oHZ7uRrcA==
X-Gm-Gg: ASbGncvmcqhX40vZuZZQN/BcoLubo85oqKqgv2Q/Bp0Pd/HSOv+Q5EkBNeESA5DRf6o
	ajNnZEYAaq6U/kpLjCCbeWcyYCXGs0QsKDrwhg7ALFOWXj2Wz8lIGACcfT9y4I9zCY0XRV5ZTIU
	Rqmc09Lp9M/v2sZvnPZ+koPejruVScs2uw7W2RJZ6jxQi+SvTNIX8=
X-Google-Smtp-Source: AGHT+IFgipUoECT9/8Y9lScFTVonwJ5KpC3n6+Sg0ksevR+vFHlx+reQX2VPbLypOpfPh1yHawDd7W9PhMgIx2qNagY=
X-Received: by 2002:a05:6808:2011:b0:406:6d79:49e3 with SMTP id
 5614622812f47-40b05c40646mr6095367b6e.34.1750949848827; Thu, 26 Jun 2025
 07:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250626131059.61894-1-frediano.ziglio@cloud.com>
 <20250626131059.61894-4-frediano.ziglio@cloud.com> <9d64c239-d6cc-4eb5-b180-a5034bedcfdb@suse.com>
 <CACHz=ZjUHVGo+qQvwb5cz=q=QE8r=-WAjPYZ2vWGbfZCMsOatA@mail.gmail.com> <d0508105-c2e0-4f98-bc60-20be2336b044@suse.com>
In-Reply-To: <d0508105-c2e0-4f98-bc60-20be2336b044@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 26 Jun 2025 15:57:16 +0100
X-Gm-Features: Ac12FXxq8FY-Ylm26SB8CocNTSa_zgjHVQYPoHn44z-przQqbAshdw5tzIuI2pU
Message-ID: <CACHz=ZjVqZU_A0YYJ42StqM=PxF2T_CrfxWUXJgxm6WuQA5x-w@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] xen/efi: Update error flow for read_file function
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 3:50=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 26.06.2025 15:41, Frediano Ziglio wrote:
> > On Thu, Jun 26, 2025 at 2:31=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 26.06.2025 15:10, Frediano Ziglio wrote:
> >>> --- a/xen/common/efi/boot.c
> >>> +++ b/xen/common/efi/boot.c
> >>> @@ -792,6 +792,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_=
handle, CHAR16 *name,
> >>>
> >>>      if ( !name )
> >>>          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> >>> +
> >>> +    what =3D L"Open";
> >>>      if ( dir_handle )
> >>>          ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
> >>>                                 EFI_FILE_MODE_READ, 0);
> >>> @@ -800,54 +802,58 @@ static bool __init read_file(EFI_FILE_HANDLE di=
r_handle, CHAR16 *name,
> >>>      if ( file =3D=3D &cfg && ret =3D=3D EFI_NOT_FOUND )
> >>>          return false;
> >>>      if ( EFI_ERROR(ret) )
> >>> -        what =3D L"Open";
> >>> -    else
> >>> -        ret =3D FileHandle->SetPosition(FileHandle, -1);
> >>> +        goto fail;
> >>> +
> >>> +    what =3D L"Seek";
> >>> +    ret =3D FileHandle->SetPosition(FileHandle, -1);
> >>>      if ( EFI_ERROR(ret) )
> >>> -        what =3D what ?: L"Seek";
> >>> -    else
> >>> -        ret =3D FileHandle->GetPosition(FileHandle, &size);
> >>> +        goto fail;
> >>> +
> >>> +    what =3D L"Get size";
> >>> +    ret =3D FileHandle->GetPosition(FileHandle, &size);
> >>>      if ( EFI_ERROR(ret) )
> >>> -        what =3D what ?: L"Get size";
> >>> -    else
> >>> -        ret =3D FileHandle->SetPosition(FileHandle, 0);
> >>> +        goto fail;
> >>> +
> >>> +    what =3D L"Seek";
> >>> +    ret =3D FileHandle->SetPosition(FileHandle, 0);
> >>>      if ( EFI_ERROR(ret) )
> >>> -        what =3D what ?: L"Seek";
> >>> -    else
> >>> -    {
> >>> -        file->addr =3D min(1UL << (32 + PAGE_SHIFT),
> >>> -                         HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START)=
;
> >>> -        ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderD=
ata,
> >>> -                                    PFN_UP(size), &file->addr);
> >>> -    }
> >>> +        goto fail;
> >>> +
> >>> +    what =3D L"Allocation";
> >>> +    file->addr =3D min(1UL << (32 + PAGE_SHIFT),
> >>> +                     HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> >>> +    ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> >>> +                                PFN_UP(size), &file->addr);
> >>>      if ( EFI_ERROR(ret) )
> >>> -        what =3D what ?: L"Allocation";
> >>> -    else
> >>> -    {
> >>> -        file->need_to_free =3D true;
> >>> -        file->size =3D size;
> >>> -        handle_file_info(name, file, options);
> >>> +        goto fail;
> >>>
> >>> -        ret =3D FileHandle->Read(FileHandle, &file->size, file->str)=
;
> >>> -        if ( !EFI_ERROR(ret) && file->size !=3D size )
> >>> -            ret =3D EFI_ABORTED;
> >>> -        if ( EFI_ERROR(ret) )
> >>> -            what =3D L"Read";
> >>> -    }
> >>> +    file->need_to_free =3D true;
> >>> +    file->size =3D size;
> >>> +    handle_file_info(name, file, options);
> >>>
> >>> -    if ( FileHandle )
> >>> -        FileHandle->Close(FileHandle);
> >>> +    what =3D L"Read";
> >>> +    ret =3D FileHandle->Read(FileHandle, &file->size, file->str);
> >>> +    if ( !EFI_ERROR(ret) && file->size !=3D size )
> >>> +        ret =3D EFI_ABORTED;
> >>> +    if ( EFI_ERROR(ret) )
> >>> +        goto fail;
> >>>
> >>> -    if ( what )
> >>> -    {
> >>> -        PrintErr(what);
> >>> -        PrintErr(L" failed for ");
> >>> -        PrintErrMesg(name, ret);
> >>> -    }
> >>> +    FileHandle->Close(FileHandle);
> >>>
> >>>      efi_arch_flush_dcache_area(file->ptr, file->size);
> >>>
> >>>      return true;
> >>> +
> >>> +fail:
> >>
> >> Nit: Style (see ./CODING_STYLE).
> >>
> >
> > What specifically? I checked the indentation and it's 4 spaces. if-s
> > are spaced correctly. About labels I didn't find much on CODING_STYLE
> > so I opened 3/4 files and most of them are indented with no spaces
> > (they start at column 1).
>
> You didn't search for the word "label" then, did you? Quote:
>

I did, I probably mis-typed it.

> 'Due to the behavior of GNU diffutils "diff -p", labels should be
>  indented by at least one blank.  Non-case labels inside switch() bodies
>  are preferred to be indented the same as the block's case labels.'
>

I suppose labels should be indented less than the code they refer to,
so in this case from 1 to 3 spaces. I supposed 2 would be the best
option.

> Jan
>

