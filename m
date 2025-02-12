Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE857A321B1
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 10:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886209.1295884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8g2-0007N8-Oa; Wed, 12 Feb 2025 09:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886209.1295884; Wed, 12 Feb 2025 09:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8g2-0007L9-Ly; Wed, 12 Feb 2025 09:05:02 +0000
Received: by outflank-mailman (input) for mailman id 886209;
 Wed, 12 Feb 2025 09:05:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ti8g1-0007L3-8v
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 09:05:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ti8fz-00Etg1-1m;
 Wed, 12 Feb 2025 09:04:59 +0000
Received: from [2a02:8012:3a1:0:c076:8426:eb1f:4b85]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ti8fz-007CIO-0D;
 Wed, 12 Feb 2025 09:04:59 +0000
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
	bh=znfdPUUlHBuganWryBcF+JVAPQe3dZdE5RWIeSRNWXI=; b=SIi9RDYMJumVhq9lSRRC3gD6cp
	fMoTKg7p/RJW9C19j4QzAdGyukVIM9yYMl/hcv6NWsE8kXvYAJF/hrBFlolfBY2otBfrcLtLCBtzF
	lT+tRP1CsKqDAZ3uhBCyGbtOtHp+TbYAi6ZqIgLp2dczjbvcUk5pXiBplUZ7KvTEW6Dk=;
Message-ID: <0b4a9980-f49a-4eca-adf3-a896c0c7e1c1@xen.org>
Date: Wed, 12 Feb 2025 09:04:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: optimize dt_device_for_passthrough()
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250211111853.2199764-1-grygorii_strashko@epam.com>
 <d5f00c3a-81a8-4221-acc2-de90fb92deee@amd.com>
 <e1c5fcb3-4647-483f-b600-deae9f68da78@xen.org>
 <dece6a9e-21c6-4f2e-ba53-337c5855f88d@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <dece6a9e-21c6-4f2e-ba53-337c5855f88d@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/02/2025 15:14, Grygorii Strashko wrote:
> 
> 
> On 11.02.25 14:32, Julien Grall wrote:
>>
>>
>> On 11/02/2025 11:57, Orzel, Michal wrote:
>>> On 11/02/2025 12:18, Grygorii Strashko wrote:
>>>>
>>>>
>>>> The dt_device_for_passthrough() is called many times during Xen
>>>> initialization and Dom0 creation. On every call it traverses struct
>>>> dt_device_node properties list and compares compares properties name 
>>>> with
>>> double "compares"
> 
> 10x
> 
>>>
>>>> "xen,passthrough" which is runtime overhead. This can be optimized by
>>> Are you sure? Looking at the calls, it's almost only used at boot 
>>> except for dt
>>> overlay.
>>>
>>>> marking dt_device_node as passthrough while unflattening DT.
>>>>
>>>> This patch introduced new struct dt_device_node property 
>>>> "is_passthrough"
>>>> which is filled if "xen,passthrough" property is present while 
>>>> unflattening
>>>> DT and dt_device_for_passthrough() just return it's value.
>>> In the past we were skeptical about adding new fields to the 
>>> dt_device_node
>>> structure for use cases like this one. I would say this optimization 
>>> is not
>>> worth it. Also, why would you optimize dt_device_for_passthrough but not
>>> e.g. dt_device_is_available.
>>
>> So we are trading speed with memory usage. It looks like we may be 
>> using a padding, although I didn't check whether the existing 
>> structure could be packed...
> 
> Actually I see it consumes nothing due to alignments:
> - before sizeof(dt_device_node)=144
> - after sizeof(dt_device_node)=144
> 
> But it could be made bool is_passthrough:1; together with other bools, 
> and probably moved at the end of struct dt_device_node.
> 
> By the way, below diff can save 8 bytes on arm64 per struct dt_device_node.
> 
>>
>>>
>>> You can check with other Arm maintainers.
>>
>> Before forging an opinion, I'd like to see some numbers showing the 
>> performance improvement. Also, is this impacting only boot?
> 
> Sry, indeed only boot, need to be more specific.
> 
> My DT: ~700 nodes
> Number of calls till the end of create_dom0():
> (XEN) =============== dt_device_for_passthrough=2684 
> dt_device_is_available=1429.
> 
> I've enabled console_timestamps=boot and did 5 boots and calculated 
> average - it gives ~20 microseconds improvement.

This doesn't seem to be worth it. But I also don't know what's the 
normal boot time on your system... I guess we are still in seconds?

>> Also, I agree with Michal, if this is a concern for 
>> dt_device_device_for_passthrough(). Then it would be a concern for a 
>> few others calls using dt_find_property(). Are you going to modify all 
>> of them?
> 
> I follow the rule one patch one functional change. Regarding further 
> optimization - I think only generic properties can be optimized and 
> personally I see now only "xen,passthrough" and may be "status".
> 
> Ok. 20 microseconds. it's probably more like a measurement error margin.
> Please advice if i should continue or drop?

See above. Regardless that, would you be able to provide a bit more 
information of your end goal? Are you intending to be able to boot 
Xen/dom0/dom0less guest in less than N milliseconds? How far are you 
from that target? Are those numbers done on the latest Xen?

Asking because there are probably bigger place where optimization can be 
done first.

Cheers,

-- 
Julien Grall


