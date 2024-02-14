Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD78285456A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:34:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680306.1058372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBev-0007k3-Az; Wed, 14 Feb 2024 09:34:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680306.1058372; Wed, 14 Feb 2024 09:34:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBev-0007iN-8F; Wed, 14 Feb 2024 09:34:29 +0000
Received: by outflank-mailman (input) for mailman id 680306;
 Wed, 14 Feb 2024 09:34:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raBet-0007fU-M5
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:34:27 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e496152-cb1c-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 10:34:26 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5638dbf1417so43352a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:34:26 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j2-20020aa7de82000000b005621b45daffsm651262edv.28.2024.02.14.01.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 01:34:25 -0800 (PST)
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
X-Inumbo-ID: 3e496152-cb1c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707903265; x=1708508065; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hP4kZLnN1WW8YJLFPK9+BmBruAYbYOdwq2j5yxpv070=;
        b=a3typs2NwxCM4y+xt0TNH5sBEE0sqCWI0wxru9dAqpmGJVIaC7vOi6Bn5GAtkpXim6
         /TD4LL6b+pnla4sM/+iHPMYogGWVvJ2JPFvuAJEaWZ//5oaAcHeYHE2IkkJDaPNHNRbU
         XADkqqa06KjkB52wczFGg2N3RHbwgE/5hAyJpcnLib1QljvMa4EGNJW5Ndyfu+pyfhTp
         x1ygGDB516LVexd91VluVobKf4bc/MMixdC1PRVzO7ytoklpJ9opPx5gbUhX237RFcsU
         vlFaiGY4XzTJPVjC80igexwRkcgaXvdEnHvfVwOA9HIHAbyiJK/mER9JnmQnK6jBz2oo
         3rgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707903265; x=1708508065;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hP4kZLnN1WW8YJLFPK9+BmBruAYbYOdwq2j5yxpv070=;
        b=L5karuSn3nrQz86Rs3Ff4cMyxq6B3KNrIhEaxWT83RPnv2VLtysG3WQ6B4gTmNy3Sv
         EzMpJi/9B5bHI4HNYRe0AN0owJBmsLzfv+09aLW1G3gwmd2i9B/7TYcKungubpsplbgL
         kabY+UdgkF7r7FnlyRIF8AcprPvO+4WGRty30oJCPKrBZrsDs4P07Eo3RlcYWbkZAnZU
         mYTJKylnEhzKfcfHMEMpT3NOjSEo1UPam0lwZqgyPMXxLKGoYjfXOe7BWIF95hu6+sDg
         oGCAr+2kAW+TFsVM/HqicpDLFVZZ/ZCv6hFeKYLYgfDZXJyT/1OBdL+M59cqa6By0NGd
         v5Ww==
X-Forwarded-Encrypted: i=1; AJvYcCU1SBKttrOlV8p95t0ta6Lzg9SXqUyPzjyHkMCerWdi1Q0un5V5HvtwZjCkNgnU89Hu/5G5cVXzKexU0rs+0NELnzwqa57EKaaS5PamN+w=
X-Gm-Message-State: AOJu0YyLrDNO5Zj/ocDjrW/DmUeXDVQpmqCIaqm/WtMyLx2iWbifuu+T
	kCn7MmjetVYXqAbEUlmtPcsmPBOSwQLVL6vqrEB/xP0MngBvhtZkRDtrLoqK
X-Google-Smtp-Source: AGHT+IEIlYGC6H37Zpz4V7TnbqcQepqhVKppa5hQl8CnG6YSmb/T2tgIUGKG3uV/EsJndymRRQ+oUg==
X-Received: by 2002:aa7:d1cb:0:b0:55f:99:c895 with SMTP id g11-20020aa7d1cb000000b0055f0099c895mr1574912edp.20.1707903265455;
        Wed, 14 Feb 2024 01:34:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUGZGyJOAetSdRCzRT8wk7AEWUt1WwA9F6F0d6JO62L8G+SVP5gz5fd9xAH6hnuyx31zMb7nLB86lhZLtdmpjAFjGyQS5XCrb0/xgbT8XMSBPL/P+2QVSFnTbIdlvtLDzIPDQSY0x8ykf5T6py311EfzO+VDmgDkuDfn01IXe+t7feuPJy9ifcN4eyISs5BErRtfbng//hR+ssp
Message-ID: <f76b81ca2e4c057e266597de2a00179c039a20d9.camel@gmail.com>
Subject: Re: [PATCH v8 6/7] xen/arm: switch Arm to use asm-generic/device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
	Babchuk <Volodymyr_Babchuk@epam.com>
Date: Wed, 14 Feb 2024 10:34:24 +0100
In-Reply-To: <cd2091d2-ac71-4d6f-a9a2-e7444889af69@xen.org>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
	 <ae256e804cbfd3c5d17ef9d17f100ebbf17c48fc.1707499278.git.oleksii.kurochko@gmail.com>
	 <cd2091d2-ac71-4d6f-a9a2-e7444889af69@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Julien,

On Tue, 2024-02-13 at 18:12 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 09/02/2024 18:00, Oleksii Kurochko wrote:
> > The following changes were done as a result of switching to
> > asm-generic/device.h:
> > =C2=A0 * DEVICE_GIC was renamed to DEVICE_INTERRUPT_CONTROLLER accordin=
g
> > =C2=A0=C2=A0=C2=A0 to definition of enum device_class in asm-generic/de=
vice.h.
> > =C2=A0 * acpi-related things in Arm code were guarded by #ifdef
> > CONFIG_ACPI
> > =C2=A0=C2=A0=C2=A0 as struct acpi_device_desc was guarded in asm-generi=
c, also
> > functions
> > =C2=A0=C2=A0=C2=A0 acpi_device_init() was guarded too as they are using=
 structure
> > =C2=A0=C2=A0=C2=A0 acpi_device_desc inside.
> > =C2=A0 * drop arm/include/asm/device.h and update
> > arm/include/asm/Makefile
> > =C2=A0=C2=A0=C2=A0 to use asm-generic/device.h instead.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V8:
> > =C2=A0 - update the commit message
> > ---
> > Changes in V7:
> > =C2=A0 - newly introduced patch which is based on the previous version
> > of the patch:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v6 9/9] xen/asm-generic: introduc=
e generic device.h
> > ---
> > =C2=A0 xen/arch/arm/device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 ++
> > =C2=A0 xen/arch/arm/domain_build.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 2 +-
> > =C2=A0 xen/arch/arm/gic-v2.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A0 xen/arch/arm/gic-v3.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> > =C2=A0 xen/arch/arm/gic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A0 xen/arch/arm/include/asm/Makefile |=C2=A0=C2=A0 1 +
> > =C2=A0 xen/arch/arm/include/asm/device.h | 124 ------------------------=
-
> > -----
> > =C2=A0 7 files changed, 14 insertions(+), 132 deletions(-)
> > =C2=A0 delete mode 100644 xen/arch/arm/include/asm/device.h
> >=20
> > diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> > index 1f631d3274..3e02cff008 100644
> > --- a/xen/arch/arm/device.c
> > +++ b/xen/arch/arm/device.c
> > @@ -16,7 +16,10 @@
> > =C2=A0 #include <xen/lib.h>
> > =C2=A0=20
> > =C2=A0 extern const struct device_desc _sdevice[], _edevice[];
> > +
> > +#ifdef CONFIG_ACPI
> > =C2=A0 extern const struct acpi_device_desc _asdevice[], _aedevice[];
> > +#endif
>=20
> Can you also update the linker script to protect the following code?
Sure, I'll update that. Also please look at my comment to the previous
patch. Perhaps, it will be needed to update this patch to ifdef
device_init() and device_get_class(), and provide stubs for them in
case of !CONFIG_HAS_DEVICE_TREE.


> I.e
>=20
> #ifdef CONFIG_ACPI
> =C2=A0=C2=A0 . =3D ALIGN(8);
> =C2=A0=C2=A0 .adev.info : {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _asdevice =3D .;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.adev.info)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _aedevice =3D .;
> =C2=A0=C2=A0 } :text
> #endif
>=20
> With this change:
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>
Thanks.

~ Oleksii

