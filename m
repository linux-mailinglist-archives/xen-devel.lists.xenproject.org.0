Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F27674754
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 00:40:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481386.746231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIeW6-0003pM-R2; Thu, 19 Jan 2023 23:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481386.746231; Thu, 19 Jan 2023 23:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIeW6-0003n2-Nw; Thu, 19 Jan 2023 23:40:22 +0000
Received: by outflank-mailman (input) for mailman id 481386;
 Thu, 19 Jan 2023 23:40:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYO0=5Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIeW5-0003mv-Fl
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 23:40:21 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a28b52e1-9852-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 00:40:20 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A15EEB82789;
 Thu, 19 Jan 2023 23:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61929C433EF;
 Thu, 19 Jan 2023 23:40:17 +0000 (UTC)
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
X-Inumbo-ID: a28b52e1-9852-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674171618;
	bh=d7PWW7qbqJDMQ/ZbDLYBIv/kTvdW978lQBEVNZlTz7Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sO3MhAWAUYvwE+Y2KsXWZX4g+3CNexE+yNB/8OfklVKa4h+A0GWsrGLCSP1so1WFi
	 ws8KbESdIugI8pQvdGfi7JALsDDtd5HLk3F8DRPF/QR1Xuv9tsPyQQGE0s2QBolbKH
	 AFA8R2QtD7wulKXkqBecPK4y5NzR6l0cV1bWim+Fgv+/YcQjAtaWTitnWkT2P0JhLT
	 NjgiP+y3s8mqJuWUCdEqAZD7tv6DFgdQ/2U3Cqlm5qvQWlarJUm6CCskjoKIe2d6+f
	 a+1Cc29sHbLgx8uNLJ2DJhMiV660L49Wi12b02qGYcIhU708fyba59POXb2W+cA28d
	 dKi3vJe9eJi4A==
Date: Thu, 19 Jan 2023 15:40:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v2 07/11] xen/arm: smmu: Use writeq_relaxed_non_atomic()
 for writing to SMMU_CBn_TTBR0
In-Reply-To: <20230117174358.15344-8-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301191540030.731018@ubuntu-linux-20-04-desktop>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com> <20230117174358.15344-8-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
> Refer ARM IHI 0062D.c ID070116 (SMMU 2.0 spec), 17-360, 17.3.9,
> SMMU_CBn_TTBR0 is a 64 bit register. Thus, one can use
> writeq_relaxed_non_atomic() to write to it instead of invoking
> writel_relaxed() twice for lower half and upper half of the register.
> 
> This also helps us as p2maddr is 'paddr_t' (which may be u32 in future).
> Thus, one can assign p2maddr to a 64 bit register and do the bit
> manipulations on it, to generate the value for SMMU_CBn_TTBR0.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from -
> 
> v1 - 1. Extracted the patch from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr".
> Use writeq_relaxed_non_atomic() to write u64 register in a non-atomic
> fashion.
> 
>  xen/drivers/passthrough/arm/smmu.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 0c89cb644e..84b6803b4e 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -500,8 +500,7 @@ enum arm_smmu_s2cr_privcfg {
>  #define ARM_SMMU_CB_SCTLR		0x0
>  #define ARM_SMMU_CB_RESUME		0x8
>  #define ARM_SMMU_CB_TTBCR2		0x10
> -#define ARM_SMMU_CB_TTBR0_LO		0x20
> -#define ARM_SMMU_CB_TTBR0_HI		0x24
> +#define ARM_SMMU_CB_TTBR0		0x20
>  #define ARM_SMMU_CB_TTBCR		0x30
>  #define ARM_SMMU_CB_S1_MAIR0		0x38
>  #define ARM_SMMU_CB_FSR			0x58
> @@ -1084,6 +1083,7 @@ static void arm_smmu_flush_pgtable(struct arm_smmu_device *smmu, void *addr,
>  static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
>  {
>  	u32 reg;
> +	u64 reg64;
>  	bool stage1;
>  	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
> @@ -1178,12 +1178,13 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
>  	dev_notice(smmu->dev, "d%u: p2maddr 0x%"PRIpaddr"\n",
>  		   smmu_domain->cfg.domain->domain_id, p2maddr);
>  
> -	reg = (p2maddr & ((1ULL << 32) - 1));
> -	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_LO);
> -	reg = (p2maddr >> 32);
> +	reg64 = p2maddr;
> +
>  	if (stage1)
> -		reg |= ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_ASID_SHIFT;
> -	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_HI);
> +		reg64 |= (((uint64_t) (ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_ASID_SHIFT))
> +		         << 32);
> +
> +	writeq_relaxed_non_atomic(reg64, cb_base + ARM_SMMU_CB_TTBR0);
>  
>  	/*
>  	 * TTBCR
> -- 
> 2.17.1
> 

