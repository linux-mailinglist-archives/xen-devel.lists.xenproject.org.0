Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8D22A0508
	for <lists+xen-devel@lfdr.de>; Fri, 30 Oct 2020 13:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.15755.38886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYTDB-0003bq-1S; Fri, 30 Oct 2020 12:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15755.38886; Fri, 30 Oct 2020 12:08:53 +0000
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
	id 1kYTDA-0003bG-UH; Fri, 30 Oct 2020 12:08:52 +0000
Received: by outflank-mailman (input) for mailman id 15755;
 Fri, 30 Oct 2020 12:08:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYTD9-0003ao-II
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:08:51 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d2200e26-f295-475b-a37e-4fc2f6127583;
 Fri, 30 Oct 2020 12:08:50 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYTD6-0007if-UM; Fri, 30 Oct 2020 12:08:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYTD6-0004ip-ML; Fri, 30 Oct 2020 12:08:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYTD9-0003ao-II
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 12:08:51 +0000
X-Inumbo-ID: d2200e26-f295-475b-a37e-4fc2f6127583
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d2200e26-f295-475b-a37e-4fc2f6127583;
	Fri, 30 Oct 2020 12:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Gm3nxBLZ1PiF/ODv6qA2U89RYld7CiI8AA/Tzobt7u4=; b=GBqgaBFiCJWZaxYR/oHDWuXiTY
	QQj9ulZqb2TQ8LV9IJsc6SmUB+NRXFujbveSWe7UtKUQTssdp9rNBcUSPs4TOhtAKb76dhhTNIg3n
	9gGnyU0tPe5S6tP+GcjbF5XDX/mPB3ZsSxBysR5Tkw+frtQX+UuXErXBsvBDsR35DmN8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYTD6-0007if-UM; Fri, 30 Oct 2020 12:08:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYTD6-0004ip-ML; Fri, 30 Oct 2020 12:08:48 +0000
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
From: Julien Grall <julien@xen.org>
Message-ID: <60559ccf-f8f5-4c54-0867-b8a893df3f0c@xen.org>
Date: Fri, 30 Oct 2020 12:08:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <33ff45e9-d869-9262-29e0-fa66e3ffb726@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 30/10/2020 12:00, Jan Beulich wrote:
> On 30.10.2020 11:57, Julien Grall wrote:
>> On 20/10/2020 15:10, Jan Beulich wrote:
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -449,6 +449,13 @@ int evtchn_bind_virq(evtchn_bind_virq_t
>>>    
>>>        spin_unlock_irqrestore(&chn->lock, flags);
>>>    
>>> +    /*
>>> +     * If by any, the update of virq_to_evtchn[] would need guarding by
>>> +     * virq_lock, but since this is the last action here, there's no strict
>>> +     * need to acquire the lock. Hnece holding event_lock isn't helpful
>>
>> s/Hnece/Hence/
>>
>>> +     * anymore at this point, but utilize that its unlocking acts as the
>>> +     * otherwise necessary smp_wmb() here.
>>> +     */
>>>        v->virq_to_evtchn[virq] = bind->port = port;
>>
>> I think all access to v->virq_to_evtchn[virq] should use ACCESS_ONCE()
>> or {read, write}_atomic() to avoid any store/load tearing.
> 
> IOW you're suggesting this to be the subject of a separate patch?
> I don't think such a conversion belongs here (nor even in this
> series, seeing the much wider applicability of such a change
> throughout the code base).
> Or are you seeing anything here which
> would require such a conversion to be done as a prereq?

Yes, your comment implies that it is fine to write to virq_to_evtchn[] 
without the lock taken. However, this is *only* valid if the compiler 
doesn't tear down load/store.

So this is a pre-req to get your comment valid.

Cheers,

-- 
Julien Grall

