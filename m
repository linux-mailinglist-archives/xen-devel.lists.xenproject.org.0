Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22BB59FE72
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 17:37:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392858.631460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQsR7-0005TB-6h; Wed, 24 Aug 2022 15:36:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392858.631460; Wed, 24 Aug 2022 15:36:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQsR7-0005Qu-3w; Wed, 24 Aug 2022 15:36:57 +0000
Received: by outflank-mailman (input) for mailman id 392858;
 Wed, 24 Aug 2022 15:36:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQsR5-0005Qo-Ld
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 15:36:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQsR5-0007T2-9E; Wed, 24 Aug 2022 15:36:55 +0000
Received: from [54.239.6.185] (helo=[192.168.29.89])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQsR5-0001oN-2z; Wed, 24 Aug 2022 15:36:55 +0000
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
	bh=FT86BBlkB/8YqApABrhf3exntKJZ8d6SowYFvEjWfRg=; b=Hn2Dmyr36XjXmuwliXUDK+kTyL
	+CRwMf4bgD0+S5i+eMvyiODFhNKVSvRfdYyX4XFMQmlSkJzzqpEGDhHxjs5XTeKAEpPiwZjz4+ekv
	RadGQCz8srQrhiQ2SjVBuplLmeiIseAPrcAKj+TSVo0a9cOFv3JXZzKpp5G5WX/M0wLA=;
Message-ID: <685e53cc-1b83-8d66-7086-dad4135c0587@xen.org>
Date: Wed, 24 Aug 2022 16:36:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property value
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com>
 <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org>
 <1E823DBF-8576-4E26-B12D-B69CE581F36F@arm.com>
 <c9330b72-193c-5478-9bad-9593ac7398a9@xen.org>
 <3D33311C-5FBA-4C46-A18F-105DE814C306@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3D33311C-5FBA-4C46-A18F-105DE814C306@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/08/2022 15:42, Rahul Singh wrote:
>> On 24 Aug 2022, at 1:59 pm, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 24/08/2022 13:15, Rahul Singh wrote:
>>> Hi Julien,
>>
>> Hi Rahul,
>>
>>> Please let me know your view on this.
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index bfe7bc6b36..a1e23eee59 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -3562,12 +3562,7 @@ static int __init construct_domU(struct domain *d,
>>>     if ( rc == -EILSEQ ||
>>>       rc == -ENODATA ||
>>>       (rc == 0 && !strcmp(dom0less_enhanced, “enabled”)) )
>>> -  {
>>> -    if ( hardware_domain )
>>>         kinfo.dom0less_enhanced = true;
>>> -    else
>>> -      panic(“Tried to use xen,enhanced without dom0\n”);
>>> -  }
>>
>> You can't use "xen,enhanced" without dom0. In fact, you will end up to dereference NULL in alloc_xenstore_evtchn(). That's because "xen,enhanced" means the domain will be able to use Xenstored.
>>
>> Now if you want to support your feature without a dom0. Then I think we want to introduce an option which would be the same as "xen,enhanced" but doesn't expose Xenstored.
> 
> If we modify the patch as below we can use the "xen,enhanced" for domUs without dom0.
> I tested the patch and its works fine. Do you see any issue with this approach?

Yes. For two reasons:
  1) It is muddying the meaning of "xen,enhanced". In particular a user 
may not realize that Xenstore is not available if dom0 is not present.
  2) It would be more complicated to handle the case where Xenstored 
lives in a non-dom0 domain. I am not aware of anyone wanting this on Arm 
yet, but I don't want to close the door.

So if you want to support create "xen,xen" without all the rest. Then I 
think we need a different property value. I don't have a good suggestion 
for the name.

Cheers,

-- 
Julien Grall

