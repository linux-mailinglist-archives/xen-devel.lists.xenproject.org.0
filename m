Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8557B4D46
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 10:27:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611210.950667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEGV-0003Bz-LE; Mon, 02 Oct 2023 08:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611210.950667; Mon, 02 Oct 2023 08:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEGV-00038k-Hs; Mon, 02 Oct 2023 08:26:55 +0000
Received: by outflank-mailman (input) for mailman id 611210;
 Mon, 02 Oct 2023 08:26:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qnEGU-00038e-4P
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 08:26:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qnEGT-0006zj-0T; Mon, 02 Oct 2023 08:26:53 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qnEGS-0004u7-QA; Mon, 02 Oct 2023 08:26:52 +0000
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
	bh=tvN8a4t44Oiz+TA9crQL3Z1ZoAXMbqbnAUCR6JxBNaM=; b=U/qxIswxFHsYZmX4V1JDBsCxQA
	SxR0XiOCzu+gZRiASelNZiz+fQmQrEitqdK0fdNSDedlk/TEnQnkTyb4CDQaJBb6GElvvByJXWkSs
	1aUeu6ff1f2qR9Li3hjny9Ch70UaAW2gwesJAKYC2htclWapydQXF9UrnYgYK6Ma3oMQ=;
Message-ID: <bc2a043a-9836-429b-88bb-6bedda5343bf@xen.org>
Date: Mon, 2 Oct 2023 09:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230927140133.631192-1-luca.fancellu@arm.com>
 <20230927140133.631192-4-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2309281726440.1996340@ubuntu-linux-20-04-desktop>
 <725342EA-730F-4961-88A4-43EC0CBAD5BA@arm.com>
 <alpine.DEB.2.22.394.2309291242570.2348112@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2309291242570.2348112@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 29/09/2023 20:48, Stefano Stabellini wrote:
> On Fri, 29 Sep 2023, Luca Fancellu wrote:
>>> On 29 Sep 2023, at 01:33, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>
>>> On Wed, 27 Sep 2023, Luca Fancellu wrote:
>>>> Currently the dom0less feature code is mostly inside domain_build.c
>>>> and setup.c, it is a feature that may not be useful to everyone so
>>>> put the code in a different compilation module in order to make it
>>>> easier to disable the feature in the future.
>>>>
>>>> Move gic_interrupt_t in domain_build.h to use it with the function
>>>> declaration, move its comment above the declaration.
>>>>
>>>> The following functions are now visible externally from domain_build
>>>> because they are used also from the dom0less-build module:
>>>> - get_allocation_size
>>>> - set_interrupt
>>>> - domain_fdt_begin_node
>>>> - make_memory_node
>>>> - make_resv_memory_node
>>>> - make_hypervisor_node
>>>> - make_psci_node
>>>> - make_cpus_node
>>>> - make_timer_node
>>>> - handle_device_interrupts
>>>> - construct_domain
>>>> - process_shm
>>>>
>>>> The functions allocate_static_memory and assign_static_memory_11
>>>> are now externally visible, so put their declarations into
>>>> domain_build.h and move the #else and stub definition in the header
>>>> as well.
>>>>
>>>> Move is_dom0less_mode from setup.c to dom0less-build.c and make it
>>>> externally visible.
>>>>
>>>> Where spotted, fix code style issues.
>>>>
>>>> No functional change is intended.
>>>>
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>
>>> This is great! A couple of questions.
>>>
>>> Why was allocate_static_memory not moved to dom0less-build.c ?
>>
>> My aim is to decouple the features, so in patch 4 we move (just once as Julien suggested)
>> the static memory code on a module on its own, because we can have a guest booted with
>> dom0less feature but having it with static memory is optional.
> 
> OK
> 
> 
>>> Would it make sense to also move construct_dom0 to dom0less-build.c
>>> given the similarities with construct_domU? I am not sure about this.
>>>
>>
>> We can’t do that because the final goal of this serie is to have a Kconfig disabling dom0less,
>> so in that case we will end up removing from the compilation also construct_dom0.
> 
> OK. Probably we can't do much better than this.
> 
> 
> One more question on the code movement, and I would also like Julien and
> Bertrand to express their opinions on this.
> 
> Given that code movement is painful from a git history perspective, and
> given that we have to move dom0less code to xen/common anyway to make
> it available to RISC-V and also x86, could we do it in one shot here?

Looking at the name of the functions, I would expect that we would need 
another code movement in the future to move back Arm specific function 
under arch/arm/. So we would end up with two code movement as well.

I would prefer if we wait until RISC-V/x86 needs it so we don't 
unnecessarily move Arm specific code in common/.

Cheers,

-- 
Julien Grall

