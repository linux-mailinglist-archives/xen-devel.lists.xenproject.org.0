Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143124EC5AE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 15:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296337.504390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYPJ-0006Cn-AQ; Wed, 30 Mar 2022 13:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296337.504390; Wed, 30 Mar 2022 13:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYPJ-0006BF-76; Wed, 30 Mar 2022 13:30:41 +0000
Received: by outflank-mailman (input) for mailman id 296337;
 Wed, 30 Mar 2022 13:30:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nZYPI-0006AW-DB
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 13:30:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nZYPD-00038f-EB; Wed, 30 Mar 2022 13:30:35 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.5.112]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nZYPD-0005HN-7d; Wed, 30 Mar 2022 13:30:35 +0000
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
	bh=YzzXIYUrlqvAYdARZ2yGFgCpslIYy+nvIUoxnZFKcB8=; b=TfWQSBLAqU8m3XXTzzQITyqWAU
	qa8wsw/SDqllq+2CCvC+Le/9Ku2tGvEZwRzujmykbDwFyMduMa1/VsWHEqcXUNFSZYqQ6xWim9iH6
	/i/d+iCpBdAd1z1XgTCOHJRB7kHQTdVpixqVp5INctUDGL1Cx9otWH4b3sKHy0cQyLG8=;
Message-ID: <cfb19224-6b83-6fca-37de-703152e38af6@xen.org>
Date: Wed, 30 Mar 2022 14:30:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
To: Michal Orzel <michal.orzel@arm.com>, Jan Beulich <jbeulich@suse.com>
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
 <ffa0e581-6a32-5c3c-7e63-acd5086c6822@arm.com>
 <e3a045d5-34d3-af73-89a7-7c306e7f8de4@suse.com>
 <168143f7-11e3-1acb-2de1-dba1a0db4ad3@arm.com>
 <55252ad6-021b-b96d-ae91-4ebbe4046dbb@suse.com>
 <d521854c-9aab-020d-75d6-ca085afa642a@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d521854c-9aab-020d-75d6-ca085afa642a@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/03/2022 14:24, Michal Orzel wrote:
> 
> 
> On 30.03.2022 14:53, Jan Beulich wrote:
>> On 30.03.2022 14:13, Michal Orzel wrote:
>>> On 30.03.2022 13:57, Jan Beulich wrote:
>>>> On 30.03.2022 13:04, Michal Orzel wrote:
>>>>> On 30.03.2022 12:42, Jan Beulich wrote:
>>>>>> On 30.03.2022 12:32, Julien Grall wrote:
>>>>>>> Renaming to PE_COFF may help to avoid the confusion with CONFIG_EFI.
>>>>>>> That said, it would possibly make more difficult to associate the flag
>>>>>>> with "linking an EFI binary".
>>>>>>
>>>>>> Indeed. And EFI_PE_COFF is getting a little unwieldy for my taste.
>>>>>>
>>>>>>> I think some documentaion about the define EFI would be help so there
>>>>>>> are no more confusion between CONFIG_EFI/EFI. But I am not sure where to
>>>>>>> put it. Maybe at the top of the header?
>>>>>>
>>>>>> That's perhaps the best place, yes.
>>>>>>
>>>>> In this case how about the following comment at the top of xen.lds.h:
>>>>>
>>>>> "To avoid any confusion about EFI macro used in this header vs EFI support,
>>>>> the former is used when linking a native EFI (i.e. PE/COFF) binary, whereas
>>>>> the latter means support for generating EFI binary.
>>>>
>>>> No, that's the case on Arm only. As Julien suggested, it is perhaps best
>>>> to explain the difference between EFI and CONFIG_EFI, without going into
>>>> arch specifics.
>>> Could you please tell me what you are reffering to as there is no such identifier
>>> in Xen (as opposed to Linux) like CONFIG_EFI ?
>>
>> Let's call it a "virtual" CONFIG_EFI then; I think we really should have
>> such an option. But yes, if you don't like referring to such a virtual
>> option, then describing what is meant verbally is certainly going to be
>> fine.
>>
> FWICS, there was an attempt done by Wei in his NUMA series to define CONFIG_EFI.
> However as this is not yet merged and agreed, I would like not to refer to identifiers
> not existing in the code, even though most people are familiar with this option from Linux.
> 
> So by taking an example from Linux I would verbally explain it like that:
> "To avoid any confusion, please note that EFI macro does not correspond to EFI
> runtime support and is used when linking a native EFI (i.e. PE/COFF) binary, hence its

"EFI runtime support" can be mistakenly associated to EFI runtime 
services (which BTW not supported on Arm). So I would suggest to 
s/runtime/boot/.

Cheers,

-- 
Julien Grall

