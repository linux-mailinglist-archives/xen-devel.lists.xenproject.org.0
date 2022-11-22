Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B41634855
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 21:38:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447313.703409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxa1W-0000Vg-JQ; Tue, 22 Nov 2022 20:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447313.703409; Tue, 22 Nov 2022 20:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxa1W-0000TF-G7; Tue, 22 Nov 2022 20:37:42 +0000
Received: by outflank-mailman (input) for mailman id 447313;
 Tue, 22 Nov 2022 20:37:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oxa1V-0000T9-Pl
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 20:37:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxa1V-00088N-OO; Tue, 22 Nov 2022 20:37:41 +0000
Received: from [54.239.6.190] (helo=[192.168.0.48])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oxa1V-0004QI-Id; Tue, 22 Nov 2022 20:37:41 +0000
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
	bh=DZj+sP1IY8TVYZZuzv+uibHW8qcoRrER2k0n27teEmU=; b=W0Hs+QEAiRP1PBc6JGBZ95DS82
	OAVD+szbOxsN1FnHxM7tNyFsPijicUKCQElaoAe0W+e5kqRpxp5eG7Xg0HMWZE/cAj8OILJNkP4tK
	QsqRIqeJWt2hBFQU5Eu7lGBNmdWxaft9VqOi/yc8WR3B8Sd1ACTJgAqI0qVr/oLcwZ68=;
Message-ID: <52e12805-169b-0ffe-ab7c-192d31320194@xen.org>
Date: Tue, 22 Nov 2022 21:37:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [XEN v3 04/12] xen/Arm: vGICv3: Adapt emulation of GICR_TYPER for
 AArch32
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
 <20221111141739.2872-5-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221111141739.2872-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 11/11/2022 14:17, Ayan Kumar Halder wrote:
> Refer ARM DDI 0487I.a ID081822, G8-9650, G8.2.113
> Aff3 does not exist on AArch32.
> Also, refer ARM DDI 0406C.d ID040418, B4-1644, B4.1.106
> Aff3 does not exist on Armv7 (ie arm32).
> 
> Thus, access to aff3 have been contained within "#ifdef CONFIG_ARM_64".
> Also, v->arch.vmpidr is a 32 bit register on AArch32. So, we have copied it to
> 'uint64_t vmpidr' to perform the shifts.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changes from :-
> v1 - Assigned v->arch.vmpidr to "uint64_t vmpdir". Then, we can use
> MPIDR_AFFINITY_LEVEL macros to extract the affinity value.
> 
> v2 - 1. "MPIDR_AFFINITY_LEVEL(vmpidr, 3)" is contained within
> "#ifdef CONFIG_ARM_64".
> 2. Updated commit message.
> 
>   xen/arch/arm/vgic-v3.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 3f4509dcd3..a7a935ff57 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -191,12 +191,16 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
>       case VREG64(GICR_TYPER):
>       {
>           uint64_t typer, aff;
> +        uint64_t vmpidr = v->arch.vmpidr;

The type-widening here deserve an in-code comment. Otherwise, it would 
be easier for someone to decide to open-code v->arch.vmpidr again.

>   
>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
> -        aff = (MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 3) << 56 |
> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 2) << 48 |
> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 1) << 40 |
> -               MPIDR_AFFINITY_LEVEL(v->arch.vmpidr, 0) << 32);
> +        aff = (
> +#ifdef CONFIG_ARM_64
> +               MPIDR_AFFINITY_LEVEL(vmpidr, 3) << 56 |
> +#endif
> +               MPIDR_AFFINITY_LEVEL(vmpidr, 2) << 48 |
> +               MPIDR_AFFINITY_LEVEL(vmpidr, 1) << 40 |
> +               MPIDR_AFFINITY_LEVEL(vmpidr, 0) << 32);
>           typer = aff;
>           /* We use the VCPU ID as the redistributor ID in bits[23:8] */
>           typer |= v->vcpu_id << GICR_TYPER_PROC_NUM_SHIFT;

Cheers,

-- 
Julien Grall

