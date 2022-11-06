Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4362B61E536
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 19:04:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438606.692630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ork0G-0000a1-2D; Sun, 06 Nov 2022 18:04:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438606.692630; Sun, 06 Nov 2022 18:04:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ork0F-0000WR-VI; Sun, 06 Nov 2022 18:04:15 +0000
Received: by outflank-mailman (input) for mailman id 438606;
 Sun, 06 Nov 2022 18:04:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ork0E-0000WL-DA
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 18:04:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ork0D-00057A-VU; Sun, 06 Nov 2022 18:04:13 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ork0D-00007h-Pb; Sun, 06 Nov 2022 18:04:13 +0000
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
	bh=ZiValLaWIOsdSp3F3gilONenW9lOAkkl5fbQrp6lERk=; b=w0Jjl/zi5EQ8x8DXzdw0GOio1J
	n6AKfKgYWGYEVqIJlWHJa2qkLnP+lFr1YT2PWwTPrcgeKodDYyBuGMzlS5WvRig4VuMwyF7gIlPca
	xvqsi47JEag6dkSKE7yYhN7lzhD4Fv6w0ZilkwNfhximG1EnukJ76B4cek4hqYhnbW9A=;
Message-ID: <5d369b95-f412-67b2-5c34-3cd317128ec3@xen.org>
Date: Sun, 6 Nov 2022 18:04:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [XEN v2 04/12] xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for
 AArch32
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-5-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221031151326.22634-5-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

In the title you are using AArch32 but below you are using...

On 31/10/2022 15:13, Ayan Kumar Halder wrote:
> v->arch.vmpidr is assigned to uint64_t variable. This is to enable left shifts
> for Aarch32 so that one can extract affinity bits.

... Aarch32. The naming also seem to be inconsistent across your series. 
AFAIU, it should be AArch32. So please look at all your commits and make 
sure you use the same everywhere.

> This is then assigned to 'typer' so that the affinity bits form the upper 32 bits.
> 
> Refer Arm IHI 0069H ID020922,
> The upper 32 bits of GICR_TYPER represent the affinity
> whereas the lower 32 bits represent the other bits (eg processor
> number, etc).
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Changes from :-
> 1. v1 - Assigned v->arch.vmpidr to "uint64_t vmpdir". Then, we can use
> MPIDR_AFFINITY_LEVEL macros to extract the affinity value.
> 
>   xen/arch/arm/vgic-v3.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 3f4509dcd3..e5e6f2c573 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -191,13 +191,15 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
>       case VREG64(GICR_TYPER):
>       {
>           uint64_t typer, aff;
> +        uint64_t vmpidr = v->arch.vmpidr;
>   
>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
> -        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
> +        aff = (MPIDR_AFFINITY_LEVEL(vmpidr, 3) << 56 |

Shouldn't we #ifdef this level for 32-bit? Or maybe check if the domain 
is 64-bit so we are using consistently regardless of the hypervisor bitness.

> +               MPIDR_AFFINITY_LEVEL(vmpidr, 2) << 48 |
> +               MPIDR_AFFINITY_LEVEL(vmpidr, 1) << 40 |
> +               MPIDR_AFFINITY_LEVEL(vmpidr, 0) << 32);
>           typer = aff;
> +

Spurious change?

>           /* We use the VCPU ID as the redistributor ID in bits[23:8] */
>           typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;
>   

Cheers,

-- 
Julien Grall

