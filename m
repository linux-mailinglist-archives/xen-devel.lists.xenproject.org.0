Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C68137FD435
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 11:33:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643797.1004306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8HsC-0004YH-Uo; Wed, 29 Nov 2023 10:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643797.1004306; Wed, 29 Nov 2023 10:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8HsC-0004Vn-Pv; Wed, 29 Nov 2023 10:32:52 +0000
Received: by outflank-mailman (input) for mailman id 643797;
 Wed, 29 Nov 2023 10:32:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r8HsB-0004VQ-7m
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 10:32:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8Hs9-0007sK-Un; Wed, 29 Nov 2023 10:32:49 +0000
Received: from 82-132-247-131.dab.02.net ([82.132.247.131] helo=[172.20.10.4])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8Hs9-0003NT-Ja; Wed, 29 Nov 2023 10:32:49 +0000
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
	bh=5Ob0aBhfw7+DqSp4nCd7/EX/X+QBbmhlOmAvvfX5S1E=; b=ceuCtacUniowcFQFh6Bp1Kr+SW
	9D2axyAn1ncpEHQv0mF1ZZW9lCef075fX/AOzKE/H+YC5buNMh3RBvbIebicPN9ZNbdtqM2xSSZgx
	JMh9PcMMEC8jp070xvuMtBXozNO3PPoDTydsRsz6loDS1JHBMGn6+YCW5el6B8G5um+0=;
Message-ID: <8e40c0a2-0d74-4611-8faf-84184ab371c8@xen.org>
Date: Wed, 29 Nov 2023 11:32:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubsan: Introduce CONFIG_UBSAN_FATAL to panic on UBSAN
 failure
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231127144156.361656-1-michal.orzel@amd.com>
 <443a56fa-a175-4d10-9343-577c825fbd7a@xen.org>
 <0985c860-ac1f-44ca-a4ab-147723fc6b36@amd.com>
 <b0127019-4976-42e3-bde1-643cc56f18b0@xen.org>
 <16b73400-b592-4a1a-9b87-8c49aad9208d@amd.com>
 <9d1e385e-152e-404a-8d8b-47c5ac08d76a@xen.org>
 <ce98090d-d81f-4a02-8ad1-9fa5ba647409@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <ce98090d-d81f-4a02-8ad1-9fa5ba647409@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/11/2023 09:02, Michal Orzel wrote:
> Hi Julien,

Hi,

> On 28/11/2023 18:52, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 28/11/2023 18:15, Michal Orzel wrote:
>>>
>>>
>>> On 28/11/2023 18:09, Julien Grall wrote:
>>>>
>>>>
>>>> On 28/11/2023 18:00, Michal Orzel wrote:
>>>>> Hi Julien,
>>>>>
>>>>> On 28/11/2023 17:14, Julien Grall wrote:
>>>>>>
>>>>>>
>>>>>> Hi Michal,
>>>>>>
>>>>>> On 27/11/2023 15:41, Michal Orzel wrote:
>>>>>>> Introduce the CONFIG_UBSAN_FATAL option to cater to scenarios where prompt
>>>>>>> attention to undefined behavior issues, notably during CI test runs, is
>>>>>>> essential. When enabled, this option causes Xen to panic upon detecting
>>>>>>> UBSAN failure (as the last step in ubsan_epilogue()).
>>>>>>
>>>>>> I have mixed opinions on this patch. This would be a good one if we had
>>>>>> a Xen mostly free from UBSAN behavior. But this is not the case at least
>>>>>> on arm32. So we would end up to stop at the first error. IOW, we would
>>>>>> need to fix the first error before we can see the next one.
>>>>> Well, this patch introduces a config option disabled by default.
>>>>
>>>> I understood this is disabled by default... I am pointing out that I am
>>>> not convinced about the usefulness until we are at the stage where Xen
>>>> is normally not reporting any USBAN error.
>>>>
>>>>> If we end up enabling it for CI for reasons* stated by Andrew, then the natural way
>>>>> of handling such issues is to do the investigation locally.
>>>>
>>>> This will not always be possible. One example is when you are only able
>>>> to reproduce some of the USBAN errors on a specific HW.
>>>>
>>>>> Then, you are not forced
>>>>> to select this option and you can see all the UBSAN issues if you want.
>>>>
>>>> See above, I got that point. I am mostly concerned about the implication
>>>> in the CI right now.
>>>>
>>>>>
>>>>>>
>>>>>> So I feel it would be best if the gitlab CI jobs actually check for
>>>>>> USBAN in the logs and fail if there are any. With that, we can get the
>>>>>> full list of UBSAN issues on each job.
>>>>> Well, I prefer Andrew suggestion (both [1] and on IRC), hence this patch.
>>>>>
>>>>> *my plan was to first fix the UBSAN issues and then enable this option for CI.
>>>>
>>>> That would have been useful to describe your goal after "---". With that
>>>> in mind, then I suggest to revisit this patch once all the UBSAN issues
>>>> in a normal build are fixed.
>>> But this patch does not enable this option for CI automatically, right?
>>
>> Correct.
>>
>>> Why are you so keen to push it back?
>>
>> I have been pushing back because your commit message refers to the CI
>> specifically and today this would not really work (read as I would not
>> be happy if this option is enabled in the CI right now at least on arm32).
> I mentioned CI as a noteworthy example. In no case, I wrote that this implies the immediate
> enabling of this option for all the arches in CI. Especially, given that I'm aware of arm32 issues
> as you might know.

You are missing my point... If you read what I wrote a paragraph after, 
I am pointing out that even in the future, I would prefer if the CI 
reports all the errors rather than stopping at the first one.

When I assess a patch, I also assess based on the examples provided in 
the commit message. Sadly, I don't get CCed to the CI patches, so I much 
prefer to express my opinion earlier rather than missing out the 
opportunity to do it ...

> 
>>
>> If you want to fail a CI job for UBSAN today, then we need to find a
>> different approach so we can get the full list of UBSAN error rather
>> than fixing one, retry and then next one.
>>
>>> Is it because you see no point in this option other than for the upstream CI loop?
>>
>> Even in the upstream CI loop, I am a little unsure about this approach.
>> At least, I feel I would want to see all the reports at once in the CI.
>>
>> But this is not really a strong feeling.
>>
>>> I find it useful on a day-to-day
>>> Xen runs, and I would for sure enable it by default in my config not to miss UBSAN failures.
>>
>> Fair enough. I view USBAN issues the same a WARN_ON. They all need to be
>> investigated. So now you have an inconsistent policy.
>>
>> Are you are also intending to switch WARN_ON() to fatal? If not, then
>> why would UBSAN warnings more important that the other warnings?
> WARN_ON() is placed by the developer to detect e.g. incorrect configuration. The fact that someone
> decided to use WARN_ON and not BUG_ON means that this person did some investigation the result of
> which suggests no critical consequence.
The general guidance is to use BUG_ON() when it is not possible to pass 
the error up to the stack and that could cause privilege escalation / 
information leak. But for anything else (e.g. DoS), then it would be 
more common to use WARN_ON() as an indication that something is fishy.

To give a concrete example, in Linux, we recently had an XSA [1] which 
could have been detected earlier if we had pay attention to WARN splats 
(albeit they were only showing up in certain configuration).

So I would not treat WARN and UBSAN splats differently. In particular in 
the context of a CI system, we really want to know about any splats.

> For UBSAN, you can't always be sure (read undefined).
> It might be at the same level as WARN_ON but can also result in unpredictable behavior leading to security issues.

I wish this were true :). My example above is not Xen, but still...

> 
> That said, I do believe that we should also have option to panic on WARN().
> As for this patch, Andrew provided Rb and Stefano is happy with it. Do you want more people to vote?

No as long as this is not planned to be used in the Gitlab CI.

Cheers,

[1] https://xenbits.xen.org/xsa/advisory-441.html

-- 
Julien Grall

