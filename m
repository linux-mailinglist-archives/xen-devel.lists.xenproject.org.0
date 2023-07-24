Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CADB7602CD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 00:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569262.889660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO4Sh-0005hO-3d; Mon, 24 Jul 2023 22:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569262.889660; Mon, 24 Jul 2023 22:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO4Sh-0005fI-0K; Mon, 24 Jul 2023 22:55:31 +0000
Received: by outflank-mailman (input) for mailman id 569262;
 Mon, 24 Jul 2023 22:55:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJiQ=DK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qO4Sf-0005fC-St
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 22:55:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2eabb6d4-2a75-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 00:55:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5789D6145D;
 Mon, 24 Jul 2023 22:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A362FC433C8;
 Mon, 24 Jul 2023 22:55:25 +0000 (UTC)
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
X-Inumbo-ID: 2eabb6d4-2a75-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690239326;
	bh=D9aN3tyC2B0wvSthHOwUv/fEVrhSHzVK2GuhbKiPlGY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=urKbb5rOZzlRedPGpFPI/bjbYbJmRwNeFNGcXXgal4GOMLDwDTeR8HCHvUlY90Iow
	 biD1IvZMQHCRz/gxZ7+ucjMRiJpuFpmAXf6CQXbNBwisedJHMKx75AlOwEJjMkwwO3
	 UBwk5aWXi6BaOhmGjS5B2p7LK3pMQ5/VeS1qTEacRs2Hnfnyz80oi9TXpsvIJ+mZE8
	 AMXbmNDGVqbRZY6IuTrD8IgWnExxitjkIxxlRRPAuxvirMGG3MBAZBbWonP9ql2LzC
	 G0H6gt2TUb3uCvxiuZx/run/NfoqDUnL42SV1gUtara7c7IYT3f1bTeyGsRef+ZHUp
	 10EGGgCx2Ga2Q==
Date: Mon, 24 Jul 2023 15:55:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 2/3] xen/arm: irq: address violations of MISRA C:
 2012 Rules 8.2 and 8.3
In-Reply-To: <a62e88a9c29cf7866c251968b5a5b6865aff4a2a.1690217195.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2307241551380.3118466@ubuntu-linux-20-04-desktop>
References: <cover.1690217195.git.federico.serafini@bugseng.com> <a62e88a9c29cf7866c251968b5a5b6865aff4a2a.1690217195.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jul 2023, Federico Serafini wrote:
> Give a name to unnamed parameters thus addressing violations of
> MISRA C:2012 Rule 8.2 ("Function types shall be in prototype form with
> named parameters").
> Keep consistency between parameter names and types used in function
> declarations and the ones used in the corresponding function
> definitions, thus addressing violations of MISRA C:2012 Rule 8.3
> ("All declarations of an object or function shall use the same names
> and type qualifiers").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/arm/irq.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 16e56f8945..335e06a2a7 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -58,7 +58,7 @@ hw_irq_controller no_irq_type = {
>  static irq_desc_t irq_desc[NR_IRQS];
>  static DEFINE_PER_CPU(irq_desc_t[NR_LOCAL_IRQS], local_irq_desc);
>  
> -irq_desc_t *__irq_to_desc(int irq)
> +struct irq_desc *__irq_to_desc(int irq)
>  {
>      if ( irq < NR_LOCAL_IRQS )
>          return &this_cpu(local_irq_desc)[irq];
> @@ -182,7 +182,8 @@ void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask)
>  }
>  
>  int request_irq(unsigned int irq, unsigned int irqflags,
> -                void (*handler)(int, void *, struct cpu_user_regs *),
> +                void (*handler)(int irq, void *dev_id,
> +                                struct cpu_user_regs *regs),

We have an inconsistency where the handler functions on x86 typically
call it void *data, while on arm they typically use void *dev_id
(see xen/arch/x86/irq.c:request_irq and
xen/arch/x86/hpet.c:hpet_interrupt_handler). I think we should be
consistent. Or, if this is not a MISRA requirement because this is just
a function pointer rather than a proper function, then I would leave it
alone.


>                  const char *devname, void *dev_id)
>  {
>      struct irqaction *action;
> @@ -617,7 +618,7 @@ void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
>      BUG();
>  }
>  
> -void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
> +void pirq_set_affinity(struct domain *d, int irq, const cpumask_t *mask)

I think we should leave it as is because there is also the x86
implementation of pirq_set_affinity that uses int pirq as parameter. It
is not a good idea to introduce inconsistencies between the x86 and the
ARM versions of the same function.

