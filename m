Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E20AB2A05B3
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 13:46:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15791.38946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYTnQ-0007Xw-37; Fri, 30 Oct 2020 12:46:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15791.38946; Fri, 30 Oct 2020 12:46:20 +0000
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
	id 1kYTnP-0007XX-W8; Fri, 30 Oct 2020 12:46:20 +0000
Received: by outflank-mailman (input) for mailman id 15791;
 Fri, 30 Oct 2020 12:46:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYTnN-0007XS-Uw
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:46:18 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2575f12-8560-49e2-a2d4-b84852c67bc9;
 Fri, 30 Oct 2020 12:46:16 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYTnK-0008So-V8; Fri, 30 Oct 2020 12:46:14 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYTnK-0007SR-L4; Fri, 30 Oct 2020 12:46:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYTnN-0007XS-Uw
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:46:18 +0000
X-Inumbo-ID: f2575f12-8560-49e2-a2d4-b84852c67bc9
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f2575f12-8560-49e2-a2d4-b84852c67bc9;
	Fri, 30 Oct 2020 12:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Xzp12ysCBigmTq9LkdMqByaOIIb2u7L0l96IThSm3EM=; b=I8422qnQLLIpTrCUijUCGx6/hG
	G0psuvRhZ0ZktqbuW9xqgQiGP8Ll0BB6lgxziXV+objqgtIw2JyaNpRAwMUQcqMwA/5pkSlaLIn9t
	hfCeeygNmZeR7tSAUTVQ+cNCfLQPOhgvT9yaNbagwudpG+2M6rtLHkgF1ouRMKKiMLEA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYTnK-0008So-V8; Fri, 30 Oct 2020 12:46:14 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYTnK-0007SR-L4; Fri, 30 Oct 2020 12:46:14 +0000
Subject: Re: [PATCH v2 6/8] evtchn: convert vIRQ lock to an r/w one
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <53a2fc39-1bf1-38ce-bbdf-b512c5279b4f@suse.com>
 <6dec1d48-b8c8-6122-087c-38f36f30596e@xen.org>
 <33ff45e9-d869-9262-29e0-fa66e3ffb726@suse.com>
 <60559ccf-f8f5-4c54-0867-b8a893df3f0c@xen.org>
 <478e8353-e8f9-4cee-20d6-50e1619ac680@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <24caaeea-9c31-23fb-f643-bec75d2f5362@xen.org>
Date: Fri, 30 Oct 2020 12:46:12 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <478e8353-e8f9-4cee-20d6-50e1619ac680@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 30/10/2020 12:25, Jan Beulich wrote:
> On 30.10.2020 13:08, Julien Grall wrote:
>> On 30/10/2020 12:00, Jan Beulich wrote:
>>> On 30.10.2020 11:57, Julien Grall wrote:
>>>> On 20/10/2020 15:10, Jan Beulich wrote:
>>>>> --- a/xen/common/event_channel.c
>>>>> +++ b/xen/common/event_channel.c
>>>>> @@ -449,6 +449,13 @@ int evtchn_bind_virq(evtchn_bind_virq_t
>>>>>     
>>>>>         spin_unlock_irqrestore(&chn->lock, flags);
>>>>>     
>>>>> +    /*
>>>>> +     * If by any, the update of virq_to_evtchn[] would need guarding by
>>>>> +     * virq_lock, but since this is the last action here, there's no strict
>>>>> +     * need to acquire the lock. Hnece holding event_lock isn't helpful
>>>>
>>>> s/Hnece/Hence/
>>>>
>>>>> +     * anymore at this point, but utilize that its unlocking acts as the
>>>>> +     * otherwise necessary smp_wmb() here.
>>>>> +     */
>>>>>         v->virq_to_evtchn[virq] = bind->port = port;
>>>>
>>>> I think all access to v->virq_to_evtchn[virq] should use ACCESS_ONCE()
>>>> or {read, write}_atomic() to avoid any store/load tearing.
>>>
>>> IOW you're suggesting this to be the subject of a separate patch?
>>> I don't think such a conversion belongs here (nor even in this
>>> series, seeing the much wider applicability of such a change
>>> throughout the code base).
>>> Or are you seeing anything here which
>>> would require such a conversion to be done as a prereq?
>>
>> Yes, your comment implies that it is fine to write to virq_to_evtchn[]
>> without the lock taken. However, this is *only* valid if the compiler
>> doesn't tear down load/store.
>>
>> So this is a pre-req to get your comment valid.
> 
> That's an interesting way to view it. I'm only adding the comment,
> without changing the code here. Iirc it was you who asked me to
> add the comment. 

Yes I asked this comment because it makes easier for reader to figure 
out how your code works. But this doesn't mean I wanted to have a 
misleading comment.

If you don't plan to handle the ACCESS_ONCE(), then it is best to be 
open to say it in the comment.

> And now this is leading to you wanting me to do
> entirely unrelated changes, when the code base is full of similar
> assumptions towards no torn accesses? 

I was expecting you writing that :). Well, small steps are always easier 
in order to achieve a consistent code base.

To me, this is similar to some of the reviewers pushing contributors to 
update the coding style of area touched. The difference here is without 
following a memory model, you are at the mercy of the compiler and XSAs.

> (Yes, I certainly can add
> such a patch, but no, I don't think this should be a requirement
> here.)

That's ok. But please update the comment to avoid misleading the reader.

An alternative would be to use the write_lock() here. This shouldn't 
impact that much the performance and nicely fix the issue.

Cheers,

-- 
Julien Grall

