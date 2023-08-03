Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFD776E1B3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 09:37:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576040.901747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRSsM-0004je-SA; Thu, 03 Aug 2023 07:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576040.901747; Thu, 03 Aug 2023 07:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRSsM-0004hz-PS; Thu, 03 Aug 2023 07:36:02 +0000
Received: by outflank-mailman (input) for mailman id 576040;
 Thu, 03 Aug 2023 07:36:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qRSsK-0004ht-V2
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 07:36:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRSsK-0006lm-Hj; Thu, 03 Aug 2023 07:36:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qRSsK-00082q-7R; Thu, 03 Aug 2023 07:36:00 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=BeG+6oeCw7mY+IH05PJsyCj/NoFiq6CRV82Xc/vjVKY=; b=ae0/0cXRoWXFOgec+Fy6QDs6W2
	XaAyIEXxCuZmjed0tseiTrpHaqvWDPBG8PO+730Wx/iJPvppkB68Ao35YutNn9AL9efwGQoBQCpOD
	M9VfGQQa4FZAQFFI7izRfqydZTgC6UGN50cqGE2E2BmtNhf3rRh4JgYwMnZuH2mrK8q0=;
Message-ID: <8516a6bb-8321-fc84-c7ce-10a7b41ecb59@xen.org>
Date: Thu, 3 Aug 2023 08:35:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230802135350.745251-1-luca.fancellu@arm.com>
 <17bc595a-dc30-9e76-4d31-aad62f9c9672@amd.com>
 <3ED442CB-0569-4C9C-9770-39D2FE4852A0@arm.com>
 <8c8f2564-935b-e3c8-ad15-348135140a53@amd.com>
 <92AE30B2-B2CE-465F-A6FC-A86961BED85A@arm.com>
 <9d40bd81-dc3a-0288-8f8a-1de62dc30d1d@xen.org>
 <1a364aa9-4549-80b9-4319-d91551f228bd@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
In-Reply-To: <1a364aa9-4549-80b9-4319-d91551f228bd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/08/2023 08:15, Michal Orzel wrote:
> On 02/08/2023 19:39, Julien Grall wrote:
>>
>>
>> Hi Luca,
>>
>> On 02/08/2023 16:05, Luca Fancellu wrote:
>>>> On 2 Aug 2023, at 15:48, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 02/08/2023 16:42, Luca Fancellu wrote:
>>>>>
>>>>>
>>>>>> On 2 Aug 2023, at 15:26, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>
>>>>>> Hi Luca,
>>>>>>
>>>>>> On 02/08/2023 15:53, Luca Fancellu wrote:
>>>>>>>
>>>>>>>
>>>>>>> Introduce Kconfig GICV2 to be able to compile the GICv2 driver only
>>>>>>> when needed, the option is active by default.
>>>>>>>
>>>>>>> Introduce Kconfig VGICV2 that depends on GICV2 or GICV3 and compiles
>>>>>>> the GICv2 emulation for guests, it is required only when using GICV2
>>>>>>> driver, otherwise using GICV3 it is optional and can be deselected
>>>>>>> if the user doesn't want to offer the vGICv2 interface to guests or
>>>>>>> maybe its GICv3 hardware can't offer the GICv2 compatible mode.
>>>>>>>
>>>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>>>>> ---
>>>>>>> xen/arch/arm/Kconfig        | 13 +++++++++++++
>>>>>>> xen/arch/arm/Makefile       |  4 ++--
>>>>>>> xen/arch/arm/domain_build.c |  4 ++++
>>>>>>> xen/arch/arm/gic-v3.c       |  4 ++++
>>>>>>> xen/arch/arm/vgic.c         |  2 ++
>>>>>>> 5 files changed, 25 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>>>>>> index fd57a82dd284..dc702f08ace7 100644
>>>>>>> --- a/xen/arch/arm/Kconfig
>>>>>>> +++ b/xen/arch/arm/Kconfig
>>>>>>> @@ -78,6 +78,14 @@ config ARM_EFI
>>>>>>>           UEFI firmware. A UEFI stub is provided to allow Xen to
>>>>>>>           be booted as an EFI application.
>>>>>>>
>>>>>>> +config GICV2
>>>>>> So, now it would be possible to deselect both GIC drivers and Xen would not complain when building.
>>>>>> This means that Xen would fail on boot without any message as it happens before serial driver initialization.
>>>>>> Since having GIC driver built in is a must-have I think we need to make sure that at least one is enabled.
>>>>>
>>>>> Hi Michal,
>>>>>
>>>>> I tried and I had:
>>>>>
>>>>> Starting kernel ...
>>>>>
>>>>> - UART enabled -
>>>>> - Boot CPU booting -
>>>>> - Current EL 0000000000000008 -
>>>>> - Initialize CPU -
>>>>> - Turning on paging -
>>>>> - Zero BSS -
>>>>> - Ready -
>>>>> (XEN) Checking for initrd in /chosen
>>>>> (XEN) RAM: 0000000080000000 - 00000000feffffff
>>>>> (XEN) RAM: 0000000880000000 - 00000008ffffffff
>>>>> (XEN)
>>>>> (XEN) MODULE[0]: 0000000084000000 - 000000008415d000 Xen
>>>>> (XEN) MODULE[1]: 00000000fd6c5000 - 00000000fd6c8000 Device Tree
>>>>> (XEN) MODULE[2]: 0000000080080000 - 00000000814f1a00 Kernel
>>>>> (XEN)  RESVD[0]: 0000000080000000 - 0000000080010000
>>>>> (XEN)  RESVD[1]: 0000000018000000 - 00000000187fffff
>>>>> (XEN)
>>>>> (XEN)
>>>>> (XEN) Command line: noreboot dom0_mem=1024M console=dtuart dtuart=serial0 bootscrub=0
>>>>> (XEN) PFN compression on bits 20...22
>>>>> (XEN) Domain heap initialised
>>>>> (XEN) Booting using Device Tree
>>>>> (XEN) Platform: Generic System
>>>>> (XEN)
>>>>> (XEN) ****************************************
>>>>> (XEN) Panic on CPU 0:
>>>>> (XEN) Unable to find compatible GIC in the device tree
>>>>> (XEN) ****************************************
>>>>> (XEN)
>>>>> (XEN) Manual reset required ('noreboot' specified)
>>>> Having early printk enabled all the time is not common and not enabled in release builds FWIK.
>>
>> There are a lot of information printed before the console is properly
>> brought up. I wonder if we should look at adding early console like
>> Linux does?
> I guess it is not a matter of "if" but "when" and I think it's just that no one has time to do that
> since it is more a like a feature for developers rather than for customers (they just report the issue
> and we need to fix it :)).

Sure. This is always the case, but it also means developpers will 
continue to waste time when investigating early boot issues. I wouldn't 
be surprised if the total time wasted is more than the actual effort to 
add support :).

> There are so many things that can go wrong during early boot including the entire boofdt parsing
> and having earlycon would be so desirable.
It is not clear what to take from your reply. Earlier you were concerned 
about the error not showing up in the log if the .config is not correct.

There is no really quick fix for that as a .config may work for platform 
A but not platform B. The only viable solution is having an early console.

Anything else like forcing to always have one GICvX selected is just a 
hack that would work for one set of people but not the others.

Cheers,

-- 
Julien Grall

