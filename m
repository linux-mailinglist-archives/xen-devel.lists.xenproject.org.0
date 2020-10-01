Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C6280B74
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 01:54:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1611.4876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO8NK-0007mb-Sp; Thu, 01 Oct 2020 23:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1611.4876; Thu, 01 Oct 2020 23:52:38 +0000
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
	id 1kO8NK-0007mC-PZ; Thu, 01 Oct 2020 23:52:38 +0000
Received: by outflank-mailman (input) for mailman id 1611;
 Thu, 01 Oct 2020 23:52:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thWI=DI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kO8NI-0007m7-F4
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 23:52:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1cb19832-a094-4723-a08b-824f9fef119c;
 Thu, 01 Oct 2020 23:52:35 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 87E3A20888;
 Thu,  1 Oct 2020 23:52:34 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=thWI=DI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kO8NI-0007m7-F4
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 23:52:36 +0000
X-Inumbo-ID: 1cb19832-a094-4723-a08b-824f9fef119c
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1cb19832-a094-4723-a08b-824f9fef119c;
	Thu, 01 Oct 2020 23:52:35 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 87E3A20888;
	Thu,  1 Oct 2020 23:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601596354;
	bh=IqxFP7AJA3oMC+9OwVQQ7v+lPsVFwhfYf/dialoN8CM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GiWdc6HVhFQrXhMyi079bBR0/aiBDPVVWeIc6Zi/6dp3TXoYkErTMr9lVNRjelFe9
	 7kAxrq88Gvp/+OmGX8S746TTe1y0ahd4giYg/rKk/+F5iHEuzT6fI5HrFevF1jHp70
	 Mrl9t6oI5znwNzILIGPpqnLcrEHa4284por/MNtY=
Date: Thu, 1 Oct 2020 16:52:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
cc: sstabellini@kernel.org, julien@xen.org, xen-devel@lists.xenproject.org, 
    Volodymyr_Babchuk@epam.com, will@kernel.org, diana.craciun@nxp.com, 
    anda-alexandra.dorneanu@nxp.com
Subject: Re: [PATCH] arm,smmu: match start level of page table walk with
 P2M
In-Reply-To: <20200928135157.3170-1-laurentiu.tudor@nxp.com>
Message-ID: <alpine.DEB.2.21.2010011647020.10908@sstabellini-ThinkPad-T480s>
References: <20200928135157.3170-1-laurentiu.tudor@nxp.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Sep 2020, laurentiu.tudor@nxp.com wrote:
> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> Don't hardcode the lookup start level of the page table walk to 1
> and instead match the one used in P2M. This should fix scenarios
> involving SMMU where the start level is different than 1.
> 
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

Thank you for the patch, I think it is correct, except that smmu.c today
can be enabled even on arm32 builds, where p2m_root_level would be
uninitialized.

We need to initialize p2m_root_level at the beginning of
setup_virt_paging under the #ifdef CONFIG_ARM_32. We can statically
initialize it to 1 in that case. Or...


> ---
>  xen/arch/arm/p2m.c                 | 2 +-
>  xen/drivers/passthrough/arm/smmu.c | 2 +-
>  xen/include/asm-arm/p2m.h          | 1 +
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index ce59f2b503..0181b09dc0 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -18,7 +18,6 @@
>  
>  #ifdef CONFIG_ARM_64
>  static unsigned int __read_mostly p2m_root_order;
> -static unsigned int __read_mostly p2m_root_level;
>  #define P2M_ROOT_ORDER    p2m_root_order
>  #define P2M_ROOT_LEVEL p2m_root_level
>  static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
> @@ -39,6 +38,7 @@ static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>   * restricted by external entity (e.g. IOMMU).
>   */
>  unsigned int __read_mostly p2m_ipa_bits = 64;
> +unsigned int __read_mostly p2m_root_level;

... we could p2m_root_level = 1; here


>  /* Helpers to lookup the properties of each level */
>  static const paddr_t level_masks[] =
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 94662a8501..85709a136f 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -1152,7 +1152,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
>  	      (TTBCR_RGN_WBWA << TTBCR_IRGN0_SHIFT);
>  
>  	if (!stage1)
> -		reg |= (TTBCR_SL0_LVL_1 << TTBCR_SL0_SHIFT);
> +		reg |= (2 - p2m_root_level) << TTBCR_SL0_SHIFT;
>  
>  	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBCR);
>  
> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
> index 5fdb6e8183..97b5eada2b 100644
> --- a/xen/include/asm-arm/p2m.h
> +++ b/xen/include/asm-arm/p2m.h
> @@ -12,6 +12,7 @@
>  
>  /* Holds the bit size of IPAs in p2m tables.  */
>  extern unsigned int p2m_ipa_bits;
> +extern unsigned int p2m_root_level;
>  
>  struct domain;
>  
> -- 
> 2.17.1
> 

