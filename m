Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64666C377A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 17:56:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512879.793223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefHr-00015P-OC; Tue, 21 Mar 2023 16:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512879.793223; Tue, 21 Mar 2023 16:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefHr-00012v-LM; Tue, 21 Mar 2023 16:56:39 +0000
Received: by outflank-mailman (input) for mailman id 512879;
 Tue, 21 Mar 2023 16:56:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pefHq-00012n-Ly
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 16:56:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pefHq-0002B8-4P; Tue, 21 Mar 2023 16:56:38 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pefHp-0004G8-Tf; Tue, 21 Mar 2023 16:56:38 +0000
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
	bh=bk62vuHNI2EF7EdnUeevlR0Ko/mNTHWO6EDlw+aoXVE=; b=VsWnlqyN35r7n7GiEteSif2SFg
	RVndrCasTFv9hfgCsQqbitIIgQ+366tKVRJNLUccEIc4Zji8CcR1aSKtzBTH/+wbSJBQCc2Ld3h9Y
	MakGObM0Jz7uxPpPaaue2WeRCsazubuLT0mJiKCuJK6GW4DIkMzB8bT1IWaJfb9x3CPo=;
Message-ID: <b0fe586a-1a55-dbc3-a673-2c3809b3c1d3@xen.org>
Date: Tue, 21 Mar 2023 16:56:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/2] arch/arm: irq: Add platform_get_irq_byname()
 implementation
Content-Language: en-US
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, rahul.singh@arm.com,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>
References: <20230313130803.3499098-1-andrei.cherechesu@oss.nxp.com>
 <20230313130803.3499098-2-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230313130803.3499098-2-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrei,

I realized this has already been merged. But I would like to point out a 
few things for future series.

On 13/03/2023 13:08, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Moved implementation for the function which parses the IRQs of a DT
> node by the "interrupt-names" property from the SMMU-v3 driver
> to the IRQ core code and made it non-static to be used as helper.
> 
> Also changed it to receive a "struct dt_device_node*" as parameter,
> like its counterpart, platform_get_irq(). Updated its usage inside
> the SMMU-v3 driver accordingly.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   xen/arch/arm/include/asm/irq.h        |  2 ++
>   xen/arch/arm/irq.c                    | 14 +++++++++++
>   xen/drivers/passthrough/arm/smmu-v3.c | 35 +++++----------------------
>   3 files changed, 22 insertions(+), 29 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> index 245f49dcba..af94f41994 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -89,6 +89,8 @@ int irq_set_type(unsigned int irq, unsigned int type);
>   
>   int platform_get_irq(const struct dt_device_node *device, int index);
>   
> +int platform_get_irq_byname(struct dt_device_node *np, const char *name);
> +
>   void irq_set_affinity(struct irq_desc *desc, const cpumask_t *cpu_mask);
>   
>   /*
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 79718f68e7..ded495792b 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -718,6 +718,20 @@ int platform_get_irq(const struct dt_device_node *device, int index)
>       return irq;
>   }
>   
> +int platform_get_irq_byname(struct dt_device_node *np, const char *name)

You are changing the name but don't really explain why. "np" also ought 
to be const as this is not meant to be modified.

> +{
> +	int index;
> +
> +	if ( unlikely(!name) )
> +		return -EINVAL;
> +
> +	index = dt_property_match_string(np, "interrupt-names", name);
> +	if ( index < 0 )
> +		return index;
> +
> +	return platform_get_irq(np, index);

The existing helper was returning -ENODEV when there is an error. But 
here, you went differently. This is the sort of thing that ought to be 
explained in the commit message because it is not obvious why you 
changed it *and* that you actually checked the callers are OK with that.

Thankfully they are all.

Cheers,

-- 
Julien Grall

