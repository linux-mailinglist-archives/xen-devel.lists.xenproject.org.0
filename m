Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B88B01D4C
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 15:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040917.1412169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaDiD-0001yE-DI; Fri, 11 Jul 2025 13:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040917.1412169; Fri, 11 Jul 2025 13:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaDiD-0001wZ-AT; Fri, 11 Jul 2025 13:22:49 +0000
Received: by outflank-mailman (input) for mailman id 1040917;
 Fri, 11 Jul 2025 13:22:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Da3=ZY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uaDiC-0001wO-DM
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 13:22:48 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 225d0ef6-5e5a-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 15:22:47 +0200 (CEST)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-407aac76036so1109044b6e.1
 for <xen-devel@lists.xenproject.org>; Fri, 11 Jul 2025 06:22:47 -0700 (PDT)
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
X-Inumbo-ID: 225d0ef6-5e5a-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1752240166; x=1752844966; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eepjjHnDZw5oOJ+B1gSBFcOz8WwLSyUe5/mfoCbRnu8=;
        b=c6hOkc0fyDiQ4HuaSwK10/tsOH/8XQ1WBQVf3YGDODuoe7DF1V6SSotzwptqWo2XIT
         XG6murdshU7tce4fSHOpox+s5pcjxAD7d+tZd5yE4kE90wYIsKtIax3tNMr7Qp9w+9/z
         ltLS3CcctiL216ntxP6ntjAc6tdkH/AWNxLJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752240166; x=1752844966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eepjjHnDZw5oOJ+B1gSBFcOz8WwLSyUe5/mfoCbRnu8=;
        b=fJBBbOPLxLcumjJCBESiwVZlMC2SRt/v/pcO2kh2Ox13CyU5wa4bjx2sdRkmtpsFqe
         VZbyJd0Kde/9PHIMxB6WxLA3ErNdzW7oNAAECr8gJgQs5yVefxQXXro+lc4xR5oC0h4H
         PRDaXB8apTgqZ/EXdRbwPmzqGmaAQZX3TDIVu524wPBmR7oYcB2BjMEdbPdrQyEcMc8U
         Ovp8fQSpSt+BIg/F5RwItlLk03dkBC1rY6QeGnhqf742eOqmNw4QOd1+eNk46nitg8t9
         /uuv6MU57MU2EAfLkr0WC1AjgonvrOTTUm1+Jq3z/TayUPlmts0A1nB8rttbq7Wc90cp
         Tsvw==
X-Gm-Message-State: AOJu0YzKvXEso7qvuZxzzjhSdUteFe4JvSEUJKhvbnE4mNv6Q4qVavEP
	Z0URyWek3AYlxDF3CEzkvOOGdNbGzvT+CMns6TPpO6GD7VDY0wELfThyUe0Ur91il8Xa19y/ikh
	LWqvDOha1PRH/k4bzZVL4PZZEiTrvRNXBUwxXmB8bbI279sP6rO+HWtgsJA==
X-Gm-Gg: ASbGncvC8EWFfkrS9hpXwuPjz9yEUvJ5HNlLS/wY2UesEevannkE1VxjKlX9+7oc9mX
	b7h7VJ4RsXsR00p+dcBTGAuqL/j9vJIXpUvNQtTT6Z6XS2lk2xji01Td9Ot45hDTT4DNfckB7X3
	08HRLrgJZXf7A+o21A8p6pPUSKOOR+Rn4AvxczGejA2AfEqY+mpJMTEkJA+9X17SPO1PhQXmB8w
	HCwcg==
X-Google-Smtp-Source: AGHT+IHkEq2bZR9ivIwRiEUbITxXUpn98HZvgZUJxTUWS5sXZ1fMW0sriMwahigzMd/zztPTRbmx/ghzRjJtVg/t48I=
X-Received: by 2002:a05:6808:2e4a:b0:40b:2566:9569 with SMTP id
 5614622812f47-415397ba293mr2013174b6e.24.1752240165828; Fri, 11 Jul 2025
 06:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250628064630.2222323-1-frediano.ziglio@cloud.com>
In-Reply-To: <20250628064630.2222323-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 11 Jul 2025 14:22:34 +0100
X-Gm-Features: Ac12FXwVMgD8rHzfw16lIeR-meALaIPTdjrThrbEIuOx0BPbqo7t-OD5yG6D8Uk
Message-ID: <CACHz=ZjHCabW+OSC3+3Tpbq16DNRC3tH8B5ToutPz-vrcQzvbw@mail.gmail.com>
Subject: Re: [PATCH v5] xen/efi: Update error flow for read_file function
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 7:46=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> Use more explicit goto statements to handle common error code
> path instead of a lot of if/else.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Change since v4:
> - fixed label indentation.
> ---
>  xen/common/efi/boot.c | 80 +++++++++++++++++++++++--------------------
>  1 file changed, 43 insertions(+), 37 deletions(-)
>
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 9306dc8953..1019de6950 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -792,6 +792,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_hand=
le, CHAR16 *name,
>
>      if ( !name )
>          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> +
> +    what =3D L"Open";
>      if ( dir_handle )
>          ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
>                                 EFI_FILE_MODE_READ, 0);
> @@ -800,54 +802,58 @@ static bool __init read_file(EFI_FILE_HANDLE dir_ha=
ndle, CHAR16 *name,
>      if ( file =3D=3D &cfg && ret =3D=3D EFI_NOT_FOUND )
>          return false;
>      if ( EFI_ERROR(ret) )
> -        what =3D L"Open";
> -    else
> -        ret =3D FileHandle->SetPosition(FileHandle, -1);
> +        goto fail;
> +
> +    what =3D L"Seek";
> +    ret =3D FileHandle->SetPosition(FileHandle, -1);
>      if ( EFI_ERROR(ret) )
> -        what =3D what ?: L"Seek";
> -    else
> -        ret =3D FileHandle->GetPosition(FileHandle, &size);
> +        goto fail;
> +
> +    what =3D L"Get size";
> +    ret =3D FileHandle->GetPosition(FileHandle, &size);
>      if ( EFI_ERROR(ret) )
> -        what =3D what ?: L"Get size";
> -    else
> -        ret =3D FileHandle->SetPosition(FileHandle, 0);
> +        goto fail;
> +
> +    what =3D L"Seek";
> +    ret =3D FileHandle->SetPosition(FileHandle, 0);
>      if ( EFI_ERROR(ret) )
> -        what =3D what ?: L"Seek";
> -    else
> -    {
> -        file->addr =3D min(1UL << (32 + PAGE_SHIFT),
> -                         HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> -        ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> -                                    PFN_UP(size), &file->addr);
> -    }
> +        goto fail;
> +
> +    what =3D L"Allocation";
> +    file->addr =3D min(1UL << (32 + PAGE_SHIFT),
> +                     HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> +    ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> +                                PFN_UP(size), &file->addr);
>      if ( EFI_ERROR(ret) )
> -        what =3D what ?: L"Allocation";
> -    else
> -    {
> -        file->need_to_free =3D true;
> -        file->size =3D size;
> -        handle_file_info(name, file, options);
> +        goto fail;
>
> -        ret =3D FileHandle->Read(FileHandle, &file->size, file->str);
> -        if ( !EFI_ERROR(ret) && file->size !=3D size )
> -            ret =3D EFI_ABORTED;
> -        if ( EFI_ERROR(ret) )
> -            what =3D L"Read";
> -    }
> +    file->need_to_free =3D true;
> +    file->size =3D size;
> +    handle_file_info(name, file, options);
>
> -    if ( FileHandle )
> -        FileHandle->Close(FileHandle);
> +    what =3D L"Read";
> +    ret =3D FileHandle->Read(FileHandle, &file->size, file->str);
> +    if ( !EFI_ERROR(ret) && file->size !=3D size )
> +        ret =3D EFI_ABORTED;
> +    if ( EFI_ERROR(ret) )
> +        goto fail;
>
> -    if ( what )
> -    {
> -        PrintErr(what);
> -        PrintErr(L" failed for ");
> -        PrintErrMesg(name, ret);
> -    }
> +    FileHandle->Close(FileHandle);
>
>      efi_arch_flush_dcache_area(file->ptr, file->size);
>
>      return true;
> +
> + fail:
> +    if ( FileHandle )
> +        FileHandle->Close(FileHandle);
> +
> +    PrintErr(what);
> +    PrintErr(L" failed for ");
> +    PrintErrMesg(name, ret);
> +
> +    /* not reached */
> +    return false;
>  }
>
>  static bool __init read_section(const EFI_LOADED_IMAGE *image,

Comments on this?

Frediano

