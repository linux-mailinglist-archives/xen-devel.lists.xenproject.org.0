Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F243CAE9F39
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 15:42:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026426.1401622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmrj-0005lE-Hw; Thu, 26 Jun 2025 13:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026426.1401622; Thu, 26 Jun 2025 13:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUmrj-0005iv-FD; Thu, 26 Jun 2025 13:42:11 +0000
Received: by outflank-mailman (input) for mailman id 1026426;
 Thu, 26 Jun 2025 13:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kW9B=ZJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUmrh-0005ip-Fu
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 13:42:09 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a3da758-5293-11f0-a30f-13f23c93f187;
 Thu, 26 Jun 2025 15:42:08 +0200 (CEST)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-73ac40e810eso261894a34.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 06:42:08 -0700 (PDT)
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
X-Inumbo-ID: 5a3da758-5293-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750945327; x=1751550127; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOaLR4NsW3bYPPDN8PATHK9da4Z1YXA1iEKUCq2Qs5g=;
        b=MfJGqkZstyNr+uFw+a/4p61bMwTcd+l18dPp6cLeCTNP2zNsKpGLJuCCtUa0zMfeLX
         Z1IPaCWbz6vpZYomIKc3ZAypgPyxGWfLM1G3cHke8+4hX41wZFOnxRvjFCKCGzyPY0HZ
         czTy+5rLBtdJBLgFpUrtnY03p7w63hiHG/YVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945327; x=1751550127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOaLR4NsW3bYPPDN8PATHK9da4Z1YXA1iEKUCq2Qs5g=;
        b=qHodf4mM55cYbP0+PrTxW1RmrPW02Tz3qqTPCAT34cWcw0jO+0lxy4whVWJsNd+zw6
         TLtbkmRugjQ2/sQNCrqJi0/MZjjyFvW7NIkEIa4lCz56LNS9NtE9YCqyZu221HGqUfG6
         /mZaCaKh4q6DsC/nNJtdHXEIH9lNVsU+D/asy5VgoJFQ8dSwG3LxYQoo5qXSKozWKNnL
         FBt2j+hQYoSg9Aupps6OjaeRAQi1IMx0haz9FEM+er8d1M8fPYH1uipbPH6vyzPSVKTG
         Rr2yOMeeIf29uvUDU2V61h62b9jY9XC9+FCKFJWA4D9vJ/2jbPk3bJ1xDuMDorKka6//
         EHTQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6DSyUmmuzTc5aJXdgDPyqFwxQyhQ4t3OE90LISODZefauWgmbcVAlJtGOFypHSlx0VEXse+JAOnE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4LgO3yEj2R8GCpv+Re+3x/trRkzWT/tCXkxIDouK2f/JHpXG7
	UIV3MJw4PT7KaDE15+EgD1GVZxjtizTgVYHp2gVTrcSRIGU23L8y5h9U3I9sasf9D9lGqs8pjKB
	OIoZI7lHGp12/K+5PKMivQc9YfDaf6s6u2Jp76iH2i6VPdZ2o0/PvNRyVeA==
X-Gm-Gg: ASbGncu+KchVJJdUrt4AGjNd/bv2I+DzoKedw6bFwT4ncyXZo9hOldpbG7/m6AGQTR8
	J5923uwt2eashSOak/23WH/IkzHOC8u3NM9zopb7gQ2Uhj2ITfGoTT6U9dmv4RVys4man8NqjTW
	IJxGtKNdf5QlGNNGtXQi+WVztgXDqzfmvIdwjgrl1e
X-Google-Smtp-Source: AGHT+IGyvxOlGCvdz3b5LNvOwpMzxibIPaEygU2dLNGbRfGDBUExPKtE4L0HhdKBF+zED91/lHA/c5rvipQeUXOpuHc=
X-Received: by 2002:a05:6870:80c6:b0:2db:a997:7a62 with SMTP id
 586e51a60fabf-2efb21f4a35mr4784013fac.17.1750945326974; Thu, 26 Jun 2025
 06:42:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250626131059.61894-1-frediano.ziglio@cloud.com>
 <20250626131059.61894-4-frediano.ziglio@cloud.com> <9d64c239-d6cc-4eb5-b180-a5034bedcfdb@suse.com>
In-Reply-To: <9d64c239-d6cc-4eb5-b180-a5034bedcfdb@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 26 Jun 2025 14:41:55 +0100
X-Gm-Features: Ac12FXwBnaNQueTZgk2R1KISJ2R07wjY9BI-dVM7X_R_2r8fOnii4WIIPH-i_6o
Message-ID: <CACHz=ZjUHVGo+qQvwb5cz=q=QE8r=-WAjPYZ2vWGbfZCMsOatA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] xen/efi: Update error flow for read_file function
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 2:31=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 26.06.2025 15:10, Frediano Ziglio wrote:
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -792,6 +792,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_ha=
ndle, CHAR16 *name,
> >
> >      if ( !name )
> >          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> > +
> > +    what =3D L"Open";
> >      if ( dir_handle )
> >          ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
> >                                 EFI_FILE_MODE_READ, 0);
> > @@ -800,54 +802,58 @@ static bool __init read_file(EFI_FILE_HANDLE dir_=
handle, CHAR16 *name,
> >      if ( file =3D=3D &cfg && ret =3D=3D EFI_NOT_FOUND )
> >          return false;
> >      if ( EFI_ERROR(ret) )
> > -        what =3D L"Open";
> > -    else
> > -        ret =3D FileHandle->SetPosition(FileHandle, -1);
> > +        goto fail;
> > +
> > +    what =3D L"Seek";
> > +    ret =3D FileHandle->SetPosition(FileHandle, -1);
> >      if ( EFI_ERROR(ret) )
> > -        what =3D what ?: L"Seek";
> > -    else
> > -        ret =3D FileHandle->GetPosition(FileHandle, &size);
> > +        goto fail;
> > +
> > +    what =3D L"Get size";
> > +    ret =3D FileHandle->GetPosition(FileHandle, &size);
> >      if ( EFI_ERROR(ret) )
> > -        what =3D what ?: L"Get size";
> > -    else
> > -        ret =3D FileHandle->SetPosition(FileHandle, 0);
> > +        goto fail;
> > +
> > +    what =3D L"Seek";
> > +    ret =3D FileHandle->SetPosition(FileHandle, 0);
> >      if ( EFI_ERROR(ret) )
> > -        what =3D what ?: L"Seek";
> > -    else
> > -    {
> > -        file->addr =3D min(1UL << (32 + PAGE_SHIFT),
> > -                         HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> > -        ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderDat=
a,
> > -                                    PFN_UP(size), &file->addr);
> > -    }
> > +        goto fail;
> > +
> > +    what =3D L"Allocation";
> > +    file->addr =3D min(1UL << (32 + PAGE_SHIFT),
> > +                     HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> > +    ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> > +                                PFN_UP(size), &file->addr);
> >      if ( EFI_ERROR(ret) )
> > -        what =3D what ?: L"Allocation";
> > -    else
> > -    {
> > -        file->need_to_free =3D true;
> > -        file->size =3D size;
> > -        handle_file_info(name, file, options);
> > +        goto fail;
> >
> > -        ret =3D FileHandle->Read(FileHandle, &file->size, file->str);
> > -        if ( !EFI_ERROR(ret) && file->size !=3D size )
> > -            ret =3D EFI_ABORTED;
> > -        if ( EFI_ERROR(ret) )
> > -            what =3D L"Read";
> > -    }
> > +    file->need_to_free =3D true;
> > +    file->size =3D size;
> > +    handle_file_info(name, file, options);
> >
> > -    if ( FileHandle )
> > -        FileHandle->Close(FileHandle);
> > +    what =3D L"Read";
> > +    ret =3D FileHandle->Read(FileHandle, &file->size, file->str);
> > +    if ( !EFI_ERROR(ret) && file->size !=3D size )
> > +        ret =3D EFI_ABORTED;
> > +    if ( EFI_ERROR(ret) )
> > +        goto fail;
> >
> > -    if ( what )
> > -    {
> > -        PrintErr(what);
> > -        PrintErr(L" failed for ");
> > -        PrintErrMesg(name, ret);
> > -    }
> > +    FileHandle->Close(FileHandle);
> >
> >      efi_arch_flush_dcache_area(file->ptr, file->size);
> >
> >      return true;
> > +
> > +fail:
>
> Nit: Style (see ./CODING_STYLE).
>

What specifically? I checked the indentation and it's 4 spaces. if-s
are spaced correctly. About labels I didn't find much on CODING_STYLE
so I opened 3/4 files and most of them are indented with no spaces
(they start at column 1).

> Jan

Frediano

