Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C817FC0A4
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:53:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643415.1003612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r82GN-0003Cr-Dk; Tue, 28 Nov 2023 17:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643415.1003612; Tue, 28 Nov 2023 17:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r82GN-0003AD-A2; Tue, 28 Nov 2023 17:52:47 +0000
Received: by outflank-mailman (input) for mailman id 643415;
 Tue, 28 Nov 2023 17:52:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r82GM-0003A7-FV
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:52:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r82GL-0006Bc-Jk; Tue, 28 Nov 2023 17:52:45 +0000
Received: from static-css-csq-252138.business.bouyguestelecom.com
 ([176.175.252.138] helo=[172.20.7.85])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r82GL-0005Mo-Dr; Tue, 28 Nov 2023 17:52:45 +0000
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
	bh=CZkEt1GTEJoH8wf4Wp2Nhn5cuRRVpXzpZqZYnrdbdPg=; b=FrXpwGriQdgqgFWzu68jioL0DW
	x9wBQuslprwhM5AZ4S9+Utej63pKei+ok88tlulDZ9HPC8Jy6nSLHmyZ33TttWdjCTCIoPj5GwXHw
	aDl5d3BQOjJw3TRAwmGwKOP/ZA7iYdxr39PPqm84YVsZAYaFKaNGIjWsLdNHByc1z1AY=;
Message-ID: <9d1e385e-152e-404a-8d8b-47c5ac08d76a@xen.org>
Date: Tue, 28 Nov 2023 18:52:43 +0100
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
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <16b73400-b592-4a1a-9b87-8c49aad9208d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 28/11/2023 18:15, Michal Orzel wrote:
> 
> 
> On 28/11/2023 18:09, Julien Grall wrote:
>>
>>
>> On 28/11/2023 18:00, Michal Orzel wrote:
>>> Hi Julien,
>>>
>>> On 28/11/2023 17:14, Julien Grall wrote:
>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>> On 27/11/2023 15:41, Michal Orzel wrote:
>>>>> Introduce the CONFIG_UBSAN_FATAL option to cater to scenarios where prompt
>>>>> attention to undefined behavior issues, notably during CI test runs, is
>>>>> essential. When enabled, this option causes Xen to panic upon detecting
>>>>> UBSAN failure (as the last step in ubsan_epilogue()).
>>>>
>>>> I have mixed opinions on this patch. This would be a good one if we had
>>>> a Xen mostly free from UBSAN behavior. But this is not the case at least
>>>> on arm32. So we would end up to stop at the first error. IOW, we would
>>>> need to fix the first error before we can see the next one.
>>> Well, this patch introduces a config option disabled by default.
>>
>> I understood this is disabled by default... I am pointing out that I am
>> not convinced about the usefulness until we are at the stage where Xen
>> is normally not reporting any USBAN error.
>>
>>> If we end up enabling it for CI for reasons* stated by Andrew, then the natural way
>>> of handling such issues is to do the investigation locally.
>>
>> This will not always be possible. One example is when you are only able
>> to reproduce some of the USBAN errors on a specific HW.
>>
>>> Then, you are not forced
>>> to select this option and you can see all the UBSAN issues if you want.
>>
>> See above, I got that point. I am mostly concerned about the implication
>> in the CI right now.
>>
>>>
>>>>
>>>> So I feel it would be best if the gitlab CI jobs actually check for
>>>> USBAN in the logs and fail if there are any. With that, we can get the
>>>> full list of UBSAN issues on each job.
>>> Well, I prefer Andrew suggestion (both [1] and on IRC), hence this patch.
>>>
>>> *my plan was to first fix the UBSAN issues and then enable this option for CI.
>>
>> That would have been useful to describe your goal after "---". With that
>> in mind, then I suggest to revisit this patch once all the UBSAN issues
>> in a normal build are fixed.
> But this patch does not enable this option for CI automatically, right?

Correct.

> Why are you so keen to push it back?

I have been pushing back because your commit message refers to the CI 
specifically and today this would not really work (read as I would not 
be happy if this option is enabled in the CI right now at least on arm32).

If you want to fail a CI job for UBSAN today, then we need to find a 
different approach so we can get the full list of UBSAN error rather 
than fixing one, retry and then next one.

> Is it because you see no point in this option other than for the upstream CI loop?

Even in the upstream CI loop, I am a little unsure about this approach. 
At least, I feel I would want to see all the reports at once in the CI.

But this is not really a strong feeling.

> I find it useful on a day-to-day
> Xen runs, and I would for sure enable it by default in my config not to miss UBSAN failures.

Fair enough. I view USBAN issues the same a WARN_ON. They all need to be 
investigated. So now you have an inconsistent policy.

Are you are also intending to switch WARN_ON() to fatal? If not, then 
why would UBSAN warnings more important that the other warnings?

Cheers,

-- 
Julien Grall

