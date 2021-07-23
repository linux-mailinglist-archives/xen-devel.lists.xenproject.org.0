Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF13E3D37B1
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 11:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160042.294311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6rUO-0003O7-1O; Fri, 23 Jul 2021 09:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160042.294311; Fri, 23 Jul 2021 09:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6rUN-0003MD-UE; Fri, 23 Jul 2021 09:29:03 +0000
Received: by outflank-mailman (input) for mailman id 160042;
 Fri, 23 Jul 2021 09:29:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m6rUM-0003M7-Ht
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 09:29:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6rUL-0000dW-WC; Fri, 23 Jul 2021 09:29:02 +0000
Received: from [54.239.6.189] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6rUL-0001hY-Px; Fri, 23 Jul 2021 09:29:01 +0000
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
	bh=XdtI2ne33/KWrPsVUAI0PwK09HhzPkiAyoVrcYB9uoQ=; b=br9NIKDzB6JLNweaHsiEUcLgXs
	kTfbiyiC9ZdbblbYCxEJr8B+uNSQaDQYDUoACNx/To7uiXvwaQmbpedOI7sJ95Mz0pt7/8/t8jWur
	US4oegxqs4E50ElmnXn3Vw4+3KKqDn4AFumz3xeUA1V/H80kWRuQcqo09bRAi56zulfk=;
Subject: Re: [PATCH v5 2/4] xen: do not return -EEXIST if iommu_add_dt_device
 is called twice
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>
 <20210722233642.22515-2-sstabellini@kernel.org>
 <97f0713b-f6bb-72cd-f364-f0d42c868171@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1df74545-d2fa-2d80-5246-a0b0158550b4@xen.org>
Date: Fri, 23 Jul 2021 10:28:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <97f0713b-f6bb-72cd-f364-f0d42c868171@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/07/2021 07:31, Jan Beulich wrote:
> On 23.07.2021 01:36, Stefano Stabellini wrote:
>> --- a/xen/drivers/passthrough/device_tree.c
>> +++ b/xen/drivers/passthrough/device_tree.c
>> @@ -140,8 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
>>       if ( !ops )
>>           return -EINVAL;
>>   
>> +    /*
>> +     * Some Device Trees may expose both legacy SMMU and generic
>> +     * IOMMU bindings together. If both are present, the device
>> +     * can be already added.
>> +     */
>>       if ( dev_iommu_fwspec_get(dev) )
>> -        return -EEXIST;
>> +        return 0;
> 
> Since the xen: prefix in the subject made me go look (I wouldn't have
> if it had been e.g. dt: ), I may as well ask: Since previously there
> was concern about bogus duplicate entries, does this concern go away
> no altogether?

The check wasn't originally added because of legacy vs generic binding.

It was added because in some circumstances iommu_add_dt_device() could 
genuinely be called twice (for instance if the device is re-assigned). 
This was returning -EEXIST rather than 0 so the caller can decide 
whether it is normal that the device is already added.

Calling iommu_add_dt_device() twice doesn't hurt but after patch #1 
(this patch should really be first), dev_iommu_fwspec_get() will return 
a non-NULL pointer as the legacy devices are added when the IOMMU is probed.

> It's one thing for there to be a legacy and a generic
> binding, but another if you found two legacy or two generic ones, I
> would think.

I am not quite too sure what you mean by "two legacy" and "two generic". 
Can you clarify it?

> 
> And what if legacy and generic representation differ in some way?

That would be a firmware table issue. It is not Xen business to check 
whether the two representation agree.

> Shouldn't you limit processing to just one of the two categories,
> such that no legitimate "already present" case could be encountered
> here in the first place?
There are legitimate "already present" case. This can happen when a 
device is re-assigned. Arguably the caller could check if the device was 
already added, however it would involve more code in each caller. So it 
is much easier to add in iommu_add_dt_device().

Cheers,

-- 
Julien Grall

