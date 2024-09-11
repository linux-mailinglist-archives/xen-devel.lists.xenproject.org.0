Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F45974E34
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 11:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796303.1205826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJPk-0008Q9-Eg; Wed, 11 Sep 2024 09:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796303.1205826; Wed, 11 Sep 2024 09:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJPk-0008Nl-BU; Wed, 11 Sep 2024 09:13:28 +0000
Received: by outflank-mailman (input) for mailman id 796303;
 Wed, 11 Sep 2024 09:13:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2J2y=QJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1soJPj-0008Nf-49
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 09:13:27 +0000
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [2607:f8b0:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18c397b1-701e-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 11:13:24 +0200 (CEST)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3e05a5f21afso774598b6e.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 02:13:24 -0700 (PDT)
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
X-Inumbo-ID: 18c397b1-701e-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726046003; x=1726650803; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XWtOm2i4kIun5WavkseRBmSa2T/9SO8uSaWC/sUng6Y=;
        b=FGgnnPxdlpugzH5h2DYE/ECbgv5jwvQNJEUwW4ZhoNW5TuIZzEj8eb8IqT7DbtJ0J8
         s4kGxrCE18kV7wHbpCQTn9c8uFPZN+LvyT9znys61r1Ov42ZmJPXQ9q3AX6yhtME10n3
         eK1obZSO4Lf5eRPNgKjToh/F9VFkChpo058Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726046003; x=1726650803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWtOm2i4kIun5WavkseRBmSa2T/9SO8uSaWC/sUng6Y=;
        b=VJFrWZe8a6fdh/gatESRpWL0/vGcWRIDHuZbnCOkJ7Qbb1u8b+ILvZy1Bc6RfEr/g8
         d/25t0MUG66Y3pduE0Ok5Fw8ueapR+TLrxnGXyLXYSFS7orpP2dAidAh/RC/oyXg1nb8
         7f0l6ysmw0Eqp4heS6CmIIO/4ywWfw1Yk5MZjMemDXAGU5/iqBTISDskw6MWxDpvV4fa
         IgQ8tL3PltqhD5xm5PDgGohuVzmb8JeNg7Tdl+Wr3X6EI45Ftn7qRiY4qiEXNOCyaMb6
         JpDeVtcpYgl3/iSf/+lKSX1U0p6zFkjCV0T5fO0WqHlt1CZWLc4s8OOI3njDyp1WfnhC
         yJuQ==
X-Gm-Message-State: AOJu0YyYrzxmtMT1ElNvVhiwLC9ZJyI1S7MqD08qPYBymM7FNjSNqg5q
	UAcded4kk0eHuUQZmsWDwowGVQ+HH8HISPLfpFZTsjRZzQJuAwLHJsEHPKowAMYA263GwL01Uhr
	qYKX2fLEjN7azZBtMhfy9Gb1ZbW4mkxorH3iwlhStL419Ixjq
X-Google-Smtp-Source: AGHT+IFysV7avytSGm1my1fNC4OktqmDfvRPFJj58lgrV+DRjKJTnx/+2iumH/fw52uXBx4+iPCYciUqYjg1X1HnekU=
X-Received: by 2002:a05:6808:1a2a:b0:3e0:c13:9837 with SMTP id
 5614622812f47-3e037ae4bddmr9197346b6e.37.1726046003076; Wed, 11 Sep 2024
 02:13:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240819142953.415817-1-frediano.ziglio@cloud.com> <CACHz=ZiR3xnhdUu37xL7hsKCNSRsUsNNsxALVvWUbkt3FzkGQA@mail.gmail.com>
In-Reply-To: <CACHz=ZiR3xnhdUu37xL7hsKCNSRsUsNNsxALVvWUbkt3FzkGQA@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 11 Sep 2024 10:13:12 +0100
Message-ID: <CACHz=ZhAd=a02gaQS6AOVZMWQQfJ3GiODjCRv0Ze73S8vEWo-g@mail.gmail.com>
Subject: Re: [PATCH v4] Avoid crash calling PrintErrMesg from efi_multiboot2
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000e13c260621d46676"

--000000000000e13c260621d46676
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 10:03=E2=80=AFAM Frediano Ziglio <frediano.ziglio@c=
loud.com>
wrote:

> On Mon, Aug 19, 2024 at 3:30=E2=80=AFPM Frediano Ziglio
> <frediano.ziglio@cloud.com> wrote:
> >
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
c
> ID - 00000000 !!!!
> >   ExceptionData - 0000000000000000  I:0 R:0 U:0 W:0 P:0 PK:0 SS:0 SGX:0
> >   RIP  - 000000007DC29E46, CS  - 0000000000000038, RFLAGS -
> 0000000000210246
> >   RAX  - 0000000000000000, RCX - 0000000000000050, RDX - 00000000000000=
00
> >   RBX  - 000000007DAB4558, RSP - 000000007EFA1200, RBP - 00000000000000=
00
> >   RSI  - FFFF82D040467A88, RDI - 0000000000000000
> >   R8   - 000000007EFA1238, R9  - 000000007EFA1230, R10 - 00000000000000=
00
> >   R11  - 000000007CF42665, R12 - FFFF82D040467A88, R13 - 000000007EFA12=
28
> >   R14  - 000000007EFA1225, R15 - 000000007DAB45A8
> >   DS   - 0000000000000030, ES  - 0000000000000030, FS  - 00000000000000=
30
> >   GS   - 0000000000000030, SS  - 0000000000000030
> >   CR0  - 0000000080010033, CR2 - FFFF82D040467A88, CR3 - 000000007EC010=
00
> >   CR4  - 0000000000000668, CR8 - 0000000000000000
> >   DR0  - 0000000000000000, DR1 - 0000000000000000, DR2 - 00000000000000=
00
> >   DR3  - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 - 00000000000004=
00
> >   GDTR - 000000007E9E2000 0000000000000047, LDTR - 0000000000000000
> >   IDTR - 000000007E4E5018 0000000000000FFF,   TR - 0000000000000000
> >   FXSAVE_STATE - 000000007EFA0E60
> >   !!!! Find image based on IP(0x7DC29E46) (No PDB)
> (ImageBase=3D000000007DC28000, EntryPoint=3D000000007DC2B917) !!!!
> >
> > After the patch:
> >   Booting `XenServer (Serial)'Booting `XenServer (Serial)'
> >   Test message: Buffer too small
> >   BdsDxe: loading Boot0000 "UiApp" from
> Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8=
AB6F4662331)
> >   BdsDxe: starting Boot0000 "UiApp" from
> Fv(7CB8BDC9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8=
AB6F4662331)
> >
> > Fixes: 9180f5365524 ("x86: add multiboot2 protocol support for EFI
> platforms")
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  xen/common/efi/boot.c | 46 ++++++++++++++++++++++++++++++-------------
> >  1 file changed, 32 insertions(+), 14 deletions(-)
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
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index efbec00af9..fdbe75005c 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -287,19 +287,36 @@ static bool __init match_guid(const EFI_GUID
> *guid1, const EFI_GUID *guid2)
> >  /* generic routine for printing error messages */
> >  static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCode=
)
> >  {
> > -    static const CHAR16* const ErrCodeToStr[] __initconstrel =3D {
> > -        [~EFI_ERROR_MASK & EFI_NOT_FOUND]           =3D L"Not found",
> > -        [~EFI_ERROR_MASK & EFI_NO_MEDIA]            =3D L"The device h=
as
> no media",
> > -        [~EFI_ERROR_MASK & EFI_MEDIA_CHANGED]       =3D L"Media change=
d",
> > -        [~EFI_ERROR_MASK & EFI_DEVICE_ERROR]        =3D L"Device error=
",
> > -        [~EFI_ERROR_MASK & EFI_VOLUME_CORRUPTED]    =3D L"Volume
> corrupted",
> > -        [~EFI_ERROR_MASK & EFI_ACCESS_DENIED]       =3D L"Access denie=
d",
> > -        [~EFI_ERROR_MASK & EFI_OUT_OF_RESOURCES]    =3D L"Out of
> resources",
> > -        [~EFI_ERROR_MASK & EFI_VOLUME_FULL]         =3D L"Volume is fu=
ll",
> > -        [~EFI_ERROR_MASK & EFI_SECURITY_VIOLATION]  =3D L"Security
> violation",
> > -        [~EFI_ERROR_MASK & EFI_CRC_ERROR]           =3D L"CRC error",
> > -        [~EFI_ERROR_MASK & EFI_COMPROMISED_DATA]    =3D L"Compromised
> data",
> > -        [~EFI_ERROR_MASK & EFI_BUFFER_TOO_SMALL]    =3D L"Buffer too
> small",
> > +#define ERROR_MESSAGE_LIST \
> > +    ERROR_MESSAGE(EFI_NOT_FOUND, "Not found") \
> > +    ERROR_MESSAGE(EFI_NO_MEDIA, "The device has no media") \
> > +    ERROR_MESSAGE(EFI_MEDIA_CHANGED, "Media changed") \
> > +    ERROR_MESSAGE(EFI_DEVICE_ERROR, "Device error") \
> > +    ERROR_MESSAGE(EFI_VOLUME_CORRUPTED, "Volume corrupted") \
> > +    ERROR_MESSAGE(EFI_ACCESS_DENIED, "Access denied") \
> > +    ERROR_MESSAGE(EFI_OUT_OF_RESOURCES, "Out of resources") \
> > +    ERROR_MESSAGE(EFI_VOLUME_FULL, "Volume is full") \
> > +    ERROR_MESSAGE(EFI_SECURITY_VIOLATION, "Security violation") \
> > +    ERROR_MESSAGE(EFI_CRC_ERROR, "CRC error") \
> > +    ERROR_MESSAGE(EFI_COMPROMISED_DATA, "Compromised data") \
> > +    ERROR_MESSAGE(EFI_BUFFER_TOO_SMALL, "Buffer too small")
> > +
> > +    static const struct ErrorStrings {
> > +        CHAR16 start;
> > +#undef ERROR_MESSAGE
> > +#define ERROR_MESSAGE(code, str) CHAR16 msg_ ## code[sizeof(str)];
> > +        ERROR_MESSAGE_LIST
> > +    } ErrorStrings __initconst =3D {
> > +        0
> > +#undef ERROR_MESSAGE
> > +#define ERROR_MESSAGE(code, str) , L ## str
> > +        ERROR_MESSAGE_LIST
> > +    };
> > +    static const uint16_t ErrCodeToStr[] __initconst =3D {
> > +#undef ERROR_MESSAGE
> > +#define ERROR_MESSAGE(code, str) \
> > +        [~EFI_ERROR_MASK & code] =3D offsetof(struct ErrorStrings, msg=
_
> ## code),
> > +        ERROR_MESSAGE_LIST
> >      };
> >      EFI_STATUS ErrIdx =3D ErrCode & ~EFI_ERROR_MASK;
> >
> > @@ -308,7 +325,8 @@ static void __init PrintErrMesg(const CHAR16 *mesg,
> EFI_STATUS ErrCode)
> >      PrintErr(L": ");
> >
> >      if( (ErrIdx < ARRAY_SIZE(ErrCodeToStr)) && ErrCodeToStr[ErrIdx] )
> > -        mesg =3D ErrCodeToStr[ErrIdx];
> > +        mesg =3D (const CHAR16 *)((const void *)&ErrorStrings +
> > +                                ErrCodeToStr[ErrIdx]);
> >      else
> >      {
> >          PrintErr(L"ErrCode: ");
>
> Any update on this?
>
>
ping

The issue still apply, checked that I addressed all comments.

Frediano

--000000000000e13c260621d46676
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Aug 29, 2024 at 10:03=E2=80=AFAM Frediano Ziglio &lt;<a href=
=3D"mailto:frediano.ziglio@cloud.com">frediano.ziglio@cloud.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Aug =
19, 2024 at 3:30=E2=80=AFPM Frediano Ziglio<br>
&lt;<a href=3D"mailto:frediano.ziglio@cloud.com" target=3D"_blank">frediano=
.ziglio@cloud.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Although code is compiled with -fpic option data is not position<br>
&gt; independent. This causes data pointer to become invalid if<br>
&gt; code is not relocated properly which is what happens for<br>
&gt; efi_multiboot2 which is called by multiboot entry code.<br>
&gt;<br>
&gt; Code tested adding<br>
&gt;=C2=A0 =C2=A0 PrintErrMesg(L&quot;Test message&quot;, EFI_BUFFER_TOO_SM=
ALL);<br>
&gt; in efi_multiboot2 before calling efi_arch_edd (this function<br>
&gt; can potentially call PrintErrMesg).<br>
&gt;<br>
&gt; Before the patch (XenServer installation on Qemu, xen replaced<br>
&gt; with vanilla xen.gz):<br>
&gt;=C2=A0 =C2=A0Booting `XenServer (Serial)&#39;Booting `XenServer (Serial=
)&#39;<br>
&gt;=C2=A0 =C2=A0Test message: !!!! X64 Exception Type - 0E(#PF - Page-Faul=
t)=C2=A0 CPU Apic ID - 00000000 !!!!<br>
&gt;=C2=A0 =C2=A0ExceptionData - 0000000000000000=C2=A0 I:0 R:0 U:0 W:0 P:0=
 PK:0 SS:0 SGX:0<br>
&gt;=C2=A0 =C2=A0RIP=C2=A0 - 000000007DC29E46, CS=C2=A0 - 0000000000000038,=
 RFLAGS - 0000000000210246<br>
&gt;=C2=A0 =C2=A0RAX=C2=A0 - 0000000000000000, RCX - 0000000000000050, RDX =
- 0000000000000000<br>
&gt;=C2=A0 =C2=A0RBX=C2=A0 - 000000007DAB4558, RSP - 000000007EFA1200, RBP =
- 0000000000000000<br>
&gt;=C2=A0 =C2=A0RSI=C2=A0 - FFFF82D040467A88, RDI - 0000000000000000<br>
&gt;=C2=A0 =C2=A0R8=C2=A0 =C2=A0- 000000007EFA1238, R9=C2=A0 - 000000007EFA=
1230, R10 - 0000000000000000<br>
&gt;=C2=A0 =C2=A0R11=C2=A0 - 000000007CF42665, R12 - FFFF82D040467A88, R13 =
- 000000007EFA1228<br>
&gt;=C2=A0 =C2=A0R14=C2=A0 - 000000007EFA1225, R15 - 000000007DAB45A8<br>
&gt;=C2=A0 =C2=A0DS=C2=A0 =C2=A0- 0000000000000030, ES=C2=A0 - 000000000000=
0030, FS=C2=A0 - 0000000000000030<br>
&gt;=C2=A0 =C2=A0GS=C2=A0 =C2=A0- 0000000000000030, SS=C2=A0 - 000000000000=
0030<br>
&gt;=C2=A0 =C2=A0CR0=C2=A0 - 0000000080010033, CR2 - FFFF82D040467A88, CR3 =
- 000000007EC01000<br>
&gt;=C2=A0 =C2=A0CR4=C2=A0 - 0000000000000668, CR8 - 0000000000000000<br>
&gt;=C2=A0 =C2=A0DR0=C2=A0 - 0000000000000000, DR1 - 0000000000000000, DR2 =
- 0000000000000000<br>
&gt;=C2=A0 =C2=A0DR3=C2=A0 - 0000000000000000, DR6 - 00000000FFFF0FF0, DR7 =
- 0000000000000400<br>
&gt;=C2=A0 =C2=A0GDTR - 000000007E9E2000 0000000000000047, LDTR - 000000000=
0000000<br>
&gt;=C2=A0 =C2=A0IDTR - 000000007E4E5018 0000000000000FFF,=C2=A0 =C2=A0TR -=
 0000000000000000<br>
&gt;=C2=A0 =C2=A0FXSAVE_STATE - 000000007EFA0E60<br>
&gt;=C2=A0 =C2=A0!!!! Find image based on IP(0x7DC29E46) (No PDB)=C2=A0 (Im=
ageBase=3D000000007DC28000, EntryPoint=3D000000007DC2B917) !!!!<br>
&gt;<br>
&gt; After the patch:<br>
&gt;=C2=A0 =C2=A0Booting `XenServer (Serial)&#39;Booting `XenServer (Serial=
)&#39;<br>
&gt;=C2=A0 =C2=A0Test message: Buffer too small<br>
&gt;=C2=A0 =C2=A0BdsDxe: loading Boot0000 &quot;UiApp&quot; from Fv(7CB8BDC=
9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331)=
<br>
&gt;=C2=A0 =C2=A0BdsDxe: starting Boot0000 &quot;UiApp&quot; from Fv(7CB8BD=
C9-F8EB-4F34-AAEA-3EE4AF6516A1)/FvFile(462CAA21-7614-4503-836E-8AB6F4662331=
)<br>
&gt;<br>
&gt; Fixes: 9180f5365524 (&quot;x86: add multiboot2 protocol support for EF=
I platforms&quot;)<br>
&gt; Signed-off-by: Frediano Ziglio &lt;<a href=3D"mailto:frediano.ziglio@c=
loud.com" target=3D"_blank">frediano.ziglio@cloud.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 xen/common/efi/boot.c | 46 ++++++++++++++++++++++++++++++-------=
------<br>
&gt;=C2=A0 1 file changed, 32 insertions(+), 14 deletions(-)<br>
&gt; ---<br>
&gt; Changes since v1:<br>
&gt; - added &quot;Fixes:&quot; tag;<br>
&gt; - fixed cast style change.<br>
&gt;<br>
&gt; Changes since v2:<br>
&gt; - wrap long line.<br>
&gt;<br>
&gt; Changes since v3:<br>
&gt; - fixed &quot;Fixes:&quot; tag.<br>
&gt;<br>
&gt; diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c<br>
&gt; index efbec00af9..fdbe75005c 100644<br>
&gt; --- a/xen/common/efi/boot.c<br>
&gt; +++ b/xen/common/efi/boot.c<br>
&gt; @@ -287,19 +287,36 @@ static bool __init match_guid(const EFI_GUID *gu=
id1, const EFI_GUID *guid2)<br>
&gt;=C2=A0 /* generic routine for printing error messages */<br>
&gt;=C2=A0 static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS E=
rrCode)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 static const CHAR16* const ErrCodeToStr[] __initconstre=
l =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; EFI_NOT_FOUND]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D L&quot;Not found&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; EFI_NO_MEDIA]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D L&quot;The device has no media&q=
uot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; EFI_MEDIA_CHANGED]=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D L&quot;Media changed&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; EFI_DEVICE_ERROR]=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D L&quot;Device error&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; EFI_VOLUME_CORRUPT=
ED]=C2=A0 =C2=A0 =3D L&quot;Volume corrupted&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; EFI_ACCESS_DENIED]=
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D L&quot;Access denied&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; EFI_OUT_OF_RESOURC=
ES]=C2=A0 =C2=A0 =3D L&quot;Out of resources&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; EFI_VOLUME_FULL]=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D L&quot;Volume is full&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; EFI_SECURITY_VIOLA=
TION]=C2=A0 =3D L&quot;Security violation&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; EFI_CRC_ERROR]=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D L&quot;CRC error&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; EFI_COMPROMISED_DA=
TA]=C2=A0 =C2=A0 =3D L&quot;Compromised data&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; EFI_BUFFER_TOO_SMA=
LL]=C2=A0 =C2=A0 =3D L&quot;Buffer too small&quot;,<br>
&gt; +#define ERROR_MESSAGE_LIST \<br>
&gt; +=C2=A0 =C2=A0 ERROR_MESSAGE(EFI_NOT_FOUND, &quot;Not found&quot;) \<b=
r>
&gt; +=C2=A0 =C2=A0 ERROR_MESSAGE(EFI_NO_MEDIA, &quot;The device has no med=
ia&quot;) \<br>
&gt; +=C2=A0 =C2=A0 ERROR_MESSAGE(EFI_MEDIA_CHANGED, &quot;Media changed&qu=
ot;) \<br>
&gt; +=C2=A0 =C2=A0 ERROR_MESSAGE(EFI_DEVICE_ERROR, &quot;Device error&quot=
;) \<br>
&gt; +=C2=A0 =C2=A0 ERROR_MESSAGE(EFI_VOLUME_CORRUPTED, &quot;Volume corrup=
ted&quot;) \<br>
&gt; +=C2=A0 =C2=A0 ERROR_MESSAGE(EFI_ACCESS_DENIED, &quot;Access denied&qu=
ot;) \<br>
&gt; +=C2=A0 =C2=A0 ERROR_MESSAGE(EFI_OUT_OF_RESOURCES, &quot;Out of resour=
ces&quot;) \<br>
&gt; +=C2=A0 =C2=A0 ERROR_MESSAGE(EFI_VOLUME_FULL, &quot;Volume is full&quo=
t;) \<br>
&gt; +=C2=A0 =C2=A0 ERROR_MESSAGE(EFI_SECURITY_VIOLATION, &quot;Security vi=
olation&quot;) \<br>
&gt; +=C2=A0 =C2=A0 ERROR_MESSAGE(EFI_CRC_ERROR, &quot;CRC error&quot;) \<b=
r>
&gt; +=C2=A0 =C2=A0 ERROR_MESSAGE(EFI_COMPROMISED_DATA, &quot;Compromised d=
ata&quot;) \<br>
&gt; +=C2=A0 =C2=A0 ERROR_MESSAGE(EFI_BUFFER_TOO_SMALL, &quot;Buffer too sm=
all&quot;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 static const struct ErrorStrings {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 CHAR16 start;<br>
&gt; +#undef ERROR_MESSAGE<br>
&gt; +#define ERROR_MESSAGE(code, str) CHAR16 msg_ ## code[sizeof(str)];<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR_MESSAGE_LIST<br>
&gt; +=C2=A0 =C2=A0 } ErrorStrings __initconst =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
&gt; +#undef ERROR_MESSAGE<br>
&gt; +#define ERROR_MESSAGE(code, str) , L ## str<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR_MESSAGE_LIST<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 static const uint16_t ErrCodeToStr[] __initconst =3D {<=
br>
&gt; +#undef ERROR_MESSAGE<br>
&gt; +#define ERROR_MESSAGE(code, str) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 [~EFI_ERROR_MASK &amp; code] =3D offsetof=
(struct ErrorStrings, msg_ ## code),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR_MESSAGE_LIST<br>
&gt;=C2=A0 =C2=A0 =C2=A0 };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EFI_STATUS ErrIdx =3D ErrCode &amp; ~EFI_ERROR_MAS=
K;<br>
&gt;<br>
&gt; @@ -308,7 +325,8 @@ static void __init PrintErrMesg(const CHAR16 *mesg=
, EFI_STATUS ErrCode)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PrintErr(L&quot;: &quot;);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if( (ErrIdx &lt; ARRAY_SIZE(ErrCodeToStr)) &amp;&a=
mp; ErrCodeToStr[ErrIdx] )<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mesg =3D ErrCodeToStr[ErrIdx];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 mesg =3D (const CHAR16 *)((const void *)&=
amp;ErrorStrings +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ErrCodeToStr[ErrIdx]);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PrintErr(L&quot;ErrCode: &quot;);<br=
>
<br>
Any update on this?<br>
<br></blockquote><div><br></div><div>ping</div><div><br></div><div>The issu=
e still apply, checked that I addressed all comments.<br></div><div><br></d=
iv>Frediano</div><div class=3D"gmail_quote"><br></div></div>

--000000000000e13c260621d46676--

