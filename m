Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D0641910
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 21:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452790.710591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1ZGZ-0002af-EM; Sat, 03 Dec 2022 20:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452790.710591; Sat, 03 Dec 2022 20:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1ZGZ-0002XY-Bc; Sat, 03 Dec 2022 20:37:43 +0000
Received: by outflank-mailman (input) for mailman id 452790;
 Sat, 03 Dec 2022 20:37:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1ZGY-0002XS-1Y
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 20:37:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1ZGX-00032o-Mh; Sat, 03 Dec 2022 20:37:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1ZGX-0002uA-Fv; Sat, 03 Dec 2022 20:37:41 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=Nnpc4dGHJ3rZ5Nks+j9E413nJCxYN1US/ORMe+qhpYs=; b=HXiC8USopD6dgzDlhIfiLMtKfX
	BJjde5b0Ev3LAYHbGcY5e8BHks9UK24nxzW+Xb464ZvV4GYSOw2DlSthJduk5jUUVzM7nU7Bn73Y1
	TOV0eSXnBXTkoMXbjF2QgPjtwE/I/u0VniKFxyJjWAzVOhjtVIdbEZSp7fOSMJ2ofFA0=;
Message-ID: <c56167cf-1a12-6910-ef19-825f94ed517b@xen.org>
Date: Sat, 3 Dec 2022 20:37:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
 <20221128155649.31386-11-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v4 10/11] xen/Arm: GICv3: Define macros to read/write 64 bit
In-Reply-To: <20221128155649.31386-11-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/11/2022 15:56, Ayan Kumar Halder wrote:
> On AArch32, ldrd/strd instructions are not atomic when used to access MMIO.
> Furthermore, ldrd/strd instructions are not decoded by Arm when running as
> a guest to access emulated MMIO region.
> Thus, we have defined readq_relaxed_non_atomic()/writeq_relaxed_non_atomic()
> which in turn calls readl_relaxed()/writel_relaxed() for the lower and upper
> 32 bits.
> For AArch64, readq_relaxed_non_atomic()/writeq_relaxed_non_atomic() invokes
> readq_relaxed()/writeq_relaxed() respectively.
> As GICv3 registers (GICD_IROUTER, GICR_TYPER) can be accessed in a non atomic
> manner, so we have used readq_relaxed_non_atomic()/writeq_relaxed_non_atomic().

I had another look at the code and I think there needs some 
clarification necessary because the accesses to IROUTER is non-obvious.

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from :-
> v1 - 1. Use ldrd/strd for readq_relaxed()/writeq_relaxed().
> 2. No need to use le64_to_cpu() as the returned byte order is already in cpu
> endianess.
> 
> v2 - 1. Replace {read/write}q_relaxed with {read/write}q_relaxed_non_atomic().
> 
> v3 - 1. Use inline function definitions for {read/write}q_relaxed_non_atomic().
> 2. For AArch64, {read/write}q_relaxed_non_atomic() should invoke {read/write}q_relaxed().
> Thus, we can avoid any ifdef in gic-v3.c.
> 
>   xen/arch/arm/gic-v3.c               |  6 +++---
>   xen/arch/arm/include/asm/arm32/io.h | 20 ++++++++++++++++++++
>   xen/arch/arm/include/asm/arm64/io.h |  2 ++
>   3 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 6457e7033c..3c5b88148c 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -651,7 +651,7 @@ static void __init gicv3_dist_init(void)
>       affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
>   
>       for ( i = NR_GIC_LOCAL_IRQS; i < nr_lines; i++ )
> -        writeq_relaxed(affinity, GICD + GICD_IROUTER + i * 8);
> +        writeq_relaxed_non_atomic(affinity, GICD + GICD_IROUTER + i * 8);

Using non atomic here makes sense because AFAIU the interrupt will be 
disabled. Therefore the GIC should not use the register.

>   }
>   
>   static int gicv3_enable_redist(void)
> @@ -745,7 +745,7 @@ static int __init gicv3_populate_rdist(void)
>           }
>   
>           do {
> -            typer = readq_relaxed(ptr + GICR_TYPER);
> +            typer = readq_relaxed_non_atomic(ptr + GICR_TYPER);

This non-atomic read is OK because GICR_TYPER is read-only.

>   
>               if ( (typer >> 32) == aff )
>               {
> @@ -1265,7 +1265,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *desc, const cpumask_t *mask)
>       affinity &= ~GICD_IROUTER_SPI_MODE_ANY;
>   
>       if ( desc->irq >= NR_GIC_LOCAL_IRQS )
> -        writeq_relaxed(affinity, (GICD + GICD_IROUTER + desc->irq * 8));
> +        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->irq * 8));

This can be called with interrupt enabled. So a non-atomic access means 
the GIC will see a transient value when only one of two 32-bit will be 
updated.

In practice this is fine because only Aff3 is so far defined in the top 
32-bits. So effectively, they will be RESS0 and never change.

Cheers,

-- 
Julien Grall

