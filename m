Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1FE7DF125
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 12:29:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626862.977519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyVsC-000098-1D; Thu, 02 Nov 2023 11:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626862.977519; Thu, 02 Nov 2023 11:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyVsB-00006t-UJ; Thu, 02 Nov 2023 11:28:27 +0000
Received: by outflank-mailman (input) for mailman id 626862;
 Thu, 02 Nov 2023 11:28:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qyVsA-00006n-EG
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 11:28:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyVs9-0002se-S3; Thu, 02 Nov 2023 11:28:25 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.12.44]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyVs9-0005jO-LA; Thu, 02 Nov 2023 11:28:25 +0000
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
	bh=9mHTYqQzwu36vXKDSsnmB4GJRICAK0qZBV4svFmugSU=; b=kWB5sZUKNwb4/aZ6X8GbryI0t3
	ezmjNMT6kZ6UGE6rk9RLRy3DcifITU3TBNCbGyXvrStznqmtMt1pPehScz8yG6p+U5p8pYtL3/mIe
	NN1R3jn6S3lbx/rCsX3RVUH4APqur3/n28+HpoJvwxUki9TcyYcpHHG17htnvWk8Kt98=;
Message-ID: <ea139ebd-f196-4cd1-aa2f-f7736ff52613@xen.org>
Date: Thu, 2 Nov 2023 11:28:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm/dom0less: put dom0less feature code in a
 separate module
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230927140133.631192-1-luca.fancellu@arm.com>
 <20230927140133.631192-4-luca.fancellu@arm.com>
 <ac71e580-3d81-4024-b19c-d3d954df5948@xen.org>
 <00D15160-A5C1-4A42-A11E-9A9282676653@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <00D15160-A5C1-4A42-A11E-9A9282676653@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/11/2023 11:15, Luca Fancellu wrote:
> 
> Hi Julien,
> 
>>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>>> new file mode 100644
>>> index 000000000000..dc9c90cf00a7
>>> --- /dev/null
>>> +++ b/xen/arch/arm/dom0less-build.c
>>> @@ -0,0 +1,1087 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * xen/arch/arm/dom0less-build.c
>>> + *
>>> + * Code related to the dom0less functionality
>>> + *
>>> + * Copyright (C) 2023 Arm Ltd.
>>
>> This feels a bit odd to add your copyright here. It sounds like Arm wrote all the code, but you only moved. That said, I am not a lawyer.
> 
> Mmm yes, we should be required to put our copyright in everything we create or modify or touch,
> said that, I could modify that to be like this:

This is debatable. IIRC we discussed this in a recent-ish community 
call. From my understanding, we are tracking the authorship/copyright 
using signed-off-by/author in the commit message.

> 
> /*
>   * xen/arch/arm/dom0less-build.c
>   *
>   * Code related to the dom0less functionality
>   *
>   * Original code from xen/arch/arm/domain_build.c
>   * Modifications: Copyright (C) 2023 Arm Ltd.
>   */
> 
> What do you think?

TBH, it is not clear to me what sort of modifications you did that would 
require a copyright from Arm. AFAICT, you only moved the code.

Anyway, I will let the others express their views here.

> 
>>
>>> + */
>>> +
>>> +#include <xen/device_tree.h>
>>> +#include <xen/err.h>
>>> +#include <xen/event.h>
>>> +#include <xen/grant_table.h>
>>> +#include <xen/iocap.h>
>>> +#include <xen/libfdt/libfdt.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/serial.h>
>>> +#include <xen/sizes.h>
>>> +#include <xen/vmap.h>
>>> +
>>> +#include <asm/arm64/sve.h>
>>> +#include <asm/dom0less-build.h>
>>> +#include <asm/domain_build.h>
>>> +
>>> +bool __init is_dom0less_mode(void)
>>> +{
>>> +    struct bootmodules *mods = &bootinfo.modules;
>>> +    struct bootmodule *mod;
>>> +    unsigned int i;
>>> +    bool dom0found = false;
>>> +    bool domUfound = false;
>>> +
>>> +    /* Look into the bootmodules */
>>> +    for ( i = 0 ; i < mods->nr_mods ; i++ )
>>> +    {
>>> +        mod = &mods->module[i];
>>> +        /* Find if dom0 and domU kernels are present */
>>> +        if ( mod->kind == BOOTMOD_KERNEL )
>>> +        {
>>> +            if ( mod->domU == false )
>>> +            {
>>> +                dom0found = true;
>>> +                break;
>>> +            }
>>> +            else
>>> +                domUfound = true;
>>> +        }
>>> +    }
>>> +
>>> +    /*
>>> +     * If there is no dom0 kernel but at least one domU, then we are in
>>> +     * dom0less mode
>>> +     */
>>> +    return ( !dom0found && domUfound );
>>> +}
>>> +
>>> +static bool __init allocate_bank_memory(struct domain *d,
>>> +                                        struct kernel_info *kinfo,
>>> +                                        gfn_t sgfn,
>>> +                                        paddr_t tot_size)
>>
>> I understand that this is today only used by domUs. However, we could technically use it for allocating dom0 memory if it is not 1:1.
>>
>> So I think this function should stay in domain_build.c.
> 
> Ok I can leave it there, is it ok for you if I protect it using the KConfig in domain_build.c since that code is currently not used apart from dom0less?
> (I will do that in the last patch if you agree)

I am fine with that.

Cheers,

-- 
Julien Grall

