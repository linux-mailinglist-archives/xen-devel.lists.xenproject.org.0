Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B891F68AE
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 15:07:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjMuF-00070s-QL; Thu, 11 Jun 2020 13:06:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TmH/=7Y=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jjMuE-00070n-FP
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 13:06:06 +0000
X-Inumbo-ID: 4f0db6f2-abe4-11ea-b51a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f0db6f2-abe4-11ea-b51a-12813bfff9fa;
 Thu, 11 Jun 2020 13:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AV9tQ1bDV001zmsJa2JdJ89QPTOdYVa5XHEsaRAsYhw=; b=EP157dByfpSeQLb0PjLinARZBs
 Top/53I+9SnnFMPsHjZDr/pMXUFAxh/EYnKkWkq6FSuoXVo7TBvGvXwdvpxEJzLXjcpXtimMcFKLB
 Mup84u5D9W+xVmUoFZ3w2qMtQZXqYsr3EhQuHHg+rIAeioeXYl57edM2ymH3iSEZyHMk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjMuC-0004FU-CR; Thu, 11 Jun 2020 13:06:04 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jjMuC-00065w-5p; Thu, 11 Jun 2020 13:06:04 +0000
Subject: Re: HYPERVISOR_console_io + CONSOLEIO_write needs COPY_flush_dcache
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <912a84d1-ca47-9c37-06e7-28bebe696b4d@epam.com>
 <b505db7c-494d-81ae-242f-e781430bd498@xen.org>
 <d0c976ad-2c16-436e-8906-ce217bc36e9c@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d0447d0e-5f33-cfe6-97af-31fb0411c5f4@xen.org>
Date: Thu, 11 Jun 2020 14:06:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d0c976ad-2c16-436e-8906-ce217bc36e9c@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 11/06/2020 13:18, Oleksandr Andrushchenko wrote:
> 
> On 6/10/20 3:50 PM, Julien Grall wrote:
>> On 10/06/2020 09:13, Oleksandr Andrushchenko wrote:
>>> Hello,
>>
>> Hi,
>>
>>> While adding support for para-virtualized block device in u-boot
>>>
>>> I faced an issue with HYPERVISOR_console_io + CONSOLEIO_write.
>>>
>>> I tried to use the hypercall during MMU setup stage while enabling data cache
>>>
>>> on arm64 platform (e.g. data cache is not yet enabled) and saw in guest's console
>>>
>>> either old data or some sort of garbage. Printing constant strings, just like mini-os
>>>
>>> does on boot, works as expected.
>>
>> Per the hypercall ABI (see include/public/arch-arm.h) all the buffers must reside in memory which is mapped as Normal Inner Write-Back Inner-Shareable.
>>
>> You are passing non-cacheable memory, so the behavior you see is expected.
> This is what we come up with as well
>>
>>> So, looking at the Xen code [1] it seems
>>>
>>> that we should copy guest's buffer with COPY_flush_dcache set in this case
>>
>> COPY_flush_dcache is only meant to be used when copy to guest memory to make sure the data reached the point of coherency in your system. It is not meant to be used when copying from guest.
> Understood and agree
>>
>>> as (usually?) this hypercall is used in guest's code which doesn't have any
>>> other means to print yet, e.g. early printk case.
>>
>> I have been using it after the MMU is setup
> The thing is that in u-boot a lot of things happen before the MMU setup...
>> but before the console is properly setup by the guest (there is a lot that can happen in Linux between the two). In my case, the flush is not necessary and would be wrong.
> ... and without the flush you lose the ability to debug that code.

This is not entirely correct... You have other facility in Xen to debug 
early code (i.e pl011, hvc 0xffxx) and doesn't require any flush.

>>
>> In general, the cache is never off on Arm64 because you may have system cache or, in the cache of virtualization, cacheable mapping in the hypervisor (all the memory is mapped).
>>
>> When updating data with MMU/D-cache off the normal approach is:
>>     1) Remove any dirty lines from the cache, otherwise they may get evicted while updating the memory and override any value written with MMU off.
>>     2) Update the memory
>>     3) Remove any lines that may have been speculated so when you turn onthe MMU and D-cache, U-boot can obverse the correct data.
>>
>> Step 1 is only necessary if you are going to write outside of the loaded Image (BSS is not part of it).
>>
>> You most likely already have similar steps in U-boot for other part of the memory access with MMU/D-Cache off. So I think U-boot is the best place to invalidate the cache before issuing the hypercall.
> 
> Yes, I have invalidated the buffers and everything works like a charm now, thanks
> 
> Probably my use-case should be somewhere documented, so another time someone steps into similar issues it is explained.

You would have the exact same issue if you don't use hypercalls but 
modify a buffer with MMU off and then expect it to read the content 
correctly after turning on the MMU. That's even on baremetal! (see [1])

I am afraid you have to know how the cache works when writing code that 
will run with MMU off.

Therefore I don't think it is Xen Project to document how an 
architecture works. Instead this should be a tutorial for anyone wanting 
to write its own OS.

Cheers,

[1] https://www.youtube.com/watch?v=A_zCxzpxzmE

-- 
Julien Grall

