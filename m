Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7F689EF5A
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 12:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702981.1098721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruUl3-0005AG-5o; Wed, 10 Apr 2024 10:00:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702981.1098721; Wed, 10 Apr 2024 10:00:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruUl3-00058j-2a; Wed, 10 Apr 2024 10:00:45 +0000
Received: by outflank-mailman (input) for mailman id 702981;
 Wed, 10 Apr 2024 10:00:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NLmP=LP=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1ruUl1-00058b-RD
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 10:00:43 +0000
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [2607:f8b0:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 308f1489-f721-11ee-b907-491648fe20b8;
 Wed, 10 Apr 2024 12:00:42 +0200 (CEST)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5e8470c1cb7so4659432a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 03:00:42 -0700 (PDT)
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
X-Inumbo-ID: 308f1489-f721-11ee-b907-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712743241; x=1713348041; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbuadahcPcDtpwyiNfAM/yEGZFyh07JAmz36+DTl11Y=;
        b=Q/5nwuazx3JuSpE2DsggEbq23SrZWNsrIxO3CdCHdpYXG52QasApft41MfFAtyxt4M
         O7edb1U67Gnu5nIUDm5L88TnutFIGtzJwcIcw7iq4dqrUxycQCU/04Nbg8TNO0khYYK8
         iRM7C2kWPGygSvmENuY8XDc1sueae7Qpo1VLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712743241; x=1713348041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbuadahcPcDtpwyiNfAM/yEGZFyh07JAmz36+DTl11Y=;
        b=uW9hAYwnZlYyHvg1WCSAqju6xD+bH7ZKHvPoQ8JyFhkKnUBkL1rUR3m6kR4fCfo9Jy
         U1CIG/QTbkp+aKh+NMQ/nnwO2l/AKu9CT+6ZZICXtBgFJIXfOlczQ6OVVJW1gJuryCJb
         c3w1AIArFsmYX7iqwGM1ZYeOS9bSem4gMgDXSsgy9JxDY62m3qj2ye5v0s9etnnZIS75
         PuukYNtTLii29g7Oce+fB5GGd1q4TVK20hvF8Lo6tLD97t/kylyfWCpM4Qj4ICPdS4nS
         KIS5v74m+7IwS9b685zC68S2JYxvow6d/Aynk8kxwZo0dVofr6M0XBrmqQchkn7hUUg8
         qpAg==
X-Forwarded-Encrypted: i=1; AJvYcCUtZXftzSP+j1aCiENOox6WnvAx3ZMQtuprG/KGR1SHmwKUjmKIVoY+qhs63ip3aE/j/Jw8QltpBF/bkOZkvdoYzuAxmj2hzA8HslG6mrA=
X-Gm-Message-State: AOJu0YzzReC8rNfq9S7GxeGe9Jgkm62gF/TQfqzUJeW5AT7eO2HPsltg
	Uc4g1TjzLS935ViK9rZ4C33ufqy2GUNKPjM4c1WRZSNuXfxXTaML315z9QJY72OGgHt7iNAxiBN
	y8DSRvt8BPP6ioNAjHfhoABbpk+DPvSJ8xO7QueAjYbDAQn47Lw==
X-Google-Smtp-Source: AGHT+IEdeNP9Hekzv1F3oINVGRGMIC760MljW4+JO4o5q1BVCrrwxA3CIF7kll7he4u1XPrnkRDCwqsR2OZsAOoVgiw=
X-Received: by 2002:a17:90a:6046:b0:2a2:c2c4:9d28 with SMTP id
 h6-20020a17090a604600b002a2c2c49d28mr1991612pjm.8.1712743240862; Wed, 10 Apr
 2024 03:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240328151106.1451104-1-ross.lagerwall@citrix.com>
 <20240328151106.1451104-3-ross.lagerwall@citrix.com> <d15e9313-c5d9-442f-9e47-caa504df9977@suse.com>
In-Reply-To: <d15e9313-c5d9-442f-9e47-caa504df9977@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Wed, 10 Apr 2024 11:00:29 +0100
Message-ID: <CAG7k0Ep+Ar9eJQK=nfkc7ADWUG5JzdT4pZis=CPXhatxTb33Fw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] x86: Call Shim Verify in the multiboot2 path
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 11:42=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 28.03.2024 16:11, Ross Lagerwall wrote:
> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -3,6 +3,7 @@
> >   * is intended to be included by common/efi/boot.c _only_, and
> >   * therefore can define arch specific global variables.
> >   */
> > +#include <xen/multiboot2.h>
> >  #include <xen/vga.h>
> >  #include <asm/e820.h>
> >  #include <asm/edd.h>
> > @@ -808,9 +809,69 @@ static const char *__init get_option(const char *c=
md, const char *opt)
> >      return o;
> >  }
> >
> > +#define ALIGN_UP(arg, align) \
> > +                (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))
>
> Nit: I don't think aligning the opening parentheses is an appropriate
> criteria here. Imo either
>
> #define ALIGN_UP(arg, align) \
>             (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))
>
> or
>
> #define ALIGN_UP(arg, align) \
>         (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))
>
> or
>
> #define ALIGN_UP(arg, align) \
>     (((arg) + (align) - 1) & ~((typeof(arg))(align) - 1))
>
> .

OK, will fix.

>
> > +static void __init efi_verify_dom0(uint64_t mbi_in)
> > +{
> > +    uint64_t ptr;
> > +    const multiboot2_tag_t *tag;
> > +    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
> > +    EFI_STATUS status;
> > +    const multiboot2_tag_module_t *kernel =3D NULL;
> > +    const multiboot2_fixed_t *mbi_fix =3D _p(mbi_in);
> > +    static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_G=
UID;
> > +    static EFI_GUID __initdata global_variable_guid =3D EFI_GLOBAL_VAR=
IABLE;
> > +
> > +    ptr =3D ALIGN_UP(mbi_in + sizeof(*mbi_fix), MULTIBOOT2_TAG_ALIGN);
> > +
> > +    for ( tag =3D _p(ptr); (uint64_t)tag - mbi_in < mbi_fix->total_siz=
e;
> > +          tag =3D _p(ALIGN_UP((uint64_t)tag + tag->size, MULTIBOOT2_TA=
G_ALIGN)) )
> > +    {
> > +        if ( tag->type =3D=3D MULTIBOOT2_TAG_TYPE_MODULE )
> > +        {
> > +            kernel =3D (const multiboot2_tag_module_t *)tag;
> > +            break;
>
> This could do with a comment along the lines of what __start_xen() has
> ("Dom0 kernel is always first").

Will add.

>
> > +        }
> > +        else if ( tag->type =3D=3D MULTIBOOT2_TAG_TYPE_END )
>
> Not need for "else" here (personally I find such irritating).

OK, I'll remove it.

>
> > +            break;
> > +    }
> > +
> > +    if ( !kernel )
> > +        return;
> > +
> > +    if ( (status =3D efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> > +                                          (void **)&shim_lock)) !=3D E=
FI_SUCCESS )
> > +    {
> > +        UINT32 attr;
> > +        UINT8 data;
> > +        UINTN size =3D sizeof(data);
> > +
> > +        status =3D efi_rs->GetVariable((CHAR16 *)L"SecureBoot", &globa=
l_variable_guid,
> > +                                     &attr, &size, &data);
> > +        if ( status =3D=3D EFI_NOT_FOUND )
> > +            return;
> > +
> > +        if ( EFI_ERROR(status) )
> > +            PrintErrMesg(L"Could not get SecureBoot variable", status)=
;
> > +
> > +        if ( attr !=3D (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE=
_RUNTIME_ACCESS) )
> > +            PrintErrMesg(L"Unexpected SecureBoot attributes", attr);
>
> This wants to be blexit(), not PrintErrMesg().

blexit() doesn't allow printing the attributes but I can call some
other function like DisplayUint() to do that before calling blexit().

>
> > +        if ( size =3D=3D 1 && data =3D=3D 0 )
> > +            return;
> > +
> > +        blexit(L"Could not locate shim but Secure Boot is enabled");
> > +    }
> > +
> > +    if ( (status =3D shim_lock->Verify(_p(kernel->mod_start),
> > +                                     kernel->mod_end - kernel->mod_sta=
rt)) !=3D EFI_SUCCESS )
> > +        PrintErrMesg(L"Dom0 kernel image could not be verified", statu=
s);
> > +}
>
> Overall this is a superset of what efi_start() does. What I'm missing fro=
m
> the description is some discussion of why what's done there is not
> sufficient (beyond the env var check, which iirc there once was a patch t=
o
> add it). One could only then judge whether it wouldn't make sense to make
> this function uniformly used by both paths (with mbi_in suitably dealt wi=
th
> for the other case).
>

Hmm, I wasn't really looking at efi_start() verification for the
purpose of this patch series. I can update the patch so that
both paths use a common verification function and also describe
how it differs from the simple call to shim verify that currently
exists in efi_start().

Thanks,
Ross

