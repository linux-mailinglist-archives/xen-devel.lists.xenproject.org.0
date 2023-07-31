Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC8776A29F
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 23:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573464.898195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQaQI-0000Me-LV; Mon, 31 Jul 2023 21:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573464.898195; Mon, 31 Jul 2023 21:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQaQI-0000KU-IQ; Mon, 31 Jul 2023 21:27:26 +0000
Received: by outflank-mailman (input) for mailman id 573464;
 Mon, 31 Jul 2023 21:27:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bj4f=DR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQaQH-0000KO-4m
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 21:27:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0930b119-2fe9-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 23:27:23 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8C64612DB;
 Mon, 31 Jul 2023 21:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A497C433C8;
 Mon, 31 Jul 2023 21:27:20 +0000 (UTC)
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
X-Inumbo-ID: 0930b119-2fe9-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690838841;
	bh=dvNYDOGc8vyZ0Oar2BdKpXZ4dxl8hg0QkZpHXyAQRvg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XbVy2MwL7rVm6HlFZ7cKtCCgJjvKRb/pHMNzx7HD9YQ/tXZURtnlDglUyjgjpuOYB
	 K9OIgYLlj/KFuaR+MlnN0LcJymxp81W58PiRiRjRhIEB2V/qnBseOFz6tk3UjzTBxE
	 fMJIBh5dO8ZrIW1hzJUGJJdy00ejcV6Nnu7Dn+BiMrQCED55gxq6IP6RGsKKrgl4WZ
	 9UoH3tROsiqyegWp0VkH1qrv4DjnJk8SfJHVdokV9RqEf3BVy0WceDLkCJoXQAH5EW
	 hlOhFSVZwjL8xCMAg1kZ/lmvM3CElACxvYvccnTuoxGSSRdrSj2YRI872EIqp4uyEE
	 7rJwgRsGkyXtQ==
Date: Mon, 31 Jul 2023 14:27:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH] xen/arm/IRQ: uniform irq_set_affinity() with x86
 version
In-Reply-To: <018fb3a81eb6669346694f2669333ba4d67ab5c4.1690811728.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307311427120.1972086@ubuntu-linux-20-04-desktop>
References: <018fb3a81eb6669346694f2669333ba4d67ab5c4.1690811728.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Jul 2023, Federico Serafini wrote:
> Change parameter name of irq_set_affinity() to uniform the function
> prototype with the one used by x86.
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/include/asm/irq.h | 2 +-
>  xen/arch/arm/irq.c             | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> index 105b33b37d..c8044b0371 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -91,7 +91,7 @@ int platform_get_irq(const struct dt_device_node *device, int index);
>  
>  int platform_get_irq_byname(const struct dt_device_node *np, const char *name);
>  
> -void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask);
> +void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask);
>  
>  /*
>   * Use this helper in places that need to know whether the IRQ type is
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 054bb281d8..09648db17a 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -175,10 +175,10 @@ static inline struct domain *irq_get_domain(struct irq_desc *desc)
>      return irq_get_guest_info(desc)->d;
>  }
>  
> -void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask)
> +void irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
>  {
>      if ( desc != NULL )
> -        desc->handler->set_affinity(desc, cpu_mask);
> +        desc->handler->set_affinity(desc, mask);
>  }
>  
>  int request_irq(unsigned int irq, unsigned int irqflags,
> -- 
> 2.34.1
> 

