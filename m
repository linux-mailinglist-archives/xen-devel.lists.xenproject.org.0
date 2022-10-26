Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1630B60E25B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 15:41:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430591.682458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongf4-0000c2-Q7; Wed, 26 Oct 2022 13:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430591.682458; Wed, 26 Oct 2022 13:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongf4-0000YU-N9; Wed, 26 Oct 2022 13:41:38 +0000
Received: by outflank-mailman (input) for mailman id 430591;
 Wed, 26 Oct 2022 13:41:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ongf4-0000YO-1p
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 13:41:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ongf3-0003rs-MS; Wed, 26 Oct 2022 13:41:37 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.28.184]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ongf3-0005tg-Fj; Wed, 26 Oct 2022 13:41:37 +0000
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
	bh=ikrKre8zf6ff2/vdwgDK7M0P68hkRUB3XwKF9qbYtPQ=; b=NMcvqxyXP6okrWJ3lDVE3Shnx9
	cfUjb9ixyOtGgnT0OSe7kHJkiuKqpZkMjndzqCH4+5QR2pXJuR+bsaF0xU2llO3fd2CIy1KQjse/n
	jL6lsoAklN2d8/ZrRwBoaLJJNHDDBz693SHyMm/ZTJNFG6Evkb+9e8cVANLj0V9mr/Lw=;
Message-ID: <95d0a8ca-9ff0-162a-02ae-8cbdc30af8b9@xen.org>
Date: Wed, 26 Oct 2022 14:41:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v3] xen/arm: vGICv3: Emulate properly 32-bit access on
 GICR_PENDBASER
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com, Henry.Wang@arm.com
References: <20221026133540.52191-1-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221026133540.52191-1-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 26/10/2022 14:35, Ayan Kumar Halder wrote:
> If a guest is running in 32 bit mode and it tries to access
> "GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. vreg_reg64_extract()
> will return the value stored "v->arch.vgic.rdist_pendbase + 4".
> This will be stored in a 64bit cpu register.
 >
> So now we have the top 32 bits of GICR_PENDBASER (a 64 bit MMIO register) stored
> in the lower 32 bits of the 64bit cpu register.
> 
> This 64bit cpu register is then modified bitwise with a mask (ie
> GICR_PENDBASER_PTZ, it clears the 62nd bit). But the PTZ (which is bit 30 in the
> 64 bit cpu register) is not cleared as expected by the specification.
> 
> The correct thing to do here is to store the value of
> "v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This variable is
> then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
> vreg_reg64_extract() which will extract 32 bits from the given offset.
> 
> Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and property tables")
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Given the changes you made below, the reviewed-by tags below should not 
have been retained.

> Release-acked-by: Henry Wang <Henry.Wang@arm.com>
> ---
> 
> Changes from:-
> 
> v1 - 1. Extracted this fix from "[RFC PATCH v1 05/12] Arm: GICv3: Emulate
> GICR_PENDBASER and GICR_PROPBASER on AArch32" into a separate patch with an
> appropriate commit message.
> 
> v2 - 1. Removed spin_lock_irqsave(). Used read_atomic() to read
> v->arch.vgic.rdist_pendbase in an atomic context.

Please in the commit message why the lock is removed. But...

> 2. Rectified the commit message to state that the cpu register is 64 bit.
> (because currently, GICv3 is supported on Arm64 only). Reworded to make it
> clear.
> 
>   xen/arch/arm/vgic-v3.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 0c23f6df9d..958af1532e 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -249,16 +249,16 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
>   
>       case VREG64(GICR_PENDBASER):
>       {
> -        unsigned long flags;
> +        uint64_t val;
>   
>           if ( !v->domain->arch.vgic.has_its )
>               goto read_as_zero_64;
>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>   
> -        spin_lock_irqsave(&v->arch.vgic.lock, flags);
> -        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
> -        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
> -        spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
> +        val = read_atomic(&v->arch.vgic.rdist_pendbase);

... you also need to ensure that the writers are atomically setting 
rdist_pendbase. Please correct if I am wrong, but the callers are not 
using write_atomic(). So how does that work?

Cheers,

-- 
Julien Grall

