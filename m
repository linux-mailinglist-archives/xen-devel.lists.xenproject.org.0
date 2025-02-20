Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C50A3D491
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 10:23:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893701.1302570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2mR-00004x-41; Thu, 20 Feb 2025 09:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893701.1302570; Thu, 20 Feb 2025 09:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tl2mR-0008UQ-1C; Thu, 20 Feb 2025 09:23:39 +0000
Received: by outflank-mailman (input) for mailman id 893701;
 Thu, 20 Feb 2025 09:23:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/p1y=VL=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tl2mP-0008TC-IK
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 09:23:37 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bf289a9-ef6c-11ef-9896-31a8f345e629;
 Thu, 20 Feb 2025 10:23:35 +0100 (CET)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2a88c7fabdeso401048fac.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2025 01:23:35 -0800 (PST)
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
X-Inumbo-ID: 5bf289a9-ef6c-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1740043414; x=1740648214; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tu1aEYq+gu82IXUKKSw8630FuxQHjJTMJLXRL2Ov1so=;
        b=CJxa0W5v1we6zxynqG9PStwm3+RN6e8RLgOj07wKKr1PDv/VcUQ+glWuihVGBi6RWn
         /eKGWFnWjryDxZCnrbUU9y0ptK/HLSXLPNtdWHUwIObKd8zwyGX3/LCup5/vHppuWrkB
         MrjP0D3xzgSZLZcyzS09/ln5giKeYXGxP/u3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740043414; x=1740648214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tu1aEYq+gu82IXUKKSw8630FuxQHjJTMJLXRL2Ov1so=;
        b=ljhNV+OdtvUzLpUSJ5+XajRq61qZuQ7wy4Opk2VFE+oY4sZySX4FDXwcoDmUnPRItC
         Vr7F218S8RzGglnVyRdIPZlCmfnpzeIUl9u5YLBDwKE9jw+YTAymVbbKnVo70gbSX66s
         WjkMo640CV6lZNEMJmNQouWmF/9u0bHSHqfusyuV6loMvdMM7dvUlnUaNgrgiu8EUUAQ
         efoEKRSFKoY0mf2mWmXSkRWDSQBUiwRvRlzlI4g1C+Wa8uLnJ0bj1XsjmktnDPDemSvP
         FYgAL+bnvHKTd7QHMF9IvEHvqYYtVTyAiGbyq6Cj2P2GgiIHmMGLyvnFWNgdonHF70wo
         IfyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVip4AnfhkaY81FzBUSjuIjZZfut7s+l0Rwrx3xu3GewIsTOOu9UdL36dTaLCmdrC3jvetx0mt1CY4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQBd/Rb98ZeL/XY8DeKa7hs+3xVt1TevLn72hxyjuALixKIAm2
	+N/QbepGmJKZDZM8R1BqqQeETazDTvauPgCSgMg1b9R5Rz7aHloFLZbN0sPWh4Oc15UXIvby/X6
	+xtO7i1kQvGKGAaauBcEx35kgpo2joJIBIyD3XSSy6H7Nayx5
X-Gm-Gg: ASbGncuuQZI2BX2I7CRaVTnx/5wOcpcKR5jliecjqtE0Rr+LeejNVv+upHX4hLyyUWG
	LMUOgxYrq3GHkAZrin+2MtKpZO7wZQ+I3lBmGFWLPRQPGH2tDr/eW6ZpcQFtlvPUu/Daj0A==
X-Google-Smtp-Source: AGHT+IHBLdL6J6fnBV2dgGuXQ0PZZmQMm5xbiSDroJyKjjMGJ2MphAZHv6qBP1AgenJaosgJIY5txDrHFr8BIBhr0oM=
X-Received: by 2002:a05:6870:8a0c:b0:29f:b1d4:7710 with SMTP id
 586e51a60fabf-2bc99d3fba2mr14144082fac.24.1740043414449; Thu, 20 Feb 2025
 01:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20250217162659.151232-1-frediano.ziglio@cloud.com>
 <77eb149c-bb1e-4f77-85ba-c44b173a5c1e@suse.com> <ddfee078-409e-4253-9d51-b2f512b41e63@citrix.com>
 <CACHz=ZhuOL3Le=+y0zFRaWBDEdLO_faLKZ83072Z0e88wZMpPw@mail.gmail.com>
 <1923357b-c303-4900-9e2a-be4328ae4dc3@suse.com> <CACHz=Zhv5jnQ-amWwcjxOD0L+vNXFHbhs+qUkJp53MqUuwvQ1g@mail.gmail.com>
 <f35ef066-2829-46c3-a65a-97436d8b39e2@suse.com>
In-Reply-To: <f35ef066-2829-46c3-a65a-97436d8b39e2@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 20 Feb 2025 09:23:23 +0000
X-Gm-Features: AWEUYZncnjLwTZoPE9ZVz904CadSobtwv83yqaDA1fdJu8_Hj-FpNEXVcfZscTM
Message-ID: <CACHz=ZjzNcV=eeN44_fJ=aeH-ymFs9xKewTiaR4VWgkOZ68RUg@mail.gmail.com>
Subject: Re: [PATCH v6] Avoid crash calling PrintErrMesg from efi_multiboot2
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 7:32=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 19.02.2025 17:34, Frediano Ziglio wrote:
> > On Mon, Feb 17, 2025 at 4:56=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 17.02.2025 17:52, Frediano Ziglio wrote:
> >>> On Mon, Feb 17, 2025 at 4:41=E2=80=AFPM Andrew Cooper <andrew.cooper3=
@citrix.com> wrote:
> >>>> On 17/02/2025 4:31 pm, Jan Beulich wrote:
> >>>>> On 17.02.2025 17:26, Frediano Ziglio wrote:
> >>>>>> --- a/xen/common/efi/efi-common.mk
> >>>>>> +++ b/xen/common/efi/efi-common.mk
> >>>>>> @@ -2,6 +2,7 @@ EFIOBJ-y :=3D boot.init.o pe.init.o ebmalloc.o run=
time.o
> >>>>>>  EFIOBJ-$(CONFIG_COMPAT) +=3D compat.o
> >>>>>>
> >>>>>>  CFLAGS-y +=3D -fshort-wchar
> >>>>>> +CFLAGS-y +=3D -fno-jump-tables
> >>>>>>  CFLAGS-y +=3D -iquote $(srctree)/common/efi
> >>>>>>  CFLAGS-y +=3D -iquote $(srcdir)
> >>>>> Do source files other than boot.c really need this? Do any other fi=
les outside
> >>>>> of efi/ maybe also need this (iirc this point was made along with t=
he v5 comment
> >>>>> you got)?
> >>>>
> >>>> Every TU reachable from efi_multiboot2() needs this, because all of
> >>>> those have logic executed at an incorrect virtual address.
> >>>
> >>> I assume all the files in efi directory will deal with EFI boot so
> >>> it's good to have the option enabled for the files inside the
> >>> directory. The only exception seems runtime.c file.
> >>
> >> And compat.c, being a wrapper around runtime.c.
> >>
> >>> About external dependencies not sure how to detect them (beside
> >>> looking at all symbols).
> >>
> >> Which raises the question whether we don't need to turn on that option
> >> globally, without (as we have it now) any condition.
> >
> > I would avoid adding a potential option that could affect performances
> > so badly at the moment.
> > These changes are pretty contained.
> > I would merge this patch and check any external dependencies as a follo=
w up.
>
> Well. It's a judgement call to the maintainers. If I were them, I'd deman=
d
> that Andrew's remark be addressed, one way or another.
>
> Jan

I think I did, but only Andres can confirm it.

Frediano

