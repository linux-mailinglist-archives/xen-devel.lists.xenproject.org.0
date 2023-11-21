Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EF07F339E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:25:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638021.994214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TYx-00073A-6G; Tue, 21 Nov 2023 16:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638021.994214; Tue, 21 Nov 2023 16:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5TYx-000711-2y; Tue, 21 Nov 2023 16:25:23 +0000
Received: by outflank-mailman (input) for mailman id 638021;
 Tue, 21 Nov 2023 16:25:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFE0=HC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r5TYw-0006qb-22
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:25:22 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9031ed7c-888a-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 17:25:20 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-5094727fa67so8068734e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:25:20 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 o28-20020a056512051c00b0050803043fc6sm1550579lfb.265.2023.11.21.08.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:25:19 -0800 (PST)
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
X-Inumbo-ID: 9031ed7c-888a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700583919; x=1701188719; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47yycUsoKmn4Gh8IfmaxV44dJhmZh8poZtbNozqLB24=;
        b=GJNjHsq/arzvvB47JehbnjwD9DArwYGXrJ/LSy4M2YFq3yiiw1mgWBm9U7B+Y1bI0D
         vpUWzxB0SiQGYbVmcAzvkuUg+WxtZJuE1E7NFUzwfPz4t2tMgzxyvvyeYaP6sRLmeYcn
         MteFhsqEPY2MaEcM1HFExQIXiJToyKsNGtlrA1uQ26EjrBefT5vVC0/HiAkBzIymwKq0
         RBzpUQ62gioEL4GP9D/hTmCXR8L4vNaJiwVAIgyckfy5BkGcwCY6/wi8nrJqB3AXI5wA
         NtaMd1tVQAdSjq2NRgggWEiYDVLPnYt4kAGAZ42jdyzsY2zRrme303ol1VPyI529FcMc
         3NUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700583919; x=1701188719;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47yycUsoKmn4Gh8IfmaxV44dJhmZh8poZtbNozqLB24=;
        b=QoaGlZPSUTB5cJNUqKXE9ce1I96QWyvVoSU35vX3UOZdwXkr86sfTNx1dlvpIP760A
         L9tc7NZ0hIS6tBPZpo5+Wpp8BQ085EgKhLDdwwqTwe7TjANvF6ihVsJbvZQJyVzpFwaC
         3SlLyEegIAhJGQt+666mDWZ1arAw7+2Xt5gtO/Fh5Bco3otBeqSQ7IHiySVp61bTBnjJ
         2Kvf/z1VnCcagjxd7E6bm51xqfpGCgfkYyU/5tgSLB9T8SAxEQcIAHVMguRliM8pvetK
         ntsg8bfEl3mYiU/P6o/X5JKKHW/Dn9bCMU4BCa/ySCIAWyjCHWaOHmOzLXZCraBaI8pH
         AOEw==
X-Gm-Message-State: AOJu0Yx6MEtTxBc9tG9VGsA+YtLkUD2/n0odcYXWmJurO4w9PGVLqe19
	XvSrAklEP9Qn85UrClp/bFQ=
X-Google-Smtp-Source: AGHT+IE0EZryTku4UbHKMy4+a/nJN0XCSRzQhCIbvbrSTfhKh8QPg3xUbxw/EwkHEnU64wr3sNgu1A==
X-Received: by 2002:ac2:549c:0:b0:509:46ff:6e57 with SMTP id t28-20020ac2549c000000b0050946ff6e57mr8037689lfk.8.1700583919379;
        Tue, 21 Nov 2023 08:25:19 -0800 (PST)
Message-ID: <86606d584d55a29a27649f422fd086945727217b.camel@gmail.com>
Subject: Re: [PATCH v3 02/14] xen/asm-generic: introduce generic device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 21 Nov 2023 18:25:17 +0200
In-Reply-To: <f2fc40bc-15b7-4810-b3da-f7ef64b6e798@suse.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
	 <65b267137539704df7f22b37e3b0a9b372a82b33.1700221559.git.oleksii.kurochko@gmail.com>
	 <f2fc40bc-15b7-4810-b3da-f7ef64b6e798@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-11-21 at 16:43 +0100, Jan Beulich wrote:
> On 17.11.2023 13:24, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/device.h
> > @@ -0,0 +1,147 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_DEVICE_H__
> > +#define __ASM_GENERIC_DEVICE_H__
> > +
> > +enum device_type
> > +{
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +=C2=A0=C2=A0=C2=A0 DEV_DT,
> > +#endif
> > +
> > +#ifdef HAS_PCI
>=20
> CONFIG_HAS_PCI?
Should be CONFIG_HAS_PCI. Thanks.

>=20
> > +=C2=A0=C2=A0=C2=A0 DEV_PCI,
> > +#endif
> > +};
> > +
> > +struct dev_archdata {
> > +=C2=A0=C2=A0=C2=A0 void *iommu;=C2=A0=C2=A0=C2=A0 /* IOMMU private dat=
a */
>=20
> #ifdef CONFIG_HAS_PASSTHROUGH around this field?
It makes sense to #ifdef iommu and iommu_fwspec fields. I'll add it.

>=20
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
> > +=C2=A0=C2=A0=C2=A0 struct iommu_fwspec *iommu_fwspec; /* per-device IO=
MMU
> > instance data */
>=20
> Same here then?
>=20
> > +};
> > +
> > +typedef struct device device_t;
> > +
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +#include <xen/device_tree.h>
> > +#endif
> > +
> > +#ifdef HAS_PCI
> > +#define dev_is_pci(dev) ((dev)->type =3D=3D DEV_PCI)
> > +#endif
> > +
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +#define dev_is_dt(dev)=C2=A0 ((dev)->type =3D=3D DEV_DT)
> > +#endif
> > +
> > +enum device_class
> > +{
> > +=C2=A0=C2=A0=C2=A0 DEVICE_SERIAL,
> > +=C2=A0=C2=A0=C2=A0 DEVICE_IOMMU,
> > +=C2=A0=C2=A0=C2=A0 DEVICE_IC,
>=20
> What is IC here? (And thus: Is this generic enough to live here?)
It is Interrupt Controller. I think yes, it should live here and is
expected to use by Arm, RISC-V and PPC.

>=20
> > +#ifdef HAS_PCI
> > +=C2=A0=C2=A0=C2=A0 DEVICE_PCI_HOSTBRIDGE,
> > +#endif
> > +=C2=A0=C2=A0=C2=A0 /* Use for error */
> > +=C2=A0=C2=A0=C2=A0 DEVICE_UNKNOWN,
> > +};
> > +
> > +struct device_desc {
> > +=C2=A0=C2=A0=C2=A0 /* Device name */
> > +=C2=A0=C2=A0=C2=A0 const char *name;
> > +=C2=A0=C2=A0=C2=A0 /* Device class */
> > +=C2=A0=C2=A0=C2=A0 enum device_class class;
> > +=C2=A0=C2=A0=C2=A0 /* List of devices supported by this driver */
> > +=C2=A0=C2=A0=C2=A0 const struct dt_device_match *dt_match;
>=20
> This and ...
>=20
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Device initialization.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * -EAGAIN is used to indicate that device pro=
bing is
> > deferred.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 int (*init)(struct dt_device_node *dev, const void =
*data);
>=20
> ... this look to be DT-specific.
They are. I'll ifdef it.

>=20
> > +};
> > +
> > +#ifdef CONFIG_ACPI
> > +
> > +struct acpi_device_desc {
> > +=C2=A0=C2=A0=C2=A0 /* Device name */
> > +=C2=A0=C2=A0=C2=A0 const char *name;
> > +=C2=A0=C2=A0=C2=A0 /* Device class */
> > +=C2=A0=C2=A0=C2=A0 enum device_class class;
> > +=C2=A0=C2=A0=C2=A0 /* type of device supported by the driver */
> > +=C2=A0=C2=A0=C2=A0 const int class_type;
> > +=C2=A0=C2=A0=C2=A0 /* Device initialization */
> > +=C2=A0=C2=A0=C2=A0 int (*init)(const void *data);
> > +};
> > +
> > +/**
> > + *=C2=A0 acpi_device_init - Initialize a device
> > + *=C2=A0 @class: class of the device (serial, network...)
> > + *=C2=A0 @data: specific data for initializing the device
> > + *
> > + *=C2=A0 Return 0 on success.
> > + */
> > +int acpi_device_init(enum device_class class,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const void *data, int c=
lass_type);
> > +
> > +#endif /* CONFIG_ACPI */
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
>=20
> As is this, simply from its first parameter's type.
I missed to take changes related to ifdef-ing DT related things to this
version of device.h. So I'll update that.

>=20
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
> > +
> > +#define
> > DT_DEVICE_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +};
>=20
> And all of these.

Probably it also make sense to swtich Arm and PPC to asm-generic
device.h file.

~ Oleksii


