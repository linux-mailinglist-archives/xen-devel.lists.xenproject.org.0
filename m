Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8B38C7F81
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 03:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723741.1128808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7mIc-0006PV-Aj; Fri, 17 May 2024 01:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723741.1128808; Fri, 17 May 2024 01:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7mIc-0006NE-6v; Fri, 17 May 2024 01:22:18 +0000
Received: by outflank-mailman (input) for mailman id 723741;
 Fri, 17 May 2024 01:22:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5lu=MU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1s7mIb-0005xt-1v
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 01:22:17 +0000
Received: from sender3-of-o58.zoho.com (sender3-of-o58.zoho.com
 [136.143.184.58]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3d10a20-13eb-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 03:22:14 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1715908929895770.4070882730078;
 Thu, 16 May 2024 18:22:09 -0700 (PDT)
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
X-Inumbo-ID: e3d10a20-13eb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1715908931; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g9hOY0sUkPWdFO0zo052wg8MMKbsy7k+eOdgd20H6Ty+wa0fW5d7kSFSu/5ohtiGVJyJiP62+Aw5Mxrnn/a0QHNu7yF42ckWpq0IhAP8O2jB9GDH2McQ+m4xWKtJ2BmPT800B0KFzuu1UWWZR26FAxNKH5tUymSAJ1xL7kfVRFo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1715908931; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/ZP9OcrdM117h/0SaihIOKMG/tlbPUthFhAXt6FuLOg=; 
	b=g2QIPX+6q4W+QRdsbd8hX4eGprDPRgk0rz/VRYhdB8tQo4Ffhdl/cOhlPnyb45Z1Oues/TINDgzwtelHhxQ1kPoNJlHniL+lyEeIdIpTIsS0uaHSDv4MAroKQXGXV8cXe5bWCXEWm5XYCYWBEcEf4BZqmMYO3m0zwfJTx9V9Qy8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1715908931;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/ZP9OcrdM117h/0SaihIOKMG/tlbPUthFhAXt6FuLOg=;
	b=nmFuiUWiPMrxFb6eVDp9FUWnJRAlTnveKU+/FiqmuTbhzMm//Zn31nTYRqJJ/7gp
	2/4gSPGlDoONZeKmlwUY1y6yPSuyoEk7y40zpdZLrLPk1m6mXh005iy8rArzs80e1aQ
	+40UCagB4c+Gn34UpzRejxBrx/ltbxckU+AaeVfQ=
Message-ID: <5059a536-2495-4121-8aba-5a2542ff9987@apertussolutions.com>
Date: Thu, 16 May 2024 21:22:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
 <b3695ec1-b9e6-4db6-a242-5dfa11bc00b6@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <b3695ec1-b9e6-4db6-a242-5dfa11bc00b6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/16/24 02:41, Jan Beulich wrote:
> On 14.05.2024 11:25, Jan Beulich wrote:
>> On 03.04.2024 08:16, Jan Beulich wrote:
>>> On 02.04.2024 19:06, Andrew Cooper wrote:
>>>> The commit makes a claim without any kind of justification.
>>>
>>> Well, what does "have no business" leave open?
>>>
>>>> The claim is false, and the commit broke lsevtchn in dom0.
>>>
>>> Or alternatively lsevtchn was doing something that was never meant to work
>>> (from Xen's perspective).
>>>
>>>>   It is also quite
>>>> obvious from XSM_TARGET that it has broken device model stubdoms too.
>>>
>>> Why would that be "obvious"? What business would a stubdom have to look at
>>> Xen's side of an evtchn?
>>>
>>>> Whether to return information about a xen-owned evtchn is a matter of policy,
>>>> and it's not acceptable to short circuit the XSM on the matter.
>>>
>>> I can certainly accept this as one possible view point. As in so many cases
>>> I'm afraid I dislike you putting it as if it was the only possible one.
>>>
>>> In summary: The supposed justification you claim is missing in the original
>>> change is imo also missing here then: What business would any entity in the
>>> system have to look at Xen's side of an event channel? Back at the time, 3
>>> people agreed that it's "none".
>>
>> You've never responded to this reply of mine, or its follow-up. You also
>> didn't chime in on the discussion Daniel and I were having. I consider my
>> objections unaddressed, and in fact I continue to consider the change to
>> be wrong. Therefore it was inappropriate for you to commit it; it needs
>> reverting asap. If you're not going to do so, I will.
> 
> For the record: With Andrew having clarified that in his revert's
> description:
> 
> "The claim is false; it broke lsevtchn in dom0, a debugging utility which
>   absolutely does care about all of the domain's event channels."
> 
> "all of the domain's event channels" means to include event channels Xen
> uses for its own, and merely puts in the domain's table for ease of
> handling, I've agreed that - in the absence of any better debugging
> means - the revert may stay in place. For context, my prior understanding
> of the issue was that lsevtchn simply stops probing further channels when
> getting back any kind of error from EVTCHNOP_status (which I continue to
> think wants addressing there, by a future version of a patch that was
> already sent). However, there are follow-on concerns I have:
> 
> 1) In the discussion George claimed that exposing status information in
> an uncontrolled manner is okay. I'm afraid I have to disagree, seeing
> how a similar assumption by CPU designers has led to a flood of
> vulnerabilities over the last 6+ years. Information exposure imo is never
> okay, unless it can be _proven_ that absolutely nothing "useful" can be
> inferred from it. (I'm having difficulty seeing how such a proof might
> look like.)

Jan, I would agree with you that any resources exposed to the guest, 
even if that resource is status information, should be behind an XSM 
check. I would, however, have to disagree the position over proving 
absolutely nothing "useful" can be inferred. Prior to spectre becoming 
commonly aware, no one considered proving there needed to be protections 
against out-of-order instruction execution being used to bypass branch 
conditions. Predicting the future will more often than not fail, but 
with an XSM check in place, the dummy/default policy can just be updated 
with the general safe decision and others can use FLASK to provide fine 
grain access.

> 2) Me pointing out that the XSM hook might similarly get in the way of
> debugging, Andrew suggested that this is not an issue because any sensible
> XSM policy used in such an environment would grant sufficient privilege to
> Dom0. Yet that then still doesn't cover why DomU-s also can obtain status
> for Xen-internal event channels. The debugging argument then becomes weak,
> as in that case the XSM hook is possibly going to get in the way.

And this is where we have a fundamental difference. Event channels are 
XSM labeled objects that are always connected to a guest. If they were 
truly Xen-internal, then a guest would have no way to get 
access/reference them. Again, I never disagreed with whether the guest 
should or should not be able to access them. I did ask for a better 
explanation than, "has no business", which is a statement of opinion not 
of fact or reason. The point is these event channels are a resource 
attached to the guest and access control decisions to them should be 
made under XSM. Injecting a hard-coded access control in front of the 
XSM check subverted/invalidated rules in the existing FLASK policy.

> 3) In the discussion Andrew further gave the impression that evtchn_send()
> had no XSM check. Yet it has; the difference to evtchn_status() is that
> the latter uses XSM_TARGET while the former uses XSM_HOOK. (Much like
> evtchn_status() may indeed be useful for debugging, evtchn_send() may be
> similarly useful to allow getting a stuck channel unstuck.)

A more appropriate default might be XSM_OTHER with conditions with in 
the hook  as to whether the policy should be XSM_HOOK, XSM_TARGET or 
flat denial.

> In summary I continue to think that an outright revert was inappropriate.
> DomU-s should continue to be denied status information on Xen-internal
> event channels, unconditionally and independent of whether dummy, silo, or
> Flask is in use.

Any guest facing resources, regardless if the backing end is the 
hypervisor, should be protected with XSM. This allows the maintainers to 
codify what they believe is a sane policy in the dummy policy and the 
end user can use FLASK to enforce what they believe is acceptable.

> Plus, as stated before, evtchn_send() would better remain in sync in this
> regard with evtchn_status(). The situation is less clear for evtchn_close()
> and evtchn_bind_vcpu(): Those indeed have no XSM checks while they do deny
> operation on Xen-internal channels. It is likely more far fetched to
> assume permitting them for debugging purposes might in fact help in rare
> situations. Yet it may still be a matter of consistency to keep them in
> sync with the other two. (Note that there's also evtchn_usable(), which
> might then also need tweaking itself or at the use sites.)

Just because that is how it was, doesn't mean it was correct. I had a 
discussion with one of the original authors of FLASK before taking up 
the maintainership and he felt there were likely more XSM checks that 
should have been in place originally. He considered it a first order 
approximation of what should be protected.

v/r,
dps

