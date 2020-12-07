Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B412D0CC7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 10:17:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45997.81588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmCdr-0005cS-Fh; Mon, 07 Dec 2020 09:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45997.81588; Mon, 07 Dec 2020 09:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmCdr-0005c3-CX; Mon, 07 Dec 2020 09:17:11 +0000
Received: by outflank-mailman (input) for mailman id 45997;
 Mon, 07 Dec 2020 09:17:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kmCdq-0005by-PU
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 09:17:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e81816c-ffe7-454a-b9b0-6ac5c9b9b9db;
 Mon, 07 Dec 2020 09:17:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C38A1AD20;
 Mon,  7 Dec 2020 09:17:08 +0000 (UTC)
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
X-Inumbo-ID: 7e81816c-ffe7-454a-b9b0-6ac5c9b9b9db
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607332628; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxaF6bbiB16xI/ghGCl3iL1FeoOfRPJpldz+RBm1kFk=;
	b=THxGTlteTwPPXBmiOF7Qm5/HTWWSoygX5jXme3ctN44cbU/oUaOBjsuUTqnNB0JrsNwtG2
	5ttIoADXe2NBYbT4hecqSH6VMtKqV5tesxZg6CDoGyAyWO6PLEYelCOSBovTmU1LDmrRTh
	PkNVFuE9Yjo/pjH/c/qjlxazChYxABM=
Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
To: Julien Grall <julien@xen.org>
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Eslam Elnikety' <elnikety@amazon.com>, 'Ian Jackson' <iwj@xenproject.org>,
 'Wei Liu' <wl@xen.org>, 'Anthony PERARD' <anthony.perard@citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Christian Lindig' <christian.lindig@citrix.com>,
 'David Scott' <dave@recoil.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, paul@xen.org
References: <20201203124159.3688-1-paul@xen.org>
 <20201203124159.3688-2-paul@xen.org>
 <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
 <00ee01d6c98b$507af1c0$f170d540$@xen.org>
 <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com>
 <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
 <946280c7-c7f7-c760-c0d3-db91e6cde68a@suse.com>
 <011201d6ca16$ae14ac50$0a3e04f0$@xen.org>
 <4fb9fb4c-5849-25f1-ff72-ba3a046d3fd8@suse.com>
 <df1df316-9512-7b0c-fde1-aa4fc60ac70b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5537493-1a6f-cdc1-27dc-a34060e7efc5@suse.com>
Date: Mon, 7 Dec 2020 10:17:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <df1df316-9512-7b0c-fde1-aa4fc60ac70b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.12.2020 12:45, Julien Grall wrote:
> Hi,
> 
> I haven't looked at the series yet. Just adding some thoughts on why one 
> would want such option.
> 
> On 04/12/2020 09:43, Jan Beulich wrote:
>> On 04.12.2020 09:22, Paul Durrant wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 04 December 2020 07:53
>>>>
>>>> On 03.12.2020 18:07, Paul Durrant wrote:
>>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>>> Sent: 03 December 2020 15:57
>>>>>>
>>>>>> ... this sound to me more like workarounds for buggy guests than
>>>>>> functionality the hypervisor _needs_ to have. (I can appreciate
>>>>>> the specific case here for the specific scenario you provide as
>>>>>> an exception.)
>>>>>
>>>>> If we want to have a hypervisor that can be used in a cloud environment
>>>>> then Xen absolutely needs this capability.
>>>>
>>>> As per above you can conclude that I'm still struggling to see the
>>>> "why" part here.
>>>>
>>>
>>> Imagine you are a customer. You boot your OS and everything is just fine... you run your workload and all is good. You then shut down your VM and re-start it. Now it starts to crash. Who are you going to blame? You did nothing to your OS or application s/w, so you are going to blame the cloud provider of course.
>>
>> That's a situation OSes are in all the time. Buggy applications may
>> stop working on newer OS versions. It's still the application that's
>> in need of updating then. I guess OSes may choose to work around
>> some very common applications' bugs, but I'd then wonder on what
>> basis "very common" gets established. I dislike the underlying
>> asymmetry / inconsistency (if not unfairness) of such a model,
>> despite seeing that there may be business reasons leading people to
>> think they want something like this.
> 
> The discussion seems to be geared towards buggy guest so far. However, 
> this is not the only reason that one my want to avoid exposing some 
> features:
> 
>     1) From the recent security issues (such as XSA-343), a knob to 
> disable FIFO would be quite beneficials for vendors that don't need the 
> feature.

Except that this wouldn't have been suitable as a during-embargo
mitigation, for its observability by guests.

>     2) Fleet management purpose. You may have a fleet with multiple 
> versions of Xen. You don't want your customer to start relying on 
> features that may not be available on all the hosts otherwise it 
> complicates the guest placement.

Guests incapable to run on older Xen are a problem in this regard
anyway, aren't they? And if they are capable, I don't see what
you're referring to.

> FAOD, I am sure there might be other features that need to be disabled. 
> But we have to start somewhere :).

If there is such a need, then yes, sure. But shouldn't we at least
gain rough agreement on how the future is going to look like with
this? IOW have in hands some at least roughly agreed criteria by
which we could decide which new ABI additions will need some form
of override going forward (also allowing to judge which prior
additions may want to gain overrides in a retroactive fashion, or
in fact should have had ones from the beginning)?

>>> Now imagine you are the cloud provider, running Xen. What you did was start to upgrade your hosts from an older version of Xen to a newer version of Xen, to pick up various bug fixes and make sure you are running a version that is within the security support envelope. You identify that your customer's problem is a bug in their OS that was latent on the old version of the hypervisor but is now manifesting on the new one because it has buggy support for a hypercall that was added between the two versions. How are you going to fix this issue, and get your customer up and running again? Of course you'd like your customer to upgrade their OS, but they can't even boot it to do that. You really need a solution that can restore the old VM environment, at least temporarily, for that customer.
>>
>> Boot the guest on a not-yet-upgraded host again, to update its kernel?
> 
> You are making the assumption that the customer would have the choice to 
> target a specific versions of Xen. This may be undesirable for a cloud 
> provider as suddenly your customer may want to stick on the old version 
> of Xen.

I've gone from you saying "You really need a solution that can restore
the old VM environment, at least temporarily, for that customer." The
"temporarily" to me implies that it is at least an option to tie a
certain guest to a certain Xen version for in-guest upgrading purposes.
If the deal with the customer doesn't include running on a certain Xen
version, I don't see how this could have non-temporary consequences to
the cloud provider.

Jan

