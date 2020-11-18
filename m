Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A53D2B7F3D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 15:18:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29852.59547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfOHk-0002ec-Jc; Wed, 18 Nov 2020 14:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29852.59547; Wed, 18 Nov 2020 14:18:12 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfOHk-0002eD-Ge; Wed, 18 Nov 2020 14:18:12 +0000
Received: by outflank-mailman (input) for mailman id 29852;
 Wed, 18 Nov 2020 14:18:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfOHj-0002e8-CF
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:18:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfOHf-0002Ia-AK; Wed, 18 Nov 2020 14:18:07 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfOHf-00023F-2A; Wed, 18 Nov 2020 14:18:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfOHj-0002e8-CF
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 14:18:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=b9WFhkn0kJbujSeTGVzt/1Wpi4OV0biFcj8AfM3wHPs=; b=AOdjxU2csTAZVvfKJe2WuPgG60
	MqVJS9E/6+q1dfOr+kDMVWrGVFYg3xEdP16Ks4hSLXpauoRvAsBIWAg5MG+2V+l+qLXwSFb62FTKk
	0L2mvNQLJCNfaScOsFnm0/HUxGoTUcv/BBTlAGK/4Cr6WV5xGPNc1KgI53Rh1fFSv8aU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfOHf-0002Ia-AK; Wed, 18 Nov 2020 14:18:07 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfOHf-00023F-2A; Wed, 18 Nov 2020 14:18:07 +0000
Subject: Re: [PATCH v6 0/3] XSA-343 followup patches
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "committers@xenproject.org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
References: <20201109163826.13035-1-jgross@suse.com>
 <aaa3c26f-4bfa-d881-8e72-112e3108f4b5@xen.org>
 <1b54d0bb-deab-f4bd-b773-67a716a1fde1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ddb6025e-a4fb-9691-c71f-7a8f0e5543be@xen.org>
Date: Wed, 18 Nov 2020 14:18:04 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1b54d0bb-deab-f4bd-b773-67a716a1fde1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/11/2020 08:22, Jan Beulich wrote:
> On 17.11.2020 19:13, Julien Grall wrote:
>> On 09/11/2020 16:38, Juergen Gross wrote:
>>> Juergen Gross (3):
>>>     xen/events: access last_priority and last_vcpu_id together
>>>     xen/evtchn: rework per event channel lock
>>>     xen/evtchn: revert 52e1fc47abc3a0123
>>
>> While looking at the list of commits, I noticed that the first patch
>> hasn't been committed. They were all acked/reviewed, so I am a bit
>> puzzled why this was omitted...
>>
>> I have nearly missed as I was expecting the 3 patches to be committed
>> together. May I suggest that in the future we reply to the cover letter
>> and mention which patches are (or not) committed?
>>
>> Regarding patch #1, I will commit it tomorrow unless there are strong
>> objections against.
> 
> Without a clear outline of what would break with the present logic,
> I had previously indicated I'm not convinced of the change. This
> isn't a strong objection, no, but I still wouldn't want to see my
> name associated with it in such a case.

I was under the impression that the committer job is mostly mechanical 
(i.e. collecting tags and applying patches). There are no rules in 
MAINTAINERS that mention committers can decide what gets committed as 
long as maintainers approved it and there are no strong objections.

> Furthermore I clearly view
> this as not a backporting candidate, while the other two are (as I
> did previously indicate). Hence the latter two patches wanted
> re-basing ahead of the first one anyway, to ease the backports.

I understand the backport concern. However, if there were clash, then it 
means you had to resolve them on commit to staging. Surely, they were 
quite minimal otherwise you would have sent an e-mail on xen-devel, right?

> While I will accept there are different views possible here, I also
> don't think sending mail in such a case is a good use of resources.
> The information what was or was not committed is readily available. > Personally I view such mails as at least very close to spam.

This is a matter of perspective. It helps to confirm with the 
contributor that it was fine to merge only part of the series (multiple 
pair of eyes is always better than one...) or mentioning any clash/reworked.

It also makes easier for reviewers to figure out what was committed as 
it can be difficult to know if a patch was merged because commit title 
can be altered (even simply dropping the prefix "xen/" can take a coule 
of more minutes to pinpoint commit).

Therefore, I think there is a value for such e-mail to be sent out. It 
will likely improve coordination among the member of the community.

I would be happy to consider different approach if it fullfills that goal.

Cheers,

-- 
Julien Grall

