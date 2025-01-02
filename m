Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A57A9FFF75
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 20:35:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864478.1275706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQxT-0007fO-0r; Thu, 02 Jan 2025 19:34:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864478.1275706; Thu, 02 Jan 2025 19:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQxS-0007dm-Tb; Thu, 02 Jan 2025 19:34:14 +0000
Received: by outflank-mailman (input) for mailman id 864478;
 Thu, 02 Jan 2025 19:34:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AqxF=T2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tTQxR-0007dg-AV
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 19:34:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8975ca64-c940-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 20:34:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 319155C61D0;
 Thu,  2 Jan 2025 19:33:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3F1C4CED0;
 Thu,  2 Jan 2025 19:34:05 +0000 (UTC)
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
X-Inumbo-ID: 8975ca64-c940-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735846448;
	bh=vZq1cqN+aNzRmgLqQrKagZQ0ckejVp8p4duY8J+lGEs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gvpl54sfsmhAY+BFYS8BCSQVjlY6fTTCG2jd/HSJwPWoDeELH47G8VjMuUioV5rS/
	 pIjHM8NfplTERGm01tK2QJtrH1zDGs+5UlvI/jPcfBhQ4BPAHiKjKBfJ5TSvRE9cIZ
	 0FpQu0ozx1BN/nOOrNlRIl8o+hZsmHmLJDYqFTIM9zBPcYpNW4n5obwPU2hWhomQlG
	 cADO80obzfutDUJubexfoggnnSDn1Vzu8a5OaL1IMOJoLqdhmddNSaH656e02XVGrg
	 Yly2OKK2fLywvd8bbIVnbDViFGj7KJnkWz8NzONNQ6BFK5BFssWElnZl3iSDOpHHru
	 0G2wbfDHwR1sQ==
Date: Thu, 2 Jan 2025 11:34:04 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Tamas K Lengyel <tamas@tklengyel.com>, 
    Alexandru Isaila <aisaila@bitdefender.com>, 
    Petre Pircalabu <ppircalabu@bitdefender.com>
Subject: Re: [XEN PATCH v1] xen: mem_access: conditionally compile vm_event.c
 & monitor.c
In-Reply-To: <20241230063051.3332332-1-Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2501021133050.16425@ubuntu-linux-20-04-desktop>
References: <20241230063051.3332332-1-Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Dec 2024, Sergiy Kibrik wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Extend coverage of CONFIG_MEM_ACCESS option and make the build of VM events
> and monitoring support optional.
> This is to reduce code size on Arm when this option isn't enabled.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

I would add my reviewed-by but I wrote an early draft of this patch...

That said, it looks OK to me.

> ---
>  xen/arch/arm/Makefile      |  4 ++--
>  xen/arch/arm/vsmc.c        |  3 ++-
>  xen/common/Makefile        |  4 ++--
>  xen/include/xen/monitor.h  |  9 +++++++++
>  xen/include/xen/vm_event.h | 14 +++++++++++---
>  5 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 43ab5e8f25..8903eb0bf2 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -39,7 +39,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o
>  obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
>  obj-$(CONFIG_MEM_ACCESS) += mem_access.o
>  obj-y += mm.o
> -obj-y += monitor.o
> +obj-$(CONFIG_MEM_ACCESS) += monitor.o
>  obj-y += p2m.o
>  obj-y += platform.o
>  obj-y += platform_hypercall.o
> @@ -65,7 +65,7 @@ obj-$(CONFIG_VGICV2) += vgic-v2.o
>  obj-$(CONFIG_GICV3) += vgic-v3.o
>  obj-$(CONFIG_HAS_ITS) += vgic-v3-its.o
>  endif
> -obj-y += vm_event.o
> +obj-$(CONFIG_MEM_ACCESS) += vm_event.o
>  obj-y += vtimer.o
>  obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
>  obj-y += vsmc.o
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 62d8117a12..1c13326bdf 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -330,7 +330,8 @@ void do_trap_smc(struct cpu_user_regs *regs, const union hsr hsr)
>      }
>  
>      /* If monitor is enabled, let it handle the call. */
> -    if ( current->domain->arch.monitor.privileged_call_enabled )
> +    if ( IS_ENABLED(CONFIG_MEM_ACCESS) &&
> +         current->domain->arch.monitor.privileged_call_enabled )
>          rc = monitor_smc();
>  
>      if ( rc == 1 )
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index cba3b32733..e3c6a857ab 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -54,7 +54,7 @@ obj-y += timer.o
>  obj-$(CONFIG_TRACEBUFFER) += trace.o
>  obj-y += version.o
>  obj-y += virtual_region.o
> -obj-y += vm_event.o
> +obj-$(CONFIG_MEM_ACCESS) += vm_event.o
>  obj-$(CONFIG_HAS_VMAP) += vmap.o
>  obj-y += vsprintf.o
>  obj-y += wait.o
> @@ -68,7 +68,7 @@ obj-$(CONFIG_COMPAT) += $(addprefix compat/,domain.o memory.o multicall.o xlat.o
>  
>  ifneq ($(CONFIG_PV_SHIM_EXCLUSIVE),y)
>  obj-y += domctl.o
> -obj-y += monitor.o
> +obj-$(CONFIG_MEM_ACCESS) += monitor.o
>  obj-y += sysctl.o
>  endif
>  
> diff --git a/xen/include/xen/monitor.h b/xen/include/xen/monitor.h
> index 713d54f7c1..f1359abb94 100644
> --- a/xen/include/xen/monitor.h
> +++ b/xen/include/xen/monitor.h
> @@ -27,8 +27,17 @@
>  struct domain;
>  struct xen_domctl_monitor_op;
>  
> +#ifdef CONFIG_MEM_ACCESS
>  int monitor_domctl(struct domain *d, struct xen_domctl_monitor_op *mop);
>  void monitor_guest_request(void);
> +#else
> +static inline int monitor_domctl(struct domain *d,
> +                                 struct xen_domctl_monitor_op *mop)
> +{
> +    return -EINVAL;
> +}
> +static inline void monitor_guest_request(void) {}
> +#endif
>  
>  int monitor_traps(struct vcpu *v, bool sync, vm_event_request_t *req);
>  
> diff --git a/xen/include/xen/vm_event.h b/xen/include/xen/vm_event.h
> index 9a86358b42..72e720e378 100644
> --- a/xen/include/xen/vm_event.h
> +++ b/xen/include/xen/vm_event.h
> @@ -50,9 +50,6 @@ struct vm_event_domain
>      unsigned int last_vcpu_wake_up;
>  };
>  
> -/* Clean up on domain destruction */
> -void vm_event_cleanup(struct domain *d);
> -
>  /* Returns whether a ring has been set up */
>  bool vm_event_check_ring(struct vm_event_domain *ved);
>  
> @@ -88,7 +85,18 @@ void vm_event_cancel_slot(struct domain *d, struct vm_event_domain *ved);
>  void vm_event_put_request(struct domain *d, struct vm_event_domain *ved,
>                            vm_event_request_t *req);
>  
> +#ifdef CONFIG_MEM_ACCESS
> +/* Clean up on domain destruction */
> +void vm_event_cleanup(struct domain *d);
>  int vm_event_domctl(struct domain *d, struct xen_domctl_vm_event_op *vec);
> +#else
> +static inline void vm_event_cleanup(struct domain *d) {}
> +static inline int vm_event_domctl(struct domain *d,
> +                                  struct xen_domctl_vm_event_op *vec)
> +{
> +    return -EINVAL;
> +}
> +#endif
>  
>  void vm_event_vcpu_pause(struct vcpu *v);
>  void vm_event_vcpu_unpause(struct vcpu *v);
> -- 
> 2.25.1
> 

