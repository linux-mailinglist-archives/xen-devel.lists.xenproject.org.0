Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3A49630FD
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 21:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785111.1194528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjOO5-0004nf-JK; Wed, 28 Aug 2024 19:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785111.1194528; Wed, 28 Aug 2024 19:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjOO5-0004lm-GN; Wed, 28 Aug 2024 19:31:25 +0000
Received: by outflank-mailman (input) for mailman id 785111;
 Wed, 28 Aug 2024 19:31:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sjOO4-0004lQ-0j
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 19:31:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sjOO3-00087f-6I; Wed, 28 Aug 2024 19:31:23 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sjOO2-00071C-W4; Wed, 28 Aug 2024 19:31:23 +0000
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
	bh=/9+MS3G688e03JfjXnCw9lx8NmTaRiUe6N6O88VYb5w=; b=BEHOGf+JBaC9oeYQh3NX+DgMsk
	Lp12BvpP4h+UMu6Vg1SEIGJaCxVX28BJBmNmpjJ4BF3SBgLfaibyI+oUkIcP6cAOLo6fRKrjKm9P/
	KpsX7q1VMLBSVS9VKgQCRx25LGIc1QFZZtSeuqwW1f3zDkcUaGIQfG9lsWwtdWt0LunA=;
Message-ID: <ae2148dc-cbc4-4f71-abc7-ab1f928e453b@xen.org>
Date: Wed, 28 Aug 2024 20:31:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/arm: mpu: Introduce choice between MMU and MPU
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-2-ayan.kumar.halder@amd.com>
 <fca5e0dd-5f71-4286-909b-db14551aa15a@xen.org>
 <afada706-86b5-4093-8574-bfdc06aed639@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <afada706-86b5-4093-8574-bfdc06aed639@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 28/08/2024 15:44, Ayan Kumar Halder wrote:
> 
> On 27/08/2024 11:37, Julien Grall wrote:
>> Hi,
> Hi Julien,
>>
>> On 23/08/2024 17:31, Ayan Kumar Halder wrote:
>>> There are features in the forthcoming patches which are dependent on
>>> MPU. For eg fixed start address.
>>> Also, some of the Xen features (eg STATIC_MEMORY) will be selected
>>> by the MPU configuration.
>>>
>>> Thus, this patch introduces a choice between MMU and MPU for the type
>>> of memory management system. By default, MMU is selected.
>>> All the current platforms are now made dependent on MMU.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>   xen/arch/arm/Kconfig           | 17 ++++++++++++++++-
>>>   xen/arch/arm/platforms/Kconfig |  2 +-
>>>   2 files changed, 17 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 323c967361..686948cefd 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -58,10 +58,25 @@ config PADDR_BITS
>>>       default 40 if ARM_PA_BITS_40
>>>       default 48 if ARM_64
>>>   +choice
>>> +    prompt "Memory management system"
>>> +    default MMU if ARM
>>> +    help
>>> +      User can choose between the different forms of memory 
>>> management system.
>>> +      Most of the Arm based systems support MMU.
>>
>> I feel this is quite subjective. So I would drop it.
> Agreed.
>>
>>> +
>>>   config MMU
>>> -    def_bool y
>>> +    bool "MMU"
>>>       select HAS_PMAP
>>>       select HAS_VMAP
>>> +    help
>>> +      Memory management unit is supported on most Arm based systems.
>>
>> For this case, I would write "Select it you are plan to run Xen on 
>> Armv7-A or Armv8-A".
> Ack.

Actually, thinking a bit more. We should be able to run Xen on Armv9. So 
maybe it would be beter to write:

"Select it if you plan to run Xen on A-profile Armv7+".

Cheers,

-- 
Julien Grall


