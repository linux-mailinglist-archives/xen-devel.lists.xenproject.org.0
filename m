Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3D382527
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 09:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128087.240539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liXTh-00079B-Ru; Mon, 17 May 2021 07:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128087.240539; Mon, 17 May 2021 07:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liXTh-00076M-O3; Mon, 17 May 2021 07:15:49 +0000
Received: by outflank-mailman (input) for mailman id 128087;
 Mon, 17 May 2021 07:15:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liXTg-00076F-A4
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 07:15:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ba2031d2-9de2-4329-85d7-05e958f99082;
 Mon, 17 May 2021 07:15:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 62796ADCE;
 Mon, 17 May 2021 07:15:45 +0000 (UTC)
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
X-Inumbo-ID: ba2031d2-9de2-4329-85d7-05e958f99082
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621235745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y0qDswvG0WUKp8Q75+0gU3lwbXvDXvdVCWH5bc3s6oY=;
	b=c0MRyN/iPpRFzOiex28Ph14xZ42xNvkSaqTIYpREaE7nz9Bze23X4jUg4VafhVSUzG3cTT
	5qI9FfPCz2tYpKSe/UZHzhjUg4okKnqMxzfxHzTJ7/lgJnobk75LgzPBvsm8uOYhiEkeX5
	Cp7tFS1odOsX8t5OwD1AzS6euLJ3psM=
Subject: Re: Ping: [PATCH v5 0/6] evtchn: (not so) recent XSAs follow-on
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <306e62e8-9070-2db9-c959-858465c50c1d@suse.com>
 <d29fa89b-ea0a-bdbd-04c9-02eff0854d47@suse.com>
 <40e90456-90dc-7932-68ec-6f4d0941999f@xen.org>
 <0e19fb4c-4a87-ff80-fa98-fab623d6704f@suse.com>
 <YJ6XVmadaDbP3aUx@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <19a976e1-a4cb-16a9-cd53-1b7198859ddd@suse.com>
Date: Mon, 17 May 2021 09:15:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YJ6XVmadaDbP3aUx@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.05.2021 17:29, Roger Pau Monné wrote:
> On Thu, Apr 22, 2021 at 10:53:05AM +0200, Jan Beulich wrote:
>> On 21.04.2021 17:56, Julien Grall wrote:
>>>
>>>
>>> On 21/04/2021 16:23, Jan Beulich wrote:
>>>> On 27.01.2021 09:13, Jan Beulich wrote:
>>>>> These are grouped into a series largely because of their origin,
>>>>> not so much because there are (heavy) dependencies among them.
>>>>> The main change from v4 is the dropping of the two patches trying
>>>>> to do away with the double event lock acquires in interdomain
>>>>> channel handling. See also the individual patches.
>>>>>
>>>>> 1: use per-channel lock where possible
>>>>> 2: convert domain event lock to an r/w one
>>>>> 3: slightly defer lock acquire where possible
>>>>> 4: add helper for port_is_valid() + evtchn_from_port()
>>>>> 5: type adjustments
>>>>> 6: drop acquiring of per-channel lock from send_guest_{global,vcpu}_virq()
>>>>
>>>> Only patch 4 here has got an ack so far - may I ask for clear feedback
>>>> as to at least some of these being acceptable (I can see the last one
>>>> being controversial, and if this was the only one left I probably
>>>> wouldn't even ping, despite thinking that it helps reduce unecessary
>>>> overhead).
>>>
>>> I left feedback for the series one the previous version (see [1]). It 
>>> would have been nice is if it was mentionned somewhere as this is still 
>>> unresolved.
>>
>> I will admit I forgot about the controversy on patch 1. I did, however,
>> reply to your concerns. What didn't happen is the feedback from others
>> that you did ask for.
>>
>> And of course there are 4 more patches here (one of them having an ack,
>> yes) which could do with feedback. I'm certainly willing, where possible,
>> to further re-order the series such that controversial changes are at its
>> end.
> 
> I think it would easier to figure out whether the changes are correct
> if we had some kind of documentation about what/how the per-domain
> event_lock and the per-event locks are supposed to be used. I don't
> seem to be able to find any comments regarding how they are to be
> used.

I think especially in pass-through code there are a number of cases
where the per-domain lock really is being abused, simply for being
available without much further thought. I'm not convinced documenting
such abuse is going to help the situation. Yet of course I can see
that having documentation would make review easier ...

> Regarding the changes itself in patch 1 (which I think has caused part
> of the controversy here), I'm unsure they are worth it because the
> functions modified all seem to be non-performance critical:
> evtchn_status, domain_dump_evtchn_info, flask_get_peer_sid.
> 
> So I would say that unless we have clear rules written down for what
> the per-domain event_lock protects, I would be hesitant to change any
> of the logic, specially for critical paths.

Okay, I'll drop patch 1 and also patch 6 for being overly controversial.
Some of the other patches still look worthwhile to me, though. I'll
also consider moving the spin->r/w lock conversion last in the series.

Jan

