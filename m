Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF0F7BB473
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 11:44:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613448.953953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohN7-0006kx-4f; Fri, 06 Oct 2023 09:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613448.953953; Fri, 06 Oct 2023 09:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohN7-0006hy-0D; Fri, 06 Oct 2023 09:43:49 +0000
Received: by outflank-mailman (input) for mailman id 613448;
 Fri, 06 Oct 2023 09:43:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qohN5-0006hq-Kl
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 09:43:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qohN5-0002FU-7B; Fri, 06 Oct 2023 09:43:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qohN4-00054Y-Vp; Fri, 06 Oct 2023 09:43:47 +0000
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
	bh=Ef564dxn7FcnzglYu0IjeC1T705qh0h6PgX0QeECYaU=; b=CgUMOFDx5VZIHFGyoJF5RpzO2I
	N4h8xwcNgOhNBn0xQQfKvyxPhWsEUue0oRY7qa8RXOHjn1O0CPxYoAUQZ+fC/609zYxiuxFY71NmM
	oVyHGzJfkTJWOCpQLgdQ3h5Ovf+8RD1c1xY8e20J52s/YbwxALYqhfqlPZAa4gtfrNLM=;
Message-ID: <dbd7a393-eb17-4a17-a5da-29d7b49fffd7@xen.org>
Date: Fri, 6 Oct 2023 10:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: vtimer: Don't read/use the secure physical timer
 interrupt for ACPI
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, dan.driscoll@siemens.com,
 arvind.raghuraman@siemens.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231005165454.18143-1-julien@xen.org>
 <edaa4c87-9e7e-485f-aa77-e330dcafa344@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <edaa4c87-9e7e-485f-aa77-e330dcafa344@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/10/2023 21:15, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 05/10/2023 18:54, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Per ACPI 6.5 section 5.2.25 ("Generic Timer Description Table (GTDT)"),
>> the fields "Secure EL1 Timer GSIV/Flags" are optional and an OS running
>> in non-secure world is meant to ignore the values.
>>
>> However, Xen is trying to reserve the value. When booting on Graviton
>> 2 metal instances, this would result to crash a boot because the
>> value is 0 which is already reserved (I haven't checked for which device).
> Per my understanding it is not reserved by any device.
> 0 means SGI and for SGIs we pre-reserve the bits in allocated_irqs at the very start.

Ah yes good point. Somehow, I had in mind that PPI was starting at 0 
'^^. How about replacing the paragraph with:

"However, Xen is trying to reserve the value. The ACPI tables for 
Graviton 2 metal instances will provide the value 0 which is not a 
correct PPI (PPIs start at 16) and would have in fact been already 
reserved by Xen as this is an SGI. Xen will hit the BUG() and panic()".

Cheers,

-- 
Julien Grall

