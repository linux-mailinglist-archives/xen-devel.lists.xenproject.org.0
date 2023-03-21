Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F006C35CC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 16:36:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512801.793026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pee1l-00060G-NR; Tue, 21 Mar 2023 15:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512801.793026; Tue, 21 Mar 2023 15:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pee1l-0005y3-KO; Tue, 21 Mar 2023 15:35:57 +0000
Received: by outflank-mailman (input) for mailman id 512801;
 Tue, 21 Mar 2023 15:35:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pee1k-0005xx-IP
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 15:35:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pee1k-00089k-6w; Tue, 21 Mar 2023 15:35:56 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pee1j-0003pK-U8; Tue, 21 Mar 2023 15:35:56 +0000
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
	bh=8OkT+LBGgDvL/XcYS+A/q5e14HSk+HJtPBBqpQ4y/NE=; b=vbTjrPyEJK/FeU8VW1nuTa6x5n
	i//R60hr5hzll9/mKf49ravTqo7M7k311oCf4eBqiZdAeB23vp7wdf9dJh3Pee7tNcNK72EvrsCxE
	wqy7zZqRo0fxKUTeMnkZsV8kyKrLYU7CMlPY2IHM6CbtM4VlIzbPm7ayCxJR1SDVMDLo=;
Message-ID: <d82e7ed7-50d7-0c4c-532a-df50a4801110@xen.org>
Date: Tue, 21 Mar 2023 15:35:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/4] xen/arm: Defer GICv2 CPU interface mapping until
 the first access
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230130040614.188296-1-Henry.Wang@arm.com>
 <20230130040614.188296-4-Henry.Wang@arm.com>
 <e2421c2d-6ae1-bf70-530d-0683d943f519@xen.org>
 <AS8PR08MB799142447DF4749065ABAF5992819@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB799142447DF4749065ABAF5992819@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/03/2023 03:57, Henry Wang wrote:
> Hi Julien,

Hi Henry,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v2 3/4] xen/arm: Defer GICv2 CPU interface mapping until
>> the first access
>>
>> Hi Henry,
>>
>> On 30/01/2023 04:06, Henry Wang wrote:
>>> Since the hardware domain (Dom0) has an unlimited size P2M pool, the
>>> gicv2_map_hwdom_extra_mappings() is also not touched by this patch.
>>
>> I didn't notice this in the previous version. The fact that dom0 has
>> unlimited size P2M pool doesn't matter here (this could also change in
>> the future). Even if the P2M pool was limited, then it would be fine
>> because the extra mappings happen after domain_create(). So there is no
>> need to map them on-demand as the code could be order the way we want.
>>
>> So this paragraph needs to be reworded.
> 
> Sure, I've reworded this paragraph to below:
> "Since gicv2_map_hwdom_extra_mappings() happens after domain_create(),
> so there is no need to map the extra mappings on-demand, and therefore
> keep the hwdom extra mappings as untouched."

Looks good to me.

> 
>>
>>> +    /*
>>> +     * Map the GICv2 virtual CPU interface in the GIC CPU interface
>>> +     * region of the guest on the first access of the MMIO region.
>>> +     */
>>> +    if ( d->arch.vgic.version == GIC_V2 &&
>>> +         gfn_eq(gfn, gaddr_to_gfn(d->arch.vgic.cbase)) )
>>
>> The CPU interface size is 8KB (bigger in some cases) but here you only
>> check for the access to be in the first 4KB.
> 
> Yeah indeed, gfn might fall into the range between 4KB and 8KB, sorry
> about that.
> 
> Considering that the CPU interface is continuous (I suppose), I have two
> ways of rewriting the gfn check, we can do either:
> 
> gfn_eq(gfn, gaddr_to_gfn(d->arch.vgic.cbase)) ||
> gfn_eq(gfn, gfn_add(gaddr_to_gfn(d->arch.vgic.cbase), 1))

This check is incorrect as you are making the assumption that the size 
is 8KB. As I hinted in the previous e-mail, the size could be bigger. 
For instance, for dom0, it could be up to 128KB when the GICC is aliased.

So you want to...

> 
> or
> 
> gfn_to_gaddr(gfn) >= d->arch.vgic.cbase ||
> gfn_to_gaddr(gfn) < d->arch.vgic.cbase + d->arch.vgic.csize

... use the size in the check. With the || switch to &&, my preference 
would be to use:

((d->arch.vgic.cbase - gfn_to_addr(gfn)) < d->arch.vgic.csize)

to avoid a potential overflow in the unlikely case the CPU interface is 
at the top of the address space.

Cheers,

-- 
Julien Grall

