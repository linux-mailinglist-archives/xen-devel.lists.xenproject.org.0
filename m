Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F34A9C8B78
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 14:10:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836470.1252380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZbl-0007nd-Rw; Thu, 14 Nov 2024 13:10:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836470.1252380; Thu, 14 Nov 2024 13:10:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBZbl-0007jt-OF; Thu, 14 Nov 2024 13:10:01 +0000
Received: by outflank-mailman (input) for mailman id 836470;
 Thu, 14 Nov 2024 13:09:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tBZbj-0007g1-Hl
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 13:09:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBZbh-004r5a-07;
 Thu, 14 Nov 2024 13:09:57 +0000
Received: from [15.248.3.93] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tBZbh-004KLu-0E;
 Thu, 14 Nov 2024 13:09:57 +0000
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
	bh=CX7VjtXyC2w/+pGJmhfRYtRlN0a7EYxqtx2ifFC/mnI=; b=wiLg4l0s9U8HZiTu4L9TzcSC0T
	VxAGQ3EyzC7zG7MYTJ3gkNOHG0NqWmydeqeurNUURPrWUoEoH6ASYmK3nJeBn0I2NvHnB9gYuRxug
	zBkuOTmtWmn4/wwcFSNa7QYD+pGhnjH/5PuCuSCLDQjZj5DavdFAcBhXzeWnuQ8K8/to=;
Message-ID: <7eef8e7a-e2a1-41bd-8805-b00a2bc0ae1a@xen.org>
Date: Thu, 14 Nov 2024 13:09:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/device-tree: Allow exact match for overlapping
 regions
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <20241106134132.2185492-1-luca.fancellu@arm.com>
 <d9ad0972-2fd1-40ef-a11c-d56e102fef38@amd.com>
 <c6ba416c-5781-4f23-8623-5f30ce279a29@xen.org>
 <d87bd0a7-0dc8-44a9-b43e-04a166cb0b6d@amd.com>
 <91140571-9237-42dc-8eb1-2263bbb23b07@xen.org>
 <51c04e42-105b-4452-8dd1-dcc1f02c54a2@amd.com>
 <8d04f515-ae46-4b30-8a98-7822b0d221ed@xen.org>
 <alpine.DEB.2.22.394.2411131410240.222505@ubuntu-linux-20-04-desktop>
 <92564de9-24f7-4259-bc45-a95680101693@xen.org>
 <e023a861-a1d6-415e-9be8-688664bf5680@amd.com>
 <8e467912-a71a-4c10-91dc-46706ed7aa1e@xen.org>
 <7ba02037-05ec-491a-92c6-de7195d298ed@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7ba02037-05ec-491a-92c6-de7195d298ed@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/11/2024 12:22, Michal Orzel wrote:
> 
> 
> On 14/11/2024 13:04, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 14/11/2024 11:48, Michal Orzel wrote:
>>>
>>>
>>> On 14/11/2024 11:31, Julien Grall wrote:
>>>> Looking at the code, I think /memreserve/ and /reserved-memory are not
>>>> mapped in Xen and everything in /reserved-memory is mapped to dom0.
>>> Why do we forward /reserved-memory to dom0 fdt but /memreserve/ not?
>>
>> I was wondering the same. The main issue I can think of with
>> /memreserve/ is some of the regions will likely be for Xen own usage. So
> Can you give example of regions defined as reserved for Xen usage (other than static-mem)?

The spin table to bring-up CPUs.

> 
>> we would need to have a way to exclude them from dom0.
>>
>>   >  From the discussion> we're having it seems like we should treat them
>> equally. Also, looking at Luca patch,
>>> we seem to special case /memreserve/ and only allow for overlap /memresrve/ with boot modules
>>> and not /reserved-memory/ with boot modules. If we are going to claim that all the boot modules
>>> can be marked as reserved by the bootloader, then I think we should treat them equally providing
>>> the same experience to dom0.
>>
>> In my mind, /memreserved/ and /reserved-memory/ are different. The
>> former doesn't say what the region is for, but the latter will indicate it.
> In the context of this patch, I don't agree. We're discussing overlap, and if a region A
> from /memreserve/ overlaps fully with a module A, we know what is the purpose of it.
 > Today it's initrd, but as you say we cannot rule out other modules as 
well.

To give a concrete example, the /reserved-region/ can be used to reserve 
space for the VGA buffer. It would be odd that someone would put the 
boot module in the middle of the VGA buffer... If Xen ends up to use the 
VGA buffer (not the case today), then it would be a problem. Xen would 
need to be reworked to move all boot modules outside of the memory 
because it can access the VGA (or any other reserved regions).

The problem is slightly different for /memreserve/ because we don't 
exactly know what the regions are for until we parse the rest of the DT. 
Yes technically, a user could put the initrd in the wrong place. So the 
problem is the same. But this is a relexation I am more willing to 
accept over /reserved-region/ right now.

>> So I am not 100% sure how the bootmodule could end up in
>> /reserved-memory/ because they are described as part of the multiboot
>> modules. Do you have a scenario?
> I don't same as I don't have scenario for /memreserve/ overlapping with sth else than initrd.
> All of these comes from my validation of u-boot, grub, barebox code. I have a feeling that due to
> U-Boot trick that is not present in any other *known* bootloader, we are trying to over-engineer the problem :)
> But as Stefano and you wrote, we should follow the spec and for me we should therefore treat them equally.

See above why I don't think we should treat them equally today. We might 
be able in the future if we can categorize all the regions in /memreserve/.

[...]

>>> Last thing I wanted to ask (for my clarity) is that if bootloader loads initrd at region A and marks
>>> it as reserved (either in /memreserve/ or /reserved-memory/), and later on Xen copies initrd from region
>>> A to B, shouldn't the reserved memory region be updated to cover new region for initrd?
>>
>> If we mark the region has a reserved, then we are telling the OS it
>> can't use the region. But I am not sure why it would be needed as Xen
> Well, in the context of initrd, kernel uses it even though it is reserved. This is because
> of the second part of the spec where other bindings come into play.
> 
>> doesn't care how the regions is going to be used by the domain. From a
>> domain side, do you see any reason why we would want to mark again the
>> region as reserved?
> TBH I don't same as I still don't know why U-Boot does that trick. It comes from a very
> old code and my initial understanding is that it is done purely for U-boot bookkeeping.

/memreserve/ (and now) /reserved-regions/ are an easy way to find the 
regions that should be excluded from the RAM. Without that, you will 
need to have special case (such as for initrd, and the various xen boot 
moudles). I suspect that Linux have a special case and hence why it 
hasn't been a problem that Xen doesn't reserve the region.

Also, AFAIU, the Image protocol doesn't seem require the region to be 
reserved. It just says:

"""
If an initrd/initramfs is passed to the kernel at boot, it must reside
entirely within a 1 GB aligned physical memory window of up to 32 GB in
size that fully covers the kernel Image as well.

Any memory described to the kernel (even that below the start of the
image) which is not marked as reserved from the kernel (e.g., with a
memreserve region in the device tree) will be considered as available to
the kernel.
"""

Regarding the idea to mark the initird as reserved. My main concern is 
you now double the amount of memory that will be unusuable (AFAIU 
neither Xen nor Linux will be able to use the memory for allocations). I 
feel this is quite a steep price. A potential solution would to be map 
the initrd region rather than copying. Not sure how much code it will 
result, so someone will need to evaluate whether it is worth it.

Cheers,

-- 
Julien Grall


