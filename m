Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 700ED281924
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 19:25:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2279.6796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOOoD-0000s0-OK; Fri, 02 Oct 2020 17:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2279.6796; Fri, 02 Oct 2020 17:25:29 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOOoD-0000rb-Kv; Fri, 02 Oct 2020 17:25:29 +0000
Received: by outflank-mailman (input) for mailman id 2279;
 Fri, 02 Oct 2020 17:25:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uixu=DJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kOOoD-0000rW-0D
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 17:25:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f52e129c-f4cd-48e4-9e33-325491c69d40;
 Fri, 02 Oct 2020 17:25:27 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF06820679;
 Fri,  2 Oct 2020 17:25:26 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=uixu=DJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kOOoD-0000rW-0D
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 17:25:29 +0000
X-Inumbo-ID: f52e129c-f4cd-48e4-9e33-325491c69d40
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f52e129c-f4cd-48e4-9e33-325491c69d40;
	Fri, 02 Oct 2020 17:25:27 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EF06820679;
	Fri,  2 Oct 2020 17:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601659527;
	bh=Jld5reVxu3BbDu07KuraQqLBn984l1q0gk9XV7HZc1g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=w2oRU3vOC2ZWubOmM+c7H0qCU+yygAMcwmaen0/NbpYcVQeD9Dvg/AuUpPLxwO4h8
	 UuFAQny41NrQhAKaXQO4kptWBRSafll6Rr8e0gQJcgMQIu9BM/kRmAnCo0Oala3nsC
	 fXHMd0vbgiYBIY/3W0Xulg53LhAqsKL5UxWfnrcc=
Date: Fri, 2 Oct 2020 10:25:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
cc: sstabellini@kernel.org, julien@xen.org, xen-devel@lists.xenproject.org, 
    Volodymyr_Babchuk@epam.com, will@kernel.org, diana.craciun@nxp.com, 
    anda-alexandra.dorneanu@nxp.com
Subject: Re: [PATCH v3] arm,smmu: match start level of page table walk with
 P2M
In-Reply-To: <20201002103344.13015-1-laurentiu.tudor@nxp.com>
Message-ID: <alpine.DEB.2.21.2010021025170.10908@sstabellini-ThinkPad-T480s>
References: <20201002103344.13015-1-laurentiu.tudor@nxp.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 Oct 2020, laurentiu.tudor@nxp.com wrote:
> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> Don't hardcode the lookup start level of the page table walk to 1
> and instead match the one used in P2M. This should fix scenarios
> involving SMMU where the start level is different than 1.
> In order for the SMMU driver to also compile on arm32 move the
> P2M_ROOT_LEVEL in the p2m header file (while at it, for
> consistency also P2M_ROOT_ORDER) and use the macro in the smmu
> driver.
> 
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> Changes in v3:
>  - also export 'p2m_root_order'
>  - moved variables in their rightful #ifdef block
> 
> Changes in v2:
>  - made smmu driver compile on arm32
> 
>  xen/arch/arm/p2m.c                 |  9 ++-------
>  xen/drivers/passthrough/arm/smmu.c |  2 +-
>  xen/include/asm-arm/p2m.h          | 11 +++++++++++
>  3 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index ce59f2b503..4eeb867ca1 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -17,17 +17,12 @@
>  #define INVALID_VMID 0 /* VMID 0 is reserved */
>  
>  #ifdef CONFIG_ARM_64
> -static unsigned int __read_mostly p2m_root_order;
> -static unsigned int __read_mostly p2m_root_level;
> -#define P2M_ROOT_ORDER    p2m_root_order
> -#define P2M_ROOT_LEVEL p2m_root_level
> +unsigned int __read_mostly p2m_root_order;
> +unsigned int __read_mostly p2m_root_level;
>  static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>  /* VMID is by default 8 bit width on AArch64 */
>  #define MAX_VMID       max_vmid
>  #else
> -/* First level P2M is always 2 consecutive pages */
> -#define P2M_ROOT_LEVEL 1
> -#define P2M_ROOT_ORDER    1
>  /* VMID is always 8 bit width on AArch32 */
>  #define MAX_VMID        MAX_VMID_8_BIT
>  #endif
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 94662a8501..4ba6d3ab94 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -1152,7 +1152,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
>  	      (TTBCR_RGN_WBWA << TTBCR_IRGN0_SHIFT);
>  
>  	if (!stage1)
> -		reg |= (TTBCR_SL0_LVL_1 << TTBCR_SL0_SHIFT);
> +		reg |= (2 - P2M_ROOT_LEVEL) << TTBCR_SL0_SHIFT;
>  
>  	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBCR);
>  
> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
> index 5fdb6e8183..28ca9a838e 100644
> --- a/xen/include/asm-arm/p2m.h
> +++ b/xen/include/asm-arm/p2m.h
> @@ -13,6 +13,17 @@
>  /* Holds the bit size of IPAs in p2m tables.  */
>  extern unsigned int p2m_ipa_bits;
>  
> +#ifdef CONFIG_ARM_64
> +extern unsigned int p2m_root_order;
> +extern unsigned int p2m_root_level;
> +#define P2M_ROOT_ORDER    p2m_root_order
> +#define P2M_ROOT_LEVEL p2m_root_level
> +#else
> +/* First level P2M is always 2 consecutive pages */
> +#define P2M_ROOT_ORDER    1
> +#define P2M_ROOT_LEVEL 1
> +#endif
> +
>  struct domain;
>  
>  extern void memory_type_changed(struct domain *);
> -- 
> 2.17.1
> 

