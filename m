Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 088BF77F1A0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 09:59:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585202.916252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWXub-0001ZZ-V7; Thu, 17 Aug 2023 07:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585202.916252; Thu, 17 Aug 2023 07:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWXub-0001WP-Rx; Thu, 17 Aug 2023 07:59:21 +0000
Received: by outflank-mailman (input) for mailman id 585202;
 Thu, 17 Aug 2023 07:59:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWXua-0001WJ-Hj
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 07:59:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWXua-00053J-BK; Thu, 17 Aug 2023 07:59:20 +0000
Received: from [54.239.6.180] (helo=[192.168.0.78])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWXua-0001W9-3b; Thu, 17 Aug 2023 07:59:20 +0000
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
	bh=RhXZs2jhoUZBrfs7DNiYHsFDGHrOJnI6XTpynwyhjh0=; b=fQBPy9WUrqZZCLW2M7z8JaTCtt
	l8q8Sjq41O34zbSgMaYYPblUEn3qea5vEhN032bplnZ1+1GqrLQ60o01QmWyG9sKb6JC81wHCrlRH
	cVmkYVjwRNR59pjFZ034Fn2SPvKF1ruJ/R3PydeJLg9VEDDdTtpPM5EvLiMUwf+UDlf8=;
Message-ID: <48272b15-8fe1-4dfe-a02c-acdfd8ff9c62@xen.org>
Date: Thu, 17 Aug 2023 08:59:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v7 04/19] common/device_tree: change
 __unflatten_device_tree() type
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-5-vikram.garhwal@amd.com>
 <ad9c88a0-bbbb-1ef7-0104-d201468897e0@xen.org>
 <308f68a8-9eb5-87d3-aaf0-61a6af33fd33@amd.com> <ZN1ge4pmAmcllhov@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZN1ge4pmAmcllhov@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 17/08/2023 00:49, Vikram Garhwal wrote:
> On Tue, Jun 06, 2023 at 12:09:35PM -0700, Vikram Garhwal wrote:
>> Hi Julien,
>> Will update the commit message regarding why we need to export this for dtbo
>> programming.
>>
>> On 6/5/23 12:04 PM, Julien Grall wrote:
>>> Hi,
>>>
>>> Title:
>>>
>>> 'type' is a bit confusing here. How about "Export
>>> __unflatten_device_tre()"?
>>>
>>> On 02/06/2023 01:48, Vikram Garhwal wrote:
>>>> Following changes are done to __unflatten_device_tree():
>>>>       1. __unflatten_device_tree() is renamed to unflatten_device_tree().
>>>>       2. Remove __init and static function type.
>>>
>>> As there is no external caller yet, please explain why you want to
>>> export the function.
> Update the commit message in v8.
>>>
>>> Cheers,
>>>
>>>>
>>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>>>> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
>>>> ---
>>>>    xen/common/device_tree.c      | 9 ++++-----
>>>>    xen/include/xen/device_tree.h | 5 +++++
>>>>    2 files changed, 9 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>>>> index bbdab07596..16b4b4e946 100644
>>>> --- a/xen/common/device_tree.c
>>>> +++ b/xen/common/device_tree.c
>>>> @@ -2083,7 +2083,7 @@ static unsigned long unflatten_dt_node(const
>>>> void *fdt,
>>>>    }
>>>>      /**
>>>> - * __unflatten_device_tree - create tree of device_nodes from flat blob
>>>> + * unflatten_device_tree - create tree of device_nodes from flat blob
>>>>     *
>>>>     * unflattens a device-tree, creating the
>>>>     * tree of struct device_node. It also fills the "name" and "type"
>>>> @@ -2092,8 +2092,7 @@ static unsigned long unflatten_dt_node(const
>>>> void *fdt,
>>>>     * @fdt: The fdt to expand
>>>>     * @mynodes: The device_node tree created by the call
>>>>     */
>>>> -static int __init __unflatten_device_tree(const void *fdt,
>>>> -                                          struct dt_device_node
>>>> **mynodes)
>>>> +int unflatten_device_tree(const void *fdt, struct dt_device_node
>>>> **mynodes)
>>>>    {
>>>>        unsigned long start, mem, size;
>>>>        struct dt_device_node **allnextp = mynodes;
>>>> @@ -2230,10 +2229,10 @@ dt_find_interrupt_controller(const struct
>>>> dt_device_match *matches)
>>>>      void __init dt_unflatten_host_device_tree(void)
>>>>    {
>>>> -    int error = __unflatten_device_tree(device_tree_flattened,
>>>> &dt_host);
>>>> +    int error = unflatten_device_tree(device_tree_flattened, &dt_host);
>>>>          if ( error )
>>>> -        panic("__unflatten_device_tree failed with error %d\n", error);
>>>> +        panic("unflatten_device_tree failed with error %d\n", error);
>>>>          dt_alias_scan();
>>>
>>> This function doesn't seem to be called in the case of the overlay
>>> device-tree. Does this mean that it will never contain any alias?
>>>
> I haven't seen any overlay example for FPGA use cases where alias are added.
> I have added a TODO in patch 16/19 where we are calling unflatten_device_tree().
>>>>    }
>>>> diff --git a/xen/include/xen/device_tree.h
>>>> b/xen/include/xen/device_tree.h
>>>> index c2eada7489..2c35c0d391 100644
>>>> --- a/xen/include/xen/device_tree.h
>>>> +++ b/xen/include/xen/device_tree.h
>>>> @@ -178,6 +178,11 @@ int device_tree_for_each_node(const void *fdt,
>>>> int node,
>>>>     */
>>>>    void dt_unflatten_host_device_tree(void);
>>>>    +/**
>>>> + * unflatten any device tree.
>>>
>>> Most of the exported function in device_tre.h have documentation. Can
>>> you do the same here?
> Done!
>>>
>>>> + */
>>>> +int unflatten_device_tree(const void *fdt, struct dt_device_node
>>>> **mynodes);
>>>
>>> NIT: From an external interface perspective, do we actually need to pass
>>> an extra pointer? Can't we instead, return the pointer?
> We will also need the error from the function. So, that's why i kept it as it is.

This can be achieved by using the ERR_PTR() infrastructure which I would 
rather prefer over passing an extra pointer here.

Cheers,

-- 
Julien Grall

