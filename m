Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F658849B34
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 13:59:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676018.1051766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWyZ9-0004Y2-LD; Mon, 05 Feb 2024 12:59:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676018.1051766; Mon, 05 Feb 2024 12:59:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWyZ9-0004V8-Hf; Mon, 05 Feb 2024 12:59:15 +0000
Received: by outflank-mailman (input) for mailman id 676018;
 Mon, 05 Feb 2024 12:59:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rWyZ8-0004V2-0Q
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 12:59:14 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c2183a8-c426-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 13:59:13 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-55a90a0a1a1so5471982a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 04:59:12 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a056402055700b0055fba4996d9sm3885294edx.71.2024.02.05.04.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 04:59:11 -0800 (PST)
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
X-Inumbo-ID: 5c2183a8-c426-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707137952; x=1707742752; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aekdhF8+mBnuPMS0XztHvPgSeHTu1C66eam1fhIlJ2A=;
        b=l55ROmaGy/kvQJZwzIoak4ZCVflHriz9+RDvlXUgMDwlG/8eWTN87f8jSxHx4FbvUG
         uL5EWELSPIHHOTP8whdc8WJjO9NOe59jnNRxLEAl4GhR3tHqBPV+C1BlCbJWHhOR+x0x
         Ky3Ue7LlyhdpWSdQcbtr+7WrR5Wea5vi+BakcE6/OitlewKQgfT/ToDi04wCqCrev67T
         XAlH57HVCCemP9F63W7mozwqqIBhmLaif2i6QvNCckS2H8t7NqU7ar1NiQO98ZTD6T3s
         ARyzKicJ3gWjx6XWqlaDoD1ENo0WUQ6te4GcMAN05u2cnAac7kd2ovQze+P5vHI+Q9VM
         NDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137952; x=1707742752;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aekdhF8+mBnuPMS0XztHvPgSeHTu1C66eam1fhIlJ2A=;
        b=ZIYl1X2MKSMmv+QfEfvw5wFK1Uwob24jPYZbgwCRj84RLamIndMB4OT6yJebUmnIvw
         KTjn15FoySJTdW6ep8HGtUidbJUL1OCy+OI1mSuA+LCtLZXGLcnFnq56JE39iObAThxT
         hZfxT9rFcBGjk9ijxAIgR+HUffJk5YYIc0VXgzfixN/j7brC2obRRD/DleqQzw8I4hXq
         esqignhTUXjGC4tuMHdGEPJMEQ1RZYGU6WaNsnagQSPQSovS0CqJqYzPEglJ5WUKw6Vr
         7W3wdH1YPgGQUgpHsMHanXJVa2+U8x3RrcLpK849dIQ7boptgbh1GoKF1me6nazTxOlb
         okkA==
X-Gm-Message-State: AOJu0YwuwBvIKn+g64SIhE466SDBB2Y1gpMin/xYELVXE4F/bcTGXOFh
	Pcp382kkpNtmuLgVTx0z+2LFA4jdp8VKKODohvdUdZMD9PPPilY9
X-Google-Smtp-Source: AGHT+IHHyvUujXCiv2azAf+10uecScQ75UBjG9WbKaCQVDxIjJFZ6EquwEjMLBTLfNqq1PBOQ6CA/Q==
X-Received: by 2002:aa7:c0d1:0:b0:55f:4602:bf7c with SMTP id j17-20020aa7c0d1000000b0055f4602bf7cmr5332115edp.28.1707137952302;
        Mon, 05 Feb 2024 04:59:12 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVTGg9rydxaYacFBKj4gsvGjy6FTtbeNsKL9yo5bxODu3jDv6jgRN059K/celqb1ZaiTBGOmOwwUtPWcAwOZPla1qSDMXqdofRBvgRFP2WGMomTOxT3giJ8KqNNz9Dw1AwQv4LODrWFdE7akYsqGd0OPhiGezhYgKqjYZM0OtEM5YitEBvD+VWMvqC4gBRMEeT6b0uabR/1q8mwkCk=
Message-ID: <1da6b3acbc07490323c007188e2f34500149b089.camel@gmail.com>
Subject: Re: [PATCH v7 5/7] xen/asm-generic: introduce generic device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 05 Feb 2024 13:59:10 +0100
In-Reply-To: <392e3c39-e984-4e4c-8ca9-f4a2f2ea86cf@suse.com>
References: <cover.1706281994.git.oleksii.kurochko@gmail.com>
	 <621ff5bd992ea8e6202ec03fa52c0e09aacd8f83.1706281994.git.oleksii.kurochko@gmail.com>
	 <392e3c39-e984-4e4c-8ca9-f4a2f2ea86cf@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-01-31 at 15:54 +0100, Jan Beulich wrote:
> On 26.01.2024 16:42, Oleksii Kurochko wrote:
> > Arm, PPC and RISC-V use the same device.h thereby device.h
> > was moved to asm-generic.
>=20
> It's not "move" anymore with the splitting off of the Arm and PPC
> parts. For reasons mentioned before, I'm not exactly happy with
> it not being a move anymore, but I expect you were asked to split.
>=20
> > Arm's device.h was taken as a base with
> > the following changes:
> > =C2=A0- #ifdef PCI related things.
>=20
> Well, not really, with ...
>=20
> > =C2=A0- #ifdef ACPI related things.
> > =C2=A0- Rename #ifdef guards.
> > =C2=A0- Add SPDX tag.
> > =C2=A0- #ifdef CONFIG_HAS_DEVICE_TREE related things.
> > =C2=A0- #ifdef-ing iommu related things with CONFIG_HAS_PASSTHROUGH.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V7:
> > =C2=A0- keeping DEVICE_PCI_HOSTBRIDGE available for every build based o=
n
> > the reply:
> > =C2=A0=C2=A0=C2=A0
> > https://lore.kernel.org/xen-devel/926a5c12-7f02-42ec-92a8-1c82d060c710@=
xen.org/
>=20
> ... this. Specifically ...
>=20
> > --- /dev/null
> > +++ b/xen/include/asm-generic/device.h
> > @@ -0,0 +1,162 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_DEVICE_H__
> > +#define __ASM_GENERIC_DEVICE_H__
> > +
> > +#include <xen/stdbool.h>
> > +
> > +/*
> > + * DEV_TYPE_MAX is currently not in use, but it was added because
> > the enum may
> > + * be empty when !HAS_DEVICE_TREE and !HAS_PCI, which could lead
> > to
> > + * a compilation error.
> > + */
> > +enum device_type
> > +{
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +=C2=A0=C2=A0=C2=A0 DEV_DT,
> > +#endif
> > +
> > +#ifdef CONFIG_HAS_PCI
> > +=C2=A0=C2=A0=C2=A0 DEV_PCI,
> > +#endif
>=20
> ... this is now inconsistent with ...
>=20
> > +=C2=A0=C2=A0=C2=A0 DEV_TYPE_MAX,
> > +};
> > +
> > +enum device_class
> > +{
> > +=C2=A0=C2=A0=C2=A0 DEVICE_SERIAL,
> > +=C2=A0=C2=A0=C2=A0 DEVICE_IOMMU,
> > +=C2=A0=C2=A0=C2=A0 DEVICE_INTERRUPT_CONTROLLER,
> > +=C2=A0=C2=A0=C2=A0 DEVICE_PCI_HOSTBRIDGE,
>=20
> ... this. Either we want PCI-related #ifdef-ary, or we don't. There
> shouldn't be a mix (unless there's a good reason).
Agreed, I overlooked the fact that we now have inconsistency.

Then it is needed to update remove CONFIG_HAS_PCI in device_type enum
too.

>=20
> Also the use of blank lines inside the earlier enum would better be
> consistent.
>=20
> > +=C2=A0=C2=A0=C2=A0 /* Use for error */
> > +=C2=A0=C2=A0=C2=A0 DEVICE_UNKNOWN,
> > +};
> > +
> > +struct dev_archdata {
> > +#ifdef CONFIG_HAS_PASSTHROUGH
> > +=C2=A0=C2=A0=C2=A0 void *iommu;=C2=A0=C2=A0=C2=A0 /* IOMMU private dat=
a */
> > +#endif
> > +};
> > +
> > +/* struct device - The basic device structure */
> > +struct device
> > +{
> > +=C2=A0=C2=A0=C2=A0 enum device_type type;
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +=C2=A0=C2=A0=C2=A0 struct dt_device_node *of_node; /* Used by drivers =
imported
> > from Linux */
> > +#endif
> > +=C2=A0=C2=A0=C2=A0 struct dev_archdata archdata;
> > +#ifdef CONFIG_HAS_PASSTHROUGH
> > +=C2=A0=C2=A0=C2=A0 struct iommu_fwspec *iommu_fwspec; /* per-device IO=
MMU
> > instance data */
> > +#endif
> > +};
> > +
> > +typedef struct device device_t;
> > +
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +
> > +#include <xen/device_tree.h>
> > +
> > +#define dev_is_dt(dev)=C2=A0 ((dev)->type =3D=3D DEV_DT)
> > +
> > +/**
> > + *=C2=A0 device_init - Initialize a device
> > + *=C2=A0 @dev: device to initialize
> > + *=C2=A0 @class: class of the device (serial, network...)
> > + *=C2=A0 @data: specific data for initializing the device
> > + *
> > + *=C2=A0 Return 0 on success.
> > + */
> > +int device_init(struct dt_device_node *dev, enum device_class
> > class,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 const void *data);
> > +
> > +/**
> > + * device_get_type - Get the type of the device
> > + * @dev: device to match
> > + *
> > + * Return the device type on success or DEVICE_ANY on failure
> > + */
> > +enum device_class device_get_class(const struct dt_device_node
> > *dev);
> > +
> > +#define DT_DEVICE_START(_name, _namestr,
> > _class)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>=20
> Would be really nice if in the course of generalization these leading
> underscores would also disappear. Yes, that'll require changing two
> of the names more than just to drop the underscores, to account for
> ...
>=20
> > +static const struct device_desc __dev_desc_##_name
> > __used=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +__section(".dev.info") =3D
> > {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 .name =3D
> > _namestr,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 .class =3D
> > _class,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>=20
> ... these field names.
>=20
> Also there's a strack backslash on the last line above.
Sure, I'll drop the leading underscores. Thanks.

~ Oleksii
>=20
> Both comments similarly apply to the ACPI stuff further down.
>=20
> > +#define
> > DT_DEVICE_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +};
> > +
> > +#else /* !CONFIG_HAS_DEVICE_TREE */
> > +#define dev_is_dt(dev) ((void)(dev), false)
> > +#endif /* CONFIG_HAS_DEVICE_TREE */
> > +
> > +#ifdef CONFIG_HAS_PCI
> > +#define dev_is_pci(dev) ((dev)->type =3D=3D DEV_PCI)
> > +#else
> > +#define dev_is_pci(dev) ((void)(dev), false)
> > +#endif
> > +
> > +struct device_desc {
> > +=C2=A0=C2=A0=C2=A0 /* Device name */
> > +=C2=A0=C2=A0=C2=A0 const char *name;
> > +=C2=A0=C2=A0=C2=A0 /* Device class */
> > +=C2=A0=C2=A0=C2=A0 enum device_class class;
> > +
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +
> > +=C2=A0=C2=A0=C2=A0 /* List of devices supported by this driver */
> > +=C2=A0=C2=A0=C2=A0 const struct dt_device_match *dt_match;
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Device initialization.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * -EAGAIN is used to indicate that device pro=
bing is
> > deferred.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 int (*init)(struct dt_device_node *dev, const void =
*data);
> > +
> > +#endif
> > +};
> > +
> > +#ifdef CONFIG_ACPI
> > +
> > +struct acpi_device_desc {
> > +=C2=A0=C2=A0=C2=A0 /* Device name */
> > +=C2=A0=C2=A0=C2=A0 const char *name;
> > +=C2=A0=C2=A0=C2=A0 /* Device class */
> > +=C2=A0=C2=A0=C2=A0 enum device_class class;
>=20
> I understand it's this way on Arm right now, and I'm also not going
> to insist that you do anything about it right here, but it's still
> odd that struct device_desc doesn't simply have a union to cover for
> both DT and ACPI.
>=20
> Jan


