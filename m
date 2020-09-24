Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAED9276F7F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 13:10:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLP8t-0001lf-Tc; Thu, 24 Sep 2020 11:10:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UtQo=DB=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kLP8s-0001la-Lm
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 11:10:26 +0000
X-Inumbo-ID: 3fca06ea-b114-4c08-b485-3cb7138ee2eb
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3fca06ea-b114-4c08-b485-3cb7138ee2eb;
 Thu, 24 Sep 2020 11:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=D530BXogGKCPJld0qZyz9AkhHP0qtzX+xohU+OQzLNI=; b=pS92qBFqyBnHCAESvhZ9aCjs3r
 86meQwkCXQwaHikIFiPDcxpUQki33nj0PPar5ziTklw0r9wfHbli4sOQ3fXkyUPQYG9LmqfmMZ/Bk
 h/X/jXP5317+X4Ocv6GtqMXaY07X/JEyRgAeieiTPbyvFF0yezlcgcxYD6lDmiiEpUaM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kLP8r-0004BR-1g; Thu, 24 Sep 2020 11:10:25 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kLP8q-00037L-PW; Thu, 24 Sep 2020 11:10:24 +0000
Subject: Re: Memory ordering question in the shutdown deferral code
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Durrant, Paul" <pdurrant@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, 
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan"
 <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <468576ba-8d3f-98e9-e65e-1128b5220d40@xen.org>
 <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
 <92a6373003e142e9943a4057024a2616@EX13D32EUC003.ant.amazon.com>
 <ad81f6ac-6127-bea8-a503-d16d3dc175df@xen.org>
 <alpine.DEB.2.21.2009231541410.1495@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <b35509a0-42dd-5442-1a79-d57fc1e9170b@xen.org>
Date: Thu, 24 Sep 2020 12:10:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009231541410.1495@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi,

On 23/09/2020 23:57, Stefano Stabellini wrote:
> On Mon, 21 Sep 2020, Julien Grall wrote:
>> On 21/09/2020 13:55, Durrant, Paul wrote:
>>>> (+ Xen-devel)
>>>>
>>>> Sorry I forgot to CC xen-devel.
>>>>
>>>> On 21/09/2020 12:38, Julien Grall wrote:
>>>>> Hi all,
>>>>>
>>>>> I have started to look at the deferral code (see
>>>>> vcpu_start_shutdown_deferral()) because we need it for LiveUpdate and
>>>>> Arm will soon use it.
>>>>>
>>>>> The current implementation is using an smp_mb() to ensure ordering
>>>>> between a write then a read. The code looks roughly (I have slightly
>>>>> adapted it to make my question more obvious):
>>>>>
>>>>> domain_shutdown()
>>>>>        d->is_shutting_down = 1;
>>>>>        smp_mb();
>>>>>        if ( !vcpu0->defer_shutdown )
>>>>>        {
>>>>>          vcpu_pause_nosync(v);
>>>>>          v->paused_for_shutdown = 1;
>>>>>        }
>>>>>
>>>>> vcpu_start_shutdown_deferral()
>>>>>        vcpu0->defer_shutdown = 1;
>>>>>        smp_mb();
>>>>>        if ( unlikely(d->is_shutting_down) )
>>>>>          vcpu_check_shutdown(v);
>>>>>
>>>>>        return vcpu0->defer_shutdown;
>>>>>
>>>>> smp_mb() should only guarantee ordering (this may be stronger on some
>>>>> arch), so I think there is a race between the two functions.
>>>>>
>>>>> It would be possible to pause the vCPU in domain_shutdown() because
>>>>> vcpu0->defer_shutdown wasn't yet seen.
>>>>>
>>>>> Equally, vcpu_start_shutdown_deferral() may not see d->is_shutting_down
>>>>> and therefore Xen may continue to send the I/O. Yet the vCPU will be
>>>>> paused so the I/O will never complete.
>>>>>
>>>
>>> The barrier enforces global order, right?
>>
>> It is not clear to me what you mean by "global ordering". This seems to
>> suggest a very expensive synchronization barrier between all the processors.
>>
>>  From an arch-agnostic PoV, smp_mb() will enforce an ordering between
>> loads/stores but it doesn't guarantee *when* they will be observed.
>>
>>> So, if domain_shutdown() pauses the vcpu then is_shutting_down must
>>> necessarily be visible all cpus.
>>
>> That's not the guarantee provided by smp_mb() (see above).
> 
> 
> I simplified the code further to help us reason about it:
> 
> 
>     thread#1 |  thread#2
>              |
> 1) WRITE A  |  WRITE B
> 2) BARRIER  |  BARRIER
> 3) READ B   |  READ A

Thank you for writing a simpler example. It allowed me to find a litmus 
(see [1]) and now I understood why it works. See more below.

> 
> 
> I think it is (theoretically) possible for thread#1 to be at 1) and
> about to do 2), while thread#2 goes ahead and does 1) 2) 3).

Well it is not that theoritical :). There are many reasons where this 
situation can happen. To only cite a few:
     - Threads may run on the same pCPUs
     - The pCPU running the threads may get interrupted
     - The data modified is not in the L1 cache, there will be delay to 
access it.

> By the time
> thread#1 does 2), thread#2 has already completed the entire sequence.
> 
> If thread#2 has already done 2), and thread#1 is about to do 3), then I
> think we are guaranteed that thread#1 will see the new value of B. > Or
> is this the core of the issue we are discussing?

No you are right. I got confused because smp_mb() doesn't guarantee when 
the write/read is completed.

So I blindly assumed that the ordering would be done just at the 
processor level. Instead, the ordering is done at the innershareable 
level (e.g between all the processors) as we are using dmb ish.

Assuming A and B are initialized to 0 and we are writing 1, then there 
is no way for both thread to read 0. In which case, the existing 
shutdown code is fine.

Cheers,

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/memory-model/litmus-tests/SB+fencembonceonces.litmus

-- 
Julien Grall

