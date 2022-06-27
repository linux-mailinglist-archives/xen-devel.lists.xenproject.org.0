Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E785C55B911
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 12:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356409.584622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lgP-0008Rb-Ry; Mon, 27 Jun 2022 10:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356409.584622; Mon, 27 Jun 2022 10:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lgP-0008PL-P5; Mon, 27 Jun 2022 10:09:29 +0000
Received: by outflank-mailman (input) for mailman id 356409;
 Mon, 27 Jun 2022 10:09:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o5lgP-0008PF-1U
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 10:09:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5lgO-0008S3-Nk; Mon, 27 Jun 2022 10:09:28 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.2.226]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5lgO-0008Sk-Gk; Mon, 27 Jun 2022 10:09:28 +0000
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
	bh=kQ1uzM4Ezv5rcEN2PYnbIlEciQrawISUpwH0zLWQhas=; b=cApBeOqUEm/SIV+7lZ+qx/0jF9
	tMWGXkMGj8Bt+WhfKbM6SWyKuoif+/bayL2aYHmZnO2NP/hmjaOFQRDJmDDWclZVck2OPRjQClPHm
	EYP7kLEi1iKgInCEf9SrefrYogzXnu36Y9cjts8+c9ZbklFLnKdIHpQmKuEDeBBk2tTg=;
Message-ID: <fbead981-fe36-30fe-12cd-29842a642e47@xen.org>
Date: Mon, 27 Jun 2022 11:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] xen/arm32: head.S: Introduce a macro to load the
 physical address of a symbol
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-3-julien@xen.org>
 <1218329a-13a3-79b6-6753-c2c9a0c45b2d@arm.com>
 <e92b0f0f-d73c-a003-eb0f-15f7d624a75e@xen.org>
 <8c8d6a9f-18cd-43e5-0835-68927e7d1bac@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8c8d6a9f-18cd-43e5-0835-68927e7d1bac@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Michal,

On 27/06/2022 10:59, Michal Orzel wrote:
> 
> 
> On 27.06.2022 11:52, Julien Grall wrote:
>>
>>
>> On 27/06/2022 07:31, Michal Orzel wrote:
>>> Hi Julien,
>>
>> Hi Michal,
>>
>>> On 24.06.2022 11:11, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> A lot of places in the ARM32 assembly requires to load the physical address
>>>> of a symbol. Rather than open-coding the translation, introduce a new macro
>>>> that will load the phyiscal address of a symbol.
>>>>
>>>> Lastly, use the new macro to replace all the current open-coded version.
>>>>
>>>> Note that most of the comments associated to the code changed have been
>>>> removed because the code is now self-explanatory.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>> ---
>>>>    xen/arch/arm/arm32/head.S | 23 +++++++++++------------
>>>>    1 file changed, 11 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>>>> index c837d3054cf9..77f0a619ca51 100644
>>>> --- a/xen/arch/arm/arm32/head.S
>>>> +++ b/xen/arch/arm/arm32/head.S
>>>> @@ -65,6 +65,11 @@
>>>>            .endif
>>>>    .endm
>>>>    +.macro load_paddr rb, sym
>>>> +        ldr   \rb, =\sym
>>>> +        add   \rb, \rb, r10
>>>> +.endm
>>>> +
>>> All the macros in this file have a comment so it'd be useful to follow this convention.
>> This is not really a convention. Most of the macros are non-trivial (e.g. they may clobber registers).
>>
>> The comment I have in mind here would be:
>>
>> "Load the physical address of \sym in \rb"
>>
>> I am fairly confident that anyone can understand from the ".macro" line... So I don't feel the comment is necessary.
>>
> Fair enough although you did put a comment when introducing load_paddr for arm64 head.S

For the better (or the worse) my way to code has evolved in the past 5 
years. :) Commenting is something that changed. I learnt from other open 
source projects that it is better to comment when it is not clear what 
the function/code is doing.

Anyway, this is easy enough for me to add if either Bertrand or Stefano 
think that it is better to add a comment.

Cheers,

-- 
Julien Grall

