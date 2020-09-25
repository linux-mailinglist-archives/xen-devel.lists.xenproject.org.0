Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26453278D79
	for <lists+xen-devel@lfdr.de>; Fri, 25 Sep 2020 18:01:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLq9R-0006DL-3G; Fri, 25 Sep 2020 16:00:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O9+A=DC=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kLq9Q-0006DG-Hw
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 16:00:48 +0000
X-Inumbo-ID: 0c2ab76a-52b1-4c2b-aef8-92b13597915c
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c2ab76a-52b1-4c2b-aef8-92b13597915c;
 Fri, 25 Sep 2020 16:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=HbzG00i7BHwrbHhJXibnF070ULYX7ewOL+zQxVyAIb8=; b=Xz9IlKeLsW5KVqiGhJb+7FKLC1
 rUbAMRXDSx2Ft4auU15vvaqWGC/GaT+7Ad5YU04oluiZpNA0jCg7wOMYBM8fmYpLz53Lp06RimbyK
 hQRTHGbfjqzefXOlk6YhYjfKIRzR0v/v/P/CpmtbiqsQMcILHcp7xqC5IxmlYR4C7j8w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kLq9G-0007AB-TB; Fri, 25 Sep 2020 16:00:38 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kLq9G-0005UU-Lf; Fri, 25 Sep 2020 16:00:38 +0000
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
 <8237e286-168f-a4e7-be8b-aba5ff781e7c@xen.org>
 <706b94ae-ca05-2218-6025-e5d62297dda6@suse.com>
 <3ad0529d-ad55-8864-1df2-193eaf104c1f@xen.org>
 <6d6d7550-8847-267e-49f2-0ca098ef97ad@suse.com>
 <2a62f5e4-9915-bcd7-05b3-77663c995a13@xen.org>
 <9adeac3b-2b0f-6e9d-aa82-fd966e984fa0@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <52dba8e8-5976-48a2-7a74-ddf877880c6e@xen.org>
Date: Fri, 25 Sep 2020 17:00:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <9adeac3b-2b0f-6e9d-aa82-fd966e984fa0@suse.com>
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

Hi Jan,

On 25/09/2020 16:36, Jan Beulich wrote:
> On 25.09.2020 16:33, Julien Grall wrote:
>> On 25/09/2020 14:58, Jan Beulich wrote:
>>> On 25.09.2020 15:16, Julien Grall wrote:
>>>> Fair enough. I would still like to consider a way where we could avoid
>>>> to hack xsm_* because we have the interrupts disabled.
>>>
>>> Well, from a conceptual pov it's at least questionable for XSM to
>>> need any memory allocations at all when merely being asked for
>>> permission. And indeed the need for it arises solely from its
>>> desire to cache the result, for the sake of subsequent lookups.
>>>
>>> I also find it odd that there's an XSM check on the send path in
>>> the first place. This isn't just because it would seem to me that
>>> it should be decided at binding time whether sending is permitted
>>> - I may easily be missing something in the conceptual model here.
>>> It's also because __domain_finalise_shutdown() too uses
>>> evtchn_send(), and I didn't think this one should be subject to
>>> any XSM check (just like send_guest_*() aren't).
>>
>> Maybe this is the first question we need to answer?
> 
> Indeed that was the question I asked myself before putting together
> the patch. Yet I have no idea who could answer it, with Daniel
> having gone silent for quite long a time now. Hence I didn't even
> put up the question, but instead tried to find a halfway reasonable
> solution. 

IIRC, XSM is used by OpenXT and QubeOS. So I have CCed them to get some 
input.

> After all it's not just the master branch which is stuck
> right now.

> And from a backporting perspective having the "fix"
> touch code which hasn't had much churn over the last years may even
> be beneficial.

Right, but dropping xsm_evtchn_send() (if it is not possible) is going 
to be even better. So lets explore this solution first.

> Plus, as said, the minimal change of making Flask
> avoid xmalloc() when IRQs are off is a change that ought to be made
> anyway imo, in order to favor proper functioning over performance.
If there are other use, then yes. What I don't like in the current 
approach is we are hijacking xsm_event_send() for pre-allocating memory.

Cheers,

-- 
Julien Grall

