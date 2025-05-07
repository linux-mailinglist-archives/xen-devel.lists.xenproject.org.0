Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E78AADF67
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 14:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978526.1365291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCe3L-0007hy-Uy; Wed, 07 May 2025 12:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978526.1365291; Wed, 07 May 2025 12:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCe3L-0007gW-SD; Wed, 07 May 2025 12:39:11 +0000
Received: by outflank-mailman (input) for mailman id 978526;
 Wed, 07 May 2025 12:39:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWiO=XX=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uCe3J-0007gQ-LV
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 12:39:09 +0000
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 441bae4d-2b40-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 14:39:07 +0200 (CEST)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-2db2149ffceso1334322fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 05:39:07 -0700 (PDT)
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
X-Inumbo-ID: 441bae4d-2b40-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746621546; x=1747226346; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpjdhL78iSIW03cbbeqHZioOgFfIe9yl9I8S9n9w4NY=;
        b=LHQAz8hPGErC/i+CgDFiTPDcQtpJAjD3rPVegC6A6tfmp3WlHfkRCLMfNIcg9YG5o1
         eLrGOYOW/w+DK9VSROdPdtb3IJsswZn/BUL2IYvPlXK36BG7dYpshIf7qOM/qLU4qrZm
         cen7Qo0bgc0f6ICA5TXt4gOLxMIZX7VfDIv2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746621546; x=1747226346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpjdhL78iSIW03cbbeqHZioOgFfIe9yl9I8S9n9w4NY=;
        b=jcHOFNN3xBkKphQ5XHEuD9O6oftQKy5IAZpXShY5Vlv/R3ddLpa+/PYFAEONimDRj+
         9iO3nUjJSe4cMdL6lvVzCMDlsuiWNR1ym7vSEIpdnQBZJiQBiObahGzvxWOqF35M9Vtq
         GgaJET11UJEVWU44tH/utj9Fq5n0DSz1wGQsofzJPz9sCsBgXVRuTg3cvY7EeeV2BXhR
         1qxIZDiHNYLNPbtn+pJ575jjh/RAcyIJksIAvTWZzuH8IwI6tuxI8iiGw9VaayzC+AFZ
         url5k8L6nBK+WBN7gq++Ypn3W/EhQRlFdDQrFU0hKsszmgEzFfDcRzdpOxpjXRVEhxPF
         93RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNJPqA3OuYyNcWzFjURPj6eURUGCHeYA7vTDPmu1c7cXRAjwx0kzHj7cO8L4qs9x6pcgqzINw7ONw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJVc8MBeies87ttckY4Y2uigO2ddpQxFNFHWhBKSRqu4+byuyo
	KyrN+zbFdgXg83F0mEzn0nziJDwfk9WJaSlu/kAO5otbk6IvZXmBnpzGYQRBveloDmqOXxU2g8k
	zcIDWM2MEIM7UMyNVLlqeM7qw5nwKEfkA0G9S
X-Gm-Gg: ASbGncvj/YlGnA2urWH3ViuhTuRf1ou/u1HQYImOZS5PN5L1eam04UAs3jcvUB1YqMm
	0qXHEM37dBHiTSwhxNkziiiWV8SSw3Iub4g1j9qwZnAUfNemcb2tNRF3JSkSOYCAoocv+RvAv5c
	4ilCZq34YFblH41ZGaWvGD
X-Google-Smtp-Source: AGHT+IFB5LHG8tUkt7iEcplPmRfD1V6EGYpymUFJzCNhAixnumTkdCfBK1YyPJNMoEO54jaSjemTO9Y+UzfDDJXnvNc=
X-Received: by 2002:a05:6871:7402:b0:2c2:b85b:71ff with SMTP id
 586e51a60fabf-2db5bda883amr1678847fac.8.1746621546212; Wed, 07 May 2025
 05:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250506162449.1676405-1-kevin.lampis@cloud.com> <cf3e9dbf-7ea7-4b33-a4be-14cb5dac0ebc@citrix.com>
In-Reply-To: <cf3e9dbf-7ea7-4b33-a4be-14cb5dac0ebc@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Wed, 7 May 2025 13:38:55 +0100
X-Gm-Features: ATxdqUH0hnskP9ui_siHPSkzgKeBauyiP8BqZwcJhkVgHZU3MPbvUsoNylBM1Js
Message-ID: <CAG7k0EoaRmf_+m=BnPR=X95Y7ewWnCMWcMa+vxUfbJoSF5QnfQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] efi: Add a function to check if Secure Boot mode is enabled
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Lampis <kevin.lampis@cloud.com>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 5:56=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> CC'ing the EFI maintainers.
>
> On 06/05/2025 5:24 pm, Kevin Lampis wrote:
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index e39fbc3529..7c528cd5dd 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -870,6 +870,27 @@ static void __init pre_parse(const struct file *fi=
le)
> >                     " last line will be ignored.\r\n");
> >  }
> >
> > +static void __init init_secure_boot_mode(void)
> > +{
> > +    EFI_STATUS status;
> > +    EFI_GUID gv_uuid =3D EFI_GLOBAL_VARIABLE;
> > +    uint8_t data =3D 0;
> > +    UINTN size =3D sizeof(data);
> > +    UINT32 attr =3D 0;
>
> Newline between variables and code please.
>
> > +    status =3D efi_rs->GetVariable((CHAR16 *)L"SecureBoot", &gv_uuid, =
&attr,
> > +                                 &size, &data);
> > +
> > +    if ( status =3D=3D EFI_NOT_FOUND ||
> > +         (status =3D=3D EFI_SUCCESS &&
> > +          attr =3D=3D (EFI_VARIABLE_BOOTSERVICE_ACCESS | EFI_VARIABLE_=
RUNTIME_ACCESS) &&
> > +          size =3D=3D 1 && data =3D=3D 0) )
> > +        /* Platform does not support Secure Boot or it's disabled. */
> > +        efi_secure_boot =3D false;
> > +    else
> > +        /* Everything else play it safe and assume enabled. */
> > +        efi_secure_boot =3D true;
> > +}
>
> I'm not sure this logic does what you want when a weird answer comes
> back from GetVariable().

What specific case do you think is handled incorrectly here?

Ross

