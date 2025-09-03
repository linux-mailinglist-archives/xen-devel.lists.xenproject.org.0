Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE928B41D02
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 13:27:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108138.1458249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utldA-0002ZV-0m; Wed, 03 Sep 2025 11:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108138.1458249; Wed, 03 Sep 2025 11:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utld9-0002Wr-U8; Wed, 03 Sep 2025 11:26:23 +0000
Received: by outflank-mailman (input) for mailman id 1108138;
 Wed, 03 Sep 2025 11:26:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1utld8-0002Wl-CM
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 11:26:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utld6-004YaV-2B;
 Wed, 03 Sep 2025 11:26:20 +0000
Received: from [2a02:8012:3a1:0:4072:878e:9179:858c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utld6-00EGnZ-2C;
 Wed, 03 Sep 2025 11:26:20 +0000
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
	bh=yDrEc6UQluOeHjxcin4UDo4H+PmCqvtUQiUEvDvplqI=; b=2XMI/iQrIAo+IYL2Ml0mXxBJ7S
	kkERg3sNH+1VKqtklT/1/Qgkqzi/qfbIYYSOi/ow9umzKdZw+EcVlz3OEs9Y/zJ1WCWoD4X1tm+Vw
	jQYZnA11XmdmAmp20JArR+FFQNThHpS00Rtyqi5VxFsE5FWhlW1+X5RppQfyE2JA2lMQ=;
Message-ID: <6c2cfffa-b36e-4094-be55-88c6a32234ce@xen.org>
Date: Wed, 3 Sep 2025 12:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <6fda233a1a2f0362062ff9a6e80ee223d33815cf.1756481577.git.leonid_komarianskyi@epam.com>
 <06ff285f-39d5-4ffd-b842-6d776bb793ac@xen.org>
 <a10ae626-126d-4afc-acce-1e699a9d68e2@epam.com>
 <fac231ba-3d79-4eaa-9a23-4ae7aebc62f3@xen.org>
 <9d784bea-7ae8-4b0d-aa54-155dccd3f533@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9d784bea-7ae8-4b0d-aa54-155dccd3f533@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Leonid,

On 02/09/2025 21:55, Leonid Komarianskyi wrote:
>>>>>             if ( rank == NULL ) goto write_ignore;
>>>>>             vgic_lock_rank(v, rank, flags);
>>>>>             tr = rank->ienable;
>>>>>             vreg_reg32_setbits(&rank->ienable, r, info);
>>>>> -        vgic_enable_irqs(v, (rank->ienable) & (~tr), rank->index);
>>>>> +        if ( reg >= GICD_ISENABLERnE )
>>>>> +            vgic_enable_irqs(v, (rank->ienable) & (~tr),
>>>>> +                             EXT_RANK_IDX2NUM(rank->index));
>>>>> +        else
>>>>> +            vgic_enable_irqs(v, (rank->ienable) & (~tr), rank->index);
>>>>
>>>> ... you now have to keep both "if" the same. Unless we can have a
>>>> version to avoid "ifs" everywhere (maybe using macros), I would rather
>>>> create a separate funciton to handle eSPIs.
>>>>
>>>> Cheers,
>>>>
>>>
>>> The main idea of V5 of this patch is to consolidate similar code and
>>> keep the pairs of regular SPIs and their eSPI counterparts in the same
>>> place to simplify any future modifications of these pairs. If
>>> eSPI-specific registers are moved to a separate function, it would
>>> result in code duplication. Additionally, I think it would be easier to
>>> miss updating the code for one register of the SPI/eSPI pair while
>>> modifying the code for the other..
>>
>> I understand your reasoning, but in this case, we need to try to keep
>> the code as common as possible and reduce the number of ifs. Looking at
>> the patch again, we seem to often use "EXT_RANK_IDX2NUM(rank->index)"
>> and this is why we have the second "if", for instance here. I think it
>> would be preferable if "index" store the proper value.
>>
> 
> Actually, there are 4 specific cases where I need to use EXT_RANK_IDX2NUM:
> vgic_enable_irqs, vgic_disable_irqs, vgic_set_irqs_pending, and
> vgic_check_inflight_irqs_pending. The reason I made this transformation
> is that these functions are generic and calculate the virq based on the
> rank number, e.g. vgic_check_inflight_irqs_pending():
> 
> unsigned int irq = i + 32 * rank;
> 
> As a result, I decided to introduce EXT_RANK_IDX2NUM with ifs rather
> than modifying very generic code that would also affect vGICv2 and be
> more difficult to upstream..

I wasn't asking to modify the code in vgic_enable_irqs() & co. But 
rather how it is called.

Right now, rank->index for eSPI, will be starting at 0. But what if 
instead, it is starting at 128 (i.e. EXT_RANK_MIN)?

Effectively, rather than initializating the eSPI ranks with:

     for ( i = 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
         vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], i, 0);

You could do:

     for ( i = 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
         vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], 
EXT_RANK_IDX2NUM(i), 0);

This would remove all the "if"s and the "EXT_RANK_IDX2NUM(rank->index)".

Cheers,

-- 
Julien Grall


