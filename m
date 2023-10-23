Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE17D3446
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 13:38:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621394.967830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutFp-0007ed-0E; Mon, 23 Oct 2023 11:37:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621394.967830; Mon, 23 Oct 2023 11:37:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qutFo-0007cS-Sp; Mon, 23 Oct 2023 11:37:52 +0000
Received: by outflank-mailman (input) for mailman id 621394;
 Mon, 23 Oct 2023 11:37:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7RLV=GF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qutFn-0007b8-ND
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 11:37:51 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9821e904-7198-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 13:37:49 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53f6ccea1eeso4803153a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 04:37:49 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a17090657d100b009c5c5c2c59csm6735754ejr.149.2023.10.23.04.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 04:37:48 -0700 (PDT)
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
X-Inumbo-ID: 9821e904-7198-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698061069; x=1698665869; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IxSLz6EGT+j3MtCXX+y5vLwvJV8Ki3KXMBlVKvh3zUQ=;
        b=StOPSyhwm7UA6zdPtpo+HinMYihpEYPfgyMsrqT8vN/ePkU9gk2nNyK9rpOizpDHe4
         2U3AtNbsragKC0hvJxgQSbhrjuvs68M2uX6SPn1w7IfQ8Ie2GHAUse+1HE87VlaeYdnF
         XmNYApiTpOC0or7ZLg7Z+Avqumim8UyHNcAY9DKqKN3j9YFahmOG4IcKQqzrcUFvX1tp
         a/LjFUarc4M/aMZFRr68vA0D3XmNzlbmhXf0fIMijJVI2CBGTrc+2Gvy51RZ2E9ZGjgK
         IPMSfYqej1aa4E9mDyR1uS+zq7MnGvdIiHWOVueY/21J42xSl/gneh4k5vfxvYn1OAKk
         3B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698061069; x=1698665869;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxSLz6EGT+j3MtCXX+y5vLwvJV8Ki3KXMBlVKvh3zUQ=;
        b=U31TC+sFVgpnrBsGU8gYgceRQVv431vWZt+X5wXMduCj3HM/fw/lPvscmx/m/11XIg
         HZB9+vMK0CS5aim1+3joXJmRas/MGC6FEmWeObRbe35vuP1VlyRezIBfLQA38z8MOpjE
         MSgs/GcERV3pfPzpt6Lndnckaf4PHqT3vU8SMJQuI2tSJL10ZthrUjBbdRy5gH572Yl+
         OB1z7D0stwBjbgumDMXRpmwjf93N5x6EjVlB6JnS26FHGbmeYUM7QxrOM7yiTb35I3NL
         Zr3cQjQV1d32JOHuyGaDao68NAv2GsBEy6o1X1GSuZ70JpJdAZgniZEBJhxy4RkVD9xH
         NBhw==
X-Gm-Message-State: AOJu0YztccY0Lw41uY4fLFEOvSgY/Gu7NCYRivpTrSWpWPaRmZJelynu
	8GI8ImgcMQjEPFyRpHG0Y798LjmfZjI=
X-Google-Smtp-Source: AGHT+IEx9maipNzOZzlFBzYS821LtaYJ3Pu8tifGKX5qGp+MnFzmxmFW9+SSUsST+FcwZdxJdOiFtQ==
X-Received: by 2002:a17:907:9492:b0:9ae:82b4:e306 with SMTP id dm18-20020a170907949200b009ae82b4e306mr7505218ejc.62.1698061069110;
        Mon, 23 Oct 2023 04:37:49 -0700 (PDT)
Message-ID: <58817b8b52d4cb810ca3f8aba78d03089894df86.camel@gmail.com>
Subject: Re: [PATCH v1 26/29] xen/asm-generic: introduce stub header
 monitor.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Date: Mon, 23 Oct 2023 14:37:47 +0300
In-Reply-To: <99fcc71c-eefc-d004-d4d3-6e0d0e76339d@suse.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <a2663ba600f468bc4d6544bb64354a77c86a40b3.1694702259.git.oleksii.kurochko@gmail.com>
	 <99fcc71c-eefc-d004-d4d3-6e0d0e76339d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 13:35 +0200, Jan Beulich wrote:
> On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/monitor.h
> > @@ -0,0 +1,64 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/* SPDX-License-Identifier: GPL-2.0 */
>=20
> ???
Oh, I'll drop SPDX-License-Identifier: GPL-2.0.
>=20
> > +/*
> > + * include/asm-GENERIC/monitor.h
> > + *
> > + * Arch-specific monitor_op domctl handler.
> > + *
> > + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> > + * Copyright (c) 2016, Bitdefender S.R.L.
> > + *
> > + */
> > +
> > +#ifndef __ASM_GENERIC_MONITOR_H__
> > +#define __ASM_GENERIC_MONITOR_H__
> > +
> > +#include <xen/sched.h>
> > +#include <public/domctl.h>
>=20
> No need for this, I don't think?
Yes, I'll drop that too.
>=20
> > +static inline
> > +void arch_monitor_allow_userspace(struct domain *d, bool
> > allow_userspace)
> > +{
> > +}
> > +
> > +static inline
> > +int arch_monitor_domctl_op(struct domain *d, struct
> > xen_domctl_monitor_op *mop)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* No arch-specific monitor ops on GENERIC. */
> > +=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> > +}
> > +
> > +int arch_monitor_domctl_event(struct domain *d,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_domctl_monitor_op *mop);
> > +
> > +static inline
> > +int arch_monitor_init_domain(struct domain *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* No arch-specific domain initialization on GENERI=
C. */
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +static inline
> > +void arch_monitor_cleanup_domain(struct domain *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* No arch-specific domain cleanup on GENERIC. */
> > +}
> > +
> > +static inline uint32_t arch_monitor_get_capabilities(struct domain
> > *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 uint32_t capabilities =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0 return capabilities;
>=20
> Just "return 0"?
Thanks. I'll update that part.


~ Oleksii

