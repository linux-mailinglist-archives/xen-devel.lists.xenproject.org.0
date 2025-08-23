Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92975B32C15
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 23:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091510.1448055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upvl3-0001qT-Eq; Sat, 23 Aug 2025 21:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091510.1448055; Sat, 23 Aug 2025 21:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upvl3-0001q2-BC; Sat, 23 Aug 2025 21:26:41 +0000
Received: by outflank-mailman (input) for mailman id 1091510;
 Sat, 23 Aug 2025 21:26:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1upvl1-0001pw-Nv
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 21:26:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1upvl0-002foq-1O;
 Sat, 23 Aug 2025 21:26:38 +0000
Received: from [2a02:8012:3a1:0:7444:6df7:db1a:3c76]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1upvl0-00FOPB-14;
 Sat, 23 Aug 2025 21:26:38 +0000
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
	bh=z12BoBzrEOWnAG4SLZxw2+JDuJwgr4WGrZplPWd6FQ0=; b=k78fUBnLENqC8gZafS7Ly7mHUi
	AWyHvXFv09wuqCS3UpTwnm1/y3U/7nSwH4KY+3B+MzcpmnDyFBpsQOlcHlHmgNzogORfgri6xFdeH
	qAnl6zKicnJ0dPR5kI9nF7+sOBYH2vrxsHTPORs8A6V031Mszv3D6A/gvTIv8IMfkbMc=;
Message-ID: <9ab99307-9594-4cbc-9c7a-b1221575d41c@xen.org>
Date: Sat, 23 Aug 2025 22:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1755506449.git.mykola_kvach@epam.com>
 <205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <205b2b354ff1d34d0e9ec4777ca3c94492f6d9d1.1755506449.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 18/08/2025 09:49, Mykola Kvach wrote:
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
> 
> GIC and virtual timer context must be saved when the domain suspends.

Can you expand a bit more on this? Is this a requirement from the Arm 
Arm? If so, please specify the specification so we can easily check.

> This is done by moving the respective code in ctxt_switch_from
> before the return that happens if the domain suspended.

 From the commit message, it is unclear why we want to skip the save part.

[...]

> ---
>   xen/arch/arm/domain.c                 |  17 +++--
>   xen/arch/arm/include/asm/perfc_defn.h |   1 +
>   xen/arch/arm/include/asm/psci.h       |   2 +
>   xen/arch/arm/include/asm/vpsci.h      |   2 +-
>   xen/arch/arm/vpsci.c                  | 101 ++++++++++++++++++++++----
>   xen/common/domain.c                   |  31 ++++++--
>   xen/include/xen/sched.h               |   6 ++
>   7 files changed, 131 insertions(+), 29 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 310c578909..9e9649c4e2 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -90,6 +90,16 @@ static void ctxt_switch_from(struct vcpu *p)
>       if ( is_idle_vcpu(p) )
>           return;
>   

It would be good to have a comment explaining what (and why) we need to 
save only partially the state while the VCPU is suspended.

> +    /* Arch timer */
> +    p->arch.cntkctl = READ_SYSREG(CNTKCTL_EL1);
> +    virt_timer_save(p);
> +
> +    /* VGIC */
> +    gic_save_state(p);
> +
> +    if ( test_bit(_VPF_suspended, &p->pause_flags) )
> +        return;

Can you explain why we don't need an isb()?

> +
>       p2m_save_state(p);
At least part of p2m_save_state() can't be skipped because it is 
applying a workaround on platform where AT mistakenly speculate.

[...]

>   
> +static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
> +{
> +    int32_t rc;
> +    struct vcpu *v;
> +    struct domain *d = current->domain;
> +
> +    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
> +    if ( is_hardware_domain(d) )
> +        return PSCI_NOT_SUPPORTED;
> +
> +    /* Ensure that all CPUs other than the calling one are offline */
> +    domain_lock(d);
> +    for_each_vcpu ( d, v )
> +    {
> +        if ( v != current && is_vcpu_online(v) )
> +        {
> +            domain_unlock(d);
> +            return PSCI_DENIED;
> +        }
> +    }
> +    domain_unlock(d);
> +
> +    rc = domain_shutdown(d, SHUTDOWN_suspend);
> +    if ( rc )
> +        return PSCI_DENIED;
> +
> +    rc = do_setup_vcpu_ctx(current, epoint, cid);
> +    if ( rc != PSCI_SUCCESS )
> +    {
> +        domain_resume_nopause(d);
> +        return rc;
> +    }
> +
> +    set_bit(_VPF_suspended, &current->pause_flags);
> +
> +    dprintk(XENLOG_DEBUG,

I think you should use gdprintk() which will print the domain for you as 
well as appropriately ratelimit the message.

That said, I would consider using gprintk() so the message can also be 
printed in a debug build.

> +            "Dom %u: SYSTEM_SUSPEND requested, epoint=%#lx, cid=%#lx\n",

For both of them you technically want to use PRIregister rather than lx.

Lastly, we prefer to use %pd when printing a domain. The argument is 
'd'. But this should not be necessary if you use gprintk().


> +            d->domain_id, epoint, cid);
> +
> +    return rc;
> +}
> +
>   static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>   {
>       /* /!\ Ordered by function ID and not name */
> @@ -214,6 +267,8 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
>       case PSCI_0_2_FN32_SYSTEM_OFF:
>       case PSCI_0_2_FN32_SYSTEM_RESET:
>       case PSCI_1_0_FN32_PSCI_FEATURES:
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
>       case ARM_SMCCC_VERSION_FID:
>           return 0;
>       default:
> @@ -344,6 +399,24 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
>           return true;
>       }
>   
> +    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
> +    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
> +    {
> +        register_t epoint = PSCI_ARG(regs, 1);
> +        register_t cid = PSCI_ARG(regs, 2);
> +
> +        if ( is_64bit_domain(current->domain) &&

Shouldn't this be removed so the check also apply for 32-bit domain on 
64-bit system?

> +             fid == PSCI_1_0_FN32_SYSTEM_SUSPEND )
 > +        {> +            epoint &= GENMASK(31, 0);
> +            cid &= GENMASK(31, 0);
> +        }
> +
> +        perfc_incr(vpsci_system_suspend);
> +        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
> +        return true;
> +    }
> +
>       default:
>           return false;
>       }
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 5241a1629e..624c3e2c27 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1343,16 +1343,13 @@ int domain_shutdown(struct domain *d, u8 reason)
>       return 0;
>   }
>   
> -void domain_resume(struct domain *d)
> +#ifndef CONFIG_ARM
> +static
> +#endif

I am not sure who suggests this but personally, I dislike using 
CONFIG_<ARCH> in common code. I also think this is worse for hiding the 
"static" keyword.

For the latter, I think it would be better to provide a separate helper 
that can be #ifdef.

[...]

Cheers,

-- 
Julien Grall


