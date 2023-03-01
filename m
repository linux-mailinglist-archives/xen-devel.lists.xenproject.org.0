Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 208336A6DAA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 14:59:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504045.776541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXMyi-0006eG-C1; Wed, 01 Mar 2023 13:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504045.776541; Wed, 01 Mar 2023 13:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXMyi-0006bN-9L; Wed, 01 Mar 2023 13:58:44 +0000
Received: by outflank-mailman (input) for mailman id 504045;
 Wed, 01 Mar 2023 13:58:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pXMyh-0006bH-E6
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 13:58:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXMyg-0008Af-Na; Wed, 01 Mar 2023 13:58:42 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.13.48]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pXMyg-0000uZ-HZ; Wed, 01 Mar 2023 13:58:42 +0000
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
	bh=DmiUFtCqpOl4y1p1jjM8YUZ+8W4/x9g+A9RFDZQaq8c=; b=mkxfkyeC9GnvFa0DsWyotPvHm9
	Z7jVKRlK44bJDhg6VlK4/aYV3yoeUlGZDnY3nU7GWLfzU8ClYgn9DCBAcRukcc7g7FttFgku5D2S3
	nyt8stOMdo/YlyFgd+Gn7OWr/VoBmLZgdzA0P+4r5bWu355Z0zC0371Mye9GE0CnnNh8=;
Message-ID: <297fb314-7752-fdf6-3003-f5bd1396c1e3@xen.org>
Date: Wed, 1 Mar 2023 13:58:40 +0000
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
 <75df5a86-5d64-d219-c25c-644748a88302@xen.org>
 <3f108af54c7d824f59a7dc1daf7d4d0c23f617ec.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3f108af54c7d824f59a7dc1daf7d4d0c23f617ec.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/03/2023 12:31, Oleksii wrote:
> Hi Julien,

Hi,

>>>>
>>>>> On 24/02/2023 11:31, Oleksii Kurochko wrote:
>>>>>> The following changes were made:
>>>>>> * make GENERIC_BUG_FRAME mandatory for ARM
>>>>>
>>>>> I have asked in patch #1 but will ask it again because I think
>>>>> this
>>>>> should be recorded in the commit message. Can you outline why
>>>>> it is
>>>>> not
>>>>> possible to completely switch to the generic version?
>>>>
>>>> I have just tried to remove it on arm64 and it seems to work.
>>>> This
>>>> was
>>>> only tested with GCC 10 though. But given the generic version is
>>>> not
>>>> not
>>>> using the %c modifier, then I wouldn't expect any issue.
>>>>
>>>> Cheers,
>>>>
>>>
>>> I tried to switch ARM to generic implementation.
>>>
>>> Here is the patch: [1]
>>
>> This is similar to the patch I wrote to test with generic
>> implementation
>> on Arm (see my other reply).
>>
>> [...]
>>
>>> (it will be merged with patch 3 if it is OK )
>>>
>>> And looks like we can switch ARM to generic implementation as all
>>> tests
>>> passed:
>>> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/791549396
>>
>> Thanks for checking with the gitlab CI!
>>
>>>
>>> The only issue is with yocto-arm:
>>> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/791549396/failures
>>> But I am not sure that it is because of my patch
>>
>> This looks unrelated to me. This is happening because there is a data
>> abort before PSCI (used to reboot the platform) is properly setup. I
>> think we should consider to only print once the error rather than
>> every
>> few iterations (not a request for you).
>>
>> That said, I am a bit puzzled why this issue is only happening in the
>> Yocto test (the Debian one pass). Do you know if the test is passing
>> in
>> the normal CI?
> I checked several pipelines on the normal CI and it is fine.
>>
>> If yes, what other modifications did you do?
> It looks like the issue happens after switch ARM to generic
> implementation of bug.h:
> -
> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792379063/failures
> [ failure ]
> -
> https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/792381665/failures
> [ passed ]
> 
> The difference between builds is only in the commit ' check if ARM can
> be fully switched to generic implementation '.
> For second one it is reverted so it looks like we can't switch ARM to
> generic implementation now as it is required addiotional investigation.

Thanks. Looking at the error again, it looks like the data abort is 
because we are accessing an unaligned address.

 From a brief look at arch/arm/xen.lds.S, I can at least see one case of 
misalignment (not clear why it would only happen now though). Can you try:

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 3f7ebd19f3ed..fb8155bd729f 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -67,6 +67,7 @@ SECTIONS
         *(.data.rel.ro)
         *(.data.rel.ro.*)

+      . = ALIGN(4);
         __proc_info_start = .;
         *(.proc.info)
         __proc_info_end = .;

> 
> There is no other significant changes ( only the changes mentioned in
> the current mail thread ).
> 
> Could we go ahead without switching ARM to generic implementation to
> not block other RISC-V patch series?

Given this is an alignment issue (Arm32 is more sensible to this than 
the other architecture, but this is still a potential problem for the 
other archs), I would really like to understand whether this is an issue 
in the common code or in the Arm linker script.

Cheers,

-- 
Julien Grall

