Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CEC6F56E3
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 13:06:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529121.823160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puAJc-0007cc-Nd; Wed, 03 May 2023 11:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529121.823160; Wed, 03 May 2023 11:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puAJc-0007aH-KM; Wed, 03 May 2023 11:06:32 +0000
Received: by outflank-mailman (input) for mailman id 529121;
 Wed, 03 May 2023 11:06:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puAJb-0007a3-4d
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 11:06:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puAJX-0008Ng-I3; Wed, 03 May 2023 11:06:27 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puAJX-000738-Ak; Wed, 03 May 2023 11:06:27 +0000
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
	bh=n1oLv0j52Jg7zu+EwY2y3c3OMNeTuHcEx0S6u4b3fxM=; b=2WQzMLvM1+lZKuSD/9ZVSNwxHX
	tsqrkqI5jff+/YehoXDRIQwxCwEOX1EvxzezCMrak5bEakJO4MKwPiqW8M+lkWeYkJtZjsV2j6yEZ
	i8kTmPlimc1vPVGkVkh70RzXUoPy4AS/Faww/SHaYZSdY2g+cf+3ihzAj4OGaHh9tIXU=;
Message-ID: <f2850cf3-91cc-f35e-f8b6-67eaf0d27c10@xen.org>
Date: Wed, 3 May 2023 12:06:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH] cmdline: document and enforce "extra_guest_irqs" upper
 bounds
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <54e126fc-484b-92fa-ce66-f901f92ec19c@suse.com>
 <6c5cdffa-f3fb-8f40-c44f-ad7431451929@citrix.com>
 <f3a11fa7-6e39-f7a9-7705-17c3af34273e@suse.com>
 <9f319f7b-5080-2802-09e0-2793d9dad1a7@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9f319f7b-5080-2802-09e0-2793d9dad1a7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 03/05/2023 11:43, Jan Beulich wrote:
> On 04.04.2023 12:40, Jan Beulich wrote:
>> On 04.04.2023 12:34, Andrew Cooper wrote:
>>> On 04/04/2023 10:20 am, Jan Beulich wrote:
>>>> --- a/xen/arch/arm/include/asm/irq.h
>>>> +++ b/xen/arch/arm/include/asm/irq.h
>>>> @@ -52,7 +52,7 @@ struct arch_irq_desc {
>>>>   
>>>>   extern const unsigned int nr_irqs;
>>>>   #define nr_static_irqs NR_IRQS
>>>> -#define arch_hwdom_irqs(domid) NR_IRQS
>>>> +#define arch_hwdom_irqs(d) NR_IRQS
>>>
>>> I know it's not your bug, but this ought to be (d, NR_IRQS) as you're
>>> changing it.
>>
>> I can add this (with a cast to void), but I'll leave the final say to
>> Arm maintainers.
> 
> Arm maintainers,
> 
> may I ask for some kind of statement here? I'd be happy to follow
> Andrew's request, but I don't want to then end up with an "unrelated
> change" objection.

I am OK so long it is mentioned in the commit message.

Cheers,

-- 
Julien Grall

