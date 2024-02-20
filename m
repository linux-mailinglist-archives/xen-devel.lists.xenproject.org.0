Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B987785BFA0
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 16:14:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683565.1063135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcRow-0007QD-0t; Tue, 20 Feb 2024 15:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683565.1063135; Tue, 20 Feb 2024 15:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcRov-0007O7-UN; Tue, 20 Feb 2024 15:14:09 +0000
Received: by outflank-mailman (input) for mailman id 683565;
 Tue, 20 Feb 2024 15:14:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvC9=J5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rcRou-0007O1-D8
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 15:14:08 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0ecc3a7-d002-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 16:14:07 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a30f7c9574eso708769166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 07:14:07 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 jw2-20020a170906e94200b00a3f0d98c125sm474554ejb.155.2024.02.20.07.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 07:14:05 -0800 (PST)
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
X-Inumbo-ID: b0ecc3a7-d002-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708442046; x=1709046846; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=H2TPE3JBhRfKrzD8Uz0RMfbxMcBRoHd2NveFlZmWBXc=;
        b=eJC8vgpj6reCDaRquS3ydXvi9uL2Ftg7AnINGZLTiSRNnc4QhrTxXAF7sOFGolCh8e
         sxyl23y73LkIh/oP93jQBVnHGVZFRyVa/qjKGr9CkQD6P8mqw59bOhSbvwellsJJ4tyz
         TEitb0RZYH3bIHKzgrykR+2SpLVYl7RDxvuDqMsmMI6rpqJPTVxk5AVBL3CUeUuE4jGD
         qXITLq5hwMdSGDOgf1caMTqnooQajDmaS4NATEWPTMVG/scpMZcsgDr0NltPLrydvypN
         XhIWxj6VVqKvWakROmz59oYUBmk6EoZfDyNtnQNr7xrRFPNzYBinQoc9nWJb+9Immbqb
         rpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708442046; x=1709046846;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2TPE3JBhRfKrzD8Uz0RMfbxMcBRoHd2NveFlZmWBXc=;
        b=K5pBJAbpNk8Sereuzt4pMVfyKo7xG6J1lmsCTRlbai1VxuXyQIBm2OmjSZmVtn3Fu6
         bLZ0TSesL526CtatOQn0CXg9hO+Rr7KY7saxi4ahTHsnpGBl8OgpDkoBqHcLA+wXOdgH
         WnZ0g8wCo4QLWfe+uJCK2CpqFt+Y9BQX579FPrhxPGSQ/tH0Yf7AMImOfZIsVeTUQizh
         /lr0AFPi1YepJ1qq5WyrPy4m3Tsp9IE3Uz0tCssCWZ9JG6K9O+ufKGrSkqCTikQNMEXB
         CD6skeWLhdZyZVJKCan5pwU8N+NiSV+ScV60D2YMGJpELKUMiuW0dSvVadCAyFLxJUO7
         F81g==
X-Gm-Message-State: AOJu0YzU6aMRuLUZYS2llwA76rZYsq4aA4npFiaA0eEyhD1gtWo2RQ2s
	ozvPv25DkZpuO+OxCgIwyx7/X1cRBNFRDSY+GA9rk5gSsa1Lag1XGNTzvLMW
X-Google-Smtp-Source: AGHT+IG4XoHtOWZLR2fMnnmr2h2K6DdbmI51sfL+KqY7WYPdlItpKQoS1t41/0L+5iZGKJ8NrPMVEw==
X-Received: by 2002:a17:906:4544:b0:a3e:71fb:348e with SMTP id s4-20020a170906454400b00a3e71fb348emr4579361ejq.63.1708442045914;
        Tue, 20 Feb 2024 07:14:05 -0800 (PST)
Message-ID: <172fd36027d4b95636d1ede472bec2792298ea97.camel@gmail.com>
Subject: Re: [PATCH v9 2/7] xen/asm-generic: introduce stub header monitor.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org, Shawn Anastasio
	 <sanastasio@raptorengineering.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,  Michal Orzel
 <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <jgrall@amazon.com>
Date: Tue, 20 Feb 2024 16:14:04 +0100
In-Reply-To: <296530c13b8400f6872d4afc8cc14e2fcfc7a2d5.1708086092.git.oleksii.kurochko@gmail.com>
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
	 <296530c13b8400f6872d4afc8cc14e2fcfc7a2d5.1708086092.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Oleksii

On Fri, 2024-02-16 at 13:39 +0100, Oleksii Kurochko wrote:
> The header is shared between several archs so it is
> moved to asm-generic.
>=20
> Switch partly Arm and PPC to asm-generic/monitor.h and only
> arch_monitor_get_capabilities() left in arch-specific/monitor.h.
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
> Changes in V9:
> =C2=A0- Add Acked-by: Julien Grall <jgrall@amazon.com> for Arm part
> ---
> Changes in V8:
> =C2=A0- Add Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
> Changes in V7:
> =C2=A0- Drop definition of arch_monitor_domctl_event for PPC.
> =C2=A0- define arch_monitor_domctl_event in asm-generic/monitor.h.
> =C2=A0- add "define HAS_ARCH_MONITOR_DOMCTL_EVENT" in arm/.../monitor.h a=
s
> it has arch specific implementation.
> ---
> Changes in V6:
> =C2=A0- Rebase only.
> ---
> Changes in V5:
> =C2=A0 - Switched partly Arm and PPC to asm-generic monitor.h only
> =C2=A0=C2=A0=C2=A0 arch_monitor_get_capabilities() left in arch-specific/=
monitor.h.
> =C2=A0 - Updated the commit message.
> ---
> Changes in V4:
> =C2=A0- Removed the double blank line.
> =C2=A0- Added Acked-by: Jan Beulich <jbeulich@suse.com>.
> =C2=A0- Update the commit message
> ---
> Changes in V3:
> =C2=A0- Use forward-declaration of struct domain instead of " #include
> <xen/sched.h> ".
> =C2=A0- Add ' include <xen/errno.h> '
> =C2=A0- Drop PPC's monitor.h.
> ---
> Changes in V2:
> 	- remove inclusion of "+#include <public/domctl.h>"
> 	- add "struct xen_domctl_monitor_op;"
> 	- remove one of SPDX tags.
> ---
> =C2=A0xen/arch/arm/include/asm/monitor.h | 25 +-----------
> =C2=A0xen/arch/ppc/include/asm/monitor.h | 28 +------------
> =C2=A0xen/arch/ppc/stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ----
> =C2=A0xen/include/asm-generic/monitor.h=C2=A0 | 64
> ++++++++++++++++++++++++++++++
> =C2=A04 files changed, 67 insertions(+), 58 deletions(-)
> =C2=A0create mode 100644 xen/include/asm-generic/monitor.h
>=20
> diff --git a/xen/arch/arm/include/asm/monitor.h
> b/xen/arch/arm/include/asm/monitor.h
> index 7567be66bd..77a3c1a36c 100644
> --- a/xen/arch/arm/include/asm/monitor.h
> +++ b/xen/arch/arm/include/asm/monitor.h
> @@ -25,34 +25,13 @@
> =C2=A0#include <xen/sched.h>
> =C2=A0#include <public/domctl.h>
> =C2=A0
> -static inline
> -void arch_monitor_allow_userspace(struct domain *d, bool
> allow_userspace)
> -{
> -}
> +#define HAS_ARCH_MONITOR_DOMCTL_EVENT
> =C2=A0
> -static inline
> -int arch_monitor_domctl_op(struct domain *d, struct
> xen_domctl_monitor_op *mop)
> -{
> -=C2=A0=C2=A0=C2=A0 /* No arch-specific monitor ops on ARM. */
> -=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> -}
> +#include <asm-generic/monitor.h>
> =C2=A0
> =C2=A0int arch_monitor_domctl_event(struct domain *d,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_domctl_monitor_op *mop);
> =C2=A0
> -static inline
> -int arch_monitor_init_domain(struct domain *d)
> -{
> -=C2=A0=C2=A0=C2=A0 /* No arch-specific domain initialization on ARM. */
> -=C2=A0=C2=A0=C2=A0 return 0;
> -}
> -
> -static inline
> -void arch_monitor_cleanup_domain(struct domain *d)
> -{
> -=C2=A0=C2=A0=C2=A0 /* No arch-specific domain cleanup on ARM. */
> -}
> -
> =C2=A0static inline uint32_t arch_monitor_get_capabilities(struct domain
> *d)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 uint32_t capabilities =3D 0;
> diff --git a/xen/arch/ppc/include/asm/monitor.h
> b/xen/arch/ppc/include/asm/monitor.h
> index e5b0282bf1..89000dacc6 100644
> --- a/xen/arch/ppc/include/asm/monitor.h
> +++ b/xen/arch/ppc/include/asm/monitor.h
> @@ -6,33 +6,7 @@
> =C2=A0#include <public/domctl.h>
> =C2=A0#include <xen/errno.h>
> =C2=A0
> -static inline
> -void arch_monitor_allow_userspace(struct domain *d, bool
> allow_userspace)
> -{
> -}
> -
> -static inline
> -int arch_monitor_domctl_op(struct domain *d, struct
> xen_domctl_monitor_op *mop)
> -{
> -=C2=A0=C2=A0=C2=A0 /* No arch-specific monitor ops on PPC. */
> -=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> -}
> -
> -int arch_monitor_domctl_event(struct domain *d,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_domctl_monitor_op *mop);
> -
> -static inline
> -int arch_monitor_init_domain(struct domain *d)
> -{
> -=C2=A0=C2=A0=C2=A0 /* No arch-specific domain initialization on PPC. */
> -=C2=A0=C2=A0=C2=A0 return 0;
> -}
> -
> -static inline
> -void arch_monitor_cleanup_domain(struct domain *d)
> -{
> -=C2=A0=C2=A0=C2=A0 /* No arch-specific domain cleanup on PPC. */
> -}
> +#include <asm-generic/monitor.h>
> =C2=A0
> =C2=A0static inline uint32_t arch_monitor_get_capabilities(struct domain
> *d)
> =C2=A0{
> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
> index a96e45626d..da193839bd 100644
> --- a/xen/arch/ppc/stubs.c
> +++ b/xen/arch/ppc/stubs.c
> @@ -95,14 +95,6 @@ void arch_get_domain_info(const struct domain *d,
> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> =C2=A0}
> =C2=A0
> -/* monitor.c */
> -
> -int arch_monitor_domctl_event(struct domain *d,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_domctl_monitor_op *mop)
> -{
> -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> -}
> -
> =C2=A0/* smp.c */
> =C2=A0
> =C2=A0void arch_flush_tlb_mask(const cpumask_t *mask)
> diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-
> generic/monitor.h
> new file mode 100644
> index 0000000000..1ade289099
> --- /dev/null
> +++ b/xen/include/asm-generic/monitor.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * include/asm-generic/monitor.h
> + *
> + * Arch-specific monitor_op domctl handler.
> + *
> + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> + * Copyright (c) 2016, Bitdefender S.R.L.
> + *
> + */
> +
> +#ifndef __ASM_GENERIC_MONITOR_H__
> +#define __ASM_GENERIC_MONITOR_H__
> +
> +#include <xen/errno.h>
> +#include <xen/lib.h>
> +
> +struct domain;
> +struct xen_domctl_monitor_op;
> +
> +static inline
> +void arch_monitor_allow_userspace(struct domain *d, bool
> allow_userspace)
> +{
> +}
> +
> +static inline
> +int arch_monitor_domctl_op(struct domain *d, struct
> xen_domctl_monitor_op *mop)
> +{
> +=C2=A0=C2=A0=C2=A0 /* No arch-specific monitor ops on GENERIC. */
> +=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> +}
> +
> +#ifndef HAS_ARCH_MONITOR_DOMCTL_EVENT
> +static inline
> +int arch_monitor_domctl_event(struct domain *d,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_domctl_monitor_op *mop)
> +{
> +=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> +}
> +#endif
> +
> +static inline
> +int arch_monitor_init_domain(struct domain *d)
> +{
> +=C2=A0=C2=A0=C2=A0 /* No arch-specific domain initialization on GENERIC.=
 */
> +=C2=A0=C2=A0=C2=A0 return 0;
> +}
> +
> +static inline
> +void arch_monitor_cleanup_domain(struct domain *d)
> +{
> +=C2=A0=C2=A0=C2=A0 /* No arch-specific domain cleanup on GENERIC. */
> +}
> +
> +#endif /* __ASM_GENERIC_MONITOR_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: BSD
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */


