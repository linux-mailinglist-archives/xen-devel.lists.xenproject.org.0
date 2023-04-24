Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A416EC7E7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 10:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525229.816306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrZY-0005vO-2G; Mon, 24 Apr 2023 08:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525229.816306; Mon, 24 Apr 2023 08:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqrZX-0005t2-Ue; Mon, 24 Apr 2023 08:29:19 +0000
Received: by outflank-mailman (input) for mailman id 525229;
 Mon, 24 Apr 2023 08:29:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pqrZW-0005sw-Iy
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 08:29:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pqrZV-0005Hg-Ui; Mon, 24 Apr 2023 08:29:17 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pqrZV-0007ET-PB; Mon, 24 Apr 2023 08:29:17 +0000
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
	bh=LW4g4gm/HXr9l2S7uxBRH827rDL7q3bN6gv3LqALDNY=; b=JZtDXH36RwAQRhG+TBOZGGkMd6
	abOlaBIHGxhJyjD799sZbj0pJkpaXzcDyk07GsNG+pQKKSYnUkYkvrEbIbEUaSn+qiXU5xmFEWVcJ
	QJAHYnt5/rHRdoNiXI7I+vMK9/Wiw1dHBxEV30n7VqbgVgxFSF41YKxzTH9N4BddocFI=;
Message-ID: <b5b3efd3-8a5d-31be-4919-2d621ef7000a@xen.org>
Date: Mon, 24 Apr 2023 09:29:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN v5 08/10] xen/arm: domain_build: Check if the address fits
 the range of physical address
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230413173735.48387-1-ayan.kumar.halder@amd.com>
 <20230413173735.48387-9-ayan.kumar.halder@amd.com>
 <3bd89851-e09d-1b24-6fde-5a13862f5eb2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3bd89851-e09d-1b24-6fde-5a13862f5eb2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/04/2023 08:44, Michal Orzel wrote:
> Hi Ayan,
> 
> On 13/04/2023 19:37, Ayan Kumar Halder wrote:
>>
>>
>> handle_pci_range() and map_range_to_domain() take addr and len as uint64_t
>> parameters. Then frame numbers are obtained from addr and len by right shifting
>> with PAGE_SHIFT. The page frame numbers are saved using unsigned long.
> Maybe better to say "expressed" rather than "saved"
> 
>>
>> Now if 64-bit >> PAGE_SHIFT, the result will have 52-bits as valid. On a 32-bit
>> system, 'unsigned long' is 32-bits. Thus, there is a potential loss of value
>> when the result is stored as 'unsigned long'.
>>
>> To mitigate this issue, we check if the starting and end address can be
>> contained within the range of physical address supported on the system. If not,
>> then an appropriate error is returned.
>>
>> Also, the end address is computed once and used when required. And replaced u64
>> with uint64_t.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from :-
>> v1...v4 - NA. New patch introduced in v5.
>>
>>   xen/arch/arm/domain_build.c | 30 +++++++++++++++++++++++-------
>>   1 file changed, 23 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 7d28b75517..b98ee506a8 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1637,15 +1637,23 @@ out:
>>   }
>>
>>   static int __init handle_pci_range(const struct dt_device_node *dev,
>> -                                   u64 addr, u64 len, void *data)
>> +                                   uint64_t addr, uint64_t len, void *data)
>>   {
>>       struct rangeset *mem_holes = data;
>>       paddr_t start, end;
>>       int res;
>> +    uint64_t end_addr = addr + len - 1;
>> +
>> +    if ( addr != (paddr_t)addr || end_addr != (paddr_t)end_addr )
>> +    {
>> +        printk(XENLOG_ERR "addr (0x%"PRIx64") or end_addr (0x%"PRIx64") exceeds the maximum allowed width (%d bits) for physical address\n",
> I don't think it is wise to print variable names (end_addr) to the user. Better would be to say explicitly: start, end address.
> Also to make the message shorter you could write: ... exceeds the maximum allowed PA width (%u bits)
> 
>> +               addr, end_addr, CONFIG_PADDR_BITS);
> Why CONFIG_PADDR_BITS if you already introduced PADDR_BITS macro
> 
>> +        return -ERANGE;
>> +    }
>>
>>       start = addr & PAGE_MASK;
>> -    end = PAGE_ALIGN(addr + len);
>> -    res = rangeset_remove_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end - 1));
>> +    end = PAGE_ALIGN(end_addr);
>> +    res = rangeset_remove_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end));
> I doubt PFN_DOWN(end) is the same as PFN_DOWN(end - 1), so I think you should keep the behavior as it was
> 
>>       if ( res )
>>       {
>>           printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
>> @@ -2330,11 +2338,19 @@ static int __init map_dt_irq_to_domain(const struct dt_device_node *dev,
>>   }
>>
>>   int __init map_range_to_domain(const struct dt_device_node *dev,
>> -                               u64 addr, u64 len, void *data)
>> +                               uint64_t addr, uint64_t len, void *data)
> You changed u64 to uint64_t in a definition but not in a prototype. Please fix.

This function is used as a callback. So if you want to switch from u64 
to uint64_t then you should also update dt_for_each_range().

Such changes would need to be done in a separate patch.

Cheers,

-- 
Julien Grall

