Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9DE24811D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 10:58:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7xRV-0004Cb-FT; Tue, 18 Aug 2020 08:58:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RgDL=B4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k7xRU-0004CW-7s
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 08:58:04 +0000
X-Inumbo-ID: 323ac7de-cc98-4559-9cf5-8c2c94ff3a2c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 323ac7de-cc98-4559-9cf5-8c2c94ff3a2c;
 Tue, 18 Aug 2020 08:58:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0347CABF4;
 Tue, 18 Aug 2020 08:58:28 +0000 (UTC)
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200722165300.22655-1-julien@xen.org>
 <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
 <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
 <bb25c46f-0670-889e-db0b-3031291db640@citrix.com>
 <5a11fa4e-1d57-ad12-ef43-08ed9c5c79dd@xen.org>
 <ca67035b-437b-382f-c3eb-93327042b3d7@suse.com>
 <7b30d0d7-24d4-b38a-6b97-d6b450574b15@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <17176e45-abc9-8b90-50b7-50aacb0e19bf@suse.com>
Date: Tue, 18 Aug 2020 10:57:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <7b30d0d7-24d4-b38a-6b97-d6b450574b15@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 18.08.2020 10:53, Julien Grall wrote:
> Hi Jan,
> 
> On 18/08/2020 09:39, Jan Beulich wrote:
>> On 14.08.2020 21:25, Julien Grall wrote:
>>> Hi Andrew,
>>>
>>> Sorry for the late answer.
>>>
>>> On 23/07/2020 14:59, Andrew Cooper wrote:
>>>> On 23/07/2020 14:22, Julien Grall wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On 23/07/2020 12:23, Jan Beulich wrote:
>>>>>> On 22.07.2020 18:53, Julien Grall wrote:
>>>>>>> --- a/xen/arch/x86/irq.c
>>>>>>> +++ b/xen/arch/x86/irq.c
>>>>>>> @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
>>>>>>>           for ( ; ; )
>>>>>>>         {
>>>>>>> -        int irq = pirq->arch.irq;
>>>>>>> +        int irq = read_atomic(&pirq->arch.irq);
>>>>>>
>>>>>> There we go - I'd be fine this way, but I'm pretty sure Andrew
>>>>>> would want this to be ACCESS_ONCE(). So I guess now is the time
>>>>>> to settle which one to prefer in new code (or which criteria
>>>>>> there are to prefer one over the other).
>>>>>
>>>>> I would prefer if we have a single way to force the compiler to do a
>>>>> single access (read/write).
>>>>
>>>> Unlikely to happen, I'd expect.
>>>>
>>>> But I would really like to get rid of (or at least rename)
>>>> read_atomic()/write_atomic() specifically because they've got nothing to
>>>> do with atomic_t's and the set of functionality who's namespace they share.
>>>
>>> Would you be happy if I rename both to READ_ONCE() and WRITE_ONCE()?
>>
>> Wouldn't this lead to confusion with Linux'es macros of the same names?
> 
> From my understanding, the purpose of READ_ONCE()/WRITE_ONCE() in Linux is the same as our read_atomic()/write_atomic().
> 
> So I think it would be fine to rename them. An alternative would be port the Linux version in Xen and drop ours.

The port of Linux'es {READ,WRITE}_ONCE() is our ACCESS_ONCE(). As pointed
out before, ACCESS_ONCE() and {read,write}_atomic() serve slightly
different purposes, and so far it looks like all of us are lacking ideas
on how to construct something that catches all cases by one single approach.

Jan

