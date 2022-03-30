Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC674EC58E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 15:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296327.504369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYJs-0004CD-Ey; Wed, 30 Mar 2022 13:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296327.504369; Wed, 30 Mar 2022 13:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYJs-0004AE-Ay; Wed, 30 Mar 2022 13:25:04 +0000
Received: by outflank-mailman (input) for mailman id 296327;
 Wed, 30 Mar 2022 13:25:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5iAL=UJ=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nZYJq-0004A8-Qs
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 13:25:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ccdabf52-b02c-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 15:25:00 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6BE323A;
 Wed, 30 Mar 2022 06:24:59 -0700 (PDT)
Received: from [10.57.8.78] (unknown [10.57.8.78])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 824A33F73B;
 Wed, 30 Mar 2022 06:24:57 -0700 (PDT)
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
X-Inumbo-ID: ccdabf52-b02c-11ec-8fbc-03012f2f19d4
Message-ID: <d521854c-9aab-020d-75d6-ca085afa642a@arm.com>
Date: Wed, 30 Mar 2022 15:24:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20220322080233.53134-1-michal.orzel@arm.com>
 <20220322080233.53134-3-michal.orzel@arm.com>
 <2940b4c8-5d44-695e-4550-0a32c3a4c053@xen.org>
 <d5bccf50-c74a-40e6-843e-3ad682647efb@arm.com>
 <5121de30-644f-8a1f-ff1a-29c4d2ee7f0f@xen.org>
 <63a680c6-0086-230b-dbbd-dfe63609f9bc@suse.com>
 <b0b49926-9a70-37f1-43d4-ac4e852198ba@xen.org>
 <1013a14b-a45b-f37f-b2e0-e63b186a2956@suse.com>
 <ffa0e581-6a32-5c3c-7e63-acd5086c6822@arm.com>
 <e3a045d5-34d3-af73-89a7-7c306e7f8de4@suse.com>
 <168143f7-11e3-1acb-2de1-dba1a0db4ad3@arm.com>
 <55252ad6-021b-b96d-ae91-4ebbe4046dbb@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <55252ad6-021b-b96d-ae91-4ebbe4046dbb@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.03.2022 14:53, Jan Beulich wrote:
> On 30.03.2022 14:13, Michal Orzel wrote:
>> On 30.03.2022 13:57, Jan Beulich wrote:
>>> On 30.03.2022 13:04, Michal Orzel wrote:
>>>> On 30.03.2022 12:42, Jan Beulich wrote:
>>>>> On 30.03.2022 12:32, Julien Grall wrote:
>>>>>> Renaming to PE_COFF may help to avoid the confusion with CONFIG_EFI. 
>>>>>> That said, it would possibly make more difficult to associate the flag 
>>>>>> with "linking an EFI binary".
>>>>>
>>>>> Indeed. And EFI_PE_COFF is getting a little unwieldy for my taste.
>>>>>
>>>>>> I think some documentaion about the define EFI would be help so there 
>>>>>> are no more confusion between CONFIG_EFI/EFI. But I am not sure where to 
>>>>>> put it. Maybe at the top of the header?
>>>>>
>>>>> That's perhaps the best place, yes.
>>>>>
>>>> In this case how about the following comment at the top of xen.lds.h:
>>>>
>>>> "To avoid any confusion about EFI macro used in this header vs EFI support,
>>>> the former is used when linking a native EFI (i.e. PE/COFF) binary, whereas
>>>> the latter means support for generating EFI binary.
>>>
>>> No, that's the case on Arm only. As Julien suggested, it is perhaps best
>>> to explain the difference between EFI and CONFIG_EFI, without going into
>>> arch specifics.
>> Could you please tell me what you are reffering to as there is no such identifier
>> in Xen (as opposed to Linux) like CONFIG_EFI ?
> 
> Let's call it a "virtual" CONFIG_EFI then; I think we really should have
> such an option. But yes, if you don't like referring to such a virtual
> option, then describing what is meant verbally is certainly going to be
> fine.
> 
FWICS, there was an attempt done by Wei in his NUMA series to define CONFIG_EFI.
However as this is not yet merged and agreed, I would like not to refer to identifiers
not existing in the code, even though most people are familiar with this option from Linux.

So by taking an example from Linux I would verbally explain it like that:
"To avoid any confusion, please note that EFI macro does not correspond to EFI
runtime support and is used when linking a native EFI (i.e. PE/COFF) binary, hence its
usage in this header."

If that does not suite you, please help creating a better explanation.

> Jan
> 

Michal

