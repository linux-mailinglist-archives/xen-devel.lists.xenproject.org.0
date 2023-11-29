Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE4B7FD719
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 13:50:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643901.1004445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8K0t-0005bW-Qm; Wed, 29 Nov 2023 12:49:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643901.1004445; Wed, 29 Nov 2023 12:49:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8K0t-0005ZJ-O1; Wed, 29 Nov 2023 12:49:59 +0000
Received: by outflank-mailman (input) for mailman id 643901;
 Wed, 29 Nov 2023 12:49:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LZl0=HK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r8K0s-0005ZB-1E
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 12:49:58 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc112fe1-8eb5-11ee-9b0e-b553b5be7939;
 Wed, 29 Nov 2023 13:49:56 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9b77be7ceso21295661fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Nov 2023 04:49:55 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a2e2c01000000b002c88c5edc74sm1994923ljs.71.2023.11.29.04.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 04:49:54 -0800 (PST)
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
X-Inumbo-ID: cc112fe1-8eb5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701262195; x=1701866995; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1pTltL5XAo6S7Xo033wZb8MgpESrg+A6FCGNL/dtwPw=;
        b=R2zPKasjRz3V8L4DGfSwbdWZXsU11l7FVPfSqzqKMjWWDRLebrbdU+/fcc9iqXo+v2
         GiTsdIK3k5S4zqqDey0MMIQZchI+Th/7FWMP+RJQec+WZ9eEEnLbMBhiLamA+dQ9Cbfu
         BRHpyNW8/aU08s9wjXTvDCjQ9A5TGcMCvZAdIBFWEJ77U0AtcmEMVwRpePUmWQ3zqAuL
         Q7DfvPJQ8Q4SEnLmOtjfZHWlsIDbQP0ccMqUMBMtI7e7qkvn2L9lnSFrFsQMxtyMZUMi
         98l/bMmpKwDlrLpUq0yYzxT8A5v6wDYYhhLiMxvBmJ7Vw2XdClbOZPSf/KgLw1DrTGkL
         e1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701262195; x=1701866995;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1pTltL5XAo6S7Xo033wZb8MgpESrg+A6FCGNL/dtwPw=;
        b=QSnkNs3XMiWShKF+qhuUMLbfLcw+raccQ/VX1xVlZPHODSB68mvsqR88j2sf9/0aPX
         8xfj3RzPeGShOPZEt2HKMjRi8wmefK1i7gSsLmI1VdWgT9MFCt+6rDB1yNLO+O8PpLQW
         HEvfJbpJnSmHqJih+LY4sTFb9XoIS4nMwKIcd8jOyLehz3Ywlt3gohXNFwfJRsVmi5r/
         yxc5kb8n4FL5mu42OeuGn44dIHbfYvbIetvrgARk1a5aJ1kMTCopOKi2nId8KFHmDQZD
         vOlqAfxZLmy0MZ1zRKMqYht20LK+61f9dN5lmFxEVDt1SBqFiWC8OkG656ptpONzBh84
         Tadw==
X-Gm-Message-State: AOJu0YySLZV1AjFi5L2p4Kqtro7QeVjpHg3wfIL4V6Mz7rRT5bGaoOjE
	9tHGC/tRsClTO0W/J32EVQo=
X-Google-Smtp-Source: AGHT+IEw7PaEmJZ7K12I6qFNrBQFW9h0bJF/hsAVvmVYjUC5mnqQOPa89sp4hk70859GTD7ubgarpg==
X-Received: by 2002:a2e:9646:0:b0:2c9:ba46:f107 with SMTP id z6-20020a2e9646000000b002c9ba46f107mr2338758ljh.19.1701262195010;
        Wed, 29 Nov 2023 04:49:55 -0800 (PST)
Message-ID: <e29665f849d23a768262c6d1a7436916a7ec887c.camel@gmail.com>
Subject: Re: [PATCH v4 02/14] xen/asm-generic: introduce generic device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Shawn Anastasio <sanastasio@raptorengineering.com>, 
	xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Date: Wed, 29 Nov 2023 14:49:53 +0200
In-Reply-To: <98023f51-5953-4384-918d-ae726d74ef7c@raptorengineering.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
	 <67172a4fbf88833480203fcb1e2c640b6d39a556.1701093907.git.oleksii.kurochko@gmail.com>
	 <98023f51-5953-4384-918d-ae726d74ef7c@raptorengineering.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Tue, 2023-11-28 at 15:28 -0600, Shawn Anastasio wrote:
> Hi Oleksii,
>=20
> On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> > diff --git a/xen/arch/ppc/include/asm/Makefile
> > b/xen/arch/ppc/include/asm/Makefile
> > index ece7fa66dd..df4c1ebb08 100644
> > --- a/xen/arch/ppc/include/asm/Makefile
> > +++ b/xen/arch/ppc/include/asm/Makefile
> > @@ -1,3 +1,4 @@
> > =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> > +generic-y +=3D device.h
> > =C2=A0generic-y +=3D paging.h
> > =C2=A0generic-y +=3D vm_event.h
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
> > diff --git a/xen/arch/ppc/include/asm/irq.h
> > b/xen/arch/ppc/include/asm/irq.h
> > index 5c37d0cf25..49193fddff 100644
> > --- a/xen/arch/ppc/include/asm/irq.h
> > +++ b/xen/arch/ppc/include/asm/irq.h
> > @@ -3,7 +3,9 @@
> > =C2=A0#define __ASM_PPC_IRQ_H__
> > =C2=A0
> > =C2=A0#include <xen/lib.h>
> > +#ifdef CONFIG_HAS_DEVICE_TREE
>=20
> I realize that you were likely following PPC's device.h which also
> checks CONFIG_HAS_DEVICE_TREE, but I'm not sure that it makes sense
> to
> check this conditional in PPC code at all -- we will always have
> HAS_DEVICE_TREE (selected by PPC) and I can't imagine a scenario
> where
> this will ever not be the case.
What about case if ACPI is used? Does ACPI is supported by PPC?

But if you are sure that CONFIG_HAS_DEVICE_TREE will be always selected
then I am OK to remove this change.

>=20
> Unless Jan (or someone else) disagrees, I'd rather this conditional
> be
> dropped inside of PPC code.
I'll double check but I think I had a compilation issue if it isn't
defined.

>=20
> > =C2=A0#include <xen/device_tree.h>
> > +#endif
> > =C2=A0#include <public/device_tree_defs.h>
> > =C2=A0
> > =C2=A0/* TODO */
> > @@ -25,9 +27,11 @@ static inline void arch_move_irqs(struct vcpu
> > *v)
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0}
> > =C2=A0
> > +#ifdef CONFIG_HAS_DEVICE_TREE
>=20
> Ditto.
>=20
> > =C2=A0static inline int platform_get_irq(const struct dt_device_node
> > *device, int index)
> > =C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0}
> > +#endif
> > =C2=A0
> > =C2=A0#endif /* __ASM_PPC_IRQ_H__ */

Thanks.

~ Oleksii

