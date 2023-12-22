Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D6D81CA96
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 14:16:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659358.1028922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGfO6-00019h-Ct; Fri, 22 Dec 2023 13:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659358.1028922; Fri, 22 Dec 2023 13:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGfO6-00016t-A0; Fri, 22 Dec 2023 13:16:26 +0000
Received: by outflank-mailman (input) for mailman id 659358;
 Fri, 22 Dec 2023 13:16:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGfO4-00013U-OC
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 13:16:24 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e2a06a4-a0cc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 14:16:24 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50e6e7afc6aso99393e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 05:16:24 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a195e15000000b0050e64a74eedsm298811lfb.188.2023.12.22.05.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 05:16:22 -0800 (PST)
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
X-Inumbo-ID: 4e2a06a4-a0cc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703250983; x=1703855783; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2xPMxqDxW4DCuDTcCdINlYJF/6BDd09grMKA+fFOvno=;
        b=LDpqB4ebzqoGy4UHDn+9ZhTvYO3sdOI/TiOTDPnNbAbVITtz2bOr6eFWmUhN1OxYqL
         mPpeTCU7W1fjGFkWTSgb/cEeMswpHlv85fBhYsv9KrGzDgZOM/uHwL1BlLldRbrykarC
         QH3knhh44ZJl1XRHC1/hKQzRswnU4xzM6K/QO6NOqy01+jNXqtEtMeTKTpzamAqTG5vV
         7Wg8zoHS4HPNuX4SWg8TFQbG4241kML7oe9iuH1ECbUgvmprznhKYO24KeuIWA4p4pyi
         whOloJ80hSsIZDehUGNDPR+fHxMAKh+Ewsx37LyRqF2c6tYABJ//3HnoBRCSX7zUlnZ4
         wXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703250983; x=1703855783;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xPMxqDxW4DCuDTcCdINlYJF/6BDd09grMKA+fFOvno=;
        b=WkqwJcjf5zVXbxTos57i2aS0hJbNsyAmG7wam1T4GbkTG01i+8+90/toLhU7LVvpPb
         ZWbtxnCXYUTtAMm6MKFIP+Z/CT+fxvHwrXo+QJEIU2rSaW9d0zc+pMJlhaV30BgHdGKY
         crEaaCkP+rM1MHtSS9VLgMq1TOMHwYYLO6y+ce9Xpo6Qm59YeDdXOFgEnnaqMJiMVBIb
         LUzekFBcxz2MsAfSv/iiqxYGvGmGvXIwD0x1k+2NerhGmMSQJdp0WCYOGqntpM1HAcKM
         6J2ML7Y3z8XdxK1x6xucBT+cCIzsXZdgB7hhRiryyrmszk8UDUjCT7IEXLKt5gEvmG5l
         rohg==
X-Gm-Message-State: AOJu0YxVrrU3lMI8bpFg45+dNsZkcr9V1+r75Q5HHC3MPaDfTDC2bRH+
	UfGkb2eie0jMOS1GEtz0t+g=
X-Google-Smtp-Source: AGHT+IEvngimTMRt4HZOwVtZgpZLpTMlRZabbV/9QTJzgFJ+NI7qtRWK7ae07OR0dhvyxilAF9986w==
X-Received: by 2002:a05:6512:46d:b0:50d:f857:2e9d with SMTP id x13-20020a056512046d00b0050df8572e9dmr662618lfd.57.1703250983168;
        Fri, 22 Dec 2023 05:16:23 -0800 (PST)
Message-ID: <4ce1258b22962f959abf2437d6427ec34d420023.camel@gmail.com>
Subject: Re: [PATCH v6 9/9] xen/asm-generic: introduce generic device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, Jan
 Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,  Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Fri, 22 Dec 2023 15:16:22 +0200
In-Reply-To: <f41894c6-b061-4aef-9d4a-18effd917043@xen.org>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
	 <55d6810e2f8b0f54261c504354bf879c5b887c40.1703072575.git.oleksii.kurochko@gmail.com>
	 <f41894c6-b061-4aef-9d4a-18effd917043@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Julien,

On Thu, 2023-12-21 at 19:38 +0000, Julien Grall wrote:
> Hi,
>=20
> On 20/12/2023 14:08, Oleksii Kurochko wrote:
> > Arm, PPC and RISC-V use the same device.h thereby device.h
> > was moved to asm-generic. Arm's device.h was taken as a base with
> > the following changes:
> > =C2=A0 - #ifdef PCI related things.
> > =C2=A0 - #ifdef ACPI related things.
> > =C2=A0 - Rename #ifdef guards.
> > =C2=A0 - Add SPDX tag.
> > =C2=A0 - #ifdef CONFIG_HAS_DEVICE_TREE related things.
> > =C2=A0 - #ifdef-ing iommu related things with CONFIG_HAS_PASSTHROUGH.
> >=20
> > Also Arm and PPC are switched to asm-generic version of device.h
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Jan wrote the following:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Overall I think there are to=
o many changes done all in one
> > go here.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 But it's mostly Arm which is=
 affected, so I'll leave
> > judging about that
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to the Arm maintainers.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Arm maintainers, will it be fine for you=
 to not split the
> > patch?
>=20
> So in general I agree with Jan, patches should be kept small so they
> are=20
> easy to review.
>=20
> Given the discussion has been on-going for a while (we are at v6),=C2=A0 =
I
> will give an attempt to review the patch as-is. But in the future,=20
> please try to split. The smaller it is, the easier to review. For
> code=20
> movement and refactoring, I tend to first have a few refactoring
> patches=20
> and then move the code in a separate patch. So it is easier to spot
> the=20
> differences.
Thanks, I'll separate the patch.
>=20
> > ---
> > Changes in V6:
> > =C2=A0 - Rebase only.
> > ---
> > Changes in V5:
> > =C2=A0=C2=A0 - Removed generated file: xen/include/headers++.chk.new
> > =C2=A0=C2=A0 - Removed pointless #ifdef CONFIG_HAS_DEVICE_TREE ... #end=
if for
> > PPC as
> > =C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_HAS_DEVICE_TREE will be always used for=
 PPC.
> > ---
> > Changes in V4:
> > =C2=A0 - Updated the commit message
> > =C2=A0 - Switched Arm and PPC to asm-generic version of device.h
> > =C2=A0 - Replaced HAS_PCI with CONFIG_HAS_PCI
> > =C2=A0 - ifdef-ing iommu filed of dev_archdata struct with
> > CONFIG_HAS_PASSTHROUGH
> > =C2=A0 - ifdef-ing iommu_fwspec of device struct with
> > CONFIG_HAS_PASSTHROUGH
> > =C2=A0 - ifdef-ing DT related things with CONFIG_HAS_DEVICE_TREE
> > =C2=A0 - Updated the commit message ( remove a note with question about
> > =C2=A0=C2=A0=C2=A0 if device.h should be in asm-generic or not )
> > =C2=A0 - Replaced DEVICE_IC with DEVICE_INTERRUPT_CONTROLLER
> > =C2=A0 - Rationalized usage of CONFIG_HAS_* in device.h
> > =C2=A0 - Fixed indents for ACPI_DEVICE_START and ACPI_DEVICE_END
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
> > =C2=A0 xen/arch/arm/device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++-
> > =C2=A0 xen/arch/arm/domain_build.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> > =C2=A0 xen/arch/arm/gic-v2.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A0 xen/arch/arm/gic-v3.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> > =C2=A0 xen/arch/arm/gic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A0 xen/arch/arm/include/asm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 xen/arch/ppc/include/asm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 xen/arch/ppc/include/asm/device.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 53 --------
> > =C2=A0 .../asm =3D> include/asm-generic}/device.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 125 +++++++++++--
> > -----
> > =C2=A0 9 files changed, 102 insertions(+), 109 deletions(-)
> > =C2=A0 delete mode 100644 xen/arch/ppc/include/asm/device.h
> > =C2=A0 rename xen/{arch/arm/include/asm =3D> include/asm-generic}/devic=
e.h
> > (79%)
> >=20
> > diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> > index 1f631d3274..affbe79f9a 100644
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
> > =C2=A0=20
> > =C2=A0 int __init device_init(struct dt_device_node *dev, enum
> > device_class class,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 const void *data)
> > @@ -45,6 +48,7 @@ int __init device_init(struct dt_device_node
> > *dev, enum device_class class,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EBADF;
> > =C2=A0 }
> > =C2=A0=20
> > +#ifdef CONFIG_ACPI
> > =C2=A0 int __init acpi_device_init(enum device_class class, const void
> > *data, int class_type)
> > =C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct acpi_device_desc *desc;
> > @@ -61,6 +65,7 @@ int __init acpi_device_init(enum device_class
> > class, const void *data, int class
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EBADF;
> > =C2=A0 }
> > +#endif
> > =C2=A0=20
> > =C2=A0 enum device_class device_get_class(const struct dt_device_node
> > *dev)
> > =C2=A0 {
> > @@ -329,9 +334,13 @@ int handle_device(struct domain *d, struct
> > dt_device_node *dev, p2m_type_t p2mt,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct map_range_data mr_data =3D {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .d =3D d,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p2mt =3D p2mt,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .skip_mapping =3D !own_devi=
ce ||
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (is_p=
ci_passthrough_enabled() &&
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (devi=
ce_get_class(dev) =3D=3D
> > DEVICE_PCI_HOSTBRIDGE)),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .skip_mapping =3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !own_=
device
> > +#ifdef CONFIG_HAS_PCI
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 || (i=
s_pci_passthrough_enabled() &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (devi=
ce_get_class(dev) =3D=3D
> > DEVICE_PCI_HOSTBRIDGE))
> > +#endif
>=20
> So the #ifdef is only here because DEVICE_PCI_HOSTBRIDGE is not
> defined.=20
> It is not clear what's the actual problem of keeping=20
> DEVICE_PCI_HOSTBRIDGE available for every build.
The only reason for that is that it seems to be used only in thecase when C=
ONFIG_HAS_PCI is enabled ( probably not all archs will
have PCI support ). Generally,
I think it's okay not to use #ifdef DEVICE_PCI_HOSTBRIDGE to keep
the Arm code cleaner.

Does it make sense?
>=20
> In fact, we have tried to get away from #ifdef in order to make
> ensure=20
> we can catch any build failure without a randconfig (see use of=20
> IS_ENABLED() which would not apply work here).
It would be nice to use IS_ENABLED but in this case still need to
something with definition of DEVICE_PCI_HOSTBRIDGE.

>=20
> [...]
>=20
> > diff --git a/xen/arch/ppc/include/asm/device.h
> > b/xen/arch/ppc/include/asm/device.h
> > deleted file mode 100644
> > index 8253e61d51..0000000000
> > --- a/xen/arch/ppc/include/asm/device.h
> > +++ /dev/null
> > @@ -1,53 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -#ifndef __ASM_PPC_DEVICE_H__
> > -#define __ASM_PPC_DEVICE_H__
> > -
> > -enum device_type
> > -{
> > -=C2=A0=C2=A0=C2=A0 DEV_DT,
> > -=C2=A0=C2=A0=C2=A0 DEV_PCI,
> > -};
> > -
> > -struct device {
> > -=C2=A0=C2=A0=C2=A0 enum device_type type;
> > -#ifdef CONFIG_HAS_DEVICE_TREE
> > -=C2=A0=C2=A0=C2=A0 struct dt_device_node *of_node; /* Used by drivers =
imported
> > from Linux */
> > -#endif
> > -};
> > -
> > -enum device_class
> > -{
> > -=C2=A0=C2=A0=C2=A0 DEVICE_SERIAL,
> > -=C2=A0=C2=A0=C2=A0 DEVICE_IOMMU,
> > -=C2=A0=C2=A0=C2=A0 DEVICE_PCI_HOSTBRIDGE,
> > -=C2=A0=C2=A0=C2=A0 /* Use for error */
> > -=C2=A0=C2=A0=C2=A0 DEVICE_UNKNOWN,
> > -};
> > -
> > -struct device_desc {
> > -=C2=A0=C2=A0=C2=A0 /* Device name */
> > -=C2=A0=C2=A0=C2=A0 const char *name;
> > -=C2=A0=C2=A0=C2=A0 /* Device class */
> > -=C2=A0=C2=A0=C2=A0 enum device_class class;
> > -=C2=A0=C2=A0=C2=A0 /* List of devices supported by this driver */
> > -=C2=A0=C2=A0=C2=A0 const struct dt_device_match *dt_match;
> > -=C2=A0=C2=A0=C2=A0 /*
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * Device initialization.
> > -=C2=A0=C2=A0=C2=A0=C2=A0 *
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * -EAGAIN is used to indicate that device pro=
bing is
> > deferred.
> > -=C2=A0=C2=A0=C2=A0=C2=A0 */
> > -=C2=A0=C2=A0=C2=A0 int (*init)(struct dt_device_node *dev, const void =
*data);
> > -};
> > -
> > -typedef struct device device_t;
> > -
> > -#define DT_DEVICE_START(name_, namestr_,
> > class_)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > -static const struct device_desc __dev_desc_##name_
> > __used=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > -__section(".dev.info") =3D
> > {=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > -=C2=A0=C2=A0=C2=A0 .name =3D
> > namestr_,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > -=C2=A0=C2=A0=C2=A0 .class =3D
> > class_,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > -
> > -#define
> > DT_DEVICE_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > -};
> > -
> > -#endif /* __ASM_PPC_DEVICE_H__ */
> > diff --git a/xen/arch/arm/include/asm/device.h b/xen/include/asm-
> > generic/device.h
> > similarity index 79%
> > rename from xen/arch/arm/include/asm/device.h
> > rename to xen/include/asm-generic/device.h
> > index b5d451e087..063c448c4e 100644
> > --- a/xen/arch/arm/include/asm/device.h
> > +++ b/xen/include/asm-generic/device.h
> > @@ -1,14 +1,37 @@
> > -#ifndef __ASM_ARM_DEVICE_H
> > -#define __ASM_ARM_DEVICE_H
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ASM_GENERIC_DEVICE_H__
> > +#define __ASM_GENERIC_DEVICE_H__
> > +
> > +#include <xen/stdbool.h>
> > =C2=A0=20
> > =C2=A0 enum device_type
> > =C2=A0 {
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEV_DT,
> > +#endif
> > +
> > +#ifdef CONFIG_HAS_PCI
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEV_PCI,
> > +#endif
> > +=C2=A0=C2=A0=C2=A0 DEV_TYPE_MAX,
> Nobody is using it. AFAICT, this was introduced because enum may be=20
> empty if !HAS_DEVICE_TREE and !HAS_PCI. If so, can you add a comment=20
> explaining it on top?
Sure, thanks. I'll add the comment.

>=20
> The rest LGTM.
>=20
> Cheers,
>=20
~ Oleksii



