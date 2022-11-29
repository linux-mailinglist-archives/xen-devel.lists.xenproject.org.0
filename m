Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5763863BC3A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Nov 2022 09:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449287.705953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozwOE-0000ov-Q4; Tue, 29 Nov 2022 08:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449287.705953; Tue, 29 Nov 2022 08:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozwOE-0000m9-Ms; Tue, 29 Nov 2022 08:54:54 +0000
Received: by outflank-mailman (input) for mailman id 449287;
 Tue, 29 Nov 2022 08:54:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ozwOD-0000m2-Ba
 for xen-devel@lists.xenproject.org; Tue, 29 Nov 2022 08:54:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ozwOC-0000qj-WB; Tue, 29 Nov 2022 08:54:52 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.9.110]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ozwOC-0007ms-Ps; Tue, 29 Nov 2022 08:54:52 +0000
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
	bh=FKpuNhwamOznxj+l8a+WVx+HIxpF2I3IgJaomIhb4U4=; b=bjcDkFuXQ0KgONv1hClCsj2kXA
	vLtxlvRHfQrHdeKdpVMX6gvG3UMyxiusrqC0ETfWS4waQofQzOdNjGCwEM+EvAGnWLVLnaOytkPy1
	Qa2XOr3/UEBFOefgJRrbGp6baeWOQspRQAN1qlkMDWkw2wjslM6mMD+IKLROKh7ocZO0=;
Message-ID: <5be1760a-fbbe-e9df-6752-4e73d7d963b8@xen.org>
Date: Tue, 29 Nov 2022 08:54:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/2] xen/arm: vpl011: drop redundancy in
 mmio_write/read
Content-Language: en-US
To: Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221129023935.1576133-1-jiamei.xie@arm.com>
 <20221129023935.1576133-3-jiamei.xie@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221129023935.1576133-3-jiamei.xie@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/11/2022 03:39, Jiamei Xie wrote:
> This commit is to drop redundancy in the function vpl011_mmio_write
> and vpl011_mmio_read:
> - In vpl011_mmio_read switch block, all cases have a return. So the
>    outside one can be removed.
> - Each switch case checks access by the same if statments. So we can
>    just use one and put it before the switch block.
> - The goto label bad_width and read_as_zero is used only once, put the
>    code directly
> 
> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
> ---
>   xen/arch/arm/vpl011.c | 66 +++++++++++++------------------------------
>   1 file changed, 19 insertions(+), 47 deletions(-)
> 
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 1bf803fc1f..80b859baed 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -354,11 +354,15 @@ static int vpl011_mmio_read(struct vcpu *v,
>       struct domain *d = v->domain;
>       unsigned long flags;
>   
> +    if ( !vpl011_reg32_check_access(dabt) ) {

As I pointed out in the previous version, we don't know the size of the 
registers for the one not described in the SBSA UART. So I don't think 
this check should be consolidated.

Also, coding style:

if ( .... )
{

> +        gprintk(XENLOG_ERR, "vpl011: bad read width %d r%d offset %#08x\n",
> +                dabt.size, dabt.reg, vpl011_reg);
> +        return 0;
> +    }
> +
>       switch ( vpl011_reg )
>       {
>       case DR:
> -        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
> -
>           if ( vpl011->backend_in_domain )
>               *r = vreg_reg32_extract(vpl011_read_data(d), info);
>           else
> @@ -366,31 +370,23 @@ static int vpl011_mmio_read(struct vcpu *v,
>           return 1;
>   
>       case RSR:
> -        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
> -
>           /* It always returns 0 as there are no physical errors. */
>           *r = 0;
>           return 1;
>   
>       case FR:
> -        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
> -
>           VPL011_LOCK(d, flags);
>           *r = vreg_reg32_extract(vpl011->uartfr, info);
>           VPL011_UNLOCK(d, flags);
>           return 1;
>   
>       case RIS:
> -        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
> -
>           VPL011_LOCK(d, flags);
>           *r = vreg_reg32_extract(vpl011->uartris, info);
>           VPL011_UNLOCK(d, flags);
>           return 1;
>   
>       case MIS:
> -        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
> -
>           VPL011_LOCK(d, flags);
>           *r = vreg_reg32_extract(vpl011->uartris & vpl011->uartimsc,
>                                   info);
> @@ -398,40 +394,25 @@ static int vpl011_mmio_read(struct vcpu *v,
>           return 1;
>   
>       case IMSC:
> -        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
> -
>           VPL011_LOCK(d, flags);
>           *r = vreg_reg32_extract(vpl011->uartimsc, info);
>           VPL011_UNLOCK(d, flags);
>           return 1;
>   
>       case ICR:
> -        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
> -
>           /* Only write is valid. */
>           return 0;
>   
>       default:
>           gprintk(XENLOG_ERR, "vpl011: unhandled read r%d offset %#08x\n",
>                   dabt.reg, vpl011_reg);
> -        goto read_as_zero;
> -    }
> -
> -    return 1;
> -
> -read_as_zero:

In general, we don't want to introduce and remove the same code within a 
series. If you don't want to keep read_as_zero, then you should not 
introduce it.

However... I think using the read_as_zero label could still be 
beneficial to reduce the numbers of lines where the registers are RAZ 
(e.g. default, RSR...).

> -    if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
> -
> -    VPL011_LOCK(d, flags);
> -    *r = 0;
> -    VPL011_UNLOCK(d, flags);
> -    return 1;
> -
> -bad_width:
> -    gprintk(XENLOG_ERR, "vpl011: bad read width %d r%d offset %#08x\n",
> -            dabt.size, dabt.reg, vpl011_reg);
> -    return 0;
>   
> +        /* Read as zero */
> +        VPL011_LOCK(d, flags);
> +        *r = 0;
> +        VPL011_UNLOCK(d, flags);
> +        return 1;
> +    }
>   }
>   
>   static int vpl011_mmio_write(struct vcpu *v,
> @@ -446,14 +427,18 @@ static int vpl011_mmio_write(struct vcpu *v,
>       struct domain *d = v->domain;
>       unsigned long flags;
>   
> -    switch ( vpl011_reg )
> +   if ( !vpl011_reg32_check_access(dabt) ) {
> +       gprintk(XENLOG_ERR, "vpl011: bad write width %d r%d offset %#08x\n",
> +               dabt.size, dabt.reg, vpl011_reg);
> +       return 0;
> +   }

Same remarks as for the read part.

> +
> +   switch ( vpl011_reg )
>       {
>       case DR:
>       {
>           uint32_t data = 0;
>   
> -        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
> -
>           vreg_reg32_update(&data, r, info);
>           data &= 0xFF;
>           if ( vpl011->backend_in_domain )
> @@ -464,8 +449,6 @@ static int vpl011_mmio_write(struct vcpu *v,
>       }
>   
>       case RSR: /* Nothing to clear. */
> -        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
> -
>           return 1;
>   
>       case FR:
> @@ -474,8 +457,6 @@ static int vpl011_mmio_write(struct vcpu *v,
>           goto write_ignore;
>   
>       case IMSC:
> -        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
> -
>           VPL011_LOCK(d, flags);
>           vreg_reg32_update(&vpl011->uartimsc, r, info);
>           vpl011_update_interrupt_status(v->domain);
> @@ -483,8 +464,6 @@ static int vpl011_mmio_write(struct vcpu *v,
>           return 1;
>   
>       case ICR:
> -        if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
> -
>           VPL011_LOCK(d, flags);
>           vreg_reg32_clearbits(&vpl011->uartris, r, info);
>           vpl011_update_interrupt_status(d);
> @@ -498,14 +477,7 @@ static int vpl011_mmio_write(struct vcpu *v,
>       }
>   
>   write_ignore:
> -    if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
>       return 1;
> -
> -bad_width:
> -    gprintk(XENLOG_ERR, "vpl011: bad write width %d r%d offset %#08x\n",
> -            dabt.size, dabt.reg, vpl011_reg);
> -    return 0;
> -
>   }
>   
>   static const struct mmio_handler_ops vpl011_mmio_handler = {

-- 
Julien Grall

