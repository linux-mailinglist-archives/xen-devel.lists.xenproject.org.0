Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1991D7F9DA6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 11:36:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641796.1000710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yyg-0002pK-26; Mon, 27 Nov 2023 10:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641796.1000710; Mon, 27 Nov 2023 10:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7Yyf-0002lV-Rb; Mon, 27 Nov 2023 10:36:33 +0000
Received: by outflank-mailman (input) for mailman id 641796;
 Mon, 27 Nov 2023 10:36:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7Yok-0000Co-I3
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 10:26:18 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 66481989-8d0f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 11:26:17 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50970c2115eso5444629e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 02:26:17 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 n6-20020ac242c6000000b0050baa32e7b1sm783672lfl.280.2023.11.27.02.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 02:26:16 -0800 (PST)
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
X-Inumbo-ID: 66481989-8d0f-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701080777; x=1701685577; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WkFPt88N+PUxGN0su3/tX12/b2mgEyhS/f1xCDw3SHg=;
        b=eQrG2q9AXM6p7fqrPOGZp5+uTM1MLKdQ5Y84hKpQ9YDj2y2DuVO4NjuzuW8sYbwxAi
         h0oRQlNpArtCDE2lWaUY+H8OLHX10ADKK5yp4ahhO4mW8/lJgqrJSSMdI1SXVm0oEFKZ
         lrCFB+Ojy6DI/A7z685Fym9IyxF7+tl7TvnZqHbMqoQ63621B/dXgmoKYNfSBZxu9ziF
         CN5xO02hTUL3wYAHEtLLD86rYBC/6QAFKuuJeBbkEPj3LaFlvXLq9fizPc/3Q1ndQqOE
         tb3EFRY5O4SqAB2UwF+lcUp0HSPbWiBhBlun2pxvmqjFNg37QnWNeuhWdtksBjuygfik
         OUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080777; x=1701685577;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WkFPt88N+PUxGN0su3/tX12/b2mgEyhS/f1xCDw3SHg=;
        b=JhyFlzRNHBZXLM3HdiySAz4eWf2rKmgXYUMeQQZ9CYIKod3KeNQYF9qsLLlQfP3g9c
         893geDbAKJ4P9YTImmVbbGuMzhA3ZwwDFY0GFoGDqe3HEWmAZta96wQw0TdGJdSYqavd
         2AQ7VJyjI18WzHbZWiEuOOLEIHHtDvLIMDzRDN4nsSsXxTT0gy/GIqMy31vej3Sc3jkf
         uRS1c2Rps1qyL6CTjo3tJ3oLv/XPQaPN2eaNHhyFZTUJcXLDyEZkpgpmfNjAcNN/3sT9
         fMmTjTwqSZCsgSaf0bq9vUUYmMIthq5SL+YPvrXnmjBvAjkHCib+Z7iMWPrLBQLqD/Gf
         uM5g==
X-Gm-Message-State: AOJu0Yy8tlXwjAmO9Vb/2wlKbDeGKZkhYNSLGWkuqRmz3muEO93/DLuU
	VEvyli3hdlaH0MmRWb+51Gk8eYlWKsJDog==
X-Google-Smtp-Source: AGHT+IHC1ioWXdzU+J+SFSesJ8aA7zgfTBmLe/d+oLaX/+41Fd4wBYdun5SLhdb5vZqtdMSdD7InqA==
X-Received: by 2002:a19:790b:0:b0:500:a378:db71 with SMTP id u11-20020a19790b000000b00500a378db71mr7241147lfc.57.1701080776526;
        Mon, 27 Nov 2023 02:26:16 -0800 (PST)
Message-ID: <e720e5a053c2ec6b68546f33bb5713b2f2e12c98.camel@gmail.com>
Subject: Re: [PATCH v2] xen: remove <asm/delay.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org, Shawn Anastasio
	 <sanastasio@raptorengineering.com>
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,  George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Date: Mon, 27 Nov 2023 12:26:15 +0200
In-Reply-To: <3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
References: 
	<3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

Hello Shawn,

Could you kindly review the patch when you have a moment?
It can help with merging other patch series.

Thanks in advance.

~ Oleksii

On Tue, 2023-10-31 at 16:28 +0200, Oleksii Kurochko wrote:
> <asm/delay.h> only declares udelay() function so udelay()
> declaration was moved to xen/delay.h.
>=20
> For x86, __udelay() was renamed to udelay() and removed
> inclusion of <asm/delay.h> in x86 code.
>=20
> For ppc, udelay() stub definition was moved to ppc/stubs.c.
>=20
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in v2:
> =C2=A0- rebase on top of the latest staging.
> =C2=A0- add Suggested-by:/Reviewed-by: Jan Beulich <jbeulich@suse.com>.
> =C2=A0- remove <asm/delay.h> for PPC.
> =C2=A0- remove changes related to RISC-V's <asm/delay.h> as they've not
> =C2=A0=C2=A0 introduced in staging branch yet.
> ---
> =C2=A0xen/arch/arm/include/asm/delay.h=C2=A0 | 14 --------------
> =C2=A0xen/arch/ppc/include/asm/delay.h=C2=A0 | 12 ------------
> =C2=A0xen/arch/ppc/stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++++
> =C2=A0xen/arch/x86/cpu/microcode/core.c |=C2=A0 2 +-
> =C2=A0xen/arch/x86/delay.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0xen/arch/x86/include/asm/delay.h=C2=A0 | 13 -------------
> =C2=A0xen/include/xen/delay.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A07 files changed, 10 insertions(+), 42 deletions(-)
> =C2=A0delete mode 100644 xen/arch/arm/include/asm/delay.h
> =C2=A0delete mode 100644 xen/arch/ppc/include/asm/delay.h
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
> diff --git a/xen/arch/ppc/include/asm/delay.h
> b/xen/arch/ppc/include/asm/delay.h
> deleted file mode 100644
> index da6635888b..0000000000
> --- a/xen/arch/ppc/include/asm/delay.h
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef __ASM_PPC_DELAY_H__
> -#define __ASM_PPC_DELAY_H__
> -
> -#include <xen/lib.h>
> -
> -static inline void udelay(unsigned long usecs)
> -{
> -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> -}
> -
> -#endif /* __ASM_PPC_DELAY_H__ */
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index 4c276b0e39..a96e45626d 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -337,3 +337,10 @@ int __init parse_arch_dom0_param(const char *s,
> const char *e)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> =C2=A0}
> +
> +/* delay.c */
> +
> +void udelay(unsigned long usecs)
> +{
> +=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> +}
> diff --git a/xen/arch/x86/cpu/microcode/core.c
> b/xen/arch/x86/cpu/microcode/core.c
> index 65ebeb50de..22d5e04552 100644
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
> index 9150226271..8fd3b8f99f 100644
> --- a/xen/include/xen/delay.h
> +++ b/xen/include/xen/delay.h
> @@ -3,7 +3,7 @@
> =C2=A0
> =C2=A0/* Copyright (C) 1993 Linus Torvalds */
> =C2=A0
> -#include <asm/delay.h>
> +void udelay(unsigned long usecs);
> =C2=A0
> =C2=A0static inline void mdelay(unsigned long msec)
> =C2=A0{


