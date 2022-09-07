Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343CC5B057B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 15:41:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401765.643692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvIl-0005aX-9t; Wed, 07 Sep 2022 13:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401765.643692; Wed, 07 Sep 2022 13:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvIl-0005Xs-6u; Wed, 07 Sep 2022 13:41:11 +0000
Received: by outflank-mailman (input) for mailman id 401765;
 Wed, 07 Sep 2022 13:41:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVvIk-0005Xm-KC
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 13:41:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVvIk-0006eH-AF; Wed, 07 Sep 2022 13:41:10 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVvIk-0004A4-4I; Wed, 07 Sep 2022 13:41:10 +0000
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
	bh=6gbPZH0blVXoKVhcqmYuhV+vGAr46JMlx52ns7im1jI=; b=QeHA9NBta26QyHQegCBW3+rIf0
	qgjs/A55D0C3T388iEX4Ns5JcVQt9CfwOVK/HrJ3DIY8zRbhUnH9Hj82P59cIeQ9kZjewsPWJiGLQ
	5VJdYgXchKe+SvSVLxy389iOgeuBCr+TB2W70Y6fjtlC67TY03/+kSUCXqC0Nsyv21Gs=;
Message-ID: <ca8eeff8-f40f-0cf9-bde3-a733b61e3712@xen.org>
Date: Wed, 7 Sep 2022 14:41:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v7 7/9] xen/arm: create shared memory nodes in guest
 device tree
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
 <20220906085941.944592-8-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220906085941.944592-8-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 06/09/2022 09:59, Penny Zheng wrote:
> We expose the shared memory to the domU using the "xen,shared-memory-v1"
> reserved-memory binding. See
> Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
> in Linux for the corresponding device tree binding.
> 
> To save the cost of re-parsing shared memory device tree configuration when
> creating shared memory nodes in guest device tree, this commit adds new field
> "shm_mem" to store shm-info per domain.
> 
> For each shared memory region, a range is exposed under
> the /reserved-memory node as a child node. Each range sub-node is
> named xen-shmem@<address> and has the following properties:
> - compatible:
>          compatible = "xen,shared-memory-v1"
> - reg:
>          the base guest physical address and size of the shared memory region
> - xen,id:
>          a string that identifies the shared memory region.

So technically, there is a property "xen,offset" that should be 
specified for the borrowers.

TBH, I don't quite understand what this property is used for. So it is 
not quite clear why this is skipped.

The Stefano is the author of the binding. So maybe he can explain the 
purpose of the property and help to document it in the commit message 
why this is ignored.

> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d0ff487cc6..3b7436030e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -914,7 +914,22 @@ static int __init assign_shared_memory(struct domain *d,
>       return ret;
>   }
>   
> -static int __init process_shm(struct domain *d,
> +static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
> +                                            paddr_t start, paddr_t size,
> +                                            const char *shm_id)
> +{
> +    if ( (kinfo->shm_mem.nr_banks + 1) > NR_MEM_BANKS )

NIT: The +1 could be avoided if you use >=. This would also avoid to 
think about the overflow case for nr_banks :).

> +        return -ENOMEM;
> +
> +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
> +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
> +    safe_strcpy(kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id, shm_id);
> +    kinfo->shm_mem.nr_banks++;
> +
> +    return 0;
> +}
> +
> +static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>                                 const struct dt_device_node *node)
>   {
>       struct dt_device_node *shm_node;
> @@ -928,6 +943,7 @@ static int __init process_shm(struct domain *d,
>           int ret = 0;
>           unsigned int i;
>           const char *role_str;
> +        const char *shm_id;

>           bool owner_dom_io = true;
>   
>           if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
> @@ -972,6 +988,9 @@ static int __init process_shm(struct domain *d,
>           if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
>               owner_dom_io = false;
>   
> +        dt_property_read_string(shm_node, "xen,shm-id", &shm_id);

shm_id will only be set if dt_property_read_string() returns 0. 
Otherwise it will be unknown. Given...

> +        BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
... this BUG_ON(), I assuming you want to double check that the property 
is correct. So you want to also check the return value.

Otherwise, I suspect a static analyzer will complain that you may use 
unitialized value.

[...]

> +static int __init make_resv_memory_node(const struct domain *d,
> +                                        void *fdt,
> +                                        int addrcells, int sizecells,
> +                                        struct meminfo *mem)

AFAICT 'mem' could be const.

> +{
> +    int res = 0;
> +    /* Placeholder for reserved-memory\0 */
> +    char resvbuf[16] = "reserved-memory";

Same here.

Cheers,

-- 
Julien Grall

