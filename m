Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E46A4F9B77
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 19:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301709.514940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncsEW-0001Ss-V5; Fri, 08 Apr 2022 17:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301709.514940; Fri, 08 Apr 2022 17:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncsEW-0001Py-Ri; Fri, 08 Apr 2022 17:17:16 +0000
Received: by outflank-mailman (input) for mailman id 301709;
 Fri, 08 Apr 2022 17:17:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ncsEU-0001Ps-PH
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 17:17:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncsER-0007TY-Oy; Fri, 08 Apr 2022 17:17:11 +0000
Received: from [54.239.6.190] (helo=[192.168.16.176])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ncsER-0008VI-Ie; Fri, 08 Apr 2022 17:17:11 +0000
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
	bh=gPBSk+MugYwReZloyZfoZ9xwzZZ4Gb0ZuG3/5p/ix8E=; b=f08zShVfgA/Y9gYtjFtnoNpNKh
	E/FQunVxfpRok4lf06jbzRI4BEftxnHlGWhmwO4J1L0p9NoYqhNNNwEqy4dQvEtKy2knzJHGKs2d8
	53BwnD/TPbqV/9saRK6SueD+9tRx57lUFxq/121b+9qew7LBiXH9RhaN6uCdTUbn+cA0=;
Message-ID: <decf721a-8062-a23f-a810-78fb86a42d1d@xen.org>
Date: Fri, 8 Apr 2022 18:17:09 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <3217803e-16d5-6e2a-bde7-ff9a1237dd39@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/04/2022 13:25, Jan Beulich wrote:
> On 08.04.2022 13:02, Julien Grall wrote:
>> On 08/04/2022 08:16, Jan Beulich wrote:
>>> See the code comment. The higher the rate of vCPU-s migrating across
>>> pCPU-s, the less useful this attempted optimization actually is. With
>>> credit2 the migration rate looks to be unduly high even on mostly idle
>>> systems, and hence on large systems lock contention here isn't very
>>> difficult to observe.
>>
>> "high" and "large" is quite vague. Do you have more details on where you
>> observed this issue and the improvement after this patch?
> 
> I have no data beyond the observation on the failed 4.12 osstest flights,
> where I mentioned I would make such a patch and send out as RFC.

Ok. I think a pointer to the failed 4.12 osstest would be good here.

> 
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
>>
>> AFAIU, the downside is another pCPU (and therefore vCPU) will get
>> disturbed by the interrupt.
> 
> But only rarely, i.e. in case a race would actually have occurred.

Maybe I am too paranoid here. The other side of race is controlled by a 
domain. So wouldn't it be possible to increase how often the race is hit?

Cheers,

-- 
Julien Grall

