Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0856E478C71
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 14:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248643.428871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myDQZ-00014e-Na; Fri, 17 Dec 2021 13:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248643.428871; Fri, 17 Dec 2021 13:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myDQZ-00011K-Kj; Fri, 17 Dec 2021 13:37:39 +0000
Received: by outflank-mailman (input) for mailman id 248643;
 Fri, 17 Dec 2021 13:37:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1myDQX-00011E-Vs
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 13:37:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myDQX-0003od-Nq; Fri, 17 Dec 2021 13:37:37 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.25.72]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1myDQX-0003AM-HY; Fri, 17 Dec 2021 13:37:37 +0000
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
	bh=difhpwWhOVdVIGhA5PVLpgFFxogfn/LcSrtVo9Re0BI=; b=qeA4NJPc87FFGHtO/gMIpstuyW
	faluuij9N1AcJA9n5zUZF4bQnxoFTgBxMj+aF0ymZOgMZkUJ9iWd9rQq65zt8dpg3sTa4vHjH7Hcu
	9MMlfUhbhfBI+jwq77gxeK/WNaVUyIPc0NGeIDHW+48A7CWpxOxH9p3j9Z8VRj2791JA=;
Message-ID: <04263b01-85a1-a6cf-9c36-a31629caef12@xen.org>
Date: Fri, 17 Dec 2021 13:37:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 Oleksandr <olekstysh@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <51104b62-14a1-79b8-1184-4f4d8418a2f6@gmail.com>
 <20211217132304.GA4041869@EPUAKYIW015D>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211217132304.GA4041869@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/12/2021 13:23, Oleksii Moisieiev wrote:
>>> +static int map_memory_to_domain(struct domain *d, uint64_t addr, uint64_t len)
>>> +{
>>> +    return iomem_permit_access(d, paddr_to_pfn(addr),
>>> +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
>>> +}
>>> +
>>> +static int unmap_memory_from_domain(struct domain *d, uint64_t addr,
>>> +                                     uint64_t len)
>>> +{
>>> +    return iomem_deny_access(d, paddr_to_pfn(addr),
>>> +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
>>> +}
>>
>> I wonder, why we need an extra level of indirection here. And if this is
>> really needed, I wonder why map(unmap)_memory* name was chosen, as there is
>> no memory mapping/unmapping really happens here.
>>
> 
> I've added extra indirection to hide math like
> paddr_to_pfn(PAGE_ALIGN(addr + len -1)
> so you don't have to math in each call. unmap_memory_from_domain called
> from 2 places, so I moved both calls to separate function.
> Although, I agree that map/unmap is not perfect name. I consider
> renaming it to mem_permit_acces and mam_deny_access.

I haven't looked at the rest of the series. But this discussion caught 
my eye. This code implies that the address is page-aligned but the 
length not. Is that intended?

That said, if you give permission to the domain on a full page then it 
means it may be able to access address it should not. Can you explain 
why this is fine?

Cheers,

-- 
Julien Grall

