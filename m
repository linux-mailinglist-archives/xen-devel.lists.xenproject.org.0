Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5238AEA06A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jun 2025 16:25:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1026511.1401694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnWm-0006KU-VD; Thu, 26 Jun 2025 14:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1026511.1401694; Thu, 26 Jun 2025 14:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUnWm-0006IV-SW; Thu, 26 Jun 2025 14:24:36 +0000
Received: by outflank-mailman (input) for mailman id 1026511;
 Thu, 26 Jun 2025 14:24:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kW9B=ZJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uUnWl-0006IP-W3
 for xen-devel@lists.xenproject.org; Thu, 26 Jun 2025 14:24:36 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45b9422d-5299-11f0-b894-0df219b8e170;
 Thu, 26 Jun 2025 16:24:30 +0200 (CEST)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-60d63174f05so251243eaf.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jun 2025 07:24:30 -0700 (PDT)
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
X-Inumbo-ID: 45b9422d-5299-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750947869; x=1751552669; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQH72RUtOOhXFPvQiawnRTqKjOYJTKUJ1G1pl4DuuII=;
        b=Rb72afwIxtxqaNIs4JrZlX66mXYgNQXAUXAsfIdZNu6Bxyg32sOy93MtZpN3woHAeh
         bamBwS+i/hm9XDBf6MDlZWYstAMR+zg+Zh6NViPIkui23Lb55WJp2fX7+Rr2UvyiZmyX
         3GbJna/0ALcoWUxlQepE5p4k4rO6uIxHPji/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947869; x=1751552669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQH72RUtOOhXFPvQiawnRTqKjOYJTKUJ1G1pl4DuuII=;
        b=DT3lK9+gbTLeFFUy2HLvbaRZ1xGQKhLeO7DR5GUpCIwftRUKL0d1jC6LbScn91QYzp
         hb75LVw4kBpF0l6jjuH1gNhqnwtkMkTVR9i1zBqMxoLF0r4k2G+Nu7gVkEbKMvoLKxTg
         tIB0g+KQUdlMohoWugkg2ap0sDbK+ZCfhg02JbWNr+z6jACJG8TsB1NVi7ucvpmkt/1x
         hevxTbuZyhV9RslU6vujEQF4+k8fqXw8fQzwQNzPCngOzx9qL6dP80q2iNwoUm6yIdvq
         nnhStaEtATmM/DENrWyUYQm7i6UZ4QOizrnsInURCrdydNTy/kgghdogC9PjOFGxUW7G
         ZtHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9QLWOGP6Gl0nF9/Kgzj0gq5X6B3aBckTH5y+5HZ22F2paX56S4/YaZ6+0yzLNKtgzinOjvbARbOk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfnWtFJXMff4GdBpAiNrkElw2vO+yCIHOt7kyyzGisERD6+D2L
	MH6/+b3Al9cuTqHqEo0rfi0lcjKR0HA3xT+OgNXTjdVSFO/Ep9nT8oyt2XB5YhOCataPhgUI0OB
	aCPyYWGvojXRTIOHPuze+ApS7q01DkdrC+omzapLAmw==
X-Gm-Gg: ASbGncvgrg+MiSO8PwMTuQGZuKEGbzAWkvrRpn6l3gRn2JE73ufVtXDXclZAyzAoWYO
	Ng/3LPm3GPlL8DbFnoqAhCjh9Jbe+c4v7FJqLk8fLutuoZchLQmb8akFDTfIitr5FpcMsN4HXMI
	kO9wlkQyEnQV6noAkiyq6QhrSaPKLecPRcQrX/6JNI
X-Google-Smtp-Source: AGHT+IHPZBxGUyJeGShC9o2zvi7OikHtAIO2kA7RlChNOvlssMZ/uI2boKa0jSltydFTuRFhHpjwYEtqU7ensS314rU=
X-Received: by 2002:a05:6871:6186:b0:2ea:70ad:4517 with SMTP id
 586e51a60fabf-2efb26d256cmr4843673fac.15.1750947869383; Thu, 26 Jun 2025
 07:24:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250625073408.7496-1-frediano.ziglio@cloud.com>
 <20250625073408.7496-3-frediano.ziglio@cloud.com> <df050f76-d82b-479a-8ba2-97eea02b74ee@suse.com>
In-Reply-To: <df050f76-d82b-479a-8ba2-97eea02b74ee@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 26 Jun 2025 15:24:17 +0100
X-Gm-Features: Ac12FXw7akKnmee6VdAe-D1aln_rIFIj6MnU4h0Q5RoQd80HYnxd8EXE08bIr44
Message-ID: <CACHz=ZgoB5vg=nFcr6Q+fy-N7CfAetahhfiZ-8cFM-jgr9YtJA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] xen/efi: Support loading initrd using GRUB2
 LoadFile2 protocol
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 2:29=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 25.06.2025 09:34, Frediano Ziglio wrote:
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -850,6 +850,74 @@ static bool __init read_file(EFI_FILE_HANDLE dir_h=
andle, CHAR16 *name,
> >      return true;
> >  }
> >
> > +#pragma pack(1)
> > +typedef struct {
> > +    VENDOR_DEVICE_PATH              VenMediaNode;
> > +    EFI_DEVICE_PATH                 EndNode;
> > +} SINGLE_NODE_VENDOR_MEDIA_DEVPATH;
> > +#pragma pack()
>
> Where is this coming from? And why is this declared locally here, but the=
 ...
>

The declaration comes from e2dk code and it's similar to code in Linux.
It's not a generic declaration so it's not in a header.

> > +static bool __init initrd_load_file2(const CHAR16 *name, struct file *=
file)
> > +{
> > +    static const SINGLE_NODE_VENDOR_MEDIA_DEVPATH __initconst initrd_d=
ev_path =3D {
> > +        {
> > +            {
> > +                MEDIA_DEVICE_PATH, MEDIA_VENDOR_DP, { sizeof (VENDOR_D=
EVICE_PATH) }
> > +            },
> > +            LINUX_EFI_INITRD_MEDIA_GUID
> > +        },
> > +        {
> > +            END_DEVICE_PATH_TYPE, END_ENTIRE_DEVICE_PATH_SUBTYPE,
> > +            { sizeof (EFI_DEVICE_PATH) }
> > +        }
> > +    };
> > +    static EFI_GUID __initdata lf2_proto_guid =3D EFI_LOAD_FILE2_PROTO=
COL_GUID;
>
> ... corresponding GUID is put in a (random?) header file?
>

The GUID is declared in the header for device paths, being a GUID for
a device path.

> > +    EFI_DEVICE_PATH *dp;
> > +    EFI_LOAD_FILE2_PROTOCOL *lf2;
> > +    EFI_HANDLE handle;
> > +    EFI_STATUS ret;
> > +    UINTN size;
> > +
> > +    dp =3D (EFI_DEVICE_PATH *)&initrd_dev_path;
>
> Instead of a (fragile) cast, why not
>
>     dp =3D &initrd_dev_path->VenMediaNode.Header;
>

It makes sense, although at the end it's just style. Code came from
Linux in this case.

> ? And then perhaps also as initializer of the variable?
>
> > +    ret =3D efi_bs->LocateDevicePath(&lf2_proto_guid, &dp, &handle);
> > +    if ( EFI_ERROR(ret) )
> > +    {
> > +        if ( ret =3D=3D EFI_NOT_FOUND)
> > +            return false;
> > +        PrintErrMesg(L"Error getting file with LoadFile2 interface", r=
et);
> > +    }
> > +
> > +    ret =3D efi_bs->HandleProtocol(handle, &lf2_proto_guid, (void **)&=
lf2);
> > +    if ( EFI_ERROR(ret) )
> > +        PrintErrMesg(L"LoadFile2 file does not provide correct protoco=
l", ret);
> > +
> > +    size =3D 0;
> > +    ret =3D lf2->LoadFile(lf2, dp, false, &size, NULL);
> > +    if ( ret !=3D EFI_BUFFER_TOO_SMALL )
> > +        PrintErrMesg(L"Loading failed", ret);
>
> Here it's particularly bad, but throughout: How would one know in what
> context the failure was? Wouldn't you want to include "name" in the
> output? read_file() does include this detail.
>

It makes sense

> > +    file->addr =3D min(1UL << (32 + PAGE_SHIFT),
> > +                     HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
>
> I understand you took this from read_file(), but the construct looks
> outdated. For one, it should have been abstracted away when the Arm64
> work was done (I don't think such a restriction exists there), and
> then I'm also not sure the restriction would unconditionally apply on
> x86 anymore.
>

Do you have an updated/correct formula?

> > +    ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> > +                                PFN_UP(size), &file->addr);
> > +    if ( EFI_ERROR(ret) )
> > +        PrintErrMesg(L"Allocation failed", ret);
> > +
> > +    file->need_to_free =3D true;
> > +    file->size =3D size;
> > +
> > +    ret =3D lf2->LoadFile(lf2, dp, false, &size, file->str);
> > +    if ( EFI_ERROR(ret) )
> > +    {
> > +        efi_bs->FreePages(file->addr, PFN_UP(size));
> > +        PrintErrMesg(L"Loading failed", ret);
> > +    }
> > +
> > +    efi_arch_handle_module(file, name, NULL);
>
> Shouldn't it be handle_file_info() that you call, and a little earlier?
>

Already changed in the last series.
Earlier where? You want it after loading data, right ?

> > --- a/xen/include/efi/efidevp.h
> > +++ b/xen/include/efi/efidevp.h
> > @@ -398,5 +398,26 @@ typedef union {
> >
> >  } EFI_DEV_PATH_PTR;
> >
> > +#define EFI_LOAD_FILE2_PROTOCOL_GUID \
> > +    { 0x4006c0c1, 0xfcb3, 0x403e, {0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24,=
 0xe0, 0x6d } }
> > +
> > +typedef struct EFI_LOAD_FILE2_PROTOCOL EFI_LOAD_FILE2_PROTOCOL;
> > +
> > +typedef
> > +EFI_STATUS
> > +(EFIAPI *EFI_LOAD_FILE2)(
> > +    IN EFI_LOAD_FILE2_PROTOCOL      *This,
> > +    IN EFI_DEVICE_PATH              *FilePath,
> > +    IN BOOLEAN                      BootPolicy,
> > +    IN OUT UINTN                    *BufferSize,
> > +    IN VOID                         *Buffer OPTIONAL
> > +    );
> > +
> > +struct EFI_LOAD_FILE2_PROTOCOL {
> > +    EFI_LOAD_FILE2                  LoadFile;
> > +};
> > +
> > +#define LINUX_EFI_INITRD_MEDIA_GUID \
> > +    { 0x5568e427, 0x68fc, 0x4f3d, {0xac, 0x74, 0xca, 0x55, 0x52, 0x31,=
 0xcc, 0x68} }
> >
> >  #endif
>
> While I'm not maintainer of this code anymore, I hope the new maintainers=
 will
> still respect the original idea of keeping these headers in sync with the=
ir
> origin. The way it's arranged, this change doesn't look like it would hav=
e been
> taken from the gnu-efi package (albeit I will admit I didn't go check).
>

I'll have a look at gnu-efi headers.
Note that the media GUID is GRUB/Linux specific so probably won't be in gnu=
-efi.

> Jan

Frediano

