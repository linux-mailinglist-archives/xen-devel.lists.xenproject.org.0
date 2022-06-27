Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE0555BAA1
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 17:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356847.585160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5qHJ-0007vs-KY; Mon, 27 Jun 2022 15:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356847.585160; Mon, 27 Jun 2022 15:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5qHJ-0007u6-Hh; Mon, 27 Jun 2022 15:03:53 +0000
Received: by outflank-mailman (input) for mailman id 356847;
 Mon, 27 Jun 2022 15:03:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o5qHI-0007u0-5T
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 15:03:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5qHH-0005sQ-Vi; Mon, 27 Jun 2022 15:03:51 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.2.226]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5qHH-0006RW-Pi; Mon, 27 Jun 2022 15:03:51 +0000
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
	bh=NRtOrs33NpR65ofFeatqjuzydiEEvK49qJdVP+UX3Zg=; b=07hyKt8+90juTH6njdrOxLSpkH
	iK0DIN4GQkdQUF9a9kdfQBAZlfNLWhtr0JGXtEuwXmXmitUijMFFeI6H0Cx5DqRjtoIfMaNjKaOXV
	fbgQo904/jjT6nC+9+Gs40IEb/9pIBU7NGLjZgPUn9VYrfS9mH6IHMWRlD8RlhSLMvWA=;
Message-ID: <10c2bc1f-f035-648f-3b9d-7c29007d3527@xen.org>
Date: Mon, 27 Jun 2022 16:03:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] public/io: xs_wire: Document that EINVAL should
 always be first in xsd_errors
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com, Julien Grall <jgrall@amazon.com>
References: <20220627123635.3416-1-julien@xen.org>
 <20220627123635.3416-2-julien@xen.org>
 <d0330408-2301-6145-f46b-c3da302a1edb@suse.com>
 <7af3e9ec-59fe-32ce-2a9d-b8dab57d0e9e@xen.org>
 <f7c0d5c1-01da-4dca-42ac-ce17c6109371@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f7c0d5c1-01da-4dca-42ac-ce17c6109371@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 27/06/2022 15:50, Juergen Gross wrote:
> On 27.06.22 16:48, Julien Grall wrote:
>> Hi,
>>
>> On 27/06/2022 15:31, Juergen Gross wrote:
>>> On 27.06.22 14:36, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Some tools (e.g. xenstored) always expect EINVAL to be first in 
>>>> xsd_errors.
>>>>
>>>> Document it so, one doesn't add a new entry before hand by mistake.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>
>>>> ----
>>>>
>>>> I have tried to add a BUILD_BUG_ON() but GCC complained that the value
>>>> was not a constant. I couldn't figure out a way to make GCC happy.
>>>>
>>>> Changes in v2:
>>>>      - New patch
>>>> ---
>>>>   xen/include/public/io/xs_wire.h | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/xen/include/public/io/xs_wire.h 
>>>> b/xen/include/public/io/xs_wire.h
>>>> index c1ec7c73e3b1..dd4c9c9b972d 100644
>>>> --- a/xen/include/public/io/xs_wire.h
>>>> +++ b/xen/include/public/io/xs_wire.h
>>>> @@ -76,6 +76,7 @@ static struct xsd_errors xsd_errors[]
>>>>   __attribute__((unused))
>>>>   #endif
>>>>       = {
>>>> +    /* /!\ Some users (e.g. xenstored) expect EINVAL to be the 
>>>> first entry. */
>>>>       XSD_ERROR(EINVAL),
>>>>       XSD_ERROR(EACCES),
>>>>       XSD_ERROR(EEXIST),
>>>
>>> What about another approach, like:
>>
>> In place of what? I still think we need the comment because this 
>> assumption is not part of the ABI (AFAICT xs_wire.h is meant to be 
>> stable).
>>
>> At which point, I see limited reason to fix xenstored_core.c.
>>
>> But I would have really prefer to use a BUILD_BUG_ON() (or similar) so 
>> we can catch any misue a build. Maybe I should write a small program 
>> that is executed at compile time?
> 
> My suggestion removes the need for EINVAL being the first entry

xsd_errors[] is part of the stable ABI. If Xenstored is already 
"misusing" it, then I wouldn't be surprised if other software rely on 
this as well.

Therefore, I don't really see how fixing Xenstored would allow us to 
remove this restriction.

The only reason this was spotted is by Jan reviewing C Xenstored. 
Without that, it would have problably took a long time to notice
this change (I don't think there are many other errno used by Xenstored
and xsd_errors). So I think the risk is not worth the effort.

At least, this is not a patch I would be willing to have my name on 
(either as a signed-off-by or acked-by).

Cheers,

-- 
Julien Grall

