Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A157E7B5D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 11:21:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630087.982786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1OdB-000856-9k; Fri, 10 Nov 2023 10:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630087.982786; Fri, 10 Nov 2023 10:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1OdB-00082u-6h; Fri, 10 Nov 2023 10:20:53 +0000
Received: by outflank-mailman (input) for mailman id 630087;
 Fri, 10 Nov 2023 10:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1Od9-00082o-PE
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 10:20:51 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d243da32-7fb2-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 11:20:50 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9d2d8343dc4so319386166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 02:20:50 -0800 (PST)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 bv15-20020a170906b1cf00b009829d2e892csm3795326ejb.15.2023.11.10.02.20.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 02:20:49 -0800 (PST)
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
X-Inumbo-ID: d243da32-7fb2-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699611650; x=1700216450; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Geeg0nZ4ceUoCxSPjoCSKbAdAXqtL2lzKCusKg/xTZc=;
        b=GQ8mXhQcoXWNLXUk+uACn8+WkVtko6Agl+ZkYbBToeLh/b3X9fzr9PUsxlc/Ksj156
         VFbG5uFUXnoGRPyY4LJJuPJ/0CRxNjnL8lLdMZTbKjLDKH6ryPy2dKknBIrJ7Jy6OaVg
         9aCcSLqFIrp9sS6Kr45PUPmhxuT29Kb4We+WcHYF7xC2dW4KdqZpFKE9g/4rgR5RV6iC
         YmjoLiVSs1e6U/zyZDoYbbnyLw1Sesvo79V+5338Pxy5+Iix7cqhhP25B/aZGSJmvUku
         mRvpmUQylyx6XwMSdnVOO1bVS2R5WcBni0qxCD7p6YwEi47M68cqFhcGEOwb9c3XbNUo
         ZziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699611650; x=1700216450;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Geeg0nZ4ceUoCxSPjoCSKbAdAXqtL2lzKCusKg/xTZc=;
        b=DK0l4CTxrBZTHXjYqiWwTbyqxIwHVmct7r1bHW61/+66H5v9bzC0/l3MI/ZFyVHcr6
         B/DJ22l2QYefhHPAjuoFjEZWN5clbSLMDjfUUTzQFt/GA80w+0bffo4SvRhNvnlNGOaw
         jJhO3AnMo+9RooWH/BIxuCphegb+vxJixmDxDiCpvOBQJlwIRDMMzNs5ttOf9bawd6wV
         g8s1gW0N4Dq1aXrqWqewlQ1ayZ38IxF7Etvck/v772ENO2OSsiU4JYOvaRQSvaVREx9P
         Xm+BoMu/b4nczvtBclmRM6kDcygp/G9GU/1DhTo4Wrw5YZyT9bjNptOt/dky4iW8bJ0o
         KCmg==
X-Gm-Message-State: AOJu0YwCenF/zwNkhYQVgSMgUv2CYYF1idwJSia7a9LEdrmcYd5fNnCW
	+khcWUrr0IrvcfeHOCEleRo=
X-Google-Smtp-Source: AGHT+IHOU3Bt9LyIKKw9MdSeqMp7K9sHAC8IAA9C8ncB/Bpyg4MP1SF31uC+9+VqasH+8c6tXSNOiA==
X-Received: by 2002:a17:906:fd85:b0:9d3:e48f:30c5 with SMTP id xa5-20020a170906fd8500b009d3e48f30c5mr6676563ejb.55.1699611649854;
        Fri, 10 Nov 2023 02:20:49 -0800 (PST)
Message-ID: <0b0ae5db8d6de3bd8324577ddb7a70170fed6a5e.camel@gmail.com>
Subject: Re: [PATCH v2] xen: remove <asm/delay.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>, Roger
 Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Date: Fri, 10 Nov 2023 12:20:48 +0200
In-Reply-To: <783660ff-63d8-62b9-1859-33614e0d128b@suse.com>
References: 
	<3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
	 <99c3a51292fcc85da0759a5abe84e97c6c429358.camel@gmail.com>
	 <783660ff-63d8-62b9-1859-33614e0d128b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Fri, 2023-11-10 at 10:33 +0100, Jan Beulich wrote:
> On 10.11.2023 10:30, Oleksii wrote:
> > On Tue, 2023-10-31 at 16:28 +0200, Oleksii Kurochko wrote:
> > > <asm/delay.h> only declares udelay() function so udelay()
> > > declaration was moved to xen/delay.h.
> > >=20
> > > For x86, __udelay() was renamed to udelay() and removed
> > > inclusion of <asm/delay.h> in x86 code.
> > >=20
> > > For ppc, udelay() stub definition was moved to ppc/stubs.c.
> > >=20
> > > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > > ---
> > > Changes in v2:
> > > =C2=A0- rebase on top of the latest staging.
> > > =C2=A0- add Suggested-by:/Reviewed-by: Jan Beulich
> > > <jbeulich@suse.com>.
> > > =C2=A0- remove <asm/delay.h> for PPC.
> > > =C2=A0- remove changes related to RISC-V's <asm/delay.h> as they've
> > > not
> > > =C2=A0=C2=A0 introduced in staging branch yet.
> > > ---
> > > =C2=A0xen/arch/arm/include/asm/delay.h=C2=A0 | 14 --------------
> > > =C2=A0xen/arch/ppc/include/asm/delay.h=C2=A0 | 12 ------------
> > > =C2=A0xen/arch/ppc/stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++++
> > > =C2=A0xen/arch/x86/cpu/microcode/core.c |=C2=A0 2 +-
> > > =C2=A0xen/arch/x86/delay.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A0xen/arch/x86/include/asm/delay.h=C2=A0 | 13 -------------
> > > =C2=A0xen/include/xen/delay.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> > > =C2=A07 files changed, 10 insertions(+), 42 deletions(-)
> > > =C2=A0delete mode 100644 xen/arch/arm/include/asm/delay.h
> > > =C2=A0delete mode 100644 xen/arch/ppc/include/asm/delay.h
> > > =C2=A0delete mode 100644 xen/arch/x86/include/asm/delay.h
> > >=20
> > > diff --git a/xen/arch/arm/include/asm/delay.h
> > > b/xen/arch/arm/include/asm/delay.h
> > > deleted file mode 100644
> > > index 042907d9d5..0000000000
> > > --- a/xen/arch/arm/include/asm/delay.h
> > > +++ /dev/null
> > > @@ -1,14 +0,0 @@
> > > -#ifndef _ARM_DELAY_H
> > > -#define _ARM_DELAY_H
> > > -
> > > -extern void udelay(unsigned long usecs);
> > > -
> > > -#endif /* defined(_ARM_DELAY_H) */
> > > -/*
> > > - * Local variables:
> > > - * mode: C
> > > - * c-file-style: "BSD"
> > > - * c-basic-offset: 4
> > > - * indent-tabs-mode: nil
> > > - * End:
> > > - */
> > > diff --git a/xen/arch/ppc/include/asm/delay.h
> > > b/xen/arch/ppc/include/asm/delay.h
> > > deleted file mode 100644
> > > index da6635888b..0000000000
> > > --- a/xen/arch/ppc/include/asm/delay.h
> > > +++ /dev/null
> > > @@ -1,12 +0,0 @@
> > > -/* SPDX-License-Identifier: GPL-2.0-only */
> > > -#ifndef __ASM_PPC_DELAY_H__
> > > -#define __ASM_PPC_DELAY_H__
> > > -
> > > -#include <xen/lib.h>
> > > -
> > > -static inline void udelay(unsigned long usecs)
> > > -{
> > > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > -}
> > > -
> > > -#endif /* __ASM_PPC_DELAY_H__ */
> > > diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> > > index 4c276b0e39..a96e45626d 100644
> > > --- a/xen/arch/ppc/stubs.c
> > > +++ b/xen/arch/ppc/stubs.c
> > > @@ -337,3 +337,10 @@ int __init parse_arch_dom0_param(const char
> > > *s,
> > > const char *e)
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > =C2=A0}
> > > +
> > > +/* delay.c */
> > > +
> > > +void udelay(unsigned long usecs)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > +}
> > > diff --git a/xen/arch/x86/cpu/microcode/core.c
> > > b/xen/arch/x86/cpu/microcode/core.c
> > > index 65ebeb50de..22d5e04552 100644
> > > --- a/xen/arch/x86/cpu/microcode/core.c
> > > +++ b/xen/arch/x86/cpu/microcode/core.c
> > > @@ -23,6 +23,7 @@
> > > =C2=A0
> > > =C2=A0#include <xen/alternative-call.h>
> > > =C2=A0#include <xen/cpu.h>
> > > +#include <xen/delay.h>
> > > =C2=A0#include <xen/earlycpio.h>
> > > =C2=A0#include <xen/err.h>
> > > =C2=A0#include <xen/guest_access.h>
> > > @@ -35,7 +36,6 @@
> > > =C2=A0
> > > =C2=A0#include <asm/apic.h>
> > > =C2=A0#include <asm/cpu-policy.h>
> > > -#include <asm/delay.h>
> > > =C2=A0#include <asm/nmi.h>
> > > =C2=A0#include <asm/processor.h>
> > > =C2=A0#include <asm/setup.h>
> > > diff --git a/xen/arch/x86/delay.c b/xen/arch/x86/delay.c
> > > index 2662c26272..b3a41881a1 100644
> > > --- a/xen/arch/x86/delay.c
> > > +++ b/xen/arch/x86/delay.c
> > > @@ -15,7 +15,7 @@
> > > =C2=A0#include <asm/msr.h>
> > > =C2=A0#include <asm/processor.h>
> > > =C2=A0
> > > -void __udelay(unsigned long usecs)
> > > +void udelay(unsigned long usecs)
> > > =C2=A0{
> > > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long ticks =3D usecs * (cpu_khz / 1=
000);
> > > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long s, e;
> > > diff --git a/xen/arch/x86/include/asm/delay.h
> > > b/xen/arch/x86/include/asm/delay.h
> > > deleted file mode 100644
> > > index 9be2f46590..0000000000
> > > --- a/xen/arch/x86/include/asm/delay.h
> > > +++ /dev/null
> > > @@ -1,13 +0,0 @@
> > > -#ifndef _X86_DELAY_H
> > > -#define _X86_DELAY_H
> > > -
> > > -/*
> > > - * Copyright (C) 1993 Linus Torvalds
> > > - *
> > > - * Delay routines calling functions in arch/i386/lib/delay.c
> > > - */
> > > -
> > > -extern void __udelay(unsigned long usecs);
> > > -#define udelay(n) __udelay(n)
> > > -
> > > -#endif /* defined(_X86_DELAY_H) */
> > > diff --git a/xen/include/xen/delay.h b/xen/include/xen/delay.h
> > > index 9150226271..8fd3b8f99f 100644
> > > --- a/xen/include/xen/delay.h
> > > +++ b/xen/include/xen/delay.h
> > > @@ -3,7 +3,7 @@
> > > =C2=A0
> > > =C2=A0/* Copyright (C) 1993 Linus Torvalds */
> > > =C2=A0
> > > -#include <asm/delay.h>
> > > +void udelay(unsigned long usecs);
> > > =C2=A0
> > > =C2=A0static inline void mdelay(unsigned long msec)
> > > =C2=A0{
> >=20
> > I forgot to update xen/arch/{x86,arm,ppc}/include/asm/Makefile:
> > =C2=A0=C2=A0=C2=A0 generic-y +=3D delay.h
> >=20
> > Should I send a new patch version or it can be updated durig merge?
>=20
> My take is that such a change wouldn't be appropriate to do by the
> committer. But: Why would this be needed? You're not introducing
> asm-generic/delay.h. Everything is moved to just xen/delay.h.
You are right. I started to rework other patches of generic headers
patch series and there are places where asm/Makefile should be updated
so automatically decided that it is needed here too.
My fault.

Thanks.

~ Oleksii

