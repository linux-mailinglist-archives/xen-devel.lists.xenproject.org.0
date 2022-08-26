Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C72355A2849
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 15:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393869.633050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRZ99-00042p-3d; Fri, 26 Aug 2022 13:13:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393869.633050; Fri, 26 Aug 2022 13:13:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRZ99-00040Y-0i; Fri, 26 Aug 2022 13:13:15 +0000
Received: by outflank-mailman (input) for mailman id 393869;
 Fri, 26 Aug 2022 13:13:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oRZ97-00040S-QE
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 13:13:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRZ97-0000ks-I8; Fri, 26 Aug 2022 13:13:13 +0000
Received: from [54.239.6.187] (helo=[192.168.16.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oRZ97-0003Hk-BL; Fri, 26 Aug 2022 13:13:13 +0000
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
	bh=JAjJdt2xrNUeq1Q+U0pGaalzUH16vIO9tOhNCNoO/9A=; b=yPxN+1/jp9NZg/PDeEYALjU4rd
	+3T6OhiUZg9kkIv7QYvJOSNthoq+MhTHZSWJLOEdSIOm/4dq9UebTZnaJJgMBLN7q2W6hDSU78Ws6
	AhFde71m9SFzvP+3SrRU5Wj/+vRqwhFCyFzB3pyiTvbVLQOZsq+nqN5v8UKVt2KLYX/4=;
Message-ID: <9426d1de-a4b7-6cf6-9392-9817fbd99a56@xen.org>
Date: Fri, 26 Aug 2022 14:13:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v6 7/9] xen/arm: create shared memory nodes in guest
 device tree
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220721132115.3015761-1-Penny.Zheng@arm.com>
 <20220721132115.3015761-8-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220721132115.3015761-8-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Penny,

On 21/07/2022 14:21, Penny Zheng wrote:
> +#ifdef CONFIG_STATIC_SHM
> +static int __init make_shm_memory_node(const struct domain *d,
> +                                       void *fdt,
> +                                       int addrcells, int sizecells,
> +                                       const struct meminfo *mem)
> +{
> +    unsigned int i = 0;
> +    int res = 0;
> +
> +    if ( mem->nr_banks == 0 )
> +        return -ENOENT;
> +
> +    /*
> +     * For each shared memory region, a range is exposed under
> +     * the /reserved-memory node as a child node. Each range sub-node is
> +     * named xen-shmem@<address>.
> +     */
> +    dt_dprintk("Create xen-shmem node\n");
> +
> +    for ( ; i < mem->nr_banks; i++ )
> +    {
> +        uint64_t start = mem->bank[i].start;
> +        uint64_t size = mem->bank[i].size;
> +        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
> +        char buf[27];
> +        const char compat[] = "xen,shared-memory-v1";
> +        __be32 reg[addrcells + sizecells];

This doesn't build for me:

arch/arm/domain_build.c: In function ‘make_shm_memory_node’:
arch/arm/domain_build.c:1380:9: error: ISO C90 forbids variable length 
array ‘reg’ [-Werror=vla]
          __be32 reg[addrcells + sizecells];
          ^~~~~~

I haven't yet review the patch. But I think we would want to dynamically 
allocate 'reg' like we do in other places unless it is possible to know 
the maximum size of the array.

Cheers,

-- 
Julien Grall

