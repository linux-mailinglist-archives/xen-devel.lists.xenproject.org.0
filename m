Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD3F5888A5
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 10:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379647.613265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9bR-0003X2-Jk; Wed, 03 Aug 2022 08:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379647.613265; Wed, 03 Aug 2022 08:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJ9bR-0003UN-GW; Wed, 03 Aug 2022 08:19:41 +0000
Received: by outflank-mailman (input) for mailman id 379647;
 Wed, 03 Aug 2022 08:19:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJ9bP-0003UH-Qi
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 08:19:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJ9bP-0003Cx-IM; Wed, 03 Aug 2022 08:19:39 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.5.217]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJ9bP-0006do-CB; Wed, 03 Aug 2022 08:19:39 +0000
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
	bh=HNvomNy+G0v+YCiiE3pc+mZ0HujE6WnAtTFBwnTEKtg=; b=B05LM//qM1naHm2FypoOdRqEGe
	2ppWQsvMDwwZYdAYSWgqXeJj+qjeN+MRmVBKHTMVdm0zWb2bEEC9A+yq82/XjNXHT8tJXlKRDAlzd
	oBuoTWtKHgQuKHJs5LQa3ZcpwxruWgeAGzPSkA8d0/VjkM6+Dt9AOrxoBEN6VV3TfoSs=;
Message-ID: <f3d19d31-6e91-44c6-5233-9cc8ecc569f2@xen.org>
Date: Wed, 3 Aug 2022 09:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v2] arm/vgic-v3: fix virq offset in the rank when storing
 irouter
Content-Language: en-US
To: Hongda Deng <Hongda.Deng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220729083602.390484-1-Hongda.Deng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220729083602.390484-1-Hongda.Deng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hongda,

On 29/07/2022 09:36, Hongda Deng wrote:
> When vGIC performs irouter registers emulation, to get the target vCPU
> via virq conveniently, Xen doesn't store the irouter value directly,
> instead it will use the value (affinities) in irouter to calculate the
> target vCPU, and then save the target vCPU in irq rank->vcpu[offset].
> 
> When vGIC tries to get the target vCPU, it first calculates the target
> vCPU index via
>    int target = read_atomic(&rank->vcpu[virq & INTERRUPT_RANK_MASK]);
> and then it gets the target vCPU via
>    v->domain->vcpu[target];
> 
> When vGIC tries to store irouter for one virq, the target vCPU index
> in the rank is computed as
>    offset &= virq & INTERRUPT_RANK_MASK;
> finally it gets the target vCPU via
>    d->vcpu[read_atomic(&rank->vcpu[offset])];
> 
> There is a difference between them while getting the target vCPU index
> in the rank. Actually (virq & INTERRUPT_RANK_MASK) would already get
> the target vCPU index in the rank, it's wrong to add '&' before '=' when
> calculate the offset.
> 
> For example, the target vCPU index in the rank should be 6 for virq 38,
> but vGIC will get offset=0 when vGIC stores the irouter for this virq,
> and finally vGIC will access the wrong target vCPU index in the rank
> when updating the irouter.
> 
> Fixes: 5d495f4349b5 ("xen/arm: vgic: Optimize the way to store the target vCPU in the rank")
> Signed-off-by: Hongda Deng <Hongda.Deng@arm.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

This will also want to be backported. I will add it in my queue.


> ---

For future series, please provide a changelog for every version.

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
>   
>       new_vcpu = vgic_v3_irouter_to_vcpu(d, irouter);
>       old_vcpu = d->vcpu[read_atomic(&rank->vcpu[offset])];

Cheers,

-- 
Julien Grall

