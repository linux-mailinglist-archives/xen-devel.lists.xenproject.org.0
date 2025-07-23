Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88BCB0F0D8
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 13:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053782.1422568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueXMG-00055H-TB; Wed, 23 Jul 2025 11:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053782.1422568; Wed, 23 Jul 2025 11:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueXMG-00053M-Pn; Wed, 23 Jul 2025 11:10:00 +0000
Received: by outflank-mailman (input) for mailman id 1053782;
 Wed, 23 Jul 2025 11:09:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ueXMF-00053G-6A
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 11:09:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ueXME-00ErNn-0Y;
 Wed, 23 Jul 2025 11:09:58 +0000
Received: from [15.248.2.234] (helo=[10.24.67.34])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ueXMD-009PME-2n;
 Wed, 23 Jul 2025 11:09:58 +0000
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
	bh=jSfjPDcLZaq34Be3G/MIrIqrmTw0bFgNOPQf2rpVmjY=; b=c5Aq07ObSQewVAQwUUTIeOfZ+O
	hBBlA0IRoduvJrgOBHzcd/C1Hbz6eYoBuDY/++uP1qN4vKdKekkDlyesutimVHJXIW+4BUmvURvg+
	Xyw02krKPo4Fqq3/GJaTunb85nO9gSWi6Yg5Z+sWXWfd5f1C57z04qnzbMrVXbNaNL8M=;
Message-ID: <3f74f62f-7017-48f2-ba7c-6af358fb0a50@xen.org>
Date: Wed, 23 Jul 2025 12:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/8] xen/arm: move vcpu_switch_to_aarch64_mode() in
 arch_vcpu_create()
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <20250723075835.3993182-3-grygorii_strashko@epam.com>
 <99c88af9-7f89-4d7c-9827-1ba85c803195@xen.org>
 <fdf7d2b9-aca9-4392-8e4d-a7fc8ce036f2@epam.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <fdf7d2b9-aca9-4392-8e4d-a7fc8ce036f2@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 23/07/2025 11:19, Grygorii Strashko wrote:
> On 23.07.25 12:16, Julien Grall wrote:
>> On 23/07/2025 08:58, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Move vcpu_switch_to_aarch64_mode() in arch_vcpu_create() callback 
>>> instead
>>> of calling it manually from few different places after vcpu_create().
>>>
>>> Before doing above ensure vcpu0 is created after kernel_probe() is 
>>> done and
>>> domain's guest execution mode (32-bit/64-bit) is set for dom0 and 
>>> dom0less
>>> domains.
>>
>> The commit message doesn't mention anything about domains created by 
>> the toolstack. In this case, from my understanding, the switch to 64- 
>> bit domain happens *after* the vCPUs are created.
>>
>> At the moment, I think this is probably ok to call...
>>
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>>   xen/arch/arm/domain.c                    |  3 +++
>>>   xen/arch/arm/domain_build.c              | 13 +++++--------
>>>   xen/common/device-tree/dom0less-build.c  |  6 +++---
>>>   xen/include/asm-generic/dom0less-build.h |  2 +-
>>>   4 files changed, 12 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>>> index 79a144e61be9..bbd4a764c696 100644
>>> --- a/xen/arch/arm/domain.c
>>> +++ b/xen/arch/arm/domain.c
>>> @@ -586,6 +586,9 @@ int arch_vcpu_create(struct vcpu *v)
>>>       if ( get_ssbd_state() == ARM_SSBD_RUNTIME )
>>>           v->arch.cpu_info->flags |= CPUINFO_WORKAROUND_2_FLAG;
>>> +    if ( is_64bit_domain(v->domain) )
>>> +        vcpu_switch_to_aarch64_mode(v);
>>
>> ... this function here because I *think* it would be NOP. But this 
>> feels really fragile.
> 
> The toolstack configures domain and vcpus through 
> XEN_DOMCTL_set_address_size on Arm64:
> - toolstack creates domain and parses kernel binary: domain created with 
> DOMAIN_32BIT mode by default
> - toolstack creates vcpus (still 32 bit mode): libxl__build_pre()- 
>  >xc_domain_max_vcpus()
> - toolstack switches domain mode depending on kernel binary type: 
> libxl__build_dom()->xc_dom_boot_mem_init(),
>    which triggers XEN_DOMCTL_set_address_size hypercall.
>    Xen: arm64: switches domain mode and re-configures vcpus: 
> subarch_do_domctl()->set_address_size()
> 
> So, this patch does not affect toolstack path, only optimizes Xen boots 
> a bit. 

Thanks for providing more detaisl. I am not sure what you mean by 
optimize. It reduces the number of places where 
vcpu_switch_to_aarch64_mode() is called, but there should be no 
difference in term of boot time.

> 
> Also, during Xen boot or by toolstack - the domain is always created 
> before it's type is even known, which, in turn,
> is based on guest binary which is parsed later during domain 
> configuration stage.

What you are describing is the current situation. But this doesn't tell 
me *why* we can't provide the type when the domain is created.

> 
> I can add note in commit message "This patch doesn't affect on the 
> toolstack Arm64 domain creation path as toolstack always
> re-configures domain mode and vcpus through XEN_DOMCTL_set_address_size 
> hypercall during domain configuration stage"

Well, as I wrote before, I find this code extremely fragile. And you so 
far, you don't seem to have address this concern in your reply. In fact...

> 
>>
>> If the desire is to make 32-bit domain optional on Arm64. Then I think 
>> it would be better to pass the domain type when the domain
>> is created (IOW add an extra flags to XEN_DOMCTL_createdomain). This 
>> will require more work, but it will be a lot more robust.

... I proposed what I think is a better alternative. Did you consider it?

Cheers,

-- 
Julien Grall


