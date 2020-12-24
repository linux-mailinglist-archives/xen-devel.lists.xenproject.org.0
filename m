Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C802E28BF
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 20:49:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58802.103626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksWau-0003O7-4x; Thu, 24 Dec 2020 19:48:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58802.103626; Thu, 24 Dec 2020 19:48:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksWau-0003Ni-1I; Thu, 24 Dec 2020 19:48:16 +0000
Received: by outflank-mailman (input) for mailman id 58802;
 Thu, 24 Dec 2020 19:48:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/7aL=F4=knorrie.org=hans@srs-us1.protection.inumbo.net>)
 id 1ksWar-0003Nd-TG
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 19:48:13 +0000
Received: from syrinx.knorrie.org (unknown [2001:888:2177::4d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23c22b4a-5727-4279-91d4-7032c08aaffb;
 Thu, 24 Dec 2020 19:48:12 +0000 (UTC)
Received: from [IPv6:2a02:a213:2b81:e600::12] (unknown
 [IPv6:2a02:a213:2b81:e600::12])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by syrinx.knorrie.org (Postfix) with ESMTPSA id 09F6160B8E77E;
 Thu, 24 Dec 2020 20:48:11 +0100 (CET)
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
X-Inumbo-ID: 23c22b4a-5727-4279-91d4-7032c08aaffb
Subject: Re: [PATCH] xen/iommu: smmu: Use 1UL << 31 rather than 1 << 31
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201224152419.22453-1-julien@xen.org>
From: Hans van Kranenburg <hans@knorrie.org>
Message-ID: <617a8755-1993-d46d-d1bf-2f518b5d4233@knorrie.org>
Date: Thu, 24 Dec 2020 20:48:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201224152419.22453-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/24/20 4:24 PM, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Replace all the use of 1 << 31 with 1UL << 31 to prevent undefined
> behavior in the SMMU driver.

You're replacing it by 1U, not 1UL, in the patch below.

Hans

> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/drivers/passthrough/arm/smmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index ed04d85e05e9..3e8aa378669b 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -405,7 +405,7 @@ static struct iommu_group *iommu_group_get(struct device *dev)
>  #define ID0_NUMSMRG_SHIFT		0
>  #define ID0_NUMSMRG_MASK		0xff
>  
> -#define ID1_PAGESIZE			(1 << 31)
> +#define ID1_PAGESIZE			(1U << 31)
>  #define ID1_NUMPAGENDXB_SHIFT		28
>  #define ID1_NUMPAGENDXB_MASK		7
>  #define ID1_NUMS2CB_SHIFT		16
> @@ -438,7 +438,7 @@ static struct iommu_group *iommu_group_get(struct device *dev)
>  
>  /* Stream mapping registers */
>  #define ARM_SMMU_GR0_SMR(n)		(0x800 + ((n) << 2))
> -#define SMR_VALID			(1 << 31)
> +#define SMR_VALID			(1U << 31)
>  #define SMR_MASK_SHIFT			16
>  #define SMR_MASK_MASK			0x7fff
>  #define SMR_ID_SHIFT			0
> @@ -506,7 +506,7 @@ static struct iommu_group *iommu_group_get(struct device *dev)
>  #define RESUME_RETRY			(0 << 0)
>  #define RESUME_TERMINATE		(1 << 0)
>  
> -#define TTBCR_EAE			(1 << 31)
> +#define TTBCR_EAE			(1U << 31)
>  
>  #define TTBCR_PASIZE_SHIFT		16
>  #define TTBCR_PASIZE_MASK		0x7
> @@ -562,7 +562,7 @@ static struct iommu_group *iommu_group_get(struct device *dev)
>  #define MAIR_ATTR_IDX_CACHE		1
>  #define MAIR_ATTR_IDX_DEV		2
>  
> -#define FSR_MULTI			(1 << 31)
> +#define FSR_MULTI			(1U << 31)
>  #define FSR_SS				(1 << 30)
>  #define FSR_UUT				(1 << 8)
>  #define FSR_ASF				(1 << 7)
> 


