Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6AB927BDA
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 19:21:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753936.1162212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPQ95-0007MM-8W; Thu, 04 Jul 2024 17:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753936.1162212; Thu, 04 Jul 2024 17:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPQ95-0007KY-5N; Thu, 04 Jul 2024 17:21:23 +0000
Received: by outflank-mailman (input) for mailman id 753936;
 Thu, 04 Jul 2024 17:21:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hg2H=OE=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1sPQ93-0007KS-Lr
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 17:21:21 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d38ed38e-3a29-11ef-bbfa-fd08da9f4363;
 Thu, 04 Jul 2024 19:21:19 +0200 (CEST)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6b5f4c7f4fbso78416d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jul 2024 10:21:19 -0700 (PDT)
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
X-Inumbo-ID: d38ed38e-3a29-11ef-bbfa-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113678; x=1720718478; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8pyi3ezNHQWYrhC7E4E4FpI/uJSM0aiUKnTLLo0iH8=;
        b=PAveZB2Ae/WvPdPcVD4Olh1d1jO6z7TJjvv8PteAb6cbExhrnCIgjPMZp525lDM+Gf
         GlfEjzHFfKtQH3hyGvoYJ9b3KP0CeMoxnsBVMNBXYQVtf2uJMAsq4mpNd/jfKjO+GRai
         emOWK+SqdNMVqYr0SiaEwcxzVoMP0f930kS54pYgtjK0LgQL80ysxyXjq5MGTdSyaGiz
         bsnVzZV7VrqEODFdPMKOpjPp5w4JZOy+vQYW2nUZAabCnRgcTcpnlRve6O2IN8qhLWvV
         +IgO9FCnj++zKa3fDloyVgBp6epbEMK1FXHWmeP1UBxE7DdjnR778rj8Ww6ycUO8yxTT
         p4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113678; x=1720718478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8pyi3ezNHQWYrhC7E4E4FpI/uJSM0aiUKnTLLo0iH8=;
        b=TbuAsLno/Uad8UsHhgZO5j8fRR5El/089BKK+pGFNy+T01lKhnaVoJZz6ynTAlD18q
         xhfeLpXKVyuMbO9/NFcncJIqEvKXhQ7zpzg5mHkhEfDyDJDZ+iAtEl/8rw4yhjKE/anj
         2gEPcVKLIR/vp1AzbyMK4aw0HG5g+AubzGk6vdbuDQQF8OnXgBxLTSDRLVySfAQYfLKC
         kQNRmfQc2Q07vb0uMdFuNH4iboRW8ht0iuZMzdVIS1NvoEm/kXDLJK9Nv+w5q9knH9jO
         LWHKqQQOrMVlx7ceTQj7pQHS/ec1CE8TyZvWNiebyTbWYOkFY18AkMlASBIKrWyXRipj
         b8eg==
X-Forwarded-Encrypted: i=1; AJvYcCUQL7RNdLZ7Zwswu6P2XeO2nxsYvaLjw2OtdK5TDQ9nvgUcNB3fUHMlXavPfu9SjX6IbdwIkqMhT2WQr51Ms08EtAqaSnT8kPKnVVt/A7A=
X-Gm-Message-State: AOJu0Yy2MFHGPTuuR0HZ2vRYGsX2rlfQLFpKCndYHEsGig+UQuaD4rQJ
	mPqMplSSlOlzfs9YM9CZisd4sSMF+8QUf8gNhE6lS8Cqaplhzm2fLWl/aew6+Vxq7L6qy4uy0w8
	oKulRjqSJVyVKonwYIQ+XuVL0EHk=
X-Google-Smtp-Source: AGHT+IGJ6oa3qKe97qOBZw4PMaXx4A+CFY+EH3hXI7PN5AFCgs4iKCyJKtCJs6GEXYDlTcGhlYd89DFb8wiDcvh55d0=
X-Received: by 2002:a05:6214:319d:b0:6b5:148:736a with SMTP id
 6a1803df08f44-6b5ed1c1c27mr24134146d6.57.1720113678093; Thu, 04 Jul 2024
 10:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <2bbb65fcda57f2609f0967f9050a91415059026c.1719942341.git.milan.djokic@rt-rk.com>
 <21a1bbe9308b72eac6d218235f5211c7a1c90454.1719964980.git.milan.djokic@rt-rk.com>
 <0481c78f-ccad-4c65-b104-6b787b79f1d8@suse.com>
In-Reply-To: <0481c78f-ccad-4c65-b104-6b787b79f1d8@suse.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Thu, 4 Jul 2024 19:21:07 +0200
Message-ID: <CAKp59VHkEpKMNpA18xjHp4n_XxA4Fbo121v5ApoTseyhirkM+g@mail.gmail.com>
Subject: Re: [PATCH v4] xen/riscv: PE/COFF image header for RISC-V target
To: Jan Beulich <jbeulich@suse.com>
Cc: milan.djokic@rt-rk.com, Alistair Francis <alistair.francis@wdc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
	Nikola Jelic <nikola.jelic@rt-rk.com>, xen-devel@lists.xenproject.org, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 5:55=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 03.07.2024 02:04, Milan Djokic wrote:
> > Added riscv image header to enable boot from second stage bootloaders (=
e.g. uboot. Image header defined in riscv-image-header.h)
> > Additionally, RISC-V xen image is extended with PE/COFF headers, introd=
ucing EFI application format.
> > PE/COFF header is optionally included (with CONFIG_RISCV_EFI) so
> > both plain ELF and image with PE/COFF header can now be generated as bu=
ild artifacts.
> > Note that this patch represents initial EFI application format support =
(image
> > contains EFI application header embeded into binary when CONFIG_RISCV_E=
FI
> > is enabled). For full EFI application Xen support, boot/runtime service=
s
> > and system table handling are yet to be implemented.
>
> So, first: Please Cc all applicable maintainers. It would probably be pru=
dent
> to also Cc Oleksii, who's doing most of the RISC-V work now (but Oleksii,
> please correct me if you don't want to be Cc-ed).
>
Sure, we'll make sure to keep Oleksii in CC

> With Oleksii in the audience, second: I tink I've seen that in binutils w=
ork
> is being done to actually allow to create EFI applications "properly" for
> RISC-V. Was it firmly determined that you/we do not want to go that route=
?
>
We'll wait for Oleksii opinion on this one. I assume that there's no
reason to send updated versions
of our patch until it's cleared out if this feature is needed upstream.

> > --- a/xen/arch/riscv/Kconfig
> > +++ b/xen/arch/riscv/Kconfig
> > @@ -9,6 +9,16 @@ config ARCH_DEFCONFIG
> >       string
> >       default "arch/riscv/configs/tiny64_defconfig"
> >
> > +config RISCV_EFI
> > +     bool "UEFI boot service support"
> > +     depends on RISCV_64 && RISCV_ISA_C
> > +     help
> > +       This option provides support for boot services through
> > +       UEFI firmware. A UEFI stub is provided to allow Xen to
> > +       be booted as an EFI application. Currently, only EFI PE/COFF ap=
plication
> > +       header is included into RISC-V image. Boot/Runtime services as =
part
> > +       of EFI application stub are yet to be implemented.
>
> The first sentence in particular worries me. What it says is basically al=
l
> taken back by what follows. I think this help text wants reducing to a
> minimum, andthen wants replacing once proper EFI support is in place.
>
I agree, we'll rephrase this description to only short description of
what's included so far

> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/riscv-image-header.h
> > @@ -0,0 +1,57 @@
> > +#ifndef _ASM_RISCV_IMAGE_H
> > +#define _ASM_RISCV_IMAGE_H
> > +
> > +#define RISCV_IMAGE_MAGIC  "RISCV\0\0\0"
> > +#define RISCV_IMAGE_MAGIC2 "RSC\x05"
> > +
> > +#define RISCV_IMAGE_FLAG_BE_SHIFT 0
> > +
> > +#define RISCV_IMAGE_FLAG_LE 0
> > +#define RISCV_IMAGE_FLAG_BE 1
> > +
> > +#define __HEAD_FLAG_BE RISCV_IMAGE_FLAG_LE
> > +
> > +#define __HEAD_FLAG(field)                                            =
         \
> > +    (__HEAD_FLAG_##field << RISCV_IMAGE_FLAG_##field##_SHIFT)
>
> Nit: Generally we treat ## as a binary operator, too. Which means it also
> wants to be surrounded by blanks.
>
> > +#define __HEAD_FLAGS (__HEAD_FLAG(BE))
>
> Nit: The outer pair of parentheses isn't needed here, is it?
>
> > +#define RISCV_HEADER_VERSION_MAJOR 0
> > +#define RISCV_HEADER_VERSION_MINOR 2
> > +
> > +#define RISCV_HEADER_VERSION                                          =
         \
> > +    (RISCV_HEADER_VERSION_MAJOR << 16 | RISCV_HEADER_VERSION_MINOR)
>
> Nit: Please parenthesize the << against the |.
>
We'll fix formatting for this section

> > --- /dev/null
> > +++ b/xen/arch/riscv/riscv64/efi-header.S
> > @@ -0,0 +1,99 @@
> > +#include <efi/pe.h>
> > +#include <xen/sizes.h>
> > +
> > +        .macro __EFI_PE_HEADER
> > +        .long PE_MAGIC
> > +coff_header:
> > +#ifdef CONFIG_RISCV_64
> > +        .short  IMAGE_FILE_MACHINE_RISCV64              /* Machine */
> > +#else
> > +        .short  IMAGE_FILE_MACHINE_RISCV32              /* Machine */
> > +#endif
> > +        .short  section_count                           /* NumberOfSec=
tions */
> > +        .long   0                                       /* TimeDateSta=
mp */
> > +        .long   0                                       /* PointerToSy=
mbolTable */
> > +        .long   0                                       /* NumberOfSym=
bols */
> > +        .short  section_table - optional_header         /* SizeOfOptio=
nalHeader */
> > +        .short  IMAGE_FILE_DEBUG_STRIPPED | \
> > +                IMAGE_FILE_EXECUTABLE_IMAGE | \
> > +                IMAGE_FILE_LINE_NUMS_STRIPPED           /* Characteris=
tics */
> > +
> > +optional_header:
> > +#ifdef CONFIG_RISCV_64
> > +        .short  PE_OPT_MAGIC_PE32PLUS                   /* PE32+ forma=
t */
> > +#else
> > +        .short  PE_OPT_MAGIC_PE32                       /* PE32 format=
 */
> > +#endif
> > +        .byte   0x02                                    /* MajorLinker=
Version */
> > +        .byte   0x14                                    /* MinorLinker=
Version */
> > +        .long   _end - xen_start                        /* SizeOfCode =
*/
> > +        .long   0                                       /* SizeOfIniti=
alizedData */
> > +        .long   0                                       /* SizeOfUnini=
tializedData */
> > +        .long   0                                       /* AddressOfEn=
tryPoint */
> > +        .long   xen_start - _start                      /* BaseOfCode =
*/
> > +#ifdef CONFIG_RISCV_32
> > +        .long  _end - _start                            /* BaseOfData =
*/
> > +#endif
>
> As requested before, the decision to represent all of .text/.data/.bss
> as code (with no data at all) wants explaining in a (possibly brief)
> comment.
>
We're not using .data and .bss for risc-v, since all "data" is part of
the PE header and embedded directly into section.text.header. Of
course, if at some point the program is updated with actual non-PE
header data, initialized/uninitialized data size members should be
updated. We'll clarify this part in code.

> > +extra_header_fields:
> > +        .quad   0                                       /* ImageBase *=
/
> > +        .long   PECOFF_SECTION_ALIGNMENT                /* SectionAlig=
nment */
> > +        .long   PECOFF_FILE_ALIGNMENT                   /* FileAlignme=
nt */
> > +        .short  0                                       /* MajorOperat=
ingSystemVersion */
> > +        .short  0                                       /* MinorOperat=
ingSystemVersion */
> > +        .short  LINUX_EFISTUB_MAJOR_VERSION             /* MajorImageV=
ersion */
> > +        .short  LINUX_EFISTUB_MINOR_VERSION             /* MinorImageV=
ersion */
> > +        .short  0                                       /* MajorSubsys=
temVersion */
> > +        .short  0                                       /* MinorSubsys=
temVersion */
> > +        .long   0                                       /* Win32Versio=
nValue */
> > +        .long   _end - _start                           /* SizeOfImage=
 */
> > +
> > +        /* Everything before the xen image is considered part of the h=
eader */
> > +        .long   xen_start - _start                      /* SizeOfHeade=
rs */
> > +        .long   0                                       /* CheckSum */
> > +        .short  IMAGE_SUBSYSTEM_EFI_APPLICATION         /* Subsystem *=
/
> > +        .short  0                                       /* DllCharacte=
ristics */
> > +        .quad   0                                       /* SizeOfStack=
Reserve */
> > +        .quad   0                                       /* SizeOfStack=
Commit */
> > +        .quad   0                                       /* SizeOfHeapR=
eserve */
> > +        .quad   0                                       /* SizeOfHeapC=
ommit */
> > +        .long   0                                       /* LoaderFlags=
 */
> > +        .long   (section_table - .) / 8                 /* NumberOfRva=
AndSizes */
> > +        /*
> > +         * Data directories are not used in this case, therefore not d=
efined to reduce header size.
> > +         */
> > +
> > +        /* Section table */
> > +section_table:
> > +        /* Currently code/data sections are not used since EFI stub im=
plementation is not yet finalized */
> > +        .ascii  ".text\0\0\0"
> > +        .long   0                                       /* VirtualSize=
 */
> > +        .long   0                                       /* VirtualAddr=
ess */
> > +        .long   0                                       /* SizeOfRawDa=
ta */
> > +        .long   0                                       /* PointerToRa=
wData */
> > +        .long   0                                       /* PointerToRe=
locations */
> > +        .long   0                                       /* PointerToLi=
neNumbers */
> > +        .short  0                                       /* NumberOfRel=
ocations */
> > +        .short  0                                       /* NumberOfLin=
eNumbers */
> > +        .long   IMAGE_SCN_CNT_CODE | \
> > +                IMAGE_SCN_MEM_READ | \
> > +                IMAGE_SCN_MEM_EXECUTE                   /* Characteris=
tics */
> > +
> > +        .ascii  ".data\0\0\0"
> > +        .long   0                                       /* VirtualSize=
 */
> > +        .long   0                                       /* VirtualAddr=
ess */
> > +        .long   0                                       /* SizeOfRawDa=
ta */
> > +        .long   0                                       /* PointerToRa=
wData */
> > +        .long   0                                       /* PointerToRe=
locations */
> > +        .long   0                                       /* PointerToLi=
neNumbers */
> > +        .short  0                                       /* NumberOfRel=
ocations */
> > +        .short  0                                       /* NumberOfLin=
eNumbers */
> > +        .long   IMAGE_SCN_CNT_INITIALIZED_DATA | \
> > +                IMAGE_SCN_MEM_READ | \
> > +                IMAGE_SCN_MEM_WRITE                    /* Characterist=
ics */
> > +
> > +        .set    section_count, (. - section_table) / 40
> > +
> > +        .balign  0x1000
> > +efi_header_end:
> > +        .endm
> > \ No newline at end of file
>
> Please take care of this.
>
> > --- a/xen/arch/riscv/riscv64/head.S
> > +++ b/xen/arch/riscv/riscv64/head.S
> > @@ -1,14 +1,54 @@
> >  #include <asm/asm.h>
> >  #include <asm/riscv_encoding.h>
> > +#include <asm/riscv-image-header.h>
> > +#ifdef CONFIG_RISCV_EFI
> > +#include "efi-header.S"
> > +#endif
> >
> >          .section .text.header, "ax", %progbits
> > -
> >          /*
>
> I see no reason for removing this blank line.
>
> >           * OpenSBI pass to start():
> >           *   a0 -> hart_id ( bootcpu_id )
> > -         *   a1 -> dtb_base
> > +         *   a1 -> dtb_base
> >           */
> >  FUNC(start)
> > +/* Image header expected by second stage bootloaders (format defined i=
n asm/riscv-image-header.h) */
>
> Nit: Overlong line (and not the only one).
>
We'll fix formatting for these parts

> > +#ifdef CONFIG_RISCV_EFI
> > +        /*
> > +         * This instruction decodes to "MZ" ASCII required by UEFI.
> > +         */
> > +        c.li s4,-13
> > +        c.j xen_start
> > +#else
> > +        /* jump to start kernel */
> > +        jal xen_start
>
> JAL, not J? Why?
>
We use jal explicitly here to highlight that we want to occupy 32 bits
in order to align with header format (and EFI case where we use two
16-bits instructions). Although it will also work by using "j"
directly, it could be implicitly compressed to 16 bits (if C extension
is available) which would make header layout less obvious imo.

> > +#endif
> > +        .balign 8
>
> This won't do what you want unless "start" itself is also suitably aligne=
d.
> It'll be as long as it's first in the section, but better make such expli=
cit.
>
I understand, we'll also explicitly align "start"

> > +#ifdef CONFIG_RISCV_64
> > +        /* Image load offset(2MB) from start of RAM */
> > +        .quad 0x200000
> > +#else
> > +        /* Image load offset(4MB) from start of RAM */
> > +        .quad 0x400000
> > +#endif
>
> What these constants derive from? I expect they aren't really "magic" .
>
These offsets are commonly used for RISCV SOCs. In general, these can
have different values, depending on memory layout, but in order to be
compatible with
linux bootloaders we just followed the common practice.

> > +        .quad _end - _start              /* Effective Image size */
> > +        .quad __HEAD_FLAGS
> > +        .long RISCV_HEADER_VERSION
>
> In the C struct this is a 64-bit field. Why .long here? Or perhaps the C
> struct is wrong, actually also leaving unspecified padding there after
> ...
>
> > +        .long 0                          /* reserved */
>
> ... this field then.
>
> > +        .quad 0                          /* reserved */
> > +        .ascii RISCV_IMAGE_MAGIC         /* Magic number (RISC-V speci=
fic; deprecated) */
> > +        .balign 4
>
> RISCV_IMAGE_MAGIC is already nul-padded to 8 bytes. I therefore find
> the .balign here somewhat confusing.
>
Yes, regarding RISCV_HEADER_VERSION, the C struct field has the wrong
type (should be uint_32 instead of uint_64). We'll fix this one. We'll
also remove explicit .balign, since it's not needed.


> > +        .ascii RISCV_IMAGE_MAGIC2        /* Magic number 2 (to match t=
he ARM64 'magic' field pos) */
> > +#ifdef CONFIG_RISCV_EFI
> > +        .long pe_head_start - _start     /* reserved (PE COFF offset) =
*/
> > +pe_head_start:
> > +
> > +        __EFI_PE_HEADER
>
> Using a macro for a single, simple purpose is somewhat unexpected.
> Can't you simply
>
> #include "efi-header.S"
>
> here? That would also make it more straightforward to find the use /
> purpose of that file.
>
Leftover from the previous version when we had everything embedded in
head.S. We'll remove the macro and use explicit include here.

> > +#else
> > +        .long 0                          /* 0 means no PE header. */
> > +#endif
> > +
> > +xen_start:
> >          /* Mask all interrupts */
> >          csrw    CSR_SIE, zero
> >
> > @@ -60,6 +100,7 @@ FUNC(start)
> >          mv      a1, s1
> >
> >          tail    start_xen
> > +
> >  END(start)
> >
> >          .section .text, "ax", %progbits
>
> What is this hunk about?
>
Not sure which part of the code you refer to here. This section is
part of the original riscv implementation. We only grouped this
section under the new, xen_start label since we have different
handling for EFI and ELF formats  in the beginning of "start" function
before jumping to xen_start.

> > --- a/xen/arch/riscv/xen.lds.S
> > +++ b/xen/arch/riscv/xen.lds.S
> > @@ -12,6 +12,9 @@ PHDRS
> >  #endif
> >  }
> >
> > +PECOFF_SECTION_ALIGNMENT =3D 0x1000;
> > +PECOFF_FILE_ALIGNMENT =3D 0x200;
>
> What are these about? I see you use them in efi-header.S, but why do
> they need supplying from the linker script?
>
Actually there is no specific reason to supply these constants from
linker scripts, we can embed those as macros directly in code.

> > --- /dev/null
> > +++ b/xen/include/efi/pe.h
> > @@ -0,0 +1,458 @@
> > +#ifndef __PE_H
>
> This probably wants (needs?) to gain an SPDX line.
>
Yes, it was originally taken over from the linux kernel (with some
modifications from our side), but we omitted the SPDX line by mistake.

> > +#define __PE_H
> > +
> > +/*
> > + * Linux EFI stub v1.0 adds the following functionality:
> > + * - Loading initrd from the LINUX_EFI_INITRD_MEDIA_GUID device path,
> > + * - Loading/starting the kernel from firmware that targets a differen=
t
> > + *   machine type, via the entrypoint exposed in the .compat PE/COFF s=
ection.
> > + *
> > + * The recommended way of loading and starting v1.0 or later kernels i=
s to use
> > + * the LoadImage() and StartImage() EFI boot services, and expose the =
initrd
> > + * via the LINUX_EFI_INITRD_MEDIA_GUID device path.
> > + *
> > + * Versions older than v1.0 support initrd loading via the image load =
options
> > + * (using initrd=3D, limited to the volume from which the kernel itsel=
f was
> > + * loaded), or via arch specific means (bootparams, DT, etc).
> > + *
> > + * On x86, LoadImage() and StartImage() can be omitted if the EFI hand=
over
> > + * protocol is implemented, which can be inferred from the version,
> > + * handover_offset and xloadflags fields in the bootparams structure.
> > + */
> > +#define LINUX_EFISTUB_MAJOR_VERSION 0x1
> > +#define LINUX_EFISTUB_MINOR_VERSION 0x0
> > +
> > +#define MZ_MAGIC 0x5a4d /* "MZ" */
> > +
> > +#define PE_MAGIC              0x00004550 /* "PE\0\0" */
> > +#define PE_OPT_MAGIC_PE32     0x010b
> > +#define PE_OPT_MAGIC_PE32_ROM 0x0107
> > +#define PE_OPT_MAGIC_PE32PLUS 0x020b
> > +
> > +/* machine type */
> > +#define IMAGE_FILE_MACHINE_UNKNOWN   0x0000
> > +#define IMAGE_FILE_MACHINE_AM33      0x01d3
> > +#define IMAGE_FILE_MACHINE_AMD64     0x8664
> > +#define IMAGE_FILE_MACHINE_ARM       0x01c0
> > +#define IMAGE_FILE_MACHINE_ARMV7     0x01c4
> > +#define IMAGE_FILE_MACHINE_ARM64     0xaa64
> > +#define IMAGE_FILE_MACHINE_EBC       0x0ebc
> > +#define IMAGE_FILE_MACHINE_I386      0x014c
> > +#define IMAGE_FILE_MACHINE_IA64      0x0200
> > +#define IMAGE_FILE_MACHINE_M32R      0x9041
> > +#define IMAGE_FILE_MACHINE_MIPS16    0x0266
> > +#define IMAGE_FILE_MACHINE_MIPSFPU   0x0366
> > +#define IMAGE_FILE_MACHINE_MIPSFPU16 0x0466
> > +#define IMAGE_FILE_MACHINE_POWERPC   0x01f0
> > +#define IMAGE_FILE_MACHINE_POWERPCFP 0x01f1
> > +#define IMAGE_FILE_MACHINE_R4000     0x0166
> > +#define IMAGE_FILE_MACHINE_RISCV32   0x5032
> > +#define IMAGE_FILE_MACHINE_RISCV64   0x5064
> > +#define IMAGE_FILE_MACHINE_RISCV128  0x5128
> > +#define IMAGE_FILE_MACHINE_SH3       0x01a2
> > +#define IMAGE_FILE_MACHINE_SH3DSP    0x01a3
> > +#define IMAGE_FILE_MACHINE_SH3E      0x01a4
> > +#define IMAGE_FILE_MACHINE_SH4       0x01a6
> > +#define IMAGE_FILE_MACHINE_SH5       0x01a8
> > +#define IMAGE_FILE_MACHINE_THUMB     0x01c2
> > +#define IMAGE_FILE_MACHINE_WCEMIPSV2 0x0169
> > +
> > +/* flags */
> > +#define IMAGE_FILE_RELOCS_STRIPPED         0x0001
> > +#define IMAGE_FILE_EXECUTABLE_IMAGE        0x0002
> > +#define IMAGE_FILE_LINE_NUMS_STRIPPED      0x0004
> > +#define IMAGE_FILE_LOCAL_SYMS_STRIPPED     0x0008
> > +#define IMAGE_FILE_AGGRESSIVE_WS_TRIM      0x0010
> > +#define IMAGE_FILE_LARGE_ADDRESS_AWARE     0x0020
> > +#define IMAGE_FILE_16BIT_MACHINE           0x0040
> > +#define IMAGE_FILE_BYTES_REVERSED_LO       0x0080
> > +#define IMAGE_FILE_32BIT_MACHINE           0x0100
> > +#define IMAGE_FILE_DEBUG_STRIPPED          0x0200
> > +#define IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP 0x0400
> > +#define IMAGE_FILE_NET_RUN_FROM_SWAP       0x0800
> > +#define IMAGE_FILE_SYSTEM                  0x1000
> > +#define IMAGE_FILE_DLL                     0x2000
> > +#define IMAGE_FILE_UP_SYSTEM_ONLY          0x4000
> > +#define IMAGE_FILE_BYTES_REVERSED_HI       0x8000
> > +
> > +#define IMAGE_FILE_OPT_ROM_MAGIC       0x107
> > +#define IMAGE_FILE_OPT_PE32_MAGIC      0x10b
> > +#define IMAGE_FILE_OPT_PE32_PLUS_MAGIC 0x20b
> > +
> > +#define IMAGE_SUBSYSTEM_UNKNOWN                 0
> > +#define IMAGE_SUBSYSTEM_NATIVE                  1
> > +#define IMAGE_SUBSYSTEM_WINDOWS_GUI             2
> > +#define IMAGE_SUBSYSTEM_WINDOWS_CUI             3
> > +#define IMAGE_SUBSYSTEM_POSIX_CUI               7
> > +#define IMAGE_SUBSYSTEM_WINDOWS_CE_GUI          9
> > +#define IMAGE_SUBSYSTEM_EFI_APPLICATION         10
> > +#define IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER 11
> > +#define IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER      12
> > +#define IMAGE_SUBSYSTEM_EFI_ROM_IMAGE           13
> > +#define IMAGE_SUBSYSTEM_XBOX                    14
> > +
> > +#define IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE         0x0040
> > +#define IMAGE_DLL_CHARACTERISTICS_FORCE_INTEGRITY      0x0080
> > +#define IMAGE_DLL_CHARACTERISTICS_NX_COMPAT            0x0100
> > +#define IMAGE_DLLCHARACTERISTICS_NO_ISOLATION          0x0200
> > +#define IMAGE_DLLCHARACTERISTICS_NO_SEH                0x0400
> > +#define IMAGE_DLLCHARACTERISTICS_NO_BIND               0x0800
> > +#define IMAGE_DLLCHARACTERISTICS_WDM_DRIVER            0x2000
> > +#define IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE 0x8000
> > +
> > +/* they actually defined 0x00000000 as well, but I think we'll skip th=
at one. */
> > +#define IMAGE_SCN_RESERVED_0             0x00000001
> > +#define IMAGE_SCN_RESERVED_1             0x00000002
> > +#define IMAGE_SCN_RESERVED_2             0x00000004
> > +#define IMAGE_SCN_TYPE_NO_PAD            0x00000008 /* don't pad - obs=
olete */
> > +#define IMAGE_SCN_RESERVED_3             0x00000010
> > +#define IMAGE_SCN_CNT_CODE               0x00000020 /* .text */
> > +#define IMAGE_SCN_CNT_INITIALIZED_DATA   0x00000040 /* .data */
> > +#define IMAGE_SCN_CNT_UNINITIALIZED_DATA 0x00000080 /* .bss */
> > +#define IMAGE_SCN_LNK_OTHER              0x00000100 /* reserved */
> > +#define IMAGE_SCN_LNK_INFO               0x00000200 /* .drectve commen=
ts */
> > +#define IMAGE_SCN_RESERVED_4             0x00000400
> > +#define IMAGE_SCN_LNK_REMOVE             0x00000800 /* .o only - scn t=
o be rm'd*/
> > +#define IMAGE_SCN_LNK_COMDAT             0x00001000 /* .o only - COMDA=
T data */
> > +#define IMAGE_SCN_RESERVED_5             0x00002000 /* spec omits this=
 */
> > +#define IMAGE_SCN_RESERVED_6             0x00004000 /* spec omits this=
 */
> > +#define IMAGE_SCN_GPREL                  0x00008000 /* global pointer =
referenced data */
> > +/* spec lists 0x20000 twice, I suspect they meant 0x10000 for one of t=
hem */
> > +#define IMAGE_SCN_MEM_PURGEABLE 0x00010000 /* reserved for "future" us=
e */
> > +#define IMAGE_SCN_16BIT         0x00020000 /* reserved for "future" us=
e */
> > +#define IMAGE_SCN_LOCKED        0x00040000 /* reserved for "future" us=
e */
> > +#define IMAGE_SCN_PRELOAD       0x00080000 /* reserved for "future" us=
e */
> > +/* and here they just stuck a 1-byte integer in the middle of a bitfie=
ld */
> > +#define IMAGE_SCN_ALIGN_1BYTES    0x00100000 /* it does what it says o=
n the box */
> > +#define IMAGE_SCN_ALIGN_2BYTES    0x00200000
> > +#define IMAGE_SCN_ALIGN_4BYTES    0x00300000
> > +#define IMAGE_SCN_ALIGN_8BYTES    0x00400000
> > +#define IMAGE_SCN_ALIGN_16BYTES   0x00500000
> > +#define IMAGE_SCN_ALIGN_32BYTES   0x00600000
> > +#define IMAGE_SCN_ALIGN_64BYTES   0x00700000
> > +#define IMAGE_SCN_ALIGN_128BYTES  0x00800000
> > +#define IMAGE_SCN_ALIGN_256BYTES  0x00900000
> > +#define IMAGE_SCN_ALIGN_512BYTES  0x00a00000
> > +#define IMAGE_SCN_ALIGN_1024BYTES 0x00b00000
> > +#define IMAGE_SCN_ALIGN_2048BYTES 0x00c00000
> > +#define IMAGE_SCN_ALIGN_4096BYTES 0x00d00000
> > +#define IMAGE_SCN_ALIGN_8192BYTES 0x00e00000
> > +#define IMAGE_SCN_LNK_NRELOC_OVFL 0x01000000 /* extended relocations *=
/
> > +#define IMAGE_SCN_MEM_DISCARDABLE 0x02000000 /* scn can be discarded *=
/
> > +#define IMAGE_SCN_MEM_NOT_CACHED  0x04000000 /* cannot be cached */
> > +#define IMAGE_SCN_MEM_NOT_PAGED   0x08000000 /* not pageable */
> > +#define IMAGE_SCN_MEM_SHARED      0x10000000 /* can be shared */
> > +#define IMAGE_SCN_MEM_EXECUTE     0x20000000 /* can be executed as cod=
e */
> > +#define IMAGE_SCN_MEM_READ        0x40000000 /* readable */
> > +#define IMAGE_SCN_MEM_WRITE       0x80000000 /* writeable */
> > +
> > +#define IMAGE_DEBUG_TYPE_CODEVIEW 2
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +struct mz_hdr {
> > +    uint16_t magic;              /* MZ_MAGIC */
> > +    uint16_t lbsize;             /* size of last used block */
> > +    uint16_t blocks;             /* pages in file, 0x3 */
> > +    uint16_t relocs;             /* relocations */
> > +    uint16_t hdrsize;            /* header size in "paragraphs" */
> > +    uint16_t min_extra_pps;      /* .bss */
> > +    uint16_t max_extra_pps;      /* runtime limit for the arena size *=
/
> > +    uint16_t ss;                 /* relative stack segment */
> > +    uint16_t sp;                 /* initial %sp register */
> > +    uint16_t checksum;           /* word checksum */
> > +    uint16_t ip;                 /* initial %ip register */
> > +    uint16_t cs;                 /* initial %cs relative to load segme=
nt */
> > +    uint16_t reloc_table_offset; /* offset of the first relocation */
> > +    uint16_t overlay_num;        /* overlay number.  set to 0. */
> > +    uint16_t reserved0[4];       /* reserved */
> > +    uint16_t oem_id;             /* oem identifier */
> > +    uint16_t oem_info;           /* oem specific */
> > +    uint16_t reserved1[10];      /* reserved */
> > +    uint32_t peaddr;             /* address of pe header */
> > +    char     message[];          /* message to print */
> > +};
>
> We already have an instance of this struct in common/efi/pe.c. I think
> it wouldn't be very desirable to have two (different) instances.
>
> > +struct mz_reloc {
> > +    uint16_t offset;
> > +    uint16_t segment;
> > +};
>
> We aren't going to need this anywhere, are we?
>
> > +struct pe_hdr {
> > +    uint32_t magic;        /* PE magic */
> > +    uint16_t machine;      /* machine type */
> > +    uint16_t sections;     /* number of sections */
> > +    uint32_t timestamp;    /* time_t */
> > +    uint32_t symbol_table; /* symbol table offset */
> > +    uint32_t symbols;      /* number of symbols */
> > +    uint16_t opt_hdr_size; /* size of optional header */
> > +    uint16_t flags;        /* flags */
> > +};
>
> And again another (different) instance of this and further struct-s
> already exists. Same for the section header further down.
>
> > +/* the fact that pe32 isn't padded where pe32+ is 64-bit means union w=
on't
> > + * work right.  vomit. */
>
> Noticing here in particular, but being an issue elsewhere as well:
> Unless this file is to be a verbatim copy taken from somewhere (in
> which case it should probably be introduced in a separate commit
> with an Origin: tag), comments want to adhere of ./CODING_STYLE.
>
> > +struct pe32_opt_hdr {
> > +    /* "standard" header */
> > +    uint16_t magic;       /* file type */
> > +    uint8_t  ld_major;    /* linker major version */
> > +    uint8_t  ld_minor;    /* linker minor version */
> > +    uint32_t text_size;   /* size of text section(s) */
> > +    uint32_t data_size;   /* size of data section(s) */
> > +    uint32_t bss_size;    /* size of bss section(s) */
> > +    uint32_t entry_point; /* file offset of entry point */
> > +    uint32_t code_base;   /* relative code addr in ram */
> > +    uint32_t data_base;   /* relative data addr in ram */
> > +    /* "windows" header */
> > +    uint32_t image_base;     /* preferred load address */
> > +    uint32_t section_align;  /* alignment in bytes */
> > +    uint32_t file_align;     /* file alignment in bytes */
> > +    uint16_t os_major;       /* major OS version */
> > +    uint16_t os_minor;       /* minor OS version */
> > +    uint16_t image_major;    /* major image version */
> > +    uint16_t image_minor;    /* minor image version */
> > +    uint16_t subsys_major;   /* major subsystem version */
> > +    uint16_t subsys_minor;   /* minor subsystem version */
> > +    uint32_t win32_version;  /* reserved, must be 0 */
> > +    uint32_t image_size;     /* image size */
> > +    uint32_t header_size;    /* header size rounded up to file_align *=
/
> > +    uint32_t csum;           /* checksum */
> > +    uint16_t subsys;         /* subsystem */
> > +    uint16_t dll_flags;      /* executable characteristics */
> > +    uint32_t stack_size_req; /* amt of stack requested */
> > +    uint32_t stack_size;     /* amt of stack required */
> > +    uint32_t heap_size_req;  /* amt of heap requested */
> > +    uint32_t heap_size;      /* amt of heap required */
> > +    uint32_t loader_flags;   /* reserved, must be 0 */
> > +    uint32_t data_dirs;      /* number of data dir entries */
> > +};
> > +
> > +struct pe32plus_opt_hdr {
> > +    uint16_t magic;       /* file type */
> > +    uint8_t  ld_major;    /* linker major version */
> > +    uint8_t  ld_minor;    /* linker minor version */
> > +    uint32_t text_size;   /* size of text section(s) */
> > +    uint32_t data_size;   /* size of data section(s) */
> > +    uint32_t bss_size;    /* size of bss section(s) */
> > +    uint32_t entry_point; /* file offset of entry point */
> > +    uint32_t code_base;   /* relative code addr in ram */
> > +    /* "windows" header */
> > +    uint64_t image_base;     /* preferred load address */
> > +    uint32_t section_align;  /* alignment in bytes */
> > +    uint32_t file_align;     /* file alignment in bytes */
> > +    uint16_t os_major;       /* major OS version */
> > +    uint16_t os_minor;       /* minor OS version */
> > +    uint16_t image_major;    /* major image version */
> > +    uint16_t image_minor;    /* minor image version */
> > +    uint16_t subsys_major;   /* major subsystem version */
> > +    uint16_t subsys_minor;   /* minor subsystem version */
> > +    uint32_t win32_version;  /* reserved, must be 0 */
> > +    uint32_t image_size;     /* image size */
> > +    uint32_t header_size;    /* header size rounded up to file_align *=
/
> > +    uint32_t csum;           /* checksum */
> > +    uint16_t subsys;         /* subsystem */
> > +    uint16_t dll_flags;      /* executable characteristics */
> > +    uint64_t stack_size_req; /* amt of stack requested */
> > +    uint64_t stack_size;     /* amt of stack required */
> > +    uint64_t heap_size_req;  /* amt of heap requested */
> > +    uint64_t heap_size;      /* amt of heap required */
> > +    uint32_t loader_flags;   /* reserved, must be 0 */
> > +    uint32_t data_dirs;      /* number of data dir entries */
> > +};
> > +
> > +struct data_dirent {
> > +    uint32_t virtual_address; /* relative to load address */
> > +    uint32_t size;
> > +};
>
> Will we need this and ...
>
> > +struct data_directory {
> > +    struct data_dirent exports;          /* .edata */
> > +    struct data_dirent imports;          /* .idata */
> > +    struct data_dirent resources;        /* .rsrc */
> > +    struct data_dirent exceptions;       /* .pdata */
> > +    struct data_dirent certs;            /* certs */
> > +    struct data_dirent base_relocations; /* .reloc */
> > +    struct data_dirent debug;            /* .debug */
> > +    struct data_dirent arch;             /* reservered */
> > +    struct data_dirent global_ptr;       /* global pointer reg. Size=
=3D0 */
> > +    struct data_dirent tls;              /* .tls */
> > +    struct data_dirent load_config;      /* load configuration structu=
re */
> > +    struct data_dirent bound_imports;    /* no idea */
> > +    struct data_dirent import_addrs;     /* import address table */
> > +    struct data_dirent delay_imports;    /* delay-load import table */
> > +    struct data_dirent clr_runtime_hdr;  /* .cor (object only) */
> > +    struct data_dirent reserved;
> > +};
>
> ... this?
>
> > +struct section_header {
> > +    char     name[8];         /* name or string tbl offset */
> > +    uint32_t virtual_size;    /* size of loaded section in ram */
> > +    uint32_t virtual_address; /* relative virtual address */
> > +    uint32_t raw_data_size;   /* size of the section */
> > +    uint32_t data_addr;       /* file pointer to first page of sec */
> > +    uint32_t relocs;          /* file pointer to relocation entries */
> > +    uint32_t line_numbers;    /* line numbers */
> > +    uint16_t num_relocs;      /* number of relocations */
> > +    uint16_t num_lin_numbers; /* COFF line count. */
> > +    uint32_t flags;
> > +};
> > +
> > +enum x64_coff_reloc_type {
> > +    IMAGE_REL_AMD64_ABSOLUTE =3D 0,
> > +    IMAGE_REL_AMD64_ADDR64,
> > +    IMAGE_REL_AMD64_ADDR32,
> > +    IMAGE_REL_AMD64_ADDR32N,
> > +    IMAGE_REL_AMD64_REL32,
> > +    IMAGE_REL_AMD64_REL32_1,
> > +    IMAGE_REL_AMD64_REL32_2,
> > +    IMAGE_REL_AMD64_REL32_3,
> > +    IMAGE_REL_AMD64_REL32_4,
> > +    IMAGE_REL_AMD64_REL32_5,
> > +    IMAGE_REL_AMD64_SECTION,
> > +    IMAGE_REL_AMD64_SECREL,
> > +    IMAGE_REL_AMD64_SECREL7,
> > +    IMAGE_REL_AMD64_TOKEN,
> > +    IMAGE_REL_AMD64_SREL32,
> > +    IMAGE_REL_AMD64_PAIR,
> > +    IMAGE_REL_AMD64_SSPAN32,
> > +};
> > +
> > +enum arm_coff_reloc_type {
> > +    IMAGE_REL_ARM_ABSOLUTE,
> > +    IMAGE_REL_ARM_ADDR32,
> > +    IMAGE_REL_ARM_ADDR32N,
> > +    IMAGE_REL_ARM_BRANCH2,
> > +    IMAGE_REL_ARM_BRANCH1,
> > +    IMAGE_REL_ARM_SECTION,
> > +    IMAGE_REL_ARM_SECREL,
> > +};
> > +
> > +enum sh_coff_reloc_type {
> > +    IMAGE_REL_SH3_ABSOLUTE,
> > +    IMAGE_REL_SH3_DIRECT16,
> > +    IMAGE_REL_SH3_DIRECT32,
> > +    IMAGE_REL_SH3_DIRECT8,
> > +    IMAGE_REL_SH3_DIRECT8_WORD,
> > +    IMAGE_REL_SH3_DIRECT8_LONG,
> > +    IMAGE_REL_SH3_DIRECT4,
> > +    IMAGE_REL_SH3_DIRECT4_WORD,
> > +    IMAGE_REL_SH3_DIRECT4_LONG,
> > +    IMAGE_REL_SH3_PCREL8_WORD,
> > +    IMAGE_REL_SH3_PCREL8_LONG,
> > +    IMAGE_REL_SH3_PCREL12_WORD,
> > +    IMAGE_REL_SH3_STARTOF_SECTION,
> > +    IMAGE_REL_SH3_SIZEOF_SECTION,
> > +    IMAGE_REL_SH3_SECTION,
> > +    IMAGE_REL_SH3_SECREL,
> > +    IMAGE_REL_SH3_DIRECT32_NB,
> > +    IMAGE_REL_SH3_GPREL4_LONG,
> > +    IMAGE_REL_SH3_TOKEN,
> > +    IMAGE_REL_SHM_PCRELPT,
> > +    IMAGE_REL_SHM_REFLO,
> > +    IMAGE_REL_SHM_REFHALF,
> > +    IMAGE_REL_SHM_RELLO,
> > +    IMAGE_REL_SHM_RELHALF,
> > +    IMAGE_REL_SHM_PAIR,
> > +    IMAGE_REL_SHM_NOMODE,
> > +};
> > +
> > +enum ppc_coff_reloc_type {
> > +    IMAGE_REL_PPC_ABSOLUTE,
> > +    IMAGE_REL_PPC_ADDR64,
> > +    IMAGE_REL_PPC_ADDR32,
> > +    IMAGE_REL_PPC_ADDR24,
> > +    IMAGE_REL_PPC_ADDR16,
> > +    IMAGE_REL_PPC_ADDR14,
> > +    IMAGE_REL_PPC_REL24,
> > +    IMAGE_REL_PPC_REL14,
> > +    IMAGE_REL_PPC_ADDR32N,
> > +    IMAGE_REL_PPC_SECREL,
> > +    IMAGE_REL_PPC_SECTION,
> > +    IMAGE_REL_PPC_SECREL16,
> > +    IMAGE_REL_PPC_REFHI,
> > +    IMAGE_REL_PPC_REFLO,
> > +    IMAGE_REL_PPC_PAIR,
> > +    IMAGE_REL_PPC_SECRELLO,
> > +    IMAGE_REL_PPC_GPREL,
> > +    IMAGE_REL_PPC_TOKEN,
> > +};
> > +
> > +enum x86_coff_reloc_type {
> > +    IMAGE_REL_I386_ABSOLUTE,
> > +    IMAGE_REL_I386_DIR16,
> > +    IMAGE_REL_I386_REL16,
> > +    IMAGE_REL_I386_DIR32,
> > +    IMAGE_REL_I386_DIR32NB,
> > +    IMAGE_REL_I386_SEG12,
> > +    IMAGE_REL_I386_SECTION,
> > +    IMAGE_REL_I386_SECREL,
> > +    IMAGE_REL_I386_TOKEN,
> > +    IMAGE_REL_I386_SECREL7,
> > +    IMAGE_REL_I386_REL32,
> > +};
> > +
> > +enum ia64_coff_reloc_type {
> > +    IMAGE_REL_IA64_ABSOLUTE,
> > +    IMAGE_REL_IA64_IMM14,
> > +    IMAGE_REL_IA64_IMM22,
> > +    IMAGE_REL_IA64_IMM64,
> > +    IMAGE_REL_IA64_DIR32,
> > +    IMAGE_REL_IA64_DIR64,
> > +    IMAGE_REL_IA64_PCREL21B,
> > +    IMAGE_REL_IA64_PCREL21M,
> > +    IMAGE_REL_IA64_PCREL21F,
> > +    IMAGE_REL_IA64_GPREL22,
> > +    IMAGE_REL_IA64_LTOFF22,
> > +    IMAGE_REL_IA64_SECTION,
> > +    IMAGE_REL_IA64_SECREL22,
> > +    IMAGE_REL_IA64_SECREL64I,
> > +    IMAGE_REL_IA64_SECREL32,
> > +    IMAGE_REL_IA64_DIR32NB,
> > +    IMAGE_REL_IA64_SREL14,
> > +    IMAGE_REL_IA64_SREL22,
> > +    IMAGE_REL_IA64_SREL32,
> > +    IMAGE_REL_IA64_UREL32,
> > +    IMAGE_REL_IA64_PCREL60X,
> > +    IMAGE_REL_IA64_PCREL60B,
> > +    IMAGE_REL_IA64_PCREL60F,
> > +    IMAGE_REL_IA64_PCREL60I,
> > +    IMAGE_REL_IA64_PCREL60M,
> > +    IMAGE_REL_IA64_IMMGPREL6,
> > +    IMAGE_REL_IA64_TOKEN,
> > +    IMAGE_REL_IA64_GPREL32,
> > +    IMAGE_REL_IA64_ADDEND,
> > +};
>
> All sorts of relocation types, but none for RISC-V? Are we going to need
> any of this?
>
> > +struct coff_reloc {
> > +    uint32_t virtual_address;
> > +    uint32_t symbol_table_index;
> > +
> > +    union {
> > +        enum x64_coff_reloc_type  x64_type;
> > +        enum arm_coff_reloc_type  arm_type;
> > +        enum sh_coff_reloc_type   sh_type;
> > +        enum ppc_coff_reloc_type  ppc_type;
> > +        enum x86_coff_reloc_type  x86_type;
> > +        enum ia64_coff_reloc_type ia64_type;
> > +        uint16_t                  data;
> > +    };
> > +};
> > +
> > +/*
> > + * Definitions for the contents of the certs data block
> > + */
> > +#define WIN_CERT_TYPE_PKCS_SIGNED_DATA 0x0002
> > +#define WIN_CERT_TYPE_EFI_OKCS115      0x0EF0
> > +#define WIN_CERT_TYPE_EFI_GUID         0x0EF1
> > +
> > +#define WIN_CERT_REVISION_1_0 0x0100
> > +#define WIN_CERT_REVISION_2_0 0x0200
> > +
> > +struct win_certificate {
> > +    uint32_t length;
> > +    uint16_t revision;
> > +    uint16_t cert_type;
> > +};
>
> Or any of this?
>
Regarding pe.h file content, we wanted to keep it as generic as
possible (structures definition according to PE format which can be
used for multiple architectures). Specifically for RISC-V as you
noticed, we are not using lots of structures (data directories,
relocation structures, certificates, etc.). Therefore, we can reduce
it to only those used atm, but in that case we won't have a generic PE
header definition anymore. Regarding structures which are already
defined in common/efi/pe.c, meaning that with our change we have two
versions of same structures, we can remove those, but in that case it
could be confusing for someone who is trying to map fields from pe.h
to actual image header in assembly code. Summary I would keep this
header with its original content, but if you think that it contains
too much overhead we can reduce it to relevant structures only.

BR,
Milan

