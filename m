Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D97329A463
	for <lists+xen-devel@lfdr.de>; Tue, 27 Oct 2020 07:00:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12620.32806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXI0N-0007zp-RX; Tue, 27 Oct 2020 05:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12620.32806; Tue, 27 Oct 2020 05:58:47 +0000
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
	id 1kXI0N-0007zX-OB; Tue, 27 Oct 2020 05:58:47 +0000
Received: by outflank-mailman (input) for mailman id 12620;
 Tue, 27 Oct 2020 05:58:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kKAC=EC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kXI0M-0007zS-A4
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 05:58:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94cbc760-0627-46ae-9e4c-de2465115f4c;
 Tue, 27 Oct 2020 05:58:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20968AB98;
 Tue, 27 Oct 2020 05:58:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kKAC=EC=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kXI0M-0007zS-A4
	for xen-devel@lists.xenproject.org; Tue, 27 Oct 2020 05:58:46 +0000
X-Inumbo-ID: 94cbc760-0627-46ae-9e4c-de2465115f4c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 94cbc760-0627-46ae-9e4c-de2465115f4c;
	Tue, 27 Oct 2020 05:58:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603778324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j5wHNAKxk4kKcEKC8IMknOrGGu6PJzjfvJ6egTYEWMI=;
	b=b37/132RkMUAy2umlhaO1dbIkR2ned0X3sF1bOY3b9l2JPTShUF7SCkIhT7a3zlflR1eZu
	CvYpAkoPOhsfZMBWxLrXRZVQVVX/azhw0RFv7+CSDPYmAC6due3EcexootjZZqxwwjMLbh
	QWcZq/jV42N4Bs4EA0qp0MNapUeoHaw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 20968AB98;
	Tue, 27 Oct 2020 05:58:44 +0000 (UTC)
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
To: Dario Faggioli <dfaggioli@suse.com>,
 "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
 "frederic.pierret@qubes-os.org" <frederic.pierret@qubes-os.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
Date: Tue, 27 Oct 2020 06:58:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.10.20 17:31, Dario Faggioli wrote:
> On Mon, 2020-10-26 at 15:30 +0100, Jürgen Groß wrote:
>> On 26.10.20 14:54, Andrew Cooper wrote:
>>> On 26/10/2020 13:37, Frédéric Pierret wrote:
>>>>
>>>> If anyone would have any idea of what's going on, that would be
>>>> very
>>>> appreciated. Thank you.
>>>
>>> Does booting Xen with `sched=credit` make a difference?
>>
>> Hmm, I think I have spotted a problem in credit2 which could explain
>> the
>> hang:
>>
>> csched2_unit_wake() will NOT put the sched unit on a runqueue in case
>> it
>> has CSFLAG_scheduled set. This bit will be reset only in
>> csched2_context_saved().
>>
> Exactly, it does not put it back there. However, if it finds a vCPU
> with the CSFLAG_scheduled flag set, It should set
> CSFLAG_delayed_runq_add flag.
> 
> Unless curr_on_cpu(cpu)==unit or unit_on_runq(svc)==true... which
> should not be the case. Or where you saying that we actually are in one
> of this situations?
> 
> In fact...
> 
>> So in case a vcpu (and its unit, of course) is blocked and there has
>> been no other vcpu active on its physical cpu but the idle vcpu,
>> there
>> will be no call of csched2_context_saved(). This will block the vcpu
>> to become active in theory for eternity, in case there is no need to
>> run another vcpu on the physical cpu.
>>
> ...I maybe am not seeing what exact situation and sequence of events
> you're exactly thinking to. What I see is this: [*]
> 
> - vCPU V is running, i.e., CSFLAG_scheduled is set
> - vCPU V blocks
> - we enter schedule()
>    - schedule calls do_schedule() --> csched2_schedule()
>      - we pick idle, so CSFLAG_delayed_runq_add is set for V
>    - schedule calls sched_context_switch()
>      - sched_context_switch() calls context_switch()
>        - context_switch() calls sched_context_switched()
>          - sched_context_switched() calls:
>            - vcpu_context_saved()
>            - unit_context_saved()
>              - unit_context_saved() calls sched_context_saved() -->
>                                            csched2_context_saved()
>                - csched2_context_saved():
>                  - clears CSFLAG_scheduled
>                  - checks (and clear) CSFLAG_delayed_runq_add
> 
> [*] this assumes granularity 1, i.e., no core-scheduling and no
>      rendezvous. Or was core-scheduling actually enabled?
> 
> And if CSFLAG_delayed_runq_add is set **and** the vCPU is runnable, the
> task is added back to the runqueue.
> 
> So, even if we don't do the actual context switch (i.e., we don't call
> __context_switch() ) if the next vCPU that we pick when vCPU V blocks
> is the idle one, it looks to me that we go get to call
> csched2_context_saved().
> 
> And it also looks to me that, when we get to that, if the vCPU is
> runnable, even if it has the CSFLAG_scheduled still set, we do put it
> back to the runqueue.
> 
> And if the vCPU blocked, but csched2_unit_wake() run while
> CSFLAG_scheduled was still set, it indeed should mean that the vCPU
> itself will be runnable again when we get to csched2_context_saved().
> 
> Or did you have something completely different in mind, and I'm missing
> it?

No, I think you are right. I mixed that up with __context_switch() not
being called.

Sorry for the noise,


Juergen


