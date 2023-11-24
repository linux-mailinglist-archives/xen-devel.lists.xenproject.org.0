Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800E27F7394
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 13:15:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640620.999076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6V5S-00074C-2u; Fri, 24 Nov 2023 12:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640620.999076; Fri, 24 Nov 2023 12:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6V5R-00071b-VP; Fri, 24 Nov 2023 12:15:09 +0000
Received: by outflank-mailman (input) for mailman id 640620;
 Fri, 24 Nov 2023 12:15:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6V5Q-00071U-88
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 12:15:08 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b08c5f1-8ac3-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 13:15:07 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50aab3bf71fso2409642e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 04:15:07 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 o21-20020ac24bd5000000b00507977e9a38sm489121lfq.35.2023.11.24.04.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 04:15:06 -0800 (PST)
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
X-Inumbo-ID: 1b08c5f1-8ac3-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700828107; x=1701432907; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wfE+ET+Zc9xlaSBY07eL3nKboVK+/ndx4tSzkJ+DKkk=;
        b=NBxCCx76r96S+QO8lZTuu9A2nkUNTX31ucEQsTnaJHqxNyFdfT7kIO4FPnreMLafdH
         ejLVBHAPXDBZal2qJjwmdd2SOXZMuch7/yD/Oe3qwKihe1sEmQ7Y7DT50RauTr4DRJYB
         2VhKwoaDrlIxZtJj3P3XnGr4hf+H79z4pVkgnlZ7RXk96a2XtA3yjnY3+i4ZApVqltbX
         3VraPFbcM39MNYytwnC2nsEYmvAa6DA94tR1d8FAMcw3UDtHAtW8YLDaTXY8Yh8/eMAF
         wsnbQhUZ6P1f/Y5eh9logR50blNHLixcsjgMfv+mdzJJlsiJ2exFJK/9B850zyJEa2iw
         ZKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700828107; x=1701432907;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wfE+ET+Zc9xlaSBY07eL3nKboVK+/ndx4tSzkJ+DKkk=;
        b=IXxWX80rIIMQ6GUKzl7g3NRa7Yi/yUWmeiMlY4zgAp+7ZKakML03eb8sy1M/vpfpAh
         mDPrYmuvrhVxq1EGVvh7DefflaJzwClr+m9G5vKPFFyCeleDr+i1HlIJeQpTsveFPR1W
         5l00y/uefqcend9zC7xAqwVWRwRegFa2PxF6OJn136GCt0ue2tv+YxiRICIt04Iq05fF
         ShynEYeVdsmKM5udHEaduXTTs8Sdru4bAup5cESzlPNYukm769qXkv/tcTXJMCk+Exqd
         S5tDcXW68bctjuuxyiHp8AZmavMA1shhVoVpeX1Mq4HX6IbR+6xSRai072CwOlNDoHQX
         OstA==
X-Gm-Message-State: AOJu0Yx0MZYS3WAgpdDfs4HYibrdXbrleLSRJzkyZN9itAiXPn9xc1/9
	RiEhC35XAQYenyVt2rsNBsY=
X-Google-Smtp-Source: AGHT+IFwWWPifbHDdhpjJ/EffRDK4GVHz3VTX6WpyRQrFgKwJSfqKx7EB8BDFdojzKhOwym9m1SV/g==
X-Received: by 2002:a05:6512:201:b0:508:1690:d825 with SMTP id a1-20020a056512020100b005081690d825mr1574791lfo.21.1700828106616;
        Fri, 24 Nov 2023 04:15:06 -0800 (PST)
Message-ID: <82c80c72c1131723afca1fc02209ac7ccbf8f74b.camel@gmail.com>
Subject: Re: [PATCH v3 02/14] xen/asm-generic: introduce generic device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Fri, 24 Nov 2023 14:15:05 +0200
In-Reply-To: <35978886-0f5e-4906-a64b-a4da0e875fc8@xen.org>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
	 <65b267137539704df7f22b37e3b0a9b372a82b33.1700221559.git.oleksii.kurochko@gmail.com>
	 <35978886-0f5e-4906-a64b-a4da0e875fc8@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Fri, 2023-11-24 at 11:01 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 17/11/2023 12:24, Oleksii Kurochko wrote:
> > Arm, PPC and RISC-V use the same device.h thereby device.h
> > was moved to asm-generic.=20
>=20
> I read "was moved" as the patch should also contain some deleted
> lines.=20
> But below, I only see the file introduced. Did you intend to also
> remove=20
> the version in arm/include/asm?
Yes, I just messed up with the patch version. Here is the version of
the patch which remove Arm's device.h:
https://gitlab.com/xen-project/people/olkur/xen/-/commit/ce845abfb57d27b0c0=
8984f5433085c767550495
>=20
> > Arm's device.h was taken as a base with
> > the following changes:
> > =C2=A0 - #ifdef PCI related things.
> > =C2=A0 - #ifdef ACPI related things.
> > =C2=A0 - Rename #ifdef guards.
> > =C2=A0 - Add SPDX tag.
> > =C2=A0 - #ifdef CONFIG_HAS_DEVICE_TREE related things.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > It is still open question if device.h should be in asm-generic.
> > Need more opinions.
>=20
> I still think it should. But I guess you want others to answer? If so
> it=20
> would be worth to point out from who you seek opinions.
>=20
> > ---
> > Changes in V3:
> > =C2=A0 - ifdef device tree related things.
> > =C2=A0 - update the commit message
> > ---
> > Changes in V2:
> > 	- take ( as common ) device.h from Arm as PPC and RISC-V
> > use it as a base.
> > 	- #ifdef PCI related things.
> > 	- #ifdef ACPI related things.
> > 	- rename DEVICE_GIC to DEVIC_IC.
> > 	- rename #ifdef guards.
> > 	- switch Arm and PPC to generic device.h
> > 	- add SPDX tag
> > 	- update the commit message
> >=20
> > ---
> > =C2=A0 xen/include/asm-generic/device.h | 147
> > +++++++++++++++++++++++++++++++
> > =C2=A0 1 file changed, 147 insertions(+)
> > =C2=A0 create mode 100644 xen/include/asm-generic/device.h
> >=20
> > diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-
> > generic/device.h
> > new file mode 100644
> > index 0000000000..7ef5aa955a
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
> > +=C2=A0=C2=A0=C2=A0 DEV_PCI,
> > +#endif
> > +};
> > +
> > +struct dev_archdata {
> > +=C2=A0=C2=A0=C2=A0 void *iommu;=C2=A0=C2=A0=C2=A0 /* IOMMU private dat=
a */
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
> > +};
> > +
> > +typedef struct device device_t;
> > +
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +#include <xen/device_tree.h>
> > +#endif
>=20
> NIT: Could we try to rationalize the number of #ifdef CONFIG_HAS_*?
> For=20
> example ...
>=20
> > +
> > +#ifdef HAS_PCI
> > +#define dev_is_pci(dev) ((dev)->type =3D=3D DEV_PCI)
> > +#endif
> > +
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > +#define dev_is_dt(dev)=C2=A0 ((dev)->type =3D=3D DEV_DT)
> > +#endif
>=20
> ... this is another definition for Device-Tree only. It could be
> easily=20
> moved above the definitnion of dev_is_pci(). The others would be the=20
> DT_DEVICE_*() helpers.
Yes, sure. I can combine CONFIG_HAS_DEVICE_TREE related things better.

>=20
> > +
> > +enum device_class
> > +{
> > +=C2=A0=C2=A0=C2=A0 DEVICE_SERIAL,
> > +=C2=A0=C2=A0=C2=A0 DEVICE_IOMMU,
> > +=C2=A0=C2=A0=C2=A0 DEVICE_IC,
>=20
> I guess you mean INTERRUPT_CONTROLLER? If so, can this be spelt out?
> (I=20
> don't think shorthand version is worth it here)
Sure, I'll change to INTERRUPT_CONTROLLER.

~ Oleksii

