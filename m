Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F00E575C704
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 14:45:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567522.886681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMpUm-0000ps-Rl; Fri, 21 Jul 2023 12:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567522.886681; Fri, 21 Jul 2023 12:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMpUm-0000md-Oo; Fri, 21 Jul 2023 12:44:32 +0000
Received: by outflank-mailman (input) for mailman id 567522;
 Fri, 21 Jul 2023 12:44:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMpUl-0000mX-09
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 12:44:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMpUk-0004zl-IJ; Fri, 21 Jul 2023 12:44:30 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.21.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMpUk-0006jw-6K; Fri, 21 Jul 2023 12:44:30 +0000
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
	bh=vezG7P86YW8rpMLEBrIHMikzp9nyfrYQMYYaAdWSAnc=; b=6eiwZbd+x0Jts70XwCwxadccwp
	lmeHTdsKL1hQT67HPXU4D4El8HIg3VY5280WgzH2YfuNkdLu9SghJ13eWHXd1M91hf78vqpSrRTu1
	zTSIWYD+W1uW+RMl9d034FKhtiQbD9Y6o61Po6QstFdaDBV/aKsBRncV8H1pwxf7rkvY=;
Message-ID: <bf07cb42-eace-333f-4421-c0cfe0087d9a@xen.org>
Date: Fri, 21 Jul 2023 13:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2] xen/arm: Move TEE mediators in a kconfig submenu
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <c55ce2891172a696e8a29f8c9bcc9dd33ebe9e50.1689931326.git.bertrand.marquis@arm.com>
 <e6d72d9a-a146-733c-0a9b-016fb291c2ea@xen.org>
 <B5883910-D35A-404B-8EBA-8AAB6C093342@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <B5883910-D35A-404B-8EBA-8AAB6C093342@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/07/2023 13:28, Bertrand Marquis wrote:
>> On 21 Jul 2023, at 12:00, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Bertrand,
>>
>> On 21/07/2023 10:23, Bertrand Marquis wrote:
>>> Rework TEE mediators to put them under a submenu in Kconfig.
>>> The submenu is only visible if UNSUPPORTED is activated as all currently
>>> existing mediators are UNSUPPORTED.
>>> While there rework a bit the configuration so that OP-TEE and FF-A
>>> mediators are selecting the generic TEE interface instead of depending
>>> on it.
>>> Make the TEE option hidden as it is of no interest for anyone to select
>>> it without one of the mediators so having them select it instead should
>>> be enough.
>>> Rework makefile inclusion and selection so that generic TEE is included
>>> only when selected and include the tee Makefile all the time making the
>>> directory tee self contained.
>>
>> Is this a left over?
> 
> Oups yes, please remove.
> 
>>
>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>> ---
>>> Changes in v2:
>>> - only included tee subdirectory in makefile if CONFIG_TEE is selected
>>>    (reverts to state before patch)
>>> - remove help in hidden TEE config
>>> - rebase on top of staging
>>> ---
>>>   xen/arch/arm/Kconfig      |  7 -------
>>>   xen/arch/arm/tee/Kconfig  | 17 ++++++++++++++---
>>>   xen/arch/arm/tee/Makefile |  2 +-
>>>   3 files changed, 15 insertions(+), 11 deletions(-)
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 439cc94f3344..fd57a82dd284 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -175,13 +175,6 @@ config ARM64_BTI
>>>      Branch Target Identification support.
>>>      This feature is not supported in Xen.
>>>   -config TEE
>>> - bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
>>> - default n
>>> - help
>>> -   This option enables generic TEE mediators support. It allows guests
>>> -   to access real TEE via one of TEE mediators implemented in XEN.
>>> -
>>>   source "arch/arm/tee/Kconfig"
>>>     config STATIC_SHM
>>> diff --git a/xen/arch/arm/tee/Kconfig b/xen/arch/arm/tee/Kconfig
>>> index db3ea78faaaa..c5b0f88d7522 100644
>>> --- a/xen/arch/arm/tee/Kconfig
>>> +++ b/xen/arch/arm/tee/Kconfig
>>> @@ -1,7 +1,14 @@
>>> +menu "TEE mediators"
>>> + visible if UNSUPPORTED
>>> +
>>> +config TEE
>>> + bool
>>> + default n
>>> +
>>>   config OPTEE
>>> - bool "Enable OP-TEE mediator"
>>> + bool "Enable OP-TEE mediator (UNSUPPORTED)" if UNSUPPORTED
>>>    default n
>>> - depends on TEE
>>> + select TEE
>>>    help
>>>      Enable the OP-TEE mediator. It allows guests to access
>>>      OP-TEE running on your platform. This requires
>>> @@ -12,10 +19,14 @@ config OPTEE
>>>   config FFA
>>>    bool "Enable FF-A mediator support (UNSUPPORTED)" if UNSUPPORTED
>>>    default n
>>> - depends on ARM_64 && TEE
>>> + depends on ARM_64
>>> + select TEE
>>>    help
>>>      This option enables a minimal FF-A mediator. The mediator is
>>>      generic as it follows the FF-A specification [1], but it only
>>>      implements a small subset of the specification.
>>>        [1] https://developer.arm.com/documentation/den0077/latest
>>> +
>>> +endmenu
>>> +
>>> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
>>> index 58a1015e40e0..1ef49a271fdb 100644
>>> --- a/xen/arch/arm/tee/Makefile
>>> +++ b/xen/arch/arm/tee/Makefile
>>> @@ -1,3 +1,3 @@
>>>   obj-$(CONFIG_FFA) += ffa.o
>>> -obj-y += tee.o
>>> +obj-$(CONFIG_TEE) += tee.o
>>>   obj-$(CONFIG_OPTEE) += optee.o
>>
>> Same here? The rest LGTM and I would be happy to do the changes on commit.
> 
> This one is not, I think it is more logic to keep that one like this so that if someone
> creates a TEE not depending on this it could still put it here without compiling tee.o
> for no reason.
This seems pretty unlikely to me because the purpose of TEE is to 
provide a generic interface to the common code. At least, the developer 
would need to have a very good reason to diverge.

Also, right now, make will not recurse to the directory tee if 
CONFIG_TEE=n. So I would rather not have this change.

Cheers,

-- 
Julien Grall

