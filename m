Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6F85AF330
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 19:56:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400029.641563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVcoP-0001mI-QE; Tue, 06 Sep 2022 17:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400029.641563; Tue, 06 Sep 2022 17:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVcoP-0001j0-N4; Tue, 06 Sep 2022 17:56:37 +0000
Received: by outflank-mailman (input) for mailman id 400029;
 Tue, 06 Sep 2022 17:56:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVcoN-0001iu-CW
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 17:56:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVcoM-0000o9-VK; Tue, 06 Sep 2022 17:56:34 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.11.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVcoM-0006Bs-PS; Tue, 06 Sep 2022 17:56:34 +0000
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
	bh=1YY25Gsv032TcI3kXiyGuPIuU9TCO+941wu9jmBSMp4=; b=tI4LCNpx5PCopXaU3sGH71VZM/
	8J3gZZP5wYLXyx3onjqcTl1vfmchiUliM56KzYbeTGZwvGDAcpABvojH+R92yCcgY0WXa+akGvdb6
	iD4bhil/hXHYAWnWC4YuakHl9rrFOXN4ewI2mPISjQ3oBlcUz7lGcmluCsJAo7k+lQXA=;
Message-ID: <3d6d92f5-6f5e-6250-d693-0f0415e7e5eb@xen.org>
Date: Tue, 6 Sep 2022 18:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v7 1/9] xen/arm: introduce static shared memory
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
 <20220906085941.944592-2-Penny.Zheng@arm.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220906085941.944592-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 06/09/2022 09:59, Penny Zheng wrote:
> +    for ( i = 0; i < mem->nr_banks; i++ )
> +    {
> +        /*
> +         * Meet the following check:
> +         * 1) The shm ID matches and the region exactly match
> +         * 2) The shm ID doesn't match and the region doesn't overlap
> +         * with an existing one
> +         */
> +        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
> +        {
> +            if ( strncmp(shm_id, mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) == 0 )
> +                break;
> +            else
> +            {
> +                printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
> +                       shm_id);
> +                return -EINVAL;
> +            }
> +        }
> +        else
> +        {
> +            paddr_t end = paddr + size;
> +            paddr_t bank_end = mem->bank[i].start + mem->bank[i].size;
> +
> +            if ( (end <= paddr) || (bank_end <= mem->bank[i].start) )
> +                printk("fdt: static shared memory region %s overflow\n", shm_id);

Why are you continuing here?

> +
> +            if ( (end <= mem->bank[i].start) || (paddr >= bank_end) )
> +            {
> +                if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
> +                    continue;
> +                else
> +                {
> +                    printk("fdt: different shared memory region could not share the same shm ID %s\n",
> +                           shm_id);
> +                    return -EINVAL;
> +                }
> +            }
> +            else
> +            {
> +                printk("fdt: shared memory region overlap with an existing entry %#"PRIpaddr" - %#"PRIpaddr"\n",
> +                        mem->bank[i].start, bank_end);
> +                return -EINVAL;
> +            }
> +        }
> +    }
> +
> +    if ( i == mem->nr_banks )
> +    {
> +        if ( i < NR_MEM_BANKS )
> +        {
> +            /* Static shared memory shall be reserved from any other use. */
> +            safe_strcpy(mem->bank[mem->nr_banks].shm_id, shm_id);
> +            mem->bank[mem->nr_banks].start = paddr;
> +            mem->bank[mem->nr_banks].size = size;
> +            mem->bank[mem->nr_banks].xen_domain = true;
> +            mem->nr_banks++;
> +        }
> +        else
> +        {
> +            printk("Warning: Max number of supported memory regions reached.\n");
> +            return -ENOSPC;
> +        }
> +    }
> +    /*
> +     * keep a count of the number of borrowers, which later may be used
> +     * to calculate the reference count.
> +     */
> +    if ( !owner )
> +        mem->bank[i].nr_shm_borrowers++;
> +
> +    return 0;
> +}
> +#else
> +static int __init process_shm_node(const void *fdt, int node,
> +                                   uint32_t address_cells, uint32_t size_cells)
> +{
> +    printk("CONFIG_STATIC_SHM must be enabled for parsing static shared memory nodes\n");
> +    WARN();

NIT: The WARN() here seems pointless because the call trace is not deep 
*and* it would not be printed unless you are using earlyprintk.

Anyway, the only reason I am not acking this patch is related to the 
question I asked above.

Cheers,

-- 
Julien Grall

