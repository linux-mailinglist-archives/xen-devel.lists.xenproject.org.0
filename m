Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C884EC608
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 15:53:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296364.504446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYlD-0002ao-6h; Wed, 30 Mar 2022 13:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296364.504446; Wed, 30 Mar 2022 13:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYlD-0002YL-3d; Wed, 30 Mar 2022 13:53:19 +0000
Received: by outflank-mailman (input) for mailman id 296364;
 Wed, 30 Mar 2022 13:53:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L21/=UJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nZYlB-0002YF-PH
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 13:53:17 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be66ca77-b030-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 15:53:15 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1648648388857624.9614367089724;
 Wed, 30 Mar 2022 06:53:08 -0700 (PDT)
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
X-Inumbo-ID: be66ca77-b030-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1648648391; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SNyaufibpo9083X9vMPABQuA7iC1ZZwyVOZRVMuSRajnOzUBy7ARGz1PWuMtEf2G1CoQzPMQ3x5o6qK9pvnelliV6iZL45QPFufBFLvt3tmmJ/iIBRv+6f5wTP6q3K9Pvk5slfwQNf2KxsaEPxEpcdkOo65Z0NQZ1r6ur6lVfW4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1648648391; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=qG76ARSkVs5IDF8OOg0NOS5LEFbcnwo16TsgkN/uO6E=; 
	b=dyq70w/jWQLTDpScuXpqqoJSi5q+4D1aXqy/jlvFeHjaIhSfIF+hF1D1g5LMerv+MVa+k4GQfvrgkjngAJgZ5WR7cBTgGI5JXKf5C8LxON01qNwxyZmkUbSVwMraQYTD8um9+grs4Lv7V8wchyk14+KlbgK+TYAPtGDJMEMGso0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1648648391;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qG76ARSkVs5IDF8OOg0NOS5LEFbcnwo16TsgkN/uO6E=;
	b=rxCtSU58kpRXGj7WIrRXEzGudlUuB5MeifpBQD50kZiKgqiIltXUc6qaDNbY9+yT
	gQmrbpy12IfTeVZSc/PHNQMeIK2D4Lls+Z9pE4PtSP6Yeb5dUVs2M6ghZou4PfnmGw/
	2WoJXpQ02ugORuNfLM+WtrOwEZrncPyDu4rx/5jI=
Message-ID: <4782d9f1-8575-9059-bc65-9f67b02d0d44@apertussolutions.com>
Date: Wed, 30 Mar 2022 09:52:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jandryuk@gmail.com>
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com>
 <7935e60e-34b1-76be-e5de-56e60f173438@suse.com>
 <a991c32d-4e45-f015-3d99-8552199e8d45@apertussolutions.com>
 <e711e8c8-5e5d-7443-fbc8-368ccdde533b@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
In-Reply-To: <e711e8c8-5e5d-7443-fbc8-368ccdde533b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/30/22 02:30, Jan Beulich wrote:
> On 29.03.2022 20:57, Daniel P. Smith wrote:
>> On 3/29/22 02:43, Jan Beulich wrote:
>>> On 28.03.2022 22:36, Daniel P. Smith wrote:
>>>> During domain construction under dom0less and hyperlaunch it is necessary to
>>>> allocate at least the event channel for xenstore and potentially the event
>>>> channel for the core console. When dom0less and hyperlaunch are doing their
>>>> construction logic they are executing under the idle domain context. The idle
>>>> domain is not a privileged domain, it is not the target domain, and as a result
>>>> under the current default XSM policy is not allowed to allocate the event
>>>> channel.
>>>
>>> I appreciate the change is only needed there right now, but it feels
>>> inconsistent. _If_ it is to remain that way, at least a comment needs
>>> to be put in xsm_evtchn_unbound() making clear why this is a special
>>> case, and hence clarifying to people what the approximate conditions
>>> are to have such also put elsewhere. But imo it would be better to
>>> make the adjustment right in xsm_default_action(), without touching
>>> event_channel.c at all. Iirc altering xsm_default_action() was
>>> discussed before, but I don't recall particular reasons speaking
>>> against that approach.
>>
>> By inconsistent, I take it you mean this is first place within an XSM
>> hook where an access decision is based on the current domain being a
>> system domain?
> 
> Well - yes and no. Even if further instances appeared, overall state
> would still end up inconsistent.

Okay, I think I get what you mean, which was brought up by Julien as
well. Which is that the default policy will become very nuanced over
whether certain xsm checks grants access to the idle domain or not. Yes,
I agree if this would not be good if this approach was used as the long
term solution.

>> I do agree and would add a comment to the change in the
>> XSM hook in a non-RFC version of the patch.
>>
>> As to moving the check down into xsm_default_action(), the concern I
>> have with doing so is that this would then make every XSM check succeed
>> if `current->domain` is a system domain. Doing so would require a review
>> of every function which has an XSM hoook to evaluate every invocation of
>> those functions that,
>>   1. is there ever a time when current->domain may be a system domain
>>   2. if so,
>>     a. is the invocation on behalf of the system domain
>>     b. or is the invocation on behalf of a non-system domain
>>
>> If there is any instance of 2b, then an inadvertent privilege escalation
>> can occur on that path. For evtchn_alloc_unbound() I verified the only
>> place, besides the new hyperlaunch calls, it is invoked is in the evtchn
>> hypercall handler, where current should be pointing at the domain that
>> made the hypercall.
> 
> Such an audit shouldn't be overly difficult, as the majority of XSM hook
> invocations sit clearly visible on hypercall paths, where it is clear
> that current->domain is not a system one.

Agreed but this would be asking someone to dedicate the time to the task.

>>>> This patch only addresses the event channel situation by adjust the default XSM
>>>> policy for xsm_evtchn_unbound to explicitly allow system domains to be able to
>>>> make the allocation call.
>>>
>>> Indeed I'm having trouble seeing how your change would work for SILO
>>> mode, albeit Stefano having tested this would make me assume he did
>>> so in SILO mode, as that's the default on Arm iirc. Afaict
>>> silo_mode_dom_check() should return false in the described situation.
>>
>> Correct, this patch only addressed the default policy. If an equivalent
>> change for SILO is desired, then it would be placed in
>> silo_evtchn_unbound() and not in silo_mode_dom_check() for the same
>> reasons I would be hesitant to place it in xsm_default_action().
>>
>>> Similarly I don't see how things would work transparently with a
>>> Flask policy in place. Regardless of you mentioning the restriction,
>>> I think this wants resolving before the patch can go in.
>>
>> To enable the equivalent in flask would require no hypervisor code
>> changes. Instead that would be handled by adding the necessary rules to
>> the appropriate flask policy file(s).
> 
> Of course this can be dealt with by adjusting policy file(s), but until
> people do so they'd end up with a perceived regression and/or unexplained
> difference in behavior from running in dummy (or SILO, once also taken
> care of) mode.

By the vary nature of running flask is to have a different behavior than
the dummy policy. What would need to be adjusted is the example policy
which does attempt to reflect the dummy policy. IMHO if a group is
writing these parts of their policy themselves, it is part of the policy
maintenance they have accepted with having a custom policy.

v/r,
dps

