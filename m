Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8448D36C204
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 11:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118215.224255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbKI1-0000R1-3A; Tue, 27 Apr 2021 09:45:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118215.224255; Tue, 27 Apr 2021 09:45:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbKI1-0000Qc-04; Tue, 27 Apr 2021 09:45:57 +0000
Received: by outflank-mailman (input) for mailman id 118215;
 Tue, 27 Apr 2021 09:45:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbKHz-0000QK-E7
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 09:45:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbKHy-000455-0l; Tue, 27 Apr 2021 09:45:54 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbKHx-0003cO-Qg; Tue, 27 Apr 2021 09:45:53 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Gcce72EVWykg8tKTLN8YcyZiUqvztOHg30hiE6nG67g=; b=eHLTY6ONMb/9I39mkudpZ/+Ucg
	SpkrZlp37O4aLvYjViMq6QMKfzJaencQz/vslfZzA+XsvLwp5dYfm5ABSj8J+1MyCMifZ0Y7TcbHJ
	oOnNKbB81z0jaxlkjXgYu66DxCiWisK83AaX9Hpy58AGT8IFRelXVRugCnyWtJup8Njg=;
Subject: Re: [PATCH v2 02/10] arm/domain: Get rid of READ/WRITE_SYSREG32
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210427093546.30703-1-michal.orzel@arm.com>
 <20210427093546.30703-3-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <718ea929-edd0-1a30-65f2-f3d0ca17756b@xen.org>
Date: Tue, 27 Apr 2021 10:45:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427093546.30703-3-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 27/04/2021 10:35, Michal Orzel wrote:
> AArch64 registers are 64bit whereas AArch32 registers
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
> We should also use register_t type when reading sysregs
> which can correspond to uint64_t or uint32_t.
> Even though many AArch64 registers have upper 32bit reserved
> it does not mean that they can't be widen in the future.
> 
> Modify type of register cntkctl to register_t.
> Modify accesses to thumbee registers to use READ/WRITE_SYSREG.
> No need to change type of thumbee registers to register_t as they
> only exist on arm32.

This is a bit ambiguous, I think in this context you mean it is only 
usable by 32-bit domain but should really be only accessed on Armv7 as 
they were restrospectively dropped on Armv8.

> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
> Changes since v1:
> -Move modification of ACTLR into seperate patch
> ---
>   xen/arch/arm/domain.c        | 18 +++++++++---------
>   xen/include/asm-arm/domain.h |  2 +-
>   2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index bdd3d3e5b5..621f518b83 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -113,13 +113,13 @@ static void ctxt_switch_from(struct vcpu *p)
>       p->arch.tpidr_el1 = READ_SYSREG(TPIDR_EL1);
>   
>       /* Arch timer */
> -    p->arch.cntkctl = READ_SYSREG32(CNTKCTL_EL1);
> +    p->arch.cntkctl = READ_SYSREG(CNTKCTL_EL1);
>       virt_timer_save(p);
>   
>       if ( is_32bit_domain(p->domain) && cpu_has_thumbee )
>       {
> -        p->arch.teecr = READ_SYSREG32(TEECR32_EL1);
> -        p->arch.teehbr = READ_SYSREG32(TEEHBR32_EL1);
> +        p->arch.teecr = READ_SYSREG(TEECR32_EL1);
> +        p->arch.teehbr = READ_SYSREG(TEEHBR32_EL1);
>       }
>   
>   #ifdef CONFIG_ARM_32
> @@ -175,7 +175,7 @@ static void ctxt_switch_from(struct vcpu *p)
>   
>   static void ctxt_switch_to(struct vcpu *n)
>   {
> -    uint32_t vpidr;
> +    register_t vpidr;
>   
>       /* When the idle VCPU is running, Xen will always stay in hypervisor
>        * mode. Therefore we don't need to restore the context of an idle VCPU.
> @@ -183,8 +183,8 @@ static void ctxt_switch_to(struct vcpu *n)
>       if ( is_idle_vcpu(n) )
>           return;
>   
> -    vpidr = READ_SYSREG32(MIDR_EL1);
> -    WRITE_SYSREG32(vpidr, VPIDR_EL2);
> +    vpidr = READ_SYSREG(MIDR_EL1);
> +    WRITE_SYSREG(vpidr, VPIDR_EL2);
>       WRITE_SYSREG(n->arch.vmpidr, VMPIDR_EL2);
>   
>       /* VGIC */
> @@ -257,8 +257,8 @@ static void ctxt_switch_to(struct vcpu *n)
>   
>       if ( is_32bit_domain(n->domain) && cpu_has_thumbee )
>       {
> -        WRITE_SYSREG32(n->arch.teecr, TEECR32_EL1);
> -        WRITE_SYSREG32(n->arch.teehbr, TEEHBR32_EL1);
> +        WRITE_SYSREG(n->arch.teecr, TEECR32_EL1);
> +        WRITE_SYSREG(n->arch.teehbr, TEEHBR32_EL1);
>       }
>   
>   #ifdef CONFIG_ARM_32
> @@ -274,7 +274,7 @@ static void ctxt_switch_to(struct vcpu *n)
>   
>       /* This is could trigger an hardware interrupt from the virtual
>        * timer. The interrupt needs to be injected into the guest. */
> -    WRITE_SYSREG32(n->arch.cntkctl, CNTKCTL_EL1);
> +    WRITE_SYSREG(n->arch.cntkctl, CNTKCTL_EL1);
>       virt_timer_restore(n);
>   }
>   
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 0a74df9931..c6b59ee755 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -190,7 +190,7 @@ struct arch_vcpu
>       struct vgic_cpu vgic;
>   
>       /* Timer registers  */
> -    uint32_t cntkctl;
> +    register_t cntkctl;
>   
>       struct vtimer phys_timer;
>       struct vtimer virt_timer;
> 

-- 
Julien Grall

