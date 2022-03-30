Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B14214EBECF
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 12:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296223.504185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVdI-0004uj-R0; Wed, 30 Mar 2022 10:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296223.504185; Wed, 30 Mar 2022 10:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZVdI-0004sA-NZ; Wed, 30 Mar 2022 10:32:56 +0000
Received: by outflank-mailman (input) for mailman id 296223;
 Wed, 30 Mar 2022 10:32:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nZVdH-0004rw-0v
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 10:32:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nZVdC-0008Pt-K3; Wed, 30 Mar 2022 10:32:50 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.5.112]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nZVdC-0002Vh-Dj; Wed, 30 Mar 2022 10:32:50 +0000
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
	bh=bqGlgGe1YmPKrKQJ98Fpjyid3oBYHPBuzpjUqyWp44s=; b=z28FmHueVc4nd/1WkqTkAasrnY
	qK10APGwcjLsg1yUpkPbqf5oB5xZn2VhapcUc2LS9vxajKzjuqMj7xIaVxeqNl38h9pWXpeb5WBiO
	asGwZfev20w/sFUpfTlQNmTgNDVYSF6eBPj/JLMXBzSId2y+LOh1yf/2GJtrrwPZ8bdI=;
Message-ID: <b0b49926-9a70-37f1-43d4-ac4e852198ba@xen.org>
Date: Wed, 30 Mar 2022 11:32:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
 <d5bccf50-c74a-40e6-843e-3ad682647efb@arm.com>
 <5121de30-644f-8a1f-ff1a-29c4d2ee7f0f@xen.org>
 <63a680c6-0086-230b-dbbd-dfe63609f9bc@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <63a680c6-0086-230b-dbbd-dfe63609f9bc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 29/03/2022 12:42, Jan Beulich wrote:
> On 29.03.2022 12:54, Julien Grall wrote:
>> On 29/03/2022 11:12, Michal Orzel wrote:
>>> On 29.03.2022 11:54, Julien Grall wrote:
>>>> On 22/03/2022 08:02, Michal Orzel wrote:
>>>>> --- a/xen/include/xen/xen.lds.h
>>>>> +++ b/xen/include/xen/xen.lds.h
>>>>> @@ -5,4 +5,104 @@
>>>>>      * Common macros to be used in architecture specific linker scripts.
>>>>>      */
>>>>>     +/* Macros to declare debug sections. */
>>>>> +#ifdef EFI
>>>>
>>>> AFAIK, we don't define EFI on Arm (just CONFIG_EFI). Yet we do support EFI on arm64.
>>>>
>>>> As this #ifdef is now in generic code, can you explain how this is meant to be used?
>>>>
>>> As we do not define EFI on arm, all the stuff protected by #ifdef EFI is x86 specific.
>>
>> I find the name "EFI" too generic to figure out that this code can only
>> be used by x86.
>>
>> But, from my understanding, this header is meant to contain generic
>> code. It feels a bit odd that we are moving arch specific code.
>>
>> To be honest, I don't quite understand why we need to make the
>> diffferentiation on x86. So I guess the first question is how this is
>> meant to be used on x86?
> 
> We produce two linker scripts from the single source file: One (with EFI
> undefined) to link the ELF binary, and another (with EFI defined) to link
> the PE/COFF output. If "EFI" is too imprecise as a name for the identifier,
> I wouldn't mind renaming it (to PE_COFF?), but at the same time I'm not
> convinced this is really necessary.

Thank for the explanation (and the other ones in this thread). You are 
right the confusion arised from "generating" vs "linking".

Renaming to PE_COFF may help to avoid the confusion with CONFIG_EFI. 
That said, it would possibly make more difficult to associate the flag 
with "linking an EFI binary".

I think some documentaion about the define EFI would be help so there 
are no more confusion between CONFIG_EFI/EFI. But I am not sure where to 
put it. Maybe at the top of the header?

Cheers,

-- 
Julien Grall

