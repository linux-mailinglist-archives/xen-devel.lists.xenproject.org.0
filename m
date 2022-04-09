Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012134FA670
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 11:30:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302139.515716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd7QP-00040e-QI; Sat, 09 Apr 2022 09:30:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302139.515716; Sat, 09 Apr 2022 09:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd7QP-0003yV-N6; Sat, 09 Apr 2022 09:30:33 +0000
Received: by outflank-mailman (input) for mailman id 302139;
 Sat, 09 Apr 2022 09:30:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nd7QO-0003yP-Vo
 for xen-devel@lists.xenproject.org; Sat, 09 Apr 2022 09:30:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nd7QO-0001gy-QQ; Sat, 09 Apr 2022 09:30:32 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nd7QO-0004MR-L2; Sat, 09 Apr 2022 09:30:32 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=0q9wc+dUtbtI/11yxD51N00qgvt9rlc7WiCMSXR84qM=; b=SRPcpJ5b/pDD13EblhKfuETSFr
	BapwVQGjdZnNiQdZLSX6OqjSFS0Dwr4v0fJLbjO/KeE/MPoxG5oFM/ebkiWNGaDJDsCy6RNVxVkxG
	3rj/BT6pbwJkAnqzS+dh1N8/ynsWjDYVsEKJxfDDYdHcaAWuF6wytKjRiUdAqIahK5ro=;
Message-ID: <b34727d4-1e8d-64fd-9d5e-84ed4255c320@xen.org>
Date: Sat, 9 Apr 2022 10:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 06/13] xen/arm: set up shared memory foreign mapping
 for borrower domain
From: Julien Grall <julien@xen.org>
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-7-Penny.Zheng@arm.com>
 <c4a3fb77-1cab-aacf-a2a5-3702f9c4ab97@xen.org>
In-Reply-To: <c4a3fb77-1cab-aacf-a2a5-3702f9c4ab97@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08/04/2022 23:59, Julien Grall wrote:
> On 11/03/2022 06:11, Penny Zheng wrote:
>> From: Penny Zheng <penny.zheng@arm.com>
>>
>> This commits introduces a new helper guest_physmap_add_shm to set up 
>> shared
>> memory foreign mapping for borrower domain.
>>
>> Firstly it should get and take reference of statically shared pages from
>> owner dom_shared. Then it will setup P2M foreign memory map of these 
>> statically
>> shared pages for borrower domain.
>>
>> This commits only considers owner domain is the default dom_shared, the
>> other scenario will be covered in the following patches.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> ---
>>   xen/arch/arm/domain_build.c | 52 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 52 insertions(+)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 984e70e5fc..8cee5ffbd1 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -798,6 +798,48 @@ static int __init allocate_shared_memory(struct 
>> domain *d,
>>       return ret;
>>   }
>> +static int __init guest_physmap_add_shm(struct domain *od, struct 
>> domain *bd,
>> +                                        unsigned long o_gfn,
>> +                                        unsigned long b_gfn,
>> +                                        unsigned long nr_gfns)
>> +{
>> +    struct page_info **pages = NULL;
>> +    p2m_type_t p2mt, t;
>> +    int ret = 0;
> 
> You don't need to initialize ret.
> 
>> +
>> +    pages = xmalloc_array(struct page_info *, nr_gfns);
>> +    if ( !pages )
>> +        return -ENOMEM;
>> +
>> +    /*
>> +     * Take reference of statically shared pages from owner domain.
>> +     * Reference will be released when destroying shared memory region.
>> +     */
>> +    ret = get_pages_from_gfn(od, o_gfn, nr_gfns, pages, &p2mt, 
>> P2M_ALLOC);
>> +    if ( ret )
>> +    {
>> +        ret = -EINVAL;
>> +        goto fail_pages;
>> +    }
>> +
>> +    if ( p2m_is_ram(p2mt) )
>> +        t = (p2mt == p2m_ram_rw) ? p2m_map_foreign_rw : 
>> p2m_map_foreign_ro;
>> +    else
>> +    {
>> +        ret = -EINVAL;
>> +        goto fail_pages;
> 
> Where would we release the references?
> 
>> +    }
>> +
>> +    /* Set up guest foreign map. */
>> +    ret = guest_physmap_add_pages(bd, _gfn(b_gfn), 
>> page_to_mfn(pages[0]),
>> +                                  nr_gfns, t);
> 
> A few things:
>    - The beginning of the code assumes that the MFN may be discontiguous 
> in the physical memory. But here, you are assuming they are contiguous. 
> If you want the latter, then you should check the MFNs are contiguous. 
> That said, I am not sure if this restriction is really necessary.
> 
>    - IIRC, guest_physmap_add_pages() doesn't revert the mappings. So you 
> need to revert it in case of failure.


There is another issue here. guest_physmap_add_pages() may use superpage 
mapping. The P2M code is currently assuming the foreing mapping will be 
using L3 mapping (4KB).

Do you need to use superpage mapping here?

Cheers,

-- 
Julien Grall

