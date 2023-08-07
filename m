Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3937722F5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:44:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578304.905744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyeP-0002cN-6k; Mon, 07 Aug 2023 11:43:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578304.905744; Mon, 07 Aug 2023 11:43:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyeP-0002Z1-2x; Mon, 07 Aug 2023 11:43:53 +0000
Received: by outflank-mailman (input) for mailman id 578304;
 Mon, 07 Aug 2023 11:43:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qSyeN-0002YK-Jm
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:43:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qSyeN-0005HA-3P; Mon, 07 Aug 2023 11:43:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qSyeM-00044z-Qk; Mon, 07 Aug 2023 11:43:50 +0000
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
	bh=N0tLBPm3rHVOypWUD918M6DeqCdBgaaafpUssnEENr8=; b=WKFeOsRCY9Z4jQUpmGV3QPtJAd
	iTa+V4+pqljdHOfZ5ftkK96ou7DKMeUHM5hkIa0yytNCodCQxItnJ0m30w2X1/68fbQwLk4GtrZl4
	cdgx7aY4QOCS0r3HgWsfiKCl1vIl0WLfq4iYrfPGcj+fohqlvrNPa4nV2XZGUsQTx2Pk=;
Message-ID: <88fff832-af85-497e-9608-612c8a351d9b@xen.org>
Date: Mon, 7 Aug 2023 12:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, Ayan Kumar Halder <ayankuma@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-2-Henry.Wang@arm.com>
 <79de42d1-35db-79b1-da2a-f08a72fa53d7@amd.com>
 <AS8PR08MB7991B7C1B78531B9322934E2920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991B7C1B78531B9322934E2920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/08/2023 12:35, Henry Wang wrote:
> Hi Ayan,

Hi Henry,

>> -----Original Message-----
>> Hi Henry,
>>
>>> At the moment, on MMU system, enable_mmu() will return to an
>>> address in the 1:1 mapping, then each path is responsible to
>>> switch to virtual runtime mapping. Then remove_identity_mapping()
>>> is called on the boot CPU to remove all 1:1 mapping.
>>>
>>> Since remove_identity_mapping() is not necessary on Non-MMU system,
>>> and we also avoid creating empty function for Non-MMU system, trying
>>> to keep only one codeflow in arm64/head.S, we move path switch and
>>> remove_identity_mapping() in enable_mmu() on MMU system.
>>>
>>> As the remove_identity_mapping should only be called for the boot
>>> CPU only, so we introduce enable_boot_cpu_mm() for boot CPU and
>>> enable_secondary_cpu_mm() for secondary CPUs in this patch.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>
>> With two comments
>>
>> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>
>> Tested-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> 
> Thanks, and...
> 
>>
>>> +/*
>>> + * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
>>> + * The function will return to the virtual address provided in LR (e.g. the
>>> + * runtime mapping).
>>> + *
>>> + * Inputs:
>>> + *   lr : Virtual address to return to.
>>> + *
>>> + * Clobbers x0 - x5
>>> + */
>>> +enable_secondary_cpu_mm:
>> I will prefer "enable_secondary_cpu_mmu" as it is MMU specific. And ...
> 
> ...actually this as well as...
> 
>>> +/*
>>> + * Enable mm (turn on the data cache and the MMU) for the boot CPU.
>>> + * The function will return to the virtual address provided in LR (e.g. the
>>> + * runtime mapping).
>>> + *
>>> + * Inputs:
>>> + *   lr : Virtual address to return to.
>>> + *
>>> + * Clobbers x0 - x5
>>> + */
>>> +enable_boot_cpu_mm:
>>
>> prefer "enable_boot_cpu_mmu" as it is MMU specific as well.
> 
> ...this, are the name suggested by Julien in [1], so probably I will stick
> to these names, unless he would prefer the proposed names. I would
> personally prefer the names that Julien suggested too, because from
> the comments above these two functions, these functions not only
> enable the MMU, but also turn on the d-cache, hence a more generic
> name (using "mm"), is more appropriate here I guess.

I have suggested those name because the two functions are meant to 
abstract the implementation between MPU and MMU (see [2] for the MPU).

If we prefix them with *_mmu now, they will have to be renamed later on 
and will just introduce unnecessary churn.

> 
> [1] https://lore.kernel.org/xen-devel/c10bc254-ad79-dada-d5fb-9ee619934ffb@xen.org/

[2] 
https://gitlab.com/xen-project/people/henryw/xen/-/blob/mpu_v4/xen/arch/arm/arm64/mpu/head.S?ref_type=heads#L205

-- 
Julien Grall

