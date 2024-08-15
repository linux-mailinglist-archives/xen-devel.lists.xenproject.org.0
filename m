Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58774952B3C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 11:38:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777942.1188005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seWvc-0002j8-MA; Thu, 15 Aug 2024 09:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777942.1188005; Thu, 15 Aug 2024 09:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seWvc-0002g0-JP; Thu, 15 Aug 2024 09:37:56 +0000
Received: by outflank-mailman (input) for mailman id 777942;
 Thu, 15 Aug 2024 09:37:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1seWvb-0002fu-9a
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 09:37:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1seWva-0008Ri-PF; Thu, 15 Aug 2024 09:37:54 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1seWva-0000lL-GC; Thu, 15 Aug 2024 09:37:54 +0000
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
	bh=705oB4eS7SZ+UL02j5hdaY1NYF1bUTjLWCb7xfXaGNo=; b=TmmbXtnoh2oLTApzPv2FClN6OT
	PXvNHSaOhQKJfKj1A/KDKzfyvMSRq5FkiKGnYP1WO2N5SA4H3u4S0Me5Dc+KgTtRd72Bx9QovOLen
	ZcVWtoVm4vQFKTkEKQf+lhpMWbJqOklgdI+vc7i16z0UOK/XKIZSiB+0S7IrEJhXpr0U=;
Message-ID: <7612e207-7eff-436a-b884-3a0227aababa@xen.org>
Date: Thu, 15 Aug 2024 10:37:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: Hide FEAT_SME
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240814210054.67520-1-julien@xen.org>
 <22dcdbbf-5000-4b92-b746-5e01c0160776@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <22dcdbbf-5000-4b92-b746-5e01c0160776@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15/08/2024 09:58, Ayan Kumar Halder wrote:
> Hi Julien,

Hi Ayan,

> On 14/08/2024 22:00, Julien Grall wrote:
>> CAUTION: This message has originated from an External Source. Please 
>> use proper judgment and caution when opening attachments, clicking 
>> links, or responding to this email.
>>
>>
>> Newer hardware may support FEAT_SME. Xen doesn't have any knowledge but
>> it will still expose the feature to the VM. If the OS is trying to use
>> SME, then it will crash.
>>
>> Solve by hiding FEAT_SME.
>>
>> Signed-off-by: Julien Grall <julien@xen.org>
>>
>> ---
>>
>> The current approach used to create the domain cpuinfo is to hide
>> (i.e. a denylist) what we know Xen is not supporting. The drawback
>> with this approach is for newly introduced feature, Xen will expose it
>> by default.
>>
>> If a kernel is trying to use it then it will crash. I can't really
>> make my mind whether it would be better to expose only what we support
>> (i.e. use an allowlist).
>>
>> AFAICT, there is no security concerns with the current approach because
>> ID_* registers are not a way to tell the kernel which features are
>> supported. A guest kernel could still try to access the new registers.
>>
>> So the most annoying bits is that booting Xen on a new HW may lead to
>> an OS crashing.
>> ---
>>   xen/arch/arm/cpufeature.c             | 3 +++
>>   xen/arch/arm/include/asm/cpufeature.h | 4 +++-
>>   2 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index ef77473bf8e3..b45dbe3c668d 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -208,6 +208,9 @@ static int __init create_domain_cpuinfo(void)
>>       domain_cpuinfo.pfr64.sve = 0;
>>       domain_cpuinfo.zfr64.bits[0] = 0;
>>
>> +    /* Hide SMT support as Xen does not support it */
>> +    domain_cpuinfo.pfr64.sme = 0;
> 
> Instead of this, can we do the following :-
> 
> domain_cpuinfo.pfr64.res1 = 0;
> This would imply that SME, RNDR_trap, CSV2_frac, NMI, etc are not 
> supported.

I could but I haven't done it for two reasons:
   * AFAICT, there are no issue to expose RNDR_trap to the guest. Also 
not all the bits in the field res1 are defined yet. So effectively, we 
would be implementing an allowlist like.
   * In the future, we could split res1 in two. If we are not careful, 
we would expose the feature again.

So I find this approach rather risky. There is also a more general 
question on how the features should be handled (see what I wrote after 
--- and below).

> 
> If later Xen decides to support any of these, then they can be 
> selectively turned on for a domain in do_sysreg() 

do_sysreg() is just returning the ID registers. This only helps the OS 
to discover the features at runtime and it is free to ignore them. What 
matter is the configuration in of the trap registers (such as HCR_EL2).

If a feature is not gated by a trap register, then it could be enabled 
everywhere. So effectively, the decision will depend on the feature. In 
the future, we may have to take care of suspend/resume or live-migration 
between two Xen versions. At that point the feature may need to be 
per-domain.

 > (Similar to SVE).

The main reason SVE is enabled per-domain is because of the large state. 
But if we have feature that doesn't have an impact on the memory usage, 
then they could be enabled everywhere.

Anyway, the first decision we need to take is whether we want to change 
to an allowlist. There are pros and cons with both of them (see what I 
wrote above). At the moment, I am still leaning towards the existing 
model which is expose everything by default but hide features when they 
appear and Xen needs more handling.

Cheers,

-- 
Julien Grall


