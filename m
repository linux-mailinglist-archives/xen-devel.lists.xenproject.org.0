Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB449A6E35
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:33:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823700.1237741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uPS-0000wc-O4; Mon, 21 Oct 2024 15:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823700.1237741; Mon, 21 Oct 2024 15:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uPS-0000v7-Kp; Mon, 21 Oct 2024 15:33:30 +0000
Received: by outflank-mailman (input) for mailman id 823700;
 Mon, 21 Oct 2024 15:33:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t2uPR-0000uz-5n
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:33:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2uPQ-0003B0-Uy; Mon, 21 Oct 2024 15:33:28 +0000
Received: from [2a02:8012:3a1:0:827:16ef:abff:1cc1]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2uPQ-0002EH-PQ; Mon, 21 Oct 2024 15:33:28 +0000
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
	bh=VFmjguUQFQAf9lWczfktOSWTuA2+Vv43VsS79pZlLrY=; b=XLMG1VpmrYnATnwNWBcjcNDD4Z
	mz0la7ntKxCEc3z+EpsqHvYDUQ6eDW1QzzQ3FRkCp4o6T8kKfQfd1XNhohFA58zAIiQ0XCDG4r+JW
	moS+XdCJ75LbWpcryE3AovqH96XC06NTqdkPj/6lYE21JaehlhW9ne9HqIkseCPRrD34=;
Message-ID: <832d5f2c-63d6-4c00-be8f-1b44ca2a91d9@xen.org>
Date: Mon, 21 Oct 2024 16:33:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-5-ayan.kumar.halder@amd.com>
 <870059bd-d2af-4100-88be-9f6eb4facbe9@xen.org>
 <d7918da2-1ea7-4036-ab12-89afc6deb966@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d7918da2-1ea7-4036-ab12-89afc6deb966@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 21/10/2024 16:07, Ayan Kumar Halder wrote:
> 
> On 18/10/2024 23:13, Julien Grall wrote:
>> Hi Ayan,
>>> +.endm
>>> +
>>> +/*
>>> + * Maps the various sections of Xen (described in xen.lds.S) as 
>>> different MPU
>>> + * regions.
>>> + *
>>> + * Inputs:
>>> + *   lr : Address to return to.
>>> + *
>>> + * Clobbers x0 - x5
>>> + *
>>> + */
>>> +FUNC(enable_boot_cpu_mm)
>>> +
>>> +    /* Check if the number of regions exceeded the count specified 
>>> in MPUIR_EL2 */
>>
>> AFAIU, this doesn't match what the instruction is doing below.
> Sorry, this needs to be removed.
>>
>>> +    mrs   x5, MPUIR_EL2
>>> +
>>> +    /* x0: region sel */
>>> +    mov   x0, xzr
>>> +    /* Xen text section. */
>>> +    load_paddr x1, _stext
>>> +    load_paddr x2, _etext
>>> +    cmp x1, x2
>>> +    beq 1f
>>
>> This check seems to be excessive... I can't think of a reason why 
>> there would be no text at all... Same for a lot of the checks below.
> Is it ok if we have this excess check ? The downsides are only a small 
> increase in code size and boot time. Otherwise, I need to justify why we 
> have this checks in some places, but not in others.

How about moving the check in prepare_xen_region? This should solve the 
concerns on both the current approach and my proposed approach.

Cheers,

-- 
Julien Grall


