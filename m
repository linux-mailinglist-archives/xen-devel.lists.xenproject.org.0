Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0225B9C8C61
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 15:03:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836495.1252401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBaRB-00006H-SG; Thu, 14 Nov 2024 14:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836495.1252401; Thu, 14 Nov 2024 14:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBaRB-0008Ug-OC; Thu, 14 Nov 2024 14:03:09 +0000
Received: by outflank-mailman (input) for mailman id 836495;
 Thu, 14 Nov 2024 14:03:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Deeb=SJ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBaRA-0008Ua-UY
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 14:03:09 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a7c44c6-a291-11ef-99a3-01e77a169b0f;
 Thu, 14 Nov 2024 15:03:04 +0100 (CET)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-5ee645cf74fso300011eaf.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 06:03:04 -0800 (PST)
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
X-Inumbo-ID: 2a7c44c6-a291-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMmUiLCJoZWxvIjoibWFpbC1vbzEteGMyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJhN2M0NGM2LWEyOTEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNTkyOTg0LjY4NjM2Nywic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731592983; x=1732197783; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u52eQULRCKeN4kT/0W/hZOD1tJzfVFW14FTOZD1sjbg=;
        b=U2Pro9+TaTq14kVXaF8OH6ZPgQZp6OOVW4QkqkxY1kIsIAki7ccquypfwc8J9AwRMp
         QrLXH8aEH36m1yk0Cu4GUiHPG0gHBxXhwjB1N4O0AX/wuRFJUM5/1S/GNH1ChikED3t+
         r9Y+1U8iunJ7fdK6nSrl4XZTLWRMLxe1jMM8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731592983; x=1732197783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u52eQULRCKeN4kT/0W/hZOD1tJzfVFW14FTOZD1sjbg=;
        b=fFMQq8iKhCWVmmhiahAybe+dGUmMqqpjQe8qd4KYa/ajUMJKsV+nt/YVQ78/+z1SJC
         twi/DdYXMOxHTqPgsm7mIgi0eR4wp1jVF2nb1dHy9W9EiegGqfvA4lNb5karuHX9FCTU
         2DXTSXTdSHCNArQ4ezAROdXiT2V+t2p4gkQTOBWBZrXEhVsirob5JQgOj7oM6hq4QKqf
         rX2cXKl97tM7zOFd2FnpOqMLgSwNsVx3bh4GsWiEOywJ+l+btPj9JsZIgHRDR43DFddO
         FuPixuYxqb98pqAuGx0GqaoPu+J/1+iyvS7ks7DlonMA/Mv+5Dsdta0vgMqq7rvrYsJF
         32kg==
X-Forwarded-Encrypted: i=1; AJvYcCWg4qbGgRhxHQ0efjHVaaXax/wSmnWr9C82VfwcHBOuQTSSsYM/VzdkaYjjUNFJ9Iga9ZCOajvCKFI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/V6xYWVyhEvFYkkYXaTZrPTMXpXsYBTdGCNoVCCpBpSDMLCX3
	jvvMrMwm/A8nFupiQZk7NpWYcKL/DPbIlFCgTdL6vIct2ShKmyIdTiYlMOB0Mui8qrzJvVKYGqF
	/vdJKDxAtiVLNZZfZ+bRaeE9/culH1ilZTQPYdQ==
X-Google-Smtp-Source: AGHT+IH5l6OvRefJKpK432Np93xzXvoBHfI+hdoSIgd+zwfpTL/f/h8ralNt+gmOxEQAPV+UPsTIkIIQg0BOklGqKfs=
X-Received: by 2002:a05:6830:40c1:b0:70c:9c66:af53 with SMTP id
 46e09a7af769-71a6023bc72mr7517367a34.25.1731592983106; Thu, 14 Nov 2024
 06:03:03 -0800 (PST)
MIME-Version: 1.0
References: <20240819142953.415817-1-frediano.ziglio@cloud.com> <c55fdc20-2a58-4978-bd78-4cba90a7a8e4@suse.com>
In-Reply-To: <c55fdc20-2a58-4978-bd78-4cba90a7a8e4@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 14 Nov 2024 14:02:52 +0000
Message-ID: <CACHz=ZhGsE1fvhEi2k2X9ae2rx=ik3ZzZR4RN4Uajt_qvs2J=w@mail.gmail.com>
Subject: Re: [PATCH v4] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 2:52=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 19.08.2024 16:29, Frediano Ziglio wrote:
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -287,19 +287,36 @@ static bool __init match_guid(const EFI_GUID *gui=
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
_ ## code),
> > +        ERROR_MESSAGE_LIST
> >      };
> >      EFI_STATUS ErrIdx =3D ErrCode & ~EFI_ERROR_MASK;
> >
>
> A while ago Andrew and I discussed this, and I was apparently wrongly exp=
ecting
> him to come back here, as (iirc; no record of this that I could find in t=
he mail
> archives, so I'm sorry if my recollection is wrong) he was the one to obj=
ect. We
> concluded that it wants at least considering to undo the respective part =
of
> 00d5d5ce23e6, finding a different solution to the Clang issue there.
>
> Jan

I thought this patch was already applied.
I didn't remember any clang issue.
As far as I know, this was delayed by an issue that turned out to be differ=
ent.
So, any reason why not to merge the original patch?

Frediano

