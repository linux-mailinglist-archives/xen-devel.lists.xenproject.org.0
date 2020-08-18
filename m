Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CC32480F3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 10:53:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xNN-0003zu-TE; Tue, 18 Aug 2020 08:53:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7xNM-0003zp-UO
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 08:53:48 +0000
X-Inumbo-ID: 79c0e7d4-6f70-4371-b3b2-c59c37d96424
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79c0e7d4-6f70-4371-b3b2-c59c37d96424;
 Tue, 18 Aug 2020 08:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=RdLKUCbO238YRaoIPXTZ6L7abtfGCjHZMTBs7dXeKjM=; b=WfGLszdGwj5o+CLAa13DyQRqZL
 dLhJIU7tb4yITougozRMetWDKkBmPT4aMsru7T+ONZZoWpmb+Ws5ilt25X7vdqQ2dJCrfeBBTXclX
 pgd1mrE8iXuSMeN27WSEDiqgCWXiXbisMHQXPq3O8du5iXMmeBctPzKFPWPjsxFn7M6g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7xNL-0007Km-9x; Tue, 18 Aug 2020 08:53:47 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7xNL-0007Ou-2X; Tue, 18 Aug 2020 08:53:47 +0000
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200722165300.22655-1-julien@xen.org>
 <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
 <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
 <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
 <5a11fa4e-1d57-ad12-ef43-08ed9c5c79dd@xen.org>
 <ca67035b-437b-382f-c3eb-93327042b3d7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7b30d0d7-24d4-b38a-6b97-d6b450574b15@xen.org>
Date: Tue, 18 Aug 2020 09:53:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ca67035b-437b-382f-c3eb-93327042b3d7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 18/08/2020 09:39, Jan Beulich wrote:
> On 14.08.2020 21:25, Julien Grall wrote:
>> Hi Andrew,
>>
>> Sorry for the late answer.
>>
>> On 23/07/2020 14:59, Andrew Cooper wrote:
>>> On 23/07/2020 14:22, Julien Grall wrote:
>>>> Hi Jan,
>>>>
>>>> On 23/07/2020 12:23, Jan Beulich wrote:
>>>>> On 22.07.2020 18:53, Julien Grall wrote:
>>>>>> --- a/xen/arch/x86/irq.c
>>>>>> +++ b/xen/arch/x86/irq.c
>>>>>> @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
>>>>>>           for ( ; ; )
>>>>>>         {
>>>>>> -        int irq = pirq->arch.irq;
>>>>>> +        int irq = read_atomic(&pirq->arch.irq);
>>>>>
>>>>> There we go - I'd be fine this way, but I'm pretty sure Andrew
>>>>> would want this to be ACCESS_ONCE(). So I guess now is the time
>>>>> to settle which one to prefer in new code (or which criteria
>>>>> there are to prefer one over the other).
>>>>
>>>> I would prefer if we have a single way to force the compiler to do a
>>>> single access (read/write).
>>>
>>> Unlikely to happen, I'd expect.
>>>
>>> But I would really like to get rid of (or at least rename)
>>> read_atomic()/write_atomic() specifically because they've got nothing to
>>> do with atomic_t's and the set of functionality who's namespace they share.
>>
>> Would you be happy if I rename both to READ_ONCE() and WRITE_ONCE()?
> 
> Wouldn't this lead to confusion with Linux'es macros of the same names?

 From my understanding, the purpose of READ_ONCE()/WRITE_ONCE() in Linux 
is the same as our read_atomic()/write_atomic().

So I think it would be fine to rename them. An alternative would be port 
the Linux version in Xen and drop ours.

Cheers,

-- 
Julien Grall

