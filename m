Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA05CCEC2DC
	for <lists+xen-devel@lfdr.de>; Wed, 31 Dec 2025 16:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194594.1512957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vayEE-0001xP-J9; Wed, 31 Dec 2025 15:35:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194594.1512957; Wed, 31 Dec 2025 15:35:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vayEE-0001v4-GV; Wed, 31 Dec 2025 15:35:14 +0000
Received: by outflank-mailman (input) for mailman id 1194594;
 Wed, 31 Dec 2025 15:35:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vayED-0001uy-KO
 for xen-devel@lists.xenproject.org; Wed, 31 Dec 2025 15:35:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vayEC-001IGV-39;
 Wed, 31 Dec 2025 15:35:13 +0000
Received: from [213.226.64.151] (helo=[192.168.8.236])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vayED-001EH7-08;
 Wed, 31 Dec 2025 15:35:13 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=CihMYYJbpoIXf277OYZHUjp/wj51Xq3PLyghtTYVVSY=; b=jU31Z53S9Cd0OoJ3ERjQKE1WOq
	eJ9ADpVlMg0p/YLf/3nsdJiJjYzwWRX3DswBq8rgyVNEjunz1QBUpXFkTYE+a7EzdXj/Gkcd/+kpr
	U6TORZMq9wQjmVKeFCvOQ/CbYft8ZopMtqhUnlVrZfaVxpJzRun/sdxBKDhW6Joffwfg=;
Message-ID: <584bcb9e-ca3a-442a-9b6c-bdb5fb5fb8f4@xen.org>
Date: Wed, 31 Dec 2025 15:35:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/12] xen/arm: gic-v3: Implement GICv3 suspend/resume
 functions
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org,
 Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1765472890.git.mykola_kvach@epam.com>
 <9f084beff76e40fed2138ba2d59145a96b930c63.1765472890.git.mykola_kvach@epam.com>
 <a2be5ae1-7e4a-4137-9e36-6c5845a93ca1@xen.org>
In-Reply-To: <a2be5ae1-7e4a-4137-9e36-6c5845a93ca1@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 26/12/2025 12:39, Julien Grall wrote:
> Hi Mykola,
> 
> On 11/12/2025 18:43, Mykola Kvach wrote:
>> From: Mykola Kvach <mykola_kvach@epam.com>
>>
>> System suspend may lead to a state where GIC would be powered down.
>> Therefore, Xen should save/restore the context of GIC on suspend/resume.
>>
>> Note that the context consists of states of registers which are
>> controlled by the hypervisor. Other GIC registers which are accessible
>> by guests are saved/restored on context switch.
>>
>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> ---
>> Changes in V7:
>> - restore LPI regs on resume
>> - add timeout during redist disabling
>> - squash with suspend/resume handling for GICv3 eSPI registers
>> - drop ITS guard paths so suspend/resume always runs; switch missing ctx
>>    allocation to panic
>> - trim TODO comments; narrow redistributor storage to PPI icfgr
>> - keep distributor context allocation even without ITS; adjust resume
>>    to use GENMASK(31, 0) for clearing enables
>> - drop storage of the SGI configuration register, as SGIs are always
>>    edge-triggered
>> ---
>>   xen/arch/arm/gic-v3-lpi.c              |   3 +
>>   xen/arch/arm/gic-v3.c                  | 319 ++++++++++++++++++++++++-
>>   xen/arch/arm/include/asm/gic_v3_defs.h |   1 +
>>   3 files changed, 320 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic-v3-lpi.c b/xen/arch/arm/gic-v3-lpi.c
>> index de5052e5cf..61a6e18303 100644
>> --- a/xen/arch/arm/gic-v3-lpi.c
>> +++ b/xen/arch/arm/gic-v3-lpi.c
>> @@ -391,6 +391,9 @@ static int cpu_callback(struct notifier_block 
>> *nfb, unsigned long action,
>>       switch ( action )
>>       {
>>       case CPU_UP_PREPARE:
>> +        if ( system_state == SYS_STATE_resume )
>> +            break;
> 
> Do we need this check because we don't free the LPI pending table when 
> the CPU is turned off?
> 
> If so, don't we already have a problem for CPU hotplug because the 
> percpu area will be freed but not the pending table?

Looking at [1], we don't seem to support CPU OFF when the GICv3 ITS is 
enabled. So this change could be delayed. But CC Mykyta for awareness.

Cheers,

[1] 
https://lore.kernel.org/48bafdb8e6269a3d958065c6a1062ce2736632a0.1762939773.git.mykyta_poturai@epam.com

> 
> Cheers,
> 

-- 
Julien Grall


