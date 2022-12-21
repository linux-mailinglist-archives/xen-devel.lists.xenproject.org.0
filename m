Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F01D3652F3A
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 11:18:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467733.726772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7wAy-0002j4-0Y; Wed, 21 Dec 2022 10:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467733.726772; Wed, 21 Dec 2022 10:18:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7wAx-0002gs-Tt; Wed, 21 Dec 2022 10:18:15 +0000
Received: by outflank-mailman (input) for mailman id 467733;
 Wed, 21 Dec 2022 10:18:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7wAw-0002gk-VG
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 10:18:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7wAo-0006p4-Ba; Wed, 21 Dec 2022 10:18:06 +0000
Received: from [15.248.2.148] (helo=[10.24.67.14])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7wAo-0001j5-51; Wed, 21 Dec 2022 10:18:06 +0000
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
	bh=O/omIncHSLLIFR+U4BaeNkyd/Rt2yA8kiPLAFkIS5RE=; b=Cp3Kmbbd3TTsp/VGa5CyWUWNww
	4b2EnJ74wYxPndZnNK6hzJCwpIcnMGpurfXjqI5kV5lk1lXBB4h3IBySOhabN+Fr+cTKYrgEu4+QX
	+HuvG7MU7eVbww8SneUlfdAi/uS2MlQ+PbkkUk2/99/aW8+8tWUpuGcQAtl84fRsJtW0=;
Message-ID: <3c641a2b-01ef-335f-59e8-b65b2108c9eb@xen.org>
Date: Wed, 21 Dec 2022 10:18:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 02/22] x86/setup: move vm_init() before acpi calls
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 David Woodhouse <dwmw2@amazon.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-3-julien@xen.org>
 <92d82899-4e74-8638-4a60-09104ba16c9a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <92d82899-4e74-8638-4a60-09104ba16c9a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/12/2022 15:08, Jan Beulich wrote:
> On 16.12.2022 12:48, Julien Grall wrote:
>> From: Wei Liu <wei.liu2@citrix.com>
>>
>> After the direct map removal, pages from the boot allocator are not
>> mapped at all in the direct map. Although we have map_domain_page, they
> 
> Nit: "will not be mapped" or "are not going to be mapped", or else this
> sounds like there's a bug somewhere.

I will update.

> 
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -870,6 +870,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>       unsigned long eb_start, eb_end;
>>       bool acpi_boot_table_init_done = false, relocated = false;
>>       int ret;
>> +    bool vm_init_done = false;
> 
> Can this please be grouped with the other bool-s (even visible in context)?
>> --- a/xen/common/vmap.c
>> +++ b/xen/common/vmap.c
>> @@ -34,9 +34,20 @@ void __init vm_init_type(enum vmap_region type, void *start, void *end)
>>   
>>       for ( i = 0, va = (unsigned long)vm_bitmap(type); i < nr; ++i, va += PAGE_SIZE )
>>       {
>> -        struct page_info *pg = alloc_domheap_page(NULL, 0);
>> +        mfn_t mfn;
>> +        int rc;
>>   
>> -        map_pages_to_xen(va, page_to_mfn(pg), 1, PAGE_HYPERVISOR);
>> +        if ( system_state == SYS_STATE_early_boot )
>> +            mfn = alloc_boot_pages(1, 1);
>> +        else
>> +        {
>> +            struct page_info *pg = alloc_domheap_page(NULL, 0);
>> +
>> +            BUG_ON(!pg);
>> +            mfn = page_to_mfn(pg);
>> +        }
>> +        rc = map_pages_to_xen(va, mfn, 1, PAGE_HYPERVISOR);
>> +        BUG_ON(rc);
> 
> The adding of a return value check is unrelated and not overly useful:
> 
>>           clear_page((void *)va);
> 
> This will fault anyway if the mapping attempt failed.

Not always. At least on Arm, map_pages_to_xen() could fail if the VA was 
mapped to another physical address.

This seems unlikely, yet I think that relying on clear_page() to always 
fail when map_pages_to_xen() return an error is bogus.

Cheers,

-- 
Julien Grall

