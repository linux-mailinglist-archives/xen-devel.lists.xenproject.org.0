Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D446D8544C0
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:13:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680283.1058323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBJj-0001Uw-J1; Wed, 14 Feb 2024 09:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680283.1058323; Wed, 14 Feb 2024 09:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBJj-0001TQ-G2; Wed, 14 Feb 2024 09:12:35 +0000
Received: by outflank-mailman (input) for mailman id 680283;
 Wed, 14 Feb 2024 09:12:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raBJi-0001TK-6n
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:12:34 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ecd64f7-cb19-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 10:12:31 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5638dbf1417so10572a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:12:31 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ps9-20020a170906bf4900b00a3cdd35688fsm2039481ejb.80.2024.02.14.01.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 01:12:30 -0800 (PST)
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
X-Inumbo-ID: 2ecd64f7-cb19-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707901951; x=1708506751; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xyyuoeLMupPgoFpyYAnfAIdumibcYl5ELRc3XTnzK9c=;
        b=TTeVL64UUj44UXt+RP508ZYKhCz0jUPnYyH9+eH8MBWAOVciIXpTxbZYRmz+alGxwl
         95bALRCyzbvXaQuCbbaS8fiNG0Y0sCs5Pm98D/H2M4cnyOBFwXtDo56/KE7sBpNwE3ev
         +RLqzknhHw0Ez9yy7FOU+jLJ/BkNZ2bFgZm4oYkRhF+tICgUZcgU+m/Uiq09qhMk0o2j
         1nfED2dWjnmCH7121tJiwgZtkDMZMErjGqR0eQHpuEWlyN6PLrQhL4pwZ4xAakoU738z
         /HGcIArcI/ZQ4fGOC1PohZTZ7m1hQaP6oJYXtoDnEdIPaloQK6tqSBMFKiDQI1DIMKT5
         rm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707901951; x=1708506751;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xyyuoeLMupPgoFpyYAnfAIdumibcYl5ELRc3XTnzK9c=;
        b=JPUbjHjI676QrkyVGzZUQysjpPAVXMLTOfPXT1IQVV/6ouqiSQPzXmz23ZHs9aN6Ax
         lBDz6mTLpvE/ArM7u4nvvkIE84j+zrxoEbFRtGP2Bz/pP4hfYmOwsp8hwYx2ucxqJDsm
         Naf6Sn8zlz5Nlt87Zq2ZnIvKHjbR0hw9FkowYg+yzu2j649GT6voDyxV1l1/piu7LiYL
         H0YYMFZDrcOSlR8JpiEzeknLtDqNbPVguZKS5IUinEDXTk1AlF0uvQTRQF5OmJ/TFQXk
         PU4WatdR2rFj6BXCj84hssyH2S3MsAOhzogPrOHS/acqM35haPfGAkVKXYCdPjIy2aK8
         VK9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaAJsrhyERK354rzSBAT4u7CYQw/Y7+9ye+/uUTanMEBrkoE3oQxXPzglUSXArmwl3p1LSd1OqpdlMMjhIbYbqA4vSpqyjtu3BU/de5q8=
X-Gm-Message-State: AOJu0YzkdAtiGiMoCHAoNpqMvf0+W55+o92pNg46jd+6+X+ryM1k8E76
	zcQxXrdKn4kBjrpGUrloA2HeoQmT5QBgCbdpH5p/GEv6mhmriFsK
X-Google-Smtp-Source: AGHT+IHRhf7lE++svNOn0+fduiF7pAWV6HXGKjlBhoIlSX0hrJ2KRNs7/+0B3OBn8vSZFiW+94heEw==
X-Received: by 2002:a17:906:cecc:b0:a3c:ae0d:793c with SMTP id si12-20020a170906cecc00b00a3cae0d793cmr1198445ejb.20.1707901950771;
        Wed, 14 Feb 2024 01:12:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7d9o0DQLmGf7CPUw0sOm84sXcnvRgP3t/5lWamMqHUMn3WOlaHaHXOwSikA1R1vufT5KsJrJ6tYWODlDjneieQWmw/qN8cGCrf/ipDD5t78AgjdUHMLtDv8CEJo8Wqxuinh5H2uLyeNLf6jap7EbFC+fS20Q8uX132YDJt1bjCtZ8lsnjDtVyEMeZA/mX5ifot2SvCH1FCMJnCOQ=
Message-ID: <3754521b357f4cd4d6636551f6438856a984acab.camel@gmail.com>
Subject: Re: [PATCH v8 5/7] xen/asm-generic: introduce generic device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 10:12:29 +0100
In-Reply-To: <94a9353f-1dd0-4957-af2c-281f9b3bbe7c@suse.com>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
	 <4ecb5e5f4a1dbf585ac7a9ebe40b5fd8e4709182.1707499278.git.oleksii.kurochko@gmail.com>
	 <94a9353f-1dd0-4957-af2c-281f9b3bbe7c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-12 at 15:19 +0100, Jan Beulich wrote:
> On 09.02.2024 19:00, Oleksii Kurochko wrote:
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
> > +#define DT_DEVICE_START(name_, namestr_, class_)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>=20
> I don't think the trailing underscores are needed or helpful here
> (or in the ACPI counterpart), ...
>=20
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
>=20
> ... seeing this all it would have taken was to avoid the two words
> "name" and "class" (by e.g. using "ident" and "cls").
>=20
> Nevertheless:
> Acked-by: Jan Beulich <jbeulich@suse.com>
Thanks.

I'll apply your comments in the next patch version.

~ Oleksii

