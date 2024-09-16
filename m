Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D195979CC3
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 10:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799322.1209289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq739-0001zr-C2; Mon, 16 Sep 2024 08:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799322.1209289; Mon, 16 Sep 2024 08:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq739-0001xT-9L; Mon, 16 Sep 2024 08:25:35 +0000
Received: by outflank-mailman (input) for mailman id 799322;
 Mon, 16 Sep 2024 08:25:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wse+=QO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sq737-0001xN-Rf
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 08:25:33 +0000
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [2607:f8b0:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cccb29f-7405-11ef-a0b6-8be0dac302b0;
 Mon, 16 Sep 2024 10:25:32 +0200 (CEST)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-710e1a47b40so590640a34.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 01:25:32 -0700 (PDT)
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
X-Inumbo-ID: 3cccb29f-7405-11ef-a0b6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726475131; x=1727079931; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9jLb8VGXBSI1GWlzesn+RAybMVdMVfgt19pRhqwq/s=;
        b=ZNoGdKjdOHNRZPP93RitAM7QyAO7nq1Vqn0FkMvTHgtnVSaquV17SclGpLOKYXxoLM
         FZ+uo/oDHi0LGFwh6XGGc86qkU4kWVITM8mjv1gMv5+gGv+Unp3wQ0LVvLT/IZYOFJct
         V1lB+bNPLoNTD/lT/85tuueodwX6V5mnEdboU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726475131; x=1727079931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9jLb8VGXBSI1GWlzesn+RAybMVdMVfgt19pRhqwq/s=;
        b=Z+psrES6FKSrgxJMfYR2oZeSr6RqR8G7w6bne4g4vdLPVVecDjPC+LZtmXofbYW15Z
         UiCV3x9G9LJrnpXF66cOGHvzkWX/5nHHZEqLhosVdDGqNS9HTd/zZwGUx3Kw/r1DE0/B
         AYlJx/Mv9tNiRWjPvGx4/xDoE3USdN9hNIx6qm1w5E2KQcysEBzBaUScic69m4bAtnYo
         f4cGsYkr0HThn6brlsR7wnHFxnpHOkCecs9xXo34aHdyossQQxs3OVF0xMkEbZL1tsS1
         4hdw5gKeethTuEdlWuckbdJa9+SQoUv6kSocjDxjn9q/UGIHGs4/DE/Wcp+uiJvHzIkI
         hiaw==
X-Forwarded-Encrypted: i=1; AJvYcCXs5Sa7uNwOn1EzeczEhhsvx6Sygz9DJY6tCzpGGMbTVTEvsw8VFRkIo4tRLicahY9Prgv2CDP+N5U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzw41P24QRJ01tCV/c4LY/h8TbUtPKxnQ6NyRaRnt1/OOhAVeL2
	K8TJh3M3DI2xBCeJXoG5nMKmlhP/pA/QVU8Z67oBOljvR6udfLd5pruB9L+uxgZGnl49GnJfRIm
	qA/eNWJRA+rAGBWGdLeJHSKe1jOHfV8GMQpifDQ==
X-Google-Smtp-Source: AGHT+IHsDQZP6POG0GwIk/254RPWecL8bLfiE9iGu1VRSti/VVaOSMXGBsmmOEiDLTRURGoyXL8dEw0+ltxbTaNKVUI=
X-Received: by 2002:a05:6830:211a:b0:708:f1ad:c4bf with SMTP id
 46e09a7af769-71116c7f974mr6663388a34.27.1726475130921; Mon, 16 Sep 2024
 01:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
 <20240910161612.242702-4-frediano.ziglio@cloud.com> <5cf6fad1-16ce-46b4-9bed-151f936e3772@suse.com>
In-Reply-To: <5cf6fad1-16ce-46b4-9bed-151f936e3772@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 16 Sep 2024 09:25:20 +0100
Message-ID: <CACHz=Zifc9rKvfxh1EmH5VQQ1YtB7L-GUrBrMP734uc6Uhk_mQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/boot: Rewrite EFI start part in C
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 8:00=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.09.2024 18:16, Frediano Ziglio wrote:
> > No need to have it coded in assembly.
>
> As to the title: It's the EFI/MB2 case you re-write. That wants reflectin=
g
> there, as the "normal" EFI start part is all C already anyway. I also
> think you mean "partly"?
>

Updated to "x86/boot: Rewrite EFI/MBI2 code partly in C".

> > @@ -255,34 +246,29 @@ __efi64_mb2_start:
> >          rep stosq
> >          mov     %edx, %eax
>
> This can be dropped then, by making ...
>
> > -        /* Check for Multiboot2 bootloader. */
> > -        cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
> > -        je      .Lefi_multiboot2_proto
> > -
> > -        /* Jump to .Lnot_multiboot after switching CPU to x86_32 mode.=
 */
> > -        lea     .Lnot_multiboot(%rip), %r15
> > -        jmp     x86_32_switch
> > +        /* Save Multiboot2 magic on the stack. */
> > +        push    %rax
>
> ... this use %rdx.
>

Done (also below)

> > -.Lefi_multiboot2_proto:
> > -        /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline=
. */
> > -        xor     %esi,%esi
> > -        xor     %edi,%edi
> > -        xor     %edx,%edx
> > +        /* Save Multiboot2 pointer on the stack. */
> > +        push    %rbx
>
> %rbx doesn't need preserving around a C function call (which will do
> so itself if necessary). I understand a 2nd PUSH may be necessary
> anyway, to keep the stack aligned, yet that then would need
> commenting differently. Plus as long as we call our own functions
> only, we don't require such alignment.
>

Extended comment.
16-byte alignment is also in SystemV ABI, I won't remove it in this series.


> > -        /* Skip Multiboot2 information fixed part. */
> > -        lea     (MB2_fixed_sizeof+MULTIBOOT2_TAG_ALIGN-1)(%rbx),%ecx
> > -        and     $~(MULTIBOOT2_TAG_ALIGN-1),%ecx
> > +        /*
> > +         * efi_parse_mbi2() is called according to System V AMD64 ABI:
> > +         *   - IN:  %edi - Multiboot2 magic, %rsi - Multiboot2 pointer=
.
> > +         *   - OUT: %eax - error string.
>
> Nit: %rax according to the code below.
>

Done

> > +         */
> > +        mov     %eax, %edi
> > +        mov     %ebx, %esi
>
> This latter one would better be a 64-bit MOV, for it being a pointer?
>

Done

> > +        call    efi_parse_mbi2
> > +        test    %rax, %rax
> > +        lea     .Ldirect_error(%rip), %r15
> > +        jnz     x86_32_switch
>
> As requested by Andrew in a related context: LEA first please to follow
> the pattern allowing macro fusion, even if here it is less because of
> performance concerns but more to avoid giving a bad example.
>

Done

> > --- a/xen/arch/x86/efi/Makefile
> > +++ b/xen/arch/x86/efi/Makefile
> > @@ -13,6 +13,7 @@ $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_bounda=
ry :=3D $(cflags-stack-bounda
> >
> >  obj-y :=3D common-stub.o stub.o
> >  obj-$(XEN_BUILD_EFI) :=3D $(filter-out %.init.o,$(EFIOBJ-y))
> > +obj-y +=3D parse-mbi2.o
>
> obj-bin-y I suppose, for it all being __init / __initdata, and hence the
> string literals in particular also wanting to move to .init.rodata.
>

Okay

> > --- /dev/null
> > +++ b/xen/arch/x86/efi/parse-mbi2.c
> > @@ -0,0 +1,54 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#include <xen/efi.h>
> > +#include <xen/init.h>
> > +#include <xen/multiboot2.h>
> > +#include <asm/asm_defns.h>
> > +#include <asm/efibind.h>
> > +#include <efi/efidef.h>
> > +#include <efi/eficapsule.h>
> > +#include <efi/eficon.h>
> > +#include <efi/efidevp.h>
> > +#include <efi/efiapi.h>
>
> I don't think all of these are needed? Please limit #include-s to just
> what is actually used.
>

I had the same idea, but if you comment out any of them code stop compiling=
.

> > +void asmlinkage __init efi_multiboot2(EFI_HANDLE ImageHandle,
> > +                                      EFI_SYSTEM_TABLE *SystemTable,
> > +                                      const char *cmdline);
>
> This i now solely called from C code and hence shouldn't be asmlinkage.
>

Done

> > +const char *__init efi_parse_mbi2(uint32_t magic, const multiboot2_fix=
ed_t *mbi)
>
> Whereas this, called from assembly code and not having / needing a
> declaration, should be.
>

Done

> > +{
> > +    const multiboot2_tag_t *tag;
> > +    EFI_HANDLE ImageHandle =3D NULL;
> > +    EFI_SYSTEM_TABLE *SystemTable =3D NULL;
> > +    const char *cmdline =3D NULL;
> > +    bool have_bs =3D false;
> > +
> > +    if ( magic !=3D MULTIBOOT2_BOOTLOADER_MAGIC )
> > +        return "ERR: Not a Multiboot bootloader!";
>
> Assembly code merely re-used a message. Now that it separate, please make
> it say "Multiboot2".
>

Done

> > +    /* Skip Multiboot2 information fixed part. */
> > +    for ( tag =3D _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_=
ALIGN));
>
> The comment is placed as if it applied to the entire loop. It wants to mo=
ve
> inside the for() to make clear it only applies to the loop setup.
>

Separated in a different line.

> > +          (void *)tag - (void *)mbi < mbi->total_size && tag->type !=
=3D MULTIBOOT2_TAG_TYPE_END;
> > +          tag =3D _p(ROUNDUP((unsigned long)((void *)tag + tag->size),=
 MULTIBOOT2_TAG_ALIGN)) )
>
> Now that this is done in C, I think the checking wants to be more
> thorough, to no only make sure the start of a sub-struct is within
> the specified size, but all of it (se we won't even access past
> ->total_size).
>

I would first just translate the assembly code, then add improvements
in a separate commit.

> Further looks like there's a line length issue here.
>

Fixed

> Also please don't cast away const-ness from pointers.
>

Done

> > +    {
> > +        if ( tag->type =3D=3D MULTIBOOT2_TAG_TYPE_EFI_BS )
> > +            have_bs =3D true;
> > +        else if ( tag->type =3D=3D MULTIBOOT2_TAG_TYPE_EFI64 )
> > +            SystemTable =3D _p(((const multiboot2_tag_efi64_t *)tag)->=
pointer);
> > +        else if ( tag->type =3D=3D MULTIBOOT2_TAG_TYPE_EFI64_IH )
> > +            ImageHandle =3D _p(((const multiboot2_tag_efi64_ih_t *)tag=
)->pointer);
> > +        else if ( tag->type =3D=3D MULTIBOOT2_TAG_TYPE_CMDLINE )
> > +            cmdline =3D ((const multiboot2_tag_string_t *)tag)->string=
;
> > +    }
> > +
> > +    if ( !have_bs )
> > +        return "ERR: Bootloader shutdown EFI x64 boot services!";
> > +    if ( !SystemTable )
> > +        return "ERR: EFI SystemTable is not provided by bootloader!";
> > +    if ( !ImageHandle )
> > +        return "ERR: EFI ImageHandle is not provided by bootloader!";
> > +
> > +    efi_multiboot2(ImageHandle, SystemTable, cmdline);
>
> This being invoked from here now makes me wonder about the (new)
> function's name and whether a separate new function is actually
> needed: Can't the new code then be integrated right into
> efi_multiboot2(), thus eliminating the question on the naming of
> the function?
>

If you are suggesting putting this parsing code inside efi_multiboot2
in ef-boot.h that would change the behavior, which I would do in a
different commit.
Currently, there are 2 different efi_multiboot2 functions, one if
ms_abi is supported, the other an empty stubs. However, some checks
and tests are done in both cases (ms_abi supported or not). Also, both
paths uses SystemTable, so I need to parse MBI2 in any case.

> > --- a/xen/arch/x86/efi/stub.c
> > +++ b/xen/arch/x86/efi/stub.c
> > @@ -17,7 +17,8 @@
> >   */
> >
> >  void __init noreturn efi_multiboot2(EFI_HANDLE ImageHandle,
> > -                                    EFI_SYSTEM_TABLE *SystemTable)
> > +                                    EFI_SYSTEM_TABLE *SystemTable,
> > +                                    const char *cmdline)
> >  {
> >      static const CHAR16 __initconst err[] =3D
> >          L"Xen does not have EFI code build in!\r\nSystem halted!\r\n";
>
> This, if not a separate change, wants mentioning in the description.
> It's a related observation that this wasn't properly updated, but
> nothing that necessarily needs doing here. Question is whether the
> declaration of the function wouldn't better go into a header now in
> the first place.
>

I had the same though about a header. But currently there's no such
header, I mean it should be able to be included by both stub.c and
efi-boot.h which are both x86 only code so it should go in
xen/arch/x86/ I suppose. Suggestions? Maybe a different solution would
be to have a xen/arch/x86/efi/efi-boot-stub.h instead of
xen/arch/x86/efi/stub.c ?

> Jan

Frediano

