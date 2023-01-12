Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73171666E99
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 10:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475939.737865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFuBL-0002dd-6g; Thu, 12 Jan 2023 09:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475939.737865; Thu, 12 Jan 2023 09:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFuBL-0002a5-3b; Thu, 12 Jan 2023 09:47:35 +0000
Received: by outflank-mailman (input) for mailman id 475939;
 Thu, 12 Jan 2023 09:47:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pFuBJ-0002Z7-6h
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 09:47:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFuBE-0003vp-Gv; Thu, 12 Jan 2023 09:47:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pFuBE-0008Ef-92; Thu, 12 Jan 2023 09:47:28 +0000
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
	bh=Bs3VulGjSb/JK4kg4WXicdltLKKVB699Ov+/7rXfTI4=; b=Xxqt8VT0J7UimeZLqZEbSmXnYM
	TNpO7edn4KvvVQzxI9s5rLgvC+G5TJcY7O4JllikI7/kuFnvYgajSGD+osZd4RBsORqB+ZKaR7D+W
	KIsCOn+G/bddOGYsRezbGhaaHfaXACQyEs9ysf3kxFeMGlCfR5Pu9SCZlnCeFog0DmtU=;
Message-ID: <71e806f4-8bd2-dd47-67b9-958bb9061c7b@xen.org>
Date: Thu, 12 Jan 2023 09:47:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 03/17] xen/arm: implement node distance helpers for Arm
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-4-wei.chen@arm.com>
 <9fd67aa2-0bd5-16a2-1e19-139504c2090f@suse.com>
 <PAXPR08MB7420A4E3DA252F9F37450EDA9EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <ee06b9a7-bfc7-e6f1-f2f6-f73a1fb42d6d@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ee06b9a7-bfc7-e6f1-f2f6-f73a1fb42d6d@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 12/01/2023 08:11, Jan Beulich wrote:
> On 12.01.2023 07:31, Wei Chen wrote:
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 2023年1月11日 0:47
>>>
>>> On 10.01.2023 09:49, Wei Chen wrote:
>>>> --- a/xen/arch/arm/include/asm/numa.h
>>>> +++ b/xen/arch/arm/include/asm/numa.h
>>>> @@ -28,6 +28,20 @@ enum dt_numa_status {
>>>>       DT_NUMA_OFF,
>>>>   };
>>>>
>>>> +/*
>>>> + * In ACPI spec, 0-9 are the reserved values for node distance,
>>>> + * 10 indicates local node distance, 20 indicates remote node
>>>> + * distance. Set node distance map in device tree will follow
>>>> + * the ACPI's definition.

Looking at the ACPI spec, I agree that the local node distance is 
defined to 10. But I couldn't find any mention of the value 20.

How is NUMA_REMOTE_DISTANCE is meant to be used? Is this a default 
value? If so, maybe we should add "DEFAULT" in the name.

>>>> + */
>>>> +#define NUMA_DISTANCE_UDF_MIN   0
>>>> +#define NUMA_DISTANCE_UDF_MAX   9
>>>> +#define NUMA_LOCAL_DISTANCE     10
>>>> +#define NUMA_REMOTE_DISTANCE    20
>>>
>>> In the absence of a caller of numa_set_distance() it is entirely unclear
>>> whether this tying to ACPI used values is actually appropriate.
>>>
>>
>>  From Kernel's NUMA device tree binding, it seems DT NUMA are reusing
>> ACPI used values for distances [1].
> 
> I can't find any mention of ACPI in that doc, so the example values used
> there matching ACPI's may also be coincidental. In no event can a Linux
> kernel doc serve as DT specification. 

The directory Documentation/devicetree is the de-facto place where all 
the bindings are described. This is used by most (to not say all) users.

I vaguely remember there were plan in the past to move the bindings out 
of the kernel. But it looks like this has not been done. Yet, they tend 
to be reviewed independently from the kernel.

So, as Wei pointed, if we don't follow them then we will not be able to 
re-use Device-Tree shipped.

> If values are to match ACPI's, I
> expect a DT spec to actually say so.
I don't think it is necessary to say that. Bindings are not meant to 
change and a developer can rely on the local distance value to not 
change with the current bindings.

So IMHO, it is OK to assume that the local distance value is the same 
between ACPI and DT. That would definitely simplify the parsing and code.

Cheers,

-- 
Julien Grall

