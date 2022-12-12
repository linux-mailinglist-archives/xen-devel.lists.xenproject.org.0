Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B9864A857
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 21:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459916.717699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4oyW-0003lt-1l; Mon, 12 Dec 2022 20:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459916.717699; Mon, 12 Dec 2022 20:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4oyV-0003jx-VQ; Mon, 12 Dec 2022 20:00:31 +0000
Received: by outflank-mailman (input) for mailman id 459916;
 Mon, 12 Dec 2022 20:00:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4oyU-0003jr-Dp
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 20:00:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4oyU-00005Z-1U; Mon, 12 Dec 2022 20:00:30 +0000
Received: from [54.239.6.188] (helo=[192.168.19.227])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4oyT-0007Wi-RQ; Mon, 12 Dec 2022 20:00:29 +0000
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
	bh=F+uc8KgwheClBJe35ucdjLvGdB//FYxdioBiU8N4tvQ=; b=Pk/fPEX5YP9XdSNeFjfcXtI+dP
	xqEU/2aQ1hGqbEHUAB0JQ5quoyO/4GtY2gFiCU4w4M0H3pT33fGwAwOYBCfhn+QWeLYih0+2flH+a
	RdBBgnctIxluTwPjFNmoQHu8W+mhOSRQ1rYjfPaPauZGLadiM86e7U89EFiwK++uNIcs=;
Message-ID: <c2a6ecf2-b9cf-d068-fb89-0bd8ff43bafc@xen.org>
Date: Mon, 12 Dec 2022 20:00:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
 <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
 <e8aff19a-4992-9d35-4e78-9e64aec384f9@amd.com>
 <00ab59fa-d449-255b-bfe3-aaacb87e34dd@xen.org>
 <ca2db58b-0183-8972-0336-25bcabc99824@amd.com>
 <00793926-ef60-405b-e450-b42ccf939f5e@amd.com>
 <ba76ce47-b999-7daa-3248-0f0be6f49131@amd.com>
 <f69e17c7-ff85-636d-1176-1556cd1c519a@xen.org>
 <bc40d270-d29a-8a77-5f0a-fc343eefc816@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <bc40d270-d29a-8a77-5f0a-fc343eefc816@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/12/2022 19:04, Ayan Kumar Halder wrote:
> 
> On 09/12/2022 19:19, Julien Grall wrote:
>> Hi Ayan,
> 
> Hi Julien,

Hi,

> I checked with the Zephyr mantainers. Their response is provided [1].

Thanks for checking.

> 
>>
>> On 09/12/2022 19:10, Ayan Kumar Halder wrote:
>>>> zImage and Image are image protocols, uImage is not. It is just a 
>>>> legacy u-boot header (no requirements
>>>> \wrt booting,memory,registers, etc.). It can be added on top of 
>>>> anything (even vmlinux or a text file).
>>>> So I guess this is why Xen states that it supports zImage/Image and 
>>>> does not mention uImage.
>>>> A header is one thing, the boot requirements are another. Supporting 
>>>> uImage is ok but if we specify
>>>> that it must be a u-boot header added on top of zImage/Image.
>>>
>>> Let me first confine to Arm32 only.
>>>
>>> zephyr.bin has to be loaded at a fixed address with which it has been 
>>> built.
>>>
>>> So, we could either use zImage header (where 'start_address' can be 
>>> used to specify the load address).
>>>
>>> Or uImage (where -a  is used to specify the load address).
>>>
>>> Adding uImage header on top of zImage does not make sense.
>>>
>>> Now for Arm64,  we do need to parse the zImage header
>>>
>>> #ifdef CONFIG_ARM_64
>>>      if ( info->type == DOMAIN_64BIT )
>>>      {
>>>          return info->mem.bank[0].start + info->zimage.text_offset;
>>>      }
>>> #endif
>>>
>>> Again, adding uImage header on top of zImage header does not make 
>>> sense as well.
>>>
>>> Also, I believe zImage boot requirements are specific for linux kernel.
>>
>> Correct. But then this is what Xen tries to adhere to when preparing 
>> the guest. So...
>>
>>> zephyr or any other RTOS may not follow the same boot requirements.
>>
>> ... if Zephyr or any other RTOS have different requirements, then we 
>> may need to modify Xen.
>>
>> Can you describe the expectation of Zephyr for the following components:
>>   - State of the memory/cache:
>>     * Should the image be cleaned to PoC or more?
>>         * What about the area not part of the binary (e.g. BSS)?
>>         * What about the rest of the memory
> Zephyr is expected to run as a baremetal binary. When loading from Xen 
> or uboot, the interrupts should be disabled before jumping to Zephyr.
> 
> I/D caches need to be disabled as well.

For both 32-bit and 64-bit Linux, the instruction can may be on or off.

At the moment, Xen is choosing to disable it. But if that's a 
requirement for Zephyr, then I think we should document it.

That said, from the answer on the other thread, it was not clear whether 
this is a strong requirement or just because U-boot is doing it.

> 
> The image should be cleaned to PoC. The BSS is cleared as part of the 
> Zephyr boot process with z_bss_zero() and data is copied with 
> z_data_copy(), see [2] for more details.
> 
>>   - State of the co-processor registers:
>>         * Can we call the kernel with I-cache enabled?
> I cache needs to be disabled before calling kernel.

See above for the I-cache. However, this question was not only about the 
I-cache. It was just an example to what I am looking for in this category.

It might be easier if you read linux/Documentation/arm/booting.rst and 
let me know whether there is any expectation that don't match.

>>         * ...
>>   - State of the general purpose registers:
>>         * For instance, Linux expects a pointer to the device-tree in r0
> 
> Zephyr does not make any assumption about the state of the GPR at boot. 
> Also, Zephyr is built with a device tree.

Cheers,

-- 
Julien Grall

