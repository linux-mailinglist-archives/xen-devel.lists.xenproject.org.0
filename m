Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A24A068D1FF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 10:04:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490940.759854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPJst-0003pi-Fx; Tue, 07 Feb 2023 09:03:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490940.759854; Tue, 07 Feb 2023 09:03:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPJst-0003nR-DA; Tue, 07 Feb 2023 09:03:27 +0000
Received: by outflank-mailman (input) for mailman id 490940;
 Tue, 07 Feb 2023 09:03:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pPJsr-0003nJ-Sd
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 09:03:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPJsr-00044I-GZ; Tue, 07 Feb 2023 09:03:25 +0000
Received: from [54.239.6.184] (helo=[192.168.19.254])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPJsr-0008N3-8x; Tue, 07 Feb 2023 09:03:25 +0000
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
	bh=3+OKKIlDVqxj00raOPnDeDddYAcXyXZNdnlMzpY+erY=; b=3s82OlcTXmmALXS8UWAuFeQxQy
	Jy+9yqf61lni2VyC/gHyvHC5azza8vHAMkAJ9U8YdPGyXxqwHQq7P4ivx1/wi3iUkAUNEGKFAkGvP
	z+MPXshA4Be44YbVQfmm2kTsy5oVxYgli2mNs7/rz2zENcWjSNvi5n3IKhLZWvcVyk4g=;
Message-ID: <4f98390c-1cf3-99f3-5131-a42a7ed4387a@xen.org>
Date: Tue, 7 Feb 2023 09:03:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [XEN v2 05/11] xen/arm: Use paddr_t instead of u64 for
 address/size
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-6-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191522170.731018@ubuntu-linux-20-04-desktop>
 <8144403d-0899-5b25-f1b0-f798d4b371a6@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8144403d-0899-5b25-f1b0-f798d4b371a6@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06/02/2023 19:21, Ayan Kumar Halder wrote:
> Hi Stefano,
> 
> On 19/01/2023 23:24, Stefano Stabellini wrote:
>> On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
>>> One should now be able to use 'paddr_t' to represent address and size.
>>> Consequently, one should use 'PRIpaddr' as a format specifier for 
>>> paddr_t.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>
>>> Changes from -
>>>
>>> v1 - 1. Rebased the patch.
>>>
>>>   xen/arch/arm/domain_build.c        |  9 +++++----
>>>   xen/arch/arm/gic-v3.c              |  2 +-
>>>   xen/arch/arm/platforms/exynos5.c   | 26 +++++++++++++-------------
>>>   xen/drivers/char/exynos4210-uart.c |  2 +-
>>>   xen/drivers/char/ns16550.c         |  8 ++++----
>>>   xen/drivers/char/omap-uart.c       |  2 +-
>>>   xen/drivers/char/pl011.c           |  4 ++--
>>>   xen/drivers/char/scif-uart.c       |  2 +-
>>>   xen/drivers/passthrough/arm/smmu.c |  6 +++---
>>>   9 files changed, 31 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 72b9afbb4c..cf8ae37a14 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -1666,7 +1666,7 @@ static int __init find_memory_holes(const 
>>> struct kernel_info *kinfo,
>>>       dt_for_each_device_node( dt_host, np )
>>>       {
>>>           unsigned int naddr;
>>> -        u64 addr, size;
>>> +        paddr_t addr, size;
>>>           naddr = dt_number_of_address(np);
>>> @@ -2445,7 +2445,7 @@ static int __init handle_device(struct domain 
>>> *d, struct dt_device_node *dev,
>>>       unsigned int naddr;
>>>       unsigned int i;
>>>       int res;
>>> -    u64 addr, size;
>>> +    paddr_t addr, size;
>>>       bool own_device = !dt_device_for_passthrough(dev);
>>>       /*
>>>        * We want to avoid mapping the MMIO in dom0 for the following 
>>> cases:
>>> @@ -2941,9 +2941,10 @@ static int __init 
>>> handle_passthrough_prop(struct kernel_info *kinfo,
>>>           if ( res )
>>>           {
>>>               printk(XENLOG_ERR "Unable to permit to dom%d access to"
>>> -                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
>>> +                   " 0x%"PRIpaddr" - 0x%"PRIpaddr"\n",
>>>                      kinfo->d->domain_id,
>>> -                   mstart & PAGE_MASK, PAGE_ALIGN(mstart + size) - 1);
>>> +                   (paddr_t) (mstart & PAGE_MASK),
>>> +                   (paddr_t) (PAGE_ALIGN(mstart + size) - 1));
>> Why do you need the casts here? mstart is already defined as paddr_t
> 
> Actually, this is because the PAGE_MASK is defined as 'long'. See 
> xen/include/xen/page-size.h :-
> 
> #define PAGE_SIZE           (_AC(1,L) << PAGE_SHIFT)
> #define PAGE_MASK           (~(PAGE_SIZE-1))
> 
> So, the resultant type inferred is 'long unsigned int'. Thus, we need to 
> add an explicit cast.

Hmmm... I am a bit confused with this statement. If the resultant type 
inferred is actually 'long unsigned int', then why was the current 
specifier worked before ('long unsigned int' is 32-bit on Arm32)?

Cheers,

-- 
Julien Grall

