Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3368197D43F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 12:36:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801130.1211182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srazg-0003km-MV; Fri, 20 Sep 2024 10:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801130.1211182; Fri, 20 Sep 2024 10:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srazg-0003ii-Jo; Fri, 20 Sep 2024 10:36:08 +0000
Received: by outflank-mailman (input) for mailman id 801130;
 Fri, 20 Sep 2024 10:36:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4UDy=QS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1srazf-0003ic-Bo
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 10:36:07 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23be9c75-773c-11ef-99a2-01e77a169b0f;
 Fri, 20 Sep 2024 12:36:05 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so2478473a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2024 03:36:05 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c42bae0f73sm7060007a12.0.2024.09.20.03.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 03:36:04 -0700 (PDT)
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
X-Inumbo-ID: 23be9c75-773c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726828565; x=1727433365; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4U3HtdGLZHiyBM5ponjWiOh2zPZaOXyMjjE5GUk7dw=;
        b=ZTonbPEdsAr23CwraIGrANHbeKIQ2FPYTuJ9fSlASW/p1K2vOYxr5pnWZAaXg/1Zxq
         TDDk5v4xR9ekxRRpI6181VHrjQPnKfgi4dSheN0Y0d6QDaiigeYVRyj4NFWu9Awr7Chz
         4PEYTc5OqEl1my6/H0Cvvb5SZvMXcO4jUDhUclOYMXtHpkuLpIRxPOoJMThTx2YFASJr
         H9FXmevAr0ea7EXuv4MG24tDh0ZMccCam9QCv5e7M5bwZH7py8iah7Mv/bZRcibQ95rU
         oXpZek8WGyNM4K6dpA4IUdC5cEcxcPA2qMC7HY8wbMtEEDzVVPJ7av4cDYbg0rYhxuAx
         FFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726828565; x=1727433365;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4U3HtdGLZHiyBM5ponjWiOh2zPZaOXyMjjE5GUk7dw=;
        b=GDHvdL5Jg947MvtQ3fxwINyegnstHbMHFHR8+EP4P8jJwwsYxy44gm0c5piFjUSqUU
         fbVdDQWEnXzEt2jS2PASLgmtRhAy9+h5KrQH5wUP9IeGW+nZNmui8jQtLHA2RaMDnnH3
         2AX58WCNrIoHIMwArPu8ykydzwM1HrqxVH34HeAes3wt4JHwH1UNoRoKklHbBiTJoujg
         /5PbeduswQ1zrmbMrR1hqsPaQCnT7vvilFf+7/Jywon7nEdIc1J8X2MlIjpQ7v+QOr4N
         xWAA3xl/JIxwIB6Gvt1n+52A9qsekKK+2ExbSK4giQ86WA154v68tgiBVZac3GTirgV2
         u4Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVVz8QFIyB+TiKEkGiU1NZPZkQr5jFb8n5DKy9xQ7XB32xWdnsaD3o55wAduZylnMMDDyJ8EVHooSk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwXh8IT72hmITBrGXxf5nJA2jjpKcM5+/RNHAOJw/1tQHIb/9g
	XDEPoNhWSghk5lxg/EJ3/PgCxn1aMS6BU9Q2FJzkjQmdFphVh2xOoMYi6w==
X-Google-Smtp-Source: AGHT+IEzGvwwJNo7+0jVITnpInqxr1tICFv1viE+Hb5k0ywRuaV5AO29jxi/FTZ1UbVwlYJX2VDb7g==
X-Received: by 2002:a05:6402:34d6:b0:5be:fc1d:fd38 with SMTP id 4fb4d7f45d1cf-5c464e02e53mr1215695a12.36.1726828564558;
        Fri, 20 Sep 2024 03:36:04 -0700 (PDT)
Message-ID: <2420a2df140fb9b002cc467cdf15f9f065d3074b.camel@gmail.com>
Subject: Re: [PATCH v2 3/5] xen/ppc: add section for device information in
 linker script
From: oleksii.kurochko@gmail.com
To: Shawn Anastasio <sanastasio@raptorengineering.com>, 
	xen-devel@lists.xenproject.org
Date: Fri, 20 Sep 2024 12:36:03 +0200
In-Reply-To: <2c2bd8bd-7d0f-4e47-9bab-e097a3ec8766@raptorengineering.com>
References: <cover.1726579819.git.oleksii.kurochko@gmail.com>
	 <05eeb53403017fb40c4debf8a33f70438953d6de.1726579819.git.oleksii.kurochko@gmail.com>
	 <2c2bd8bd-7d0f-4e47-9bab-e097a3ec8766@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

Hi Shawn,

On Thu, 2024-09-19 at 16:10 -0500, Shawn Anastasio wrote:
> Hi Oleksii,
>=20
> On 9/17/24 11:15 AM, Oleksii Kurochko wrote:
> > Introduce a new `.dev.info` section in the PPC linker script to
> > handle device-specific information. This section is required by
> > common code (common/device.c: device_init(), device_get_class() ).
> > This section is aligned to `POINTER_ALIGN`, with `_sdevice` and
> > `_edevice`
> > marking the start and end of the section, respectively.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> > =C2=A0- reuse DT_DEV_INFO_SEC introduced earlier in this patch series
> > with using
> > =C2=A0=C2=A0 of DECL_SECTION.=C2=A0=20
> > ---
> > =C2=A0xen/arch/ppc/xen.lds.S | 3 +++
> > =C2=A01 file changed, 3 insertions(+)
> >=20
> > diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> > index 38cd857187..6e5582c3e4 100644
> > --- a/xen/arch/ppc/xen.lds.S
> > +++ b/xen/arch/ppc/xen.lds.S
> > @@ -94,6 +94,9 @@ SECTIONS
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONSTRUCTORS
> > =C2=A0=C2=A0=C2=A0=C2=A0 } :text
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 . =3D ALIGN(POINTER_ALIGN);=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 /* Devicetree based device
> > info */
> > +=C2=A0=C2=A0=C2=A0 DT_DEV_INFO_SEC(.dev.info, USE_DECL_SECTION)
> > +
>=20
> As I mentioned in my comment on patch 1, I think this should be done
> in
> the same style as the other xen.lds.h macros, which leaves the actual
> section declaration here in xen.lds.S and just uses the macro to fill
> in
> the definition.
>=20
> Whether or not that route is ultimately taken though, this change is
> fine from the PPC end of things:
>=20
> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

As I mentioned in the reply to patch 1 I am okay with your suggested
approach,  I=E2=80=99ll wait for a bit to see if anyone has other comments =
and
if it will be necessary I will update the current patch.

Thanks.

~ Oleksii

