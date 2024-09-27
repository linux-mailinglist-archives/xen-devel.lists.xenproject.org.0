Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4B598812B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2024 11:18:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.806141.1217464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su76X-0005Jm-UU; Fri, 27 Sep 2024 09:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 806141.1217464; Fri, 27 Sep 2024 09:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1su76X-0005Hi-Rt; Fri, 27 Sep 2024 09:17:37 +0000
Received: by outflank-mailman (input) for mailman id 806141;
 Fri, 27 Sep 2024 09:17:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xL9K=QZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1su76W-0005Ha-HA
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2024 09:17:36 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5555eeab-7cb1-11ef-a0ba-8be0dac302b0;
 Fri, 27 Sep 2024 11:17:35 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a910860e4dcso279875266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2024 02:17:35 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2777baasm106899266b.25.2024.09.27.02.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 02:17:34 -0700 (PDT)
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
X-Inumbo-ID: 5555eeab-7cb1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727428655; x=1728033455; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0zaxKalu0XOz4UYu88JWd/ARXFbpUkcI2sgUrTCs6Gc=;
        b=HDWYKpIZv+MLPZCH+8l2ZlpA08B0hLTP5LDnWOPo29QceGYC2ld2F51Npd//8c3w81
         /0ahjNqG2HD9uvgJLUChSbV/Xh4jcbzuy5s2jy9hJ18YaPl9ySAyqN5TZimQt9pYW6mN
         rNXeoUoFc0FRccZNphevzgMIWFxXkJaRjK5Y+Bv16FnUK//6i639eUcUUsEvEd93b9LR
         5nIKl+eoSDWSiMf2C51kmnU5Y67gY+ur3daxM28GwgnWNBSneNDodqiVz+N4ceY9Zc5r
         bUdEMKSzwfDPPjK1wvyTIhT3/13vzjFPVDHn2ujalEid1Wvq6xMg4BvP4KgBx1BJDjpx
         /h+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727428655; x=1728033455;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zaxKalu0XOz4UYu88JWd/ARXFbpUkcI2sgUrTCs6Gc=;
        b=s7vHsAlQICWU47ni4COW4a1aNsDmK6dOAX+jc6EoihScz5iLOH0cm/vtdacUeP9/pm
         qhVAve0Al+5RGbulKlEJ6/dMTi70UPjVnipB0K1CbEJD0va1G2qIRy6V58HEpC5OiIzd
         EHQ5cj9DL4YEeAtB3890p9SKlz0Y/YmbMHarIrQhvAJQnb/rUsN7bwo8Aja8WN51qD7z
         d5RS3zuUTLHlhQPoiihgDJKC27fjWKc2ikEhbn3gGnLFzNkqzb52R1uri1wuKg71Wgsy
         99zJXTsKpzLStLmn2cEec3eNjtqudRjaxDpsHWWTotFhnr9N3xCPD2saYWYULtL/4NjF
         safA==
X-Forwarded-Encrypted: i=1; AJvYcCURjgJU+cptqyR357GV9p6SQfdPVlJZjHykef1WVq0/7sE+ByKYRSyUrItO0Fa2N+RB6Cf2NO6+XmU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqbuvbfFbSmUoK94T79a1gHsLTJdqkzdiYJquKrk4GwYxi+WiG
	lXIUKM31J99/zfEum3RXGNFNM601z7gPgi3Ux3ugYfV0v4Jo1j3M
X-Google-Smtp-Source: AGHT+IFSCmPMyECluE5cqJlU8d/z7y9Z2QvVFSTD/oLesIno4wpXCAX3CBz2widedVOTzthIMSJnGg==
X-Received: by 2002:a17:907:74b:b0:a86:97e5:8d4e with SMTP id a640c23a62f3a-a93c4909819mr207197866b.23.1727428654767;
        Fri, 27 Sep 2024 02:17:34 -0700 (PDT)
Message-ID: <b84977a758ce501d4d952793c0b1f7f30db49f78.camel@gmail.com>
Subject: Re: [PATCH v4 3/6] xen/arm: use {DT,ACPI}_DEV_INFO for device info
 sections
From: oleksii.kurochko@gmail.com
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Date: Fri, 27 Sep 2024 11:17:33 +0200
In-Reply-To: <fc736022-1114-48f8-a20e-fd67060716f8@amd.com>
References: <cover.1727365854.git.oleksii.kurochko@gmail.com>
	 <fc4243be6e43224f27311d96512dc0f465c73a38.1727365854.git.oleksii.kurochko@gmail.com>
	 <fc736022-1114-48f8-a20e-fd67060716f8@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

Hi Michal,

On Fri, 2024-09-27 at 09:16 +0200, Michal Orzel wrote:
> Hi Oleksii,
>=20
> On 26/09/2024 18:54, Oleksii Kurochko wrote:
> >=20
> >=20
> > Refactor arm/xen.lds.S by replacing the inline definitions for
> > device info sections with the newly introduced {DT,ACPI}_DEV_INFO
> > macros from xen/xen.lds.h.
>=20
> I would expect so see a note about s/8/POINTER_ALIGN/ that it's safe
> to do that.
Agree, it would be good to mention, so I will update the commit message
in the next patch version.

>=20
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V4:
> > =C2=A0- use newly refactored ACPI_DEV_INFO and DT_DEV_INFO
> > ---
> > Changes in V3:
> > =C2=A0- use refactored ADEV_INFO and DT_DEV_INFO macros.
> > ---
> > =C2=A0xen/arch/arm/xen.lds.S | 16 ++++------------
> > =C2=A01 file changed, 4 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> > index 0987052f1a..3b7b677197 100644
> > --- a/xen/arch/arm/xen.lds.S
> > +++ b/xen/arch/arm/xen.lds.S
> > @@ -4,6 +4,8 @@
> >=20
> > =C2=A0#include <xen/cache.h>
> > =C2=A0#include <xen/lib.h>
> > +
> > +#define SIMPLE_DECL_SECTION
> > =C2=A0#include <xen/xen.lds.h>
> > =C2=A0#include <asm/page.h>
> > =C2=A0#undef ENTRY
> > @@ -124,20 +126,10 @@ SECTIONS
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _eplatform =3D .;
> > =C2=A0=C2=A0 } :text
> >=20
> > -=C2=A0 . =3D ALIGN(8);
> > -=C2=A0 .dev.info : {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _sdevice =3D .;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.dev.info)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _edevice =3D .;
> > -=C2=A0 } :text
> > +=C2=A0 DT_DEV_INFO(.dev.info)
> >=20
> > =C2=A0#ifdef CONFIG_ACPI
> > -=C2=A0 . =3D ALIGN(8);
> > -=C2=A0 .adev.info : {
> The name of the section is ".adev.info", but ...
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _asdevice =3D .;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(.adev.info)
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 _aedevice =3D .;
> > -=C2=A0 } :text
> > +=C2=A0 ACPI_DEV_INFO(adev.info)
> here you're missing the leading dot which will cause the probe to
> fail.
Overlooked that, interesting then out CI&CD doesn't check CONFIG_ACPI
for ARM enough... Anyway, I will update that in the next patch version.

>=20
> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks.

~ Oleksii


