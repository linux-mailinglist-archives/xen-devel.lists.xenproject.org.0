Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6041C3F2E45
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 16:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169570.309769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH5iN-0000Xu-1S; Fri, 20 Aug 2021 14:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169570.309769; Fri, 20 Aug 2021 14:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH5iM-0000WK-U9; Fri, 20 Aug 2021 14:41:46 +0000
Received: by outflank-mailman (input) for mailman id 169570;
 Fri, 20 Aug 2021 14:41:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mH5iL-0000WE-F5
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 14:41:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH5iL-0004X1-9r; Fri, 20 Aug 2021 14:41:45 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH5iL-0004Ug-42; Fri, 20 Aug 2021 14:41:45 +0000
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
	bh=lk5MHqeag5VsFqUhgTDJIKvQ4yZc4+EvU1tREyHhZxg=; b=se/M1ZhEzkrrcUMWbeC4l4pWbe
	JD7YtUgjRGA//O2wvoVhgmqioKK4dfaSJbxk4Q2pA8FHLp0azveQw8/JPa+64++heChcVnpowEf/X
	17WlwrGI7Urew3bnPRZXxV67VU5/EFoJA/44EZDy9tKtHZMH9GSJq7mb9kh2QlYJRaAI=;
Subject: Re: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake NUMA
 API
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-8-wei.chen@arm.com>
 <e9a45fe3-e4b0-6533-8b41-ac3f10ef386a@xen.org>
 <DB9PR08MB6857D0004A59BC90866AE4C89EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <4de5b7ed-ada5-2114-2002-7f5e26a89417@xen.org>
 <DB9PR08MB6857B5CEDA012C10B192F3F19EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <54707c92-3bda-60b8-4b36-1eae172cacb1@xen.org>
 <DB9PR08MB6857BA75DFA2294CCC26EA309EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <12065cae-6dd4-84c9-d6c7-2e901cf50a6a@xen.org>
Date: Fri, 20 Aug 2021 15:41:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB6857BA75DFA2294CCC26EA309EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 20/08/2021 13:23, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月20日 19:24
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake
>> NUMA API
>>
>>
>>
>> On 20/08/2021 11:24, Wei Chen wrote:
>>> Hi Julien,
>>
>> Hi Wei,
>>
>>>
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: 2021年8月20日 16:24
>>>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>>>> sstabellini@kernel.org; jbeulich@suse.com
>>>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>>> Subject: Re: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep
>> fake
>>>> NUMA API
>>>>
>>>>
>>>>
>>>> On 20/08/2021 03:08, Wei Chen wrote:
>>>>> Hi Julien,
>>>>
>>>> Hi Wei,
>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Julien Grall <julien@xen.org>
>>>>>> Sent: 2021年8月19日 21:34
>>>>>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>>>>>> sstabellini@kernel.org; jbeulich@suse.com
>>>>>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>>>>> Subject: Re: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep
>>>> fake
>>>>>> NUMA API
>>>>>>
>>>>>> Hi Wei,
>>>>>>
>>>>>> On 11/08/2021 11:23, Wei Chen wrote:
>>>>>>> Only Arm64 supports NUMA, the CONFIG_NUMA could not be
>>>>>>> enabled for Arm32.
>>>>>>
>>>>>> What do you mean by "could not be enabled"?
>>>>>
>>>>> I have not seen any Arm32 hardware support NUMA, so I think
>>>>> we don't need to support Arm32 NUMA.
>>>>
>>>> I understand that there may not be 32-bit platform with NUMA. And
>> that's
>>>> fine stating that in the commit message. However...
>>>>
>>>>> In this case, this Kconfig
>>>>> option could not be enabled on Arm32.
>>>>
>>>> ... you continue to say "couldn't be enabled" without clarifying
>> whether
>>>> this mean that the build will break or this was just not tested because
>>>> you don't have any platform.
>>>
>>> Ok, I understand your concern. Yes, my words would lead to mis-
>> understanding.
>>> If we make CONFIG_NUMA enabled in Arm32, it need Arm32 to implement some
>>> code to support NUMA common code. Otherwise the Arm32 build will failed.
>>
>> When I skimmed through the series, most of the code seems to be either
>> in common, arm (bitness neutral). So I am not quite too sure why it
>> would not build. Do you have more details?
>>
> 
> It could not build because I have not tried to enable device_tree_numa
> option for Arm32 but enabled NUMA for arm32.
> 
> I have tested it again, yes, simple enable device_tree_numa and NUMA
> for arm32 can build a image successfully.
> 
> So, I think it's OK to enable this on Arm32, and I will do it in next
> version. But, can we still keep these FAKE APIs? If user don't want to
> enable NUMA they still can make Xen work? 

Yes, we still need to keep the FAKE APIs. I was only commenting about 
the wording in the commit message.

> And I will remove "could not
> enable for Arm32" from commit log.
> 
>>> I have not tried to implement those code for Arm32. And I found there is
>>> no Arm32 machine support NUMA, so I wanted Arm32 to use fake NUMA API
>>> as before.
>>>
>>>>
>>>> To put it differently, the code for NUMA looks bitness neutral. So I
>>>> cannot really what what prevent us to potentially use it on Arm 32-bit.
>>>>
>>>
>>> Yes, you're right, it's neutral. But do we really need to add code to an
>>> ARCH that it may never use?
>>
>> Technically you already added the code because arch/arm/ is common
>> between arm32 and arm64. My only ask is to not make the new config
>> depends on arm64. If you only build test it that fine because...
>>
>> And how can we test this code?
>>
>> I don't expect any of the code to be an issue on arm32 as the code
>> should mostly be arch neutral.
> 
> I mean, we don't have Arm32 NUMA machine to test, I don't know
> the code works well on Arm32 NUMA or not. I only can verify them
> on non-NUMA arm32, and make sure this code will not break existed
> machines.

I understood you don't have any Arm32 NUMA machine. But I don't see the 
lack of testing as an issue because the code doesn't look to contain 
bits that may rely on arm64. So there are very limited reasons for the 
code to break on arm32.

If we really want to test it, then it should be feasible to fake the 
NUMA node in the DT. However, I don't expect you to do it.

Cheers,

-- 
Julien Grall

