Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFD2831B31
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 15:15:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668771.1041200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQTAg-00062o-5B; Thu, 18 Jan 2024 14:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668771.1041200; Thu, 18 Jan 2024 14:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQTAg-0005zZ-1s; Thu, 18 Jan 2024 14:15:06 +0000
Received: by outflank-mailman (input) for mailman id 668771;
 Thu, 18 Jan 2024 14:15:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rQTAe-0005zS-3e
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 14:15:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQTAd-0006Uf-7X; Thu, 18 Jan 2024 14:15:03 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQTAc-0002Tj-VB; Thu, 18 Jan 2024 14:15:03 +0000
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
	bh=P3BMLaiEes4gycl8hhVDaw6ZbaC598FK70h+O1Dt0mg=; b=maO5XqufwIaodL5XctCApA1fNb
	yeiPRJ19qO5aMmtinWd255kHtMWIpTSubWMyt7GXqq9+uvacfw6tdew5ptfeWi4VKTzQqVcDAiov0
	3VPHzZU69uNsPUWds3cNoO16lDs2HIJBNL0zxSLAS/HQ42idhrJjGDM8nrTC+wxgKLwE=;
Message-ID: <3e3d8c70-146e-446e-8e54-a640b8c7c9e1@xen.org>
Date: Thu, 18 Jan 2024 14:15:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] IRQ: generalize [gs]et_irq_regs()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <4c6d11b0-32dd-4ce3-a157-a848b6fc3154@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4c6d11b0-32dd-4ce3-a157-a848b6fc3154@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 11/01/2024 07:32, Jan Beulich wrote:
> Move functions (and their data) to common code, and invoke the functions
> on Arm as well. This is in preparation of dropping the register
> parameters from handler functions.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
> To limit visibility of the per-CPU data item, we may want to consider
> making the functions out-of-line ones (in common/irq.c).
> 
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -221,6 +221,7 @@ void do_IRQ(struct cpu_user_regs *regs,
>   {
>       struct irq_desc *desc = irq_to_desc(irq);
>       struct irqaction *action;
> +    struct cpu_user_regs *old_regs = set_irq_regs(regs);
>   
>       perfc_incr(irqs);
>   
> @@ -288,6 +289,7 @@ out:
>   out_no_end:
>       spin_unlock(&desc->lock);
>       irq_exit();
> +    set_irq_regs(old_regs);
>   }

[...]

> +/*
> + * Per-cpu interrupted context register state - the top-most interrupt frame
> + * on the stack.
> + */
> +DECLARE_PER_CPU(struct cpu_user_regs *, irq_regs);
> +
> +static inline struct cpu_user_regs *get_irq_regs(void)
> +{
> +	return this_cpu(irq_regs);
> +}
> +
> +static inline struct cpu_user_regs *set_irq_regs(struct cpu_user_regs *new_regs)
> +{
> +	struct cpu_user_regs *old_regs, **pp_regs = &this_cpu(irq_regs);
> +
> +	old_regs = *pp_regs;
> +	*pp_regs = new_regs;

NIT: As you move the code, can you add a newline before the return?

> +	return old_regs;
> +}
> +
>   struct domain;
>   struct vcpu;

Cheers,

-- 
Julien Grall

