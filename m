Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E20A4FBA53
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 13:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302982.516922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrn2-0003vm-HI; Mon, 11 Apr 2022 11:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302982.516922; Mon, 11 Apr 2022 11:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndrn2-0003tZ-Dt; Mon, 11 Apr 2022 11:01:00 +0000
Received: by outflank-mailman (input) for mailman id 302982;
 Mon, 11 Apr 2022 11:00:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ndrn1-0003tI-EE
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 11:00:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndrmz-0004PE-8o; Mon, 11 Apr 2022 11:00:57 +0000
Received: from [54.239.6.185] (helo=[192.168.17.122])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ndrmz-00054C-27; Mon, 11 Apr 2022 11:00:57 +0000
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
	bh=FOX8GuNpCUj/15E/7UyVQl9Ogngec06088pAumUE6tM=; b=AM+/PUg3DDa5hJO0xVVmJT9UIY
	d0FTQnu4cT/6gjBGK3zIDCoF/zb4QqzLkiILNw96gH+P/BZNiMGeFqAKAQJ66ibkF2TKM1TtXn/Og
	Rneac+nBboyho/NJrVzCcBTlnRaxyHUdRGvPd6826qgK5ll5+GZb9NsazlxgNHzQglh8=;
Message-ID: <afea970d-fe71-5f28-edda-c51e80d6e3d3@xen.org>
Date: Mon, 11 Apr 2022 12:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH RFC] evtchn: add early-out to evtchn_move_pirqs()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0fbf06a-be3c-37bd-2abf-599912ad9bf5@suse.com>
 <42d16ff2-725d-ae10-ba6b-561487252125@xen.org>
 <3217803e-16d5-6e2a-bde7-ff9a1237dd39@suse.com>
 <decf721a-8062-a23f-a810-78fb86a42d1d@xen.org>
 <747017ab-9aa9-b958-8cbf-42c2cc3ffdb1@suse.com>
 <0f18eb04-7b39-da75-fcf4-f765d8ea28b1@xen.org>
 <e41da164-7aeb-3d99-ef4d-17c591af7e37@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e41da164-7aeb-3d99-ef4d-17c591af7e37@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/04/2022 11:45, Jan Beulich wrote:
> On 11.04.2022 12:25, Julien Grall wrote:
>> On 11/04/2022 07:13, Jan Beulich wrote:
>>>>>>> --- a/xen/common/event_channel.c
>>>>>>> +++ b/xen/common/event_channel.c
>>>>>>> @@ -1559,6 +1559,16 @@ void evtchn_move_pirqs(struct vcpu *v)
>>>>>>>          unsigned int port;
>>>>>>>          struct evtchn *chn;
>>>>>>>      
>>>>>>> +    /*
>>>>>>> +     * The work done below is an attempt to keep pIRQ-s on the pCPU-s that the
>>>>>>> +     * vCPU-s they're to be delivered to run on. In order to limit lock
>>>>>>> +     * contention, check for an empty list prior to acquiring the lock. In the
>>>>>>> +     * worst case a pIRQ just bound to this vCPU will be delivered elsewhere
>>>>>>> +     * until the vCPU is migrated (again) to another pCPU.
>>>>>>> +     */
>>>>>>
>>>>>> AFAIU, the downside is another pCPU (and therefore vCPU) will get
>>>>>> disturbed by the interrupt.
>>>>>
>>>>> But only rarely, i.e. in case a race would actually have occurred.
>>>>
>>>> Maybe I am too paranoid here. The other side of race is controlled by a
>>>> domain. So wouldn't it be possible to increase how often the race is hit?
>>>
>>> Yes, of course - just to harm itself.
>>
>> Are you sure? Wouldn't this also harm the next vCPU running on the pCPU
>> because it will get interrupted more often?
> 
> Possibly, sure. But we don't make any promises here. And recall that
> this optimization as a whole has been put under question in the past.

I don't remember this discussion. Do you have a pointer?

> If we'd drop it, we'd also impact various vCPU-s in not really
> predictable ways.

Cheers,

-- 
Julien Grall

