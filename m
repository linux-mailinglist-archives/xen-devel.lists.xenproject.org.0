Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1CD5818BE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 19:44:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375631.608076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGObg-0006Zv-TE; Tue, 26 Jul 2022 17:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375631.608076; Tue, 26 Jul 2022 17:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGObg-0006Y0-QP; Tue, 26 Jul 2022 17:44:32 +0000
Received: by outflank-mailman (input) for mailman id 375631;
 Tue, 26 Jul 2022 17:44:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oGObf-0006Xu-1g
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 17:44:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGObe-00060M-Ml; Tue, 26 Jul 2022 17:44:30 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.7.237.34])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oGObe-0006BE-G1; Tue, 26 Jul 2022 17:44:30 +0000
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
	References:Cc:To:Subject:From:MIME-Version:Date:Message-ID;
	bh=JtrIj46UVhxRXI8fxuylATUFcBOimi8VcUTEXe6VWG0=; b=avppsieiLCSOAOLtd/wUBno+X+
	Qkwem6CDXIJ0rP1Eo5VQED468Y5oCKiQ2+esbr9IbIdNdpt/O3fIYBmIZWGaaP55P2BawpQL8Cxxz
	XO0i+HBbhGM8cZFdSplzVqrV5yxK4Tb19/8jR5WWcWmfDjFlY5lVnfLBa8perixW2eZc=;
Message-ID: <b19be266-82f5-eb14-36df-14a5b21b40bc@xen.org>
Date: Tue, 26 Jul 2022 18:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] arm/vgic-v3: fix virq offset in the rank
To: Hongda Deng <Hongda.Deng@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220715104620.3929121-1-Hongda.Deng@arm.com>
In-Reply-To: <20220715104620.3929121-1-Hongda.Deng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Title: I would suggest to mention the irouter in the title.

On 15/07/2022 11:46, Hongda Deng wrote:
> When vgic performs irouter registers emulation, to get the target vCPU
> via virq conveniently, Xen doesn't store the irouter value directly,
> instead it will use the value (affinities) in irouter to calculate the
> target vCPU, and then save the target vCPU in irq rank->vCPU[offset].

NIT: The field is technically called "vcpu".

> But there seems to be a bug in the way the offset is calculated when
> vgic tries to store irouter.

NIT: I would drop this sentence because below you suggest this is a bug.

> 
> When vgic tries to get the target vcpu, it first calculates the target

Typo: When the vGIC...

> vcpu index via
>    int target = read_atomic(&rank->vcpu[virq & INTERRUPT_RANK_MASK]);
> and then get the target vcpu via
>    v->domain->vcpu[target];
> 
> When vgic tries to store irouter for one virq, the target vcpu index
> in the rank is got via
>    offset &= virq & INTERRUPT_RANK_MASK;
> finally it gets the target vcpu via
>    d->vcpu[read_atomic(&rank->vcpu[offset])];
> 
> There is a difference between them when gets the target vcpu index in
> the rank.

Typo: I think you mean 'getting' rather than 'gets'.

> 
> Here (virq & INTERRUPT_RANK_MASK) would already get the  target vcpu
> index in the rank, so we don't need the '&' before '=' when calculate
> the offset.

This is a bit confusing to read. Through the commit message you give mix 
information about the issue. "don't need" to me means this is pointless 
but harmless. But then a bit below, you write this is a bug.

I would suggest to change the order with the next paragraph (it may need 
some tweaks) and replace the "don't need" with something more assertive.

> For example, the target vcpu index in the rank should be 6 for virq 38,
> but vgic will get offset=0 when vgic stores the irouter for this virq,
> and finally vgic will access wrong target vcpu index in the rank when
> it updates the irouter.
> 
> Fixes: 5d495f4349b5 ("xen/arm: vgic: Optimize the way to store the target vCPU in the rank")
> Signed-off-by: Hongda Deng <Hongda.Deng@arm.com>
> ---
>   xen/arch/arm/vgic-v3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index e4ba9a6476..7fb99a9ff2 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -135,7 +135,7 @@ static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *rank,
>       ASSERT(virq >= 32);
>   
>       /* Get the index in the rank */
> -    offset &= virq & INTERRUPT_RANK_MASK;
> +    offset = virq & INTERRUPT_RANK_MASK;

AFAICT, vgic_fetch_irouter() has the same problem. Can you update it 
here as well?

>   
>       new_vcpu = vgic_v3_irouter_to_vcpu(d, irouter);
>       old_vcpu = d->vcpu[read_atomic(&rank->vcpu[offset])];

Cheers,

-- 
Julien Grall

