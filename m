Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084958315B1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 10:26:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668661.1041023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQOev-0000RJ-BW; Thu, 18 Jan 2024 09:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668661.1041023; Thu, 18 Jan 2024 09:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQOev-0000Pk-8J; Thu, 18 Jan 2024 09:26:01 +0000
Received: by outflank-mailman (input) for mailman id 668661;
 Thu, 18 Jan 2024 09:26:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rQOeu-0000Pe-IP
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 09:26:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQOeu-0001FV-25; Thu, 18 Jan 2024 09:26:00 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rQOet-0006mE-Qg; Thu, 18 Jan 2024 09:26:00 +0000
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
	bh=7jRhZL+nFGQRQhiYbzcIn7cFTmT6aPDUKwaaT/CK0pQ=; b=PvdhXvgd3nuJaMc3r42/KX+H0y
	7TZ6wa8ANVNxeFF0MZMv0VRTI2hxFJDVsmG8T733uZ4ZayTVYFK6qomfjhN/5Lshl6ayhnc/QwVvP
	dg36NQ7S8tdNA1n78lcAD1n0VZElcBA75vNMSiaehIm3z7CuH6YfhZPZ0tMlgRKP0GuU=;
Message-ID: <7f831d0e-ca74-4992-9e40-dfbf556ec1c1@xen.org>
Date: Thu, 18 Jan 2024 09:25:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 repost 4/4] [DO NOT COMMIT] xen/arm: Create a
 trampoline for secondary boot CPUs
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240116143709.86584-1-julien@xen.org>
 <20240116143709.86584-5-julien@xen.org>
 <CAG+AhRUox+jMhUnbGo6tngxji8nOcncm+Nx_76UuhTKKPfae8g@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRUox+jMhUnbGo6tngxji8nOcncm+Nx_76UuhTKKPfae8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17/01/2024 17:38, Carlo Nonato wrote:
> Hi Julien

Hi Carlo,

> On Tue, Jan 16, 2024 at 3:37 PM Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> In order to confirm the early boot code is self-contained, allocate a
>> separate trampoline region for secondary to boot from it.


[...]

>> @@ -304,6 +307,16 @@ smp_prepare_cpus(void)
>>       if ( rc )
>>           panic("Unable to allocate CPU sibling/core maps\n");
>>
>> +    /* Create a trampoline to confirm early boot code is self-contained */
>> +    trampoline = alloc_xenheap_page();
>> +    BUG_ON(!trampoline);
>> +
>> +    memcpy(trampoline, _start, PAGE_SIZE);
>> +    clean_dcache_va_range(trampoline, PAGE_SIZE);
>> +    invalidate_icache();
>> +
>> +    printk("Trampoline 0x%lx\n", virt_to_maddr(trampoline));
> 
> Here PRIx64 is needed for arm32.

Just for clarification, none of this patch is meant to work on Arm32. In 
fact, this would break secondary CPUs bring up.

This is why I tagged with DO NOT COMMIT. It was only included to show I 
tested this code on arm32.

Cheers,

-- 
Julien Grall

