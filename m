Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E1F381ABC
	for <lists+xen-devel@lfdr.de>; Sat, 15 May 2021 21:12:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127861.240200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhzhD-0006D4-To; Sat, 15 May 2021 19:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127861.240200; Sat, 15 May 2021 19:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhzhD-0006BE-Pu; Sat, 15 May 2021 19:11:31 +0000
Received: by outflank-mailman (input) for mailman id 127861;
 Sat, 15 May 2021 19:11:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lhzhB-0006B4-VC
 for xen-devel@lists.xenproject.org; Sat, 15 May 2021 19:11:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhzhB-0005gE-PR; Sat, 15 May 2021 19:11:29 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lhzhB-0003qR-JZ; Sat, 15 May 2021 19:11:29 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=8i4vi/4f3EfQcOXxuDrH+O6VCvyUFJjoTdfDRUWQMuk=; b=wYRzgMHAHg/4ziyltnKC8WNNgS
	55CMEILoHwhZbzIH0Qa2zUuTLMl4ENo5yankA8ScckD+YnwnN35hDMkFRuWsxxzLP+TpYeOf6cM3a
	XN/cChEAMcNkZSuxtd+rQHsIwqQNrEEDU1YYQ5Jy0Kf/mICN/Qt7WNWJiwtKlVdU2Bk8=;
Subject: Re: Discussion of Xenheap problems on AArch64
To: Henry Wang <Henry.Wang@arm.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
 <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <f14aa1d6-35d2-a9a3-0672-7f0d3ae3ec89@xen.org>
 <PA4PR08MB62534C4130B59CAA9A8A8BF792419@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <PA4PR08MB6253FBC7F5E690DB74F2E11F92409@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <2a65b8c0-fccc-2ccc-f736-7f3f666e84d1@xen.org>
 <PA4PR08MB62537A958107CD234831E0B892579@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <ba649865-410b-e1be-39a3-c4cac802f464@xen.org>
 <PA4PR08MB6253F85E184CA51BDB99786992539@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <ba1bc084-5a5b-1410-acba-33bfca7c4f6a@xen.org>
 <PA4PR08MB6253E95579D8277D7FD1BE9A92509@PA4PR08MB6253.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7247122c-127d-705c-78a5-7f9460f5821a@xen.org>
Date: Sat, 15 May 2021 20:11:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <PA4PR08MB6253E95579D8277D7FD1BE9A92509@PA4PR08MB6253.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Henry,

On 14/05/2021 05:35, Henry Wang wrote:
>> From: Julien Grall <julien@xen.org>
> Hi Julien,
> 
>>
>> On 11/05/2021 02:11, Henry Wang wrote:
>>> Hi Julien,
>> Hi Henry,
>>>
>>>> From: Julien Grall <julien@xen.org>
>>>> Hi Henry,
>>>>
>>>> On 07/05/2021 05:06, Henry Wang wrote:
>>>>>> From: Julien Grall <julien@xen.org>
>>>>>> On 28/04/2021 10:28, Henry Wang wrote:
>>>> [...]
>>>>
>>>>> when I continue booting Xen, I got following error log:
>>>>>
>>>>> (XEN) Xen call trace:
>>>>> (XEN)    [<00000000002b5a5c>] alloc_boot_pages+0x94/0x98 (PC)
>>>>> (XEN)    [<00000000002ca3bc>] setup_frametable_mappings+0xa4/0x108
>>>> (LR)
>>>>> (XEN)    [<00000000002ca3bc>] setup_frametable_mappings+0xa4/0x108
>>>>> (XEN)    [<00000000002cb988>] start_xen+0x344/0xbcc
>>>>> (XEN)    [<00000000002001c0>]
>>>> arm64/head.o#primary_switched+0x10/0x30
>>>>> (XEN)
>>>>> (XEN) ****************************************
>>>>> (XEN) Panic on CPU 0:
>>>>> (XEN) Xen BUG at page_alloc.c:432
>>>>> (XEN) ****************************************
>>>>
>>>> This is happening without my patch series applied, right? If so, what
>>>> happen if you apply it?
>>>
>>> No, I am afraid this is with your patch series applied, and that is why I
>>> am a little bit confused about the error log...
>>
>> You are hitting the BUG() at the end of alloc_boot_pages(). This is hit
>> because the boot allocator couldn't allocate memory for your request.
>>
>> Would you be able to apply the following diff and paste the output here?
> 
> Thank you, of course yes, please see below output attached :)
> 
>>
>> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
>> index ace6333c18ea..dbb736fdb275 100644
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -329,6 +329,8 @@ void __init init_boot_pages(paddr_t ps, paddr_t pe)
>>        if ( pe <= ps )
>>            return;
>>
>> +    printk("%s: ps %"PRI_paddr" pe %"PRI_paddr"\n", __func__, ps, pe);
>                                                ^ FYI: I have to change this PRI_paddr to PRIpaddr
>                                                   to make compiler happy

Ah yes, we don't have a variant with _. I thought compiled test before 
sending it :(.

> 
>> +
>>        first_valid_mfn = mfn_min(maddr_to_mfn(ps), first_valid_mfn);
>>
>>        bootmem_region_add(ps >> PAGE_SHIFT, pe >> PAGE_SHIFT);
>> @@ -395,6 +397,8 @@ mfn_t __init alloc_boot_pages(unsigned long nr_pfns,
>> unsigned long pfn_align)
>>        unsigned long pg, _e;
>>        unsigned int i = nr_bootmem_regions;
>>
>> +    printk("%s: nr_pfns %lu pfn_align %lu\n", __func__, nr_pfns,
>> pfn_align);
>> +
>>        BUG_ON(!nr_bootmem_regions);
>>
>>        while ( i-- )
>>
> 
> I also added some printk to make sure the dtb is parsed correctly, and for the
> Error case, I get following log:

Thank you for the log.

> 
> (XEN) ----------banks=2--------
> (XEN) ----------start=80000000--------
> (XEN) ----------size=7F000000--------
> (XEN) ----------start=F900000000--------
> (XEN) ----------size=80000000--------
> (XEN) Checking for initrd in /chosen
> (XEN) RAM: 0000000080000000 - 00000000feffffff
> (XEN) RAM: 000000f900000000 - 000000f97fffffff
> (XEN)
> (XEN) MODULE[0]: 0000000084000000 - 00000000841464c8 Xen
> (XEN) MODULE[1]: 00000000841464c8 - 0000000084148c9b Device Tree
> (XEN) MODULE[2]: 0000000080080000 - 0000000081080000 Kernel
> (XEN)  RESVD[0]: 0000000080000000 - 0000000080010000
> (XEN)
> (XEN) Command line: noreboot dom0_mem=1024M console=dtuart
> dtuart=serial0 bootscrub=0
> (XEN) PFN compression on bits 21...22
> (XEN) init_boot_pages: ps 0000000080010000 pe 0000000080080000

The size of this region is 448MB.

> (XEN) init_boot_pages: ps 0000000081080000 pe 0000000084000000

The size of this region is 47MB.

> (XEN) init_boot_pages: ps 0000000084149000 pe 00000000ff000000

The size of this region is 1966MB.


> (XEN) alloc_boot_pages: nr_pfns 1 pfn_align 1
> (XEN) alloc_boot_pages: nr_pfns 1 pfn_align 1
> (XEN) alloc_boot_pages: nr_pfns 1 pfn_align 1
> (XEN) init_boot_pages: ps 000000f900000000 pe 000000f980000000

The size of this region is 2048MB.

> (XEN) alloc_boot_pages: nr_pfns 909312 pfn_align 8192

This is asking for 3552MB of contiguous memory which cannot be 
accommodated. In any case, this is quite a large region to ask.

Same...

> (XEN) Xen BUG at page_alloc.c:436
> 
> To compare with the maximum start address (f800000000) of second part mem
> where xen boots correctly, I also attached the log for your information:
> 
> (XEN) ----------banks=2--------
> (XEN) ----------start=80000000--------
> (XEN) ----------size=7F000000--------
> (XEN) ----------start=F800000000--------
> (XEN) ----------size=80000000--------
> (XEN) Checking for initrd in /chosen
> (XEN) RAM: 0000000080000000 - 00000000feffffff
> (XEN) RAM: 000000f800000000 - 000000f87fffffff
> (XEN)
> (XEN) MODULE[0]: 0000000084000000 - 00000000841464c8 Xen
> (XEN) MODULE[1]: 00000000841464c8 - 0000000084148c9b Device Tree
> (XEN) MODULE[2]: 0000000080080000 - 0000000081080000 Kernel
> (XEN)  RESVD[0]: 0000000080000000 - 0000000080010000
> (XEN)
> (XEN) Command line: noreboot dom0_mem=1024M console=dtuart
> dtuart=serial0 bootscrub=0
> (XEN) PFN compression on bits 20...22
> (XEN) init_boot_pages: ps 0000000080010000 pe 0000000080080000
> (XEN) init_boot_pages: ps 0000000081080000 pe 0000000084000000
> (XEN) init_boot_pages: ps 0000000084149000 pe 00000000ff000000
> (XEN) alloc_boot_pages: nr_pfns 1 pfn_align 1
> (XEN) alloc_boot_pages: nr_pfns 1 pfn_align 1
> (XEN) alloc_boot_pages: nr_pfns 1 pfn_align 1
> (XEN) init_boot_pages: ps 000000f800000000 pe 000000f880000000
> (XEN) alloc_boot_pages: nr_pfns 450560 pfn_align 8192

... here. We are trying to allocate a 1.5GB frametable. You have only 
4GB of memory so the frametable should be a lot smaller (few tens of MB).

This is happening because PDX is not able to find many bits to compress.
I am not sure we can compress more with the current PDX algorithm. This 
may require some extensive improvement to reduce the footprint.

On a previous e-mail, you said you tweaked the FVP model to set those 
regions. Were you trying to mimick the memory layout of a real HW 
(either current or future)?

Cheers,

-- 
Julien Grall

