Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72C74F0524
	for <lists+xen-devel@lfdr.de>; Sat,  2 Apr 2022 19:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297835.507376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nah8x-0003ex-L9; Sat, 02 Apr 2022 17:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297835.507376; Sat, 02 Apr 2022 17:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nah8x-0003d8-Gy; Sat, 02 Apr 2022 17:02:31 +0000
Received: by outflank-mailman (input) for mailman id 297835;
 Sat, 02 Apr 2022 17:02:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nah8w-0003d2-Aw
 for xen-devel@lists.xenproject.org; Sat, 02 Apr 2022 17:02:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nah8v-0006Ge-To; Sat, 02 Apr 2022 17:02:29 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nah8v-0007is-O1; Sat, 02 Apr 2022 17:02:29 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=61zOOhq4fMWl0c3FHL17jaeRFSyxSn+t6WbxNFd6Na8=; b=eixzIrQZuwv+unLqFlJVnnUjEo
	jjey82XN5Q28RY1+1JOh9sR/vcbmxEWjdDe6C36qqMVU7Re3F7raF5u7Tl97/Yshnk95m5NtEnvnZ
	C9yKTaTjXzDtaPCFznEoC6xF8JRq3k+lK2HmSy1tk/MNOzyqVfCvs2zR1y/ez3NTro6E=;
Message-ID: <7e57f963-40a0-49e4-84a3-04b17dfc8497@xen.org>
Date: Sat, 2 Apr 2022 18:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-9-julien@xen.org>
 <alpine.DEB.2.22.394.2204011709140.2910984@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 08/19] xen/arm: mm: Re-implement early_fdt_map() using
 map_pages_to_xen()
In-Reply-To: <alpine.DEB.2.22.394.2204011709140.2910984@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 02/04/2022 01:10, Stefano Stabellini wrote:
> On Mon, 21 Feb 2022, Julien Grall wrote:
>> From: Julien Grall <julien.grall@arm.com>
>>
>> Now that map_pages_to_xen() has been extended to support 2MB mappings,
>> we can replace the create_mappings() calls by map_pages_to_xen() calls.
>>
>> The mapping can also be marked read-only has Xen as no business to
>> modify the host Device Tree.
>>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>      Changes in v2:
>>          - Add my AWS signed-off-by
>>          - Fix typo in the commit message
>> ---
>>   xen/arch/arm/mm.c | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index f088a4b2de96..24de8dcb9042 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -559,6 +559,7 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>>       paddr_t offset;
>>       void *fdt_virt;
>>       uint32_t size;
>> +    int rc;
>>   
>>       /*
>>        * Check whether the physical FDT address is set and meets the minimum
>> @@ -574,8 +575,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>>       /* The FDT is mapped using 2MB superpage */
>>       BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
>>   
>> -    create_mappings(xen_second, BOOT_FDT_VIRT_START, paddr_to_pfn(base_paddr),
>> -                    SZ_2M >> PAGE_SHIFT, SZ_2M);
>> +    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
>> +                          SZ_2M >> PAGE_SHIFT,
>> +                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
>> +    if ( rc )
>> +        panic("Unable to map the device-tree.\n");
>> +
>>   
>>       offset = fdt_paddr % SECOND_SIZE;
>>       fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
>> @@ -589,9 +594,12 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
>>   
>>       if ( (offset + size) > SZ_2M )
>>       {
>> -        create_mappings(xen_second, BOOT_FDT_VIRT_START + SZ_2M,
>> -                        paddr_to_pfn(base_paddr + SZ_2M),
>> -                        SZ_2M >> PAGE_SHIFT, SZ_2M);
>> +        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
>> +                              maddr_to_mfn(base_paddr + SZ_2M),
>> +                              SZ_2M >> PAGE_SHIFT,
>> +                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
>> +        if ( rc )
>> +            panic("Unable to map the device-tree\n");
>>       }
> 
> Very good! :-)
> 
> I have a small preference for making the change to PAGE_HYPERVISOR_RO in
> a separate patch because it would make it easier to revert in the
> future if we need so (e.g. overlays...). But it is OK either way.

The mapping is only used for early boot. For runtime we are relocating 
the FDT and it is writable.

That said, I don't think the FDT should ever be writable. The size of 
the FDT is bounded and therefore you will likely not be able to add a 
new property/node without relocating it.

I haven't looked at latest DT overlay series. But in the previous 
version I was under the impression that only the unflatten version would 
be touched. IOW, the flatten version would be untouched. Can you confirm 
this is still the case?

Cheers,

-- 
Julien Grall

