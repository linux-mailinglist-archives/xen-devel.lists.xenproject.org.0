Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1AD2D0DCA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 11:07:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46082.81744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDQf-0003KL-Gn; Mon, 07 Dec 2020 10:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46082.81744; Mon, 07 Dec 2020 10:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmDQf-0003Jv-DU; Mon, 07 Dec 2020 10:07:37 +0000
Received: by outflank-mailman (input) for mailman id 46082;
 Mon, 07 Dec 2020 10:07:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kmDQd-0003Jq-EJ
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 10:07:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmDQc-0004xP-2A; Mon, 07 Dec 2020 10:07:34 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmDQb-0002Eo-Ni; Mon, 07 Dec 2020 10:07:33 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=ouQvCwF6cPs+TVYkUwmeUGfuDacOBBcAOCv0Ja9PmJk=; b=Vw2Ab25EEN6JIVzGOe+9YfIrNv
	fvSIll7/O7p3p+CKO6OzY4ucLbxZ/VtfiePKpgqEyPBasAQwV+Vjr58Q9bcmjwqGRw8ZsscJMh1mE
	5DTV/kosB7nLTM1aeVoNZfylY2mgDh2sBQ8Rc0Qsq4VrHLsU0kD5Wrr5O+in7D8xnPb0=;
Subject: Re: [PATCH v5 1/4] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_evtchn_fifo, ...
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>
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
 <c5537493-1a6f-cdc1-27dc-a34060e7efc5@suse.com>
 <63af7714-9c03-35b6-99a1-795b678b8032@xen.org>
Message-ID: <19308701-04ca-46dc-289c-143679b16c7b@xen.org>
Date: Mon, 7 Dec 2020 10:07:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <63af7714-9c03-35b6-99a1-795b678b8032@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 07/12/2020 10:04, Julien Grall wrote:
> Hi Jan,
> 
> On 07/12/2020 09:17, Jan Beulich wrote:
>> On 04.12.2020 12:45, Julien Grall wrote:
>>>      1) From the recent security issues (such as XSA-343), a knob to
>>> disable FIFO would be quite beneficials for vendors that don't need the
>>> feature.
>>
>> Except that this wouldn't have been suitable as a during-embargo
>> mitigation, for its observability by guests.
> 
> I think you are missing my point here. If that knob was available before 
> the security event, a vendor may have already decided to use it to 
> disable feature affected.
> 
> This vendor would not have needed to spend time to either hotpatch or 
> reboot all its fleet.
> 
>>>      2) Fleet management purpose. You may have a fleet with multiple
>>> versions of Xen. You don't want your customer to start relying on
>>> features that may not be available on all the hosts otherwise it
>>> complicates the guest placement.
>>
>> Guests incapable to run on older Xen are a problem in this regard
>> anyway, aren't they? And if they are capable, I don't see what
>> you're referring to.
> 
> It is not about guest that cannot run on older Xen. It is more about 
> allowing a guest to use a feature that is not yet widely available in 
> the fleet (you don't update all the hosts in a night...).
> 
> Imagine the guest owner really wants to use feature A that is only 
> available on new Xen version. The owner may have noticed the feature on 
> an existing running guest and would like to create a new guest that use 
> the feature.
> 
> It might be possible that there are no capacity available on the new Xen 
> version. So the guest may start on an older capacity.
> 
> I can assure you that the owner will contact the customer service of the 
> cloud provider to ask why the feature is not available on the new guest.
> 
> With a knob available, a cloud provider has more flexibility to when the 
> feature can be exposed.
> 
>>> FAOD, I am sure there might be other features that need to be disabled.
>>> But we have to start somewhere :).
>>
>> If there is such a need, then yes, sure. But shouldn't we at least
>> gain rough agreement on how the future is going to look like with
>> this? IOW have in hands some at least roughly agreed criteria by
>> which we could decide which new ABI additions will need some form
>> of override going forward (also allowing to judge which prior
>> additions may want to gain overrides in a retroactive fashion, or
>> in fact should have had ones from the beginning)?
> 
> I think the answer is quite straight-forward: Anything exposed to the 
> non-privileged (I include stubdomain) guest should have a knob to 

s/include/exclude/

> disable it.
> 
>>
>>>>> Now imagine you are the cloud provider, running Xen. What you did 
>>>>> was start to upgrade your hosts from an older version of Xen to a 
>>>>> newer version of Xen, to pick up various bug fixes and make sure 
>>>>> you are running a version that is within the security support 
>>>>> envelope. You identify that your customer's problem is a bug in 
>>>>> their OS that was latent on the old version of the hypervisor but 
>>>>> is now manifesting on the new one because it has buggy support for 
>>>>> a hypercall that was added between the two versions. How are you 
>>>>> going to fix this issue, and get your customer up and running 
>>>>> again? Of course you'd like your customer to upgrade their OS, but 
>>>>> they can't even boot it to do that. You really need a solution that 
>>>>> can restore the old VM environment, at least temporarily, for that 
>>>>> customer.
>>>>
>>>> Boot the guest on a not-yet-upgraded host again, to update its kernel?
>>>
>>> You are making the assumption that the customer would have the choice to
>>> target a specific versions of Xen. This may be undesirable for a cloud
>>> provider as suddenly your customer may want to stick on the old version
>>> of Xen.
>>
>> I've gone from you saying "You really need a solution that can restore
>> the old VM environment, at least temporarily, for that customer." The
>> "temporarily" to me implies that it is at least an option to tie a
>> certain guest to a certain Xen version for in-guest upgrading purposes.
>  >
>> If the deal with the customer doesn't include running on a certain Xen
>> version, I don't see how this could have non-temporary consequences to
>> the cloud provider.
> 
> I think by "you", you mean Paul and not me?
> 
> Cheers,
> 

-- 
Julien Grall

