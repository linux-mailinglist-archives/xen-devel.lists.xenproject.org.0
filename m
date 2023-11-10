Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEF87E7AD8
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:30:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630023.982666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nq8-0002zU-OW; Fri, 10 Nov 2023 09:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630023.982666; Fri, 10 Nov 2023 09:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nq8-0002wQ-Ks; Fri, 10 Nov 2023 09:30:12 +0000
Received: by outflank-mailman (input) for mailman id 630023;
 Fri, 10 Nov 2023 09:30:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1Nq7-0001uY-9j
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:30:11 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be664b94-7fab-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 10:30:10 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9c3aec5f326so603559166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 01:30:10 -0800 (PST)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 jg4-20020a170907970400b009e6b055fa88sm70072ejc.148.2023.11.10.01.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 01:30:09 -0800 (PST)
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
X-Inumbo-ID: be664b94-7fab-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699608610; x=1700213410; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EcKY48LyU5VlZDtLPrfiLgbRiJe5nJipcY3d0hW3yuQ=;
        b=mbunApu3f0ZZPNL3u3bLEOQPhv2cDdzUf1hssxMTljOU3auX/UBsmRsOwZRrLlSJND
         wYxq9HAHzLQUwob3hamIxs2VF1SspiwRexpqSxa7cs6HZdNPKIzGaD9ZwipdHbFDRYfI
         ChDlGLfFbTyZOoPwHJS6ofsTCvMu13oFPE7Ih3A9NC+25Ti49o0ouNI1J8ccyjEcSSNp
         XpbQnl0t47MPS/qLgzQe1pjnTI5PxCuWDKZaqkmO4dpTQAg5RLVJp5+qwkKOiwxFDLLy
         3R/aUXX2NIrmyelGwCr9TX7uC2g7gByXCIby19SBwEywx8MwzWTXizp7/LMnD8NXlww1
         TQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699608610; x=1700213410;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EcKY48LyU5VlZDtLPrfiLgbRiJe5nJipcY3d0hW3yuQ=;
        b=maDqZCwUVs6tnHOLNYN/ppBPYNs3oNZcQ9Zc6UcyczX3aCK7stWhVhAHO8m8JTUk6G
         hGKVhhOMv3aLHmKE/ebloBR0+izGrM5U9xT+6LL1iCkcVSGD1k/Kl4cu71YYddb+7hRS
         jfzyou0n7dBdMCCQvzkwOMqvxnvMx8KYbnoicKUpCn8LFu0o32+KXAc4HqOVAZJPX3Ee
         DiFCryI/Faav9lCSSL+QahsV3JwldDhD/OggQWYnkI45GI73UIkotR27luyvocCnM0tl
         h1Ayy2rBVkhxPnQSlnLqEr4sIUp1mAuW6nxCgEH1lETqYgBYpK7CpLiGmTAcK46DHhw+
         DUPw==
X-Gm-Message-State: AOJu0YyDU1v3ZKHQCDGta0VAjwXsgfajNKx4jQcafrHySJPsp0AbhUvB
	xh00BxQSN1oFRizZnF3ojNaWIs5c/Ag=
X-Google-Smtp-Source: AGHT+IG+iKdxNyAwaRP3AS5MkRE7Tw1RsdVdv3cnySOsuTpES9fnvqihFXobro82BFG7VGVtfjsKPA==
X-Received: by 2002:a17:906:4b47:b0:9e1:f0d0:327e with SMTP id j7-20020a1709064b4700b009e1f0d0327emr1614276ejv.6.1699608609654;
        Fri, 10 Nov 2023 01:30:09 -0800 (PST)
Message-ID: <99c3a51292fcc85da0759a5abe84e97c6c429358.camel@gmail.com>
Subject: Re: [PATCH v2] xen: remove <asm/delay.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,  George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Fri, 10 Nov 2023 11:30:08 +0200
In-Reply-To: <3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
References: 
	<3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hi all,

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

I forgot to update xen/arch/{x86,arm,ppc}/include/asm/Makefile:
    generic-y +=3D delay.h

Should I send a new patch version or it can be updated durig merge?

~ Oleksii

