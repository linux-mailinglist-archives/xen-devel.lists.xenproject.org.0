Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B1C7CA2B7
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 10:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617339.959858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJLb-0001fv-Nm; Mon, 16 Oct 2023 08:53:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617339.959858; Mon, 16 Oct 2023 08:53:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsJLb-0001e7-Jl; Mon, 16 Oct 2023 08:53:11 +0000
Received: by outflank-mailman (input) for mailman id 617339;
 Mon, 16 Oct 2023 08:53:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsJLa-0001e1-Fo
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 08:53:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsJLZ-0004Ij-TP; Mon, 16 Oct 2023 08:53:09 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsJLZ-0004CF-Ne; Mon, 16 Oct 2023 08:53:09 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=qlPTGGpAQDKNEQ/xe9+SpV5bhZmTmziqlRC1gPi/3T4=; b=S90a8r8dODtcfNG0UmL6dPgYKW
	HmJ7NDX0ckzpF4M22mwmlG4LVimoGMpZPNAYXFBbWOzbD76fVELMFMHhXDzQtaqLTM1FZeG+6qwHS
	vKryUUU5OAqppy0OGhdj/0pb9tXGZrlhCdbF3fO6zAn9f08ATzpYqXrf/KIeT7/tm7qg=;
Message-ID: <d2a58398-e381-4b0d-b5cc-ab1ed7f6c7fb@xen.org>
Date: Mon, 16 Oct 2023 09:53:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 01/10] arm/gic: address violations of MISRA C:2012
 Rule 8.2
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Henry Wang <henry.wang@arm.com>
References: <cover.1697207038.git.federico.serafini@bugseng.com>
 <e55bfe55e0c34e96692f397ff69365bc0819fd90.1697207038.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e55bfe55e0c34e96692f397ff69365bc0819fd90.1697207038.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/10/2023 16:24, Federico Serafini wrote:
> Add missing parameter names, no functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>   xen/arch/arm/include/asm/gic.h | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.h
> index f1ef347edc..03f209529b 100644
> --- a/xen/arch/arm/include/asm/gic.h
> +++ b/xen/arch/arm/include/asm/gic.h
> @@ -246,7 +246,7 @@ void gic_set_irq_type(struct irq_desc *desc, unsigned int type);
>   
>   /* Program the GIC to route an interrupt */
>   extern void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority);
> -extern int gic_route_irq_to_guest(struct domain *, unsigned int virq,
> +extern int gic_route_irq_to_guest(struct domain *d, unsigned int virq,
>                                     struct irq_desc *desc,
>                                     unsigned int priority);
>   
> @@ -330,11 +330,11 @@ struct gic_hw_operations {
>       /* Initialize the GIC and the boot CPU */
>       int (*init)(void);
>       /* Save GIC registers */
> -    void (*save_state)(struct vcpu *);
> +    void (*save_state)(struct vcpu *v);
>       /* Restore GIC registers */
> -    void (*restore_state)(const struct vcpu *);
> +    void (*restore_state)(const struct vcpu *v);
>       /* Dump GIC LR register information */
> -    void (*dump_state)(const struct vcpu *);
> +    void (*dump_state)(const struct vcpu *v);
>   
>       /* hw_irq_controller to enable/disable/eoi host irq */
>       hw_irq_controller *gic_host_irq_type;
> @@ -369,9 +369,9 @@ struct gic_hw_operations {
>       /* Clear LR register */
>       void (*clear_lr)(int lr);
>       /* Read LR register and populate gic_lr structure */
> -    void (*read_lr)(int lr, struct gic_lr *);
> +    void (*read_lr)(int lr, struct gic_lr *lr_reg);
>       /* Write LR register from gic_lr structure */
> -    void (*write_lr)(int lr, const struct gic_lr *);
> +    void (*write_lr)(int lr, const struct gic_lr *lr_reg);

Are the parameters name meant to match the declaration of the callbacks?
I am asking it because I see there are some inconsistencies between the 
declaration in GICv3 and GICv2. So this may want to be harmonized.

Cheers,

-- 
Julien Grall

