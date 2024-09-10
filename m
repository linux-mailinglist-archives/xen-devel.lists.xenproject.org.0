Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521A49744E8
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 23:35:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796062.1205563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so8V9-0000Qd-28; Tue, 10 Sep 2024 21:34:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796062.1205563; Tue, 10 Sep 2024 21:34:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so8V8-0000OF-V8; Tue, 10 Sep 2024 21:34:18 +0000
Received: by outflank-mailman (input) for mailman id 796062;
 Tue, 10 Sep 2024 21:34:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1so8V7-0000O9-FL
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 21:34:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1so8V6-0001Qq-Tb; Tue, 10 Sep 2024 21:34:16 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1so8V6-0003MR-Il; Tue, 10 Sep 2024 21:34:16 +0000
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
	bh=qyhZxF3oStrhdmeoQgwOkJE+zJ3IvsBuTjj7DhdVfME=; b=D670pdfYapPkzhcLXkb15Mg+3i
	WYTjKggmv/sglsL/3ZkAtuWyJ/ixhamfZk9I2kLu0dS2+uYVg5EQDzD5wZ9Y/aDu7i+CXMVqCZWtb
	zHS2zgDXg00OFnKh+nh0uO3v30HvO7PHVL7ThZuBLF7G2Ipgb+QihAQZ+I10pEryOTyU=;
Message-ID: <65b9d244-8659-4cd5-828e-a2290b746519@xen.org>
Date: Tue, 10 Sep 2024 22:34:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-3-ayan.kumar.halder@amd.com>
 <efc024ad-1e1c-45d0-9511-cc0c082dfef7@xen.org>
 <c0de7e6c-43d0-46ec-8cf7-ba1855caac82@amd.com>
 <c375468f-fc1d-42d2-91bb-7878f0300c55@xen.org>
 <7021af49-a409-46c1-993b-4ddd7975564d@amd.com>
 <0533aee4-1b08-4714-b497-a4df70703895@xen.org>
 <5583411c-aad5-45d0-97be-f0d630afbca1@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5583411c-aad5-45d0-97be-f0d630afbca1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 10/09/2024 14:42, Ayan Kumar Halder wrote:
> 
> On 09/09/2024 15:45, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 09/09/2024 11:29, Ayan Kumar Halder wrote:
>>>
>>> On 08/09/2024 22:13, Julien Grall wrote:
>>>> Hi,
>>> Hi Julien,
>>>>
>>>> On 02/09/2024 15:48, Ayan Kumar Halder wrote:
>>>
>>>>> I will rephrase this as ...
>>>>>
>>>>> "Used to set customized address at which which Xen will be linked
>>>>>
>>>>> on MPU systems. This address must be aligned to a page size.
>>>>> 0xFFFFFFFF is used as the default value to indicate that user hasn't
>>>>> customized this address."
>>>>
>>>> Reading this comment, I would like to ask some clarification. In the 
>>>> context of the MPU how do you define a page size? The definition is 
>>>> pretty clear when using the MMU because the granularity if defined 
>>>> by the HW. But for the MPU, it is a bit blur. Is it still 4KB? If 
>>>> so, is it actually realistic (we don't have that many MPU regions)?
>>>
>>>  From ARM DDI 0600A.d ID120821, C1.1.1 Protection regions
>>>
>>> "Protection regions have a minimum size of 64 bytes."
>>>
>>> Thus, I would infer that the minimum page size (in context of MPU) is 
>>> 64 bytes.
>> > > Also, if you see the register fields of PRBAR and PRLAR, the lower 6
> yes.
>>> bits are 0 extended to provide the address.
>>>
>>> So, may be I should say
>>>
>>> ".... address must be aligned to the minimum region size (ie 64 
>>> bytes). 0xFFFFFFFF is used ...."
>>>
>>>
>>> Let me know if this sounds ok.
>>
>> So what you provided is a minimum size/alignment of a region from the 
>> HW point of view. How about Xen? Will it be able to cope if Xen is 
>> booted at a 64-byte alignment?
>>
>> Asking because it is unclear how the allocator will work with the MPU. 
>> Are we going to continue to allocate 4KB chunk at the time? Will it be 
>> smaller/larger?
> 
> MPU will work with static memory allocation only. It can allocate a 
> fixed number of regions using PRBAR and PRLAR. We can make the addresses 
> to be page aligned (ie 4KB) so that it is in parity with MMU. And we 
> will keep the page size as 4 KB.  It makes sense to use the same page 
> size to do the allocation irrespective of MPU or MMU. Also, it helps to 
> keep a large part of the code as common.

TL;DR: I think we can use different chunk size (I find "page" confusing 
in the context of the MPU) and still sharing a large part of Xen. For 
now, I would be ok to use the same size. In the future, it would be 
beneficial to change it.

Now the longer answer. Looking at the specification, the architecture 
allows up to 128 regions. So the chance we will want to share a 4KB RAM 
region at the time is close to zero.

Yet we would still have one struct page_info per 4KB chunk to carry the 
metadata. This is not only going to be a waste of memory but also 
requires extra work. So to me it would make more sense to track larger 
chunk (maybe 2MB).

Now regarding the change necessary in Xen. I think we can divide it in 
two parts:
   * Allocation within region
   * Frame in the public interface

For the first part, Xen on Arm is now mainly page agnostic. So you could 
bump the PAGE_SIZE (barring the public interface see below) without any 
trouble. You may have to deal with extra memory wasted when using 
alloc_*heap_page*(). But that could be easily solved by using xmalloc() 
and/or introduce new wrappers.

For the frame definition in the public interface. So far, a frame covers 
4KB (same as Xen page granularity) and this is bake into OSes (Xen 
doesn't have a way to return the page granularity used). So for the MMU, 
you sadly can't easily increase the page granularity used by Xen...

However for the MPU I think this is a different story. The bulk of the 
interface using frame number (such as increase/decrease memory) are not 
applicable for the MPU or would be unusable/severely limited (e.g grant 
table) given the number of MPU regions available.

Anyway, I am probably thinking quite far ahead :). For now, I am fine if 
you want to use 4KB chunk. So in the Kconfig you could write "Xen start 
address should be 4KB aligned" (let's not mention page).

Cheers,

-- 
Julien Grall


