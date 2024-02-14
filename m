Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6035F854556
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680298.1058353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBcp-0006f6-Mq; Wed, 14 Feb 2024 09:32:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680298.1058353; Wed, 14 Feb 2024 09:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBcp-0006cW-JJ; Wed, 14 Feb 2024 09:32:19 +0000
Received: by outflank-mailman (input) for mailman id 680298;
 Wed, 14 Feb 2024 09:32:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raBcn-0006cQ-Vl
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:32:17 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0a8a5c1-cb1b-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 10:32:15 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5638e05e27cso23574a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:32:15 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 r25-20020a170906351900b00a38a476fc08sm2130704eja.87.2024.02.14.01.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 01:32:14 -0800 (PST)
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
X-Inumbo-ID: f0a8a5c1-cb1b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707903135; x=1708507935; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y6NEVowgluYgwOryGHAXwKJNPlcvZz1aYR6jpDCRVg4=;
        b=HcTc6mNhjl/CqRtHzS2yDxnccM5BNJr+pLWs3EemBQ1sJIoRoK83ZONjgO+Hy0FsAj
         GOFB4qt2+kmwS0hY+LAEholm8fSNy2uzrpXGfzJ9J1AgP9Q/D3hOm5myGvMpdyP9hDK+
         xcO7JeauriuipmUQqfz9+Y1s0M+qt2wZpd8RvFvDJoInuYhTiJ77rExCvpdouEnQUHhL
         XiAQBbv1I2m54g6V6SZ9ZDEDdJ60wtN7rE61BPNBB2EgQxwBYCpN6DIhbr2Jn6cV62/k
         JXSKIsly+JvucnB43kUjvbr7Ug1ImtmdtDcObYjf/laUnAU2oGanAabgue/IEaJUAp5f
         OO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707903135; x=1708507935;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y6NEVowgluYgwOryGHAXwKJNPlcvZz1aYR6jpDCRVg4=;
        b=rs54Z4XnHEXs3OW1Au06ujf5FuEY0PiVuItwIHrBUoKymWzSydmC7VaXpCRASRLeyT
         lcNTN0k1/xvVst6loT835cjLP3/AiQ8O+ka5+3tIXgNDoHmgl2yUUCiMVG+s9vv3D4RG
         TxYkfGSkkGDB4Y2QSGlIS77BYIyo1kd8r1x2+CQW8DBXaxk0KhkDh+3nxwjBFQFi5NUO
         O3ZUivxRCfStmz4+3ZpFzbIUh2do3Yr6ntCp+vt6r5drbZFB1gH1JpCE5VlCmvpD9bOX
         korPu3deS/q8SZGanz21IOOKsfxeozfp9UfdMQIJCuyQEMYubLUa8qwXhmBLJrDkyBaD
         6mNw==
X-Forwarded-Encrypted: i=1; AJvYcCVbHzwHZvZYtQ2UbzrdVA2RS+XQiEiQZZvbgj5RXT2VgNJuvHqsDjTOUoqb6QnofXNY+feuDHwNeP00S/kNTy7rjjBdX+CbCgNLhyLHXEc=
X-Gm-Message-State: AOJu0YyPhGFjD49G48V/qycATD1/iD2XCBCmmRWAiRTyUfG6mjSrwcDw
	QlCbG5cc7BkCA8YA+S+4JQbzfpBniMmUktlkcIV4QJpLWMiMw+26
X-Google-Smtp-Source: AGHT+IGJYReGNpPG0mSW4iRTIJMjms9h4jQUDHM3HfL0poUHEHeItnjIBWPBMcrt8v75D6Pnfl5ndA==
X-Received: by 2002:a17:906:b7c4:b0:a3d:14e0:9608 with SMTP id fy4-20020a170906b7c400b00a3d14e09608mr1359456ejb.39.1707903135075;
        Wed, 14 Feb 2024 01:32:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXRU981lFmJ3PfeKhhHJpKDoQCRIlOzXTsuaxadu7o25wtgrt3q40wdKbvCHx2GtELYIks8t5EbSvWt3tAgm12+qHVShbx7PKR2TUZCQ9LpsIq9GUsGqoeRYG4v92ZWw5EEvEDCvCi/ljJFRIqlL3ilBRM6I4fstWBRp8w9dF3w9AcPuFs0Tlhu+BSeBq3ATrhyez22k+0LXpegtq2eZuA=
Message-ID: <9d4f3093de6f95b09e44bc66fe9a9d4b0009dc43.camel@gmail.com>
Subject: Re: [PATCH v8 5/7] xen/asm-generic: introduce generic device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Wed, 14 Feb 2024 10:32:13 +0100
In-Reply-To: <319dcf7a-88cd-488e-ae51-6c20c19d8f22@xen.org>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
	 <4ecb5e5f4a1dbf585ac7a9ebe40b5fd8e4709182.1707499278.git.oleksii.kurochko@gmail.com>
	 <319dcf7a-88cd-488e-ae51-6c20c19d8f22@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-02-13 at 18:09 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 09/02/2024 18:00, Oleksii Kurochko wrote:
> > diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-
> > generic/device.h
> > new file mode 100644
> > index 0000000000..6e56658271
> > --- /dev/null
> > +++ b/xen/include/asm-generic/device.h
> > @@ -0,0 +1,149 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_DEVICE_H__
> > +#define __ASM_GENERIC_DEVICE_H__
> > +
> > +#include <xen/stdbool.h>
> > +
> > +enum device_type
> > +{
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +=C2=A0=C2=A0=C2=A0 DEV_DT,
> > +#endif
> > +=C2=A0=C2=A0=C2=A0 DEV_PCI
> > +};
> > +
> > +enum device_class
> > +{
> > +=C2=A0=C2=A0=C2=A0 DEVICE_SERIAL,
> > +=C2=A0=C2=A0=C2=A0 DEVICE_IOMMU,
> > +=C2=A0=C2=A0=C2=A0 DEVICE_INTERRUPT_CONTROLLER,
> > +=C2=A0=C2=A0=C2=A0 DEVICE_PCI_HOSTBRIDGE,
> > +=C2=A0=C2=A0=C2=A0 /* Use for error */
> > +=C2=A0=C2=A0=C2=A0 DEVICE_UNKNOWN,
> > +};
> > +
> > +struct dev_archdata {
> > +#ifdef CONFIG_HAS_PASSTHROUGH
> > +=C2=A0=C2=A0=C2=A0 void *iommu;=C2=A0=C2=A0=C2=A0 /* IOMMU private dat=
a */
> > +#endif > +};
>=20
> It is a bit too late to change, but I thought I would point it if=20
> someone wants to send a follow-up. It is a bit odd to have a
> structure=20
> dev_archdata that, if I am not mistaken, is only used ...
>=20
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
>=20
> ... in struct device. Looking at the use, I believe this was only=20
> introduced to try to keep that SMMU code close to Linux. I would=20
> consider to fold the other structure and update dev_archdata() in=20
> drivers/passthrough/arm/smmu.c.
I can do that in separate patch. struct dev_archdata was left because
of drivers/passthrough/arm/smmu.c.

>=20
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
> > +#define DT_DEVICE_START(name_, namestr_, class_)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +static const struct device_desc __dev_desc_##name_ __used=C2=A0=C2=A0 =
\
> > +__section(".dev.info") =3D {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 .name =3D namestr_,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 .class =3D class_,
> > +
> > +#define DT_DEVICE_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +};
> > +
> > +#else /* !CONFIG_HAS_DEVICE_TREE */
> > +#define dev_is_dt(dev) ((void)(dev), false)
> > +#endif /* CONFIG_HAS_DEVICE_TREE */
> > +
> > +#define dev_is_pci(dev) ((dev)->type =3D=3D DEV_PCI)
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
> I am not sure I fully understand why "device_desc" is not protected
> by=20
> CONFIG_HAS_DEVICE_TREE. The structure doesn't mean much when the
> config=20
> is disabled. Can you clarify?
I thought that one day struct device_desc and acpi_device_desc will be
"merged", and so decided just to #ifdef only DEVICE_TREE specific
fields.
Another one reason it is if to protect fully struct device_desc then it
would be needed more #ifdef in arm/device.c ( for example,
device_init() should be all protected then ) what will require to ifdef
all calls of device_init(). As an option device_init can can be defined
in case when !CONFIG_HAS_DEVICE_TREE as:
   int __init device_init(struct dt_device_node *dev, enum device_class
   class,
                          const void *data)
   {
    return -EBADF;
   }
  =20
The similar thing will be needed for device_get_class() in Arm's device.c.

Would it be better to ifdef full struct device_desc ?

~ Oleksii

