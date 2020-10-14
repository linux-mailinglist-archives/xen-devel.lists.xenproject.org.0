Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131D028DA70
	for <lists+xen-devel@lfdr.de>; Wed, 14 Oct 2020 09:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6463.17286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSbCT-0002SV-6F; Wed, 14 Oct 2020 07:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6463.17286; Wed, 14 Oct 2020 07:27:53 +0000
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
	id 1kSbCT-0002S8-2q; Wed, 14 Oct 2020 07:27:53 +0000
Received: by outflank-mailman (input) for mailman id 6463;
 Wed, 14 Oct 2020 07:27:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kSbCR-0002Rt-G6
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 07:27:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c398f271-8aa0-41ec-9b99-8201c4793c60;
 Wed, 14 Oct 2020 07:27:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9E50AD63;
 Wed, 14 Oct 2020 07:27:49 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kSbCR-0002Rt-G6
	for xen-devel@lists.xenproject.org; Wed, 14 Oct 2020 07:27:51 +0000
X-Inumbo-ID: c398f271-8aa0-41ec-9b99-8201c4793c60
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c398f271-8aa0-41ec-9b99-8201c4793c60;
	Wed, 14 Oct 2020 07:27:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602660469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VJSVu3cb0Lt1DOQU4xWTNDZvR80RC8TipUAb5c2w8ao=;
	b=ZHeLADdnW46w9q0TGqSJYY7sGXel9LgkbehVr4U4WIpRWah7mOuPCt/zOnqNQ54l39W8uo
	lcCkiSwki24P8lRlXdQT0nGI2NxjzGwiLTRWEkn3SKLuq0s2Wfgb218LSBlQjkb1QoITOK
	qakvwIUv4aTjE2i7bVyiUx5J0SeUbyw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A9E50AD63;
	Wed, 14 Oct 2020 07:27:49 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] xen/evtchn: rework per event channel lock
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-3-jgross@suse.com>
 <75c5328c-c061-7ddf-a34d-0cd8b93043fc@suse.com>
 <dbaff977-796b-bbd3-64e5-fbe30817077f@suse.com>
 <ae78449c-fb37-7403-ee75-ef53085df26a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <45508e8d-0853-00f3-9f83-68192c74fb72@suse.com>
Date: Wed, 14 Oct 2020 09:27:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ae78449c-fb37-7403-ee75-ef53085df26a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.10.20 08:52, Jan Beulich wrote:
> On 14.10.2020 08:00, Jürgen Groß wrote:
>> On 13.10.20 17:28, Jan Beulich wrote:
>>> On 12.10.2020 11:27, Juergen Gross wrote:
>>>> --- a/xen/include/xen/event.h
>>>> +++ b/xen/include/xen/event.h
>>>> @@ -105,6 +105,45 @@ void notify_via_xen_event_channel(struct domain *ld, int lport);
>>>>    #define bucket_from_port(d, p) \
>>>>        ((group_from_port(d, p))[((p) % EVTCHNS_PER_GROUP) / EVTCHNS_PER_BUCKET])
>>>>    
>>>> +#define EVENT_WRITE_LOCK_INC    MAX_VIRT_CPUS
>>>
>>> Isn't the ceiling on simultaneous readers the number of pCPU-s,
>>> and the value here then needs to be NR_CPUS + 1 to accommodate
>>> the maximum number of readers? Furthermore, with you dropping
>>> the disabling of interrupts, one pCPU can acquire a read lock
>>> now more than once, when interrupting a locked region.
>>
>> Yes, I think you are right.
>>
>> So at least 2 * (NR-CPUS + 1), or even 3 * (NR_CPUS + 1) for covering
>> NMIs, too?
> 
> Hard to say: Even interrupts can in principle nest. I'd go further
> and use e.g. INT_MAX / 4, albeit no matter what value we choose
> there'll remain a theoretical risk. I'm therefore not fully
> convinced of the concept, irrespective of it providing an elegant
> solution to the problem at hand. I'd be curious what others think.

I just realized I should add a sanity test in evtchn_write_lock() to
exclude the case of multiple writers (this should never happen due to
all writers locking d->event_lock).

This in turn means we can set EVENT_WRITE_LOCK_INC to INT_MIN and use
negative lock values for a write-locked event channel.

Hitting this limit seems to require quite high values of NR_CPUS, even
with interrupts nesting (I'm quite sure we'll run out of stack space
way before this limit can be hit even with 16 million cpus).


Juergen

