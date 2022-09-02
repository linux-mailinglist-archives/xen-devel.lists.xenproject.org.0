Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8722B5AA9C0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 10:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397447.638026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1rv-000430-3n; Fri, 02 Sep 2022 08:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397447.638026; Fri, 02 Sep 2022 08:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1rv-000414-11; Fri, 02 Sep 2022 08:17:39 +0000
Received: by outflank-mailman (input) for mailman id 397447;
 Fri, 02 Sep 2022 08:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oU1rt-00040y-RO
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 08:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oU1rt-0001iP-Js; Fri, 02 Sep 2022 08:17:37 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.18.194]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oU1rt-0003MO-E1; Fri, 02 Sep 2022 08:17:37 +0000
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
	bh=mrUUPkAojxseD9SK97O8xr9gtyYPWw2Qjxu+eHjVMxg=; b=RVe6mRoB1Hu2zsviYzOOzh2R/y
	cU4E6dZiepoLLS1rdRP+PVx3y65i4zZgRLjmR04cvgnT8W3Kjl/j0SGqw4L1iPlZ7GHZeUrkwcCNd
	syckIwdMwxfZDcOWTlR4AU3gTW835amb3/6xAAo8/+1udjiqJdZN4ZwWaJCKkBzl9FXY=;
Message-ID: <ab95b330-294c-61d6-8490-593567936f9d@xen.org>
Date: Fri, 2 Sep 2022 09:17:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 6/7] xen/arm: introduce xen-evtchn dom0less property
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org,
 bertrand.marquis@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <3899ada4cc8217b45eab4f8d85492b0d5a6a9580.1662023183.git.rahul.singh@arm.com>
 <2142aa46-24a0-e0cb-16c0-95e8f6302ce6@xen.org>
 <alpine.DEB.2.22.394.2209011916190.3931@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2209011916190.3931@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 02/09/2022 03:20, Stefano Stabellini wrote:
>>> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
>>> index 430a1ef445..5579c875d2 100644
>>> --- a/xen/include/xen/device_tree.h
>>> +++ b/xen/include/xen/device_tree.h
>>> @@ -82,6 +82,7 @@ struct dt_device_node {
>>>        dt_phandle phandle;
>>>        char *full_name;
>>>        domid_t used_by; /* By default it's used by dom0 */
>>> +    bool_t static_evtchn_created;
>>
>> I can see why you want to add the boolean in dt_device_node. However, I
>> dislike this approach because this feels an abuse of dt_device_node and the
>> field is only used at boot.
>>
>> So this seems to be a bit of a waste to include it in the structure (even if
>> we are re-using padding today).
>>
>> I don't have a solution that is has trivial as this approach. However, at
>> minimum we should document this is a HACK and should be remove if we need
>> space in the structure.
> 
> I would move static_evtchn_created just above (or below) "bool
> is_protected". It would still re-use the padding and it would be
> closer to another more similar field of the struct.
> 
> The only other option that I can think of would be to use port_is_valid,
> instead of static_evtchn_created, to check that the port has already
> been allocated, but we wouldn't be able to tell if it is a static evtchn
> or simply unavailable for other reasons

You don't need to know the event channel was statically allocated. If 
you have access to the event channel, then you can easily find out what 
is the remote port.

> and it would require more device
> tree parsing.

The parsing is indeed the big cons. Hence, why I hadn't suggest it.

Cheers,

-- 
Julien Grall

