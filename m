Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF98E6F5DC7
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 20:19:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529444.823866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puH46-000592-B3; Wed, 03 May 2023 18:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529444.823866; Wed, 03 May 2023 18:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puH46-000564-7m; Wed, 03 May 2023 18:18:58 +0000
Received: by outflank-mailman (input) for mailman id 529444;
 Wed, 03 May 2023 18:18:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puH45-00055y-FP
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 18:18:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puH45-00022g-2c; Wed, 03 May 2023 18:18:57 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puH44-00063p-RC; Wed, 03 May 2023 18:18:56 +0000
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
	bh=NNhvbZyBNIyCOxi54PjONIH+ezlsZypVpRL/LqBtjNg=; b=IwgPIXVtPteAOIbwzng4iPF4rZ
	bvCXgThwiPL5y8QvsEEuctIz6MJMA35rndKy5MbM01n7t61qatHpZb/R7ZfGLaJfMF4sMolYam5qZ
	BMWyn1nNDXtuE3LWOG2mH2/Y6WOuj+2/AcA2GF8kBXcE+2Eaqw/7bI0QxApr4aIITP4g=;
Message-ID: <e46baef3-be2f-bf76-1667-8b0562849b06@xen.org>
Date: Wed, 3 May 2023 19:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [RFC PATCH] xen/arm: arm32: Enable smpboot on Arm32 based systems
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230502105849.40677-1-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2305021643010.974517@ubuntu-linux-20-04-desktop>
 <a0d48f47-bb62-5ed0-0c9b-95935dc75ca3@xen.org>
 <alpine.DEB.2.22.394.2305031053590.974517@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2305031053590.974517@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 03/05/2023 18:54, Stefano Stabellini wrote:
> On Wed, 3 May 2023, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 03/05/2023 00:55, Stefano Stabellini wrote:
>>>> +    {
>>>> +        printk("CPU%d: No release addr\n", cpu);
>>>> +        return -ENODEV;
>>>> +    }
>>>> +
>>>> +    release = ioremap_nocache(cpu_release_addr[cpu], 4);
>>>> +    if ( !release )
>>>> +    {
>>>> +        dprintk(XENLOG_ERR, "CPU%d: Unable to map release address\n",
>>>> cpu);
>>>> +        return -EFAULT;
>>>> +    }
>>>> +
>>>> +    writel(__pa(init_secondary), release);
>>>> +
>>>> +    iounmap(release);
>>>
>>> I think we need a wmb() ?
>>
>> I am not sure why we would need a wmb() here.
> 
> The code does:
> 
> writel(__pa(init_secondary), release);
> iounmap
> sev();
> 
> I was thinking of trying to make sure the write is completed before
> issuing a sev(). Technically it is possible for the CPU to reorder the
> sev() before the write as there is no explicit dependency between the
> two?

I would assume that iounmap() would contain an wmb(). But I guess this 
is not something we should rely on.

> 
>> Instead, looking at the Linux
>> version, I think we are missing a cache flush (so does on arm64) which would
>> be necessary if the CPU waiting for the release doesn't have cache enabled.
> 
> I thought about it as well but here the patch is calling
> ioremap_nocache(), so cache flushes should not be needed?

Hmmm... You are right, we are using ioremap_nocache(). I got confused 
because Linux is using ioremap_cache(). I am now wondering whether we 
are using the correct helper.

AFAIU, spin table is part of the reserved memory section in the 
Device-Tree. From section 5.3 in [1], the memory could be mapped 
cacheable by the other end. So for correctness, it seems to me that we 
would need to use ioremap_cache() + cache flush.

BTW, writel_relaxed() should be sufficient here as there is no ordering 
necessary with any previous write.

Cheers,

[1] 
https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.3

-- 
Julien Grall

