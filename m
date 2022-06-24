Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE13559702
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 11:50:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355406.583051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fx1-000665-2D; Fri, 24 Jun 2022 09:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355406.583051; Fri, 24 Jun 2022 09:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fx0-00064F-Tq; Fri, 24 Jun 2022 09:50:06 +0000
Received: by outflank-mailman (input) for mailman id 355406;
 Fri, 24 Jun 2022 09:50:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4fwy-0005om-VR
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 09:50:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4fwu-0002iw-Rn; Fri, 24 Jun 2022 09:50:00 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4fwu-0007Q4-Ja; Fri, 24 Jun 2022 09:50:00 +0000
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
	bh=Pvl+/kS0qKcoT9BUgIyK9M/J7GVAo0VYKWZrIVAjL5E=; b=0IVfsU4a+Z+zah6yzOSS4HSYBS
	kYYPZrYKw2+8JQbJmkCeimWBbldX5zqXAvGtb53LLRnuSr/O/6e778rLlkBMDhO8LGkKpGaNFwq6a
	Uio5nOJOenwdRWo5p1jQ+RGDM69iEqZxJVE1MllRWciiy8wOiGC6Nvhe6Mrnc9dxBWqM=;
Message-ID: <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
Date: Fri, 24 Jun 2022 10:49:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
 <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 24/06/2022 10:33, Jan Beulich wrote:
> On 24.06.2022 10:35, Julien Grall wrote:
>> On 24/06/2022 08:18, Wei Chen wrote:
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 2022年6月23日 20:54
>>>> To: Wei Chen <Wei.Chen@arm.com>
>>>> Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien
>>>> Grall <julien@xen.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>>>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>>>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>; Wei
>>>> Liu <wl@xen.org>; Jiamei Xie <Jiamei.Xie@arm.com>; xen-
>>>> devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
>>>>
>>>> On 10.06.2022 07:53, Wei Chen wrote:
>>>>> --- a/xen/arch/arm/Makefile
>>>>> +++ b/xen/arch/arm/Makefile
>>>>> @@ -1,6 +1,5 @@
>>>>>    obj-$(CONFIG_ARM_32) += arm32/
>>>>>    obj-$(CONFIG_ARM_64) += arm64/
>>>>> -obj-$(CONFIG_ARM_64) += efi/
>>>>>    obj-$(CONFIG_ACPI) += acpi/
>>>>>    obj-$(CONFIG_HAS_PCI) += pci/
>>>>>    ifneq ($(CONFIG_NO_PLAT),y)
>>>>> @@ -20,6 +19,7 @@ obj-y += domain.o
>>>>>    obj-y += domain_build.init.o
>>>>>    obj-y += domctl.o
>>>>>    obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>>>>> +obj-y += efi/
>>>>>    obj-y += gic.o
>>>>>    obj-y += gic-v2.o
>>>>>    obj-$(CONFIG_GICV3) += gic-v3.o
>>>>> --- a/xen/arch/arm/efi/Makefile
>>>>> +++ b/xen/arch/arm/efi/Makefile
>>>>> @@ -1,4 +1,12 @@
>>>>>    include $(srctree)/common/efi/efi-common.mk
>>>>>
>>>>> +ifeq ($(CONFIG_ARM_EFI),y)
>>>>>    obj-y += $(EFIOBJ-y)
>>>>>    obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
>>>>> +else
>>>>> +# Add stub.o to EFIOBJ-y to re-use the clean-files in
>>>>> +# efi-common.mk. Otherwise the link of stub.c in arm/efi
>>>>> +# will not be cleaned in "make clean".
>>>>> +EFIOBJ-y += stub.o
>>>>> +obj-y += stub.o
>>>>> +endif
>>>>
>>>> This has caused
>>>>
>>>> ld: warning: arch/arm/efi/built_in.o uses 2-byte wchar_t yet the output is
>>>> to use 4-byte wchar_t; use of wchar_t values across objects may fail
>>>>
>>>> for the 32-bit Arm build that I keep doing every once in a while, with
>>>> (if it matters) GNU ld 2.38. I guess you will want to consider building
>>>> all of Xen with -fshort-wchar, or to avoid building stub.c with that
>>>> option.
>>>>
>>>
>>> Thanks for pointing this out. I will try to use -fshort-wchar for Arm32,
>>> if Arm maintainers agree.
>>
>> Looking at the code we don't seem to build Xen arm64 with -fshort-wchar
>> (aside the EFI files). So it is not entirely clear why we would want to
>> use -fshort-wchar for arm32.
> 
> We don't use wchar_t outside of EFI code afaict. Hence to all other code
> it should be benign whether -fshort-wchar is in use. So the suggestion
> to use the flag unilaterally on Arm32 is really just to silence the ld
> warning;

Ok. This is odd. Why would ld warn on arm32 but not other arch? Wei, do 
you think you can have a look?

> off the top of my head I can't see anything wrong with using
> the option also for Arm64 or even globally. Yet otoh we typically try to
> not make changes for environments where they aren't really needed.

I agree. If we need a workaround, then my preference would be to not 
build stub.c with -fshort-wchar.

Cheers,

-- 
Julien Grall

