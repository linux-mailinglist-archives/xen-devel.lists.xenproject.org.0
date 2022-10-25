Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8635B60D4ED
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 21:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430144.681552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onPuh-0006iv-19; Tue, 25 Oct 2022 19:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430144.681552; Tue, 25 Oct 2022 19:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onPug-0006gE-Uh; Tue, 25 Oct 2022 19:48:38 +0000
Received: by outflank-mailman (input) for mailman id 430144;
 Tue, 25 Oct 2022 19:48:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1onPuf-0006g8-LM
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 19:48:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onPuf-0002LX-8h; Tue, 25 Oct 2022 19:48:37 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.95.108.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onPuf-0005R2-1w; Tue, 25 Oct 2022 19:48:37 +0000
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
	bh=HyKX2X5AbVI4lXeJdF7U76LdYRafzpFX7WSZnX6n7x0=; b=5Vh89y1j2+vWMOEug3u3yvO8Jt
	RS9jAt3A5oMuWfmaSERiOl6TsYuYX24aTqjEv2bDRTOv6PkmLGabS6iog/sutS7P+HpTpkuYw90gs
	uirPrJ9TMeAU8LWiVfBzVCESPAjrYynBEJ32YQv0nUmAXdRhaBB5dKDN0TA8kYw1YVNQ=;
Message-ID: <05c469e9-8d9a-76ac-016b-400b550dbb68@xen.org>
Date: Tue, 25 Oct 2022 20:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [XEN v2] GICv3: Emulate GICR_PENDBASER correctly for 32 bit
 guests
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, andre.przywara@arm.com,
 Henry Wang <Henry.Wang@arm.com>
References: <20221024193002.57888-1-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221024193002.57888-1-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+Henry)

Hi Ayan,

Adding Henry because this is something we probably want to fix in Xen 
4.17. AFAIU, the value is not used at all in Xen, so the risk is mostly 
returning a wrong value to a domain using GICv3 ITS (not officially 
supported and only expose to dom0 so far). Therefore, I would say this 
should be OK to ingest in Xen 4.17.

Anyway back to the review...

Title: Technically a 64-bit guest is equally affected because it is 
allowed to do 32-bit access. Furthermore, I would prefer if you prefix 
the title with "xen/arm" so it is clear which component you are 
touching. So I would suggest the following title:

xen/arm: vGICv3: Emulate properly 32-bit access on GICR_PENDBASER

Note that I appended a "v" to "GICv3" to make clear this is referring to 
the virtual GICv3 rather than host GICv3.

On 24/10/2022 20:30, Ayan Kumar Halder wrote:
> If a guest is running in 32 bit mode and it tries to access
> "GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. vreg_reg64_extract()
> will return the value stored "v->arch.vgic.rdist_pendbase + 4".
> This will be stored in a 32bit register.

Not really, the result will be stored in a 64-bit register for AArch64 
host (even if for 32-bit guest). The main part is the top 32-bit of 
PENDBASER will be returned in the low 32-bit.

> 
> The 32bit register is then modified bitwise with a mask (ie GICR_PENDBASER_PTZ,
> it clears the 62nd bit) which is greater than 32 bits. This will give an
> incorrect result.

I would be explicit and say that "the bit PTZ will not be cleared as 
expected by the specification".

> 
> The correct thing to do here is to store the value of
> "v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This variable is
> then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
> vreg_reg64_extract() which will extract 32 bits from the given offset.
> 
> Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and property tables")
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Changes from:-
> 
> v1 - 1. Extracted this fix from "[RFC PATCH v1 05/12] Arm: GICv3: Emulate
> GICR_PENDBASER and GICR_PROPBASER on AArch32" into a separate patch with an
> appropriate commit message.
> 
>   xen/arch/arm/vgic-v3.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 0c23f6df9d..7930ab6330 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -250,14 +250,16 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
>       case VREG64(GICR_PENDBASER):
>       {
>           unsigned long flags;
> +        uint64_t val;
>   
>           if ( !v->domain->arch.vgic.has_its )
>               goto read_as_zero_64;
>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>   
>           spin_lock_irqsave(&v->arch.vgic.lock, flags);
> -        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
> -        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
> +        val = v->arch.vgic.rdist_pendbase;
> +        val &= ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
> +        *r = vreg_reg64_extract(val, info);

As you store v->arch.vgic.rdist_pendbase, the lock can be reduced to the 
first assignment. IOW:

val = v->arch....;
spin_unlock_irq_restore();
val &= ~GIC_PENDBASER_PTZ;

That said, I think the lock could now be completely dropped in favor of 
using read_atomic() (and write_atomic()).

I am saying this even with in mind that, IIUC, R52 may not support 
64-bit atomics (see [1]). There are a few places in Xen that expect 
64-bit access to be atomic. For instance the IOREQ code is using 
guest_cmpxchg64() and a 32-build of Xen with the "case 8" commented 
write_atomic_size() will fail. So there are some rework necessary for R52.

I would also rather not want to keep a bigger hammer (i.e. the lock) for 
architecture that support 64-bit atomic access.

Cheers,

[1] 20221025145506.5708839c@donnerap.cambridge.arm.com

-- 
Julien Grall

