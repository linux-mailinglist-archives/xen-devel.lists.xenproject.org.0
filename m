Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 299C62EF0A5
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 11:28:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63293.112402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxozW-0003OV-LZ; Fri, 08 Jan 2021 10:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63293.112402; Fri, 08 Jan 2021 10:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxozW-0003O6-II; Fri, 08 Jan 2021 10:27:34 +0000
Received: by outflank-mailman (input) for mailman id 63293;
 Fri, 08 Jan 2021 10:27:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kxozU-0003O1-ND
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 10:27:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxozU-00065H-FH; Fri, 08 Jan 2021 10:27:32 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kxozU-0002Pz-4w; Fri, 08 Jan 2021 10:27:32 +0000
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
	bh=Pt+TsitmavZ1ekV6wkNxWMv9a8cpVcSFa9udMET8ciM=; b=Pu2o5utYnACxP7+BR5oXnfdKRD
	PFu5c6yW/Z0aRppBRZzylSZv5DH/n1cB22PelQuXrQSZFLNLHaL/hrG4nMKnrSUPznD++/TBrfhoE
	g8Q3H/GKYTPYggfXModfX5XvyYIpLJH1plxX8Oln9AqagVXg2Hhm3WTv/MbSp60wiSX0=;
Subject: Re: [PATCH v1] arm/optee: Use only least 32 bits for SMC type arg
 according to SMCCC
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Roman Skakun <Roman_Skakun@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <123c27ed53ab50ca6f605a96002dcc7e1b7d3e6e.1609931750.git.rm.skakun@gmail.com>
 <48f8e967-2454-7d4b-8e86-0b1baddef52e@xen.org> <87turt4pnc.fsf@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b22514ba-2ec2-7e47-d5b7-be3292139535@xen.org>
Date: Fri, 8 Jan 2021 10:27:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87turt4pnc.fsf@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 06/01/2021 23:22, Volodymyr Babchuk wrote:
> 
> Hi Julien,
> 
> Julien Grall writes:
> 
>> Hi Roman,
>>
>> On 06/01/2021 11:26, Roman Skakun wrote:
>>> This patch added additional sanity and increases an understanding for
>>> getting proper value from the first argument for SMC call on aarch64
>>> according to SMCC Convention.
>>
>> I would suggest the following commit message:
>>
>> "xen/arm: optee: The function identifier is always 32-bit
>>
>> Per the SMCCC specification (see section 3.1 in ARM DEN 0028D), the
>> function identifier is only stored in the least significant
>> 32-bits. The most significant 32-bits should be ignored.
>>
>> The function optee_handle_call() is now updated to ignore the most
>> significant 32-bits.
>>
>> "
>>
>> Note that I used the version D rather than B because the latter has
>> buggy wording (it seems to suggest that the least significants bits
>> should be ignored).
>>
>> Furthermore, I checked vsmc.c (the layer that dispatch the SMC) and it
>> was already handled properly thanks to commit 7f4217cc6057 "xen/arm:
>> vsmc: The function identifier is always 32-bit".
>>
>>> [0] ARM DEN0028B, page 12
>>> Signed-off-by: Roman Skakun <roman_skakun@epam.com>
>>> ---
>>>    xen/arch/arm/tee/optee.c | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>> diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
>>> index ee85359742..87060b52b8 100644
>>> --- a/xen/arch/arm/tee/optee.c
>>> +++ b/xen/arch/arm/tee/optee.c
>>> @@ -1643,7 +1643,8 @@ static bool optee_handle_call(struct cpu_user_regs *regs)
>>>        if ( !ctx )
>>>            return false;
>>>    -    switch ( get_user_reg(regs, 0) )
>>> +    /* Only least 32 bits are significant (see ARM DEN 0028B, page 12) */
>>
>> I would suggest:
>>
>> /* The function identifier is always stored in the least significant
>> 32-bit (see section ARM DEN 0028D) */
>>
>> I can update it while committing, if both Volodymyr and you are happy
>> with changes.
> 
> I'm totally fine with the proposed changes. Thank you for tidying this up.

Thanks! I have updated the patch and committed it.

Cheers,

> 

-- 
Julien Grall

