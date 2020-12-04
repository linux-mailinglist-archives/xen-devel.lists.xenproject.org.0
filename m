Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6172CED7C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44653.80023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9dO-0007TI-9X; Fri, 04 Dec 2020 11:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44653.80023; Fri, 04 Dec 2020 11:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9dO-0007Ss-61; Fri, 04 Dec 2020 11:52:22 +0000
Received: by outflank-mailman (input) for mailman id 44653;
 Fri, 04 Dec 2020 11:52:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WR05=FI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kl9dN-0007Sn-6r
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:52:21 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5ec47ad-7111-4bfe-afd6-84f222be67eb;
 Fri, 04 Dec 2020 11:52:19 +0000 (UTC)
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
X-Inumbo-ID: a5ec47ad-7111-4bfe-afd6-84f222be67eb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1607082739;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=r/PZflQfumI5dXunGT+rF7XvlJCkEcCqYC/LE8KWSj4=;
  b=cFSwSv+1KjW0vGTVFFy5rP747rf23xrswOBc9v9m6myZH9RKuqoZ7OnY
   pXvuwEkYbebr9aE0GHF8qfRyKJiNK63p/wToIS71thWMkD7ib40yM5X00
   iDGtPKLLteQde0zYkES/JyIUTzIgLMiU6Kgw99QK/EWzu8uUxt9iK/NHn
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6BR2qO85Vfv3y4MYpndoGx4/bpc/s5AaYSl91/7OC8eYAvxgXxz36Up5AvJclPKZ5HPYP4m0xx
 mq42h7uBlh7HzDm8/4kU/zDUqK9PslfYuisyDPz/q69RAe24ZL1jG0Giq/HeqZHm4XJiXauR8U
 bYmoZbiiitT3bChsE0hAVxVeo/s5QsVENpR0csv7+8kvH8Wt0SOq+0m4LyGeRAQW35ZFFudzP0
 +rANQ3yDpOQch3Y7Y5QB+YLwbN5FcUhKJHBshZcdw3PzSR8o2KxHRt1xLhv6thxQtFkksrfr1I
 0Qo=
X-SBRS: 5.1
X-MesageID: 32872585
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,392,1599537600"; 
   d="scan'208";a="32872585"
Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	<paul@xen.org>
CC: 'Paul Durrant' <pdurrant@amazon.com>, 'Eslam Elnikety'
	<elnikety@amazon.com>, 'Ian Jackson' <iwj@xenproject.org>, 'Wei Liu'
	<wl@xen.org>, 'Anthony PERARD' <anthony.perard@citrix.com>, 'George Dunlap'
	<george.dunlap@citrix.com>, 'Stefano Stabellini' <sstabellini@kernel.org>,
	'Christian Lindig' <christian.lindig@citrix.com>, 'David Scott'
	<dave@recoil.org>, 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
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
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5de9f051-4071-4e09-528c-c1fb8345dc25@citrix.com>
Date: Fri, 4 Dec 2020 11:52:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <df1df316-9512-7b0c-fde1-aa4fc60ac70b@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 04/12/2020 11:45, Julien Grall wrote:
> Hi,
>
> I haven't looked at the series yet. Just adding some thoughts on why
> one would want such option.
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
>>>>> If we want to have a hypervisor that can be used in a cloud
>>>>> environment
>>>>> then Xen absolutely needs this capability.
>>>>
>>>> As per above you can conclude that I'm still struggling to see the
>>>> "why" part here.
>>>>
>>>
>>> Imagine you are a customer. You boot your OS and everything is just
>>> fine... you run your workload and all is good. You then shut down
>>> your VM and re-start it. Now it starts to crash. Who are you going
>>> to blame? You did nothing to your OS or application s/w, so you are
>>> going to blame the cloud provider of course.
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
>    1) From the recent security issues (such as XSA-343), a knob to
> disable FIFO would be quite beneficials for vendors that don't need
> the feature.
>
>    2) Fleet management purpose. You may have a fleet with multiple
> versions of Xen. You don't want your customer to start relying on
> features that may not be available on all the hosts otherwise it
> complicates the guest placement.
>
> FAOD, I am sure there might be other features that need to be
> disabled. But we have to start somewhere :).

Absolutely top of the list, importance wise, is so we can test different
configurations, without needing to rebuild the hypervisor (and to a
lesser extent, without having to reboot).

It is a mistake that events/grants/etc were ever available unilaterally
in HVM guests.  This is definitely a step in the right direction (but I
thought it would be too rude to ask Paul to make all of those CDF flags
at once).

~Andrew

