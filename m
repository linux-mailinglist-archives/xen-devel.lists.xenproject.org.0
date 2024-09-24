Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB99849CC
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 18:38:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803167.1213621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8YY-0005BN-PX; Tue, 24 Sep 2024 16:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803167.1213621; Tue, 24 Sep 2024 16:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st8YY-00059a-Mw; Tue, 24 Sep 2024 16:38:30 +0000
Received: by outflank-mailman (input) for mailman id 803167;
 Tue, 24 Sep 2024 16:38:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1st8YX-00059U-DK
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 16:38:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st8YX-00049T-4Q; Tue, 24 Sep 2024 16:38:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1st8YW-0007xm-UY; Tue, 24 Sep 2024 16:38:29 +0000
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
	bh=kBpLhioj9VouAcrqToKCNHE6zvUHNgT+PPO+XqEfGVE=; b=zP8Xm27CTM34+YGVQkpZBeWz4e
	LGOcTACzf3f7OXrxKO7uPjGQnXKuATsV6nzLGjPh4wJVfabuuqpdGhUAId974EqP17+t9w/pDGBM8
	Sdd+YIZBvY/1ZYqVWjLi3leN2cPM0c0l6HSJYIo9Ky65MEb7ZWJSjKrv0CaRbgSxOj+0=;
Message-ID: <3fc266d5-fdec-4e1c-9805-87acf5a4d920@xen.org>
Date: Tue, 24 Sep 2024 17:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: mpu: Introduce choice between MMU and MPU
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-2-ayan.kumar.halder@amd.com>
 <e32674d8-4c3c-4eda-9300-35130e048a05@xen.org>
 <8bdaf581-800f-4d00-b11f-ce051ba18f09@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8bdaf581-800f-4d00-b11f-ce051ba18f09@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/09/2024 10:18, Ayan Kumar Halder wrote:
> 
> On 19/09/2024 13:33, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 18/09/2024 19:50, Ayan Kumar Halder wrote:
>>> There are features in the forthcoming patches which are dependent on
>>> MPU. For eg fixed start address.
>>> Also, some of the Xen features (eg STATIC_MEMORY) will be selected
>>> by the MPU configuration.
>>>
>>> Thus, this patch introduces a choice between MMU and MPU for the type
>>> of memory management system. By default, MMU is selected.
>>> MPU is now gated by UNSUPPORTED.
>>>
>>> Updated SUPPORT.md to state that the support for MPU is experimental.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from :-
>>>
>>> v1 - 1. Reworded the help messages.
>>> 2. Updated Support.md.
>>>
>>>   SUPPORT.md                     |  1 +
>>>   xen/arch/arm/Kconfig           | 16 +++++++++++++++-
>>>   xen/arch/arm/platforms/Kconfig |  2 +-
>>>   3 files changed, 17 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/SUPPORT.md b/SUPPORT.md
>>> index 23dd7e6424..3f6d788a43 100644
>>> --- a/SUPPORT.md
>>> +++ b/SUPPORT.md
>>> @@ -40,6 +40,7 @@ supported in this document.
>>>         Status, Xen in AArch64 mode: Supported
>>>       Status, Xen in AArch32 mode: Tech Preview
>>> +    Status, Xen with MPU: Experimental
>>>       Status, Cortex A57 r0p0-r1p1: Supported, not security supported
>>>       Status, Cortex A77 r0p0-r1p0: Supported, not security supported
>>>   diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 323c967361..e881f5ba57 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -58,10 +58,24 @@ config PADDR_BITS
>>>       default 40 if ARM_PA_BITS_40
>>>       default 48 if ARM_64
>>>   +choice
>>> +    prompt "Memory management system"
>>> +    default MMU if ARM
>>> +    help
>>> +      User can choose between the different forms of memory 
>>> management system.
>>> +
>>>   config MMU
>>> -    def_bool y
>>> +    bool "MMU"
>>>       select HAS_PMAP
>>>       select HAS_VMAP
>>> +    help
>>> +      Select it if you plan to run Xen on A-profile Armv7+
>>> +
>>> +config MPU
>>> +    bool "MPU" if UNSUPPORTED
>>> +    help
>>> +      Memory protection unit is supported on some Armv8-R systems 
>>> (UNSUPPORTED).
>>
>> I am a bit confused with this statement. Does this mean that not all 
>> Armv8-R supports MPU? Or are you trying to say that not all of them 
>> support EL2?
> 
> My bad. All Armv8-R system supports MPU at EL2 (as Bertrand correctly 
> pointed out). Some of them (eg R82) supports both MMU and MPU at EL1. 
> While others (eg R52) supports only MPU at EL1.
> 
> I should rewrite it as
> 
> "Memory protection unit is supported on Armv8-R systems (UNSUPPORTED)."

I think it would be more consistent with CONFIG_MMU if you write the 
following:

"Memory Protection Unit (MPU). Select if you plan to run Xen on ARMv8-R 
systems supporting EL2. (UNSUPPORTED)"

Cheers,

-- 
Julien Grall


