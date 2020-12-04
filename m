Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974FE2CEB3C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 10:43:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44289.79402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl7cS-0005G1-Ry; Fri, 04 Dec 2020 09:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44289.79402; Fri, 04 Dec 2020 09:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl7cS-0005Fa-O2; Fri, 04 Dec 2020 09:43:16 +0000
Received: by outflank-mailman (input) for mailman id 44289;
 Fri, 04 Dec 2020 09:43:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c9tS=FI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kl7cQ-0005FN-SC
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 09:43:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 832b9660-dd75-4df4-88ce-24ee25bcd64b;
 Fri, 04 Dec 2020 09:43:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C61E8AC2E;
 Fri,  4 Dec 2020 09:43:12 +0000 (UTC)
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
X-Inumbo-ID: 832b9660-dd75-4df4-88ce-24ee25bcd64b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607074992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bCns0iio/bkHOSn5gRHhr4Rz3JzMI4PI9UrqIVqaGS8=;
	b=EE3chOfKp9ENb5juCXGd8fmqq8SGskdQ9IUxvTB7+ixuxs30XBtrus1oEXZyBeg7g8U77J
	EvJVB8lKEhBcIapbd+5uw7Sjt3ZHKHoyBHK9NGGaOQ/i/XW3ulBl3WVLsrLN9O0FoEAKFi
	QCg5nzBH4OrA9RGZSyaw+exFM/PAa/w=
Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
To: paul@xen.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Eslam Elnikety' <elnikety@amazon.com>, 'Ian Jackson' <iwj@xenproject.org>,
 'Wei Liu' <wl@xen.org>, 'Anthony PERARD' <anthony.perard@citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Julien Grall' <julien@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Christian Lindig' <christian.lindig@citrix.com>,
 'David Scott' <dave@recoil.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201203124159.3688-1-paul@xen.org>
 <20201203124159.3688-2-paul@xen.org>
 <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
 <00ee01d6c98b$507af1c0$f170d540$@xen.org>
 <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com>
 <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
 <946280c7-c7f7-c760-c0d3-db91e6cde68a@suse.com>
 <011201d6ca16$ae14ac50$0a3e04f0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4fb9fb4c-5849-25f1-ff72-ba3a046d3fd8@suse.com>
Date: Fri, 4 Dec 2020 10:43:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <011201d6ca16$ae14ac50$0a3e04f0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.12.2020 09:22, Paul Durrant wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 04 December 2020 07:53
>>
>> On 03.12.2020 18:07, Paul Durrant wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 03 December 2020 15:57
>>>>
>>>> ... this sound to me more like workarounds for buggy guests than
>>>> functionality the hypervisor _needs_ to have. (I can appreciate
>>>> the specific case here for the specific scenario you provide as
>>>> an exception.)
>>>
>>> If we want to have a hypervisor that can be used in a cloud environment
>>> then Xen absolutely needs this capability.
>>
>> As per above you can conclude that I'm still struggling to see the
>> "why" part here.
>>
> 
> Imagine you are a customer. You boot your OS and everything is just fine... you run your workload and all is good. You then shut down your VM and re-start it. Now it starts to crash. Who are you going to blame? You did nothing to your OS or application s/w, so you are going to blame the cloud provider of course.

That's a situation OSes are in all the time. Buggy applications may
stop working on newer OS versions. It's still the application that's
in need of updating then. I guess OSes may choose to work around
some very common applications' bugs, but I'd then wonder on what
basis "very common" gets established. I dislike the underlying
asymmetry / inconsistency (if not unfairness) of such a model,
despite seeing that there may be business reasons leading people to
think they want something like this.

> Now imagine you are the cloud provider, running Xen. What you did was start to upgrade your hosts from an older version of Xen to a newer version of Xen, to pick up various bug fixes and make sure you are running a version that is within the security support envelope. You identify that your customer's problem is a bug in their OS that was latent on the old version of the hypervisor but is now manifesting on the new one because it has buggy support for a hypercall that was added between the two versions. How are you going to fix this issue, and get your customer up and running again? Of course you'd like your customer to upgrade their OS, but they can't even boot it to do that. You really need a solution that can restore the old VM environment, at least temporarily, for that customer.

Boot the guest on a not-yet-upgraded host again, to update its kernel?

>>>> While it has other downsides, Jürgen's proposal doesn't have any
>>>> similar scalability issue afaics. Another possible model would
>>>> seem to be to key new hypercalls to hypervisor CPUID leaf bits,
>>>> and derive their availability from a guest's CPUID policy. Of
>>>> course this won't work when needing to retrofit guarding like
>>>> you want to do here.
>>>
>>> Ok, I'll take a look hypfs as an immediate solution, if that's preferred.
>>
>> Well, as said - there are also downsides with that approach. I'm
>> not convinced it should be just the three of us to determine which
>> one is better overall, the more that you don't seem to be convinced
>> anyway (and I'm not going to claim I am, in either direction). It
>> is my understanding that based on the claimed need for this (see
>> above), this may become very widely used functionality, and if so
>> we want to make sure we won't regret the route we went.
>>
> 
> Agreed, but we don't need the final top-to-bottom solution now. The only part of this that is introducing something that is stable is the libxl part, and I think the 'feature' bitmap is reasonable future-proof (being modelled on the viridian feature bitmap, which has been extended over several releases since it was introduced).
> 
>> For starters, just to get a better overall picture, besides the two
>> overrides you add here, do you have any plans to retroactively add
>> further controls for past ABI additions?
> 
> I don't have any specific plans. The two I deal with here are the causes of observed differences in guest behaviour, one being an actual crash and the other affecting PV driver behaviour which may or may not be the cause of other crashes... but still something we need to have control over.

I.e. basically an arbitrary choice. This is again a symmetry /
consistency / fairness issue. If a guest admin pesters his cloud provider
enough, they may get the cloud provider to make hypervisor adjustments.
If another guest admin simply does the technically correct thing and
works out what needs fixing in the kernel, they may then figure they
simply didn't shout loud enough to avoid themselves needing to do much
work.

Anyway - I guess I'm about the only one seeing this from a purely
technical, non-business perspective. I suppose I'll continue looking at
the code for the purpose of finding issues (hopefully there aren't going
to be any), but will stay away from acking any parts of this. Whoever
agrees with the underlying concept can then provide their acks. (As said
elsewhere, in the particular case of the kexec issue with FIFO event
channels here, I could maybe see that as halfway acceptable
justification, albeit I did voice my concerns in that regard as well.
It's still working around a shortcoming in guest software.)

Nevertheless I'd like to gain clarity of what the plans are with future
ABI additions.

Jan

