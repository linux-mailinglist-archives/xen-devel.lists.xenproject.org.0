Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B42B2AE05F6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 14:34:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1020104.1396523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSESY-0008PA-Fo; Thu, 19 Jun 2025 12:33:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1020104.1396523; Thu, 19 Jun 2025 12:33:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSESY-0008NI-DG; Thu, 19 Jun 2025 12:33:38 +0000
Received: by outflank-mailman (input) for mailman id 1020104;
 Thu, 19 Jun 2025 12:33:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BDRo=ZC=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uSESW-0008NB-Ku
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 12:33:36 +0000
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [2001:4860:4864:20::2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d741fa8-4d09-11f0-a30c-13f23c93f187;
 Thu, 19 Jun 2025 14:33:34 +0200 (CEST)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-2d09d495c6cso173867fac.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 05:33:34 -0700 (PDT)
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
X-Inumbo-ID: 9d741fa8-4d09-11f0-a30c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1750336413; x=1750941213; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WWlxgvF0Q3K/dkF6RTlL7Pv2byME2egFevB+nF/vBOA=;
        b=OM204pafLS3kmZvsjmwgHADAY8aEEhbo5oNPHFc0Qoz20pq9nYk5w9JINBm08+idT2
         YeZV9pQnK0nWT2naUqEqQ/bL8Bp4myXnQqhPvsQPe+nqfcBwO5pD4qDPyCsWidkkq2+J
         svWRnkSFZXQaP49Df9a3jIH9UidTjxOVoGPVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750336413; x=1750941213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WWlxgvF0Q3K/dkF6RTlL7Pv2byME2egFevB+nF/vBOA=;
        b=isq+Eh6QapdkEkAkCkLLdw8WPXiplV/7gWAVF5rc6/HK9klMKbzuGz1jR98XSUZBAO
         gROWQIHWWp0Idtq64U4ZUHWUxzCqoMZwIi1l4p+34PQryO91XK015UyFjLD7+DwMefxN
         hVVBGC1thUrQ0/tRfDfMgIUcZfC2cTiszu1zUKmtSz83Ckojt4KwV1p56RF/ZGfrDoMr
         qrpjrcr1KLAohjL30X6InxKkI4wVJ3HFnbObDoSTMpQ5XJ0OUDXlq9eJ9Tgo3cGv3aLD
         YRNY8v+uYsyt6/BrFt2y6wRb4iPUWHhegT+4Y6McBjdLD/NbHB3/k2SVcjqkbaL8/48+
         LmbA==
X-Gm-Message-State: AOJu0YzhGICFA3QqBrZRUMM0jmnHDpv8t0c1A0b64Ma/5Fge3TTXXP4i
	L9WrOuSQmi8jPRZu0jbou5v84NT5oBpZsFloYH5sXsdodrVBCjTyJ2ECq4mb0VCscG49GEx//ij
	lRKexgoLhDB0Sftie0LtCjdUaRdGcYVWqLMUmGx4J9w==
X-Gm-Gg: ASbGncsWl+VP+lsQSchPxELGHo1VSb+V2warB4z6U7t0Y9kPIZ1EHE/r6BXE+nkoqWj
	O7NPeeeD2FhSbbQn36bQTkY1oSZx0F8PbtHsqINnAObKd3THD6l25knYw19iEHiWcYynU8kPTPT
	yzglpo5SNKI2DMz/uWHW73U1XAh/+Rgd0hrqOjZUQy
X-Google-Smtp-Source: AGHT+IErzX3qWIT3c1Qk1YGFeP2cdcTJQDk2QlkIreKgSk2921ua+MvlqcGby1PEuT5shey8DDLXrqwEphtluMw/pyw=
X-Received: by 2002:a05:6870:70a1:b0:2d4:ce45:6993 with SMTP id
 586e51a60fabf-2eaf08b7847mr12533156fac.30.1750336412919; Thu, 19 Jun 2025
 05:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250618184631.15489-1-frediano.ziglio@cloud.com> <aFP_xmsKsSK_y0tA@mail-itl>
In-Reply-To: <aFP_xmsKsSK_y0tA@mail-itl>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 19 Jun 2025 13:33:20 +0100
X-Gm-Features: AX0GCFtz_Eh-mTsaf4U6f1-RoEIxDzkfz8yJUWJYg9UOC042JBtCodp0RW3oFzk
Message-ID: <CACHz=ZjNOxcADbyfoSodt+ef=gtbE+vKDE0kNbOU2Pd+oOtSgA@mail.gmail.com>
Subject: Re: [PATCH] xen/efi: Do not check kernel signature if it was embedded
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 1:17=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Wed, Jun 18, 2025 at 07:46:28PM +0100, Frediano Ziglio wrote:
> > Using UKI it's possible to embed Linux kernel into xen.efi file.
> > In this case the signature for Secure Boot is applied to the
> > whole xen.efi, including the kernel.
> > So checking for specific signature for the kernel is not
> > needed.
> > In case Secure Boot is not enabled there's no reason to check
> > kernel signature.
>
> The last sentence (here and in the comment below) seem to be unrelated
> to this change - it's more about shim lock protocol being available,
> which this patch doesn't change.
>

Should I just remove the sentence?
Beside that sentence, any issue with this change?

> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  xen/common/efi/boot.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index e39fbc3529..7077af3f5d 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -1291,6 +1291,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE =
ImageHandle,
> >      bool base_video =3D false;
> >      const char *option_str;
> >      bool use_cfg_file;
> > +    bool kernel_was_verified =3D false;
> >      int dt_modules_found;
> >
> >      __set_bit(EFI_BOOT, &efi_flags);
> > @@ -1461,6 +1462,14 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE=
 ImageHandle,
> >              read_file(dir_handle, s2w(&name), &kernel, option_str);
> >              efi_bs->FreePool(name.w);
> >          }
> > +        else
> > +        {
> > +            /*
> > +             * As kernel was embedded it was either verified for Secur=
e Boot
> > +             * or Secure Boot is not enabled.
> > +             */
> > +            kernel_was_verified =3D true;
> > +        }
> >
> >          if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
> >          {
> > @@ -1534,6 +1543,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE =
ImageHandle,
> >       * verify it.
> >       */
> >      if ( kernel.ptr &&
> > +         !kernel_was_verified &&
> >           !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> >                                             (void **)&shim_lock)) &&
> >           (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D =
EFI_SUCCESS )
> > --
> > 2.43.0
> >
>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab

