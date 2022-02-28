Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FF24C7897
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 20:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280745.478796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOlV6-0004GT-H7; Mon, 28 Feb 2022 19:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280745.478796; Mon, 28 Feb 2022 19:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOlV6-0004Ec-DP; Mon, 28 Feb 2022 19:16:04 +0000
Received: by outflank-mailman (input) for mailman id 280745;
 Mon, 28 Feb 2022 19:16:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOlV5-0004EV-1d
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 19:16:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOlV2-0004fP-Cj; Mon, 28 Feb 2022 19:16:00 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.13.237]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOlV2-0002uB-6J; Mon, 28 Feb 2022 19:16:00 +0000
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
	bh=+ebivgdSZz++H5uAdMdU0S7sRir0Zj4rY9Rya5d/fII=; b=fXQQMA4Zpd5YQyS0kyqwly1ehv
	6tz6IPoKQq1Ww8GAgZ8gTvKoIV1+NwnpT+joX84zKUuR1aL6GZS12QKWEA/nvO8oGNEFCny1B9vz0
	1z/T+bUZPszRUTVWhnLmqrb4OMsUIfYpiivsfKd0oG9TUeNiy3Ovp6lmMPgySEsJVtkQ=;
Message-ID: <9d5d7760-ea52-8c0b-b649-319f4c812b14@xen.org>
Date: Mon, 28 Feb 2022 19:15:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] lib: extend ASSERT()
To: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <75125344-b0e1-9663-4c1a-84bb35870fef@suse.com>
 <35d82770-66cf-e030-5bcc-3c030e4463d7@xen.org>
 <3F58400B-5151-42F2-8F39-109DDF50EE1E@arm.com>
 <a89223c8-f59a-24cc-96a7-e40feb28813f@suse.com>
 <DB014136-7797-4A61-9681-33A7D85403AA@citrix.com>
 <732e8e39-36c4-1651-61f3-9b55caf29fe8@suse.com>
 <46408EAE-5EA4-4B22-B685-BA6D313B5D3A@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <46408EAE-5EA4-4B22-B685-BA6D313B5D3A@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi George,

Sorry for the late answer.

On 16/02/2022 12:23, George Dunlap wrote:
> 
> 
>> On Feb 16, 2022, at 11:42 AM, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 16.02.2022 12:34, George Dunlap wrote:
>>
>>> I am opposed to overloading “ASSERT” for this new kind of macro; I think it would not only be unnecessarily confusing to people not familiar with our codebase, but it would be too easy for people to fail to notice which macro was being used.
>>>
>>> ASSERT_ACTION(condition, code) (or even ASSERT_OR_ACTION()) would be a bare minimum for me.
>>>
>>> But I can’t imagine that there are more than a handful of actions we might want to take, so defining a macro for each one shouldn’t be too burdensome.
>>>
>>> Furthermore, the very flexibility seems dangerous; you’re not seeing what actual code is generated, so it’s to easy to be “clever”, and/or write code that ends up doing something different than you expect.
>>>
>>> At the moment I think ASSERT_OR_RETURN(condition, code), plus other new macros for the other behavior is needed, would be better.
>>
>> Hmm, while I see your point of things possibly looking confusing or
>> unexpected, something like ASSERT_OR_RETURN() (shouldn't it be
>> ASSERT_AND_RETURN()?) is imo less readable. In particular I dislike
>> the larger amount of uppercase text. But yes, I could accept this
>> as a compromise as it still seems better to me than the multi-line
>> constructs we currently use.
> 
> I see what you’re saying with AND/OR; I personally still prefer OR but wouldn’t argue to hard against AND if others preferred it.
> 
> As far as I’m concerned, the fact that we’re reducing lines of code isn’t a reason to use this at all.  As our CODING_STYLE says, ASSERT() is just a louder printk.  We would never consider writing PRINTK_AND_RETURN(), and we would never consider writing a macro like CONDRET(condition, retval) to replace
> 
> if (condition)
>      return retval;
> 
> The only justification for this kind of macro, in my opinion, is to avoid duplication errors; i.e. replacing your code segment with the following:
> 
> if (condition) {
>      ASSERT(!condition);
>      return foo;
> }
> 
> is undesirable because there’s too much risk that the conditions will drift or be inverted incorrectly. But having control statements like ‘return’ and ‘continue’ in a macro is also undesirable in my opinion; I’m personally not sure which I find most undesirable.
> 
> I guess one advantage of something like ASSERT_OR(condition, return foo); or ASSERT_OR(condition, continue); is that searching for “return” or “continue” will come up even if you’re doing a case-sensitive search.  But I’m still wary of unintended side effects.
> 
> Bertrand / Julien, any more thoughts?
The discussion reminds me WARN_ONCE() in Linux. The macro returns a 
value so it can be used like:

if (WARN_ONCE(...))
   return error;

How about introducing a new macro that would return whether the check 
passed and if the check failed crashed in debug build?

I am not suggesting to modify ASSERT() because the compiler may decide 
to not ellide check in production build. Also, the name feels a little 
bit odd.

Cheers,

-- 
Julien Grall

