Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECA77E7AD7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:29:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630019.982655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Npi-0001es-Fc; Fri, 10 Nov 2023 09:29:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630019.982655; Fri, 10 Nov 2023 09:29:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Npi-0001ct-D2; Fri, 10 Nov 2023 09:29:46 +0000
Received: by outflank-mailman (input) for mailman id 630019;
 Fri, 10 Nov 2023 09:29:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1Npg-0001XY-9f
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:29:44 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ada8c38b-7fab-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 10:29:42 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53dd3f169d8so2863946a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 01:29:42 -0800 (PST)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 l26-20020a056402345a00b005402a0c9784sm877372edc.40.2023.11.10.01.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 01:29:40 -0800 (PST)
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
X-Inumbo-ID: ada8c38b-7fab-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699608581; x=1700213381; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1jK9YQF8l+hMrgTg5vBqNtecu7Wo26NywrWJux0kVZk=;
        b=M4c2dPhZMcoUKtUCe1sS+N7I1vFcl6RWqulCzkn++l/CapciSdZvnh7GxrKmszOw0h
         eGmnLHjHt39loo4rxpLao/BcbZo4SR/cZuYlECpa3pKU3UXhZDQKtoiflBg2Es8RLUSn
         K8RQ7IH7MwRgWbuTQbWsWfQ7tBHzszD86rR17vHT43VcTFVrsR5BJZMsxFGM2VBQk9XR
         irpkdASdh3sZlmkyE4HpSN/HRVgx/YHYeXq728PoM3RwIjbVhIEf6iLG8F4htPBpTnkt
         423RV/6cfJe4VMrdbs3YQNHtxALzrasv+/qKMO3gYJzfAMNZiLMikEGZGsMZVZxtBpEX
         xqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699608581; x=1700213381;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1jK9YQF8l+hMrgTg5vBqNtecu7Wo26NywrWJux0kVZk=;
        b=ma7CE+ACkBij/8xeVsWI4eIL0mKF250bIH/ygzDJcnhNqieUd3MrlXMl5mIi/AQhQ2
         /U70S3oWVzCLrEFiwHKyr6rUdGR+gDFlsNBXWptuund1RpahcipUAyOSCVl+N113CUQB
         QAKjhjIBKHw05GnXZWAwdl017UmAIe4LazIbnN4WqYELM2EhTTrkjjLJXhVZzhOxCKtu
         N08JlqB/8Vl37n+0ba59ZarehUAzswJAYTo7MPyeEtACfGZO77bnRlu55mTy4eIA5yOT
         AKDvgA2RXZbgpNKt3m3Fvt2BEDo9EnX1MOeUveEteKjFWOkLyM7HcNlP/revckTU6cm/
         IEGQ==
X-Gm-Message-State: AOJu0YzbrDgtqsG+u5kCqvFsa0j+0aoZJzQcAgFx6gbHcXciL/tBphLj
	3PTRm5THzIdjVjs+vIB4DaOSyQ4N1Z4=
X-Google-Smtp-Source: AGHT+IERhDn6gfwLuTZZmsM3tKYMBztJSdc8FYO9xzIX1wBQfiDs1BMRqKgQvBx56PxzA3pUTOSVSA==
X-Received: by 2002:a50:cd95:0:b0:53f:bd95:d963 with SMTP id p21-20020a50cd95000000b0053fbd95d963mr5871851edi.32.1699608580866;
        Fri, 10 Nov 2023 01:29:40 -0800 (PST)
Message-ID: <9f5f366a4e7f6050f5c8893282c502d1cff25142.camel@gmail.com>
Subject: Re: [PATCH] xen: remove <asm/delay.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,  George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Bob Eshleman
 <bobbyeshleman@gmail.com>,  Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Fri, 10 Nov 2023 11:29:39 +0200
In-Reply-To: <a9eb7c50e99db286d011169030c6ef1d92f3da23.1698747162.git.oleksii.kurochko@gmail.com>
References: 
	<a9eb7c50e99db286d011169030c6ef1d92f3da23.1698747162.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hi all,

On Tue, 2023-10-31 at 12:12 +0200, Oleksii Kurochko wrote:
> <asm/delay.h> only declares udelay() function so udelay() =C2=A0
> declaration was moved to xen/delay.h.
>=20
> For x86, __udelay() was renamed to udelay() and removed
> inclusion of <asm/delay.h> in x86 code.
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> =C2=A0xen/arch/arm/include/asm/delay.h=C2=A0=C2=A0 | 14 --------------
> =C2=A0xen/arch/riscv/include/asm/delay.h | 13 -------------
> =C2=A0xen/arch/x86/cpu/microcode/core.c=C2=A0 |=C2=A0 2 +-
> =C2=A0xen/arch/x86/delay.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0xen/arch/x86/include/asm/delay.h=C2=A0=C2=A0 | 13 -------------
> =C2=A0xen/include/xen/delay.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> =C2=A06 files changed, 4 insertions(+), 43 deletions(-)
> =C2=A0delete mode 100644 xen/arch/arm/include/asm/delay.h
> =C2=A0delete mode 100644 xen/arch/riscv/include/asm/delay.h
> =C2=A0delete mode 100644 xen/arch/x86/include/asm/delay.h
>=20
> diff --git a/xen/arch/arm/include/asm/delay.h
> b/xen/arch/arm/include/asm/delay.h
> deleted file mode 100644
> index 042907d9d5..0000000000
> --- a/xen/arch/arm/include/asm/delay.h
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -#ifndef _ARM_DELAY_H
> -#define _ARM_DELAY_H
> -
> -extern void udelay(unsigned long usecs);
> -
> -#endif /* defined(_ARM_DELAY_H) */
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/arch/riscv/include/asm/delay.h
> b/xen/arch/riscv/include/asm/delay.h
> deleted file mode 100644
> index 2d59622c75..0000000000
> --- a/xen/arch/riscv/include/asm/delay.h
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
> - * Copyright (C) 2016 Regents of the University of California
> - */
> -
> -#ifndef _ASM_RISCV_DELAY_H
> -#define _ASM_RISCV_DELAY_H
> -
> -#define udelay udelay
> -extern void udelay(unsigned long usecs);
> -
> -#endif /* _ASM_RISCV_DELAY_H */
> diff --git a/xen/arch/x86/cpu/microcode/core.c
> b/xen/arch/x86/cpu/microcode/core.c
> index c3fee62906..48822360c0 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -23,6 +23,7 @@
> =C2=A0
> =C2=A0#include <xen/alternative-call.h>
> =C2=A0#include <xen/cpu.h>
> +#include <xen/delay.h>
> =C2=A0#include <xen/earlycpio.h>
> =C2=A0#include <xen/err.h>
> =C2=A0#include <xen/guest_access.h>
> @@ -35,7 +36,6 @@
> =C2=A0
> =C2=A0#include <asm/apic.h>
> =C2=A0#include <asm/cpu-policy.h>
> -#include <asm/delay.h>
> =C2=A0#include <asm/nmi.h>
> =C2=A0#include <asm/processor.h>
> =C2=A0#include <asm/setup.h>
> diff --git a/xen/arch/x86/delay.c b/xen/arch/x86/delay.c
> index 2662c26272..b3a41881a1 100644
> --- a/xen/arch/x86/delay.c
> +++ b/xen/arch/x86/delay.c
> @@ -15,7 +15,7 @@
> =C2=A0#include <asm/msr.h>
> =C2=A0#include <asm/processor.h>
> =C2=A0
> -void __udelay(unsigned long usecs)
> +void udelay(unsigned long usecs)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long ticks =3D usecs * (cpu_khz / 1000)=
;
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long s, e;
> diff --git a/xen/arch/x86/include/asm/delay.h
> b/xen/arch/x86/include/asm/delay.h
> deleted file mode 100644
> index 9be2f46590..0000000000
> --- a/xen/arch/x86/include/asm/delay.h
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -#ifndef _X86_DELAY_H
> -#define _X86_DELAY_H
> -
> -/*
> - * Copyright (C) 1993 Linus Torvalds
> - *
> - * Delay routines calling functions in arch/i386/lib/delay.c
> - */
> -
> -extern void __udelay(unsigned long usecs);
> -#define udelay(n) __udelay(n)
> -
> -#endif /* defined(_X86_DELAY_H) */
> diff --git a/xen/include/xen/delay.h b/xen/include/xen/delay.h
> index 9d70ef035f..a5189329c7 100644
> --- a/xen/include/xen/delay.h
> +++ b/xen/include/xen/delay.h
> @@ -3,8 +3,9 @@
> =C2=A0
> =C2=A0/* Copyright (C) 1993 Linus Torvalds */
> =C2=A0
> -#include <asm/delay.h>
> =C2=A0#define mdelay(n) (\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{unsigned long msec=3D(n)=
; while (msec--) udelay(1000);})
> =C2=A0
> +void udelay(unsigned long usecs);
> +
> =C2=A0#endif /* defined(_LINUX_DELAY_H) */
I forgot to update xen/arch/{x86,arm,ppc}/include/asm/Makefile:
    generic-y +=3D delay.h

Should I send a new patch version or it can be updated durig merge?

~ Oleksii


