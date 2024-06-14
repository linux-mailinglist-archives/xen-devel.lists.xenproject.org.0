Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F1B908DF4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 16:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740762.1147873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI8L8-0007hF-Mj; Fri, 14 Jun 2024 14:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740762.1147873; Fri, 14 Jun 2024 14:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI8L8-0007f3-It; Fri, 14 Jun 2024 14:55:42 +0000
Received: by outflank-mailman (input) for mailman id 740762;
 Fri, 14 Jun 2024 14:55:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VLs9=NQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sI8L7-0007ev-5Y
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 14:55:41 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29edae3b-2a5e-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 16:55:39 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-57c7681ccf3so2586088a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2024 07:55:39 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f6be36a5fsm36308966b.58.2024.06.14.07.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 07:55:38 -0700 (PDT)
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
X-Inumbo-ID: 29edae3b-2a5e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718376938; x=1718981738; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1FtZ8fNt1ygCbnKlIwd80G2l/ldpa2huJAp4utij7+8=;
        b=d5oXYlVGZEq0qI3AjByKHVyD1cRUWKm4pEToJdBpEc3u5A7Y4yhpPKhF9YftKdF+Nt
         IrAASPriDfRTB1eJWJxM32MbDl7VtOvfrCuQHKuNtJDjmqDdIUqfSEuhHi63Fg0Lz/1z
         rUw2apFSVv21e0NQGHAy8gHQMZrMbL7ia1ocjJgKPjeSNBZ69ggrFntHnG0mem6G4b5F
         7TRNKtmK0V6vjOJ4Q+OyMSW0C/98zgN8Aw2Ht1n3nPgwY6sL7c1L6d9tgoaLQ8EAox0y
         pqBwuism1iSAgeCYt/8sAo5q3kLSlzzPi9E/pTQjXBFViNh1e4uMO0yr48Jr/3y6VuS+
         ya+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718376938; x=1718981738;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1FtZ8fNt1ygCbnKlIwd80G2l/ldpa2huJAp4utij7+8=;
        b=Zx7LaagrWvu+DyA4LVUE0VckSEaMxpBZPiQ5Wk8xpP2ex6M2crR7BSY0UHMD+AE0nx
         L3IN1kI2KbL02Q2B51kmAmocmDyJmkEYYuxjNgXm+hUrzHTZfF5oQez7zMGKa7BB7DXb
         YMz4UGv03jrVkuJhwGTzw5hFYzR/nxKUzSLIf+pzUgUSYckBkikAu1o3MY/+eYLvJIrU
         P2ja+rrsLE79HYYvdkiAOLA9UWMrPCEwTn+saTXc/+Ce0ZIxzyYoEqUdSOwkP+BGSOr9
         dqvA/wjg5UJhKGpe01PBhRp5IsC0UQheBH/Jd1k05bm63h4Y838Avk5kbC56b7bkFHHm
         vLCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX89T89q50bpNHa0SCRXnp6+OVFAFrRcoZBnDCoa9DntJ6wvX56c9eQQ6iXmkbX2gF04B7jnFx7+mcELziyxe4HMKqsB1LrwGn9Bodye/U=
X-Gm-Message-State: AOJu0Yzf0/3IWph3WMM5IdVxXF6JHWPL2T3tv5bZhl9NgsJGXLDAI7DE
	O44oQ5ctmrxtlf8yOmuttsgk7KB4baLZlEjNG9ilo1xJIQYKr8CE
X-Google-Smtp-Source: AGHT+IHrXgV+Ny+mHqU/1+NEuHskkxrW79qH9AsV24behMi7w64iv9vCxH7muxMy+EpSSsA/9IBRiA==
X-Received: by 2002:a17:906:22d7:b0:a6f:4d6b:c779 with SMTP id a640c23a62f3a-a6f60dc8007mr192538466b.52.1718376938264;
        Fri, 14 Jun 2024 07:55:38 -0700 (PDT)
Message-ID: <3bbb1acf921f7c600148e4d18ea713d7826aa8c1.camel@gmail.com>
Subject: Re: [PATCH for-4.19] xen/arch: Centralise __read_mostly and
 __ro_after_init
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Date: Fri, 14 Jun 2024 16:55:37 +0200
In-Reply-To: <20240614124950.1557058-1-andrew.cooper3@citrix.com>
References: <20240614124950.1557058-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Fri, 2024-06-14 at 13:49 +0100, Andrew Cooper wrote:
> These being in cache.h is inherited from Linux, but is an
> inappropriate
> location to live.
>=20
> __read_mostly is an optimisation related to data placement in order
> to avoid
> having shared data in cachelines that are likely to be written to,
> but it
> really is just a section of the linked image separating data by usage
> patterns; it has nothing to do with cache sizes or flushing logic.
>=20
> Worse, __ro_after_init was only in xen/cache.h because __read_mostly
> was in
> arch/cache.h, and has literally nothing whatsoever to do with caches.
>=20
> Move the definitions into xen/sections.h, which in paritcular means
> that
> RISC-V doesn't need to repeat the problematic pattern.=C2=A0 Take the
> opportunity
> to provide a short descriptions of what these are used for.
>=20
> For now, leave TODO comments next to the other identical
> definitions.=C2=A0 It
> turns out that unpicking cache.h is more complicated than it appears
> because a
> number of files use it for transitive dependencies.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>=20
> For 4.19.=C2=A0 This is to help the RISC-V "full build of Xen" effort
> without
> introducing a pattern that's going to require extra effort to undo
> after the
> fact.
> ---
> =C2=A0xen/arch/arm/include/asm/cache.h |=C2=A0 1 +
> =C2=A0xen/arch/ppc/include/asm/cache.h |=C2=A0 1 +
> =C2=A0xen/arch/x86/include/asm/cache.h |=C2=A0 1 +
> =C2=A0xen/include/xen/cache.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0xen/include/xen/sections.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 21=
 +++++++++++++++++++++
> =C2=A05 files changed, 25 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/cache.h
> b/xen/arch/arm/include/asm/cache.h
> index 240b6ae0eaa3..029b2896fb3e 100644
> --- a/xen/arch/arm/include/asm/cache.h
> +++ b/xen/arch/arm/include/asm/cache.h
> @@ -6,6 +6,7 @@
> =C2=A0#define L1_CACHE_SHIFT=C2=A0 (CONFIG_ARM_L1_CACHE_SHIFT)
> =C2=A0#define L1_CACHE_BYTES=C2=A0 (1 << L1_CACHE_SHIFT)
> =C2=A0
> +/* TODO: Phase out the use of this via cache.h */
> =C2=A0#define __read_mostly __section(".data.read_mostly")
> =C2=A0
> =C2=A0#endif
> diff --git a/xen/arch/ppc/include/asm/cache.h
> b/xen/arch/ppc/include/asm/cache.h
> index 0d7323d7892f..13c0bf3242c8 100644
> --- a/xen/arch/ppc/include/asm/cache.h
> +++ b/xen/arch/ppc/include/asm/cache.h
> @@ -3,6 +3,7 @@
> =C2=A0#ifndef _ASM_PPC_CACHE_H
> =C2=A0#define _ASM_PPC_CACHE_H
> =C2=A0
> +/* TODO: Phase out the use of this via cache.h */
> =C2=A0#define __read_mostly __section(".data.read_mostly")
> =C2=A0
> =C2=A0#endif /* _ASM_PPC_CACHE_H */
> diff --git a/xen/arch/x86/include/asm/cache.h
> b/xen/arch/x86/include/asm/cache.h
> index e4770efb22b9..956c05493e23 100644
> --- a/xen/arch/x86/include/asm/cache.h
> +++ b/xen/arch/x86/include/asm/cache.h
> @@ -9,6 +9,7 @@
> =C2=A0#define L1_CACHE_SHIFT	(CONFIG_X86_L1_CACHE_SHIFT)
> =C2=A0#define L1_CACHE_BYTES	(1 << L1_CACHE_SHIFT)
> =C2=A0
> +/* TODO: Phase out the use of this via cache.h */
> =C2=A0#define __read_mostly __section(".data.read_mostly")
> =C2=A0
> =C2=A0#ifndef __ASSEMBLY__
> diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
> index f52a0aedf768..55456823c543 100644
> --- a/xen/include/xen/cache.h
> +++ b/xen/include/xen/cache.h
> @@ -15,6 +15,7 @@
> =C2=A0#define __cacheline_aligned
> __attribute__((__aligned__(SMP_CACHE_BYTES)))
> =C2=A0#endif
> =C2=A0
> +/* TODO: Phase out the use of this via cache.h */
> =C2=A0#define __ro_after_init __section(".data.ro_after_init")
> =C2=A0
> =C2=A0#endif /* __LINUX_CACHE_H */
> diff --git a/xen/include/xen/sections.h b/xen/include/xen/sections.h
> index b6cb5604c285..6d4db2b38f0f 100644
> --- a/xen/include/xen/sections.h
> +++ b/xen/include/xen/sections.h
> @@ -3,9 +3,30 @@
> =C2=A0#ifndef __XEN_SECTIONS_H__
> =C2=A0#define __XEN_SECTIONS_H__
> =C2=A0
> +#include <xen/compiler.h>
> +
> =C2=A0/* SAF-0-safe */
> =C2=A0extern char __init_begin[], __init_end[];
> =C2=A0
> +/*
> + * Some data is expected to be written very rarely (if at all).
> + *
> + * For performance reasons is it helpful to group such data in the
> build, to
> + * avoid the linker placing it adjacent to often-written data.
> + */
> +#define __read_mostly __section(".data.read_mostly")
> +
> +/*
> + * Some data should be chosen during boot and be immutable
> thereafter.
> + *
> + * Variables annotated with __ro_after_init will become read-only
> after boot
> + * and suffer a runtime access fault if modified.
> + *
> + * For architectures/platforms which haven't implemented support,
> these
> + * variables will be treated as regular mutable data.
> + */
> +#define __ro_after_init __section(".data.ro_after_init")
> +
> =C2=A0#endif /* !__XEN_SECTIONS_H__ */
> =C2=A0/*
> =C2=A0 * Local variables:
>=20
> base-commit: 8b4243a9b560c89bb259db5a27832c253d4bebc7


