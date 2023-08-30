Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9314E78D133
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 02:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592646.925427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb9GT-0000SR-8N; Wed, 30 Aug 2023 00:40:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592646.925427; Wed, 30 Aug 2023 00:40:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb9GT-0000Qj-5p; Wed, 30 Aug 2023 00:40:57 +0000
Received: by outflank-mailman (input) for mailman id 592646;
 Wed, 30 Aug 2023 00:40:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gRJs=EP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qb9GQ-0000PR-RV
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 00:40:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd51800c-46cd-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 02:40:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51DC96214E;
 Wed, 30 Aug 2023 00:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F181C433C8;
 Wed, 30 Aug 2023 00:40:46 +0000 (UTC)
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
X-Inumbo-ID: dd51800c-46cd-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693356047;
	bh=1nqytWCy+lKYw+agQwwsROUPxH9bqx1StWaVdikHU3A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KlxKcFQeI1xYaz8B3TIT0+oePF2CHq5UZtrwEIFbPP7kF0qF8SLj+W9bQiwASgjLp
	 mdjydqUvqLgHPCA1mMxgWUMnj8T2fa07qkveZLazc02xK3o0XYpA77LMnPubp/KqDZ
	 6MZ2lQyx1bfn2f6Vzzs98XAhmlsKVTA3VfX7aNbCtmOrN3Edd4CgMA44tCI/LAYxly
	 I94Gjhg2JJ+H+/y6eD/NBOgEHnwPQVvEizcEtdES5ccz6t3kO+MubelWr+mxj4eKbj
	 +lANnivoS6ODk0yKaJvkomp8RCR1E8f2yFRAPC3I1HDqmaIMj/jLiNUn686rwbRApB
	 BsSZbkjFm8DFw==
Date: Tue, 29 Aug 2023 17:40:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Tamas K Lengyel <tamas.k.lengyel@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 2/2] xen: move arm/include/asm/vm_event.h to stubs
In-Reply-To: <31fb5b635fc5a02fd7103ecd64d2b66443c6e038.1693319118.git.oleksii.kurochko@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2308291737570.6458@ubuntu-linux-20-04-desktop>
References: <cover.1693319118.git.oleksii.kurochko@gmail.com> <31fb5b635fc5a02fd7103ecd64d2b66443c6e038.1693319118.git.oleksii.kurochko@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 29 Aug 2023, Oleksii Kurochko wrote:
> asm/vm_event.h is common for ARM and RISC-V so it will be moved to
> stubs dir.
> 
> Original asm/vm_event.h from ARM was updated:
>  * use SPDX-License-Identifier.
>  * update comment messages of stubs.
>  * update #ifdef.
>  * change public/domctl.h to public/vm_event.h.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  - change public/domctl.h to public/vm_event.h.
>  - update commit message of [PATCH v2 2/2] xen: move arm/include/asm/vm_event.h to stubs
> ---
>  xen/arch/arm/include/asm/vm_event.h | 66 -----------------------------
>  xen/include/stubs/asm/vm_event.h    | 55 ++++++++++++++++++++++++
>  2 files changed, 55 insertions(+), 66 deletions(-)
>  delete mode 100644 xen/arch/arm/include/asm/vm_event.h
>  create mode 100644 xen/include/stubs/asm/vm_event.h
> 
> diff --git a/xen/arch/arm/include/asm/vm_event.h b/xen/arch/arm/include/asm/vm_event.h
> deleted file mode 100644
> index 4d861373b3..0000000000
> --- a/xen/arch/arm/include/asm/vm_event.h
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -/*
> - * vm_event.h: architecture specific vm_event handling routines
> - *
> - * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2, as published by the Free Software Foundation.
> - *
> - * This program is distributed in the hope it will be useful, but WITHOUT
> - * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> - * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> - * more details.
> - *
> - * You should have received a copy of the GNU General Public License along with
> - * this program; If not, see <http://www.gnu.org/licenses/>.
> - */
> -
> -#ifndef __ASM_ARM_VM_EVENT_H__
> -#define __ASM_ARM_VM_EVENT_H__
> -
> -#include <xen/sched.h>
> -#include <public/domctl.h>
> -
> -static inline int vm_event_init_domain(struct domain *d)
> -{
> -    /* Nothing to do. */
> -    return 0;
> -}
> -
> -static inline void vm_event_cleanup_domain(struct domain *d)
> -{
> -    memset(&d->monitor, 0, sizeof(d->monitor));
> -}
> -
> -static inline void vm_event_toggle_singlestep(struct domain *d, struct vcpu *v,
> -                                              vm_event_response_t *rsp)
> -{
> -    /* Not supported on ARM. */
> -}
> -
> -static inline
> -void vm_event_register_write_resume(struct vcpu *v, vm_event_response_t *rsp)
> -{
> -    /* Not supported on ARM. */
> -}
> -
> -static inline
> -void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
> -{
> -    /* Not supported on ARM. */
> -}
> -
> -static inline
> -void vm_event_sync_event(struct vcpu *v, bool value)
> -{
> -    /* Not supported on ARM. */
> -}
> -
> -static inline
> -void vm_event_reset_vmtrace(struct vcpu *v)
> -{
> -    /* Not supported on ARM. */
> -}
> -
> -#endif /* __ASM_ARM_VM_EVENT_H__ */
> diff --git a/xen/include/stubs/asm/vm_event.h b/xen/include/stubs/asm/vm_event.h
> new file mode 100644
> index 0000000000..cc89ffe5fb
> --- /dev/null
> +++ b/xen/include/stubs/asm/vm_event.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier:  GPL-2.0 */

GPL-2.0 is deprecated, please use GPL-2.0-only

Aside from that:

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> +/*
> + * vm_event.h: stubs for architecture specific vm_event handling routines
> + *
> + * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
> + */
> +
> +#ifndef __ASM_STUB_VM_EVENT_H__
> +#define __ASM_STUB_VM_EVENT_H__
> +
> +#include <xen/sched.h>
> +#include <public/vm_event.h>
> +
> +static inline int vm_event_init_domain(struct domain *d)
> +{
> +    /* Nothing to do. */
> +    return 0;
> +}
> +
> +static inline void vm_event_cleanup_domain(struct domain *d)
> +{
> +    memset(&d->monitor, 0, sizeof(d->monitor));
> +}
> +
> +static inline void vm_event_toggle_singlestep(struct domain *d, struct vcpu *v,
> +                                              vm_event_response_t *rsp)
> +{
> +    /* Nothing to do. */
> +}
> +
> +static inline
> +void vm_event_register_write_resume(struct vcpu *v, vm_event_response_t *rsp)
> +{
> +    /* Nothing to do. */
> +}
> +
> +static inline
> +void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
> +{
> +    /* Nothing to do. */
> +}
> +
> +static inline
> +void vm_event_sync_event(struct vcpu *v, bool value)
> +{
> +    /* Nothing to do. */
> +}
> +
> +static inline
> +void vm_event_reset_vmtrace(struct vcpu *v)
> +{
> +    /* Nothing to do. */
> +}
> +
> +#endif /* __ASM_STUB_VM_EVENT_H__ */
> -- 
> 2.41.0
> 

