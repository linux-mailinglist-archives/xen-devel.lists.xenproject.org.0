Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B0C394158
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 12:49:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133892.249392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lma2y-00041G-LC; Fri, 28 May 2021 10:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133892.249392; Fri, 28 May 2021 10:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lma2y-0003xj-HX; Fri, 28 May 2021 10:48:56 +0000
Received: by outflank-mailman (input) for mailman id 133892;
 Fri, 28 May 2021 10:48:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lma2x-0003xd-CO
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 10:48:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lma2v-0004WK-Mz; Fri, 28 May 2021 10:48:53 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lma2v-0005GG-Gh; Fri, 28 May 2021 10:48:53 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ZJqmUNj1//MsNBfD3g6CRdpHlKU20FoByOfAIatVwEY=; b=uCZsp7CITRez2OimLvHz8MMD/7
	KLmX9x7Topsx/0F4J0R7EEF3vhI4uDYKEf7Lu48Rac+zewO+DFdztuKuJRyhWfbllMwOI5F6Zefpz
	PmgCDYHowDHTRx8t/ypq8iY/RhV3eB9jUhEXPMGLki7NcDnU8XwZyWC+e8v2N4QMCrm8=;
Subject: Re: [PATCH v6 1/3] evtchn: slightly defer lock acquire where possible
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
 <5939858e-1c7c-5658-bc2d-0c9024c74040@suse.com>
 <938eb888-ec15-feb1-19f7-b90dfee822ae@xen.org>
 <YLCqQz9xS4HEpabG@Air-de-Roger>
 <27d54d81-bec8-5bc7-39cd-60e9761e726b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <079f2f2a-0797-b650-ff47-7e595ab29589@xen.org>
Date: Fri, 28 May 2021 11:48:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <27d54d81-bec8-5bc7-39cd-60e9761e726b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 28/05/2021 11:23, Jan Beulich wrote:
> On 28.05.2021 10:30, Roger Pau Monné wrote:
>> On Thu, May 27, 2021 at 07:48:41PM +0100, Julien Grall wrote:
>>> On 27/05/2021 12:28, Jan Beulich wrote:
>>>> port_is_valid() and evtchn_from_port() are fine to use without holding
>>>> any locks. Accordingly acquire the per-domain lock slightly later in
>>>> evtchn_close() and evtchn_bind_vcpu().
>>>
>>> So I agree that port_is_valid() and evtchn_from_port() are fine to use
>>> without holding any locks in evtchn_bind_vcpu(). However, this is misleading
>>> to say there is no problem with evtchn_close().
>>>
>>> evtchn_close() can be called with current != d and therefore, there is a
>>
>> The only instances evtchn_close is called with current != d and the
>> domain could be unpaused is in free_xen_event_channel AFAICT.
> 
> As long as the domain is not paused, ->valid_evtchns can't ever
> decrease: The only point where this gets done is in evtchn_destroy().
> Hence ...
> 
>>> risk that port_is_valid() may be valid and then invalid because
>>> d->valid_evtchns is decremented in evtchn_destroy().
>>
>> Hm, I guess you could indeed have parallel calls to
>> free_xen_event_channel and evtchn_destroy in a way that
>> free_xen_event_channel could race with valid_evtchns getting
>> decreased?
> 
> ... I don't see this as relevant.
> 
>>> Thankfully the memory is still there. So the current code is okayish and I
>>> could reluctantly accept this behavior to be spread. However, I don't think
>>> this should be left uncommented in both the code (maybe on top of
>>> port_is_valid()?) and the commit message.
>>
>> Indeed, I think we need some expansion of the comment in port_is_valid
>> to clarify all this. I'm not sure I understand it properly myself when
>> it's fine to use port_is_valid without holding the per domain event
>> lock.
> 
> Because of the above property plus the fact that even if
> ->valid_evtchns decreases, the underlying struct evtchn instance
> will remain valid (i.e. won't get de-allocated, which happens only
> in evtchn_destroy_final()), it is always fine to use it without
> lock. With this I'm having trouble seeing what would need adding
> to port_is_valid()'s commentary.

Lets take the example of free_xen_event_channel(). The function is 
checking if the port is valid. If it is, then evtchn_close() will be called.

At this point, it would be fair for a developper to assume that 
port_is_valid() will also return true in event_close().

To push to the extreme, if free_xen_event_channel() was the only caller 
of evtchn_close(), one could argue that the check in evtchn_close() 
could be a BUG_ON().

However, this can't be because this would sooner or later turn to an XSA.

Effectively, it means that is_port_valid() *cannot* be used in an 
ASSERT()/BUG_ON() and every caller should check the return even if the 
port was previously validated.

So I think a comment on top of is_port_valid() would be really useful 
before someone rediscover it the hard way.

Cheers,

-- 
Julien Grall

