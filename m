Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BADA479193
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 17:39:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248776.429113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myGFf-0000BD-KO; Fri, 17 Dec 2021 16:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248776.429113; Fri, 17 Dec 2021 16:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myGFf-00008R-Fb; Fri, 17 Dec 2021 16:38:35 +0000
Received: by outflank-mailman (input) for mailman id 248776;
 Fri, 17 Dec 2021 16:38:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myGFd-00008K-TX
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 16:38:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myGFd-0007cD-EL; Fri, 17 Dec 2021 16:38:33 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myGFd-0007UU-8X; Fri, 17 Dec 2021 16:38:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:Subject:From:MIME-Version:Date:Message-ID;
	bh=72RA8RN7x9oWhqH1wtwABHZoPIY36UP9aF+QWShOjpQ=; b=P08QKMI5RhlwXb5hqPgF7VacWo
	UdQRaDf+PoyU2fO5qHd051AfGD0eNDAtt2+meIrgR+bmO39Oi3gWmWhtUxQN2/0d+MdP0XQwtX4xg
	4wZWBPTrZpsvyAXiCK2wJzhvQcUmGAQMiD2Zq7IyyyY7XBjjUiovCVamoGdRMxF/2Wys=;
Message-ID: <7924e699-5e70-6fdc-8633-6a15894d66db@xen.org>
Date: Fri, 17 Dec 2021 16:38:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Oleksandr <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <51104b62-14a1-79b8-1184-4f4d8418a2f6@gmail.com>
 <20211217132304.GA4041869@EPUAKYIW015D>
 <04263b01-85a1-a6cf-9c36-a31629caef12@xen.org>
 <20211217135855.GA4072899@EPUAKYIW015D>
In-Reply-To: <20211217135855.GA4072899@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/12/2021 13:58, Oleksii Moisieiev wrote:
> Hi Julien,

Hi,

> On Fri, Dec 17, 2021 at 01:37:35PM +0000, Julien Grall wrote:
>> Hi,
>>
>> On 17/12/2021 13:23, Oleksii Moisieiev wrote:
>>>>> +static int map_memory_to_domain(struct domain *d, uint64_t addr, uint64_t len)
>>>>> +{
>>>>> +    return iomem_permit_access(d, paddr_to_pfn(addr),
>>>>> +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
>>>>> +}
>>>>> +
>>>>> +static int unmap_memory_from_domain(struct domain *d, uint64_t addr,
>>>>> +                                     uint64_t len)
>>>>> +{
>>>>> +    return iomem_deny_access(d, paddr_to_pfn(addr),
>>>>> +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
>>>>> +}
>>>>
>>>> I wonder, why we need an extra level of indirection here. And if this is
>>>> really needed, I wonder why map(unmap)_memory* name was chosen, as there is
>>>> no memory mapping/unmapping really happens here.
>>>>
>>>
>>> I've added extra indirection to hide math like
>>> paddr_to_pfn(PAGE_ALIGN(addr + len -1)
>>> so you don't have to math in each call. unmap_memory_from_domain called
>>> from 2 places, so I moved both calls to separate function.
>>> Although, I agree that map/unmap is not perfect name. I consider
>>> renaming it to mem_permit_acces and mam_deny_access.
>>
>> I haven't looked at the rest of the series. But this discussion caught my
>> eye. This code implies that the address is page-aligned but the length not.
>> Is that intended?
>>
>> That said, if you give permission to the domain on a full page then it means
>> it may be able to access address it should not. Can you explain why this is
>> fine?
>>
> 
> The idea was that xen receives some memory from the dt_node linux,scmi_mem,
> then we split memory between the agents, so each agent get 1 page (we
> allocate 0x10 pages right now).

Thanks for the clarification. Does this imply the guest will be able to 
write message directly to the firmware?

If so, this brings a few more questions:
   1) What will the guest write in it? Can it contains addresses?
   2) What are the expected memory attribute for the regions?
   3) What's the threat model for the firmware? Will it verify every 
request?

Cheers,

-- 
Julien Grall

