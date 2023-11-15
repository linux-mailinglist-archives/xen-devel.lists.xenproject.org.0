Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 721AE7EC30B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 13:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633633.988672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3FPk-00041F-3C; Wed, 15 Nov 2023 12:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633633.988672; Wed, 15 Nov 2023 12:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3FPk-0003yc-0U; Wed, 15 Nov 2023 12:54:40 +0000
Received: by outflank-mailman (input) for mailman id 633633;
 Wed, 15 Nov 2023 12:54:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CM7O=G4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3FPi-0003yW-Kr
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 12:54:38 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2197e3b9-83b6-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 13:54:36 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c6efcef4eeso89603671fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 04:54:36 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z20-20020a05651c023400b002bb99bd0865sm1652201ljn.38.2023.11.15.04.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 04:54:35 -0800 (PST)
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
X-Inumbo-ID: 2197e3b9-83b6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700052876; x=1700657676; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FpMZ16w6mhgG7e3NcyocROQ/x0YvdkFv//zYTJ3OUY4=;
        b=lyAaB4uFJcKkh5/A0QB6Cw6LN/LvmHf2nXoQMxibzhSo9HNqBbi9Wf23p/jLsg6xV2
         B2Ngo46lsiCfCWayR/hcD6XxActRcu2L0Va2RzRLwBiIPQGTyLOhAyCcvpdWM4gQ1REN
         GxkPnVd3dS7IuDuUNPF+zhtQIitXkjtBrzvz18TBHTpIMYpehl7mQoaNvRefIeDgghlp
         cUr5hI3j8U6fcy0a3LA/kL8fEYeHwjO/qbm2pKi9RnptdbCIR9Vur7CFQD2RWCTFdHQR
         E9qdVwwEbfUxIyyJZRHjjpTUKz13qLIDnwg7alGko2sK2Z7Eb1r+dvu2KA/JJlFY3gDu
         sQgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700052876; x=1700657676;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FpMZ16w6mhgG7e3NcyocROQ/x0YvdkFv//zYTJ3OUY4=;
        b=HkRvcvT/OHArWJNT6agSIKtJpUyd3Fnipj/72YJhqk6XKRCKB5ezgrdTMExudIDtil
         CJ6u2S3J7Ccg4wAjjTAvslx6eHjcAYLUQ5zjTFXciS/f7TOplCDwhYU4ROPTe+7IUm2S
         o1wilN86EuIB91/JTmIkMogK7KSF9hbC8FolTIHBt/j4E+eVFYsMfvGic7bahkKxnVaO
         GGNGIkkWb8B6ZfELfqq1aJIY65HaQYhQS8WU0mS38CILwNJZ3j8FEZwv/U6NukEJJYLV
         ceXC/fNRoti0PCV5RPWWV3HTRxktyhf+0Gc8nfc0kpB6ps195gRTuaaAue13ys93kI9m
         IVww==
X-Gm-Message-State: AOJu0YwJ3M5yzsHEpdxzi0HS6jTORppxrcNR+6u6WJoJnZ3c2OQePZC1
	54f9V/pJZqNiJ22Pv1aaV3HCY1b/nK8=
X-Google-Smtp-Source: AGHT+IELjBC1fDKp17JiXzyZdSRmvqdRRYu3vYJxefp/rwAnIDhSGEnf5qPUuSzymxpGZEQBBDXOEQ==
X-Received: by 2002:a2e:9b54:0:b0:2bc:b75e:b88 with SMTP id o20-20020a2e9b54000000b002bcb75e0b88mr5238933ljj.18.1700052875820;
        Wed, 15 Nov 2023 04:54:35 -0800 (PST)
Message-ID: <e1041215c28cd3582ed1b2ecc64a0e2ef3c11c54.camel@gmail.com>
Subject: Re: [PATCH v2 13/15] xen/asm-generic: introduce stub header
 monitor.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
	 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
	xen-devel@lists.xenproject.org
Date: Wed, 15 Nov 2023 14:54:34 +0200
In-Reply-To: <0ec74ba0-895f-4642-ae83-fc2617435303@suse.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <9b40493df82b99904b2e4f6cf9dc8888db4a2a49.1699633310.git.oleksii.kurochko@gmail.com>
	 <0ec74ba0-895f-4642-ae83-fc2617435303@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-11-15 at 11:00 +0100, Jan Beulich wrote:
> On 10.11.2023 17:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/monitor.h
> > @@ -0,0 +1,62 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
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
>=20
> What is this needed for? I expect ...
>=20
> > +struct xen_domctl_monitor_op;
> > +
> > +static inline
> > +void arch_monitor_allow_userspace(struct domain *d, bool
> > allow_userspace)
>=20
> ... struct domain, but since you never de-reference any such pointer,
> forward-
> declaring that (just like struct xen_domctl_monitor_op) would do
> here. Which
> would leave you with needing at most xen/types.h, but maybe as little
> as
> xen/stdbool.h and xen/stdint.h.
Yes, the reason for " #include <xen/sched.h> " was ' struct domain '.
Let's switch to forward-declaring.

Shouldn't it be included <xen/compiler.h> too for inline?

~ Oleksii

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
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > +#endif /* __ASM_GENERIC_MONITOR_H__ */
> > +
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: BSD
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
>=20


