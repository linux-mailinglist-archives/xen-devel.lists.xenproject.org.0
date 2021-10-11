Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3F7428BD1
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 13:14:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205794.361196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtGG-0007Xs-Hu; Mon, 11 Oct 2021 11:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205794.361196; Mon, 11 Oct 2021 11:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZtGG-0007VM-Ep; Mon, 11 Oct 2021 11:14:28 +0000
Received: by outflank-mailman (input) for mailman id 205794;
 Mon, 11 Oct 2021 11:14:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mZtGE-0007V8-PR
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 11:14:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZtGE-0003cv-MH; Mon, 11 Oct 2021 11:14:26 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.17.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZtGE-0003vb-Gh; Mon, 11 Oct 2021 11:14:26 +0000
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
	bh=OqXQGJLgtkZ2tPxuoAUKLi6RuLuzPoXsGKNtrws2n6c=; b=Y0h4C1NLS8e0srjk5Nb4yCa2Dk
	l2fXcOeyyrDG+C7GmEtg+ttHZF08IG+5dhKa3GcdeWf4rx80pkvVcnwAGHatMr+BmNndAgEs62nG4
	tIs3ZlqJYHm8IXoVpHhlCULTTktav0GRqvTvGGxjzHx8ef8fwIlaUOOtK2aVupjadZsg=;
Message-ID: <9237c85c-87d0-14ac-07ce-244958add7d3@xen.org>
Date: Mon, 11 Oct 2021 12:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH 10/11] xen/arm: device assignment on 1:1 direct-map domain
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-11-penny.zheng@arm.com>
 <c6730ec5-53c7-9bf2-4620-eefbc7c7c4a3@xen.org>
 <VE1PR08MB5215A1D5695F388F17C367D4F7B39@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <VE1PR08MB5215A1D5695F388F17C367D4F7B39@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/10/2021 10:40, Penny Zheng wrote:
> Hi Julien

Hi Penny,

> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Thursday, September 23, 2021 7:27 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>
>> Subject: Re: [PATCH 10/11] xen/arm: device assignment on 1:1 direct-map
>> domain
>>
>> Hi,
>>
>> On 23/09/2021 08:11, Penny Zheng wrote:
>>> User could do device passthrough, with
>>> "xen,force-assign-without-iommu" in the device tree snippet, on
>>> trusted guest through 1:1 direct-map, if IOMMU absent or disabled on
>> hardware.
>>
>> At the moment, it would be possible to passthrough a non-DMA capable
>> device with direct-mapping. After this patch, this is going to be forbidden.
>>
>>>
>>> In order to achieve that, this patch adds 1:1 direct-map check and
>>> disables iommu-related action.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>>    xen/arch/arm/domain_build.c | 12 ++++++++----
>>>    1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index c92e510ae7..9a9d2522b7 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -2070,14 +2070,18 @@ static int __init
>> handle_passthrough_prop(struct kernel_info *kinfo,
>>>        if ( res < 0 )
>>>            return res;
>>>
>>> +    /*
>>> +     * If xen_force, we allow assignment of devices without IOMMU
>> protection.
>>> +     * And if IOMMU is disabled or absent, 1:1 direct-map is necessary > +
>> */
>>> +    if ( xen_force && is_domain_direct_mapped(kinfo->d) &&
>>> +         !dt_device_is_protected(node) )
>>
>> dt_device_is_protected() will be always false unless the device is protected
>> behing an SMMU using the legacy binding. So I don't think this is correct to
>> move this check ahead. In fact..
>>
>>> +        return 0;
>>> +
>>>        res = iommu_add_dt_device(node);
>>
>> ... the call should already be a NOP when the IOMMU is disabled or the
>> device is not behind an IOMMU. So can you explain what you are trying to
>> prevent here?
>>
> 
> If the IOMMU is disabled, iommu_add_dt_device will return 1 as errno.
> So we could not make it to the xen_force check...

I disagree. The check is:

if ( res < 0 )
   return res;

Given that res is 1, we wouldn't return and move to check whether the 
assignment can be done.

> 
> So I tried to move all IOMMU action behind xen_force check.
> 
> Now, device assignment without IOMMU protection is only
> applicable on direct-map domains,

It is fine to assign a non-DMA capable device without direct-mapping. So 
why do you want to add this restriction?

Cheers,

-- 
Julien Grall

