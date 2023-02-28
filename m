Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EEA6A5E76
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 18:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503648.775980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX4E1-0002zf-2U; Tue, 28 Feb 2023 17:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503648.775980; Tue, 28 Feb 2023 17:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX4E0-0002xF-Vs; Tue, 28 Feb 2023 17:57:16 +0000
Received: by outflank-mailman (input) for mailman id 503648;
 Tue, 28 Feb 2023 17:57:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pX4Dz-0002x7-4v
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 17:57:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pX4Dy-0008N3-He; Tue, 28 Feb 2023 17:57:14 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.12.216]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pX4Dy-0005vG-BX; Tue, 28 Feb 2023 17:57:14 +0000
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
	bh=L3qVFr6CW0g5/aVBc47poeXu26DZd+3MnbF1a8CnmAk=; b=u5+439rjsKeU0iXaawFebrmXSs
	Z7SrAjLtNli9vNR7kggSUURIcSmT6OVQko9bdunMlqtzZ2XD904DDkX2EaCczl66ISeA10POSRi12
	cSgWnHz+5+bLMRIxjOPREB8HnXKs7pUeO5Bp9KVIxcGUuH+BpfD3ksL0gamdIatU7yy4=;
Message-ID: <75df5a86-5d64-d219-c25c-644748a88302@xen.org>
Date: Tue, 28 Feb 2023 17:57:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/4] xen/arm: switch ARM to use generic implementation
 of bug.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <d80c136720c156d6ef83f27f1ce8dca5dba5b5a0.1677233393.git.oleksii.kurochko@gmail.com>
 <f82b8c50-47f2-d8b0-5a2c-60203e5d5e26@xen.org>
 <ae96eb36-aeba-86f0-3b72-a8b62f4dce60@xen.org>
 <6735859208c6dcb7320f89664ae298005f70827b.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6735859208c6dcb7320f89664ae298005f70827b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/02/2023 17:21, Oleksii wrote:
> Hi Julien,

Hi Oleksii,

> On Sat, 2023-02-25 at 17:05 +0000, Julien Grall wrote:
>>
>>
>> On 25/02/2023 16:49, Julien Grall wrote:
>>> Hi Oleksii,
>>>
>>> On 24/02/2023 11:31, Oleksii Kurochko wrote:
>>>> The following changes were made:
>>>> * make GENERIC_BUG_FRAME mandatory for ARM
>>>
>>> I have asked in patch #1 but will ask it again because I think this
>>> should be recorded in the commit message. Can you outline why it is
>>> not
>>> possible to completely switch to the generic version?
>>
>> I have just tried to remove it on arm64 and it seems to work. This
>> was
>> only tested with GCC 10 though. But given the generic version is not
>> not
>> using the %c modifier, then I wouldn't expect any issue.
>>
>> Cheers,
>>
> 
> I tried to switch ARM to generic implementation.
> 
> Here is the patch: [1]

This is similar to the patch I wrote to test with generic implementation 
on Arm (see my other reply).

[...]

> (it will be merged with patch 3 if it is OK )
> 
> And looks like we can switch ARM to generic implementation as all tests
> passed:
> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/791549396

Thanks for checking with the gitlab CI!

> 
> The only issue is with yocto-arm:
> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/791549396/failures
> But I am not sure that it is because of my patch

This looks unrelated to me. This is happening because there is a data 
abort before PSCI (used to reboot the platform) is properly setup. I 
think we should consider to only print once the error rather than every 
few iterations (not a request for you).

That said, I am a bit puzzled why this issue is only happening in the 
Yocto test (the Debian one pass). Do you know if the test is passing in 
the normal CI?

If yes, what other modifications did you do?

Cheers,

-- 
Julien Grall

