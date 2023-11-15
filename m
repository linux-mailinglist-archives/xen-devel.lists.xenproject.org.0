Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3D37EC527
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 15:28:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633694.988747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3GsH-0007SZ-9Z; Wed, 15 Nov 2023 14:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633694.988747; Wed, 15 Nov 2023 14:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3GsH-0007QE-6K; Wed, 15 Nov 2023 14:28:13 +0000
Received: by outflank-mailman (input) for mailman id 633694;
 Wed, 15 Nov 2023 14:28:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CM7O=G4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3GsG-0007Q8-28
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 14:28:12 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 340cceb1-83c3-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 15:28:11 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9c53e8b7cf4so995425766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 06:28:11 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 fx18-20020a170906b75200b009e6b5406b3fsm7070954ejb.122.2023.11.15.06.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 06:28:09 -0800 (PST)
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
X-Inumbo-ID: 340cceb1-83c3-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700058490; x=1700663290; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b8GrptftHD+lZyeSeU+p6hTjp37Sq3AFtwi+T6Gw57I=;
        b=f4oXkGjOTKe6p8Ds0c30zqCiOUsEumEAJHBBE5vDVdDy2LlAyDZhB3h8WglV4t0i8B
         GaZsU6b1rI8yQvllSQQHLjCrTU7Sdw5eleCjk56P3/oA7IBIzqXHFd72dZbQfU+zQBPA
         /TJUk/QK33o9kTWpht4UGyrSHQBGDFJpICPq5XtffFlI3pQmDTSAI7BdOMYANm4k9gIl
         I787OO6I9wiRKurE0qlnSTieLKxF4mJui94GhnGaooXsyjC9/0gh4+wAsfijZsdTRTj2
         pKtVLaVGYMkMGifH/ZrY7+E3684x1CadVtTRaMc+/UZbyOW7B/m8x/jywcW3g9Es5Ybw
         K3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700058490; x=1700663290;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b8GrptftHD+lZyeSeU+p6hTjp37Sq3AFtwi+T6Gw57I=;
        b=DSGO5VXDScoa/aeNefXGiuUl/1zbP6QV+8aBeDBHHC8FkIK1kEwgthfrxWC1rDLAw2
         FE9fcW2R+k2/oYmJJhXFz/gC0IMR9Ncfv1+ii8JtqtlvCGcPCovYn+sTV+hHnxIE1Zjr
         AeBs00I/C1X+N+GcP9zH5K3I7dI22xPq+XucvPewmxGB3+GTiC5Uu6p4pDl/85GFdPha
         tUUztlpsb8vmf66nCXqXj4acxHqyuxl3Ll/qXaQx/A29BB4tH7ppId714SU986+9PggE
         LAuTbTqrpe/8LJACSVXMGp9KmQhyyc6bPzhTXS3oEDQF99Gi0p96XISgAFQDJWsEAT5J
         Dr7Q==
X-Gm-Message-State: AOJu0YymQmvs1T3hCJ0VK/6pA1LPM+mv21qGUxCJe6iehhAUePvMvEkv
	WvukmMG8GbCVf0vNHGsorMygEfhFrZU=
X-Google-Smtp-Source: AGHT+IG3rNbgvnPiqOQkjdcE9sBJ8nTpRrTYMZCPLi1qet+cPfFhcGYC6O9i7bM42jHrSGf2/PwzEA==
X-Received: by 2002:a17:906:498:b0:9be:e90:5016 with SMTP id f24-20020a170906049800b009be0e905016mr9135895eja.24.1700058490332;
        Wed, 15 Nov 2023 06:28:10 -0800 (PST)
Message-ID: <a3320501f2ba0f66621ec80f832d120c99e63244.camel@gmail.com>
Subject: Re: [PATCH v2 13/15] xen/asm-generic: introduce stub header
 monitor.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Date: Wed, 15 Nov 2023 16:28:09 +0200
In-Reply-To: <e1041215c28cd3582ed1b2ecc64a0e2ef3c11c54.camel@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <9b40493df82b99904b2e4f6cf9dc8888db4a2a49.1699633310.git.oleksii.kurochko@gmail.com>
	 <0ec74ba0-895f-4642-ae83-fc2617435303@suse.com>
	 <e1041215c28cd3582ed1b2ecc64a0e2ef3c11c54.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-11-15 at 14:54 +0200, Oleksii wrote:
> On Wed, 2023-11-15 at 11:00 +0100, Jan Beulich wrote:
> > On 10.11.2023 17:30, Oleksii Kurochko wrote:
> > > --- /dev/null
> > > +++ b/xen/include/asm-generic/monitor.h
> > > @@ -0,0 +1,62 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * include/asm-GENERIC/monitor.h
> > > + *
> > > + * Arch-specific monitor_op domctl handler.
> > > + *
> > > + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> > > + * Copyright (c) 2016, Bitdefender S.R.L.
> > > + *
> > > + */
> > > +
> > > +#ifndef __ASM_GENERIC_MONITOR_H__
> > > +#define __ASM_GENERIC_MONITOR_H__
> > > +
> > > +#include <xen/sched.h>
> >=20
> > What is this needed for? I expect ...
> >=20
> > > +struct xen_domctl_monitor_op;
> > > +
> > > +static inline
> > > +void arch_monitor_allow_userspace(struct domain *d, bool
> > > allow_userspace)
> >=20
> > ... struct domain, but since you never de-reference any such
> > pointer,
> > forward-
> > declaring that (just like struct xen_domctl_monitor_op) would do
> > here. Which
> > would leave you with needing at most xen/types.h, but maybe as
> > little
> > as
> > xen/stdbool.h and xen/stdint.h.
> Yes, the reason for " #include <xen/sched.h> " was ' struct domain '.
> Let's switch to forward-declaring.
>=20
> Shouldn't it be included <xen/compiler.h> too for inline?
It should be added "#include <xen/errno.h>" because EOPNOTSUPP is used
in arch_monitor_domctl_op.
>=20
> ~ Oleksii
>=20
> > > +{
> > > +}
> > > +
> > > +static inline
> > > +int arch_monitor_domctl_op(struct domain *d, struct
> > > xen_domctl_monitor_op *mop)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 /* No arch-specific monitor ops on GENERIC. */
> > > +=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> > > +}
> > > +
> > > +int arch_monitor_domctl_event(struct domain *d,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_domctl_monitor_op
> > > *mop);
> > > +
> > > +static inline
> > > +int arch_monitor_init_domain(struct domain *d)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 /* No arch-specific domain initialization on GENE=
RIC. */
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +
> > > +static inline
> > > +void arch_monitor_cleanup_domain(struct domain *d)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 /* No arch-specific domain cleanup on GENERIC. */
> > > +}
> > > +
> > > +static inline uint32_t arch_monitor_get_capabilities(struct
> > > domain
> > > *d)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +
> > > +#endif /* __ASM_GENERIC_MONITOR_H__ */
> > > +
> > > +
> > > +/*
> > > + * Local variables:
> > > + * mode: C
> > > + * c-file-style: BSD
> > > + * c-basic-offset: 4
> > > + * indent-tabs-mode: nil
> > > + * End:
> > > + */
> >=20
>=20


