Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BFC838E6F
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 13:24:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670432.1043192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSFpV-0007Hy-MK; Tue, 23 Jan 2024 12:24:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670432.1043192; Tue, 23 Jan 2024 12:24:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSFpV-0007G3-J6; Tue, 23 Jan 2024 12:24:37 +0000
Received: by outflank-mailman (input) for mailman id 670432;
 Tue, 23 Jan 2024 12:24:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OrDF=JB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rSFpU-0007Fw-7N
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 12:24:36 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e2ea9ea-b9ea-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 13:24:35 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a30ed6dbdadso9104166b.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 04:24:35 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 tg10-20020a1709078dca00b00a30359b954asm2377804ejc.1.2024.01.23.04.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 04:24:33 -0800 (PST)
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
X-Inumbo-ID: 5e2ea9ea-b9ea-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706012674; x=1706617474; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l8kRvst86tlTULqRupUh3xvKYJDK8yiGlji+BEBWim0=;
        b=FohZ8r5xGHWmP4UTyZ4F89T6jaJd84TRVFrly+hDjjP1KSqfPvrvkiNrBlci9M0goh
         plsNCcVeFIh6tK++d03Wdh/3LnRBlkOrwQnRSgMboRm+Pp0h3q+2eE7OguJ6ScqzZEkY
         F8RGCnz3Shnv0+sv3CvGclFGci5cI2cm3YZmhRsEQSct0AjjU3rggZPgrkIn7dq/e2zw
         3gL1Q/pmG3GX2NoSiYtC2qi8cMQtcbD5Uabjc5hrvj2I90zIpdoN+fEwe11FyEOgE+zb
         QgMO1lwXe7bnmDuId6e2Esor9j0vgJ1Bvxj0LUrCu0DogTwJAANqy3wytkw1qfg4AV40
         wl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706012674; x=1706617474;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l8kRvst86tlTULqRupUh3xvKYJDK8yiGlji+BEBWim0=;
        b=mZuM5H2gmdCAKilmxrwCJfFGJPNJ6OxbeP4riB1UI4S6bAwqGOTXIH9oYcP0zdm69p
         9u+6y9SSmk0KdtDdLAlNSXWt/P/15pFYns3RYIGjoN+vhWBIYvgiszdhXbcdJzeE51zs
         NfVfc1CyCalLv8T1k189XIZ7vkSO1RWSh/oLvwPaB+wI2b03sp3hayl3pOFwBlr0aiEZ
         BDp+L6n6T2+x2B3lU3RFPv6lAd6+P4+qXxMrbQZQl/L96rBZTtm7Qh19h3TCkkJ+WlJu
         uG4chUDVsTE3n8bfDCAAa6tEhXg+kfAMbjJUFKzd3x9yL9jY3msK39/fxQ9ArQDnZp4o
         kZtA==
X-Gm-Message-State: AOJu0YxnWWdKZuFcxYcdjs1n33Nm05xEf9s85Zg8c3jDocG94Rk7bTJ7
	Kcm5Vdej8mhf7nS13/mrI/QNSZYzj0LullLHnPWRayHXOK7phH/+HMqIvrOePLQ=
X-Google-Smtp-Source: AGHT+IHnOx/hdAXusCdX2Dj5vTL/yNR47xokHYWFjvC/UwqIliE4VRj/7o7ZcWoyjVMU/jPQAL0LFA==
X-Received: by 2002:a17:907:7211:b0:a2f:d73d:e99d with SMTP id dr17-20020a170907721100b00a2fd73de99dmr109757ejc.18.1706012674210;
        Tue, 23 Jan 2024 04:24:34 -0800 (PST)
Message-ID: <d7f89e6f4aae5c8cfa5215bd893b62a3d542ce4c.camel@gmail.com>
Subject: Re: [PATCH v3 15/34] xen/riscv: introduce atomic.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Tue, 23 Jan 2024 14:24:33 +0200
In-Reply-To: <6aa39fac-fef6-47ce-8c27-4941d83c138a@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <54f5f13a4ee3de3c3cf4ba2b4d0347bb77bb7d08.1703255175.git.oleksii.kurochko@gmail.com>
	 <2429395f-3ce8-4f17-aabe-78af2446ff6d@suse.com>
	 <92d7caf20a37b68dce7676812c2780bc2fbc00cf.camel@gmail.com>
	 <6aa39fac-fef6-47ce-8c27-4941d83c138a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-23 at 11:30 +0100, Jan Beulich wrote:
> On 23.01.2024 11:21, Oleksii wrote:
> > On Mon, 2024-01-22 at 17:56 +0100, Jan Beulich wrote:
> > > On 22.12.2023 16:12, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/include/asm/fence.h
> > > > @@ -0,0 +1,13 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > > > +#ifndef _ASM_RISCV_FENCE_H
> > > > +#define _ASM_RISCV_FENCE_H
> > > > +
> > > > +#ifdef CONFIG_SMP
> > > > +#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
> > > > +#define RISCV_RELEASE_BARRIER		"\tfence rw,=C2=A0 w\n"
> > > > +#else
> > > > +#define RISCV_ACQUIRE_BARRIER
> > > > +#define RISCV_RELEASE_BARRIER
> > > > +#endif
> > >=20
> > > Do you really care about the !SMP case? On x86 at least we
> > > stopped
> > > special-
> > > casing that configuration many years ago (the few cases where for
> > > typically
> > > build reasons it matters, using CONFIG_NR_CPUS is sufficient). If
> > > you
> > > care
> > > about it, there needs to be somewhere you actually #define
> > > CONFIG_SMP.
> > Can't we use instead of CONFIG_SMP - CONFIG_NR_CPUS?
>=20
> You can. Question is whether there's a point in doing so. Do you
> expect people to actually want to run Xen on single-CPU systems?
> They're generally not overly well suited for virtualization ...
Just to clarify.

Do you mean physically single based CPU?
Then I don't expect to run Xen on such systems and it is not nesessary
to define *_BARRIER in this case. Should we have to add build error
notification that we don't support single-CPU systems in this header?

If you are speaking about we have ,let it be, 4 CPUs and only 1 CPU is
currently supported by Xen then it still makes sense.

~ Oleksii

