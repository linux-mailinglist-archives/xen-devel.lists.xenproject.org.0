Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E23D66E157C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 21:55:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520930.809079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn31w-0006iS-Ak; Thu, 13 Apr 2023 19:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520930.809079; Thu, 13 Apr 2023 19:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn31w-0006fy-6d; Thu, 13 Apr 2023 19:54:52 +0000
Received: by outflank-mailman (input) for mailman id 520930;
 Thu, 13 Apr 2023 19:54:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pn31v-0006fs-8t
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 19:54:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn31v-00044y-1i; Thu, 13 Apr 2023 19:54:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pn31u-0003oO-So; Thu, 13 Apr 2023 19:54:50 +0000
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
	bh=tg3OWKBqkAnwBlRFVwHPX9YwMY8VMLa79Z8mOEtHzXA=; b=bVIsmCOH4eI4lEz7gBMNopYWm7
	WqsDJ31IYPQ12izK0xGIYH+WzWjf9ENAO0ijE0hbSH7HKZ+ucWtVuQ0rC6pa3txhJyZQXwPcPuFHE
	COu7K0aBqSQJ6xeRBZTHtXLOik7/LEhzHK7R+UObsGUJ7Caqe6Jx/QzJmM34uKVXf4Uo=;
Message-ID: <e369554d-946e-8419-0d94-808162183e03@xen.org>
Date: Thu, 13 Apr 2023 20:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v5 05/12] arm/sve: save/restore SVE context switch
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230412094938.2693890-1-luca.fancellu@arm.com>
 <20230412094938.2693890-6-luca.fancellu@arm.com>
 <b1c77bdf-6979-83b6-f5e4-ac5b3e751a3d@xen.org>
 <6DDCEF6B-F07B-44EA-83D0-33BED5EAC506@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6DDCEF6B-F07B-44EA-83D0-33BED5EAC506@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 13/04/2023 15:35, Luca Fancellu wrote:
> 
> 
>> On 13 Apr 2023, at 14:11, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 12/04/2023 10:49, Luca Fancellu wrote:
>>> Save/restore context switch for SVE, allocate memory to contain
>>> the Z0-31 registers whose length is maximum 2048 bits each and
>>> FFR who can be maximum 256 bits, the allocated memory depends on
>>> how many bits is the vector length for the domain and how many bits
>>> are supported by the platform.
>>> Save P0-15 whose length is maximum 256 bits each, in this case the
>>> memory used is from the fpregs field in struct vfp_state,
>>> because V0-31 are part of Z0-31 and this space would have been
>>> unused for SVE domain otherwise.
>>> Create zcr_el{1,2} fields in arch_vcpu, initialise zcr_el2 on vcpu
>>> creation given the requested vector length and restore it on
>>> context switch, save/restore ZCR_EL1 value as well.
>>> Remove headers from sve.c that are already included using
>>> xen/sched.h.
>> I dislike this because ...
>>
>>> diff --git a/xen/arch/arm/arm64/sve.c b/xen/arch/arm/arm64/sve.c
>>> index 78f7482619da..5485648850a0 100644
>>> --- a/xen/arch/arm/arm64/sve.c
>>> +++ b/xen/arch/arm/arm64/sve.c
>>> @@ -5,14 +5,29 @@
>>>    * Copyright (C) 2022 ARM Ltd.
>>>    */
>>>   -#include <xen/types.h>
>>> -#include <asm/cpufeature.h>
>>
>> ... it is not entirely obvious that sched.h will import asm/cpufeatures.h. This could easily change in the future and would only require us to re-add those includes.
> 
> Ok I will reintroduce #include <asm/cpufeature.h>, do I understand correctly that is the only header you would like me to retain?

My remark was for all the headers you removed. It is not obvious that 
any of them will be included by sched.h.

Cheers,

-- 
Julien Grall

