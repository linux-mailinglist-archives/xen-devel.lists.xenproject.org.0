Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82FA3DE9B6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Aug 2021 11:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163322.299189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAqm5-0004QT-JF; Tue, 03 Aug 2021 09:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163322.299189; Tue, 03 Aug 2021 09:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAqm5-0004Oi-Fk; Tue, 03 Aug 2021 09:31:49 +0000
Received: by outflank-mailman (input) for mailman id 163322;
 Tue, 03 Aug 2021 09:31:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mAqm3-0004OJ-Tr
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 09:31:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAqm3-0000gj-EN; Tue, 03 Aug 2021 09:31:47 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAqm3-0007UY-8C; Tue, 03 Aug 2021 09:31:47 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=kQF9UgsgKTwm6gx6c4trKHeimrQJ6S5nBQjQHCrD8Vc=; b=7A5GCiqVeAphBQ8DbnajJlxdCo
	IHh5a5LKp/Eyi28/0BatgyKDdEr1+kBamzWRrOAdGGg+l+7uwWr1QgYVUJFSoOmpowl+tdprxkxlG
	/UyVEVWQQe8rys3FYwZi4Sn/hfI5wtdJy3RtkvGE98LPXnwb8JDAxamthkagU/jFB18s=;
Subject: Re: [PATCH v5 2/4] xen: do not return -EEXIST if iommu_add_dt_device
 is called twice
To: Jan Beulich <jbeulich@suse.com>
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>
 <20210722233642.22515-2-sstabellini@kernel.org>
 <97f0713b-f6bb-72cd-f364-f0d42c868171@suse.com>
 <1df74545-d2fa-2d80-5246-a0b0158550b4@xen.org>
 <e262a28a-ced3-3097-4748-fe2b9efe08f5@suse.com>
 <f4bdbeaf-b432-5bda-28fc-c9358b26ab5a@xen.org>
 <165b7bf4-2927-6b22-34aa-cb44bf780200@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <14f04bc2-8b08-1159-dbf1-7ba0e82b07a0@xen.org>
Date: Tue, 3 Aug 2021 10:31:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <165b7bf4-2927-6b22-34aa-cb44bf780200@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 03/08/2021 07:57, Jan Beulich wrote:
> On 26.07.2021 17:45, Julien Grall wrote:
>> On 23/07/2021 14:02, Jan Beulich wrote:
>>> On 23.07.2021 11:28, Julien Grall wrote:
>>>> On 23/07/2021 07:31, Jan Beulich wrote:
>>>>> On 23.07.2021 01:36, Stefano Stabellini wrote:
>>>>>> --- a/xen/drivers/passthrough/device_tree.c
>>>>>> +++ b/xen/drivers/passthrough/device_tree.c
>>>>>> @@ -140,8 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
>>>>>>         if ( !ops )
>>>>>>             return -EINVAL;
>>>>>>     
>>>>>> +    /*
>>>>>> +     * Some Device Trees may expose both legacy SMMU and generic
>>>>>> +     * IOMMU bindings together. If both are present, the device
>>>>>> +     * can be already added.
>>>>>> +     */
>>>>>>         if ( dev_iommu_fwspec_get(dev) )
>>>>>> -        return -EEXIST;
>>>>>> +        return 0;
>>>>>
>>>>> Since the xen: prefix in the subject made me go look (I wouldn't have
>>>>> if it had been e.g. dt: ), I may as well ask: Since previously there
>>>>> was concern about bogus duplicate entries, does this concern go away
>>>>> no altogether?
>>>>
>>>> The check wasn't originally added because of legacy vs generic binding.
>>>>
>>>> It was added because in some circumstances iommu_add_dt_device() could
>>>> genuinely be called twice (for instance if the device is re-assigned).
>>>> This was returning -EEXIST rather than 0 so the caller can decide
>>>> whether it is normal that the device is already added.
>>>
>>> Okay. If that distinction is of no interest anymore, then I can see
>>> this wanting dropping.
>>>
>>>> Calling iommu_add_dt_device() twice doesn't hurt but after patch #1
>>>> (this patch should really be first), dev_iommu_fwspec_get() will return
>>>> a non-NULL pointer as the legacy devices are added when the IOMMU is probed.
>>>>
>>>>> It's one thing for there to be a legacy and a generic
>>>>> binding, but another if you found two legacy or two generic ones, I
>>>>> would think.
>>>>
>>>> I am not quite too sure what you mean by "two legacy" and "two generic".
>>>> Can you clarify it?
>>>
>>> Well, I'm having trouble describing it in different terms. I mean
>>> two entries of the same kind (both legacy or both generic) referring
>>> to the same device, thus leading to the function recognizing the 2nd > time round that the device is already there.
>>
>> I think you are misunderstanding the purpose of this function. It is
>> called when we discover a new device rather than discovering a new entry
>> in the IOMMU. The function will then sort out what to do for the device.
> 
> I'm struggling with assigning meaning to "discovering a new entry in the
> IOMMU".

I meant in the IOMMU firmware table, sorry. IOW, when a new IOMMU is 
added we walk its configuration to figure out which device is attached 
to it.

>  Otoh to "discover a new device" means the device wasn't (supposed
> to be) known before, which to me means -EEXIST is appropriate.

Right. The problem is after patch #1 all callers would need to cope with 
-EEXIST because the legacy binding register the device up front.

That's why I think returning 0 here is better.

Cheers,

-- 
Julien Grall

