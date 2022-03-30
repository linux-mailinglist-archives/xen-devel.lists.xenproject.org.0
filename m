Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5EB4EBF86
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 13:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296252.504244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZW7t-0002DQ-IC; Wed, 30 Mar 2022 11:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296252.504244; Wed, 30 Mar 2022 11:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZW7t-00029x-Ef; Wed, 30 Mar 2022 11:04:33 +0000
Received: by outflank-mailman (input) for mailman id 296252;
 Wed, 30 Mar 2022 11:04:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5iAL=UJ=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nZW7r-00029r-Nl
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 11:04:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 2b6ca8ee-b019-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 13:04:29 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EDBE23A;
 Wed, 30 Mar 2022 04:04:28 -0700 (PDT)
Received: from [10.57.8.78] (unknown [10.57.8.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC2723F66F;
 Wed, 30 Mar 2022 04:04:25 -0700 (PDT)
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
X-Inumbo-ID: 2b6ca8ee-b019-11ec-8fbc-03012f2f19d4
Message-ID: <ffa0e581-6a32-5c3c-7e63-acd5086c6822@arm.com>
Date: Wed, 30 Mar 2022 13:04:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
 <d5bccf50-c74a-40e6-843e-3ad682647efb@arm.com>
 <5121de30-644f-8a1f-ff1a-29c4d2ee7f0f@xen.org>
 <63a680c6-0086-230b-dbbd-dfe63609f9bc@suse.com>
 <b0b49926-9a70-37f1-43d4-ac4e852198ba@xen.org>
 <1013a14b-a45b-f37f-b2e0-e63b186a2956@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <1013a14b-a45b-f37f-b2e0-e63b186a2956@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

On 30.03.2022 12:42, Jan Beulich wrote:
> On 30.03.2022 12:32, Julien Grall wrote:
>> On 29/03/2022 12:42, Jan Beulich wrote:
>>> On 29.03.2022 12:54, Julien Grall wrote:
>>>> On 29/03/2022 11:12, Michal Orzel wrote:
>>>>> On 29.03.2022 11:54, Julien Grall wrote:
>>>>>> On 22/03/2022 08:02, Michal Orzel wrote:
>>>>>>> --- a/xen/include/xen/xen.lds.h
>>>>>>> +++ b/xen/include/xen/xen.lds.h
>>>>>>> @@ -5,4 +5,104 @@
>>>>>>>      * Common macros to be used in architecture specific linker scripts.
>>>>>>>      */
>>>>>>>     +/* Macros to declare debug sections. */
>>>>>>> +#ifdef EFI
>>>>>>
>>>>>> AFAIK, we don't define EFI on Arm (just CONFIG_EFI). Yet we do support EFI on arm64.
>>>>>>
>>>>>> As this #ifdef is now in generic code, can you explain how this is meant to be used?
>>>>>>
>>>>> As we do not define EFI on arm, all the stuff protected by #ifdef EFI is x86 specific.
>>>>
>>>> I find the name "EFI" too generic to figure out that this code can only
>>>> be used by x86.
>>>>
>>>> But, from my understanding, this header is meant to contain generic
>>>> code. It feels a bit odd that we are moving arch specific code.
>>>>
>>>> To be honest, I don't quite understand why we need to make the
>>>> diffferentiation on x86. So I guess the first question is how this is
>>>> meant to be used on x86?
>>>
>>> We produce two linker scripts from the single source file: One (with EFI
>>> undefined) to link the ELF binary, and another (with EFI defined) to link
>>> the PE/COFF output. If "EFI" is too imprecise as a name for the identifier,
>>> I wouldn't mind renaming it (to PE_COFF?), but at the same time I'm not
>>> convinced this is really necessary.
>>
>> Thank for the explanation (and the other ones in this thread). You are 
>> right the confusion arised from "generating" vs "linking".
>>
>> Renaming to PE_COFF may help to avoid the confusion with CONFIG_EFI. 
>> That said, it would possibly make more difficult to associate the flag 
>> with "linking an EFI binary".
> 
> Indeed. And EFI_PE_COFF is getting a little unwieldy for my taste.
> 
>> I think some documentaion about the define EFI would be help so there 
>> are no more confusion between CONFIG_EFI/EFI. But I am not sure where to 
>> put it. Maybe at the top of the header?
> 
> That's perhaps the best place, yes.
> 
In this case how about the following comment at the top of xen.lds.h:

"To avoid any confusion about EFI macro used in this header vs EFI support,
the former is used when linking a native EFI (i.e. PE/COFF) binary, whereas
the latter means support for generating EFI binary. Currently EFI macro is
only defined by x86 to link PE/COFF output, however it is not unique to this
architecture."

> Jan
> 

Cheers,
Michal

