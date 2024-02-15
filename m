Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA17F856A36
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 17:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681955.1060970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raf0D-0006Xj-MC; Thu, 15 Feb 2024 16:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681955.1060970; Thu, 15 Feb 2024 16:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raf0D-0006Ur-JA; Thu, 15 Feb 2024 16:54:25 +0000
Received: by outflank-mailman (input) for mailman id 681955;
 Thu, 15 Feb 2024 16:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G1Z8=JY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raf0C-0006Ul-6o
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 16:54:24 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd9d31a6-cc22-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 17:54:21 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d0d95e8133so13784941fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 08:54:22 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a2eb610000000b002d0a84eb8c3sm355843ljn.73.2024.02.15.08.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 08:54:20 -0800 (PST)
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
X-Inumbo-ID: dd9d31a6-cc22-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708016061; x=1708620861; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0AuLDYjI6N2/l1F0oTuaUxW/JzdP/wpTtUClGyEDJ0Y=;
        b=GyUbmooWLQSeg/OkLizL+FQATXdIV+xMGT5JDyZbxXumY+0JwlhKVUvdvfbgr7OLEu
         LP6flY55kXW7WZjVoqKTb3b+VRsgkrpCxjKqQ3oOuC5XVG9i1MqgPXqXawzd6wpUiT6i
         DVn7mEcV1UQTI/CMX8rgIHtxbx5j13Qb4l+0HAd442hcKb17C8otbC4+mQBVC5+HFHaX
         0QRr1T8HfjUiThg2AnDYK3/ZgCfS62kYWJTDtd37AI2XFuJ5qEDDSDjsl75mbTP1vMsY
         oHiGb3beuR5yQokc+CiQHT2bzqu2myh0YrcelQtjr+N8So1tn4OhlPT2/5N++UoO+HHY
         KWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708016061; x=1708620861;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0AuLDYjI6N2/l1F0oTuaUxW/JzdP/wpTtUClGyEDJ0Y=;
        b=INxy5m1cxdaWCJCA1FEXIaYRvYkg/Se5GT9usKzb2W2but4/VNR/XYwb19MTjoPjis
         wrY0VW+kWykylpcwVqjTCRYnEp1vV7Jv65G1Vc3YDzPlpXFtwhSgUQzIKqBQMzPuYBFE
         /Ddd391nYHREHns/fL0WC1erqEmwuJLx46NNQjZuK7uD7xfJs9b9c8qx9FVdRMmsXp8z
         Q/FwtkdxBKdnH0wKWSLaAH331k5RwTLjjHL8vU5XX2/hJ5l1v5tdA7mdxMvcMlpDPn0q
         Mc+hU8vNdR2LQSDtBW6SD9zRegrCmso/dNDLcj5aypKaselfLu4R5oTqstPGjNUOJI4k
         MWFA==
X-Forwarded-Encrypted: i=1; AJvYcCWQUABJAplLowMi1Xer59lAdf1B1mpvhqEqRUYcGb99f2wIWWSELL4e1FgyiNzxHbAABFSHtTUHXSsn7aI8zmONbh9/bs5GnT8mnMC4v8k=
X-Gm-Message-State: AOJu0YxiE1rlIwuEwLAoj2XVDHvk3Y7W72hTih/ZZpzDWVWZ1uDmX4pj
	tFN6NcV3yImtfFraGNOD4blmjOt6vY6V5lN5W4jFT60AUlGD0n91
X-Google-Smtp-Source: AGHT+IE65womX88jkCVy4Ex0k9LBizKCSsmKGRjUgJ+FsKuN8W4wCGUquGStJuIozslJvkf3VrOF6w==
X-Received: by 2002:a2e:9d97:0:b0:2d0:e1fc:9ca0 with SMTP id c23-20020a2e9d97000000b002d0e1fc9ca0mr1728400ljj.29.1708016061250;
        Thu, 15 Feb 2024 08:54:21 -0800 (PST)
Message-ID: <9fe0221a4c093fb5935ff3a519f2ef7180e569e1.camel@gmail.com>
Subject: Re: [PATCH v8 5/7] xen/asm-generic: introduce generic device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Thu, 15 Feb 2024 17:54:20 +0100
In-Reply-To: <3171ef24-bcb3-4387-ba32-f1c4d6c7220a@xen.org>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
	 <4ecb5e5f4a1dbf585ac7a9ebe40b5fd8e4709182.1707499278.git.oleksii.kurochko@gmail.com>
	 <319dcf7a-88cd-488e-ae51-6c20c19d8f22@xen.org>
	 <9d4f3093de6f95b09e44bc66fe9a9d4b0009dc43.camel@gmail.com>
	 <3171ef24-bcb3-4387-ba32-f1c4d6c7220a@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

>=20
> On 14/02/2024 09:32, Oleksii wrote:
> > On Tue, 2024-02-13 at 18:09 +0000, Julien Grall wrote:
> > > > +#ifdef CONFIG_HAS_PASSTHROUGH
> > > > +=C2=A0=C2=A0=C2=A0 struct iommu_fwspec *iommu_fwspec; /* per-devic=
e IOMMU
> > > > instance data */
> > > > +#endif
> > > > +};
> > > > +
> > > > +typedef struct device device_t;
> > > > +
> > > > +#ifdef CONFIG_HAS_DEVICE_TREE
> > > > +
> > > > +#include <xen/device_tree.h>
> > > > +
> > > > +#define dev_is_dt(dev)=C2=A0 ((dev)->type =3D=3D DEV_DT)
> > > > +
> > > > +/**
> > > > + *=C2=A0 device_init - Initialize a device
> > > > + *=C2=A0 @dev: device to initialize
> > > > + *=C2=A0 @class: class of the device (serial, network...)
> > > > + *=C2=A0 @data: specific data for initializing the device
> > > > + *
> > > > + *=C2=A0 Return 0 on success.
> > > > + */
> > > > +int device_init(struct dt_device_node *dev, enum device_class
> > > > class,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 const void *data);
> > > > +
> > > > +/**
> > > > + * device_get_type - Get the type of the device
> > > > + * @dev: device to match
> > > > + *
> > > > + * Return the device type on success or DEVICE_ANY on failure
> > > > + */
> > > > +enum device_class device_get_class(const struct dt_device_node
> > > > *dev);
> > > > +
> > > > +#define DT_DEVICE_START(name_, namestr_, class_)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +static const struct device_desc __dev_desc_##name_ __used=C2=A0=C2=
=A0 \
> > > > +__section(".dev.info") =3D {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 .name =3D namestr_,=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 .class =3D class_,
> > > > +
> > > > +#define DT_DEVICE_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +};
> > > > +
> > > > +#else /* !CONFIG_HAS_DEVICE_TREE */
> > > > +#define dev_is_dt(dev) ((void)(dev), false)
> > > > +#endif /* CONFIG_HAS_DEVICE_TREE */
> > > > +
> > > > +#define dev_is_pci(dev) ((dev)->type =3D=3D DEV_PCI)
> > > > +
> > > > +struct device_desc {
> > > > +=C2=A0=C2=A0=C2=A0 /* Device name */
> > > > +=C2=A0=C2=A0=C2=A0 const char *name;
> > > > +=C2=A0=C2=A0=C2=A0 /* Device class */
> > > > +=C2=A0=C2=A0=C2=A0 enum device_class class;
> > > > +
> > > > +#ifdef CONFIG_HAS_DEVICE_TREE
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /* List of devices supported by this driver */
> > > > +=C2=A0=C2=A0=C2=A0 const struct dt_device_match *dt_match;
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Device initialization.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * -EAGAIN is used to indicate that device=
 probing is
> > > > deferred.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 int (*init)(struct dt_device_node *dev, const v=
oid *data);
> > > > +
> > > > +#endif
> > > > +};
> > > I am not sure I fully understand why "device_desc" is not
> > > protected
> > > by
> > > CONFIG_HAS_DEVICE_TREE. The structure doesn't mean much when the
> > > config
> > > is disabled. Can you clarify?
> > I thought that one day struct device_desc and acpi_device_desc will
> > be
> > "merged", and so decided just to #ifdef only DEVICE_TREE specific
> > fields.
>=20
> It might be possible to merge the two if we were using an union for
> the=20
> ACPI/DT specific part. However the majority of the parsing code needs
> to=20
> differ. So I am not convinced there would be any value to merge the
> two=20
> structures.
In this case, let's have two separate structures.

This is not the current situation, and I don't have a specific example.
It appears that all architectures will use Device Tree or ACPI.
However, does it make sense to keep 'struct device_desc' more generic
to accommodate non-DT or non-ACPI cases?

I am okay with making the following change, but I am just curious if
what I mentioned above makes sense at all:

#ifdef CONFIG_HAS_DEVICE_TREE
struct device_desc {
    /* Device name */
    const char *name;
    /* Device class */
    enum device_class class;

    /* List of devices supported by this driver */
    const struct dt_device_match *dt_match;
    /*
     * Device initialization.
     *
     * -EAGAIN is used to indicate that device probing is deferred.
     */
    int (*init)(struct dt_device_node *dev, const void *data);
};
#endif /* CONFIG_HAS_DEVICE_TREE */=20

>=20
> > Another one reason it is if to protect fully struct device_desc
> > then it
> > would be needed more #ifdef in arm/device.c ( for example,
> > device_init() should be all protected then ) what will require to
> > ifdef
> > all calls of device_init(). As an option device_init can can be
> > defined
> > in case when !CONFIG_HAS_DEVICE_TREE as:
> > =C2=A0=C2=A0=C2=A0 int __init device_init(struct dt_device_node *dev, e=
num
> > device_class
> > =C2=A0=C2=A0=C2=A0 class,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 const void *data)
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0 return -EBADF;
> > =C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=20
> > The similar thing will be needed for device_get_class() in Arm's
> > device.c.
>=20
> I agree that in theory device_init() & co should be protected with=20
> CONFIG_HAS_DEVICE_TREE. However, it is not possible to compile Xen on
> Arm without the Device-Tree part today. So I don't view adding the=20
> #ifdef or any extra stub as necessary today.
>=20
> This may be useful in the future though. Note this is not a request
> to=20
> modify the patch more than...
>=20
> >=20
> > Would it be better to ifdef full struct device_desc ?
> .. moving structure within the #ifdef.
Well, I'll update the commit message of the next patch that it is not
possible to compile Xen without CONFIG_HAS_DEVICE_TREE, so
device_init() and Co won't be protected by CONFIG_HAS_DEVICE_TREE.

~ Oleksii

