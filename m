Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 584329882BA
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 12:43:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806228.1217568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su8R5-0003u4-1u; Fri, 27 Sep 2024 10:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806228.1217568; Fri, 27 Sep 2024 10:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su8R4-0003qw-VW; Fri, 27 Sep 2024 10:42:54 +0000
Received: by outflank-mailman (input) for mailman id 806228;
 Fri, 27 Sep 2024 10:42:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1su8R3-0003qp-IR
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 10:42:53 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f5a66dd-7cbd-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 12:42:52 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so256047266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 03:42:52 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2948fd6sm117821566b.101.2024.09.27.03.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 03:42:51 -0700 (PDT)
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
X-Inumbo-ID: 3f5a66dd-7cbd-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727433772; x=1728038572; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=phb5rdQk940E4ed5y9YnUlYY5/oHUJy+aUS7K5SFgYY=;
        b=DamUtygrZXz5zfw07QuLpMxJQI9UcKHHOLgpEiBj1Y0KUGdTsYMQBMowuXQGHrlMMm
         Hs+VdmuIVkbzKzkSROh4v82KcPanve3sYZvBs1jcyiNuKdKJGkUCBk3RJLubOd9JydAW
         Owrt30YVA8egygjzrQ6zeXhNpY0fvrODRIXFyMe6T014Qqqp7WlIOKWSnr1C1Z8XJh++
         pySj3lam+vhOvuzqPaKWJ495zcAriTwde4wNzIzaAuxd8dWcx9jEtlCtHY0wvgcuuHKl
         bms0MeeWl3GNBnO2e/IQx0RC32+xxge0v0MIR9CIvskbBGKXhSu0RAf2Qv+eDm9GnjIe
         AtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433772; x=1728038572;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phb5rdQk940E4ed5y9YnUlYY5/oHUJy+aUS7K5SFgYY=;
        b=WHIUtJoY3EFp42BBGxWZVRQ7exe4MgNeS6/OaILLy0AgGUmvgvQwBEqfEHXuStPnal
         9MOhiZeJg6tcA4BzMxW4z1Jnan1AOl0+kJ0R6k/UODzeps8cEsItjscMODaAuVW/cBTe
         K7FSA6B9vkJPPjD/KyqzPWMnWuyEOgQII+XEsoQSea8qyuPPxyCkjA1/Ok9rHEComRZj
         BAFLG0mZS2MyCWkxjBFkWrm61ABdUhovx+5f/u0T8dMK7DOTMSRzsO7txXQqbnHdZu8D
         Q24/+/gn7hM+A0MvxifRg6RwiAMLTmbFvyC8N95Z/ncP7DDVRo5N7tbXjN5/J42g3D52
         Iwjw==
X-Gm-Message-State: AOJu0Yzv/YW+fdZbA3OvbajhxN2quNKMcWrpigb6yJJZJyVtT5ZVmZ0d
	8xMqiqMF5m7qiNA9/j94VFM7TV6qeVwDZ+I/hukFX61CkLhRceUi
X-Google-Smtp-Source: AGHT+IFb6REDJoZoTW102p50yZyYLv4yDgT/+hDa7SDnQlrAbEbl8ZNHow2AcBYwcPrMgYtSWjRPHQ==
X-Received: by 2002:a17:907:3f0a:b0:a7a:97ca:3059 with SMTP id a640c23a62f3a-a93c496953bmr225982666b.34.1727433771834;
        Fri, 27 Sep 2024 03:42:51 -0700 (PDT)
Message-ID: <d06c89fed69930f03db078d3d9d633026d5a604a.camel@gmail.com>
Subject: Re: [PATCH v4 1/6] xen: introduce SIMPLE_DECL_SECTION
From: oleksii.kurochko@gmail.com
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
	 <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Fri, 27 Sep 2024 12:42:50 +0200
In-Reply-To: <ZvZ9zkCme0r8bqmC@macbook.local>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
	 <413dfb16280c3ec541df8775d31902a4b12a64fe.1727365854.git.oleksii.kurochko@gmail.com>
	 <ZvZlqy4Y57ewtcq9@macbook.local>
	 <05958c4be241866a5698a1396416b2d6317acc17.camel@gmail.com>
	 <ZvZ9zkCme0r8bqmC@macbook.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Fri, 2024-09-27 at 11:41 +0200, Roger Pau Monn=C3=A9 wrote:
> On Fri, Sep 27, 2024 at 11:07:58AM +0200,
> oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Fri, 2024-09-27 at 09:58 +0200, Roger Pau Monn=C3=A9 wrote:
> > > On Thu, Sep 26, 2024 at 06:54:20PM +0200, Oleksii Kurochko wrote:
> > > > Introduce SIMPLE_DECL_SECTION to cover the case when
> > > > an architecture wants to declare a section without specifying
> > > > of load address for the section.
> > > >=20
> > > > Update x86/xen.lds.S to use SIMPLE_DECL_SECTION.
> > >=20
> > > No strong opinion, but I feel SIMPLE is not very descriptive.=C2=A0 I=
t
> > > might be better to do it the other way around: introduce a define
> > > for
> > > when the DECL_SECTION macro should specify a load address:
> > > DECL_SECTION_WITH_LADDR for example.
> > In the next patch, two sections are introduced: dt_dev_info and
> > acpi_dev_info. The definition of these sections has been made
> > common
> > and moved to xen.lds.h, and it looks like this:
> > =C2=A0=C2=A0 +#define DT_DEV_INFO(secname)=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0 +=C2=A0 . =3D ALIGN(POINTER_ALIGN);=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > =C2=A0=C2=A0 +=C2=A0 DECL_SECTION(secname) {=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _sdevice =3D .;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(secname)=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _edevice =3D .;=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0 +=C2=A0 } :text
> > (A similar approach is used for ACPI, please refer to the next
> > patch in
> > this series.)
> >=20
> > For PPC, DECL_SECTION should specify a load address, whereas for
> > Arm
> > and RISC-V, it should not.
> >=20
> > With this generalization, the name of DECL_SECTION should have the
> > same
> > name in both cases, whether a load address needs to be specified or
> > not
>=20
> Oh, sorry, I think you misunderstood my suggestion.
>=20
> I'm not suggesting to introduce a new macro named
> DECL_SECTION_WITH_LADDR(), but rather to use DECL_SECTION_WITH_LADDR
> instead of SIMPLE_DECL_SECTION in order to signal whether
> DECL_SECTION() should specify a load address or not, iow:
>=20
> #ifdef DECL_SECTION_WITH_LADDR
> # define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
> #else
> # define DECL_SECTION(x) x :
> #endif
Thanks for the clarification, I really misunderstood your initial
suggestion.

I'm okay with the renaming; perhaps it will indeed make things a bit
clearer.

If Jan doesn=E2=80=99t mind (since he gave the Ack), I'll rename the define=
 in
the next patch version.
Jan, do you mind if I proceed with the renaming?

~ Oleksii

