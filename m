Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BA78A8A24
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 19:24:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707679.1105798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx919-0001nM-M5; Wed, 17 Apr 2024 17:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707679.1105798; Wed, 17 Apr 2024 17:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx919-0001kQ-Ip; Wed, 17 Apr 2024 17:24:19 +0000
Received: by outflank-mailman (input) for mailman id 707679;
 Wed, 17 Apr 2024 17:24:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rx918-0001kK-7K
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 17:24:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rx917-0002XI-Eo; Wed, 17 Apr 2024 17:24:17 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rx917-0002Lb-4x; Wed, 17 Apr 2024 17:24:17 +0000
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
	bh=ubac+JqnKpCA6cxKbn54vsk+6zrhE9xgXWx1wSfx6m8=; b=ulMc7f6RM8Obr9RMzAo6LJGkZB
	ikYY/N5lT9e9dQs+K0R3HLDHuqpP7V/mFF58wOXtusOJdoMgIC5f8J+ZDj4pLIhx+Yu/rnDsGHgr+
	wl/MIN5h6HoN6wFLQ/A1sSwflnb7G5/VtKjPlAHmc3B2sjCUyMypGkBwI3OjpE4VQTTk=;
Message-ID: <38b06b07-179d-4483-b79b-aea8c68f3c34@xen.org>
Date: Wed, 17 Apr 2024 18:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] xen/common: Move Arm's bootfdt.c to common
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <908ea2d9bccf0b3455119cfd9af0597aee005fe8.1710443965.git.sanastasio@raptorengineering.com>
 <6069d3de-b298-46e6-a64b-895df3ea037b@xen.org>
 <c7de32e6-67d5-4bb8-9cc8-68753c657fc7@raptorengineering.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c7de32e6-67d5-4bb8-9cc8-68753c657fc7@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Shawn,

On 12/04/2024 03:53, Shawn Anastasio wrote:
> Hi Julien,
> 
> On 3/21/24 12:50 PM, Julien Grall wrote:
>> Hi Shawn,
>>
>> On 14/03/2024 22:15, Shawn Anastasio wrote:
>>> Move Arm's bootfdt.c to xen/common so that it can be used by other
>>> device tree architectures like PPC and RISCV.
>>>
>>> Suggested-by: Julien Grall <julien@xen.org>
>>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>> Acked-by: Julien Grall <julien@xen.org>
>>> ---
>>> Changes in v2:
>>>     - Drop #if defined(CONFIG_ARM_EFI) now that efi_enabled is stubbed
>>>
>>>    MAINTAINERS                                    | 1 +
>>>    xen/arch/arm/Makefile                          | 1 -
>>>    xen/common/device-tree/Makefile                | 1 +
>>>    xen/{arch/arm => common/device-tree}/bootfdt.c | 0
>>>    4 files changed, 2 insertions(+), 1 deletion(-)
>>>    rename xen/{arch/arm => common/device-tree}/bootfdt.c (100%)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index e85fbe6737..20fdec9ffa 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -251,6 +251,7 @@ S:    Supported
>>>    L:    xen-devel@lists.xenproject.org
>>>    F:    docs/misc/arm/
>>>    F:    xen/arch/arm/
>>> +F:    xen/common/device-tree/bootfdt.c
>>>    F:    xen/drivers/char/arm-uart.c
>>>    F:    xen/drivers/char/cadence-uart.c
>>>    F:    xen/drivers/char/exynos4210-uart.c
>>> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
>>> index 7b1350e2ef..9e1548378c 100644
>>> --- a/xen/arch/arm/Makefile
>>> +++ b/xen/arch/arm/Makefile
>>> @@ -10,7 +10,6 @@ obj-$(CONFIG_TEE) += tee/
>>>    obj-$(CONFIG_HAS_VPCI) += vpci.o
>>>
>>>    obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>>> -obj-y += bootfdt.init.o
>>>    obj-y += cpuerrata.o
>>>    obj-y += cpufeature.o
>>>    obj-y += decode.o
>>> diff --git a/xen/common/device-tree/Makefile
>>> b/xen/common/device-tree/Makefile
>>> index c97b2bd88c..fa5beafd65 100644
>>> --- a/xen/common/device-tree/Makefile
>>> +++ b/xen/common/device-tree/Makefile
>>> @@ -1 +1,2 @@
>>> +obj-y += bootfdt.init.o
>>>    obj-y += bootinfo.o
>>
>> Looking at the names, it is not entirely clear what would be the
>> differences between bootfdt and bootinfo. Should they just be one file?
>>
> 
> With the current split I've chosen, all functions pertaining to managing
> the `struct bootinfo` data structure are contained within bootinfo.c and
> all functions responsible for parsing the FDT on boot are in bootfdt.c.
> 
> This separation exists currently in the ARM tree, but the bootinfo
> functions are contained in setup.c rather than a separate self-contained
> bootinfo.c.
> 
> If you feel strongly that we would be better off with everything in a
> single file, I'm not necessarily opposed to that, but I do think that
> this split at least makes sense.

I am fine with the split. It wasn't originally clear how this was done 
because the first comment in bootinfo contains:

  Early device tree parsing and bookkeeping routines.

But from what you wrote, it seems this is only meant to cover the latter 
part. Did I understand it correctly?

Cheers,

-- 
Julien Grall

