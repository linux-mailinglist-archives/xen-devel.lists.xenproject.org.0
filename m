Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 752CBACD016
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 01:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004935.1384591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMacP-0008Di-EU; Tue, 03 Jun 2025 23:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004935.1384591; Tue, 03 Jun 2025 23:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMacP-0008BY-BQ; Tue, 03 Jun 2025 23:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1004935;
 Tue, 03 Jun 2025 23:00:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uMacO-0008BS-IG
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 23:00:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMacO-000R5i-0M;
 Tue, 03 Jun 2025 23:00:28 +0000
Received: from [2a02:8012:3a1:0:7807:532b:1d1d:b850]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMacO-009wnI-0c;
 Tue, 03 Jun 2025 23:00:27 +0000
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
	bh=5DfUmcGB0M7LIleky9dThIr14kX51+jSAz9lKoqmbx0=; b=WtR4nFoUJOdRgq7jxPtmD/R2Br
	fVir5qRqdQMfg6Xnll4oL+pbSfhXgHhvFOeG64OIerzNWqIozIOGVcVyGZfau9Hf2ocCyMz2T2ar7
	5RNENTVJYgqM7FRdhgntJF1BERb73uFd4X8SADKlAVL5LupibmVLopKYi3PCiVixmTX4=;
Message-ID: <abf5da3e-8e5b-4159-98d4-60bf90672c2c@xen.org>
Date: Wed, 4 Jun 2025 00:00:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4][PART 1 2/4] xen/arm: Implement PSCI SYSTEM_SUSPEND
 call for guests
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1748337249.git.mykola_kvach@epam.com>
 <1a8313537603bee36636b0fcd2fdc2f76a2374fb.1748337249.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1a8313537603bee36636b0fcd2fdc2f76a2374fb.1748337249.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 27/05/2025 10:18, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> This patch adds support for the PSCI SYSTEM_SUSPEND function in the vPSCI
> (virtual PSCI) interface, allowing guests to request suspend via the PSCI
> v1.0 SYSTEM_SUSPEND call (both 32-bit and 64-bit variants).
> 
> The implementation:
> - Adds SYSTEM_SUSPEND function IDs to PSCI definitions
> - Implements trapping and handling of SYSTEM_SUSPEND in vPSCI
> - Allows only non-hardware domains to invoke SYSTEM_SUSPEND; for the
>    hardware domain, PSCI_NOT_SUPPORTED is returned to avoid halting the
>    system in hwdom_shutdown() called from domain_shutdown
> - Ensures all secondary VCPUs of the calling domain are offline before
>    allowing suspend due to PSCI spec
> - Treats suspend as a "standby" operation: the domain is shut down with
>    SHUTDOWN_suspend, and resumes execution at the instruction following
>    the call

Looking at the specification, I am still not convinced you can implement 
PSCI SUSPEND as a NOP. For instance, in the section "5.1.19 
SYSTEM_SUSPEND", the wording implies the call cannot return when it is 
successul.

I understand that 5.20.2 ("Caller reponsabilities" for SYSTEM_SUSPEND) 
suggests the caller should apply all the rules from 5.4 ("Caller 
responsabilties" for CPU_SUSPEND), but it is also mentioned that 
SYSTEM_SUSPEND behave as the deepest power down state.

So I don't think standby is an option. I would like an opinion from the 
other maintainers.

> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
 > +{> +    struct vcpu *v;
> +    struct domain *d = current->domain;
> +
> +    /* Drop this check once SYSTEM_SUSPEND is supported in hardware domain */
> +    if ( is_hardware_domain(d) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v != current && is_vcpu_online(v) )

I think this is racy because you can still turn on a vCPU afterwards 
from a vCPU you haven't checked.

Did you add this check just to follow the specification, or is there any 
other problem in Xen?

> +            return PSCI_DENIED;
 > +    }> +
> +    /*
> +     * System suspend requests are treated as performing standby
> +     * as this simplifies Xen implementation.
> +     *
> +     * Arm Power State Coordination Interface (DEN0022F.b)

This comment is a bit too verbose. There is no need to copy/paste the 
specification. You can just write a couple of sentence with link to the 
specification.

Cheers,

-- 
Julien Grall


