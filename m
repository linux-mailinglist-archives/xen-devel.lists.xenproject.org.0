Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EC3675231
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 11:17:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481644.746680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoS3-0001zF-8k; Fri, 20 Jan 2023 10:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481644.746680; Fri, 20 Jan 2023 10:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIoS3-0001wb-5p; Fri, 20 Jan 2023 10:16:51 +0000
Received: by outflank-mailman (input) for mailman id 481644;
 Fri, 20 Jan 2023 10:16:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIoS1-0001wV-F1
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 10:16:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIoS0-0001gi-Uf; Fri, 20 Jan 2023 10:16:48 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[10.95.149.154]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIoS0-0006eF-Mw; Fri, 20 Jan 2023 10:16:48 +0000
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
	bh=idRSzmn58grgYyX7Dgqdd23kJOqbfAkKfv9jJU0eF3U=; b=k8ylPo7mljherSg481ZUyJx6l1
	9IblSgRzdgcaIeylHu6aeXsXJb35j7KgwG0XZrlN0x4x6lb8gU2MY3Qo0c/JEDqX4jhnBsDFe52RY
	eH1LCD4kEPZw/FYtPTuFwzDLYNM9jFRc4Z2fAdKyE9gZTAwx6pRl0qUL9bw8w2/9DuK8=;
Message-ID: <1a227f76-005d-0307-5161-2e8432171eb7@xen.org>
Date: Fri, 20 Jan 2023 10:16:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 04/11] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-5-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191514240.731018@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2301191532370.731018@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2301191532370.731018@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am answering to multiple e-mails at the same time.

On 19/01/2023 23:34, Stefano Stabellini wrote:
> On Thu, 19 Jan 2023, Stefano Stabellini wrote:
>> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>>> In future, we wish to support 32 bit physical address.
>>> However, one can only read u64 values from the DT. Thus, we need to

A cell in the DT is a 32-bit value. So you could read 32-bit value 
(address-size could be #1). It is just that our wrapper return 64-bit 
values because this is how we use the most.

>>> typecast the values appropriately from u64 to paddr_t.

C will perfectly be able to truncate a 64-bit to 32-bit value. So this 
is not a very good argument to explain why all of this is necessary.

>>>
>>> device_tree_get_reg() should now be able to return paddr_t. This is
>>> invoked by various callers to get DT address and size.
>>> Similarly, dt_read_number() is invoked as well to get DT address and
>>> size. The return value is typecasted to paddr_t.
>>> fdt_get_mem_rsv() can only accept u64 values. So, we provide a warpper

Typo: s/warpper/wrapper/

>>> for this called fdt_get_mem_rsv_paddr() which will do the necessary
>>> typecasting before invoking fdt_get_mem_rsv() and while returning.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>
>> I know we discussed this before and you implemented exactly what we
>> suggested, but now looking at this patch I think we should do the
>> following:
>>
>> - also add a wrapper for dt_read_number, something like
>>    dt_read_number_paddr that returns paddr

"number" and "paddr" pretty much means the same. I think it would be 
better to name it "dt_read_paddr".

>> - add a check for the top 32-bit being zero in all the wrappers
>>    (dt_read_number_paddr, device_tree_get_reg, fdt_get_mem_rsv_paddr)
>>    when paddr!=uint64_t. In case the top 32-bit are != zero I think we
>>    should print an error
>>
>> Julien, I remember you were concerned about BUG_ON/panic/ASSERT and I
>> agree with you there (especially considering Vikram's device tree
>> overlay series). So here I am only suggesting to check truncation and
>> printk a message, not panic. Would you be OK with that?

Aside dt_read_number(), I would expect that most of the helper can 
return an error. So if you want to check the truncation, then we should 
propagate the error.

>>
>> Last comment, maybe we could add fdt_get_mem_rsv_paddr to setup.h
>> instead of introducing xen/arch/arm/include/asm/device_tree.h, given
>> that we already have device tree definitions there
>> (device_tree_get_reg). I am OK either way.
>   
> Actually I noticed you also add dt_device_get_paddr to
> xen/arch/arm/include/asm/device_tree.h. So it sounds like it is a good
> idea to introduce xen/arch/arm/include/asm/device_tree.h, and we could
> also move the declarations of device_tree_get_reg, device_tree_get_u32
> there.

None of the helpers you mention sounds arm specific. So why should the 
be move an arch specific headers?

[...]

>>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>>> index 0085c28d74..f536a3f3ab 100644
>>> --- a/xen/arch/arm/bootfdt.c
>>> +++ b/xen/arch/arm/bootfdt.c
>>> @@ -11,9 +11,9 @@
>>>   #include <xen/efi.h>
>>>   #include <xen/device_tree.h>
>>>   #include <xen/lib.h>
>>> -#include <xen/libfdt/libfdt.h>
>>>   #include <xen/sort.h>
>>>   #include <xsm/xsm.h>
>>> +#include <asm/device_tree.h>
>>>   #include <asm/setup.h>
>>>   
>>>   static bool __init device_tree_node_matches(const void *fdt, int node,
>>> @@ -53,10 +53,15 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
>>>   }
>>>   
>>>   void __init device_tree_get_reg(const __be32 **cell, u32 address_cells,
>>> -                                u32 size_cells, u64 *start, u64 *size)
>>> +                                u32 size_cells, paddr_t *start, paddr_t *size)
>>>   {
>>> -    *start = dt_next_cell(address_cells, cell);
>>> -    *size = dt_next_cell(size_cells, cell);
>>> +    /*
>>> +     * dt_next_cell will return u64 whereas paddr_t may be u64 or u32. Thus, one
>>> +     * needs to cast paddr_t to u32. Note that we do not check for truncation as
>>> +     * it is user's responsibility to provide the correct values in the DT.
>>> +     */
>>> +    *start = (paddr_t) dt_next_cell(address_cells, cell);
>>> +    *size = (paddr_t) dt_next_cell(size_cells, cell);

There is no need for explicit cast here.

Cheers,

-- 
Julien Grall

