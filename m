Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE0128101F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 11:51:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1788.5472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHic-0000RM-MM; Fri, 02 Oct 2020 09:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1788.5472; Fri, 02 Oct 2020 09:51:14 +0000
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
	id 1kOHic-0000Qx-Iy; Fri, 02 Oct 2020 09:51:14 +0000
Received: by outflank-mailman (input) for mailman id 1788;
 Fri, 02 Oct 2020 09:51:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r7zU=DJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kOHib-0000Qr-O0
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:51:13 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59d77d83-cbb6-4197-a2fd-21bfb9d08e86;
 Fri, 02 Oct 2020 09:51:12 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kOHia-0003Un-0R; Fri, 02 Oct 2020 09:51:12 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kOHiZ-0000XF-Or; Fri, 02 Oct 2020 09:51:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=r7zU=DJ=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kOHib-0000Qr-O0
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:51:13 +0000
X-Inumbo-ID: 59d77d83-cbb6-4197-a2fd-21bfb9d08e86
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 59d77d83-cbb6-4197-a2fd-21bfb9d08e86;
	Fri, 02 Oct 2020 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=mzDA/S3dz8EW+2wSiGaselJ3IjD2FytsgKUO3naeTfg=; b=yhvS6/lk9H1yA/94pdJPoaM+Qk
	l2dJpvB+n2IP7JRzyhAbtdFYmJnzlXAut0Gf7dq3yJWEHmxHy6V1wNpyk2+ndp8lMsZWChbUn3XCp
	P4qJ/YnVVeSasnarqu5m0y93AiarNeaCJVudSXC4+4oM8ONrfUOcRUl84MpjCvOtCuMY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kOHia-0003Un-0R; Fri, 02 Oct 2020 09:51:12 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kOHiZ-0000XF-Or; Fri, 02 Oct 2020 09:51:11 +0000
Subject: Re: [PATCH v2] arm,smmu: match start level of page table walk with
 P2M
To: laurentiu.tudor@nxp.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com, will@kernel.org
Cc: diana.craciun@nxp.com, anda-alexandra.dorneanu@nxp.com
References: <20201002094737.9803-1-laurentiu.tudor@nxp.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b5bd3263-42fd-27a3-ebdc-2ae2b5b72f3a@xen.org>
Date: Fri, 2 Oct 2020 10:51:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201002094737.9803-1-laurentiu.tudor@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 02/10/2020 10:47, laurentiu.tudor@nxp.com wrote:
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
> ---
> Changes in v2:
>   - made smmu driver compile on arm32
> 
>   xen/arch/arm/p2m.c                 |  7 +------
>   xen/drivers/passthrough/arm/smmu.c |  2 +-
>   xen/include/asm-arm/p2m.h          | 10 ++++++++++
>   3 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index ce59f2b503..bb75f12486 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -18,16 +18,10 @@
>   
>   #ifdef CONFIG_ARM_64
>   static unsigned int __read_mostly p2m_root_order;
> -static unsigned int __read_mostly p2m_root_level;
> -#define P2M_ROOT_ORDER    p2m_root_order
> -#define P2M_ROOT_LEVEL p2m_root_level
>   static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>   /* VMID is by default 8 bit width on AArch64 */
>   #define MAX_VMID       max_vmid
>   #else
> -/* First level P2M is always 2 consecutive pages */
> -#define P2M_ROOT_LEVEL 1
> -#define P2M_ROOT_ORDER    1
>   /* VMID is always 8 bit width on AArch32 */
>   #define MAX_VMID        MAX_VMID_8_BIT
>   #endif
> @@ -39,6 +33,7 @@ static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>    * restricted by external entity (e.g. IOMMU).
>    */
>   unsigned int __read_mostly p2m_ipa_bits = 64;
> +unsigned int __read_mostly p2m_root_level;

This wants to stay in the #ifdef CONFIG_ARM_64 above and...

>   
>   /* Helpers to lookup the properties of each level */
>   static const paddr_t level_masks[] =
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 94662a8501..4ba6d3ab94 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -1152,7 +1152,7 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
>   	      (TTBCR_RGN_WBWA << TTBCR_IRGN0_SHIFT);
>   
>   	if (!stage1)
> -		reg |= (TTBCR_SL0_LVL_1 << TTBCR_SL0_SHIFT);
> +		reg |= (2 - P2M_ROOT_LEVEL) << TTBCR_SL0_SHIFT;
>   
>   	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBCR);
>   
> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
> index 5fdb6e8183..ab02b36a03 100644
> --- a/xen/include/asm-arm/p2m.h
> +++ b/xen/include/asm-arm/p2m.h
> @@ -12,6 +12,16 @@
>   
>   /* Holds the bit size of IPAs in p2m tables.  */
>   extern unsigned int p2m_ipa_bits;
> +extern unsigned int p2m_root_level;

... this wants to be in part of the #ifdef below.

> +
> +#ifdef CONFIG_ARM_64
> +#define P2M_ROOT_ORDER    p2m_root_order

As you move the define here, you should also move p2m_root_order.

> +#define P2M_ROOT_LEVEL p2m_root_level
> +#else
> +/* First level P2M is always 2 consecutive pages */
> +#define P2M_ROOT_ORDER    1
> +#define P2M_ROOT_LEVEL 1
> +#endif
>   
>   struct domain;

Cheers,

-- 
Julien Grall

