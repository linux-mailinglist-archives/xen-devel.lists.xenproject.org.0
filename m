Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E32197829D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 16:35:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798240.1208395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7OX-0002CA-KK; Fri, 13 Sep 2024 14:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798240.1208395; Fri, 13 Sep 2024 14:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sp7OX-00029d-HL; Fri, 13 Sep 2024 14:35:33 +0000
Received: by outflank-mailman (input) for mailman id 798240;
 Fri, 13 Sep 2024 14:35:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aSyI=QL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sp7OV-000296-Lm
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 14:35:31 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d2643c1-71dd-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 16:35:30 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2f75c56f16aso30552601fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 07:35:30 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f75bfe7fb8sm22642801fa.4.2024.09.13.07.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 07:35:29 -0700 (PDT)
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
X-Inumbo-ID: 6d2643c1-71dd-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726238130; x=1726842930; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jQIxYgRrRaRN7ORg4Ka+yGJBTy7PvDovRa09FLDYaa4=;
        b=KqFHJcTyz2RLMMePbSwln64Hlti8b14PeQU6J6uCQp4mcEwEvhKH/D5LJ15Aq1Zw1A
         RfMAnKYYlAjIIBnzGZq8DdGWG4ORnpYa8wpJ1U1td8v6zMZKMEEStaR/xA1zb2HAmrwZ
         GpDz2D3z5/iL7DG5N6hNfThOZDM30/kEYvJ2aEZKyoPMvDgteMYhzpwIbhCtz5lgJAvO
         6emsfuL66F/NFY6FB/pmAir75czbdXWaJWBx+lMMHBafBQbTdJwQWsdllE4dGL9LVo5g
         6O71teOpKtzXh93mov1ELyBS+VFyOb1hrc9YF/4AefhPKV2T+3uGDfzVtGWKZtIni1ru
         2cvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726238130; x=1726842930;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jQIxYgRrRaRN7ORg4Ka+yGJBTy7PvDovRa09FLDYaa4=;
        b=uXiJixuLc1janVOWtsBNYVNabQGero7B6MU0guEcld8VxBBdicj6DA5ZSTC+zE+/Nx
         1jM7E4AkW89JyzjOvwKNm/8clOxDTQXAKQ0BpOvZmSP2nc8GrX8/d2ryuLG3UZBKL5MG
         Q+vtUUU5aBe6FHPGGpFUaDNOXlTCYV9i3N0VSMPgXxbrqQ/BoO1zlEnd6Ls4C6gIx2xf
         gE6u3e6HQNtLpeKKv2/6LVjNhyEADdHkG3aQ75naG1OacapXOSQ+O1fwwsma0s/9Pls8
         avuIYhwCpPFwqENxAdOFh9gTX4birb9hFr1Cdx6UNelEwEJ1G8ZAIraOuPAFXOnfZ0me
         HKDA==
X-Forwarded-Encrypted: i=1; AJvYcCVuRs+sSIz3fwNlqARSCByFfaJBQ3bWGSegJQd+mc2YHBCNh/j3g5RQ3pzZOMESMTM+Xh4Ok8H1IyU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuQ8/bz6g0MD9Kl5YVOiDye3eV6hOmlH39Tjt7R+630nclJplu
	FHRQk96vm1RNeXJGPSnfCATy+aZ9nLyAznchaGMxPH3zKxS7pCDt
X-Google-Smtp-Source: AGHT+IEr1pFO6SjXiLZpQt7z6JPBmP8yDE/XmWyL06UAnNpgHZZQPHvDU4Elb5CJ2SMG0QIFe57v1Q==
X-Received: by 2002:a05:651c:1509:b0:2f7:4e8c:9bfa with SMTP id 38308e7fff4ca-2f787f1c7ffmr40461301fa.33.1726238129520;
        Fri, 13 Sep 2024 07:35:29 -0700 (PDT)
Message-ID: <f3a16db18f98a4fff3a4b59f144d4a2fee815465.camel@gmail.com>
Subject: Re: [PATCH v1 3/3] xen/common: move device initialization code to
 common code
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 xen-devel@lists.xenproject.org
Date: Fri, 13 Sep 2024 16:35:28 +0200
In-Reply-To: <9764051a-c4a7-4c3d-9760-1f80d5faa559@suse.com>
References: <cover.1726048521.git.oleksii.kurochko@gmail.com>
	 <128d17f3625807a26875b7a419fb56610424b18c.1726048521.git.oleksii.kurochko@gmail.com>
	 <9764051a-c4a7-4c3d-9760-1f80d5faa559@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-09-12 at 17:28 +0200, Jan Beulich wrote:
> On 11.09.2024 12:04, Oleksii Kurochko wrote:
> > --- a/xen/common/Makefile
> > +++ b/xen/common/Makefile
> > @@ -6,6 +6,7 @@ obj-$(CONFIG_HYPFS_CONFIG) +=3D config_data.o
> > =C2=A0obj-$(CONFIG_CORE_PARKING) +=3D core_parking.o
> > =C2=A0obj-y +=3D cpu.o
> > =C2=A0obj-$(CONFIG_DEBUG_TRACE) +=3D debugtrace.o
> > +obj-$(call or,$(CONFIG_HAS_DEVICE_TREE),$(CONFIG_HAS_ACPI)) +=3D
> > device.o
>=20
> I can't spot any HAS_ACPI in the tree. And if this was switched to
> CONFIG_ACPI
> I'd further ask why the file needs building on x86.
Oh, there is no need for building this on x86. With what you suggested
here ...

>=20
> Also I think I'd prefer to avoid the of the "or" macro here:
>=20
> obj-$(CONFIG_ACPI) +=3D device.o
> obj-$(CONFIG_HAS_DEVICE_TREE) +=3D device.o
... IIUC it will fix the issue with building this file for x86 as
CONFIG_ACPI depends on (ARM_64 && ARM_EFI).

>=20
> ought to be quite fine. There's de-duplication somewhere for what
> $(obj-y) lists.
>=20
> > --- /dev/null
> > +++ b/xen/common/device.c
> > @@ -0,0 +1,82 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Based on the code from:
> > + *=C2=A0=C2=A0 xen/arch/arm/device.c
> > + */
> > +
> > +#include <xen/bug.h>
> > +#include <xen/device_tree.h>
> > +#include <xen/errno.h>
> > +#include <xen/init.h>
> > +
> > +#include <asm-generic/device.h>
> > +
> > +#ifdef CONFIG_ACPI
> > +extern const struct acpi_device_desc _asdevice[], _aedevice[];
>=20
> Why does this live separately here, rather than ...
>=20
> > +#endif
> > +
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +
> > +extern const struct device_desc _sdevice[], _edevice[];
>=20
> ... like this ...
>=20
> > +int __init device_init(struct dt_device_node *dev, enum
> > device_class class,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const void =
*data)
> > +{
> > +=C2=A0=C2=A0=C2=A0 const struct device_desc *desc;
> > +
> > +=C2=A0=C2=A0=C2=A0 ASSERT(dev !=3D NULL);
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( !dt_device_is_available(dev) ||
> > dt_device_for_passthrough(dev) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=C2=A0 -ENODEV;
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( desc =3D _sdevice; desc !=3D _edevice; desc++=
 )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( desc->class !=3D class=
 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 con=
tinue;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( dt_match_node(desc->dt=
_match, dev) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASS=
ERT(desc->init !=3D NULL);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn desc->init(dev, data);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return -EBADF;
> > +}
> > +
> > +enum device_class device_get_class(const struct dt_device_node
> > *dev)
> > +{
> > +=C2=A0=C2=A0=C2=A0 const struct device_desc *desc;
> > +
> > +=C2=A0=C2=A0=C2=A0 ASSERT(dev !=3D NULL);
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( desc =3D _sdevice; desc !=3D _edevice; desc++=
 )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( dt_match_node(desc->dt=
_match, dev) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn desc->class;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return DEVICE_UNKNOWN;
> > +}
> > +
> > +#endif
> > +
> > +#ifdef CONFIG_ACPI
>=20
> ... in the section where it's needed? Leaving just one #ifdef for
> ACPI.
Just tried to follow the approach that first is going variables
declaration/definitions and then functions. But I am okay to move it to
CONFIG_ACPI #ifdef CONFIG_ACPI ... #endif.

Thanks.

~ Oleksii

