Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E12DFA820A0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 10:58:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943645.1342323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2RFt-0004oL-1Z; Wed, 09 Apr 2025 08:57:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943645.1342323; Wed, 09 Apr 2025 08:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2RFs-0004mr-VA; Wed, 09 Apr 2025 08:57:56 +0000
Received: by outflank-mailman (input) for mailman id 943645;
 Wed, 09 Apr 2025 08:57:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1psM=W3=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1u2RFr-0004ml-JM
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 08:57:55 +0000
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [2607:f8b0:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b54561c3-1520-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 10:57:48 +0200 (CEST)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3f94b7bd964so4134634b6e.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 01:57:48 -0700 (PDT)
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
X-Inumbo-ID: b54561c3-1520-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1744189067; x=1744793867; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3ywWvIwQq+ipvE0c3NvvVQAwDl/6TI7v4y7Q8XiRtY=;
        b=JWhi+HWq/Vlws2MM4xNCql6UPXDriLmCnzqRsv77g//2h7o9fko292L3v+FtnNM2T7
         Oc8aU7D9kCLlnhwFqCbvrGofV9/0lMPGQAY5i0IZMoFtUMxxLYxRbipyQSuN59u8e7Qj
         chVB+JcBrDuCibS4SWSh8wDrs6twmNPXT8UcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744189067; x=1744793867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+3ywWvIwQq+ipvE0c3NvvVQAwDl/6TI7v4y7Q8XiRtY=;
        b=F7aSiYJZ+HUFczslHKfnEh4Eys7QQvr+QOWRHrnkl+dBsKKzIJgbFNhM5idJoHG+bQ
         1jDpMQCJvxitsByw9tafnFm3KlFGlcqm0PLXqMfILcA4NFGuxP2/qRMUFh1k3ieIpU+7
         kqgNiJLhRHOQYnNPVWeI4VnTb/x4+MIqt38mOhp8Rf9t9BjBr7ioqXtWKlzAkJ5wV5/4
         vfXne9ZxxD20W3O0sNFjOAaJTLt4ePhJxMxbNiK3zAKGGwwR4JdaI2DibbE2fKBM/hek
         TrPLfzvHlORXsJaU89GVeh046oqhRm1KLtgoLgP8f292hsPk+FCn299bFd9lLOslU+nr
         PGPw==
X-Gm-Message-State: AOJu0YyS26WMqQobX743GbPegCWSfEP2KR5fxsY03ZyEEWPw5Z2tg/fo
	jl/oENKog+Cb1wDFAPKzq3zYXSohHT86JFh3M9Vje1mMVdrE8S50Fu+82JDAX/BjlSv5yvVjUIu
	d1W0a/Jyzroq5O+YK3mdXha+83HcV8pdQ/8m/xRk7KGJaoZVFDms=
X-Gm-Gg: ASbGncuOrAICLBdGthkULBWHEnW8z+DjTwTmxGF9VYj0KcJCZr1DueHW+Ct8F7mnIPZ
	ZiJ6XRW584FYWduhosgLxkV6KyDludN0PHpNvcIvSwdtCBSjZ4Ocg5D+LESlPDVhqLEU6fbY1F3
	KPQ4idRPSaSsPVVQO18trIrQ==
X-Google-Smtp-Source: AGHT+IHR651bSbgRsrgI4pqhW4FJ2gBp7vsB8vRUUplQkk3pN57W4A2L/ufvRxL6KIFYTuzEWQqltuyOfqc4R/egQjA=
X-Received: by 2002:a05:6808:159a:b0:3f7:c2f9:43f4 with SMTP id
 5614622812f47-400736d9b1fmr1093067b6e.18.1744189066898; Wed, 09 Apr 2025
 01:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250321103258.37425-1-frediano.ziglio@cloud.com>
In-Reply-To: <20250321103258.37425-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 9 Apr 2025 09:57:35 +0100
X-Gm-Features: ATxdqUHazeVxPOaWT4Q-gDvp5YdSftndRcnsI8J3YN_nAXgE0m5CnMjZFY7mza4
Message-ID: <CACHz=Zgtcbd0P0Pp7p1mAMA4ivbdELn4BUUaP_VdWwXdkhiuWw@mail.gmail.com>
Subject: Re: [PATCH v7] Avoid crash calling PrintErrMesg from efi_multiboot2
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Fri, Mar 21, 2025 at 10:33=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> Although code is compiled with -fpic option data is not position
> independent. This causes data pointer to become invalid if
> code is not relocated properly which is what happens for
> efi_multiboot2 which is called by multiboot entry code.
>
> Code tested adding
>    PrintErrMesg(L"Test message", EFI_BUFFER_TOO_SMALL);
> in efi_multiboot2 before calling efi_arch_edd (this function
> can potentially call PrintErrMesg).
>
> Before the patch (XenServer installation on Qemu, xen replaced
> with vanilla xen.gz):
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: !!!! X64 Exception Type - 0E(#PF - Page-Fault)  CPU Apic =
ID - 00000000 !!!!
>   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
>   RIP  - 000000007EE21E9A, CS  - 0000000000000038, RFLAGS - 0000000000210=
246
>   RAX  - 000000007FF0C1B5, RCX - 0000000000000050, RDX - 0000000000000010
>   RBX  - 0000000000000000, RSP - 000000007FF0C180, RBP - 000000007FF0C210
>   RSI  - FFFF82D040467CE8, RDI - 0000000000000000
>   R8   - 000000007FF0C1C8, R9  - 000000007FF0C1C0, R10 - 0000000000000000
>   R11  - 0000000000001020, R12 - FFFF82D040467CE8, R13 - 000000007FF0C1B8
>   R14  - 000000007EA33328, R15 - 000000007EA332D8
>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>   GS   - 0000000000000030, SS  - 0000000000000030
>   CR0  - 0000000080010033, CR2 - FFFF82D040467CE8, CR3 - 000000007FC01000
>   CR4  - 0000000000000668, CR8 - 0000000000000000
>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>   GDTR - 000000007F9DB000 0000000000000047, LDTR - 0000000000000000
>   IDTR - 000000007F48E018 0000000000000FFF,   TR - 0000000000000000
>   FXSAVE_STATE - 000000007FF0BDE0
>   !!!! Find image based on IP(0x7EE21E9A) (No PDB)  (ImageBase=3D00000000=
7EE20000, EntryPoint=3D000000007EE23935) !!!!
>
> After the patch:
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: Buffer too small
>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF=
6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4A=
F6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>
> This partially rollback commit 00d5d5ce23e6.
>
> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platfo=
rms")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v1:
> - added "Fixes:" tag;
> - fixed cast style change.
>
> Changes since v2:
> - wrap long line.
>
> Changes since v3:
> - fixed "Fixes:" tag.
>
> Changes since v4:
> - use switch instead of tables.
>
> Changes since v5:
> - added -fno-jump-tables option.
>
> Changes since v6:
> - rebased.
> ---
>  xen/common/efi/boot.c        | 58 ++++++++++++++++++++++++------------
>  xen/common/efi/efi-common.mk |  1 +
>  2 files changed, 40 insertions(+), 19 deletions(-)
>
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index efbec00af9..143b5681ba 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -287,33 +287,53 @@ static bool __init match_guid(const EFI_GUID *guid1=
, const EFI_GUID *guid2)
>  /* generic routine for printing error messages */
>  static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode)
>  {
> -    static const CHAR16* const ErrCodeToStr[] __initconstrel =3D {
> -        [~EFI_ERROR_MASK & EFI_NOT_FOUND]           =3D L"Not found",
> -        [~EFI_ERROR_MASK & EFI_NO_MEDIA]            =3D L"The device has=
 no media",
> -        [~EFI_ERROR_MASK & EFI_MEDIA_CHANGED]       =3D L"Media changed"=
,
> -        [~EFI_ERROR_MASK & EFI_DEVICE_ERROR]        =3D L"Device error",
> -        [~EFI_ERROR_MASK & EFI_VOLUME_CORRUPTED]    =3D L"Volume corrupt=
ed",
> -        [~EFI_ERROR_MASK & EFI_ACCESS_DENIED]       =3D L"Access denied"=
,
> -        [~EFI_ERROR_MASK & EFI_OUT_OF_RESOURCES]    =3D L"Out of resourc=
es",
> -        [~EFI_ERROR_MASK & EFI_VOLUME_FULL]         =3D L"Volume is full=
",
> -        [~EFI_ERROR_MASK & EFI_SECURITY_VIOLATION]  =3D L"Security viola=
tion",
> -        [~EFI_ERROR_MASK & EFI_CRC_ERROR]           =3D L"CRC error",
> -        [~EFI_ERROR_MASK & EFI_COMPROMISED_DATA]    =3D L"Compromised da=
ta",
> -        [~EFI_ERROR_MASK & EFI_BUFFER_TOO_SMALL]    =3D L"Buffer too sma=
ll",
> -    };
> -    EFI_STATUS ErrIdx =3D ErrCode & ~EFI_ERROR_MASK;
> -
>      StdOut =3D StdErr;
>      PrintErr(mesg);
>      PrintErr(L": ");
>
> -    if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
> -        mesg =3D ErrCodeToStr[ErrIdx];
> -    else
> +    switch (ErrCode)
>      {
> +    case EFI_NOT_FOUND:
> +        mesg =3D L"Not found";
> +        break;
> +    case EFI_NO_MEDIA:
> +        mesg =3D L"The device has no media";
> +        break;
> +    case EFI_MEDIA_CHANGED:
> +        mesg =3D L"Media changed";
> +        break;
> +    case EFI_DEVICE_ERROR:
> +        mesg =3D L"Device error";
> +        break;
> +    case EFI_VOLUME_CORRUPTED:
> +        mesg =3D L"Volume corrupted";
> +        break;
> +    case EFI_ACCESS_DENIED:
> +        mesg =3D L"Access denied";
> +        break;
> +    case EFI_OUT_OF_RESOURCES:
> +        mesg =3D L"Out of resources";
> +        break;
> +    case EFI_VOLUME_FULL:
> +        mesg =3D L"Volume is full";
> +        break;
> +    case EFI_SECURITY_VIOLATION:
> +        mesg =3D L"Security violation";
> +        break;
> +    case EFI_CRC_ERROR:
> +        mesg =3D L"CRC error";
> +        break;
> +    case EFI_COMPROMISED_DATA:
> +        mesg =3D L"Compromised data";
> +        break;
> +    case EFI_BUFFER_TOO_SMALL:
> +        mesg =3D L"Buffer too small";
> +        break;
> +    default:
>          PrintErr(L"ErrCode: ");
>          DisplayUint(ErrCode, 0);
>          mesg =3D NULL;
> +        break;
>      }
>      blexit(mesg);
>  }
> diff --git a/xen/common/efi/efi-common.mk b/xen/common/efi/efi-common.mk
> index 23cafcf20c..06b1c19674 100644
> --- a/xen/common/efi/efi-common.mk
> +++ b/xen/common/efi/efi-common.mk
> @@ -2,6 +2,7 @@ EFIOBJ-y :=3D boot.init.o pe.init.o ebmalloc.o runtime.o
>  EFIOBJ-$(CONFIG_COMPAT) +=3D compat.o
>
>  CFLAGS-y +=3D -fshort-wchar
> +CFLAGS-y +=3D -fno-jump-tables
>  CFLAGS-y +=3D -iquote $(srctree)/common/efi
>  CFLAGS-y +=3D -iquote $(srcdir)
>
> --
> 2.43.0
>

