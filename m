Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367F158F1BA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 19:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383775.618964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLple-0006sR-DS; Wed, 10 Aug 2022 17:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383775.618964; Wed, 10 Aug 2022 17:45:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLple-0006pF-9x; Wed, 10 Aug 2022 17:45:18 +0000
Received: by outflank-mailman (input) for mailman id 383775;
 Wed, 10 Aug 2022 17:45:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oLplc-0006p9-VO
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 17:45:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oLplc-0006Lz-Ij; Wed, 10 Aug 2022 17:45:16 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.36])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oLplc-0004iO-BR; Wed, 10 Aug 2022 17:45:16 +0000
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
	bh=W4/2Bri3/orgQBwai+UpiioD9mgtnJdE4wIsqczzSHo=; b=kqivDXgjU0t+Y99saGsuIxKwkU
	85j7gU+pngaCDsXbXgWmW7G89XYrEGZ3v8805aD7xasyt98NeoxQ3/S15ECU+/hVrji7HvnTRJJnO
	d+Fq5dYXeQ48o4FgTx52aREKeZaibQVbHofsYwBkJR70NsWtRB5yU5Y+7qvu1Uf/NDH8=;
Message-ID: <de686a60-b8fb-af85-a310-52236f4b2021@xen.org>
Date: Wed, 10 Aug 2022 18:45:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [XEN v1] xen: arm: Check if timer is enabled for timer irq
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@amd.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20220810105822.18404-1-ayankuma@amd.com>
 <6cfcd4fa-3afd-1c70-6a70-9df557ee1811@xen.org>
 <f10e92ea-ac57-18a9-8843-781d3242f67d@amd.com>
 <28d85fd0-0e61-7e45-34c5-91ba746561ce@xen.org>
 <5548c76c-cf75-05fa-2f20-256e210afd32@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5548c76c-cf75-05fa-2f20-256e210afd32@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 10/08/2022 17:44, Ayan Kumar Halder wrote:
> 
> On 10/08/2022 15:51, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 10/08/2022 15:00, Ayan Kumar Halder wrote:
>>> On 10/08/2022 14:34, Julien Grall wrote:
>>>> On 10/08/2022 11:58, Ayan Kumar Halder wrote:
>>>>> Refer "Arm Architecture Registers DDI 0595", AArch32 system registers,
>>>> Checking the 'enable' is not going to add too much overhead. So I am 
>>>> fine if this is added. That said, would you be able to provide more 
>>>> details on how this was spotted?
>>>
>>> This was spotted while debugging an unrelated problem while porting 
>>> Xen on R52. For a different reason, I was not able to get context 
>>> switch to work correctly.
>>>
>>> When I was scrutinizing the timer_interrupt() with the documentation, 
>>> I found that we are not checking ENABLE.
>>>
>>> Although the code works fine today (on aarch32 or aarch64), I thought 
>>> it is better to add the check for the sake of compliance with the 
>>> documentation.
>>
>> Thanks for the clarification. I am quite curious to know why you think 
>> our code is not compliant.
>>
>> As I wrote before, when ENABLE is cleared, you should never have an 
>> interrupt because the timer interrupt is level. So I believe our code 
>> is compliant with the Arm Arm.
>>
>> The only reason I am OK with checking ENABLE is because the overhead 
>> is limited. If this wasn't the case, then I think I would have wanted 
>> clear justification in the commit message *why* this is not compliant.
> 
> Sorry, I think I misunderstood this part of the documentation
> 
> "When the value of the ENABLE bit is 1, ISTATUS indicates whether the 
> timer condition is met."
> 
> I understood this as "ENABLE" need to be checked before "ISTATUS" is 
> checked.

Sorry I should have been clearer. I wasn't suggesting your understanding 
of the spec were wrong. In fact, it is correct and in theory we should 
check it.

I was pointing out that in practice I believe this is not necessary and 
our code is still compliant.

I also agree, this is not obvious from the code why we are compliant 
there are usually two ways to approach it:
   1) Add the extra check/barriers. The pros is the code is strictly 
compliant the cons is this could add overhead.
   2) Document it. The cons is we may be wrong and therefore end up in a 
unknown territory. In this case, this is mitigated by the fact the bit 
is "unknown" (and therefore I believe can never have a different 
meaning) and this will only trigger a "walk the list". That list would 
be empty if the timer is disabled.

You went with 1) and I am fine with that (I explained why before).

Cheers,

-- 
Julien Grall

