Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C77E2CED61
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:45:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44618.79957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9X4-0005uU-99; Fri, 04 Dec 2020 11:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44618.79957; Fri, 04 Dec 2020 11:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl9X4-0005u5-5m; Fri, 04 Dec 2020 11:45:50 +0000
Received: by outflank-mailman (input) for mailman id 44618;
 Fri, 04 Dec 2020 11:45:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kl9X2-0005tz-OG
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:45:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kl9X1-0000E7-F8; Fri, 04 Dec 2020 11:45:47 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kl9X1-0004YX-7L; Fri, 04 Dec 2020 11:45:47 +0000
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
	bh=VSVyP/m4Qvvvrf4ff4WBQc0vdMocntDXlzKiksuiZt8=; b=Oqrj7U5JnQuc2KU0/m57wuye5b
	Hig6yCoOQooCh99smVPWhmF1KkHagIvhulfE+fl2oA1zoZEpCMQ5ddOLKxRIJEYai1PMKaovjArB9
	lhL7avY0wTsH9Y6Fwpsx+JFcyzwss+Rks6GsyuwOl7GWS/9rEDPGSlRuPE5lqjo5H8T4=;
Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
To: Jan Beulich <jbeulich@suse.com>, paul@xen.org
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
 xen-devel@lists.xenproject.org
References: <20201203124159.3688-1-paul@xen.org>
 <20201203124159.3688-2-paul@xen.org>
 <fea91a65-1d7c-cd46-81a2-9a6bcb690ed1@suse.com>
 <00ee01d6c98b$507af1c0$f170d540$@xen.org>
 <8a4a2027-0df3-aee2-537a-3d2814b329ec@suse.com>
 <00f601d6c996$ce3908d0$6aab1a70$@xen.org>
 <946280c7-c7f7-c760-c0d3-db91e6cde68a@suse.com>
 <011201d6ca16$ae14ac50$0a3e04f0$@xen.org>
 <4fb9fb4c-5849-25f1-ff72-ba3a046d3fd8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <df1df316-9512-7b0c-fde1-aa4fc60ac70b@xen.org>
Date: Fri, 4 Dec 2020 11:45:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <4fb9fb4c-5849-25f1-ff72-ba3a046d3fd8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

I haven't looked at the series yet. Just adding some thoughts on why one 
would want such option.

On 04/12/2020 09:43, Jan Beulich wrote:
> On 04.12.2020 09:22, Paul Durrant wrote:
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 04 December 2020 07:53
>>>
>>> On 03.12.2020 18:07, Paul Durrant wrote:
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Sent: 03 December 2020 15:57
>>>>>
>>>>> ... this sound to me more like workarounds for buggy guests than
>>>>> functionality the hypervisor _needs_ to have. (I can appreciate
>>>>> the specific case here for the specific scenario you provide as
>>>>> an exception.)
>>>>
>>>> If we want to have a hypervisor that can be used in a cloud environment
>>>> then Xen absolutely needs this capability.
>>>
>>> As per above you can conclude that I'm still struggling to see the
>>> "why" part here.
>>>
>>
>> Imagine you are a customer. You boot your OS and everything is just fine... you run your workload and all is good. You then shut down your VM and re-start it. Now it starts to crash. Who are you going to blame? You did nothing to your OS or application s/w, so you are going to blame the cloud provider of course.
> 
> That's a situation OSes are in all the time. Buggy applications may
> stop working on newer OS versions. It's still the application that's
> in need of updating then. I guess OSes may choose to work around
> some very common applications' bugs, but I'd then wonder on what
> basis "very common" gets established. I dislike the underlying
> asymmetry / inconsistency (if not unfairness) of such a model,
> despite seeing that there may be business reasons leading people to
> think they want something like this.

The discussion seems to be geared towards buggy guest so far. However, 
this is not the only reason that one my want to avoid exposing some 
features:

    1) From the recent security issues (such as XSA-343), a knob to 
disable FIFO would be quite beneficials for vendors that don't need the 
feature.

    2) Fleet management purpose. You may have a fleet with multiple 
versions of Xen. You don't want your customer to start relying on 
features that may not be available on all the hosts otherwise it 
complicates the guest placement.

FAOD, I am sure there might be other features that need to be disabled. 
But we have to start somewhere :).

> 
>> Now imagine you are the cloud provider, running Xen. What you did was start to upgrade your hosts from an older version of Xen to a newer version of Xen, to pick up various bug fixes and make sure you are running a version that is within the security support envelope. You identify that your customer's problem is a bug in their OS that was latent on the old version of the hypervisor but is now manifesting on the new one because it has buggy support for a hypercall that was added between the two versions. How are you going to fix this issue, and get your customer up and running again? Of course you'd like your customer to upgrade their OS, but they can't even boot it to do that. You really need a solution that can restore the old VM environment, at least temporarily, for that customer.
> 
> Boot the guest on a not-yet-upgraded host again, to update its kernel?

You are making the assumption that the customer would have the choice to 
target a specific versions of Xen. This may be undesirable for a cloud 
provider as suddenly your customer may want to stick on the old version 
of Xen.

-- 
Julien Grall

