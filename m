Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8548B81A2EB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 16:44:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658152.1027217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFykT-0006pF-4T; Wed, 20 Dec 2023 15:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658152.1027217; Wed, 20 Dec 2023 15:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFykT-0006nB-1Y; Wed, 20 Dec 2023 15:44:41 +0000
Received: by outflank-mailman (input) for mailman id 658152;
 Wed, 20 Dec 2023 15:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RD2L=H7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFykR-0006n5-T5
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 15:44:39 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af179140-9f4e-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 16:44:38 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cc4029dc6eso70413671fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 07:44:38 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a2e8041000000b002cc93ee9fe9sm178087ljg.131.2023.12.20.07.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 07:44:37 -0800 (PST)
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
X-Inumbo-ID: af179140-9f4e-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703087078; x=1703691878; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8ka3CgaAE94CZaAK4I7kg9v7xu90rqBuG9rtVH2ddnE=;
        b=KhSkvUbhgXZmOP9vWRY9WXVMydtND50U2IJc75PifyeK0lwk50jzNjx9f5MeVRBvPv
         8GuMhGR81lWqvn6AflcFmoEEl55uI8Gs7WjYxW0rhWv+eFxSC4iPAqrfTjSc3Gp6Only
         qsDt9+IFO0BYnJIcU94BGAQHJk5ZtLgWWEdGoWHzbpOk/mfvefcC/6WmXEjMCMwxXtWf
         WSZre0TFPcpqrScVZ1ylds/lIeW87JWHUlwLMFzkyfb/WZq9KISR/foA8ipLfvcukPS3
         Zq5jJWc8Z0Z+a6xfcXFhYnWI4Pb0IyIsBSosB9fInczsTmrHnAFrJshZaFf8lTPXwIlZ
         nR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087078; x=1703691878;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ka3CgaAE94CZaAK4I7kg9v7xu90rqBuG9rtVH2ddnE=;
        b=sDChTT3YHfl/YvOt2r4nZAwKn05ZqIGL3/e9z6DkbDME0c9HMY0RFNKPaNeB1AD+6Y
         51/rWzQ9fdDyYmz5V78CT59udqFtTGD/dcbjPkU4q4nB3+zeLoiRaAA3EAU6L8Z7pfiF
         6xmcSJUnKoOgkSvRb85OuhI7JGDHeQso7YTx9qygGlcUqC7Gl6qpKR/zrbb6jJQ5VI26
         bBvjcBd0U3J9xnVnLWSG6V4l5D6Nd7wgDtw/cheTyVUghbD94oCFbq4uk2wKd6OogpST
         io8skJUXj2L4e9jgRWTMlOXKUGcn7y3uMU16jqI1iG90sWW681fGK1PPaUTGUFMoU94V
         lZug==
X-Gm-Message-State: AOJu0YzBmjKKNKz3f8lgX0QnuzJevRwLPZC911CtNHQz25xtbWr/I63W
	9tW1u4saMMZcn2h7SLVHdjH1zgTHBx9qOQ==
X-Google-Smtp-Source: AGHT+IFfzzIB6OrrlaX27SLnP9ckXVSgeO0Z949Lwf3gvCFqtYE7ufRKzc83u+h+BHjab12BlTDSMw==
X-Received: by 2002:a2e:a497:0:b0:2cc:90f6:fe24 with SMTP id h23-20020a2ea497000000b002cc90f6fe24mr630526lji.91.1703087078000;
        Wed, 20 Dec 2023 07:44:38 -0800 (PST)
Message-ID: <e9603d682e28143a0ce7d67b86e313ab6d3ea00a.camel@gmail.com>
Subject: Re: [PATCH v6 4/9] xen/asm-generic: introduce stub header monitor.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Alexandru Isaila
 <aisaila@bitdefender.com>, Petre Pircalabu <ppircalabu@bitdefender.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,  Michal Orzel
 <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>, Jan Beulich
 <jbeulich@suse.com>
Date: Wed, 20 Dec 2023 17:44:36 +0200
In-Reply-To: <49c8e0f5997063ed65c3b135c0003ca9570c0bc6.1703072575.git.oleksii.kurochko@gmail.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
	 <49c8e0f5997063ed65c3b135c0003ca9570c0bc6.1703072575.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

It is necessary to remove unnecessary inclusions of headers in
arch/*/asm/monitor.h. This was overlooked.

Sorry for the inconvenience.

~ Oleksii

On Wed, 2023-12-20 at 16:08 +0200, Oleksii Kurochko wrote:
> The header is shared between several archs so it is
> moved to asm-generic.
>=20
> Switch partly Arm and PPC to asm-generic/monitor.h and only
> arch_monitor_get_capabilities() left in arch-specific/monitor.h.
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
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
> =C2=A0xen/arch/arm/include/asm/monitor.h | 28 +--------------
> =C2=A0xen/arch/ppc/include/asm/monitor.h | 28 +--------------
> =C2=A0xen/include/asm-generic/monitor.h=C2=A0 | 57
> ++++++++++++++++++++++++++++++
> =C2=A03 files changed, 59 insertions(+), 54 deletions(-)
> =C2=A0create mode 100644 xen/include/asm-generic/monitor.h
>=20
> diff --git a/xen/arch/arm/include/asm/monitor.h
> b/xen/arch/arm/include/asm/monitor.h
> index 7567be66bd..045217c310 100644
> --- a/xen/arch/arm/include/asm/monitor.h
> +++ b/xen/arch/arm/include/asm/monitor.h
> @@ -25,33 +25,7 @@
> =C2=A0#include <xen/sched.h>
> =C2=A0#include <public/domctl.h>
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
> -=C2=A0=C2=A0=C2=A0 /* No arch-specific monitor ops on ARM. */
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
> -=C2=A0=C2=A0=C2=A0 /* No arch-specific domain initialization on ARM. */
> -=C2=A0=C2=A0=C2=A0 return 0;
> -}
> -
> -static inline
> -void arch_monitor_cleanup_domain(struct domain *d)
> -{
> -=C2=A0=C2=A0=C2=A0 /* No arch-specific domain cleanup on ARM. */
> -}
> +#include <asm-generic/monitor.h>
> =C2=A0
> =C2=A0static inline uint32_t arch_monitor_get_capabilities(struct domain
> *d)
> =C2=A0{
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
> diff --git a/xen/include/asm-generic/monitor.h b/xen/include/asm-
> generic/monitor.h
> new file mode 100644
> index 0000000000..74e4870cd7
> --- /dev/null
> +++ b/xen/include/asm-generic/monitor.h
> @@ -0,0 +1,57 @@
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
> +int arch_monitor_domctl_event(struct domain *d,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct xen_domctl_monitor_op *mop);
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


