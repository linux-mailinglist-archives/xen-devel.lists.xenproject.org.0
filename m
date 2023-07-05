Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A831D74844A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 14:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559163.873888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH1jJ-0001xw-K7; Wed, 05 Jul 2023 12:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559163.873888; Wed, 05 Jul 2023 12:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH1jJ-0001ve-GZ; Wed, 05 Jul 2023 12:35:33 +0000
Received: by outflank-mailman (input) for mailman id 559163;
 Wed, 05 Jul 2023 12:35:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qH1jH-0001vY-TD
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 12:35:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH1jC-0007YB-Qa; Wed, 05 Jul 2023 12:35:26 +0000
Received: from [15.248.3.5] (helo=[10.24.67.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qH1jC-0005rs-K7; Wed, 05 Jul 2023 12:35:26 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=ECMCk4HBvCjz7KbnoHhTgYsniKL+TN4oFsCzhk3SwP8=; b=uxZcRTtVJVBXEL3kTyt9avOAUC
	8fS+22ENhCyPUyXVbnIK0P7vca9tG/tbjdPQ0uQ/nYdeJTOFUxh4qfB4X1RZbCSGAhDjqeFRv/SL7
	jjd943Co88KlGam/rL9+GrVB8JPul+HHOM5XcEoo/g0K0Pqm80Ya2pB+6s2OhLznmquw=;
Message-ID: <f14104cd-8be0-925d-3ab4-8b5f922024f0@xen.org>
Date: Wed, 5 Jul 2023 13:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/arm: Kconfig: ACPI should depend on UEFI
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Luca.Fancellu@arm.com, michal.orzel@amd.com, Henry.Wang@arm.com,
 andrew.cooper3@citrix.com, Penny.Zheng@arm.com, wei.chen@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230705115534.26004-1-julien@xen.org>
 <2761ae84-113d-c230-ad50-e9cfb0ae434b@suse.com>
 <822b68a0-7832-9213-d340-a3787e790a3f@xen.org>
In-Reply-To: <822b68a0-7832-9213-d340-a3787e790a3f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/07/2023 13:30, Julien Grall wrote:
> Hi Jan,
> 
> On 05/07/2023 13:04, Jan Beulich wrote:
>> On 05.07.2023 13:55, Julien Grall wrote:
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -63,11 +63,11 @@ source "arch/Kconfig"
>>>   config ACPI
>>>       bool "ACPI (Advanced Configuration and Power Interface) Support 
>>> (UNSUPPORTED)" if UNSUPPORTED
>>> -    depends on ARM_64
>>> +    depends on ARM_64 && ARM_EFI
>>
>> Wouldn't it make sense to drop the ARM_64 dependency then? It's now
>> redundant, and it seems quite likely that if EFI was ever support
>> for 32-bit, ACPI could then be supported there as well.
> 
> I think so. I am not planning to resend a new version for that. So I 
> will do it on commit and mention it in the commit message.

Actually no. It would be easier to add UEFI on Arm32 compare to adding 
ACPI. So it would be best to keep ARM_64 here at least for the time been.

Cheers,

-- 
Julien Grall

