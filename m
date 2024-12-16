Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9FC9F2FEB
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 13:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857864.1270064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9m0-0003BF-Bo; Mon, 16 Dec 2024 12:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857864.1270064; Mon, 16 Dec 2024 12:00:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN9m0-00039h-9C; Mon, 16 Dec 2024 12:00:28 +0000
Received: by outflank-mailman (input) for mailman id 857864;
 Mon, 16 Dec 2024 12:00:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XQSc=TJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tN9lz-000398-2g
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 12:00:27 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5640c488-bba5-11ef-a0d6-8be0dac302b0;
 Mon, 16 Dec 2024 13:00:26 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa69107179cso754092866b.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 04:00:26 -0800 (PST)
Received: from localhost ([85.152.134.39]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab963b282csm322813866b.180.2024.12.16.04.00.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 04:00:25 -0800 (PST)
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
X-Inumbo-ID: 5640c488-bba5-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1734350426; x=1734955226; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hjPTMon1EDWQtLsBgRz5nZlvtMWdXZkey3ExrywPas=;
        b=X9H+RpeXMrrZPvKRjN7/JKTQskwWh29IFTRLbvvsavIIYHi4PxJ3xr2fQd/VQO5zji
         msQ0uxeWUo9WJyHnDryj/KmV2Dr+blyIxIKIwFiVq4h6J7le9A5sDokyE3QbrcXEVGxW
         PHojKDu87xEZCg9xuiGLC9fnJO3ty5qBsNfqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734350426; x=1734955226;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5hjPTMon1EDWQtLsBgRz5nZlvtMWdXZkey3ExrywPas=;
        b=WpsnVI4a6Xc+j5juOKuc+8yGdzBRYitZevIiOYcO/VU4kQEVnfmaPGBoaspsC2vOtk
         Z2C4tDyV6eF0eihqkBDxRSBCZa28UxgOEtubqO1YZPAJCMcicZmRBaV7T2eMaLIwaySF
         chh7jvjB4KDsllj/ZGopS7KV8Mqmdvxn1RJcOC26xO71HesGKjgE9aRao3DJ/NosPVL0
         s5qHKCD63wi1UDsL8lfM9tfWQu0aefL9iBbelNZRAI0IZLEV+H599CzPeg+qF1sbi4Dl
         K8gVHXt+LHRqdpIczHfgUM0IBgr6dkHH3pk2TFNPaT91Y9cnYE2kHxxy9XhIS4Pj/KQx
         uppA==
X-Forwarded-Encrypted: i=1; AJvYcCVjAHekpQAQPKmoAFH+oKW3m2f9XoGAfpff/aQ+u6hFfgV4hnoP8Sksj6viS2FDuzLGw9zrYCvsYcQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsTriOYXSc1wRiVc2VDCEVirZzsg7CYOPpkV0YnI2Lg+ubuYTq
	+mAjNTqOEyT/8iDWICj3kqFkIEPkByHFEBh11cCZXQIVrOurGOMoJHHK/d25qB4=
X-Gm-Gg: ASbGnctldFtuFlUMT9jhVyboPywr92ho3xJhDV1zQkuQuqCalljMnrxflFh/1XoP5s/
	+gYiJN9EIcyJdZuyCQPvR0iBTFKCbychiVShfKoDInYjF+803nvAnqxelmDcMEc7Wu4Pc0i5qWr
	xBoRGq0nOwIZVeakBMogCHkdQc9IDSk8EPyp+RlwugPaBZrfP7Lpg9WNQ8fboDJtRSX/3Svy2uk
	7lcc+ctY0U9zOWPps+v+sfm7QE9CwWfhqEV0ubNITgbRc3APinO/lxWqFg3geY=
X-Google-Smtp-Source: AGHT+IGnU5VysDyUFo6bLcfUIY9VhTZro3gr/Q1V4xRALoMV2UEDcD16XCKNUlCX1KPXfmUD8vFN6w==
X-Received: by 2002:a17:906:32c3:b0:aa6:7feb:193f with SMTP id a640c23a62f3a-aab7795851bmr1194025466b.20.1734350425898;
        Mon, 16 Dec 2024 04:00:25 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 12:00:22 +0000
Message-Id: <D6D3WWUR75T2.1C5DL8WJGQVNP@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 10/13] x86/mpx: Map/unmap xsave area in in
 read_bndcfgu()
X-Mailer: aerc 0.18.2
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-11-alejandro.vallejo@cloud.com>
 <7e36137b-ce1f-4e78-9a41-fbfdbe9c0d87@suse.com>
In-Reply-To: <7e36137b-ce1f-4e78-9a41-fbfdbe9c0d87@suse.com>

On Mon Dec 9, 2024 at 4:30 PM GMT, Jan Beulich wrote:
> On 05.11.2024 15:33, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/xstate.c
> > +++ b/xen/arch/x86/xstate.c
> > @@ -1022,9 +1022,10 @@ int handle_xsetbv(u32 index, u64 new_bv)
> > =20
> >  uint64_t read_bndcfgu(void)
> >  {
> > +    uint64_t bndcfgu =3D 0;
> >      unsigned long cr0 =3D read_cr0();
> > -    struct xsave_struct *xstate
> > -        =3D idle_vcpu[smp_processor_id()]->arch.xsave_area;
> > +    struct vcpu *v =3D idle_vcpu[smp_processor_id()];
>
> Can this be pointer-to-const? Certainly right now, so the question is rat=
her
> meant to be forward looking.
>
> > +    struct xsave_struct *xstate =3D VCPU_MAP_XSAVE_AREA(v);
>
> This certainly can be pointer-to-const, just like ...
>
> >      const struct xstate_bndcsr *bndcsr;
>
> ... this is.
>
> Jan

Yes, those retained non-const because of the now missing patch to zero-out
bndcfgu.

Cheers,
Alejandro

