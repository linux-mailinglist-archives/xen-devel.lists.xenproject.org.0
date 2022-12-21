Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1494C652F57
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 11:23:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467769.726816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7wG8-0005sn-Fh; Wed, 21 Dec 2022 10:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467769.726816; Wed, 21 Dec 2022 10:23:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7wG8-0005pY-Ck; Wed, 21 Dec 2022 10:23:36 +0000
Received: by outflank-mailman (input) for mailman id 467769;
 Wed, 21 Dec 2022 10:23:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p7wG6-0005pG-9n
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 10:23:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7wG2-0006yg-Iw; Wed, 21 Dec 2022 10:23:30 +0000
Received: from [15.248.2.148] (helo=[10.24.67.14])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p7wG2-0001yu-6o; Wed, 21 Dec 2022 10:23:30 +0000
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
	bh=uEof8nACcA6pjn+SyCBwr0THlq0OvB/lzfnzdsEAyTo=; b=QcI8qSJDYUy584GiuFw/wmrLd6
	7Yr9DmKLe05916qBtspaf2ecPGv/1dO0AKl3sdrRlq0mUVVOac5e5C/Az+k+Kmip/s6kKeMFOwLFs
	rCTDvF872bffQlXZeJ3jD8XMNVK5jw7yL+8DDy36Gq47Q3SKLJwCos4MzYLmm9CkEBjA=;
Message-ID: <a2f2b0c4-5af3-1854-2180-f743f061a635@xen.org>
Date: Wed, 21 Dec 2022 10:23:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 03/22] acpi: vmap pages in acpi_os_alloc_memory
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-4-julien@xen.org>
 <9870c796-3b1c-e867-fb7c-532441cc30d2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9870c796-3b1c-e867-fb7c-532441cc30d2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/12/2022 15:15, Jan Beulich wrote:
> On 16.12.2022 12:48, Julien Grall wrote:
>> --- a/xen/common/vmap.c
>> +++ b/xen/common/vmap.c
>> @@ -244,6 +244,11 @@ void *vmap(const mfn_t *mfn, unsigned int nr)
>>       return __vmap(mfn, 1, nr, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
>>   }
>>   
>> +void *vmap_contig_pages(mfn_t mfn, unsigned int nr_pages)
> 
> I don't think the _pages suffix buys us much here. I also think parameter
> names would better be consistent with other functions here, in particular
> with vmap() (i.e. s/nr_pages/nr/).

I will do the renaming.

> 
>> --- a/xen/drivers/acpi/osl.c
>> +++ b/xen/drivers/acpi/osl.c
>> @@ -221,7 +221,11 @@ void *__init acpi_os_alloc_memory(size_t sz)
>>   	void *ptr;
>>   
>>   	if (system_state == SYS_STATE_early_boot)
>> -		return mfn_to_virt(mfn_x(alloc_boot_pages(PFN_UP(sz), 1)));
>> +	{
>> +		mfn_t mfn = alloc_boot_pages(PFN_UP(sz), 1);
>> +
>> +		return vmap_contig_pages(mfn, PFN_UP(sz));
>> +	}
> 
> Multiple pages may be allocated here, yet ...
> 
>> @@ -246,5 +250,10 @@ void __init acpi_os_free_memory(void *ptr)
>>   	if (is_xmalloc_memory(ptr))
>>   		xfree(ptr);
>>   	else if (ptr && system_state == SYS_STATE_early_boot)
>> -		init_boot_pages(__pa(ptr), __pa(ptr) + PAGE_SIZE);
>> +	{
>> +		paddr_t addr = mfn_to_maddr(vmap_to_mfn(ptr));
>> +
>> +		vunmap(ptr);
>> +		init_boot_pages(addr, addr + PAGE_SIZE);
>> +	}
> 
> ... (as before) only one page would be freed here. With the move to
> vmap() it ought to be possible to do better now. (If you want to
> defer this to a later patch, please at least mention the aspect in
> the description.)

Good point, I will have a look to solve it in this patch.

Cheers,

-- 
Julien Grall

