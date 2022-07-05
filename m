Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8955A567975
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 23:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361614.591212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qK6-0005r4-VO; Tue, 05 Jul 2022 21:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361614.591212; Tue, 05 Jul 2022 21:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8qK6-0005oX-R0; Tue, 05 Jul 2022 21:43:10 +0000
Received: by outflank-mailman (input) for mailman id 361614;
 Tue, 05 Jul 2022 21:43:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8qK4-0005oR-V4
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 21:43:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8qK2-0006Hy-R5; Tue, 05 Jul 2022 21:43:06 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8qK2-00078s-Lt; Tue, 05 Jul 2022 21:43:06 +0000
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
	bh=aZY4giMveJyLBS610knTB1DXOy9A34bMaW+08wC7CdM=; b=x+5hZJhWrtVCXCxJRHj0zT/lGM
	Hj99KnERJgt5jRIVR+eUMtV0PZaKhsEUl8fRbiNHygZvlnMzgHdPU10VmL9cz2aiTS+WIsxO5TrDu
	jYkzwf5Bc9g9RVisplY1zy2m8F4xayyL2gTjinxULk5ne0aLJUYdXd+CFBOpZPywAC9M=;
Message-ID: <8c175c10-acb8-1d0b-0868-ed335e1ec7ec@xen.org>
Date: Tue, 5 Jul 2022 22:43:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v1.1] evtchn: add early-out to evtchn_move_pirqs()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <acd0dfae-b045-8505-3f6c-30ce72653660@suse.com>
 <8bca62e3-1075-f1f7-1a92-1a4c58ba2aeb@xen.org>
 <a2685155-1a06-bdcd-5fa8-1cd95ffd200a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a2685155-1a06-bdcd-5fa8-1cd95ffd200a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/07/2022 17:10, Jan Beulich wrote:
> On 26.04.2022 12:44, Julien Grall wrote:
>> On 26/04/2022 11:33, Jan Beulich wrote:
>>> See the code comment. The higher the rate of vCPU-s migrating across
>>> pCPU-s, the less useful this attempted optimization actually is. With
>>> credit2 the migration rate looks to be unduly high even on mostly idle
>>> systems, and hence on large systems lock contention here isn't very
>>> difficult to observe (as was the case for a failed 4.12 osstest flight).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
>>>
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -1559,6 +1559,16 @@ void evtchn_move_pirqs(struct vcpu *v)
>>>        unsigned int port;
>>>        struct evtchn *chn;
>>>    
>>> +    /*
>>> +     * The work done below is an attempt to keep pIRQ-s on the pCPU-s that the
>>> +     * vCPU-s they're to be delivered to run on. In order to limit lock
>>> +     * contention, check for an empty list prior to acquiring the lock. In the
>>> +     * worst case a pIRQ just bound to this vCPU will be delivered elsewhere
>>> +     * until the vCPU is migrated (again) to another pCPU.
>>> +     */
>>> +    if ( !v->pirq_evtchn_head )
>>> +        return;
>>
>> I was hoping Andrew would give some insight (hence why I haven't replied
>> to your previous answer).
>>
>> I am still not really convinced about this optimization. Aside what I
>> wrote about the IRQ raised on the "wrong" pCPU, the lock contention
>> would still be present if an OS is deciding to spread the PIRQs across
>> all the vCPUs.
>>
>> So it seems to me switching to a rwlock would help to address the
>> contention on all the cases.
> 
> But that patch of mine didn't get any ack either, and hence at some
> point I've shelved it.

Looking at v5, your latest answer suggested you were going to drop the 
patch. So I didn't bother to review/ack the latest version.

Now, in the context of this discussion, I think this is better than this 
approach. I will review the other patch.

Cheers,

-- 
Julien Grall

