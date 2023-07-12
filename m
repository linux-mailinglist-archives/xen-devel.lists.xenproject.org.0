Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1527503E5
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 11:53:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562134.878708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJWWv-0005wx-VD; Wed, 12 Jul 2023 09:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562134.878708; Wed, 12 Jul 2023 09:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJWWv-0005uU-SV; Wed, 12 Jul 2023 09:53:05 +0000
Received: by outflank-mailman (input) for mailman id 562134;
 Wed, 12 Jul 2023 09:53:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qJWWu-0005uO-1n
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 09:53:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJWWs-0003Tu-3i; Wed, 12 Jul 2023 09:53:02 +0000
Received: from [15.248.2.150] (helo=[10.24.67.30])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qJWWr-0002h1-QP; Wed, 12 Jul 2023 09:53:01 +0000
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
	bh=vuXmIAv4AZUppmiBlulQc0pZkBQLZtRtdwKOei99RmQ=; b=qY/kR+gtSHdtR7/ys/sGg7xaCn
	dsa0GbeP5PxEzFAz0cBuVOcyHFrfQ5bQ1cNLzqw1ykbp0GB51Yjr28fLfBTT+5sasO0IfVQxcrmFH
	z3cY5QlNAnWMLutlr2a2wvR2UUx9kBSAm5Tx0L5NOEovbGf0ZqU3/gKFptF/v3sHRc7U=;
Message-ID: <b1a9be99-6078-6553-74f1-5be5f002b23d@xen.org>
Date: Wed, 12 Jul 2023 10:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v9 02/24] xen/arm: add TEE teardown to
 arch_domain_teardown()
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand.Marquis@arm.com,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Marc Bonnici <marc.bonnici@arm.com>,
 Achin Gupta <achin.gupta@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230705093433.2514898-1-jens.wiklander@linaro.org>
 <20230705093433.2514898-3-jens.wiklander@linaro.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230705093433.2514898-3-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jens,

On 05/07/2023 10:34, Jens Wiklander wrote:
> Adds a progress state for tee_domain_teardown() to be called from
> arch_domain_teardown(). tee_domain_teardown() calls the new callback
> domain_teardown() in struct tee_mediator_ops.
> 
> An empty domain_teardown() callback is added to the OP-TEE mediator.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Co-developed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I am a bit confused with the tags ordering. The first signed-off-by 
indicates that Andrew is the author but he co-developped with himself? 
Did you indent to put your signed-off-by first?

> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> 
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Jens Wiklander <jens.wiklander@linaro.org>
> ---
>   xen/arch/arm/domain.c              | 36 ++++++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/tee/tee.h |  7 ++++++
>   xen/arch/arm/tee/optee.c           |  6 +++++
>   xen/arch/arm/tee/tee.c             |  8 +++++++
>   4 files changed, 57 insertions(+)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 15d9709a97d2..18171decdc66 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -795,6 +795,42 @@ fail:
>   
>   int arch_domain_teardown(struct domain *d)
>   {
> +    int ret = 0;
> +
> +    BUG_ON(!d->is_dying);
> +
> +    /* See domain_teardown() for an explanation of all of this magic. */
> +    switch ( d->teardown.arch_val )
> +    {
> +#define PROGRESS(x)                             \
> +        d->teardown.arch_val = PROG_ ## x;      \
> +        fallthrough;                            \
> +    case PROG_ ## x
> +
> +        enum {
> +            PROG_none,
> +            PROG_tee,
> +            PROG_done,
> +        };
> +
> +    case PROG_none:
> +        BUILD_BUG_ON(PROG_none != 0);
> +
> +    PROGRESS(tee):
> +        ret = tee_domain_teardown(d);
> +        if ( ret )
> +            return ret;
> +        break;
> +
> +    PROGRESS(done):
> +        break;
> +
> +#undef PROGRESS
> +
> +    default:
> +        BUG();
> +    }
> +
>       return 0;
>   }
>   
> diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/asm/tee/tee.h
> index f483986385c8..da324467e130 100644
> --- a/xen/arch/arm/include/asm/tee/tee.h
> +++ b/xen/arch/arm/include/asm/tee/tee.h
> @@ -34,6 +34,7 @@ struct tee_mediator_ops {
>        * guest and create own structures for the new domain.
>        */
>       int (*domain_init)(struct domain *d);
> +    int (*domain_teardown)(struct domain *d);
>   
>       /*
>        * Called during domain destruction to relinquish resources used
> @@ -62,6 +63,7 @@ struct tee_mediator_desc {
>   
>   bool tee_handle_call(struct cpu_user_regs *regs);
>   int tee_domain_init(struct domain *d, uint16_t tee_type);
> +int tee_domain_teardown(struct domain *d);
>   int tee_relinquish_resources(struct domain *d);
>   uint16_t tee_get_type(void);
>   
> @@ -93,6 +95,11 @@ static inline int tee_relinquish_resources(struct domain *d)
>       return 0;
>   }
>   
> +static inline int tee_domain_teardown(struct domain *d)
> +{
> +    return 0;
> +}
> +
>   static inline uint16_t tee_get_type(void)
>   {
>       return XEN_DOMCTL_CONFIG_TEE_NONE;
> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> index 301d205a36c5..c91bd7d5ac25 100644
> --- a/xen/arch/arm/tee/optee.c
> +++ b/xen/arch/arm/tee/optee.c
> @@ -268,6 +268,11 @@ static int optee_domain_init(struct domain *d)
>       return 0;
>   }
>   
> +static int optee_domain_teardown(struct domain *d)
> +{
> +    return 0;

I think for OP-TEE, we also need to moved the smc call to destroy the VM 
here. I am OK if this is not handled here, but it would be worth 
mentioning in the commit message.

> +}
> +
>   static uint64_t regpair_to_uint64(register_t reg0, register_t reg1)
>   {
>       return ((uint64_t)reg0 << 32) | (uint32_t)reg1;
> @@ -1732,6 +1737,7 @@ static const struct tee_mediator_ops optee_ops =
>   {
>       .probe = optee_probe,
>       .domain_init = optee_domain_init,
> +    .domain_teardown = optee_domain_teardown,
>       .relinquish_resources = optee_relinquish_resources,
>       .handle_call = optee_handle_call,
>   };
> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
> index 3964a8a5cddf..ddd17506a9ff 100644
> --- a/xen/arch/arm/tee/tee.c
> +++ b/xen/arch/arm/tee/tee.c
> @@ -52,6 +52,14 @@ int tee_domain_init(struct domain *d, uint16_t tee_type)
>       return cur_mediator->ops->domain_init(d);
>   }
>   
> +int tee_domain_teardown(struct domain *d)
> +{
> +    if ( !cur_mediator )
> +        return 0;
> +
> +    return cur_mediator->ops->domain_teardown(d);

NIT: I would consider to check if the callback is NULL. This would avoid 
providing dummy helper.

> +}
> +
>   int tee_relinquish_resources(struct domain *d)
>   {
>       if ( !cur_mediator )

Cheers,

-- 
Julien Grall

