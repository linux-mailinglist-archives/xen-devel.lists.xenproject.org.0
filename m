Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF3651E6A1
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 13:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323681.545467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnIZe-0003xC-1y; Sat, 07 May 2022 11:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323681.545467; Sat, 07 May 2022 11:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnIZd-0003uz-V9; Sat, 07 May 2022 11:26:09 +0000
Received: by outflank-mailman (input) for mailman id 323681;
 Sat, 07 May 2022 11:26:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nnIZb-0003ut-Sj
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 11:26:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nnIZb-0005Lh-JK; Sat, 07 May 2022 11:26:07 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nnIZb-0001EV-DZ; Sat, 07 May 2022 11:26:07 +0000
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
	bh=zO5nDulVJvMCj0o0muvGfrPjkZiTuCeyskrlGulD5V4=; b=wVCneGceeoFVk/B7hgP26fzwC5
	0pjNrMUd46y3sMdNpw6oHLxxaTzqtOpjtQjHQh528dEV2jjR+KiRW145yisJ6bASH2fB9go9EB2Pw
	8Ok4TL+vxVhwxtneAw0nNhS5/u2OZBDeMbVz+oqCCUCHUhwAo5XW2xPsCV9ZpSqhdcHg=;
Message-ID: <ec3379a9-e182-4358-ccf8-e07712ea9dcd@xen.org>
Date: Sat, 7 May 2022 12:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH v2 8/9] xen/arm: create shared memory nodes in guest
 device tree
To: Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <Penny.Zheng@arm.com>
Cc: xen-devel@lists.xenproject.org, wei.chen@arm.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com>
 <20220506072502.2177828-9-Penny.Zheng@arm.com>
 <alpine.DEB.2.22.394.2205061750400.43560@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2205061750400.43560@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/05/2022 02:09, Stefano Stabellini wrote:
> On Fri, 6 May 2022, Penny Zheng wrote:
>> We expose the shared memory to the domU using the "xen,shared-memory-v1"
>> reserved-memory binding. See
>> Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
>> in Linux for the corresponding device tree binding.
>>
>> To save the cost of re-parsing shared memory device tree configuration when
>> creating shared memory nodes in guest device tree, this commit adds new field
>> "shm_mem" to store shm-info per domain.
>>
>> For each shared memory region, a range is exposed under
>> the /reserved-memory node as a child node. Each range sub-node is
>> named xen-shmem@<address> and has the following properties:
>> - compatible:
>>          compatible = "xen,shared-memory-v1"
>> - reg:
>>          the base guest physical address and size of the shared memory region
>> - xen,id:
>>          a string that identifies the shared memory region.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> ---
>> v2 change:
>> - using xzalloc
>> - shm_id should be uint8_t
>> - make reg a local variable
>> - add #address-cells and #size-cells properties
>> - fix alignment
>> ---
>>   xen/arch/arm/domain_build.c       | 144 ++++++++++++++++++++++++++++++
>>   xen/arch/arm/include/asm/domain.h |   1 +
>>   xen/arch/arm/include/asm/setup.h  |   1 +
>>   3 files changed, 146 insertions(+)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 8d299a3616..f08606d2c0 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -894,6 +894,26 @@ static int __init allocate_shared_memory(struct domain *d,
>>       return ret;
>>   }
>>   
>> +static int __init append_shm_bank_to_domain(struct domain *d,
>> +                                            paddr_t start, paddr_t size,
>> +                                            u32 shm_id)
>> +{
>> +    /* Allocate memory at first insertion. */
>> +    if ( d->arch.shm_mem == NULL )
>> +    {
>> +        d->arch.shm_mem = xzalloc(struct meminfo);
>> +        if ( d->arch.shm_mem == NULL )
>> +            return -ENOMEM;
>> +    }
>> +
>> +    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].start = start;
>> +    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].size = size;
>> +    d->arch.shm_mem->bank[d->arch.shm_mem->nr_banks].shm_id = shm_id;
>> +    d->arch.shm_mem->nr_banks++;

bank[] is a fixed size array. So we should check we don't overflow.

>> +
>> +    return 0;
>> +}
> 
> Can we call xfree(d->arch.shm_mem) at domain destruction?
> 
> Even better, we might be able to call it earlier, soon after the
> make_resv_memory_node() call because we don't need it any longer after
> that?

If this is only used during domain build, then the field should move to 
kernel_info. With that, there will also be no concern on whether we need 
to allocate the structure or not.

Cheers,

-- 
Julien Grall

