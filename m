Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E56C963F6B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 11:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785559.1195044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjb4A-0002bq-4P; Thu, 29 Aug 2024 09:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785559.1195044; Thu, 29 Aug 2024 09:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjb4A-0002aK-1d; Thu, 29 Aug 2024 09:03:42 +0000
Received: by outflank-mailman (input) for mailman id 785559;
 Thu, 29 Aug 2024 09:03:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dlBE=P4=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sjb49-0002aE-3W
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 09:03:41 +0000
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [2607:f8b0:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94bb3110-65e5-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 11:03:39 +0200 (CEST)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-70f5cd2fa39so305025a34.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 02:03:39 -0700 (PDT)
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
X-Inumbo-ID: 94bb3110-65e5-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1724922218; x=1725527018; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1UfUkHSnxo95nom+0+6Wz5KcQR7geXrg9ZJx9j7Z5k=;
        b=AL/zwxLQsNvnk8YE2yUEDPndoItN+RQx5C5YpP7PIVknpD6YMydQWV/nwFVsQV7rf6
         DqgSh8zCdKahyVZH98+0A5fjzD4t+aPe2jWa0UcMu9nCEFNgMBWyXMg24BGa0s88RHwP
         s1D/+yZObW5PzTxi/9djFA1DEXRfG67Gs9lGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724922218; x=1725527018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1UfUkHSnxo95nom+0+6Wz5KcQR7geXrg9ZJx9j7Z5k=;
        b=G49nH6478egFkRnrhnNBf1cGOeT1KIBgGkvGgk8iYlBXliGVPdnBe2kNXFLZqr8BFK
         GdAzJ+C/V8G6zqmjIzb0+66rInXmqcfKsmJ0JwCXhkR2bpQf9S6ZvbuFjnQH4AMrTp74
         MaI/J9rNEoOtcW0vNS1c+5WKIIzVO1bvq+grCuFDQ4nG559qqy3XL/njRqefJI7DWtb/
         qZVXKFEEkx1/g1QF6kgNGYxI+yVtJHy4BTB/qLGOSGetgozdYiPlehVcX9/42Kh21mi3
         nl9brHSEySdsZSO5pYd/j56RVK4UBw4XQtdG37JG303zSwqpue0Q3nft+NWI4vQ7DroD
         pOog==
X-Gm-Message-State: AOJu0YyUdjpBdfBG/tM7WefjWEIYmF9B0IAghf87Kfd/+lE6C+/NFETf
	iEZ2wYhF/I+7kmYb/OxDD9mc7ORtD0ochagxqHnMN0zMccR4B43QX9GbCA1Dx9aKjN126MJy4+r
	FODLoKEVvlrgUj1Qycwr0iMOUUcpRP6T5LaPfmlr5Q0m7wZ2O
X-Google-Smtp-Source: AGHT+IFCsymf4AGydbDTCL8zxZEHbpt7xd57FyYY98NGyLgP59zy1DObh3LU8LJKYLx7n6XIHGJcIr+UG8LYm89FUq4=
X-Received: by 2002:a05:6870:350b:b0:260:fd64:60f2 with SMTP id
 586e51a60fabf-27790074658mr2167707fac.8.1724922218056; Thu, 29 Aug 2024
 02:03:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240819142953.415817-1-frediano.ziglio@cloud.com>
In-Reply-To: <20240819142953.415817-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 29 Aug 2024 10:03:27 +0100
Message-ID: <CACHz=ZiR3xnhdUu37xL7hsKCNSRsUsNNsxALVvWUbkt3FzkGQA@mail.gmail.com>
Subject: Re: [PATCH v4] Avoid crash calling PrintErrMesg from efi_multiboot2
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 3:30=E2=80=AFPM Frediano Ziglio
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
>   RIP  - 000000007DC29E46, CS  - 0000000000000038, RFLAGS - 0000000000210=
246
>   RAX  - 0000000000000000, RCX - 0000000000000050, RDX - 0000000000000000
>   RBX  - 000000007DAB4558, RSP - 000000007EFA1200, RBP - 0000000000000000
>   RSI  - FFFF82D040467A88, RDI - 0000000000000000
>   R8   - 000000007EFA1238, R9  - 000000007EFA1230, R10 - 0000000000000000
>   R11  - 000000007CF42665, R12 - FFFF82D040467A88, R13 - 000000007EFA1228
>   R14  - 000000007EFA1225, R15 - 000000007DAB45A8
>   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 0000000000000030
>   GS   - 0000000000000030, SS  - 0000000000000030
>   CR0  - 0000000080010033, CR2 - FFFF82D040467A88, CR3 - 000000007EC01000
>   CR4  - 0000000000000668, CR8 - 0000000000000000
>   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 0000000000000000
>   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 0000000000000400
>   GDTR - 000000007E9E2000 0000000000000047, LDTR - 0000000000000000
>   IDTR - 000000007E4E5018 0000000000000FFF,   TR - 0000000000000000
>   FXSAVE_STATE - 000000007EFA0E60
>   !!!! Find image based on IP(0x7DC29E46) (No PDB)  (ImageBase=3D00000000=
7DC28000, EntryPoint=3D000000007DC2B917) !!!!
>
> After the patch:
>   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
>   Test message: Buffer too small
>   BdsDxe: loading Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF=
6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>   BdsDxe: starting Boot0000 "UiApp" from Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4A=
F6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)
>
> Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI platfo=
rms")
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/common/efi/boot.c | 46 ++++++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 14 deletions(-)
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
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index efbec00af9..fdbe75005c 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -287,19 +287,36 @@ static bool __init match_guid(const EFI_GUID *guid1=
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
> +#define ERROR_MESSAGE_LIST \
> +    ERROR_MESSAGE(EFI_NOT_FOUND, "Not found") \
> +    ERROR_MESSAGE(EFI_NO_MEDIA, "The device has no media") \
> +    ERROR_MESSAGE(EFI_MEDIA_CHANGED, "Media changed") \
> +    ERROR_MESSAGE(EFI_DEVICE_ERROR, "Device error") \
> +    ERROR_MESSAGE(EFI_VOLUME_CORRUPTED, "Volume corrupted") \
> +    ERROR_MESSAGE(EFI_ACCESS_DENIED, "Access denied") \
> +    ERROR_MESSAGE(EFI_OUT_OF_RESOURCES, "Out of resources") \
> +    ERROR_MESSAGE(EFI_VOLUME_FULL, "Volume is full") \
> +    ERROR_MESSAGE(EFI_SECURITY_VIOLATION, "Security violation") \
> +    ERROR_MESSAGE(EFI_CRC_ERROR, "CRC error") \
> +    ERROR_MESSAGE(EFI_COMPROMISED_DATA, "Compromised data") \
> +    ERROR_MESSAGE(EFI_BUFFER_TOO_SMALL, "Buffer too small")
> +
> +    static const struct ErrorStrings {
> +        CHAR16 start;
> +#undef ERROR_MESSAGE
> +#define ERROR_MESSAGE(code, str) CHAR16 msg_ ## code[sizeof(str)];
> +        ERROR_MESSAGE_LIST
> +    } ErrorStrings __initconst =3D {
> +        0
> +#undef ERROR_MESSAGE
> +#define ERROR_MESSAGE(code, str) , L ## str
> +        ERROR_MESSAGE_LIST
> +    };
> +    static const uint16_t ErrCodeToStr[] __initconst =3D {
> +#undef ERROR_MESSAGE
> +#define ERROR_MESSAGE(code, str) \
> +        [~EFI_ERROR_MASK & code] =3D offsetof(struct ErrorStrings, msg_ =
## code),
> +        ERROR_MESSAGE_LIST
>      };
>      EFI_STATUS ErrIdx =3D ErrCode & ~EFI_ERROR_MASK;
>
> @@ -308,7 +325,8 @@ static void __init PrintErrMesg(const CHAR16 *mesg, E=
FI_STATUS ErrCode)
>      PrintErr(L": ");
>
>      if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
> -        mesg =3D ErrCodeToStr[ErrIdx];
> +        mesg =3D (const CHAR16 *)((const void *)&ErrorStrings +
> +                                ErrCodeToStr[ErrIdx]);
>      else
>      {
>          PrintErr(L"ErrCode: ");

Any update on this?

Frediano

