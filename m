Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B537849B53
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:03:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676023.1051776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWyd2-0006Cp-4t; Mon, 05 Feb 2024 13:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676023.1051776; Mon, 05 Feb 2024 13:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWyd2-0006Ah-1T; Mon, 05 Feb 2024 13:03:16 +0000
Received: by outflank-mailman (input) for mailman id 676023;
 Mon, 05 Feb 2024 13:03:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rWyd0-0006Ab-8M
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:03:14 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ead80a6b-c426-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 14:03:12 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2cf3ed3b917so53760481fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:03:12 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a05651c048b00b002d0a98330b3sm463428ljc.108.2024.02.05.05.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 05:03:11 -0800 (PST)
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
X-Inumbo-ID: ead80a6b-c426-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707138192; x=1707742992; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DjuTW+h/eS6V5ntAPTSQrDbv/oSKHjDglZUV3FxC1jM=;
        b=DPtyMCKFCul2mDVzM1cZ8pQH+vTov+Ut5VEZPlsTwKWzM0kDDu5ldLvIeYhSEzk6Gn
         6yKgG2kw44eweqCi56unQl6D9O11F5qgBzsDAkerjwfiAKNn9zpJBbE1pkcdH+2ch0+g
         2UdtrzlTLBFh225pNXp+m+jL8jn/mNm2WzuHRJRRVeS5N3A2wO6JZ9TSDbY2RUavjac2
         ABbA4qnCXO/YawS0D7eKeRUyw4fntRKb2dhNojrJGayxw4NdQGp4r1J81sRZbZHGj6rB
         hOXX2jK/DV/Yu96luRt50Q5jfFL37xX1ZjNCdI15UjB5XG21QUyD8Gx3TpZfAVmjNBhU
         dkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707138192; x=1707742992;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DjuTW+h/eS6V5ntAPTSQrDbv/oSKHjDglZUV3FxC1jM=;
        b=WlYmY9B4u3DlSsuCeRzl1oX1M3jGvNQBttxttEUN2CY7DzwlLT92ksPTycvB3Vl2Jg
         HGAj+yn1/mhoH8RugfwVwFqr0QP8aIU7qw3zVc5RgoFUt+ba7YiqKhU9OGoua2mR8jWK
         m+Kw5OzZ2LwVvDz19N5B3uaGazbaTLcdDO4eTWwbjOM3XAn1Tilo21oNt7RDDrwcFBdc
         /Za6Ok+QvyOMwgonkpx5jwldxxmtd/kG6+G3xSJWdhL4lW1Ivs6adiTLImjlzz0z2bXN
         +IP5oHys9c4Y2o8vWZeNS8vlBkW6dINSSjRs/qTTGGiGLfe+DIEg2Ym+PimZs8z/Znqn
         SMGg==
X-Gm-Message-State: AOJu0Yw0W4U1vapE9dwJCJrn8DoPcGDHVgG56eYGawku1WfkiOOMiqwO
	of2DpYLAMUMpKZjIa2KkZqvcLNVasZEVNr1kMARwxPcB62J1z2wv
X-Google-Smtp-Source: AGHT+IFRnFKuM/mN9Me7PDjUhz8T6c505MdFEUD0vq0fOyotGu4evIe57yl2pXJIdCuSa8kpX87aOQ==
X-Received: by 2002:a2e:9e10:0:b0:2cd:4883:6e25 with SMTP id e16-20020a2e9e10000000b002cd48836e25mr9898144ljk.50.1707138191557;
        Mon, 05 Feb 2024 05:03:11 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVWS/vbF0cVXfaf5vHhyYPt3XLsT4i5rPvZljThiZjDFUg5R/PdBtINOjB36uMU5DYsJTYXzTvRCAGs69pq/bm4gl0DlgbYTRSc5hRV2cXKZxII6e6oftGXyhejJHMkrB+ALQmzGbGaPXzsTvRAO/+bJMs/r2JzKmjfZsS+wylOxYc59tNWkcyHrlkvuNvf++eBgsyGcELLeNgwdFUoGz3l5NqtMmzLUNLrxQ==
Message-ID: <d26713350e9e8f584450acf4f102436a41217028.camel@gmail.com>
Subject: Re: [PATCH v7 6/7] xen/arm: switch Arm to use asm-generic/device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Date: Mon, 05 Feb 2024 14:03:10 +0100
In-Reply-To: <fdbfe86f-3b7c-4e35-90dc-ac64ee94fcd1@suse.com>
References: <cover.1706281994.git.oleksii.kurochko@gmail.com>
	 <d5d2b0515516f0554a0532ff4d4fbd9c704e0a1b.1706281994.git.oleksii.kurochko@gmail.com>
	 <fdbfe86f-3b7c-4e35-90dc-ac64ee94fcd1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-01-31 at 15:56 +0100, Jan Beulich wrote:
> On 26.01.2024 16:42, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> I'm not an Arm maintainer, but if I was I wouldn't let you get away
> with
> an empty description here. Specifically at least ...
>=20
> > --- a/xen/arch/arm/device.c
> > +++ b/xen/arch/arm/device.c
> > @@ -16,7 +16,10 @@
> > =C2=A0#include <xen/lib.h>
> > =C2=A0
> > =C2=A0extern const struct device_desc _sdevice[], _edevice[];
> > +
> > +#ifdef CONFIG_ACPI
> > =C2=A0extern const struct acpi_device_desc _asdevice[], _aedevice[];
> > +#endif
> > =C2=A0
> > =C2=A0int __init device_init(struct dt_device_node *dev, enum
> > device_class class,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const=
 void *data)
> > @@ -45,6 +48,7 @@ int __init device_init(struct dt_device_node
> > *dev, enum device_class class,
> > =C2=A0=C2=A0=C2=A0=C2=A0 return -EBADF;
> > =C2=A0}
> > =C2=A0
> > +#ifdef CONFIG_ACPI
> > =C2=A0int __init acpi_device_init(enum device_class class, const void
> > *data, int class_type)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 const struct acpi_device_desc *desc;
> > @@ -61,6 +65,7 @@ int __init acpi_device_init(enum device_class
> > class, const void *data, int class
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 return -EBADF;
> > =C2=A0}
> > +#endif
>=20
> ... this new #ifdef-ary would want justifying, imo.
It was added because all ACPI-related things are under #ifdef
CONFIG_ACPI. Therefore, if CONFIG_ACPI is disabled, it will result in a
compilation error.

Perhaps, you are right; it would be better to include this information
in the commit description.

~ Oleksii

