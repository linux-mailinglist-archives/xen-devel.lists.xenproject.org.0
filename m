Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4EC8C50D7
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 13:14:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721417.1124805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6q6P-0002kL-LS; Tue, 14 May 2024 11:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721417.1124805; Tue, 14 May 2024 11:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6q6P-0002i8-IW; Tue, 14 May 2024 11:13:49 +0000
Received: by outflank-mailman (input) for mailman id 721417;
 Tue, 14 May 2024 11:13:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s6q6O-0002i2-0F
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 11:13:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6q6J-0004mK-Pq; Tue, 14 May 2024 11:13:43 +0000
Received: from [15.248.3.89] (helo=[10.24.67.25])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s6q6J-0006tE-IY; Tue, 14 May 2024 11:13:43 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=EWf7BbrwtV4179T2sSAukepkdAkoyiT8JYIsAXpZ4KU=; b=dWXULGt0GqPf1yim0182OPO0Ni
	l6D86dNyrxYC4LTAo+d+eLAVnYJBGbpb4ZUkUfG1SZW6OOjLs6+neHjzc2sx1TDFEv4r+qsgZFF2M
	30T01+mafD+aEkz4fWG6yx8zE1W2hXAUZj4cDD6QVk02/Pe/nUzg94JjcB4hPdGGAkss=;
Message-ID: <9249bc7e-7ca9-4f6e-8f3e-f2962c14e306@xen.org>
Date: Tue, 14 May 2024 12:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
 <1ba4d87f-48e2-4332-bcd8-ac891cee8917@citrix.com>
 <ccd70c8f-1381-43f7-8be8-edc1dd505ce2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ccd70c8f-1381-43f7-8be8-edc1dd505ce2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

(+ Oleksii as the release manager)

Chiming into the discussion as there seems there is disagreement.

On 14/05/2024 11:03, Jan Beulich wrote:
> On 14.05.2024 11:51, Andrew Cooper wrote:
>> On 14/05/2024 10:25 am, Jan Beulich wrote:
>>> On 03.04.2024 08:16, Jan Beulich wrote:
>>>> On 02.04.2024 19:06, Andrew Cooper wrote:
>>>>> The commit makes a claim without any kind of justification.
>>>> Well, what does "have no business" leave open?
>>>>
>>>>> The claim is false, and the commit broke lsevtchn in dom0.
>>>> Or alternatively lsevtchn was doing something that was never meant to work
>>>> (from Xen's perspective).
>>>>
>>>>>   It is also quite
>>>>> obvious from XSM_TARGET that it has broken device model stubdoms too.
>>>> Why would that be "obvious"? What business would a stubdom have to look at
>>>> Xen's side of an evtchn?
>>>>
>>>>> Whether to return information about a xen-owned evtchn is a matter of policy,
>>>>> and it's not acceptable to short circuit the XSM on the matter.
>>>> I can certainly accept this as one possible view point. As in so many cases
>>>> I'm afraid I dislike you putting it as if it was the only possible one.
>>>>
>>>> In summary: The supposed justification you claim is missing in the original
>>>> change is imo also missing here then: What business would any entity in the
>>>> system have to look at Xen's side of an event channel? Back at the time, 3
>>>> people agreed that it's "none".
>>> You've never responded to this reply of mine, or its follow-up. You also
>>> didn't chime in on the discussion Daniel and I were having. I consider my
>>> objections unaddressed, and in fact I continue to consider the change to
>>> be wrong. Therefore it was inappropriate for you to commit it; it needs
>>> reverting asap. If you're not going to do so, I will.
>>
>> You tried defending breaking a utility with "well it shouldn't exist then".
>>
>> You don't have a leg to stand on, and two maintainers of relevant
>> subsystems here just got tired of bullshit being presented in place of
>> any credible argument for having done the change in the way you did.
> 
> Please can you finally get into the habit of not sending rude replies?
> 
>> The correct response was "Sorry I broke things.  Lets revert this for
>> now to unbreak, and I'll see about reworking it to not intentionally
>> subvert Xen's security mechanism".
> 
> I'm sorry, but I didn't break things. I made things more consistent with
> the earlier change, as pointed out before: With your revert,
> evtchn_status() is now (again) inconsistent with e.g. evtchn_send(). If
> you were serious about this being something that needs leaving to XSM,
> you'd have adjusted such further uses of consumer_is_xen() as well. But
> you aren't. You're merely insisting on lsevtchn needing to continue to
> work in a way it should never have worked, with a patch to improve the
> situation already pending.
> 
> Just to state a very basic principle here again: Xen-internal event
> channels ought to either be fully under XSM control when it comes to
> domains attempting to access them (in whichever way), or they should
> truly be Xen-internal, with access uniformly prevented. To me the
> former option simply makes very little sense.

I agree we need consistency on how we handle security policy event 
channel. Although, I don't have a strong opinion on which way to go.

For the commit message, it is not entirely clear what "broke lseventch 
in dom0" really mean. Is it lsevtchn would not stop or it will just not 
display the event channel?

If the former, isn't a sign that the tool needs to be harden a bit more? 
If the latter, then I would argue that consistency for the XSM policy is 
more important than displaying the event channel for now (the patch was 
also committed 3 years ago...).

So I would vote for a revert and, if desired, replacing with a patch 
that would change the XSM policy consistently. Alternatively, the 
consistency should be a blocker for Xen 4.19.

> 
>> As it stands, you're 2-1 outvoted, and wasted any sympathy I may have
>> had for the principle of the change based on the absurdity of your
>> arguments.
> 
> No, pending objections are pending objections. Daniel's responses didn't
> eliminate them.

Indeed, this is rule 4 of the check-in policy:

4. There must be no "open" objections.

I don't view Jan's objections as unreasonable in particular for the 
consistency part.

> As a separate aspect: I can't assume anymore that it is just coincidence
> that you taking such a controversial action is at a time when I'm away.

Cheers,

-- 
Julien Grall

