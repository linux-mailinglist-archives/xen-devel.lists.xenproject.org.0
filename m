Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5465D9CDC88
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 11:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837043.1252955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtXt-0003lJ-AU; Fri, 15 Nov 2024 10:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837043.1252955; Fri, 15 Nov 2024 10:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtXt-0003jU-78; Fri, 15 Nov 2024 10:27:21 +0000
Received: by outflank-mailman (input) for mailman id 837043;
 Fri, 15 Nov 2024 10:27:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tcl1=SK=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tBtXs-0003jO-5c
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 10:27:20 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e6e3746-a33c-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 11:27:15 +0100 (CET)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5ee354637b4so941987eaf.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 02:27:15 -0800 (PST)
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
X-Inumbo-ID: 2e6e3746-a33c-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMjkiLCJoZWxvIjoibWFpbC1vbzEteGMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJlNmUzNzQ2LWEzM2MtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNjY2NDM1LjM1NjQ3LCJzZW5kZXIiOiJmcmVkaWFuby56aWdsaW9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731666434; x=1732271234; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdPog5/bWZfZ7jKLZsD7JZdUFesgZJHYz4etpOZoUD4=;
        b=la668Wq7cdiTZ28SHAiLtNFpU3hDlZEoYyTBFibOU27uYtOk2nWeeLzNNB3s3aiUhe
         Zb7UElcqTtMReWoxzcm+7uRKgx+7KVy5Px+SA8XPQd/qMSVlE0VGGB3QW1w2OTN1cn9E
         rCMufMd4wT/ujs4YhUDvIS9DzqDq4UuZqhJGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731666434; x=1732271234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdPog5/bWZfZ7jKLZsD7JZdUFesgZJHYz4etpOZoUD4=;
        b=ZeXEf2my6QqSihphXWRodlmFV1R3qpI4RQHIWTIQ7YbkzB6AXW0LiEsxzSoZNJUi0/
         D3Mg2HtR6YHlpr5CGXHFzFSzvcJ4Gahb9TsvXFLuylbH73EPVXbRgmfNZkt8S2Q939LH
         2w22Bc78BN0eWZ7aPylM0v6sVgT0jXY6Wqb7EK9nW2G6+pWiMRKgJw+VL5srTr5IpRml
         xOkm27m275uSdiXQeCaFxCAM/Pka8u0e7wSyZCO0ywAPG4G4zkEAenKUMt0z5kNVppHi
         Re6FKTmSeBxp0Xwl1xNCSMtN2PXhNDih5ffQs7BlEothn07wef8/GSB/wxy1bbpOBqgQ
         fyJg==
X-Forwarded-Encrypted: i=1; AJvYcCXMhPfwe0FRP//0YroS0VsH2TZLhcRvRc/zDicmewPgw36afGMDTKdryXPGGySHza6GEzBkLKSqTfQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6FvbnC3/tBNemlpJ5d6a/F93iOlBgKBGib3ADQnejutn3SHjf
	0qCUAU6gjd1+gAJuRVEfBRZ0v09RsEIYe3YEzqRZb72nRubVWFJvwVdVdXx9BXJsqFoiL7RssSF
	PJeOywC7N2skI04VOijsQl4pZ3ORsp0iZ8uUjaA==
X-Google-Smtp-Source: AGHT+IERrQq8fYBWoEAszv39L5j3I35LyYmmUSsDh12io0coZen9cFCDt0JZXdN4VbnEzrjIiQcnRHLhECOME1hCGCk=
X-Received: by 2002:a05:6830:6e10:b0:715:3a11:ece9 with SMTP id
 46e09a7af769-71a77a24762mr2362446a34.19.1731666433893; Fri, 15 Nov 2024
 02:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20240819142953.415817-1-frediano.ziglio@cloud.com>
 <c55fdc20-2a58-4978-bd78-4cba90a7a8e4@suse.com> <CACHz=ZhGsE1fvhEi2k2X9ae2rx=ik3ZzZR4RN4Uajt_qvs2J=w@mail.gmail.com>
 <edc4f604-d8e2-4227-abc9-9c5de5933417@suse.com>
In-Reply-To: <edc4f604-d8e2-4227-abc9-9c5de5933417@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 15 Nov 2024 10:27:03 +0000
Message-ID: <CACHz=Zj40eMUfaRCnQih0CGmXYM+tKe95S8_ELWS+T8goLqGbA@mail.gmail.com>
Subject: Re: [PATCH v4] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 3:04=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 14.11.2024 15:02, Frediano Ziglio wrote:
> > On Tue, Nov 5, 2024 at 2:52=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 19.08.2024 16:29, Frediano Ziglio wrote:
> >>> --- a/xen/common/efi/boot.c
> >>> +++ b/xen/common/efi/boot.c
> >>> @@ -287,19 +287,36 @@ static bool __init match_guid(const EFI_GUID *g=
uid1, const EFI_GUID *guid2)
> >>>  /* generic routine for printing error messages */
> >>>  static void __init PrintErrMesg(const CHAR16 *mesg, EFI_STATUS ErrCo=
de)
> >>>  {
> >>> -    static const CHAR16* const ErrCodeToStr[] __initconstrel =3D {
> >>> -        [~EFI_ERROR_MASK & EFI_NOT_FOUND]           =3D L"Not found"=
,
> >>> -        [~EFI_ERROR_MASK & EFI_NO_MEDIA]            =3D L"The device=
 has no media",
> >>> -        [~EFI_ERROR_MASK & EFI_MEDIA_CHANGED]       =3D L"Media chan=
ged",
> >>> -        [~EFI_ERROR_MASK & EFI_DEVICE_ERROR]        =3D L"Device err=
or",
> >>> -        [~EFI_ERROR_MASK & EFI_VOLUME_CORRUPTED]    =3D L"Volume cor=
rupted",
> >>> -        [~EFI_ERROR_MASK & EFI_ACCESS_DENIED]       =3D L"Access den=
ied",
> >>> -        [~EFI_ERROR_MASK & EFI_OUT_OF_RESOURCES]    =3D L"Out of res=
ources",
> >>> -        [~EFI_ERROR_MASK & EFI_VOLUME_FULL]         =3D L"Volume is =
full",
> >>> -        [~EFI_ERROR_MASK & EFI_SECURITY_VIOLATION]  =3D L"Security v=
iolation",
> >>> -        [~EFI_ERROR_MASK & EFI_CRC_ERROR]           =3D L"CRC error"=
,
> >>> -        [~EFI_ERROR_MASK & EFI_COMPROMISED_DATA]    =3D L"Compromise=
d data",
> >>> -        [~EFI_ERROR_MASK & EFI_BUFFER_TOO_SMALL]    =3D L"Buffer too=
 small",
> >>> +#define ERROR_MESSAGE_LIST \
> >>> +    ERROR_MESSAGE(EFI_NOT_FOUND, "Not found") \
> >>> +    ERROR_MESSAGE(EFI_NO_MEDIA, "The device has no media") \
> >>> +    ERROR_MESSAGE(EFI_MEDIA_CHANGED, "Media changed") \
> >>> +    ERROR_MESSAGE(EFI_DEVICE_ERROR, "Device error") \
> >>> +    ERROR_MESSAGE(EFI_VOLUME_CORRUPTED, "Volume corrupted") \
> >>> +    ERROR_MESSAGE(EFI_ACCESS_DENIED, "Access denied") \
> >>> +    ERROR_MESSAGE(EFI_OUT_OF_RESOURCES, "Out of resources") \
> >>> +    ERROR_MESSAGE(EFI_VOLUME_FULL, "Volume is full") \
> >>> +    ERROR_MESSAGE(EFI_SECURITY_VIOLATION, "Security violation") \
> >>> +    ERROR_MESSAGE(EFI_CRC_ERROR, "CRC error") \
> >>> +    ERROR_MESSAGE(EFI_COMPROMISED_DATA, "Compromised data") \
> >>> +    ERROR_MESSAGE(EFI_BUFFER_TOO_SMALL, "Buffer too small")
> >>> +
> >>> +    static const struct ErrorStrings {
> >>> +        CHAR16 start;
> >>> +#undef ERROR_MESSAGE
> >>> +#define ERROR_MESSAGE(code, str) CHAR16 msg_ ## code[sizeof(str)];
> >>> +        ERROR_MESSAGE_LIST
> >>> +    } ErrorStrings __initconst =3D {
> >>> +        0
> >>> +#undef ERROR_MESSAGE
> >>> +#define ERROR_MESSAGE(code, str) , L ## str
> >>> +        ERROR_MESSAGE_LIST
> >>> +    };
> >>> +    static const uint16_t ErrCodeToStr[] __initconst =3D {
> >>> +#undef ERROR_MESSAGE
> >>> +#define ERROR_MESSAGE(code, str) \
> >>> +        [~EFI_ERROR_MASK & code] =3D offsetof(struct ErrorStrings, m=
sg_ ## code),
> >>> +        ERROR_MESSAGE_LIST
> >>>      };
> >>>      EFI_STATUS ErrIdx =3D ErrCode & ~EFI_ERROR_MASK;
> >>>
> >>
> >> A while ago Andrew and I discussed this, and I was apparently wrongly =
expecting
> >> him to come back here, as (iirc; no record of this that I could find i=
n the mail
> >> archives, so I'm sorry if my recollection is wrong) he was the one to =
object. We
> >> concluded that it wants at least considering to undo the respective pa=
rt of
> >> 00d5d5ce23e6, finding a different solution to the Clang issue there.
> >
> > I thought this patch was already applied.
> > I didn't remember any clang issue.
> > As far as I know, this was delayed by an issue that turned out to be di=
fferent.
> > So, any reason why not to merge the original patch?
>
> Afaict the alternative would result in tidier code, and hence might indee=
d be
> preferable. But since the reason I didn't long commit the patch is Andrew
> wanting it to not be committed, it'll need to be him to chime in here. Ev=
en
> if only to indicate that I'm misremembering.
>
> Jan

What alternative are you talking about? Was it something discussed elsewher=
e?

Frediano

