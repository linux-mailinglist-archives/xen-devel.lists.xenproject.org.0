Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB82C70F399
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 11:58:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538947.839359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1lGM-00041K-KA; Wed, 24 May 2023 09:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538947.839359; Wed, 24 May 2023 09:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1lGM-0003zd-GM; Wed, 24 May 2023 09:58:34 +0000
Received: by outflank-mailman (input) for mailman id 538947;
 Wed, 24 May 2023 09:58:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q1lGK-0003zX-KU
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 09:58:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q1lGK-0001EJ-3e; Wed, 24 May 2023 09:58:32 +0000
Received: from [15.248.2.62] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q1lGJ-00007d-SI; Wed, 24 May 2023 09:58:32 +0000
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
	bh=br+UEi3hwR7LZWdj/8hnhWarxthBUE4mQwt+5ho3tOE=; b=avD3RVTVF6XBE61FOgv1NcD+xl
	usJyhsljV/7BcGpJeEWGE/WHkeBl9gATqMhOr4dLiKXKbjK6VxIy9jHw57UrflI+cEkXBNdEGsXZk
	LCLmYAYzcZigpSpTXCbA8cuC3hqKvfj5yVFdXB8P+brDNI++UOsUSghF2modjZ8uTnyE=;
Message-ID: <dae8d4f9-7a1e-3940-1f25-0b1a2cb123bf@xen.org>
Date: Wed, 24 May 2023 10:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v7 01/12] xen/arm: enable SVE extension for Xen
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-2-luca.fancellu@arm.com>
 <98D7529A-FF7E-4079-B4FB-7EA096CB6822@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <98D7529A-FF7E-4079-B4FB-7EA096CB6822@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/05/2023 10:01, Bertrand Marquis wrote:
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index c4ec38bb2554..83b84368f6d5 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -9,6 +9,7 @@
>> #include <xen/init.h>
>> #include <xen/smp.h>
>> #include <xen/stop_machine.h>
>> +#include <asm/arm64/sve.h>
>> #include <asm/cpufeature.h>
>>
>> DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>> @@ -143,6 +144,9 @@ void identify_cpu(struct cpuinfo_arm *c)
>>
>>      c->zfr64.bits[0] = READ_SYSREG(ID_AA64ZFR0_EL1);
>>
>> +    if ( cpu_has_sve )
>> +        c->zcr64.bits[0] = compute_max_zcr();
>> +
>>      c->dczid.bits[0] = READ_SYSREG(DCZID_EL0);
>>
>>      c->ctr.bits[0] = READ_SYSREG(CTR_EL0);
>> @@ -199,7 +203,7 @@ static int __init create_guest_cpuinfo(void)
>>      guest_cpuinfo.pfr64.mpam = 0;
>>      guest_cpuinfo.pfr64.mpam_frac = 0;
>>
>> -    /* Hide SVE as Xen does not support it */
>> +    /* Hide SVE by default to the guests */
> 
> Everything is for guests and as Jan mentioned in an other comment
> this could be wrongly interpreted.

(Not directly related to this patch, so no changes expected here)

Hmmm... The name of the function/variable is confusing as well given 
that the cpuinfo should also apply to dom0. Should we s/guest/domain/?

Cheers,

-- 
Julien Grall

