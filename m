Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8187FA41FC2
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2025 13:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895150.1303741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmY1Z-0007fy-Nx; Mon, 24 Feb 2025 12:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895150.1303741; Mon, 24 Feb 2025 12:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmY1Z-0007dj-LL; Mon, 24 Feb 2025 12:57:29 +0000
Received: by outflank-mailman (input) for mailman id 895150;
 Mon, 24 Feb 2025 12:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VeJ=VP=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tmY1Y-0007db-LN
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2025 12:57:28 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5313f39-f2ae-11ef-9aae-95dc52dad729;
 Mon, 24 Feb 2025 13:57:26 +0100 (CET)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-5fcd61e9bcdso1915965eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Feb 2025 04:57:26 -0800 (PST)
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
X-Inumbo-ID: e5313f39-f2ae-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740401845; x=1741006645; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=waMqBSewJ6BBcWO/2v3J2ActVC9zQkHNKtHnjNSROIg=;
        b=PcQwQt4lg4OjN/FogO18Pf97/ufGEjBPV+lL/pd55Kovh6HI2o+P7V5Zzy76TrEYVi
         GHw4OPAjKOo7jzTfacKCQ+slu6q2b90fLnBNnCy+BvunjMBD4TvZ03Iw+ewcnUugqbyS
         6XqNdAYcEUlGhY5tZHZdvyaUo7/5+pKjfXsjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740401845; x=1741006645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=waMqBSewJ6BBcWO/2v3J2ActVC9zQkHNKtHnjNSROIg=;
        b=GrqwQLF7wW1lcsDMA3BzQhsZPfVN7wjiaWx/W6NWl2Bb9Y55WFmkYQx/AkZlKrIgjd
         eKhd0ueSP9P1sRz7RjvF0C8g03NPIbWu96jTQj1K5vvwSPvbDBgSGDdPGuvmJvePAkQb
         7Xbv6XxPB8oaRcQuS84UkSErCA6+5kvFJBcPy78Md+afbq8z0uXEj/ldAamOKNbw2eFC
         ZkLU1gnOJ9zWoqxZKqju/v4wCU0T2cAwFa8C87IqqvFDYNF8IUojGfBfS48wmsh+EjHn
         GgcJN16y00kcWMRHZdpEObaNVfkoYmdPDVomaimFQ+5SWkvFaLJeaDvbViLpgadwszJD
         Tvpw==
X-Gm-Message-State: AOJu0YzesQz9IkUzMN9FXJjcuiVgAOUK8zEIXM8X+1jHN9nTYZy1R+n6
	gU+a3ViGcQ/zvdZ8olSDJlvXUOhraheaTEI+48LqBQkls/dzB09YkC1mqZK9nW2T63kEbuiUA8J
	YhXeNuIlGb6/V+v4wM+v9ZplNV8XlqQNtLT9U5g==
X-Gm-Gg: ASbGncuofLO0tx27i4kb7AEdu3+Stpjokvetr+aGFC3fx/t5JZXmA+nVkTiMGdwV5nR
	6+AGBjCjDGzViXSBLe6mSdGFALwa/fRnFrqsprrqqUtD6PpcD7qtcpfUjd471KK/heOXOS7/rp6
	sylrA+Kek=
X-Google-Smtp-Source: AGHT+IGKqEAzwqkQn32/LQlv7alc6lgyxY17TMMROuwTCeEK1h9wIcMxlp1RscR9OVtMvoo6hn2P38cSsKSyTmvo7iI=
X-Received: by 2002:a05:6808:10c9:b0:3f4:11b3:6215 with SMTP id
 5614622812f47-3f425a8f4f5mr8972322b6e.23.1740401844702; Mon, 24 Feb 2025
 04:57:24 -0800 (PST)
MIME-Version: 1.0
References: <20250217162659.151232-1-frediano.ziglio@cloud.com> <Z7jf_YojU9tQ1Or7@mail-itl>
In-Reply-To: <Z7jf_YojU9tQ1Or7@mail-itl>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 24 Feb 2025 12:57:13 +0000
X-Gm-Features: AWEUYZkZC3W5LFH3F7zHtuwTksXrf_C_IzYmUKiB64xSsNNvneUL70Esqv38HmE
Message-ID: <CACHz=Zierjby+_Q93dFeO5mjMG1aiSpyHvDshRK6=ZHY5bH-6A@mail.gmail.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2025 at 8:20=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Mon, Feb 17, 2025 at 04:26:59PM +0000, Frediano Ziglio wrote:
> > Although code is compiled with -fpic option data is not position
> > independent. This causes data pointer to become invalid if
> > code is not relocated properly which is what happens for
> > efi_multiboot2 which is called by multiboot entry code.
> >
> > Code tested adding
> >    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> > in efi_multiboot2 before calling efi_arch_edd (this function
> > can potentially call PrintErrMesg).
> >
> > Before the patch (XenServer installation on Qemu, xen replaced
> > with vanilla xen.gz):
> >   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> >   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Api=
c ID - 00000000 !!!!
> >   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
> >   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 00000000002=
10246
> >   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 00000000000000=
10
> >   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C2=
10
> >   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
> >   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 00000000000000=
00
> >   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1=
B8
> >   R14  - 000000007EA33328, R15 - 000000007EA332D8
> >   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 00000000000000=
30
> >   GS   - 0000000000000030, SS  - 0000000000000030
> >   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC010=
00
> >   CR4  - 0000000000000668, CR8 - 0000000000000000
> >   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 00000000000000=
00
> >   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 00000000000004=
00
> >   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
> >   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
> >   FXSAVE_STATE - 000000007FF0BDE0
> >   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=3D000000=
007EE20000, EntryPoint=3D000000007EE23935) !!!!
> >
> > After the patch:
> >   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> >   Test message: Buffer too small
> >   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4=
AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> >   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE=
4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
> >
> > This partially rollback commit 00d5d5ce23e6.
> >
> > Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI plat=
forms")
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> I tried testing this patch, but it seems I cannot reproduce the original
> failure...
>
> I did as the commit message suggests here:
> https://gitlab.com/xen-project/people/marmarek/xen/-/commit/ca3d6911c448e=
b886990f33d4380b5646617a982
>
> With blexit() in PrintErrMesg(), it went back to the bootloader, so I'm
> sure this code path was reached. But with blexit() commented out, Xen
> started correctly both with and without this patch... The branch I used
> is here:
> https://gitlab.com/xen-project/people/marmarek/xen/-/commits/automation-t=
ests?ref_type=3Dheads
>
> Are there some extra condition to reproduce the issue? Maybe it depends
> on the compiler version? I guess I can try also on QEMU, but based on
> the description, I would expect it to crash in any case.
>

Did you see the correct message in both cases?
Did you use Grub or direct EFI?

With Grub and without this patch you won't see the message, with grub
with the patch you see the correct message.

Frediano

> > ---
> > Changes since v1:
> > - added "Fixes:" tag;
> > - fixed cast style change.
> >
> > Changes since v2:
> > - wrap long line.
> >
> > Changes since v3:
> > - fixed "Fixes:" tag.
> >
> > Changes since v4:
> > - use switch instead of tables.
> >
> > Changes since v5:
> > - added -fno-jump-tables option.
> > ---
> >  xen/common/efi/boot.c        | 58 ++++++++++++++++++++++++------------
> >  xen/common/efi/efi-common.mk |  1 +
> >  2 files changed, 40 insertions(+), 19 deletions(-)
> >
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index efbec00af9..143b5681ba 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -287,33 +287,53 @@ static bool __init match_guid(const EFI_GUID *gui=
d1, const EFI_GUID *guid2)
> >  /* generic routine for printing error messages */
> >  static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode=
)
> >  {
> > -    static const CHAR16* const ErrCodeToStr[] __initconstrel =3D {
> > -        [~EFI_ERROR_MASK & EFI_NOT_FOUND]           =3D L"Not found",
> > -        [~EFI_ERROR_MASK & EFI_NO_MEDIA]            =3D L"The device h=
as no media",
> > -        [~EFI_ERROR_MASK & EFI_MEDIA_CHANGED]       =3D L"Media change=
d",
> > -        [~EFI_ERROR_MASK & EFI_DEVICE_ERROR]        =3D L"Device error=
",
> > -        [~EFI_ERROR_MASK & EFI_VOLUME_CORRUPTED]    =3D L"Volume corru=
pted",
> > -        [~EFI_ERROR_MASK & EFI_ACCESS_DENIED]       =3D L"Access denie=
d",
> > -        [~EFI_ERROR_MASK & EFI_OUT_OF_RESOURCES]    =3D L"Out of resou=
rces",
> > -        [~EFI_ERROR_MASK & EFI_VOLUME_FULL]         =3D L"Volume is fu=
ll",
> > -        [~EFI_ERROR_MASK & EFI_SECURITY_VIOLATION]  =3D L"Security vio=
lation",
> > -        [~EFI_ERROR_MASK & EFI_CRC_ERROR]           =3D L"CRC error",
> > -        [~EFI_ERROR_MASK & EFI_COMPROMISED_DATA]    =3D L"Compromised =
data",
> > -        [~EFI_ERROR_MASK & EFI_BUFFER_TOO_SMALL]    =3D L"Buffer too s=
mall",
> > -    };
> > -    EFI_STATUS ErrIdx =3D ErrCode & ~EFI_ERROR_MASK;
> > -
> >      StdOut =3D StdErr;
> >      PrintErr(mesg);
> >      PrintErr(L": ");
> >
> > -    if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
> > -        mesg =3D ErrCodeToStr[ErrIdx];
> > -    else
> > +    switch (ErrCode)
> >      {
> > +    case EFI_NOT_FOUND:
> > +        mesg =3D L"Not found";
> > +        break;
> > +    case EFI_NO_MEDIA:
> > +        mesg =3D L"The device has no media";
> > +        break;
> > +    case EFI_MEDIA_CHANGED:
> > +        mesg =3D L"Media changed";
> > +        break;
> > +    case EFI_DEVICE_ERROR:
> > +        mesg =3D L"Device error";
> > +        break;
> > +    case EFI_VOLUME_CORRUPTED:
> > +        mesg =3D L"Volume corrupted";
> > +        break;
> > +    case EFI_ACCESS_DENIED:
> > +        mesg =3D L"Access denied";
> > +        break;
> > +    case EFI_OUT_OF_RESOURCES:
> > +        mesg =3D L"Out of resources";
> > +        break;
> > +    case EFI_VOLUME_FULL:
> > +        mesg =3D L"Volume is full";
> > +        break;
> > +    case EFI_SECURITY_VIOLATION:
> > +        mesg =3D L"Security violation";
> > +        break;
> > +    case EFI_CRC_ERROR:
> > +        mesg =3D L"CRC error";
> > +        break;
> > +    case EFI_COMPROMISED_DATA:
> > +        mesg =3D L"Compromised data";
> > +        break;
> > +    case EFI_BUFFER_TOO_SMALL:
> > +        mesg =3D L"Buffer too small";
> > +        break;
> > +    default:
> >          PrintErr(L"ErrCode: ");
> >          DisplayUint(ErrCode, 0);
> >          mesg =3D NULL;
> > +        break;
> >      }
> >      blexit(mesg);
> >  }
> > diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.m=
k
> > index 23cafcf20c..06b1c19674 100644
> > --- a/xen/common/efi/efi-common.mk
> > +++ b/xen/common/efi/efi-common.mk
> > @@ -2,6 +2,7 @@ EFIOBJ-y :=3D boot.init.o pe.init.o ebmalloc.o runtime.=
o
> >  EFIOBJ-$(CONFIG_COMPAT) +=3D compat.o
> >
> >  CFLAGS-y +=3D -fshort-wchar
> > +CFLAGS-y +=3D -fno-jump-tables
> >  CFLAGS-y +=3D -iquote $(srctree)/common/efi
> >  CFLAGS-y +=3D -iquote $(srcdir)
> >
> > --
> > 2.34.1
> >
>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab

