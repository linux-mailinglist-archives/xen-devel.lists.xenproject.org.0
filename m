Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C96399F361
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 18:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819297.1232587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0km3-0008AG-7Y; Tue, 15 Oct 2024 16:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819297.1232587; Tue, 15 Oct 2024 16:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0km3-00088B-44; Tue, 15 Oct 2024 16:51:55 +0000
Received: by outflank-mailman (input) for mailman id 819297;
 Tue, 15 Oct 2024 16:51:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t0km1-000885-Lt
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 16:51:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t0km1-0005gc-7V; Tue, 15 Oct 2024 16:51:53 +0000
Received: from [15.248.2.235] (helo=[10.24.67.23])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t0km0-0006v2-Uu; Tue, 15 Oct 2024 16:51:53 +0000
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
	bh=1x+5yCAVxOjDSK0Y6dMjtedZHxgnfVHcD1/UzO5MPnk=; b=DMS2QIFV/Q94IR1kYstIvdgQOY
	IXYLI9g4vG7bg9fJhpTVjm0cFyal7toRqbltBcTy1eegYGJYp8VTjn4SQi23PjUGjY4nEnndpNWXS
	DBUUsAZADowfnAnNIb9uRHSwHBW5wUCVWpaCOryYGBQtY3iQLdQCY7DxRoxM8UMxvsXA=;
Message-ID: <b35816e4-9915-482f-a2e7-b8abacce77d8@xen.org>
Date: Tue, 15 Oct 2024 17:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-5-ayan.kumar.halder@amd.com>
 <4BFB5897-2C7A-4A44-B9E9-01BB7940BFF7@arm.com>
 <3d0327bf-3f1c-44e6-9782-5715365b2253@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3d0327bf-3f1c-44e6-9782-5715365b2253@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 15/10/2024 16:56, Ayan Kumar Halder wrote:
> 
> On 14/10/2024 20:03, Luca Fancellu wrote:
>> Hi Ayan,
> Hi Luca,
>>
>>
>>> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/ 
>>> head.S
>>> new file mode 100644
>>> index 0000000000..4a21bc815c
>>> --- /dev/null
>>> +++ b/xen/arch/arm/arm64/mpu/head.S
>>> @@ -0,0 +1,130 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Start-of-day code for an Armv8-R MPU system.
>>> + */
>>> +
>>> +#include <asm/mm.h>
>>> +#include <asm/arm64/mpu/sysregs.h>
>>> +
>>> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>>> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>> NIT alignment
> Ack
>>
>>> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
>>> +
>>> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
>>> +
>>> +/*
>>> + * Macro to prepare and set a EL2 MPU memory region.
>>> + * We will also create an according MPU memory region entry, which
>>> + * is a structure of pr_t,  in table \prmap.
>>> + *
>>> + * Inputs:
>>> + * sel:         region selector
>>> + * base:        reg storing base address (should be page-aligned)
>>> + * limit:       reg storing limit address
>>> + * prbar:       store computed PRBAR_EL2 value
>>> + * prlar:       store computed PRLAR_EL2 value
>>> + * maxcount:    maximum number of EL2 regions supported
>>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not 
>>> specified it will be
>>> + *              REGION_DATA_PRBAR
>>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not 
>>> specified it will be
>>> + *              REGION_NORMAL_PRLAR
>>> + */
>>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, 
>>> attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>>> +
>>> +    /* Check if the number of regions exceeded the count specified 
>>> in MPUIR_EL2 */
>>> +    add   \sel, \sel, #1
>> I think there is an issue adding 1 here, because the very first region 
>> we are going to fill will be the 1st even if we intended the 0th.
>> Probably moving this one at the end will fix the issue
> 
> We are also using 'sel' to compare against the maximum number of regions 
> supported. So, for the first region it needs to be 1 otherwise there is 
> a risk of comparing 0 (ie first region) with 0 (max supported regions).
> 
> May be what I can do is ...
> 
>>
>>> +    cmp   \sel, \maxcount
>>> +    bgt   fail
>>> +
>>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>>> +    and   \base, \base, #MPU_REGION_MASK
>>> +    mov   \prbar, #\attr_prbar
>>> +    orr   \prbar, \prbar, \base
>>> +
>>> +    /* Limit address should be inclusive */
>>> +    sub   \limit, \limit, #1
>>> +    and   \limit, \limit, #MPU_REGION_MASK
>>> +    mov   \prlar, #\attr_prlar
>>> +    orr   \prlar, \prlar, \limit
>>> +
> 
> /* Regions should start from 0 */
> 
> sub     \sel, \sel, #1

I didn't review the full patch yet. But couldn't we use ``bge``? This 
would cover "maxcount == 0" and avoid to increment and then decrement \sel.

Cheers,

-- 
Julien Grall


