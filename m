Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E30740BE2
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 10:53:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556368.868840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEQvL-0004db-EB; Wed, 28 Jun 2023 08:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556368.868840; Wed, 28 Jun 2023 08:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEQvL-0004aw-Av; Wed, 28 Jun 2023 08:53:15 +0000
Received: by outflank-mailman (input) for mailman id 556368;
 Wed, 28 Jun 2023 08:53:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEQvK-0004aq-20
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 08:53:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEQvE-0005fZ-8x; Wed, 28 Jun 2023 08:53:08 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEQvE-0005Nj-2a; Wed, 28 Jun 2023 08:53:08 +0000
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
	bh=Q1l99Y7QqWyg2c0B+utmVn1lR1sQpGAJDf322D056QQ=; b=mHNFy9RPh+y+W8J5IHFdJwkbsP
	x8vCN5KS19oog0iAnpihtyXBhkbSB4fzlWudc+YXKGItG3dygP9emd0ZZBiKnjEbaoin3tx9WZHha
	n44HRyoGQAge66Aj6tJTCYvfEj7HBPl+61JZcFC3hirele2I2oVWSGuw8x8ZDjo8EWBg=;
Message-ID: <0548bec8-c666-12f8-6704-f6026c16c745@xen.org>
Date: Wed, 28 Jun 2023 09:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 15/52] xen: make VMAP only support in MMU system
Content-Language: en-US
To: Penny Zheng <penny.zheng@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-16-Penny.Zheng@arm.com>
 <654c9925-565a-80d4-5e93-129f6f0f691a@suse.com>
 <7d3ff868-60a4-1eab-0b9b-f6ca649cfdeb@arm.com>
 <c8ad27d1-a14d-b897-7557-a4770344734d@xen.org>
 <37124ccc-3cf6-6632-4b2e-d23072de9128@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <37124ccc-3cf6-6632-4b2e-d23072de9128@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 28/06/2023 09:41, Penny Zheng wrote:
> On 2023/6/28 15:59, Julien Grall wrote:
>> Hi,
>>
>> On 28/06/2023 06:38, Penny Zheng wrote:
>>> On 2023/6/26 14:00, Jan Beulich wrote:
>>>> On 26.06.2023 05:34, Penny Zheng wrote:
>>>>> --- a/xen/common/vmap.c
>>>>> +++ b/xen/common/vmap.c
>>>>> @@ -331,4 +331,11 @@ void vfree(void *va)
>>>>>       while ( (pg = page_list_remove_head(&pg_list)) != NULL )
>>>>>           free_domheap_page(pg);
>>>>>   }
>>>>> +
>>>>> +void iounmap(void __iomem *va)
>>>>> +{
>>>>> +    unsigned long addr = (unsigned long)(void __force *)va;
>>>>> +
>>>>> +    vunmap((void *)(addr & PAGE_MASK));
>>>>> +}
>>>>
>>>> Why does this move here?
>>>
>>> ioremap/iounmap is using vmap, at least in ARM. So for this more
>>> generic interface, I was intending to implement it on MPU system.
>>> In commit "[PATCH v3 19/52] xen/arm: switch to use ioremap_xxx in 
>>> common file", I'm trying to replace all direct vmap interface with 
>>> ioremap_xxx in common files.
>>
>> While the implementation of ioremap() is based on vmap(), the intended 
>> usage is not the same. ioremap() is for MMIO regions while vmap() is 
>> for RAM.
>>
>> So I don't think this is correct to replace vmap() with ioremap().
>>
> 
> Sure, understood now.
> So then the current usage of ioremap_xxx in xen/arch/arm/kernel.c, like
> ```
> kernel_zimage_load()
> ...
> kernel = ioremap_wc(paddr, len);
> ...
> ```
> ioremap_wc() is used for remapping and then copying guest kernel image 
> to guest memory. Since ioremap_xxx is for MMIO regions, maybe we shall 
> provide a new pair of interfaces for RAM, like ramremap_xxx, to replace 
> the ioremap_xxx here?

I always wondered why we were using ioremap_wc() there. But I have never 
made up my mind for this one. We would need to look at the history to 
understand why it was used.

Anyway, if we want to replace it, then I think this would be a plain 
vmap() rather inventing a new API.

Cheers,

-- 
Julien Grall

