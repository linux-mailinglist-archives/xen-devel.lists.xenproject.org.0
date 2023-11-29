Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C297FDEE8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 18:54:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644147.1004788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OlO-00046b-1I; Wed, 29 Nov 2023 17:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644147.1004788; Wed, 29 Nov 2023 17:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OlN-000442-Ux; Wed, 29 Nov 2023 17:54:17 +0000
Received: by outflank-mailman (input) for mailman id 644147;
 Wed, 29 Nov 2023 17:54:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r8OlN-00043w-59
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 17:54:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8OlM-0000Zy-TB; Wed, 29 Nov 2023 17:54:16 +0000
Received: from 82-132-227-204.dab.02.net ([82.132.227.204] helo=[172.20.10.4])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8OlM-0004xI-J2; Wed, 29 Nov 2023 17:54:16 +0000
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
	bh=1WNA2qH80j7oXhwOcGdQOg/f0DBDLFkZTzLiWBzK/xg=; b=tBCHG3Tbtcsc2FqzQz4F757Liq
	lwFTVP/S9pW3zwj2iOJJPu25b75OgcASpTe9PuLSrmfngL69wmhTbFc5XCEsygMv/b4DWsanvwnVK
	BAl+tTgmQIelLUufRyU7XgBHeZYC1Mg+iJXWqHht/yL9N4s0dtzI55gpcI+uFOBDfZIc=;
Message-ID: <f42236b8-5fac-42df-9705-4ae4b0519d8e@xen.org>
Date: Wed, 29 Nov 2023 18:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Move static event channel feature to a separate
 module
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231129153417.84421-1-michal.orzel@amd.com>
 <c51e40ed-0cd7-4562-921f-d2dc67b9e4e6@xen.org>
 <9685bc21-9d57-4f64-bd2f-70b9d0b0168a@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9685bc21-9d57-4f64-bd2f-70b9d0b0168a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 29/11/2023 18:41, Michal Orzel wrote:
> On 29/11/2023 18:17, Julien Grall wrote:
>> That said, I could settle on defining the two helpers in the *.c
>> directly because they are not meant to be used outside of a single *.c.
>>
>> Simarly...
>>
>>> diff --git a/xen/arch/arm/include/asm/static-evtchn.h b/xen/arch/arm/include/asm/static-evtchn.h
>>> new file mode 100644
>>> index 000000000000..472673fae345
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/static-evtchn.h
>>> @@ -0,0 +1,41 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#ifndef __ASM_STATIC_EVTCHN_H_
>>> +#define __ASM_STATIC_EVTCHN_H_
>>> +
>>> +#ifdef CONFIG_STATIC_EVTCHN
>>> +
>>> +#include <xen/device_tree.h>
>>> +
>>> +#define STATIC_EVTCHN_NODE_SIZE_CELLS 2
>>
>> ... this used to be defined in domain_build.c. AFAICT the only use is
>> now in static-evtchn.c. So why is it defined in the header?
>>
>> If this is moved in the *.c, then the header static-evtchn.h would only
>> contain alloc_static_evtchn(). This could be moved in domain_build.h or
>> setup.h (I don't have any preference).
> Apart from a prototype, we still need a stub. Therefore I would prefer to still have a header (will
> be needed for future upgrades e.g. port exposure in fdt) and move the prototype and a stub there (the macro
> I can move to *.c). It just looks better for me + we reduce ifdefery in domain_build/setup.h.
> Would you be ok with that?

I don't much like headers containing just one prototype. But I can live 
with them if you think more will be added.

Cheers,

-- 
Julien Grall

