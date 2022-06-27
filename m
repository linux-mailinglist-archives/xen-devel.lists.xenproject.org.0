Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA755B904
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 11:52:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356372.584556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lPi-0003km-1O; Mon, 27 Jun 2022 09:52:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356372.584556; Mon, 27 Jun 2022 09:52:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5lPh-0003iz-Uk; Mon, 27 Jun 2022 09:52:13 +0000
Received: by outflank-mailman (input) for mailman id 356372;
 Mon, 27 Jun 2022 09:52:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o5lPg-0003it-L2
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 09:52:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5lPf-0007v3-HU; Mon, 27 Jun 2022 09:52:11 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.2.226]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5lPf-0007Vt-Bf; Mon, 27 Jun 2022 09:52:11 +0000
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
	bh=RuH7KmEmpT0iYLGHwYsJhd89eJ1MfwHwZrZ6ovrcu34=; b=3M2MWQwIfMuoPl81SrWlwDITkD
	GXe77ygDF/RjYfs5C8U2TdqCcZ8wCeK0oYVN47pSW9bht2g5oQ1l+oA0gP+HlAhUWWLtVMidHpS2f
	kcse1ZXPz70Qg08gdmLj6aulEu/JCEb/80tH9XibswerHZdEeJDiIkP4+u0E46wXRwwE=;
Message-ID: <e92b0f0f-d73c-a003-eb0f-15f7d624a75e@xen.org>
Date: Mon, 27 Jun 2022 10:52:09 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <1218329a-13a3-79b6-6753-c2c9a0c45b2d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2022 07:31, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 24.06.2022 11:11, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> A lot of places in the ARM32 assembly requires to load the physical address
>> of a symbol. Rather than open-coding the translation, introduce a new macro
>> that will load the phyiscal address of a symbol.
>>
>> Lastly, use the new macro to replace all the current open-coded version.
>>
>> Note that most of the comments associated to the code changed have been
>> removed because the code is now self-explanatory.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/arm32/head.S | 23 +++++++++++------------
>>   1 file changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index c837d3054cf9..77f0a619ca51 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -65,6 +65,11 @@
>>           .endif
>>   .endm
>>   
>> +.macro load_paddr rb, sym
>> +        ldr   \rb, =\sym
>> +        add   \rb, \rb, r10
>> +.endm
>> +
> All the macros in this file have a comment so it'd be useful to follow this convention.
This is not really a convention. Most of the macros are non-trivial 
(e.g. they may clobber registers).

The comment I have in mind here would be:

"Load the physical address of \sym in \rb"

I am fairly confident that anyone can understand from the ".macro" 
line... So I don't feel the comment is necessary.

Cheers,

-- 
Julien Grall

